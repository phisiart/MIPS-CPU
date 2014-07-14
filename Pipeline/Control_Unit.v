`timescale 1ns / 1ps

// ZHENGRONG WANG
// Created 13/07/2014
// Last Modified 13/07/2014

module Control_Unit (
    input [31:0] Instruction,
    input Interrupt,
    output reg [2:0] PCSrc,
    output reg [1:0] RegDst,
    output reg RegWr,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg [5:0] ALUFun,
    output reg Sign,
    output reg MemWr,
    output reg MemRd,
    output reg [1:0] MemToReg,
    output reg EXTOp,
    output reg LUOp
    );

    wire [5:0] FUNCT;
    wire [5:0] FORMAT;
    assign FUNCT = Instruction[5:0];
    assign FORMAT = Instruction[31:26];

    parameter FORMAT_R     = 6'b000000;
    parameter FORMAT_LW    = 6'b100011;
    parameter FORMAT_SW    = 6'b101011;
    parameter FORMAT_LUI   = 6'b001111;
    parameter FORMAT_ADDI  = 6'b001000;
    parameter FORMAT_ADDIU = 6'b001001;
    parameter FORMAT_ANDI  = 6'b001100;
    parameter FORMAT_SLTI  = 6'b001010;
    parameter FORMAT_SLTIU = 6'b001011;
    parameter FORMAT_BEQ   = 6'b000100;
    parameter FORMAT_BNE   = 6'b000101;
    parameter FORMAT_BLEZ  = 6'b000110;
    parameter FORMAT_BGTZ  = 6'b000111;
    parameter FORMAT_BLTZ  = 6'b000001;
    parameter FORMAT_J     = 6'b000010;
    parameter FORMAT_JAL   = 6'b000011;

    parameter FUNCT_ADD     = 6'b100000;
    parameter FUNCT_ADDU    = 6'b100001;
    parameter FUNCT_SUB     = 6'b100010;
    parameter FUNCT_SUBU    = 6'b100011;
    parameter FUNCT_AND     = 6'b100100;
    parameter FUNCT_OR      = 6'b100101;
    parameter FUNCT_XOR     = 6'b100110;
    parameter FUNCT_NOR     = 6'b100111;
    parameter FUNCT_SLL     = 6'b000000;
    parameter FUNCT_SRL     = 6'b000010;
    parameter FUNCT_SRA     = 6'b000011;
    parameter FUNCT_SLT     = 6'b101010;
    parameter FUNCT_JR      = 6'b001000;
    parameter FUNCT_JALR    = 6'b001001;

    // Here defines the control signals

    // PCSrc
    parameter PCSrc_ADD4    = 3'b000;
    parameter PCSrc_Branch  = 3'b001;
    parameter PCSrc_JT      = 3'b010;
    parameter PCSrc_Ra      = 3'b011;
    parameter PCSrc_ILLOP   = 3'b100;
    parameter PCSrc_XADR    = 3'b101;

    // RegDst
    parameter RegDst_Rd     = 2'b00;
    parameter RegDst_Rt     = 2'b01;
    parameter RegDst_Ra     = 2'b10;
    parameter RegDst_Xp     = 2'b11;

    // RegWr
    parameter RegWr_EN      = 1'b1;
    parameter RegWr_DIS     = 1'b0;

    // ALUSrc1
    parameter ALUSrc1_REG   = 1'b0;
    parameter ALUSrc1_SHA   = 1'b1;

    // ALUSrc1
    parameter ALUSrc2_REG   = 1'b0;
    parameter ALUSrc2_IMM   = 1'b1;

    // ALUFunc
    parameter ALU_ARITH = 2'b00;
    parameter ALUFUNC_ADD = 6'b000000;
    parameter ALUFUNC_SUB = 6'b000001;

    parameter ALU_LOGIC = 2'b01;
    parameter ALUFUNC_AND = 6'b011000;
    parameter ALUFUNC_OR  = 6'b011110;
    parameter ALUFUNC_XOR = 6'b010110;
    parameter ALUFUNC_NOR = 6'b010001;
    parameter ALUFUNC_A   = 6'b011010;

    parameter ALU_SHIFT = 2'b10;
    parameter ALUFUNC_SLL = 6'b100000;
    parameter ALUFUNC_SRL = 6'b100001;
    parameter ALUFUNC_SRA = 6'b100011;

    parameter ALU_CMP = 2'b11;
    parameter ALUFUNC_EQ  = 6'b110011;
    parameter ALUFUNC_NEQ = 6'b110001;
    parameter ALUFUNC_LT  = 6'b110101;
    parameter ALUFUNC_LEZ = 6'b111101;
    parameter ALUFUNC_GEZ = 6'b111001;
    parameter ALUFUNC_GTZ = 6'b111111;

    // Sign
    parameter Sign_EN       = 1'b1;
    parameter Sign_DIS      = 1'b0;

    // MemWr
    parameter MemWr_EN      = 1'b1;
    parameter MemWr_DIS     = 1'b0;

    // MemRd
    parameter MemRd_EN      = 1'b1;
    parameter MemRd_DIS     = 1'b0;

    // MemToReg
    parameter MemToReg_ALU  = 2'b00;
    parameter MemToReg_MEM  = 2'b01;
    parameter MemToReg_PC   = 2'b10;

    // EXTOp
    parameter EXTOp_SIGNED   = 1'b1;
    parameter EXTOp_UNSIGNED = 1'b0;

    // LUOp
    parameter LUOp_EN       = 1'b1;
    parameter LUOp_DIS      = 1'b0;

always @(*) begin
    // has an external interrupt
    if (Interrupt == 1'b1 && FORMAT[5] == 1'b0) begin
        PCSrc       =
        RegDst      =
        ALUSrc1     =
        ALUSrc2     =
        ALUFun      =
        Sign        =
        MemWr       =
        MemRd       =
        MemToReg    =
        EXTOp       =
        LUOp        =
    end
    else begin
        case(FORMAT)
            FORMAT_LW: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_EN;
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_SW: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemRd_EN;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_LUI: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_EN;
            end
            FORMAT_BEQ: begin
                PCSrc       = PCSrc_Branch;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_EQ;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_BNE: begin
                PCSrc       = PCSrc_Branch;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_NEQ;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_BLEZ: begin
                PCSrc       = PCSrc_Branch;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_LEZ;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_BGTZ: begin
                PCSrc       = PCSrc_Branch;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_GTZ;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_BLTZ: begin
                PCSrc       = PCSrc_Branch;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_LT;
                Sign        = Sign_EN;
                MemWr       = MemRd_DIS;
                MemRd       = MemRd_DIS
                MemToReg    = MemToReg_MEM;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_J: begin
                PCSrc       = PCSrc_JT;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_DIS;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_JAL: begin
                PCSrc       = PCSrc_JT;
                RegDst      = RegDst_Ra;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_REG;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_PC;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_ADDI: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_EN;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_ADDIU: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_ADD;
                Sign        = Sign_DIS;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_UNSIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_ANDI: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_AND;
                Sign        = Sign_DIS;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_UNSIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_SLTI: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_LT;
                Sign        = Sign_EN;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_SIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_SLTIU: begin
                PCSrc       = PCSrc_ADD4;
                RegDst      = RegDst_Rt;
                RegWr       = RegWr_EN;
                ALUSrc1     = ALUSrc1_REG;
                ALUSrc2     = ALUSrc2_IMM;
                ALUFun      = ALUFUNC_LT;
                Sign        = Sign_DIS;
                MemWr       = MemWr_DIS;
                MemRd       = MemRd_DIS;
                MemToReg    = MemToReg_ALU;
                EXTOp       = EXTOp_UNSIGNED;
                LUOp        = LUOp_DIS;
            end
            FORMAT_R: begin
                if (FUNCT == FUNCT_JR) begin
                    PCSrc       = PCSrc_Ra;
                    RegDst      = RegDst_Rt;
                    RegWr       = RegWr_DIS;
                    ALUSrc1     = ALUSrc1_REG;
                    ALUSrc2     = ALUSrc2_REG;
                    ALUFun      = ALUFUNC_ADD;
                    Sign        = Sign_EN;
                    MemWr       = MemWr_DIS;
                    MemRd       = MemRd_DIS;
                    MemToReg    = MemToReg_ALU;
                    EXTOp       = EXTOp_SIGNED;
                    LUOp        = LUOp_DIS;
                end
                else if (FUNCT == FUNCT_JALR) begin
                    PCSrc       = PCSrc_Ra;
                    RegDst      = RegDst_Rd;
                    RegWr       = RegWr_EN;
                    ALUSrc1     = ALUSrc1_REG;
                    ALUSrc2     = ALUSrc2_REG;
                    ALUFun      = ALUFUNC_ADD;
                    Sign        = Sign_EN;
                    MemWr       = MemWr_DIS;
                    MemRd       = MemRd_DIS;
                    MemToReg    = MemToReg_PC;
                    EXTOp       = EXTOp_SIGNED;
                    LUOp        = LUOp_DIS;
                end
                else begin
                    // normal R type
                    PCSrc   = PCSrc_ADD4;
                    RegDst  = RegDst_Rd;
                    RegWr   = RegWr_EN;
                    ALUSrc2 = ALUSrc2_REG;
                    MemWr   = MemWr_DIS;
                    MemRd   = MemRd_DIS;
                    EXTOp   = EXTOp_UNSIGNED;
                    LUOp    = LUOp_DIS;
                    case(FUNCT)
                        FUNCT_ADD: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_ADD;
                            Sign    = Sign_EN;
                        end
                        FUNCT_ADDU: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_ADD;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_SUB: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_SUB;
                            Sign    = Sign_EN;
                        end
                        FUNCT_SUBU: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_SUB;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_AND: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_AND;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_XOR: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_XOR;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_NOR: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_NOR;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_SLL: begin
                            ALUSrc1 = ALUSrc1_SHA;
                            ALUFun  = ALUFUNC_SLL;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_SRL: begin
                            ALUSrc1 = ALUSrc1_SHA;
                            ALUFun  = ALUFUNC_SRL;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_SRA: begin
                            ALUSrc1 = ALUSrc1_SHA;
                            ALUFun  = ALUFUNC_SRA;
                            Sign    = Sign_DIS;
                        end
                        FUNCT_SLT: begin
                            ALUSrc1 = ALUSrc1_REG;
                            ALUFun  = ALUFUNC_LT;
                            Sign    = Sign_EN;
                        end
                    endcase
                end
            end
        endcase
    end
end

endmodule