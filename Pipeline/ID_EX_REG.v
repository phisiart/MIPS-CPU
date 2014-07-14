`timescale 1ns / 1ps

module ID_EX_REG(
	input clk,
	input reset,
	input flush,
	input [2:0] PCSrc,
    input [1:0] RegDst,
    input RegWr,
    input ALUSrc1,
    input ALUSrc2,
    input [5:0] ALUFun,
    input Sign,
    input MemWr,
    input MemRd,
    input [1:0] MemToReg,
    input [31:0] Extend,
    input [31:0] ALUSrc2_ELSE,
    input [4:0] Rs,
    input [4:0] Rt,
    input [4:0] Rd,
    input [4:0] Shamt,
    input [31:0] ReadData1,
    input [31:0] ReadData2,
    input [31:0] NextPC,
	output reg [2:0] oPCSrc,
    output reg [1:0] oRegDst,
    output reg oRegWr,
    output reg oALUSrc1,
    output reg oALUSrc2,
    output reg [5:0] oALUFun,
    output reg oSign,
    output reg oMemWr,
    output reg oMemRd,
    output reg [1:0] oMemToReg,
    output reg [31:0] oExtend,
    output reg [31:0] oALUSrc2_ELSE,
    output reg [4:0] oRs,
    output reg [4:0] oRt,
    output reg [4:0] oRd,
    output reg [4:0] oShamt,
    output reg [31:0] oReadData1,
    output reg [31:0] oReadData2,
    output reg [31:0] oNextPC
    );

always @(posedge clk or negedge reset) begin
	if ((~reset) || (~flush)) begin
		oPCSrc <= 3'b000;
	    oRegDst <= 2'b00;
	    oRegWr <= 1'b0;
	    oALUSrc1 <= 1'b0;
	    oALUSrc2 <= 1'b0;
	    oALUFun <= 6'b000000;
	    oSign <= 1'b0;
	    oMemWr <= 1'b0;
	    oMemRd <= 1'b0;
	    oMemToReg <= 2'b00;
	    oExtend <= 32'h0;
	    oALUSrc2_ELSE <= 32'h0;
	    oRs <= 5'h00;
	    oRt <= 5'h00;
	    oRd <= 5'h00;
	    oShamt <= 5'h00;
	    oReadData1 <= 32'h0;
	    oReadData2 <= 32'h0;
	    oNextPC <= 32'h0;
	end
	else begin
		oPCSrc <= PCSrc;
	    oRegDst <= RegDst;
	    oRegWr <= RegWr;
	    oALUSrc1 <= ALUSrc1;
	    oALUSrc2 <= ALUSrc2;
	    oALUFun <= ALUFun;
	    oSign <= Sign;
	    oMemWr <= MemWr;
	    oMemRd <= MemRd;
	    oMemToReg <= MemToReg;
	    oExtend <= Extend;
	    oALUSrc2_ELSE <= ALUSrc2_ELSE;
	    oRs <= Rs;
	    oRt <= Rt;
	    oRd <= Rd;
	    oShamt <= Shamt;
	    oReadData1 <= ReadData1;
	    oReadData2 <= ReadData2;
	    oNextPC <= NextPC;
	end
end
endmodule
