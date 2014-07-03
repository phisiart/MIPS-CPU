`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:54 07/03/2014
// Design Name:   UART_Sender
// Module Name:   /opt/Xilinx/14.7/ISE_DS/CPU/test_UART_Sender.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_Sender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_UART_Sender;

	// Inputs
	reg sysclk;
	wire brclk;
	UART_Baud_Rate_Generator UBRG(sysclk, reset, brclk);
	reg reset;
	reg [7:0] TX_DATA;
	reg TX_EN;

	// Outputs
	wire UART_TX;
	wire TX_STATUS;

	// Instantiate the Unit Under Test (UUT)
	UART_Sender uut (
		.sysclk(sysclk), 
		.brclk(brclk), 
		.reset(reset), 
		.TX_DATA(TX_DATA), 
		.TX_EN(TX_EN), 
		.UART_TX(UART_TX), 
		.TX_STATUS(TX_STATUS)
	);

	initial begin
		// Initialize Inputs
		sysclk = 0;
		reset = 0;
		TX_DATA = 0;
		TX_EN = 0;

		#200000;
      reset = 1;
		// Add stimulus here
		TX_DATA = 8'b01001010;
		#100000;
		TX_EN = 1;
		#10 TX_EN = 0;
		
		#2000000;
		TX_DATA = 8'b01001010;
		TX_EN = 1;
		#10 TX_EN = 0;
	end
	
	always #5 sysclk = ~sysclk;
      
endmodule
