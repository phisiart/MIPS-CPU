module InstDecoder(
    input wire[31:0] instruction,
    output wire[5:0] Format,
    output wire[5:0] Funct,
    output wire[25:0] JT,
    output wire[15:0] Imm16,
    output wire[4:0] Shamt,
    output wire[4:0] Rd,
    output wire[4:0] Rt,
    output wire[4:0] Rs
);
    assign Format = instruction[31:26];
    assign JT = instruction[25:0];
    assign Imm16 = instruction[15:0];
    assign Shamt = instruction[10:6];
    assign Rd = instruction[15:11];
    assign Rt = instruction[20:16];
    assign Rs = instruction[25:21];
    assign Funct = instruction[5:0];
endmodule