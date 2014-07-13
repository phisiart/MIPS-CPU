module ID(
    input wire reset,
    input wire clk,
    input wire[2:0] PCSrc,
    input wire[31:0] ConBA,
    input wire ALUOut0,
    input wire[31:0] DataBusA,
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
        case (PCSrc)
        PCSRC_NORMAL: NewPC = PC + 4;
        PCSRC_BRANCH: NewPC = ALUOut0 ? ConBA : (PC + 4);
        PCSRC_A:      NewPC = DataBusA;
        PCSRC_ILLOP:  NewPC = ILLOP;
        PCSRC_XADR:   NewPC = XADR;
        endcase
    end

endmodule