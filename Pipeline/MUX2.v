`timescale 1ns / 1ps

module MUX2(
	input [31:0] iData0,
	input [31:0] iData1,
	input Ctrl,
	output [31:0] oData
	);
assign oData = (Ctrl == 1'b1) ? iData1 : iData0;
endmodule