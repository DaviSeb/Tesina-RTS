/*
 * trazaCiclos.h
 *
 *  Created on: 27 may. 2019
 *      Author: Tesina RTS
 */

#ifndef TRAZACICLOS_H_
#define TRAZACICLOS_H_

#include "mbed.h"
#include "planificadora.h"

// Funcion para configurar estructura de la traza
int configurarTablaCiclos(uint64_t cantInstancias, uint64_t cantTareas);

// Funcion que retorna el valor limite de las columnas de la matriz de ciclos
uint32_t getLimitColumn(void);

// Imprime la traza de ejecucion de las tareas
void imprimirTablaCiclos(void);

// Funcion que informa fin de almacenamiento en matriz de traza
bool trazaCiclosTerminada(void);

// Funcion que informa si activa opcion de registro de traza
bool registrarTrazaCiclos(void);

// Funcion que retorna referencia a la matriz de ciclos
unsigned long **getTablaCiclos(void);

// Funcion para contar los elementos de la matriz de traza
void contarElto(void);

#endif /* TRAZACICLOS_H_ */
