`timescale 1ns / 1ps

// TESTBENCH 2 for UART
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

module test_UART_2;

	// Inputs
	reg UART_RX;
	reg [7:0] UART_TXD;
	reg RX_READ;
	reg TX_EN;
	reg sysclk;
	reg reset;

	// Outputs
	wire UART_TX;
	wire [7:0] UART_RXD;
	wire RX_EFF;
	wire TX_STATUS;

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

	initial begin
		// Initialize Inputs
		UART_RX = 1;
		UART_TXD = 0;
		RX_READ = 0;
		TX_EN = 0;
		sysclk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#1000000;
      reset = 0;
		// Add stimulus here
		
		#1000000;
      reset = 1;
        
		

	end
	
	always #5 sysclk = ~sysclk;
      
endmodule
