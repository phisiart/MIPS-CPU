`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:07 07/03/2014
// Design Name:   UART_Receiver
// Module Name:   /opt/Xilinx/14.7/ISE_DS/CPU/test_UART_Receiver.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_Receiver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_UART_Receiver;

	// Inputs
	reg UART_RX;
	reg sysclk;
	wire brclk;
	reg reset;
	
	UART_Baud_Rate_Generator UBRG(sysclk, reset, brclk);

	// Outputs
	wire RX_STATUS;
	wire [7:0] RX_DATA;

	// Instantiate the Unit Under Test (UUT)
	UART_Receiver uut (
		.UART_RX(UART_RX), 
		.sysclk(sysclk), 
		.brclk(brclk), 
		.reset(reset), 
		.RX_STATUS(RX_STATUS), 
		.RX_DATA(RX_DATA)
	);

initial begin
		// Initialize Inputs
		UART_RX = 1;
		sysclk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#10;
		reset = 1;
		
		UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		
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
		
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
		#104166 UART_RX = 1;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 0;
		#104166 UART_RX = 1;
	end
	
	always #5 sysclk = ~sysclk;
      
endmodule

