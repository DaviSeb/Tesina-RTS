/*
 * listas.cpp
 *
 */
#include "listas.h"

// Prototipos de Funciones
// Funciones de Listas
node_t *newNode(tcb_t *tcb, int prioridad);
node_t *addNodeList(node_t *list, tcb_t *tcb, uint64_t prioridad);
node_t *topNodeList(node_t *list);

// Crear nuevo nodo
node_t *newNode(tcb_t *tcb, int prioridad){
  node_t *newNode;
  newNode= (node_t *) malloc(sizeof (node_t));

  if(newNode == NULL){
      printf("(*) newNode: error malloc.\n\r");
      exit(1);
  }

  newNode->tcb= tcb;
  newNode->prioridad= prioridad;
  newNode->next= NULL;

  return newNode;
}

// Agregar un nodo a la lista en orden
node_t *addNodeList(node_t *list, tcb_t *tcb, uint64_t prioridad){
  // Crea nuevo nodo para la lista con su prioridad
  node_t *nNode= newNode(tcb, prioridad);
  // punteros necesarios para agregar nodo entre nodos
  node_t *before;
  node_t *cursor;
  // Si la lista esta vacia
  if(list == NULL){
      list= nNode;
  }
  else{
      before= NULL;
      cursor= list;
      // Recorrer la lista buscando por prioridad
      while(cursor != NULL && (nNode->prioridad >= cursor->prioridad)){
          before= cursor;
          cursor= cursor->next;
      }
      // Si el nuevo nodo es de menor prioridad que el primero
      if (before == NULL){
          list= nNode;
          nNode->next= cursor;
      }
      else{
          before->next= nNode;
          nNode->next= cursor;
      }
  }
  return list;
}

// Sacar cabeza de la lista
node_t* topNodeList(node_t *list){
  node_t* node;

  // Si la lista tiene un elemento
  if(list->next == NULL){
      free(list);
      list= NULL;
  }
  else{ // Si tiene mas de 1 elemento
      node= list;
      list= list->next;
      free(node);
      }
  return list;
}

// Agregar una Tarea a una Lista
node_t *agregarTareaALista(node_t *list, tcb_t *tcb, uint64_t prioridad){
  node_t *lista= addNodeList(list, tcb, prioridad);
  return lista;
}

// Sacar una Tarea de una Lista
node_t* sacarTareaDeLista(node_t *list){
  node_t* node= topNodeList(list);
  return node;
}

