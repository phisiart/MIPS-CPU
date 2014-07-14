`timescale 1ns / 1ps

module Forward_Unit(
	input EX_MEM_RegWr,
	input [4:0] EX_MEM_RegDst,
	input [4:0] ID_EX_Rt,
	input [4:0] ID_EX_Rs,
	input [2:0] ID_PCSrc,
	input [4:0] IF_ID_Rd,
	input [4:0] ID_EX_Rd,
	input ID_EX_RegWr,
	input MEM_WB_RegWr,
	input [4:0] MEM_WB_RegDst,
	output reg [1:0] ForwardA,
	output reg [1:0] ForwardB,
	output reg [1:0] ForwardJr
    );

always @(*) begin
	if (EX_MEM_RegWr == 1'b1 && 
		EX_MEM_RegDst != 5'h00 &&
		EX_MEM_RegDst == ID_EX_Rs) begin
		ForwardA = 2'b10;
	end
	else if (MEM_WB_RegWr == 1'b1 &&
			MEM_WB_RegDst != 5'h00 &&
			EX_MEM_RegDst != ID_EX_Rs && 
			MEM_WB_RegDst == ID_EX_Rs) begin
		ForwardA = 2'b01;
	end
	else begin
		ForwardA = 2'b00;
	end
	if (EX_MEM_RegWr == 1'b1 && 
		EX_MEM_RegDst != 5'h00 &&
		EX_MEM_RegDst == ID_EX_Rt) begin
		ForwardB = 2'b10;
	end
	else if (MEM_WB_RegWr == 1'b1 &&
			MEM_WB_RegDst != 5'h00 &&
			EX_MEM_RegDst != ID_EX_Rt && 
			MEM_WB_RegDst == ID_EX_Rt) begin
		ForwardB = 2'b01;
	end
	else begin
		ForwardB = 2'b00;
	end
	if (ID_PCSrc == 3'b011 && IF_ID_Rd == ID_EX_Rd && ID_EX_Rd != 0 && ID_EX_RegWr) begin
		ForwardJr = 2'b01;
	end
	else if (ID_PCSrc == 3'b011 && 
			IF_ID_Rd != ID_EX_Rd && 
			IF_ID_Rd == EX_MEM_RegDst && 
			EX_MEM_RegWr && 
			EX_MEM_RegDst != 0) begin
		ForwardJr = 2'b10;
	end
	else if (ID_PCSrc == 3'b011 && 
			IF_ID_Rd != ID_EX_Rd &&
			IF_ID_Rd != EX_MEM_RegDst && 
			IF_ID_Rd == MEM_WB_RegDst && 
			MEM_WB_RegDst != 0 &&
			MEM_WB_RegWr) begin
		ForwardJr = 2'b11;
	end
	else begin
		ForwardJr = 2'b00;
	end
end


endmodule
