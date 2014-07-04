`timescale 1ns / 1ps

// RAM Module
// Created by Zhengrong Wang
// Created 02/07/2014
// Last Modified 04/07/2014

module DataMem(
    input clk,
    input reset,
    input read,
    input write,
	 input [31:0] addr,
    output reg [31:0] rdata,
    input [31:0] wdata,
    output [7:0] led,
    input [7:0] switch,
    output [11:0] digits,
    output [7:0] UART_TXD,
    input [7:0] UART_RXD,
	 input TX_STATUS,
	 input RX_EFF,
	 output TX_EN,
	 output RX_READ,
    output interrupt,
	 output reg read_acc,
	 output reg write_acc
    );

// the peripheral instance
wire [31:0] peripheral_rdata;
wire peripheral_racc;
wire peripheral_wacc;
Peripheral peripheral_inst(
	.reset(reset),
	.clk(clk),
	.read(read),
	.write(write),
	.addr(addr),
	.wdata(wdata),
	.rdata(peripheral_rdata),
	.led(led),
	.switch(switch),
	.digits(digits),
	.UART_TXD(UART_TXD),
	.UART_RXD(UART_RXD),
	.TX_STATUS(TX_STATUS),
	.RX_EFF(RX_EFF),
	.TX_EN(TX_EN),
	.RX_READ(RX_READ),
	.read_acc(peripheral_racc),
	.write_acc(peripheral_wacc),
	.interrupt(interrupt)
	);
	
	// gloabal size
	parameter RAM_SIZE = 256;
	integer i;
	reg [31:0] RAM_DATA[RAM_SIZE-1:0];
	
	wire [1:0] addr_lower;
	wire [11:2] addr_word_align;	// word align addr
	wire [31:12] addr_upper;
	
	// split the address into three parts
	// addr_lower to check if the address is word aligned, normally it should be 2'b00
	// addr_eff is 10 bits, this is the effect word address, and it can be extended
	// addr_upper is higher bits, used to tell whether data or peripherals should be read

	assign addr_lower = addr[1:0];
	assign addr_eff = addr[11:2];
	assign addr_upper = addr[31:12];
	
	always @(*) begin
		read_acc = 1'b0;
		rdata = 32'hcccccccc;
		
		if (read == 1'b1) begin

			// check if the address is word aligned
			if (addr_lower == 2'b00) begin
				case(addr_upper)

				// read the data
				20'b0: begin
					if (addr_eff < RAM_SIZE) begin
						rdata = RAM_DATA[addr_eff];
						read_acc = 1'b1;
					end
				end

				// read the peripheral
				20'b0100_0000_0000_0000_0000: begin
					read_acc = peripheral_racc;
					if (read_acc) begin
						rdata = peripheral_rdata;
					end
				end
				default: begin
					read_acc = 1'b0;
					rdata = 32'hcccccccc;
				end
				endcase
			end
		end
	end
	
	// to write the RAM
	always @(posedge clk or negedge reset) begin
		if (~reset) begin

			// initialize everything to zero
			// need more update to initialize the RAM with some user-defined data 

			for(i = 1; i < RAM_SIZE; i = i+1) begin
				RAM_DATA[i] <= 32'h0;
			end
			write_acc <= 1'b0;
		end
		else if (write == 1'b1) begin
			write_acc <= 1'b0;

			// check if the address is word aligned
			if (addr_lower == 2'b00) begin
				case(addr_upper)

				// write the data
				20'b0: begin
					if (addr_eff < RAM_SIZE) begin
						RAM_DATA[addr_eff] <= wdata;
						write_acc <= 1'b1;
					end
				end

				// write the peripherals
				20'b0100_0000_0000_0000_0000: begin
					write_acc <= peripheral_wacc;
				end
				endcase
			end
		end
	end
endmodule
