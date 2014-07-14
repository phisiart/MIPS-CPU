`timescale 1ns / 1ps

module ID(
    input wire reset,
    input wire clk,
    input wire[2:0] PCSrc,
    input wire[31:0] ConBA,
    input wire ALUOut0,
    input wire[31:0] DataBusA,
    input wire[25:0] JT,
    output reg[31:0] PC,
    output reg[31:0] NewPC
);

    parameter PCSRC_NORMAL = 3'b000; // PC + 4
    parameter PCSRC_BRANCH = 3'b001; // for branches, could be ConBA or PC + 4
    parameter PCSRC_JUMP   = 3'b010; // jump
    parameter PCSRC_A      = 3'b011; // Databus A (normally $ra)
    parameter PCSRC_ILLOP  = 3'b100; // interrupt: 0x80000004
    parameter PCSRC_XADR   = 3'b101; // exception: 0x80000008
    parameter ILLOP = 'h80000004;
    parameter XADR  = 'h80000008;

    always @(*) begin
        NewPC = PC + 4;
    end

    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            PC = 32'h00400000;
        end else begin
            case (PCSrc)
            PCSRC_NORMAL: PC = NewPC;
            PCSRC_BRANCH: PC = (ALUOut0 ? ConBA : NewPC);
            PCSRC_JUMP:   PC = { NewPC[31:28], JT, 2'b00 };
            PCSRC_A:      PC = DataBusA;
            PCSRC_ILLOP:  PC = ILLOP;
            PCSRC_XADR:   PC = XADR;
            // default:      PC = NewPC;
            endcase
        end
    end

endmodule