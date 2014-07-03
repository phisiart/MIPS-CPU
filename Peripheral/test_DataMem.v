`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:11 07/03/2014
// Design Name:   DataMem
// Module Name:   /opt/Xilinx/14.7/ISE_DS/CPU/test_DataMem.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_DataMem;

	// Inputs
	reg clk;
	reg reset;
	reg read;
	reg write;
	reg [31:0] addr;
	reg [31:0] wdata;
	reg [7:0] switch;
	reg [7:0] UART_RXD;
	reg RX_EFF;
	reg TX_STATUS;

	// Outputs
	wire [31:0] rdata;
	wire [7:0] led;
	wire [11:0] digits;
	wire [7:0] UART_TXD;
	wire interrupt;
	wire read_acc;
	wire write_acc;
	wire TX_EN;
	wire RX_READ;

	// Instantiate the Unit Under Test (UUT)
	DataMem uut (
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
		clk = 0;
		reset = 0;
		read = 0;
		write = 0;
		wdata = 0;
		switch = 0;
		UART_RXD = 0;
		TX_STATUS = 1'b1;
		RX_EFF = 1'b0;
		addr = 32'h00000000;

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
		wdata = 32'h000000cc;
		addr = 32'h00000000;
		write = 1'b1;
		
		#200000;
		addr = 32'h00000000;
		write = 1'b0;
		read = 1'b1;
		
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

