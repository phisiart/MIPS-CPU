`timescale 1ns / 1ps

// ZHENGRONG WANG
// Created 11/07/2014
// Last Modified 14/07/2014

module Hazard_Detection_Unit(
	input ID_EX_MemRd,
	input [4:0] ID_EX_Rt,
	input [4:0] IF_ID_Rs,
	input [4:0] IF_ID_Rt,
	input [2:0] ID_PCSrc,
	input [2:0] ID_EX_PCSrc,
	input EX_ALUResult0,
	output reg [2:0] PCWrite, 
	output reg [2:0] IF_ID_WRITE,
	output reg [2:0] IF_ID_Flush,
	output reg [2:0] ID_EX_Flush
    );

always @(*) begin
	if (ID_EX_MemRd == 1'b1 && 
		(ID_EX_Rt == IF_ID_Rs || ID_EX_Rt == IF_ID_Rt)) begin
		PCWrite[0] = 1'b0;
		IF_ID_WRITE[0] = 1'b0;
		ID_EX_Flush[0] = 1'b0;
		IF_ID_Flush[0] = 1'b1;
	end
	else begin
		PCWrite[0] = 1'b1;
		IF_ID_WRITE[0] = 1'b1;
		ID_EX_Flush[0] = 1'b1;
		IF_ID_Flush[0] = 1'b1;
	end
end

always @(*) begin
	if (ID_PCSrc == 3'b010 || 
		ID_PCSrc == 3'b011 || 
		ID_PCSrc == 3'b100 ||
		ID_PCSrc == 3'b101) begin
		PCWrite[1] = 1'b1;
		IF_ID_WRITE[1] = 1'b1;
		ID_EX_Flush[1] = 1'b1;
		IF_ID_Flush[1] = 1'b0;
	end
	else begin
		PCWrite[1] = 1'b1;
		IF_ID_WRITE[1] = 1'b1;
		ID_EX_Flush[1] = 1'b1;
		IF_ID_Flush[1] = 1'b1;
	end
end

always @(*) begin
	if (ID_EX_PCSrc == 3'b001 && 
		EX_ALUResult0 == 1'b1) begin
		PCWrite[1] = 1'b1;
		IF_ID_WRITE[1] = 1'b1;
		ID_EX_Flush[1] = 1'b0;
		IF_ID_Flush[1] = 1'b0;
	end
	else begin
		PCWrite[1] = 1'b1;
		IF_ID_WRITE[1] = 1'b1;
		ID_EX_Flush[1] = 1'b1;
		IF_ID_Flush[1] = 1'b1;
	end
end

endmodule
