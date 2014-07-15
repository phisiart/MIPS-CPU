`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:30:31 07/14/2014
// Design Name:   Pipeline_Core
// Module Name:   /home/sean/Dropbox/CPU/CPU/Pipeline/ISE/Pipeline/test_Pipeline_Core.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_Core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Pipeline_Core;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] switch;
	reg [7:0] UART_RXD;
	reg TX_STATUS;
	reg RX_EFF;

	// Outputs
	wire [7:0] led;
	wire [11:0] digits;
	wire [7:0] UART_TXD;
	wire TX_EN;
	wire RX_READ;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_Core uut (
		.clk(clk), 
		.reset(reset), 
		.led(led), 
		.switch(switch), 
		.digits(digits), 
		.UART_TXD(UART_TXD), 
		.UART_RXD(UART_RXD), 
		.TX_STATUS(TX_STATUS), 
		.RX_EFF(RX_EFF), 
		.TX_EN(TX_EN), 
		.RX_READ(RX_READ)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		switch = 0;
		UART_RXD = 0;
		TX_STATUS = 0;
		RX_EFF = 0;

		// Wait 100 ns for global reset to finish
		#100000;
      reset = 1;
		// Add stimulus here
		//#200000 `pause;
		
		#1000000;
		TX_STATUS = 0;
	end
	
	always #100000 clk = ~clk;
      
endmodule

