module cpu_tx_sram(
    input clk,                       
    input reset,                     
    input start_tx,                  
    input [31:0] base,               
    input [31:0] size,               
    output reg tx_ready,             
    output reg tx_data_valid,        
    output reg [31:0] tx_data,       
    input tx_ack,                    
    
    // SRAM 연결
    output reg [9:0] sram_addr,      
    input [31:0] sram_data_out       
);

// 내부 상태
reg [31:0] current_addr;             
reg [31:0] bytes_left;               
reg tx_active;                       

// 상태 초기화
always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_ready <= 1'b1;            
        tx_data_valid <= 1'b0;       
        tx_active <= 1'b0;           
        current_addr <= 32'b0;       
        bytes_left <= 32'b0;         
        sram_addr <= 10'b0;          
    end else if (start_tx && tx_ready) begin
        // TX 통신 시작
        tx_ready <= 1'b0;            
        tx_active <= 1'b1;           
        current_addr <= base;        
        bytes_left <= size;          
    end else if (tx_active && bytes_left > 0) begin
        // TX 동작 중
        if (tx_ack) begin
            tx_data_valid <= 1'b0;   
            current_addr <= current_addr + 4;
            bytes_left <= bytes_left - 1;    
        end else if (!tx_data_valid) begin
            sram_addr <= current_addr[11:2]; 
            tx_data <= sram_data_out;        
            tx_data_valid <= 1'b1;           
        end
    end else if (bytes_left == 0) begin
        tx_ready <= 1'b1;           
        tx_active <= 1'b0;          
        tx_data_valid <= 1'b0;       
    end
end

endmodule
