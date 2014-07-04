`timescale 1ns / 1ps

// 16-Divider Module
// Created by Zhengrong Wang
// Created 03/07/2014
// Last modified 04/07/2014

module divider_16(
    input clkin,
    input reset,
    output clkout
    );
	reg [2:0] 	state;
	reg			clkout_reg;
	assign clkout = clkout_reg;
	
	always @(posedge clkin or negedge reset) begin
		if (!reset) begin
			state <= 3'h0;
			clkout_reg <= 0;
		end
		else if (state == 3'h7) begin
			state <= 3'h0;
			clkout_reg <= ~clkout_reg;
		end
		else begin
			state <= state + 3'h1;
		end
	end

endmodule
