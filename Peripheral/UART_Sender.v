`timescale 1ns / 1ps

// UART_Sender Module
// Created by Zhengrong Wang
// Created 03/07/2014
// Last Modified 03/07/2014

module UART_Sender(
    input sysclk,
    input baudclk,
    input reset,
    input [7:0] TX_DATA,
    input TX_EN,
    output UART_TX,
    output TX_STATUS
    );

reg [7:0] TX_DATA_REG;
reg [3:0] count;
reg UART_TX_REG;
assign UART_TX = UART_TX_REG;
reg TX_STATUS_REG;
assign TX_STATUS = TX_STATUS_REG;

always @(posedge baudclk or posedge TX_EN) begin
	if (!reset) begin
		TX_DATA_REG <= 8'h00;
		UART_TX_REG <= 1'b1;
		count <= 4'h0;
		TX_STATUS_REG <= 1'b1;
	end
	else if (TX_EN) begin
		TX_DATA_REG <= TX_DATA;
		count <= 4'h1;
	end
	else begin
		case(count)
		4'ha: begin
			count <= 4'hb;
			UART_TX_REG <= 1'b1;
		end
		4'hb: begin
			TX_STATUS_REG <= 1'b1;
			count <= 4'h0;
		end
		4'h1: begin
			UART_TX_REG <= 1'b0;
			count <= 4'h2;
			TX_STATUS_REG <= 1'b0;
		end
		4'h0: begin
		end
		default: begin
			UART_TX_REG <= TX_DATA_REG[0];
			TX_DATA_REG <= TX_DATA_REG >> 1;
			count <= count + 4'h1;
		end
		endcase
	end
end

endmodule
