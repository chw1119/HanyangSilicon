module sram_4kb(
    input clk,                     // 클럭 신호
    input we,                      // 쓰기 활성화 신호 (write enable)
    input [9:0] addr,              // 10비트 주소 (4KB SRAM의 주소 공간: 0~1023)
    input [31:0] data_in,          // 쓰기 데이터 (32비트)
    output reg [31:0] data_out     // 읽기 데이터 (32비트)
);

// 1024 x 32 비트 메모리 배열 선언
reg [31:0] memory_array [0:1023];

always @(posedge clk) begin
    if (we) begin
        // 쓰기 동작: we가 활성화되면 해당 주소에 데이터를 씀
        memory_array[addr] <= data_in;
    end else begin
        // 읽기 동작: we가 비활성화 상태일 때 해당 주소의 데이터를 읽음
        data_out <= memory_array[addr];
    end
end

endmodule
