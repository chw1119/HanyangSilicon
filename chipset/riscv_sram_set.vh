module hy_riscv_sram_set(
    input clk,
    input reset,
    input is_memory_out,
    

    input reg [31:0] ram_index,
    input reg [31:0] value_change,

    output reg [31:0] output_value
)


always @(posedge clk or posedge reset) begin
    
    if(reset)begin

    end else if(is_memory_out) begin
        integer temp = ram_index
        

    end

end

endmodule