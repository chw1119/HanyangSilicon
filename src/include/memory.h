#ifndef __HY_MEMORY 
#define __HY_MEMORY


#define PRINT_ADDR                          ((char*)0x00008000)
#define PRINT_ADDR_SIZE                     ((char*)0x00001000)
#define PRINT_ADDR_END                      ((char*)PRINT_ADDR + (int)PRINT_ADDR_SIZE)

#define ENTRY_ADDR                          ((char*)0x00010000)
#define INTERRUPT_VECTOR_TABLE_ADDR         ((char*)0)




extern char* CONSOLE_ADDR = (char*)PRINT_ADDR;

#endif