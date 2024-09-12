#define PRINT_ADDR ((char*)0x00008000)
#define PRINT_ADDR_SIZE ((char*)0x00001000)
#define PRINT_ADDR_END ((char*)PRINT_ADDR + (int)PRINT_ADDR_SIZE)

extern char* CONSOLE_ADDR = (char*)PRINT_ADDR;

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
