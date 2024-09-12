module hy_riscv_register_set(
    input reset,
    input set_reg,
    input get_reg,
    input reg [4:0] register_id,
    input reg [31:0] value,

    output reg [31:0] value_out
)

//inner register set x 32
// General-purpose registers in a RISC-V CPU

// x0: Zero register
// Always reads as zero. It is used as a constant zero value in instructions.
reg [31:0] x0;

// x1: Return address register
// Used to store the return address for function calls and jumps.
reg [31:0] x1;

// x2: Stack pointer
// Points to the top of the stack in memory. Used for stack operations.
reg [31:0] x2;

// x3: Global pointer
// Points to the base of the global data area. Used to access global variables.
reg [31:0] x3;

// x4: Thread pointer
// Used to point to thread-local storage (TLS) or other per-thread data.
reg [31:0] x4;

// x5: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x5;

// x6: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x6;

// x7: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x7;

// x8: Saved register (s0/fp)
// Used to save the value of a register across function calls. Often used as a frame pointer.
reg [31:0] x8;

// x9: Saved register (s1)
// Used to save the value of a register across function calls.
reg [31:0] x9;

// x10: Argument register (a0)
// Holds function arguments and return values. Also known as a0 in the ABI.
reg [31:0] x10;

// x11: Argument register (a1)
// Holds function arguments and return values. Also known as a1 in the ABI.
reg [31:0] x11;

// x12: Argument register (a2)
// Holds function arguments and return values. Also known as a2 in the ABI.
reg [31:0] x12;

// x13: Argument register (a3)
// Holds function arguments and return values. Also known as a3 in the ABI.
reg [31:0] x13;

// x14: Argument register (a4)
// Holds function arguments and return values. Also known as a4 in the ABI.
reg [31:0] x14;

// x15: Argument register (a5)
// Holds function arguments and return values. Also known as a5 in the ABI.
reg [31:0] x15;

// x16: Argument register (a6)
// Holds function arguments and return values. Also known as a6 in the ABI.
reg [31:0] x16;

// x17: Argument register (a7)
// Holds function arguments and return values. Also known as a7 in the ABI.
reg [31:0] x17;

// x18: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x18;

// x19: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x19;

// x20: Saved register (s2)
// Used to save the value of a register across function calls.
reg [31:0] x20;

// x21: Saved register (s3)
// Used to save the value of a register across function calls.
reg [31:0] x21;

// x22: Saved register (s4)
// Used to save the value of a register across function calls.
reg [31:0] x22;

// x23: Saved register (s5)
// Used to save the value of a register across function calls.
reg [31:0] x23;

// x24: Saved register (s6)
// Used to save the value of a register across function calls.
reg [31:0] x24;

// x25: Saved register (s7)
// Used to save the value of a register across function calls.
reg [31:0] x25;

// x26: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x26;

// x27: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x27;

// x28: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x28;

// x29: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x29;

// x30: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x30;

// x31: Temporary register
// Temporarily holds values during computation or function calls.
reg [31:0] x31;

always @(posedge set or posedge reset) begin
    if (reset) begin
        // Initialize all registers to 0 on reset
        x0  <= 32'd0;
        x1  <= 32'd0;
        x2  <= 32'd0;
        x3  <= 32'd0;
        x4  <= 32'd0;
        x5  <= 32'd0;
        x6  <= 32'd0;
        x7  <= 32'd0;
        x8  <= 32'd0;
        x9  <= 32'd0;
        x10 <= 32'd0;
        x11 <= 32'd0;
        x12 <= 32'd0;
        x13 <= 32'd0;
        x14 <= 32'd0;
        x15 <= 32'd0;
        x16 <= 32'd0;
        x17 <= 32'd0;
        x18 <= 32'd0;
        x19 <= 32'd0;
        x20 <= 32'd0;
        x21 <= 32'd0;
        x22 <= 32'd0;
        x23 <= 32'd0;
        x24 <= 32'd0;
        x25 <= 32'd0;
        x26 <= 32'd0;
        x27 <= 32'd0;
        x28 <= 32'd0;
        x29 <= 32'd0;
        x30 <= 32'd0;
        x31 <= 32'd0;
    end else if (set_reg) begin
        // Set register value
        case (register_id)
            5'd0: x0  <= value; // x0 is always 0, but you might want to handle it
            5'd1: x1  <= value;
            5'd2: x2  <= value;
            5'd3: x3  <= value;
            5'd4: x4  <= value;
            5'd5: x5  <= value;
            5'd6: x6  <= value;
            5'd7: x7  <= value;
            5'd8: x8  <= value;
            5'd9: x9  <= value;
            5'd10: x10 <= value;
            5'd11: x11 <= value;
            5'd12: x12 <= value;
            5'd13: x13 <= value;
            5'd14: x14 <= value;
            5'd15: x15 <= value;
            5'd16: x16 <= value;
            5'd17: x17 <= value;
            5'd18: x18 <= value;
            5'd19: x19 <= value;
            5'd20: x20 <= value;
            5'd21: x21 <= value;
            5'd22: x22 <= value;
            5'd23: x23 <= value;
            5'd24: x24 <= value;
            5'd25: x25 <= value;
            5'd26: x26 <= value;
            5'd27: x27 <= value;
            5'd28: x28 <= value;
            5'd29: x29 <= value;
            5'd30: x30 <= value;
            5'd31: x31 <= value;
        endcase
    end
end

// Get register value
always @(*) begin
    case (register_id)
        5'd0: value_out = x0;
        5'd1: value_out = x1;
        5'd2: value_out = x2;
        5'd3: value_out = x3;
        5'd4: value_out = x4;
        5'd5: value_out = x5;
        5'd6: value_out = x6;
        5'd7: value_out = x7;
        5'd8: value_out = x8;
        5'd9: value_out = x9;
        5'd10: value_out = x10;
        5'd11: value_out = x11;
        5'd12: value_out = x12;
        5'd13: value_out = x13;
        5'd14: value_out = x14;
        5'd15: value_out = x15;
        5'd16: value_out = x16;
        5'd17: value_out = x17;
        5'd18: value_out = x18;
        5'd19: value_out = x19;
        5'd20: value_out = x20;
        5'd21: value_out = x21;
        5'd22: value_out = x22;
        5'd23: value_out = x23;
        5'd24: value_out = x24;
        5'd25: value_out = x25;
        5'd26: value_out = x26;
        5'd27: value_out = x27;
        5'd28: value_out = x28;
        5'd29: value_out = x29;
        5'd30: value_out = x30;
        5'd31: value_out = x31;
        default: value_out = 32'd0; // Default case if register_id is out of range
    endcase
end

endmodule