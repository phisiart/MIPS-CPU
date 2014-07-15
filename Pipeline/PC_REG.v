`timescale 1ns / 1ps

// ZHENGRONG WANG
// Created 11/07/2014
// Last Modified 13/07/2014

module PC_REG(
    input clk,
    input reset,
    input PCWrite,
    input [31:0] iPC,
    output reg [31:0] oPC
    );

always @(posedge clk or negedge reset) begin
    if (~reset) begin
        oPC <= 32'h00400000;
    end
    else begin
        if (PCWrite == 1'b1) begin
            oPC <= iPC;
        end
    end
end

endmodule
