`timescale 1ns / 1ps

module MEM_WB_REG(
	input clk,
	input reset,
	input RegWr,
	input [1:0] MemToReg,
	input [31:0] ALUResult,
	input [31:0] ReadData,
	input [31:0] RegDst,
	input [31:0] NextPC,
	output reg oRegWr,
	output reg [31:0] oALUResult,
	output reg [31:0] oReadData,
	output reg [1:0] oMemToReg,
	output reg [31:0] oRegDst,
	output reg [31:0] oNextPC
    );

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		oRegWr <= 1'b0;
		oALUResult <= 32'h0;
		oReadData <= 32'h0;
		oMemToReg <= 2'b00;
		oRegDst <= 32'h0;
		oNextPC <= 32'h0;
	end
	else begin
		oRegWr <= RegWr;
		oALUResult <= ALUResult;
		oReadData <= ReadData;
		oMemToReg <= MemToReg;
		oRegDst <= RegDst;
		oNextPC <= NextPC;
	end
end

endmodule
