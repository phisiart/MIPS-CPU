`timescale 1ns / 1ps

module IF_ID_REG(
    input clk,
    input reset,
    input IF_ID_Write,
    input [31:0] iNextPC,
    input [31:0] iInstruction,
    output reg [31:0] oNextPC,
    output reg [31:0] oInstruction,
    output [5:0] FORMAT,
    output [25:0] JT,
    output [15:0] Imm16,
    output [4:0] Shamt,
    output [4:0] Rd,
    output [4:0] Rt,
    output [4:0] Rs,
    output [5:0] FUNCT
    );

assign FUNCT = oInstruction[5:0];
assign FORMAT = oInstruction[31:26];
assign JT = oInstruction[25:0];
assign Imm16 = oInstruction[15:0];
assign Shamt = oInstruction[10:6];
assign Rd = oInstruction[15:11];
assign Rs = oInstruction[20:16];
assign Rt = oInstruction[25:21];

always @(posedge clk or negedge reset) begin
    if (~reset) begin
        oNextPC <= 32'h80000000;
        oInstruction <= 32'h00000000;
    end
    else begin
        if (IF_ID_Write == 1'b1) begin
            oNextPC <= iNextPC;
            oInstruction <= iInstruction;
        end
    end
end
endmodule
