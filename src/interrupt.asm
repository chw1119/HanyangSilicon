.section .text
.global _start
_start:
    la a0, ivt_table        # Load the address of IVT table into a0
    csrw mtvec, a0          # Set mtvec to the address of the IVT table
    j .                     # Infinite loop to prevent exiting


.section .text
.globl INTERRUPT_0
INTERRUPT_0:
    # Add interrupt handling code here for INT_RESET
    j INTERRUPT_0            # Loop to prevent returning

.globl INTERRUPT_1
INTERRUPT_1:
    # Add interrupt handling code here for INT_RESV1
    j INTERRUPT_1            # Loop to prevent returning

.globl INTERRUPT_2
INTERRUPT_2:
    # Add interrupt handling code here for INT_RESV2
    j INTERRUPT_2            # Loop to prevent returning

.globl INTERRUPT_3
INTERRUPT_3:
    # Add interrupt handling code here for INT_RESV3
    j INTERRUPT_3            # Loop to prevent returning

.globl INTERRUPT_4
INTERRUPT_4:
    # Add interrupt handling code here for INT_RESV4
    j INTERRUPT_4            # Loop to prevent returning

.globl INTERRUPT_5
INTERRUPT_5:
    # Add interrupt handling code here for INT_RESV5
    j INTERRUPT_5            # Loop to prevent returning

.globl INTERRUPT_6
INTERRUPT_6:
    # Add interrupt handling code here for INT_RESV6
    j INTERRUPT_6            # Loop to prevent returning


.section .data
ivt_table:
    .word INTERRUPT_0        # Address for interrupt ID 0
    .word INTERRUPT_1        # Address for interrupt ID 1
    .word INTERRUPT_2        # Address for interrupt ID 2
    .word INTERRUPT_3        # Address for interrupt ID 3
    .word INTERRUPT_4        # Address for interrupt ID 4
    .word INTERRUPT_5        # Address for interrupt ID 5
    .word INTERRUPT_6        # Address for interrupt ID 6
