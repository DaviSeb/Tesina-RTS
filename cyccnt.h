/*
 * cyccnt.h
 *
 *      Author: Tesina RTS
 */

#ifndef CYCCNT_H_
#define CYCCNT_H_


/* Timing:
 * http://stackoverflow.com/questions/13379220/generating-nano-second-delay-in-c
 * http://stackoverflow.com/questions/11530593/cycle-counter-on-arm-cortex-m4-or-m3
 * http://www.microbuilder.eu/Projects/LPC1343ReferenceDesign/DWTBenchmarking.aspx
 * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0337h/BIIFBHIF.html
 */

/* Addresses of registers in the Cortex-M debug hardware. */
#define DWT_CYCCNT      ( *( ( unsigned long * ) 0xE0001004 ) )
#define DWT_CONTROL     ( *( ( unsigned long * ) 0xE0001000 ) )
#define SCB_DEMCR       ( *( ( unsigned long * ) 0xE000EDFC ) )
#define TRCENA_BIT      ( 0x01000000UL )
#define COUNTER_ENABLE_BIT  ( 0x01UL )
#define CPU_CYCLES          DWT_CYCCNT

#define STOPWATCH_RESET()               \
{                           \
  /* Enable Trace System (TRCENA) */          \
  SCB_DEMCR = SCB_DEMCR | TRCENA_BIT;         \
  /* Reset counter. */                \
  DWT_CYCCNT = 0;                   \
  /* Enable counter. */               \
  DWT_CONTROL = DWT_CONTROL | COUNTER_ENABLE_BIT;   \
}


#endif /* CYCCNT_H_ */
