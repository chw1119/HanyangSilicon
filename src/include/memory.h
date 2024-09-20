#ifndef __HY_MEMORY__ 
#define __HY_MEMORY__

// 00001000 -- boot ROM, provided by qemu
// 02000000 -- CLINT
// 0C000000 -- PLIC
// 10000000 -- uart0 
// 10001000 -- virtio disk 
// 80000000 -- boot ROM jumps here in machine mode


#define UART0_IRQ   10
#define VIRTIO0_IRQ 1

#define ENTRY_ADDRESS           0x00000000
#define UART0                   0x10000000
#define PLIC                    0x0c000000
#define VIRTIO0                 0x10001000

#define PLIC_PRIORITY           (PLIC + 0x0)
#define PLIC_PENDING            (PLIC + 0x1000)
#define PLIC_SENABLE(hart)      (PLIC + 0x2080 + (hart)*0x100)
#define PLIC_SPRIORITY(hart)    (PLIC + 0x201000 + (hart)*0x2000)
#define PLIC_SCLAIM(hart)       (PLIC + 0x201004 + (hart)*0x2000)


#define KERNBASE 0x80000000
#define PHYSTOP (KERNBASE + 8 * 1024)



#endif