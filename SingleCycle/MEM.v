module MEM(
    input wire reset,
    input wire sysclk,
    input wire clk,
    input wire MemRd,
    input wire MemWr,
    input wire[31:0] ALUOut,
    input wire[31:0] DataBusB,
    input wire[1:0] MemToReg,
    input wire[31:0] NewPC,

    input wire UART_RX,
    input wire[7:0] switch,

    output wire[31:0] ReadData,
    output reg[31:0] WriteData, // To Regfile

    output wire UART_TX,
    output wire[7:0] LED,
    output wire[11:0] digits,
    output wire interrupt,
    output wire read_acc,
    output wire write_acc

);

    wire[7:0] UART_TXD;
    wire RX_READ;
    wire TX_EN;
    wire[7:0] UART_RXD;
    wire TX_STATUS;
    wire RX_EFF;

    DataMem datamem(
        .clk(clk),
        .reset(reset),
        .read(MemRd),
        .write(MemWr),
        .addr(ALUOut),
        .rdata(ReadData),
        .wdata(DataBusB),
        .led(LED),
        .switch(switch),
        .digits(digits),
        .UART_TXD(UART_TXD),
        .UART_RXD(UART_RXD),
        .TX_STATUS(TX_STATUS),
        .RX_EFF(RX_EFF),
        .TX_EN(TX_EN),
        .RX_READ(RX_READ),
        .interrupt(interrupt),
        .read_acc(read_acc),
        .write_acc(write_acc)
    );

    UART uart(
        .UART_RX(UART_RX),
        .UART_TX(UART_TX),
        .UART_RXD(UART_RXD),
        .UART_TXD(UART_TXD),
        .RX_EFF(RX_EFF),
        .RX_READ(RX_READ),
        .TX_STATUS(TX_STATUS),
        .TX_EN(TX_EN),
        .sysclk(sysclk),
        .reset(reset)
    );

    // WriteData to reg
    parameter MEMTOREG_ALU  = 2'b00;
    parameter MEMTOREG_LOAD = 2'b01;
    parameter MEMTOREG_PC   = 2'b10;
    always @(*) begin
        case (MemToReg)
        MEMTOREG_ALU:  WriteData = ALUOut;
        MEMTOREG_LOAD: WriteData = ReadData;
        MEMTOREG_PC:   WriteData = NewPC;
        endcase
    end

endmodule