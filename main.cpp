#include "mbed.h"
// Biblioteca de planificadora
#include "planificadora.h"

//DigitalOut led2(LED2); // LED del Hilo 2
//DigitalOut led3(LED3); // LED del Hilo 3
//DigitalOut led4(LED4); // LED del Hilo 4

// Declaraciones de las tareas del sistema
//Thread planificadora(osPriorityNormal, 1024); // Hilo Planificadora
Thread t1(osPriorityNormal, 512);
Thread t2(osPriorityNormal, 512);
Thread t3(osPriorityNormal, 512);
Thread t4(osPriorityNormal, 512);
Thread t5(osPriorityNormal, 512);

// Prototipos de Funciones de Tareas
//void create_task(Thread& tx, void (*f_task) (void *), uint64_t idTareaTraza, uint64_t t_ejecucion, uint64_t periodo, uint64_t vencimiento);
void test_thread1(void *);
void test_thread2(void *);
void test_thread3(void *);
void test_thread4(void *);
void test_thread5(void *);

// Funcion de Tarea 1
void test_thread1(void *p) {
  uint64_t contTick= 0;
  uint64_t tickActual;

  //led2= 0;
  TaskControlBlock *TCB= (TaskControlBlock *) p;

  setupTask(TCB);

  while (true) {

        //led2= !led2;

        tickActual= osKernelGetTickCount();

        contTick=0;
        while(true){
            if(tickActual < osKernelGetTickCount() )
              ++contTick;
            if(contTick == TCB->t_ejecucionWCT)
                break;
            tickActual= osKernelGetTickCount();
        }

        // Se cambia el estado de la bandera al estado de fin de ejecucion de instancia.
        terminarInstancia(TCB);
    }
}

// Funcion de Tarea 2
void test_thread2(void *p) {
  uint64_t contTick= 0;
  uint64_t tickActual;

  //led3= 0;
  TaskControlBlock *TCB= (TaskControlBlock *) p;

  setupTask(TCB);

  while (true) {

       // led3= !led3;

        tickActual= osKernelGetTickCount();

        contTick= 0;
        while(true){
            if(tickActual < osKernelGetTickCount() )
              ++contTick;
            if(contTick == TCB->t_ejecucionWCT)
                break;
            tickActual= osKernelGetTickCount();
        }

        // Se cambia el estado de la bandera al estado de fin de ejecucion de instancia.
        terminarInstancia(TCB);
    }
}

// Funcion de Tarea 3
void test_thread3(void *p) {
  uint64_t contTick= 0;
  uint64_t tickActual;

  //led4= 0;
  TaskControlBlock *TCB= (TaskControlBlock *) p;

  setupTask(TCB);

  while (true) {

       // led4= !led4;

        tickActual= osKernelGetTickCount();

        contTick= 0;
        while(true){
            if(tickActual < osKernelGetTickCount() )
              ++contTick;
            if(contTick == TCB->t_ejecucionWCT)
                break;
            tickActual= osKernelGetTickCount();
        }

        // Se cambia el estado de la bandera al estado de fin de ejecucion de instancia.
        terminarInstancia(TCB);
    }
}

// Funcion de Tarea 4
void test_thread4(void *p) {
  uint64_t contTick= 0;
  uint64_t tickActual;

// led4= 0;
  TaskControlBlock *TCB= (TaskControlBlock *) p;

  setupTask(TCB);

  while (true) {

        tickActual= osKernelGetTickCount();

        contTick= 0;
        while(true){
            if(tickActual < osKernelGetTickCount() )
              ++contTick;
            if(contTick == TCB->t_ejecucionWCT)
                break;
            tickActual= osKernelGetTickCount();
        }

        // Se cambia el estado de la bandera al estado de fin de ejecucion de instancia.
        terminarInstancia(TCB);
    }
}

// Funcion de Tarea 4
void test_thread5(void *p) {
  uint64_t contTick= 0;
  uint64_t tickActual;

// led4= 0;
  TaskControlBlock *TCB= (TaskControlBlock *) p;

  setupTask(TCB);

  while (true) {

        tickActual= osKernelGetTickCount();

        contTick= 0;
        while(true){
            if(tickActual < osKernelGetTickCount() )
              ++contTick;
            if(contTick == TCB->t_ejecucionWCT)
                break;
            tickActual= osKernelGetTickCount();
        }

        // Se cambia el estado de la bandera al estado de fin de ejecucion de instancia.
        terminarInstancia(TCB);
    }
}

// Funcion main del sistema
int main (void) {
  //Crear las Tareas con sus datos
  //create_task(Thread& tx, void (*f_task) (void *), uint64_t idTareaTraza, uint64_t t_ejecucion, uint64_t periodo, uint64_t vencimiento)
//  create_task(t1, test_thread1, 0, 2*20, 500, 0);
//  create_task(t2, test_thread2, 1, 1*20, 600, 0);
//  create_task(t3, test_thread3, 2, 1*20, 700, 0);
//  create_task(t4, test_thread4, 3, 2*20, 1000, 0);
//  create_task(t5, test_thread5, 4, 2*20, 3000, 0);

  // Crea bloque de control de una tarea y los agrega a la lista de futuro eventos
    create_task(t1, test_thread1, 0, 1*10, 300, 0);
    create_task(t2, test_thread2, 1, 2*20, 350, 0);
    create_task(t3, test_thread3, 2, 3*30, 600, 0);

    if(configurarTablaCiclos(10, 3)){
        printf("Error: configurarTablaCiclos()\r\n");
    }

  // Despachar Planificadora
  startPlanificadora();
}
