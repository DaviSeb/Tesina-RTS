/*
 * planificadora.h
 *
 *      Author: Tesina RTS
 */
#include "mbed.h"

#ifndef PLANIFICADORA_H_
#define PLANIFICADORA_H_

// Estructura de Control de cada Tarea
typedef struct TaskControlBlock{
  osThreadId_t idTarea; //identificacion del hilo de la tarea
  uint64_t id; // identificador para traza
  uint64_t n_instancias; // numero de instancias de ejecucion en total
  uint64_t periodo; // periodo de trabajo
  uint64_t instant_arribo; // tiempo exacto arribo para ejecucion
  uint64_t prox_arribo; // proximo arribo para su ejecucion
  uint32_t estado; // bandera de comprobacion de ejecucion de la tarea
  uint32_t vencimiento; // vencimiento de la tarea
  uint32_t t_ejecucionWCT; // tiempo de ejecucion absoluto
  uint32_t c_desalojo; // cantidad de desalojos de procesamiento que tiene la tarea

  uint64_t tiempoI;
  uint64_t tiempoF;

} tcb_t;

// Funcion de configuracion inicial de la tarea
void setupTask(TaskControlBlock *tcb);
//void ejecutarPlanificadora(listaDeTareas);
void create_task(Thread& tx, void (*f_task) (void *), uint64_t idTareaTraza, uint64_t t_ejecucion, uint64_t periodo, uint64_t vencimiento);

// Funcion que cambia el estado a terminado de cada tarea
void terminarInstancia(TaskControlBlock *tcb);

// Funcion para configurar estructura de la traza
int configurarTraza(uint64_t nroInstancia, uint64_t cantTareas);

// Funcion para configurar estructura de la traza
int configurarTablaCiclos(uint64_t cantInstancias, uint64_t cantTareas);

// Funcion que almacena inicio ejecucion en la estructura de la traza
void trazaInicio(uint64_t tick, TaskControlBlock *tcb);
// Funcion que almacena fin de ejecucion dentro de estructura de la traza
void trazaFin(uint64_t tick, TaskControlBlock *tcb);
// Funcion que registra tick de inicio ejecucion de la tarea
void registrarInicio(uint64_t tick, TaskControlBlock *TCB);
// Funcion que registra tick de fin de la ejecucion de la tarea
void registrarFin(uint64_t tick, TaskControlBlock *TCB);

// Inicio Planificadora
osStatus startPlanificadora(void);

#endif /* PLANIFICADORA_H_ */
