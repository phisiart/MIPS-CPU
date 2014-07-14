`timescale 1ns / 1ps

module Forward_Unit(
	input EX_MEM_RegWr,
	input [4:0] EX_MEM_RegDst,
	input [4:0] ID_EX_Rt,
	input [4:0] ID_EX_Rs,
	input MEM_WB_RegWr,
	input [4:0] MEM_WB_RegDst,
	output reg [1:0] ForwardA,
	output reg [1:0] ForwardB
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
end


endmodule
