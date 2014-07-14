`timescale 1ns / 1ps

// ZHENGRONG WANG
// Created 11/07/2014
// Last Modified 11/07/2014

module Hazard_Detection_Unit(
	input ID_EX_MemRd,
	input [4:0] ID_EX_Rt,
	input [4:0] IF_ID_Rs,
	input [4:0] IF_ID_Rt,
	output reg PCWrite, 
	output reg IF_ID_WRITE,
	output reg Ctrl_MUX
    );

always @(*) begin
	if (ID_EX_MemRd == 1'b1 && 
		(ID_EX_Rt == IF_ID_Rs || ID_EX_Rt == IF_ID_Rt)) begin
		PCWrite = 1'b0;
		IF_ID_WRITE = 1'b0;
		Ctrl_MUX = 1'b1;
	end
	else begin
		PCWrite = 1'b1;
		IF_ID_WRITE = 1'b1;
		Ctrl_MUX = 1'b0;
	end
end

endmodule
