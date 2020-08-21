/*
 * planificadora.cpp
 *
 *      Author: Tesina RTS
 */
#include "planificadora.h"
#include "listas.h"
#include "trazaCiclos.h"
#include "cyccnt.h"


// Declaracion del Semaforo Binario
Semaphore semaforo(0, 1);

// Estados de cada Tarea
#define TASK_READY 1
#define TASK_RUNNING 2
#define TASK_FINISHED 3



// Valores de ejecucion para registrar
DigitalOut led1(LED1); // LED del Hilo 1

// Declaraciones de los hilos del sistema
Thread t0(osPriorityNormal, 1024);

// Funcion Planificadora
void scheduler(void);
// Funciones de Tareas
void terminarInstancia(TaskControlBlock *tcb);

// Funcion de modificacion del semaforo binario para que s.o despierte planificadora
void setSemaforo(void);

// Inicio Planificadora
osStatus startPlanificadora(void);

// Crear la lista global de Tareas en Estado Finish
node_t *listFuture= NULL;


unsigned long **tablaCiclos= NULL;

// Crea bloque de control de una tarea y los agrega a la lista de futuro eventos
void create_task(Thread& tx, void (*f_task) (void *), uint64_t idTareaTraza, uint64_t t_ejecucion, uint64_t periodo, uint64_t vencimiento){
  /*
   * malloc de tcb
   * asignar parametros de tarea
   * agregar a la lista futuros
   * ejecutar thread start por id
   * */
  tcb_t *tcb= (tcb_t *) malloc(sizeof (tcb_t));

  if(tcb == NULL){
      printf("(*) create_task: malloc error.\n\r");
      exit(1);
  }

  tcb->idTarea= 0;
  tcb->id= idTareaTraza;
  tcb->n_instancias= 0;
  tcb->periodo= periodo;
  tcb->instant_arribo= 0;
  tcb->prox_arribo= 0;
  tcb->estado= TASK_READY;
  tcb->vencimiento= vencimiento;
  tcb->t_ejecucionWCT= t_ejecucion;
  tcb->c_desalojo= 0;
  tcb->tiempoI= 0;
  tcb->tiempoF= 0;

  // Agregar el bloque de control de la nueva tarea a lista de futuros eventos.
  listFuture= agregarTareaALista(listFuture, tcb, 0);

  // Despachar hilo para configuracion inicial
  tx.start(callback(f_task, tcb));
}

uint64_t tickPlanificadora= -1;

bool finTarea= false;

// Tarea Planificadora
void scheduler(void){
  // Configuracion de prioridad de la tarea planificadora.
   t0.set_priority(osPriorityRealtime7);

   tcb_t *tcbSaliente= NULL;
   // Almacena una referencia a la tarea en ejecucion actual.
   tcb_t *runningTask= NULL;

  // Crear la lista de Tareas en Estado Ready
  node_t *listReady= NULL;


   // Bloque Ejecucion de la Planificadora
   while(true){

       semaforo.wait();
       tickPlanificadora= osKernelGetTickCount();

       if(finTarea){
           tcbSaliente= runningTask;
       }


       // Si hay una tarea en ejecucion actualmente.
       if(runningTask != NULL){
           // Si la tarea a finalizado su ejecucion.
           if(runningTask->estado == TASK_FINISHED){
               runningTask->prox_arribo= runningTask->instant_arribo + runningTask->periodo; // Calcula proximo arribo para su ejecucion.

               listFuture= agregarTareaALista(listFuture, runningTask, runningTask->prox_arribo); // agrega la tarea a la lista de Futuros Arribos.
               osThreadSuspend(runningTask->idTarea);
               runningTask= NULL; // asigna referencia a la tarea proxima a ejecutar
               listReady= sacarTareaDeLista(listReady); // saca tarea de la lista Ready
           }
       }

       // Si la lista de futuros eventos tiene tareas
       if(listFuture != NULL){
           // Consulta lista de futuros eventos a planificar si le toca ejecutar
           while(listFuture->prioridad <= tickPlanificadora){
               listFuture->tcb->estado= TASK_READY; // Cambiar estado a Ready.
               listFuture->tcb->instant_arribo= tickPlanificadora;
               listReady= agregarTareaALista(listReady, listFuture->tcb, listFuture->tcb->periodo); // Cargar tarea en lista Ready.
               listFuture= sacarTareaDeLista(listFuture); // Sacar la tarea de la lista de Futuros eventos.
           }
       }

       // Si la lista de Tareas para ejecutar tiene tareas
       if(listReady != NULL){
           if(runningTask != NULL && runningTask != listReady->tcb){
               runningTask->estado= TASK_READY;
               osThreadSuspend(runningTask->idTarea);
           }
           runningTask= listReady->tcb; // apunta a la tarea a ejecutar sea la actual o una nueva
           if(runningTask->estado != TASK_RUNNING){
               runningTask->estado= TASK_RUNNING; // Cambia el estado de la tarea a RUNNING
               osThreadResume(runningTask->idTarea); // Reanudar la tarea para el sistema
           }
       }

       // Solo es para mostrar actividad de planificadora
       if(tickPlanificadora % 100 == 0)
         led1 = !led1;

       if(finTarea){
           // Registro ciclo de cpu actual para planificadora
           tablaCiclos[tcbSaliente->id][tcbSaliente->n_instancias-1]= CPU_CYCLES - tablaCiclos[tcbSaliente->id][tcbSaliente->n_instancias-1];
           finTarea= false;
       }

       // Impresion de la Traza
       if(registrarTrazaCiclos()){
           if(trazaCiclosTerminada()){
               //imprimirTraza();
               //printf("Imprimir Tabla.\n\r");
               imprimirTablaCiclos();
               //exit(0);
               for(;;);
           }
       }

   }

}

// Configuracion inicial de cada tarea. Obtiene id de la tarea
void setupTask(TaskControlBlock *tcb){
  tcb->idTarea= osThreadGetId();
  // Se bloquea el hilo y Espera por siempre cualquier señal
  osSignalWait(0, osWaitForever);
}

// Funcion que cambia el estado a terminado de cada tarea
void terminarInstancia(TaskControlBlock *tcb){
  if(tcb->n_instancias < getLimitColumn()){
      finTarea= true;
      STOPWATCH_RESET(); // Funcion que pone en cero contador de ciclos de CPU.
      // Registro de diferencia de ciclos de cpu para atencion de planificadora
      tablaCiclos[tcb->id][tcb->n_instancias]= CPU_CYCLES;
      // Incrementar contador de instancias para la tarea actualmente finalizada
      tcb->n_instancias++;
      // Funcion para llevar cuenta de cantidad de elementos de la matriz de traza
      contarElto();
  }


  tcb->estado= TASK_FINISHED;
  // Up del Semaforo binario. Usado para sincronizar con la planificadora para despertarla.
  semaforo.release();
}

// Temporizador para ejecutar la planificadora en forma periodica
Ticker flipper;

// Funcion main del sistema
osStatus startPlanificadora(void) {

  tablaCiclos= getTablaCiclos();

  // Configura el temporizador para que en forma periodica cambie el semaforo de la planificadora
  flipper.attach(&setSemaforo, 0.001);
  // Despacha Planificadora
  osStatus estado= t0.start(scheduler);

  return estado;
}

// Funcion que libera el semaforo de la planificadora para que sea despertada por el s.o
void setSemaforo(void){
  semaforo.release();
}

