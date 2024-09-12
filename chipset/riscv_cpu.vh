module riscv_cpu(
    input clk,
    input reset,
    input push_ops,
    input [31:0] opcode,            // 입력 명령어

    // Outputs
    output reg [31:0] alu_result,    // ALU 결과
    output reg branch_taken          // 분기 여부 (B타입 명령어에서 사용)
);

// 내부 신호들
wire [4:0] rd, rs1, rs2;
wire [2:0] funct3;
wire [6:0] funct7, opcode_out;
wire [11:0] imm;
wire [3:0] opcode_type;             // 명령어 타입 (R, I, S, B, U, J)
wire [31:0] operand1, operand2;
wire [31:0] alu_out;
wire zero_flag;

// SRAM 관련 신호
reg [31:0] sram_data_in;
wire [31:0] sram_data_out;
reg [9:0] sram_addr;
reg sram_we;

// 레지스터 파일 (임시 레지스터 저장소, 간단히 표현)
reg [31:0] registers [0:31];

// 디코더 모듈 인스턴스
riscv_decode_core decoder(
    .clk(clk),
    .reset(reset),
    .push_ops(push_ops),
    .opcode(opcode),
    .opcode_out(opcode_out),
    .register_destination(rd),
    .register_source_1(rs1),
    .register_source_2(rs2),
    .funct3(funct3),
    .funct7(funct7),
    .imm(imm)
);

// ALU 모듈 인스턴스
riscv_alu alu_unit(
    .operand1(operand1),             // 첫 번째 피연산자
    .operand2(operand2),             // 두 번째 피연산자 (rs2 또는 imm)
    .funct3(funct3),
    .funct7(funct7),
    .opcode(opcode_out),
    .result(alu_out),
    .zero(zero_flag)
);

// 4KB SRAM 모듈 인스턴스
sram_4kb sram_inst(
    .clk(clk),
    .we(sram_we),                    // 쓰기 신호
    .addr(sram_addr),                // 주소
    .data_in(sram_data_in),          // 쓰기 데이터
    .data_out(sram_data_out)         // 읽기 데이터
);

// 피연산자 선택 및 연산 제어
always @(*) begin
    // 기본값 설정
    operand1 = registers[rs1];
    operand2 = registers[rs2]; // 기본적으로 R타입 연산은 두 레지스터 사용

    // opcode_type에 따라 피연산자 및 ALU 동작 설정
    case (opcode_type)
        4'b0001: begin
            // R-타입 명령어: 레지스터 두 개 사용 (rs1, rs2)
            operand1 = registers[rs1];
            operand2 = registers[rs2];
        end

        4'b0010: begin
            // I-타입 명령어: 첫 번째 피연산자는 레지스터(rs1), 두 번째는 즉시 값(imm)
            operand1 = registers[rs1];
            operand2 = imm;  // imm 값을 ALU로 전달
        end

        4'b0011: begin
            // S-타입 명령어: 저장 명령어
            operand1 = registers[rs1];  // 주소 계산을 위해 rs1 사용
            operand2 = imm;  // 즉시 값 사용
        end

        4'b0100: begin
            // B-타입 명령어: 분기 명령어
            operand1 = registers[rs1];
            operand2 = registers[rs2];
        end

        4'b0101: begin
            // U-타입 명령어 (예: LUI, AUIPC): 상위 20비트 사용
            operand1 = imm;  // 20비트 즉시 값 (상위 20비트)
            operand2 = 32'b0;  // 두 번째 피연산자는 필요하지 않음
        end

        4'b0110: begin
            // J-타입 명령어: 점프
            operand1 = 32'b0;  // 점프 시 주소 계산 (임시로 0)
            operand2 = imm;  // 즉시 값 사용 (점프 오프셋)
        end

        default: begin
            operand1 = 32'b0;
            operand2 = 32'b0;
        end
    endcase
end

// SRAM 제어 로직 및 명령어 처리
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // 리셋 처리
        alu_result <= 32'b0;
        branch_taken <= 1'b0;
        sram_we <= 1'b0;             // 초기화 시 쓰기 비활성화
    end else if (push_ops) begin
        // ALU 연산 결과 저장
        alu_result <= alu_out;

        // B-타입 명령어 처리 (분기 여부 결정)
        if (opcode_type == 4'b0100) begin
            branch_taken <= zero_flag;  // zero_flag가 참이면 분기 발생
        end else begin
            branch_taken <= 1'b0;
        end

        // R-타입이나 I-타입 명령어의 경우 결과를 레지스터에 저장
        if (opcode_type == 4'b0001 || opcode_type == 4'b0010) begin
            registers[rd] <= alu_out;
        end

        // S-타입 명령어 처리 (스토어 명령어)
        if (opcode_type == 4'b0011) begin
            sram_we <= 1'b1;            // 메모리에 쓰기 활성화
            sram_addr <= alu_out[11:2]; // 주소 계산 (바이트 주소를 워드 주소로 변환)
            sram_data_in <= registers[rs2]; // rs2의 값을 메모리에 저장
        end else begin
            sram_we <= 1'b0;
        end

        // I-타입 명령어 처리 (로드 명령어)
        if (opcode_type == 4'b0010 && opcode_out == 7'b0000011) begin
            sram_we <= 1'b0;            // 메모리에서 읽기
            sram_addr <= alu_out[11:2]; // 주소 계산 (바이트 주소를 워드 주소로 변환)
            registers[rd] <= sram_data_out;  // 읽은 값을 레지스터에 저장
        end
    end
end

endmodule
