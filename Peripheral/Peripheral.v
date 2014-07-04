`timescale 1ns / 1ps

// Peripheral Module
// Created by Zhengrong Wang
// Created 02/07/2014
// Last Modified 04/07/2014

module Peripheral(
    input clk,
    input reset,
    input read,
    input write,
    input [31:0] addr,
    input [31:0] wdata,
    output reg [31:0] rdata,
    output reg [7:0] led,
    input [7:0] switch,
    output reg [11:0] digits,
    output reg [7:0] UART_TXD,
    input [7:0] UART_RXD,
	 input TX_STATUS,
	 input RX_EFF,
	 output reg TX_EN,
	 output reg RX_READ,
    output reg read_acc,
    output reg write_acc,
    output interrupt
    );

wire [2:0] UART_CON;
assign UART_CON[2] = TX_STATUS;
assign UART_CON[1] = RX_EFF;
assign UART_CON[0] = TX_EN;
reg [31:0] TH;
reg [31:0] TL;
reg [2:0] TCON;

assign interrupt = TCON[2];

// Read the UART_RXD will trigue an impluse on RX_READ
// to tell UART that the data has been read
always @(*) begin
	read_acc = 1'b1;
	RX_READ = 1'b0;
	if (read == 1'b1) begin
		case(addr)
			32'h40000000: rdata = TH;
			32'h40000004: rdata = TL;
			32'h40000008: rdata = {29'h0, TCON};
			32'h4000000c: rdata = {24'h0, led};
			32'h40000010: rdata = {24'h0, switch};
			32'h40000014: rdata = {20'h0, digits};
			32'h40000018: rdata = {24'h0, UART_TXD};
			32'h4000001c: begin
				rdata = {24'h0, UART_RXD};
				RX_READ = 1'b1;
			end
			32'h40000020: rdata = {29'h0, UART_CON};
			default: begin
				rdata = 32'hcccccccc;
				read_acc = 1'b0;
			end
		endcase
	end
end

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		TH <= 32'h0;
		TL <= 32'hffffffff;
		TCON <= 3'h0;
		led <= 8'h0;
		digits <= 12'h0;
		UART_TXD <= 8'h0;
		TX_EN <= 5'h0;
		write_acc <= 1'b0;
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
				32'h40000020: TX_EN <= wdata[0];
				default: write_acc <= 1'b0;
			endcase
		end
	end
end
endmodule
