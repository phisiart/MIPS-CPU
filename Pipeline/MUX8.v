`timescale 1ns / 1ps

module MUX8(
	input [31:0] iData0,
	input [31:0] iData1,
	input [31:0] iData2,
	input [31:0] iData3,
	input [31:0] iData4,
	input [31:0] iData5,
	input [31:0] iData6,
	input [31:0] iData7,
	input [2:0] iCtrl,
	output [31:0] oData
	);

wire [31:0] oDataTemp1, oDataTemp2;

MUX4 Mux4_1(
	.iData0(iData0),
	.iData1(iData1),
	.iData2(iData2),
	.iData3(iData3),
	.iControl(iCtrl[1:0]),
	.oData(oDataTemp1)
	);

MUX4 Mux4_2(
	.iData0(iData4),
	.iData1(iData5),
	.iData2(iData6),
	.iData3(iData7),
	.iControl(iCtrl[1:0]),
	.oData(oDataTemp2)
	);

MUX2 Mux2(
	.iData0(oDataTemp1),
	.iData1(oDataTemp2),
	.Ctrl(iCtrl[2]),
	.oData(oData)
	);

endmodule