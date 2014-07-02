`timescale 1ns / 1ps

// RAM Module
// Created by Zhengrong Wang
// Created 02/07/2014
// Last Modified 02/07/2014

module DataMem(
    input clk,
    input reset,
    input read,
    input write,
    output [31:0] rdata,
    input [31:0] wdata,
    output [7:0] led,
    input [7:0] switch,
    output [11:0] digits,
    output [7:0] UART_TXD,
    input [7:0] UART_RXD,
    output interrupt,
	 output reg read_acc,
	 output reg write_acc
    );

reg [31:0] rdata;
wire [31:0] peripheral_rdata;
wire peripheral_racc;
wire peripheral_wacc;
Peripheral peripheral_inst(
	.reset(resest),
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
	.read_acc(peripheral_racc),
	.write_acc(peripheral_wacc),
	.interrupt(interrput)
	);
	
	parameter RAM_SIZE = 256;
	integer i;
	reg [31:0] RAM_DATA[RAM_SIZE-1:0];
	
	wire [1:0] addr_lower;
	wire [11:2] addr_word_align;	// word align addr
	wire [31:12] addr_upper;
	
	assign addr_lower = addr[1:0];
	assign addr_word_align = addr[11:2];
	assign addr_upper = addr[31:12];
	
	always @(*) begin
		read_acc = 1'b0;
		rdata = 32'hcccccccc;
		
		// check if the address is word aligned
		if (addr_lower == 2'b00) begin
			case(addr_upper)
			20'b0: begin
				if (addr_word_align < RAM_SIZE) begin
					rdata = RAM_DATA[addr_word_align];
					read_acc = 1'b1;
				end
			end
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
	
	always @(posedge clk or negedge reset) begin
		if (~reset) begin
			for(i = 1; i < RAM_SIZE; i = i+1) begin
				RAM_DATA[i] <= 32'h0;
			end
		end
		else begin
			write_acc = 1'b0;
			if (addr_lower == 2'b00) begin
				case(addr_upper)
				20'b0: begin
					if (addr_word_align < RAM_SIZE) begin
						RAM_DATA[addr_word_align] <= wdata;
						write_acc <= 1'b1;
					end
				end
				20'b0100_0000_0000_0000_0000: begin
					write_acc <= peripheral_wacc;
				end
				endcase
			end
		end
	end
endmodule
