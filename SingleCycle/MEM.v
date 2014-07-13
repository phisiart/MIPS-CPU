module MEM(
    input wire reset,
    input wire clk,
    input wire RegRd,
    input wire RegWr,
    input wire[31:0] ALUOut,
    input wire[31:0] DataBusB,
    input wire[1:0] MemToReg,

    output reg[31:0] WriteData
);
    DataMem datamem(
        .clk(clk),
        .reset(reset),
        .read(RegRd),
        .write(RegWr),
        .addr(ALUOut),
        .rdata,
        .wdata(DataBusB),
        .led,
        .switch,
        .digits,
        .UART_TXD,
        .UART_RXD,
        .TX_STATUS,
        .RX_EFF,
        .TX_EN,
        .RX_READ,
        .interrupt,
        .read_acc,
        .write_acc
    );

    always @(*) begin
        case (MemToReg)
        
        endcase
    end
endmodule