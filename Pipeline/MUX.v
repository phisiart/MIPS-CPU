`timescale 1ns / 1ps

// ZHENGRONG WANG
// Created 11/07/2014
// Last Modified 13/07/2014

module MUX4(
    input [31:0] iData0,
    input [31:0] iData1,
    input [31:0] iData2,
    input [31:0] iData3,
    input [1:0] iControl,
    output [31:0] oData
    );

assign oData = (
        (iControl == 2'b00) ? iData0 : (
            (iControl == 2'b01) ? iData1 : (
                (iControl == 2'b10) ? iData2 : iData3))
    );
endmodule
