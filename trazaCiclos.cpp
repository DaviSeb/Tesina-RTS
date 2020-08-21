/*
 * Codigo de registro de ciclos de la planificadora
 */
#include "trazaCiclos.h"

static uint32_t numeroTareas, numeroInstancias, maximoColumnas= 0;

static uint32_t maximoNumeroEltos= 0; // Cantidad absoluta de elementos de la matriz de traza

static uint32_t contadorActualEltos= 0; // Contador actual de elementos de la matriz

// Variable de control para registro de contador de instancia en la planificadora
static bool trace= false;

// Variable global de acceso a matriz de traza
static unsigned long **tablaCiclos;


// Funcion para configurar estructura de la traza
int configurarTablaCiclos(uint64_t cantInstancias, uint64_t cantTareas){
//  matriz = (eltoTraza **) malloc(sizeof(eltoTraza)*nroInstancia*cantTareas);

  // Variable global que activa el registro del contador de instancias en la planificadora
  trace= true;

  numeroTareas= cantTareas; // Cantidad de Tareas en el sistema
  numeroInstancias= cantInstancias; // Cantidad de instancias a registrar
  maximoColumnas= numeroInstancias; // Cantidad maxima de columnas para matriz traza (elementos: tiempo inicio ejecucion, tiempo fin ejecucion)

  maximoNumeroEltos= numeroTareas * numeroInstancias; // Contador total de instancias de todas las tareas del sistema


  uint64_t valor= numeroTareas * sizeof(unsigned long *);
  tablaCiclos = (unsigned long **) malloc(valor);
  if(tablaCiclos == NULL){
      printf("Filas Tareas (*) configurarTablaCiclos: error malloc.\n\r");
      exit(1);
  }

  for(uint64_t i= 0; i < numeroInstancias; i++ ){
      tablaCiclos[i]= (unsigned long *) malloc(numeroInstancias * sizeof(unsigned long));
      if(tablaCiclos[i] == NULL){
            printf("Columnas Instancias (*) configurarTablaCiclos: error malloc.\n\r");
            exit(1);
      }
  }

  for(uint64_t f=0; f < numeroTareas; f++)
    for(uint64_t c=0; c < numeroInstancias; c++){
        tablaCiclos[f][c]= 0;
    }

  return 0;
}

/*
// Imprime la traza de ejecucion de las tareas
void imprimirTablaCiclos(void){
  printf("\n\rTABLA DE CICLOS DE TRABAJO PLANIFICADORA PARA CADA TAREA.\n\r");
  for(uint32_t f=0; f < numeroTareas; f++){
      printf("\n\rTarea %d:", (int)f+1);
      for(uint32_t c=0; c < numeroInstancias; c++){
        //indice= (f * 10) + c;
        printf(" < %d >", (int)tablaCiclos[f][c]);
      }
      printf("\n\r");
  }
}
*/

// Imprime la traza de ejecucion de las tareas
void imprimirTablaCiclos(void){
  printf("TABLA DE CICLOS DE TRABAJO PLANIFICADORA PARA CADA TAREA,\n\r");
  for(uint32_t f=0; f < numeroTareas; f++){
      printf("Tarea %d,", (int)f+1);
      for(uint32_t c=0; c < numeroInstancias; c++){
        //indice= (f * 10) + c;
        printf("%d,", (int)tablaCiclos[f][c]);
      }
      printf("\n\r");
  }
}

// Funcion que informa fin de almacenamiento en matriz de traza
bool trazaCiclosTerminada(void){
  if(contadorActualEltos >= maximoNumeroEltos){
      return true;
  }
  else
    return false;
}

// regresa maximo limite de columnas para la matriz de traza de ciclos
uint32_t getLimitColumn(void){
  return maximoColumnas;
}

// Funcion que informa si activa opcion de registro de traza
bool registrarTrazaCiclos(void){
  return trace;
}

// Funcion que retorna referencia a la matriz de ciclos
unsigned long **getTablaCiclos(void){
  return tablaCiclos;
}

// Funcion para contar los elementos de la matriz de traza
void contarElto(void){
  contadorActualEltos++;
}
