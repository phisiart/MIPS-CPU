module IX(
    input wire reset,
    input wire clk,

    input wire[31:0] PC,
    input wire[31:0] NewPC,
    input wire[31:0] WriteData,

    output wire[31:0] DataBusA,
    output wire[31:0] ConBA,

    output reg[31:0] ALUIn1,
    output reg[31:0] ALUIn2,

    output wire[5:0] Format,
    output wire[5:0] Funct,
    output wire[25:0] JT,
    output wire[15:0] Imm16,
    output wire[4:0] Shamt,
    output wire[4:0] Rd,
    output wire[4:0] Rt,
    output wire[4:0] Rs,

    output wire[2:0] PCSrc,
    output wire[1:0] RegDst,
    output wire RegWr,
    output wire ALUSrc1,
    output wire ALUSrc2,
    output wire[5:0] ALUFun,
    output wire Sign,
    output wire MemWr,
    output wire MemRd,
    output wire[1:0] MemToReg,
    output wire EXTOp,
    output wire LUOp
);

    wire[31:0] instruction;
    ROM rom(
        .addr(PC),
        .data(instruction)
    );

    assign Format = instruction[31:26];
    assign JT = instruction[25:0];
    assign Imm16 = instruction[15:0];
    assign Shamt = instruction[10:6];
    assign Rd = instruction[15:11];
    assign Rt = instruction[20:16];
    assign Rs = instruction[25:21];
    assign Funct = instruction[5:0];

    Control control(
        .instruction(instruction), // from rom
        .PCSrc(PCSrc),
        .RegDst(RegDst),
        .RegWr(RegWr),
        .ALUSrc1(ALUSrc1),
        .ALUSrc2(ALUSrc2),
        .ALUFun(ALUFun),
        .Sign(Sign),
        .MemWr(MemWr),
        .MemRd(MemRd),
        .MemToReg(MemToReg),
        .EXTOp(EXTOp),
        .LUOp(LUOp)
    );

    wire[31:0] DataBusB;

    parameter REGDST_RD = 2'b00; // R-type instruction
    parameter REGDST_RT = 2'b01; // I-type instruction
    parameter REGDST_RA = 2'b10; // jal / jalr
    parameter REGDST_XP = 2'b11; // exception
    parameter Ra        = 5'b11111; // 31
    parameter Xp        = 5'b11010; // 26
    reg[4:0] addr3;
    always @(*) begin
        case (RegDst)
        REGDST_RD: addr3 = Rd;
        REGDST_RT: addr3 = Rt;
        REGDST_RA: addr3 = Ra;
        REGDST_XP: addr3 = Xp;
        endcase
    end
    
    RegFile regfile(
        .reset(reset),
        .clk(clk),
        .addr1(Rs),
        .data1(DataBusA),
        .addr2(Rt),
        .data2(DataBusB),
        .wr(RegWr),
        .addr3(addr3),
        .data3(WriteData)
    );

    // Control the first input of ALU
    parameter ALUSRC1_RS    = 1'b0;
    parameter ALUSRC1_SHAMT = 1'b1;
    always @(*) begin
        case (ALUSrc1)
        ALUSRC1_RS:    ALUIn1 = DataBusA;
        ALUSRC1_SHAMT: ALUIn1 = Shamt;
        endcase
    end

    // Imm32: extend the Imm16
    reg[31:0] Imm32;
    parameter EXTOP_UNSIGNED = 1'b0;
    parameter EXTOP_SIGNED   = 1'b1;
    always @(*) begin
        case (EXTOp)
        EXTOP_UNSIGNED: Imm32 = { 16'b0, Imm16 };
        EXTOP_SIGNED:   Imm32 = { {16{Imm16[15]}}, Imm16 };
        endcase
    end

    // ConBA
    assign ConBA = { Imm32[31:2], 2'b00 } + NewPC;

    // Control the second input of ALU
    parameter ALUSRC2_RT   = 1'b0;
    parameter ALUSRC2_ELSE = 1'b1;
    parameter LUOP_ENABLE  = 1'b1;
    parameter LUOP_DISABLE = 1'b0;
    always @(*) begin
        case (ALUSrc2)
        ALUSRC2_RT: ALUIn2 = DataBusB;
        ALUSRC2_ELSE: begin
            case (LUOp)
            LUOP_ENABLE:  ALUIn2 = { Imm16, 16'b0 };
            LUOP_DISABLE: ALUIn2 = Imm32;
            endcase
        end
        endcase
    end



endmodule