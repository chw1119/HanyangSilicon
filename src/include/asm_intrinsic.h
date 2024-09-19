#ifndef __HY_ASM__
#define __HY_ASM__

#define __NAKED __attribute__((naked))

__NAKED void load_register_A0(int v) {
    __asm__ volatile (
        "mv a0, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a0"
    );
}
    

__NAKED void load_register_A1(int v) {
    __asm__ volatile (
        "mv a1, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a1"
    );
}
    

__NAKED void load_register_A2(int v) {
    __asm__ volatile (
        "mv a2, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a2"
    );
}
    

__NAKED void load_register_A3(int v) {
    __asm__ volatile (
        "mv a3, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a3"
    );
}
    

__NAKED void load_register_A4(int v) {
    __asm__ volatile (
        "mv a4, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a4"
    );
}
    

__NAKED void load_register_A5(int v) {
    __asm__ volatile (
        "mv a5, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a5"
    );
}
    

__NAKED void load_register_A6(int v) {
    __asm__ volatile (
        "mv a6, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a6"
    );
}
    

__NAKED void load_register_A7(int v) {
    __asm__ volatile (
        "mv a7, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a7"
    );
}
    

__NAKED void load_register_A8(int v) {
    __asm__ volatile (
        "mv a8, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a8"
    );
}
    

__NAKED void load_register_A9(int v) {
    __asm__ volatile (
        "mv a9, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a9"
    );
}
    

__NAKED void load_register_A10(int v) {
    __asm__ volatile (
        "mv a10, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a10"
    );
}
    

__NAKED void load_register_A11(int v) {
    __asm__ volatile (
        "mv a11, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a11"
    );
}
    

__NAKED void load_register_A12(int v) {
    __asm__ volatile (
        "mv a12, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a12"
    );
}
    

__NAKED void load_register_A13(int v) {
    __asm__ volatile (
        "mv a13, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a13"
    );
}
    

__NAKED void load_register_A14(int v) {
    __asm__ volatile (
        "mv a14, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a14"
    );
}
    

__NAKED void load_register_A15(int v) {
    __asm__ volatile (
        "mv a15, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a15"
    );
}
    

__NAKED void load_register_A16(int v) {
    __asm__ volatile (
        "mv a16, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a16"
    );
}
    

__NAKED void load_register_A17(int v) {
    __asm__ volatile (
        "mv a17, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a17"
    );
}
    

__NAKED void load_register_A18(int v) {
    __asm__ volatile (
        "mv a18, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a18"
    );
}
    

__NAKED void load_register_A19(int v) {
    __asm__ volatile (
        "mv a19, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a19"
    );
}
    

__NAKED void load_register_A20(int v) {
    __asm__ volatile (
        "mv a20, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a20"
    );
}
    

__NAKED void load_register_A21(int v) {
    __asm__ volatile (
        "mv a21, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a21"
    );
}
    

__NAKED void load_register_A22(int v) {
    __asm__ volatile (
        "mv a22, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a22"
    );
}
    

__NAKED void load_register_A23(int v) {
    __asm__ volatile (
        "mv a23, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a23"
    );
}
    

__NAKED void load_register_A24(int v) {
    __asm__ volatile (
        "mv a24, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a24"
    );
}
    

__NAKED void load_register_A25(int v) {
    __asm__ volatile (
        "mv a25, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a25"
    );
}
    

__NAKED void load_register_A26(int v) {
    __asm__ volatile (
        "mv a26, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a26"
    );
}
    

__NAKED void load_register_A27(int v) {
    __asm__ volatile (
        "mv a27, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a27"
    );
}
    

__NAKED void load_register_A28(int v) {
    __asm__ volatile (
        "mv a28, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a28"
    );
}
    

__NAKED void load_register_A29(int v) {
    __asm__ volatile (
        "mv a29, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a29"
    );
}
    

__NAKED void load_register_A30(int v) {
    __asm__ volatile (
        "mv a30, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a30"
    );
}
    

__NAKED void load_register_A31(int v) {
    __asm__ volatile (
        "mv a31, %0\n"
        "ret\n"
        :
        : "r"(v)       
        : "a31"
    );
}
    
    
#endif