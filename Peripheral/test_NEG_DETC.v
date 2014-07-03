`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:38 07/03/2014
// Design Name:   negedge_detc
// Module Name:   /opt/Xilinx/14.7/ISE_DS/CPU/test_NEG_DETC.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: negedge_detc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_NEG_DETC;

	// Inputs
	reg clk;
	reg signal;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	negedge_detc uut (
		.clk(clk), 
		.signal(signal), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		signal = 1;

		// Wait 100 ns for global reset to finish
		#100;
      signal = 0;
		// Add stimulus here

	end
      
	always #5 clk = ~clk;
endmodule

