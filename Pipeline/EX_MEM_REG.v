`timescale 1ns / 1ps

module EX_MEM_REG(
	input clk,
	input reset,
	input [31:0] NextPC,
	input MemWr,
    input MemRd,
    input [2:0] PCSrc,
    input RegWr,
    input [1:0] MemToReg,
    input [31:0] ConBA,
    input [31:0] ALUResult,
    input [31:0] ReadData2,
    input [31:0] RegDst,
    output reg [31:0] oNextPC,
    output reg [2:0] oPCSrc,
    output reg oRegWr,
    output reg oMemWr,
    output reg oMemRd,
    output reg [1:0] oMemToReg,
    output reg [31:0] oConBA,
    output reg [31:0] oALUResult,
    output reg [31:0] oReadData2,
    output reg [31:0] oRegDst
    );

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		oPCSrc <= 3'b000;
		oRegWr <= 1'b0;
		oMemWr <= 1'b0;
		oMemRd <= 1'b0;
		oMemToReg <= 2'b00;
		oConBA <= 32'h80000000;
		oALUResult <= 32'h0;
		oReadData2 <= 32'h0;
		oRegDst <= 32'h0;
		oNextPC <= 32'h0;
	end
	else begin
		oPCSrc <= PCSrc;
		oRegWr <= RegWr;
		oMemWr <= MemWr;
		oMemRd <= MemRd;
		oMemToReg <= MemToReg;
		oConBA <= ConBA;
		oALUResult <= ALUResult;
		oReadData2 <= ReadData2;
		oRegDst <= RegDst;
		oNextPC <= NextPC;
	end
end
endmodule
