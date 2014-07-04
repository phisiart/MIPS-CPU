`timescale 1ns / 1ps

// TESTBENCH for UART
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

module test_UART;

	// Inputs
	reg UART_RX;
	wire [7:0] UART_TXD;
	reg sysclk;
	reg reset;

	// Outputs
	wire UART_TX;
	wire [7:0] UART_RXD;
	wire RX_EFF;
	wire TX_STATUS;
	wire RX_READ;

	// Instantiate the Unit Under Test (UUT)
	UART uut (
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
	reg [31:0] wdata;
	reg [31:0] addr;
	reg [7:0] switch;

	// Outputs
	wire [31:0] rdata;
	wire [7:0] led;
	wire [11:0] digits;
	wire interrupt;
	wire read_acc;
	wire write_acc;
	wire TX_EN;
	
	DataMem uu (
		.clk(clk), 
		.reset(reset), 
		.read(read), 
		.write(write), 
		.addr(addr),
		.rdata(rdata), 
		.wdata(wdata), 
		.led(led), 
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

	initial begin
		// Initialize Inputs
		UART_RX = 1;
		sysclk = 0;
		clk = 0;
		reset = 1;
		addr = 32'h0;
		
		read = 0;
		write = 0;
		wdata = 0;
		switch = 0;

		#100000;
      reset = 0;
		// Add stimulus here
		
		#100000;
      reset = 1;
		#200000;
		wdata = 32'h00000055;
		addr = 32'h40000018;
		write = 1'b1;
		
		#200;
		wdata = 32'h000000cc;
		addr = 32'h00000000;
		write = 1'b1;
		
		#200;
		addr = 32'h00000000;
		write = 1'b0;
		read = 1'b1;
		
		#200;
		wdata = 32'h1;
		addr = 32'h40000020;
		write = 1'b1;
		read = 1'b0;
		
		#200;
		wdata = 32'h0;
		addr = 32'h40000020;
		write = 1'b1;
		
		#200;
		write = 1'b0;
		
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		
		#200;
		addr = 32'h4000001c;
		read = 1'b1;
		
		#200;
		read = 1'b0;
	end
	
	always #100 clk = ~clk;
	always #5 sysclk = ~sysclk;
endmodule
