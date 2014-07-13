`timescale 1ns / 1ps

// UART_BAUD_RATE_GENERATOR Module
// Divide the 100MHz system clock into 9600*16Hz clock
// Created by Zhengrong Wang
// Created 02/07/2014
// Last modified 04/07/2014

module UART_Baud_Rate_Generator(
    input sysclk,
	 input reset,
    output brclk
    );

	reg [8:0] 	state;
	reg			clkout_reg;
	assign brclk = clkout_reg;
	
	always @(posedge sysclk or negedge reset) begin
		if (!reset) begin
			state <= 9'h000;
			clkout_reg <= 0;
		end
		else if (state == 9'h145) begin
			state <= 9'h000;
			clkout_reg <= ~clkout_reg;
		end
		else begin
			state <= state + 9'h001;
		end
	end

endmodule
