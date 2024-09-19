module hy_riscv_sram_set(
    input clk,
    input reset,
    input is_memory_out,    // 메모리 읽기/쓰기 선택 신호
    
    input [31:0] ram_index, // 접근할 메모리 인덱스
    input [31:0] value_change, // 저장할 데이터 값
    
    output reg [31:0] output_value // 읽어온 데이터 값
);

reg [31:0] sram [0:1023]; // SRAM 배열 선언

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (int i = 0; i < 1024; i = i + 1) begin
             sram[i] <= 32'b0;
        end
        output_value <= 32'b0;
        
    end else if (is_memory_out) begin
        // 메모리 읽기
        output_value <= sram[ram_index]; // 인덱스 위치의 데이터를 읽어서 출력
    end else begin
        // 메모리 쓰기
        sram[ram_index] <= value_change; // 인덱스 위치에 새로운 값을 저장
    end
end

endmodule
