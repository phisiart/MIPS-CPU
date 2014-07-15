`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:18 07/14/2014
// Design Name:   Pipeline_fpga
// Module Name:   /home/sean/Dropbox/CPU/CPU/Pipeline/ISE/Pipeline/test_Pipeline_fpga.v
// Project Name:  Pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_fpga
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Pipeline_fpga;

	// Inputs
	reg sysclk;
	reg reset;
	reg UART_RX;
	reg [7:0] switch;

	// Outputs
	wire [7:0] leds;
	wire [11:0] digits;
	wire UART_TX;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_fpga uut (
		.sysclk(sysclk), 
		.reset(reset), 
		.UART_RX(UART_RX), 
		.switch(switch), 
		.leds(leds), 
		.digits(digits), 
		.UART_TX(UART_TX)
	);

	initial begin
		// Initialize Inputs
		sysclk = 0;
		reset = 1;
		UART_RX = 1;
		switch = 0;

		// Wait 100 ns for global reset to finish
		#100000;
      	reset = 0;
		// Add stimulus here
		#200000 reset = 1;

		UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		
	end
	
	always #5 sysclk = ~sysclk;
      
endmodule

