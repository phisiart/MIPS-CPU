`timescale 1ns / 1ps

module Extend(
	input [15:0] imm16,
	input ExtendOp,
	output reg [31:0] imm32
	);

always @(*) begin
	case(ExtendOp)
		1'b0: imm32 = {16'hffff, imm16};
		1'b1: imm32 = {{16{imm16[15]}}, imm16};
	endcase
end
endmodule