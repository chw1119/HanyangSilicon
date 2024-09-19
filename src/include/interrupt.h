#ifndef __HY_INTERRUPT
#define __HY_INTERRUPT

#include "memory.h"

#define __NAKED __attribute__((naked))
// Define interrupt IDs


// Define interrupt handler prototypes
#define SET_INTERRUPT(ID) void __NAKED INTERRUPT_##ID(void)
#define DEF_INTERRUPT(ID) void __NAKED INTERRUPT_##ID(void)

// Declare the interrupt handler functions

SET_INTERRUPT(INT_RESET);
SET_INTERRUPT(INT_RESV1);
SET_INTERRUPT(INT_RESV2);
SET_INTERRUPT(INT_RESV3);
SET_INTERRUPT(INT_RESV4);
SET_INTERRUPT(INT_RESV5);
SET_INTERRUPT(INT_RESV6);

// Define the IVT with function pointers
void (*ivt_table[7])(void)  = {
    INTERRUPT_INT_RESET,
    INTERRUPT_INT_RESV1,
    INTERRUPT_INT_RESV2,
    INTERRUPT_INT_RESV3,
    INTERRUPT_INT_RESV4,
    INTERRUPT_INT_RESV5,
    INTERRUPT_INT_RESV6
};

#endif
