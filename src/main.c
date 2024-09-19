#include "include/interrupt.h"
#include "include/console.h"
#include "include/memory.h"


//0x00001000 reset vector
int main()
{
    const char* hello_str = "hello im bootloader";
    print(hello_str);
}