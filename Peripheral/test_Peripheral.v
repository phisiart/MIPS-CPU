`timescale 1ns / 1ps

// TESTBENCH for Peripheral Module
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

module test_Peripheral;

	// Inputs
	reg clk;
	reg reset;
	reg read;
	reg write;
	reg [31:0] addr;
	reg [31:0] wdata;
	reg [7:0] switch;
	reg [7:0] UART_RXD;
	reg TX_STATUS;
	reg RX_EFF;

	// Outputs
	wire [31:0] rdata;
	wire [7:0] led;
	wire [11:0] digits;
	wire [7:0] UART_TXD;
	wire TX_EN;
	wire RX_READ;
	wire read_acc;
	wire write_acc;
	wire interrupt;

	// Instantiate the Unit Under Test (UUT)
	Peripheral uut (
		.clk(clk), 
		.reset(reset), 
		.read(read), 
		.write(write), 
		.addr(addr), 
		.wdata(wdata), 
		.rdata(rdata), 
		.led(led), 
		.switch(switch), 
		.digits(digits), 
		.UART_TXD(UART_TXD), 
		.UART_RXD(UART_RXD), 
		.TX_STATUS(TX_STATUS), 
		.RX_EFF(RX_EFF), 
		.TX_EN(TX_EN), 
		.RX_READ(RX_READ), 
		.read_acc(read_acc), 
		.write_acc(write_acc), 
		.interrupt(interrupt)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		read = 0;
		write = 0;
		addr = 0;
		wdata = 0;
		switch = 0;
		UART_RXD = 0;
		TX_STATUS = 0;
		RX_EFF = 0;

		// Wait 100 ns for global reset to finish
		#100000;
      reset = 1;
		// Add stimulus here
		
		#100000;
      reset = 1;
		#200000;
		wdata = 32'h000000cc;
		addr = 32'h40000018;
		write = 1'b1;
		
		#200000;
		wdata = 32'h1;
		addr = 32'h40000020;
		write = 1'b1;
		
		#200000;
		wdata = 32'h0;
		addr = 32'h40000020;
		write = 1'b1;
	end
	
	always #100 clk = ~clk;
      
endmodule
