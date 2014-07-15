`timescale 1ns / 1ps

module Contrl_Mux2(
	input iCtrl,
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
    input EXTOp,
    input LUOp,
    output [2:0] oPCSrc,
    output [1:0] oRegDst,
    output oRegWr,
    output oALUSrc1,
    output oALUSrc2,
    output [5:0] oALUFun,
    output oSign,
    output oMemWr,
    output oMemRd,
    output [1:0] oMemToReg,
    output oEXTOp,
    output oLUOp
	);

assign oPCSrc 		= ((iCtrl == 1'b1) ? 3'b0 : PCSrc);
assign oRegDst 		= ((iCtrl == 1'b1) ? 2'b0 : RegDst);
assign oRegWr 		= ((iCtrl == 1'b1) ? 1'b0 : RegWr);
assign oALUSrc1 	= ((iCtrl == 1'b1) ? 1'b0 : ALUSrc1);
assign oALUSrc2 	= ((iCtrl == 1'b1) ? 1'b0 : ALUSrc2);
assign oALUFun 		= ((iCtrl == 1'b1) ? 6'b0 : ALUFun);
assign oSign 		= ((iCtrl == 1'b1) ? 1'b0 : Sign);
assign oMemWr 		= ((iCtrl == 1'b1) ? 1'b0 : MemWr);
assign oMemToReg 	= ((iCtrl == 1'b1) ? 2'b0 : MemToReg);
assign oEXTOp 		= ((iCtrl == 1'b1) ? 1'b0 : EXTOp);
assign oLUOp 		= ((iCtrl == 1'b1) ? 1'b0 : LUOp);

endmodule