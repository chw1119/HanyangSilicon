module riscv_decode_core(
    input clk,
    input reset,
    input push_ops,
    input [31:0] opcode,

    output reg [3:0] opcode_type,        // 명령어 타입 (R, I, S, B, U, J)
    output reg [6:0] opcode_out,         // opcode 필드 출력

    // R-타입
    output reg [4:0] register_destination, // 목적지 레지스터 (rd)
    output reg [4:0] register_source_1,    // 소스 레지스터 1 (rs1)
    output reg [4:0] register_source_2,    // 소스 레지스터 2 (rs2)
    output reg [2:0] funct3,               // funct3 필드
    output reg [6:0] funct7,               // funct7 필드
    output reg [11:0] imm                  // 즉시 값 (I, S, B 타입)
);

// RISC-V 명령어 타입 상수
localparam R_TYPE = 4'b0001;
localparam I_TYPE = 4'b0010;
localparam S_TYPE = 4'b0011;
localparam B_TYPE = 4'b0100;
localparam U_TYPE = 4'b0101;
localparam J_TYPE = 4'b0110;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // 모든 출력 신호 초기화
        opcode_type <= 4'b0;
        opcode_out <= 7'b0;
        register_destination <= 5'b0;
        register_source_1 <= 5'b0;
        register_source_2 <= 5'b0;
        funct3 <= 3'b0;
        funct7 <= 7'b0;
        imm <= 12'b0;
    end else if (push_ops) begin
        opcode_out <= opcode[6:0];

        // opcode에 따라 분기하여 명령어 타입 및 필드 디코딩
        case (opcode[6:0])
            // R-타입 명령어 (예: add, sub 등)
            7'b0110011: begin
                opcode_type <= R_TYPE;
                register_destination <= opcode[11:7];  // 목적지 레지스터 (rd)
                register_source_1 <= opcode[19:15];    // 소스 레지스터 1 (rs1)
                register_source_2 <= opcode[24:20];    // 소스 레지스터 2 (rs2)
                funct3 <= opcode[14:12];               // funct3 필드
                funct7 <= opcode[31:25];               // funct7 필드
            end

            // I-타입 명령어 (예: addi, lw 등)
            7'b0010011, 7'b0000011: begin
                opcode_type <= I_TYPE;
                register_destination <= opcode[11:7];  // 목적지 레지스터 (rd)
                register_source_1 <= opcode[19:15];    // 소스 레지스터 1 (rs1)
                funct3 <= opcode[14:12];               // funct3 필드
                imm <= opcode[31:20];                  // 12비트 즉시 값 (imm)
            end

            // S-타입 명령어 (예: sw)
            7'b0100011: begin
                opcode_type <= S_TYPE;
                register_source_1 <= opcode[19:15];    // 소스 레지스터 1 (rs1)
                register_source_2 <= opcode[24:20];    // 소스 레지스터 2 (rs2)
                funct3 <= opcode[14:12];               // funct3 필드
                imm <= {opcode[31:25], opcode[11:7]};  // 상위 7비트 + 하위 5비트로 구성된 즉시 값
            end

            // B-타입 명령어 (예: beq, bne)
            7'b1100011: begin
                opcode_type <= B_TYPE;
                register_source_1 <= opcode[19:15];    // 소스 레지스터 1 (rs1)
                register_source_2 <= opcode[24:20];    // 소스 레지스터 2 (rs2)
                funct3 <= opcode[14:12];               // funct3 필드
                imm <= {opcode[31], opcode[7], opcode[30:25], opcode[11:8]}; // 분기 즉시 값 (12비트)
            end

            // U-타입 명령어 (예: lui, auipc)
            7'b0110111, 7'b0010111: begin
                opcode_type <= U_TYPE;
                register_destination <= opcode[11:7];  // 목적지 레지스터 (rd)
                imm <= opcode[31:12];                  // 상위 20비트 즉시 값 (imm)
            end

            // J-타입 명령어 (예: jal)
            7'b1101111: begin
                opcode_type <= J_TYPE;
                register_destination <= opcode[11:7];  // 목적지 레지스터 (rd)
                imm <= {opcode[31], opcode[19:12], opcode[20], opcode[30:21]}; // 20비트 즉시 값 (imm)
            end

            default: begin
                // 기타 명령어 또는 미지원 명령어 처리
                opcode_type <= 4'b0000;
                register_destination <= 5'b0;
                register_source_1 <= 5'b0;
                register_source_2 <= 5'b0;
                funct3 <= 3'b0;
                funct7 <= 7'b0;
                imm <= 12'b0;
            end
        endcase
    end
end

endmodule
