`timescale 1ns / 1ps

// Peripheral Module
// Created by Zhengrong Wang
// Created 02/07/2014
// Last Modified 02/07/2014

module Peripheral(
    input clk,
    input reset,
    input read,
    input write,
    input [31:0] addr,
    input [31:0] wdata,
    output [31:0] rdata,
    output [7:0] led,
    input [7:0] switch,
    output [11:0] digits,
    output [7:0] UART_TXD,
    input [7:0] UART_RXD,
    output read_acc,
    output write_acc,
    output interrupt
    );

reg [7:0] led;
reg [11:0] digits;
reg [7:0] UART_TXD;
reg [4:0] UART_CON;
reg [31:0] TH;
reg [31:0] TL;
reg [2:0] TCON;
reg read_acc;
reg write_acc;

assign interrupt = TCON[2];

always @(*) begin
	read_acc = 1'b1;
	case(addr)
		32'h40000000: rdata = TH;
		32'h40000004: rdata = TL;
		32'h40000008: rdata = {29'h0, TCON};
		32'h4000000c: rdata = {24'h0, led};
		32'h40000010: rdata = {24'h0, switch};
		32'h40000014: rdata = {20'h0, digits};
		32'h40000018: rdata = {24'h0, UART_TXD};
		32'h4000001c: rdata = {24'h0, UART_RXD};
		32'h40000020: begin
			rdata = {27'h0, UART_CON};
			UART_CON = UART_CON & 5'b10011;
		end
		default: begin
			rdata = 32'hcccccccc;
			read_acc = 1'b0;
		end
	endcase
end

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		TH <= 32'h0;
		TL <= 32'hffffffff;
		TCON <= 3'h0;
		led <= 8'h0;
		digits <= 12'h0;
		UART_TXD <= 8'h0;
		UART_RXD <= 8'h0;
		UART_CON <= 5'h0;
	end
	else begin
		if (TCON[0]) begin
			if (TL == 32'hffffffff) begin
				TL <= TH;
				if (TCON[1]) begin
					// give an interrupt
					TCON[2] <= 1'b1;
				end
			end
			else TL <= TL + 32'b1;
		end
		
		if (write) begin
			write_acc <= 1'b1;
			case(addr)
				32'h40000000: TH <= wdata;
				32'h40000004: TL <= wdata;
				32'h40000008: TCON <= wdata[2:0];
				32'h4000000c: led <= wdata[7:0];
				32'h40000014: digits <= wdata[11:0];
				32'h40000018: UART_TXD <= wdata[7:0];
				32'h40000020: UART_CON <= wdata[4:0];
				default: write_acc <= 1'b0;
			endcase
		end
	end
end
endmodule
