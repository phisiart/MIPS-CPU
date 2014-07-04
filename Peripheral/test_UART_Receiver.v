`timescale 1ns / 1ps

// TESTBENCH for UART_Receiver
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

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
