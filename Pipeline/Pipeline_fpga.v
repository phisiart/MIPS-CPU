`timescale 1ns / 1ps


module Pipeline_fpga(
	input sysclk,
	input reset,
	input UART_RX,
	input [7:0] switch,
	output [7:0] leds,
	output [11:0] digits,
	output UART_TX
    );

wire [7:0] UART_RXD;
wire [7:0] UART_TXD;
wire RX_EFF;
wire RX_READ;
wire TX_STATUS;
wire TX_EN;

wire [7:0] oled;
assign led = oled;

UART UART_inst (
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

reg clk;
reg read;
reg write;
reg [31:0] addr;
reg [31:0] wdata;

wire interrupt;
wire read_acc;
wire write_acc;
wire [31:0] rdata;

reg [7:0] 	count;
	
always @(posedge sysclk or negedge reset) begin
	if (!reset) begin
		count <= 8'h00;
		clk <= 0;
	end
	else if (count == 8'hff) begin
		count <= 8'h00;
		clk <= ~clk;
	end
	else begin
		count <= count + 8'h1;
	end
end

Pipeline_Core Pipeline_Core_INST(
    .clk(clk),
    .reset(reset),
    .led(leds),
    .switch(switch),
    .digits(digits),
    .UART_TXD(UART_TXD),
    .UART_RXD(UART_RXD),
    .TX_STATUS(TX_STATUS),
    .RX_EFF(RX_EFF),
    .TX_EN(TX_EN),
    .RX_READ(RX_READ)
    );

endmodule
