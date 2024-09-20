#include "./include/def.h"
#include "./include/exception.h"
#include "./include/cstdlib/printf.h"

static fp_irq* irq_handler_now = NULL;
static fp_exception _exception_table[CAUSE_MAX_EXC];

extern void _exit(int arg);


struct irq_context* exception_handler(struct irq_context* ctx)
{
    if(ctx->cause & CAUSE_INTERRUPT)
    {
        if(irq_handler_now)
        {
            return irq_handler_now(ctx);
        }
        else
        {
            __PANIC__
        }
    }
    else
    {
        switch (ctx->cause)
        {
            case CAUSE_ECALL_U:
            case CAUSE_ECALL_S:
            case CAUSE_ECALL_M:
                ctx->pc += 4;
                break;
        }

        if (ctx->cause < CAUSE_MAX_EXC && _exception_table[ctx->cause])
            return exception_table[ctx->cause](ctx);
        else
        {
            __PANIC__
        }
    
    }

}


void exception_set_irq_handler(fp_irq irq_handler)
{
    irq_handler_now = irq_handler;
}   


void exception_set_syscall_handler(fp_syscall syscall_handler)
{
    _exception_table[CAUSE_ECALL_U] = handler;
    _exception_table[CAUSE_ECALL_S] = handler;
    _exception_table[CAUSE_ECALL_M] = handler;
}


void exception_set_handler(int cause, fp_exception handler)
{ 
    _exception_table[cause] = handler;
}

