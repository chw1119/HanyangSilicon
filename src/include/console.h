#ifndef __HY_CONSOLE
#define __HY_CONSOLE

#include "./memory.h"

#define print(STR)                                      \
do{                                                     \
    int __str_index = 0;                                \
    char* address = CONSOLE_ADDR;                       \
    while (STR[__str_index]) {                          \
        if (address >= PRINT_ADDR_END) {                \
            address = PRINT_ADDR;                       \
        }                                               \
        address[__str_index] = STR[__str_index++];      \
        address++;                                      \
    }                                                   \
    CONSOLE_ADDR = address;                             \
}                                                       \
while(0);


#define clear()                         \
do{                                     \
    char* address = PRINT_ADDR;         \
    while(address != PRINT_ADDR_END) {  \
        *(address++) = 0;               \
    }                                   \
}                                       \
while(1);                               \


#endif
