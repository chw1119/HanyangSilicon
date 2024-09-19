

if __name__ == "__main__":
    mainstr = """
__NAKED void load_register_A0(int v) {
    __asm__ volatile (
        "mv a0, %0\\n"
        "ret\\n"
        :
        : "r"(v)       
        : "a0"
    );
}
    """
    for i in range(32):
        print(mainstr.replace("A0", "A" + str(i)).replace("a0", "a" + str(i)))