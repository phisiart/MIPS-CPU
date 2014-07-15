`timescale 1ns / 1ps
module test(
    input reset,
    input sysclk,
    input UART_RX,
    input [7:0] switch,
    output UART_TX,
    output [7:0] LED,
    output [11:0] digits
);
    
    wire interrupt;
    wire read_acc;
    wire write_acc;

    wire pulse_inst;
    wire pulse_alu;
    wire pulse_mem;
    wire pulse_reg;
    assign pulse_inst = 0;
    assign pulse_alu = 0;
    assign pulse_mem = 0;
    assign pulse_reg = 0;

    SingleCycle cpu(
        .reset(reset),
        .sysclk(sysclk),
        .UART_RX(UART_RX),
        .switch(switch),
        .pulse_inst(pulse_inst),
        .pulse_alu(pulse_alu),
        .pulse_mem(pulse_mem),
        .pulse_reg(pulse_reg),
        .UART_TX(UART_TX),
        .LED(LED),
        .digits(digits),
        .interrupt(interrupt),
        .read_acc(read_acc),
        .write_acc(write_acc)
    );

endmodule
