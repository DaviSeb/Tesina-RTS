/*
 * listas.h
 *
 */

#ifndef LISTAS_H_
#define LISTAS_H_

#include "planificadora.h"

// Nodo de la lista de tareas
typedef struct node {
    TaskControlBlock *tcb;
    uint64_t prioridad;
    struct node * next;
} node_t;

// Prototipos de Funciones
// Funciones de Listas
node_t *agregarTareaALista(node_t *list, tcb_t *tcb, uint64_t prioridad);
node_t *sacarTareaDeLista(node_t *list);

#endif /* LISTAS_H_ */
