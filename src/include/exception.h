#ifndef __HY_INTERRUPT
#define __HY_INTERRUPT

#include "stdint.h"
#include "memory.h"
#include "csr.h"

#define REG_RA                         1
#define REG_SP                         2
#define REG_ARG0                       10
#define REG_RET                        REG_ARG0
#define NUM_GP_REG                     32
#define NUM_CSR_REG                    3

///////////////////exception Field///////////////////

#define CAUSE_MISALIGNED_FETCH         0
#define CAUSE_FAULT_FETCH              1
#define CAUSE_ILLEGAL_INSTRUCTION      2
#define CAUSE_BREAKPOINT               3
#define CAUSE_MISALIGNED_LOAD          4
#define CAUSE_FAULT_LOAD               5
#define CAUSE_MISALIGNED_STORE         6
#define CAUSE_FAULT_STORE              7
#define CAUSE_ECALL_U                  8
#define CAUSE_ECALL_S                  9
#define CAUSE_ECALL_M                  11
#define CAUSE_PAGE_FAULT_INST          12
#define CAUSE_PAGE_FAULT_LOAD          13
#define CAUSE_PAGE_FAULT_STORE         15
#define CAUSE_INTERRUPT                (1 << 31)
#define CAUSE_MAX_EXC                  (CAUSE_PAGE_FAULT_STORE + 1)


///////////////////Type Field///////////////////
struct irq_context
{
    uint32_t pc;
    uint32_t status;
    uint32_t cause;
    uint32_t reg[NUM_GP_REG];
};

typedef struct irq_context *(*fp_exception)(struct irq_context *ctx);
typedef struct irq_context *(*fp_irq)(struct irq_context *ctx);
typedef struct irq_context *(*fp_syscall)(struct irq_context *ctx);

struct irq_context*  exception_handler(struct irq_context* ctx);
void                 exception_set_irq_handler(fp_irq irq_handler);
void                 exception_set_syscall_handler(fp_syscall syscall_handler);
void                 exception_set_handler(int cause, fp_exception handler);
extern void          _exit(int arg);



#endif
