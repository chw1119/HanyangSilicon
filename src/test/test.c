
#include "./../include/asm_intrinsic.h"

__attribute__((naked)) void naked_test();

__attribute__((naked)) void naked_test(){

}

int main()
{
    naked_test();
}