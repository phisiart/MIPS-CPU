`timescale 1ns / 1ps
// Zhixun TAN
// Created: 2014/7/12
// Last modified: 2014/7/13

// Control
// -------
// The controler module.
// It takes in the instruction and generate control signals.
// The control signals follow the specifications in the requirement doc.
module Control(
    input wire[31:0] instruction,
    output reg[2:0] PCSrc,
    output reg[1:0] RegDst,
    output reg RegWr,
    output reg ALUSrc1,
    output reg ALUSrc2,
    output reg[5:0] ALUFun,
    output reg Sign,
    output reg MemWr,
    output reg MemRd,
    output reg[1:0] MemToReg,
    output reg EXTOp,
    output reg LUOp
);
    
    // Split the instruction into pieces.
    wire[5:0] Format;
    wire[5:0] Funct;
    wire[25:0] JT;
    wire[15:0] Imm16;
    wire[4:0] Shamt;
    wire[4:0] Rd;
    wire[4:0] Rt;
    wire[4:0] Rs;

    assign Format = instruction[31:26];
    assign JT = instruction[25:0];
    assign Imm16 = instruction[15:0];
    assign Shamt = instruction[10:6];
    assign Rd = instruction[15:11];
    assign Rt = instruction[20:16];
    assign Rs = instruction[25:21];
    assign Funct = instruction[5:0];

    /* FORMAT: instruction[31:26]
     * --------------------------
     * Determine what kind of instruction this is.
     */
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

    /* FUNCT: instruction[5:0]
     * -----------------------
     * For R-type instructions.
     */
    parameter FUNCT_ADD = 6'b100000;
    parameter FUNCT_ADDU = 6'b100001;
    parameter FUNCT_SUB = 6'b100010;
    parameter FUNCT_SUBU = 6'b100011;
    parameter FUNCT_AND = 6'b100100;
    parameter FUNCT_OR = 6'b100101;
    parameter FUNCT_XOR = 6'b100110;
    parameter FUNCT_NOR = 6'b100111;
    parameter FUNCT_SLL = 6'b000000;
    parameter FUNCT_SRL = 6'b000010;
    parameter FUNCT_SRA = 6'b000011;
    parameter FUNCT_SLT = 6'b101010;
    parameter FUNCT_JR = 6'b001000;
    parameter FUNCT_JALR = 6'b001001;

    // PCSrc
    // -----
    // There are 6 cases of the new PC.
    parameter PCSRC_NORMAL = 3'b000; // PC + 4
    parameter PCSRC_BRANCH = 3'b001; // for branches, could be ConBA or PC + 4
    parameter PCSRC_JUMP   = 3'b010; // jump
    parameter PCSRC_A      = 3'b011; // Databus A (normally $ra)
    parameter PCSRC_ILLOP  = 3'b100; // interrupt: 0x80000004
    parameter PCSRC_XADR   = 3'b101; // exception: 0x80000008

    // RegDst
    // ------
    // There are 4 possible RegDst.
    parameter REGDST_RD = 2'b00; // R-type instruction
    parameter REGDST_RT = 2'b01; // I-type instruction
    parameter REGDST_RA = 2'b10; // jal / jalr
    parameter REGDST_XP = 2'b11; // exception

    // RegWr
    // -----
    // Whether to write reg.
    parameter REGWR_ENABLE  = 1'b1;
    parameter REGWR_DISABLE = 1'b0;

    // ALUSrc1
    // -------
    // Whether to use shamt or databus A (Rs).
    parameter ALUSRC1_RS    = 1'b0;
    parameter ALUSRC1_SHAMT = 1'b1;

    // ALUSrc2
    // -------
    // Whether to use databus B (Rt) or not.
    parameter ALUSRC2_RT   = 1'b0;
    parameter ALUSRC2_ELSE = 1'b1;

    // ALUFun
    // ------
    // To give order to ALU.
    parameter ALUFUNC_ADD = 6'b000000;
    parameter ALUFUNC_SUB = 6'b000001;

    parameter ALUFUNC_AND = 6'b011000;
    parameter ALUFUNC_OR  = 6'b011110;
    parameter ALUFUNC_XOR = 6'b010110;
    parameter ALUFUNC_NOR = 6'b010001;
    parameter ALUFUNC_A   = 6'b011010;

    parameter ALUFUNC_SLL = 6'b100000;
    parameter ALUFUNC_SRL = 6'b100001;
    parameter ALUFUNC_SRA = 6'b100011;

    parameter ALUFUNC_EQ  = 6'b110011;
    parameter ALUFUNC_NEQ = 6'b110001;
    parameter ALUFUNC_LT  = 6'b110101;
    parameter ALUFUNC_LEZ = 6'b111101;
    parameter ALUFUNC_GEZ = 6'b111001;
    parameter ALUFUNC_GTZ = 6'b111111;

    // Sign
    // ----
    // signed or unsigned.
    parameter SIGN_SIGNED   = 1'b1;
    parameter SIGN_UNSIGNED = 1'b0;

    // MemWr
    // -----
    // Whether to write memory.
    parameter MEMWR_ENABLE  = 1'b1;
    parameter MEMWR_DISABLE = 1'b0;

    // MemRd
    // -----
    // Whether to read memory.
    parameter MEMRD_ENABLE  = 1'b1;
    parameter MEMRD_DISABLE = 1'b0;

    // MemToReg
    // --------
    parameter MEMTOREG_ALU  = 2'b00;
    parameter MEMTOREG_LOAD = 2'b01;
    parameter MEMTOREG_PC   = 2'b10;

    // EXTOp
    // -----
    // Whether to do signed extension or unsigned extension.
    parameter EXTOP_UNSIGNED = 1'b0;
    parameter EXTOP_SIGNED   = 1'b1;
    
    // LUOp
    // ----
    // Whether to get imm16 to MSB
    parameter LUOP_ENABLE  = 1'b1;
    parameter LUOP_DISABLE = 1'b0;

    always @(*) begin
        case (Format)
        FORMAT_LW: begin // lw $rt imm($rs)
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE; // Take the imm
            ALUFun   = ALUFUNC_ADD;  // $RS + imm
            Sign     = SIGN_SIGNED;  // signed
            MemRd    = MEMRD_ENABLE; // Read memory
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_LOAD;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_SW: begin // sw $rt imm($rs)
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE; // Take imm
            ALUFun   = ALUFUNC_ADD;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_ENABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_LUI: begin // lui $rt imm (my assembler set $rs = $zero)
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_ADD;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = 0;
            LUOp     = LUOP_ENABLE;
        end
        FORMAT_ADDI: begin
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_ADD;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_ADDIU: begin
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_ADD;
            Sign     = SIGN_UNSIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_UNSIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_ANDI: begin
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_AND;
            Sign     = SIGN_UNSIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_UNSIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_SLTI: begin // slti $rt $rs imm
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_LT;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_SLTIU: begin // sltiu $rt $rs imm
            PCSrc    = PCSRC_NORMAL;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_ELSE;
            ALUFun   = ALUFUNC_LT;
            Sign     = SIGN_UNSIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_ALU;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RT;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_BEQ: begin // beq $rs $rt imm
            PCSrc    = PCSRC_BRANCH;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_RT;
            ALUFun   = ALUFUNC_EQ;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_BNE: begin // bne $rs $rt imm
            PCSrc    = PCSRC_BRANCH;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_RT;
            ALUFun   = ALUFUNC_NEQ;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_BLEZ: begin // blez $rs ($rt=$zero) imm
            PCSrc    = PCSRC_BRANCH;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_RT;
            ALUFun   = ALUFUNC_LEZ;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_BGTZ: begin // bgtz $rs ($rt=$zero) imm
            PCSrc    = PCSRC_BRANCH;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_RT;
            ALUFun   = ALUFUNC_GTZ;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_BLTZ: begin // bltz $rs ($rt=$zero) imm
            PCSrc    = PCSRC_BRANCH;
            ALUSrc1  = ALUSRC1_RS;
            ALUSrc2  = ALUSRC2_RT;
            ALUFun   = ALUFUNC_LT;
            Sign     = SIGN_SIGNED;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = 0;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = EXTOP_SIGNED;
            LUOp     = LUOP_DISABLE;
        end
        FORMAT_J: begin // j target[25:0]
            PCSrc    = PCSRC_JUMP;
            ALUSrc1  = 0;
            ALUSrc2  = 0;
            ALUFun   = 0;
            Sign     = 0;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_PC;
            RegWr    = REGWR_DISABLE;
            RegDst   = 0;
            EXTOp    = 0;
            LUOp     = 0;
        end
        FORMAT_JAL: begin // jal target[25:0]
            PCSrc    = PCSRC_JUMP;
            ALUSrc1  = 0;
            ALUSrc2  = 0;
            ALUFun   = 0;
            Sign     = 0;
            MemRd    = MEMRD_DISABLE;
            MemWr    = MEMWR_DISABLE;
            MemToReg = MEMTOREG_PC;
            RegWr    = REGWR_ENABLE;
            RegDst   = REGDST_RA;
            EXTOp    = 0;
            LUOp     = 0;
        end
        FORMAT_R: begin
            if (Funct != FUNCT_JR && Funct != FUNCT_JALR) begin
                PCSrc    = PCSRC_NORMAL;
                ALUSrc2  = ALUSRC2_RT;
                MemRd    = MEMRD_DISABLE;
                MemWr    = MEMWR_DISABLE;
                MemToReg = MEMTOREG_ALU;
                RegWr    = REGWR_ENABLE;
                RegDst   = REGDST_RD;
                EXTOp    = 0;
                LUOp     = 0;
                case (Funct)
                    FUNCT_ADD: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_ADD;
                        Sign     = SIGN_SIGNED;
                    end
                    FUNCT_ADDU: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_ADD;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_SUB: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_SUB;
                        Sign     = SIGN_SIGNED;
                    end
                    FUNCT_SUBU: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_SUB;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_AND: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_AND;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_OR: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_OR;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_XOR: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_XOR;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_NOR: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_NOR;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_SLL: begin
                        ALUSrc1  = ALUSRC1_SHAMT;
                        ALUFun   = ALUFUNC_SLL;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_SRL: begin
                        ALUSrc1  = ALUSRC1_SHAMT;
                        ALUFun   = ALUFUNC_SRL;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_SRA: begin
                        ALUSrc1  = ALUSRC1_SHAMT;
                        ALUFun   = ALUFUNC_SRA;
                        Sign     = SIGN_UNSIGNED;
                    end
                    FUNCT_SLT: begin
                        ALUSrc1  = ALUSRC1_RS;
                        ALUFun   = ALUFUNC_LT;
                        Sign     = SIGN_SIGNED;
                    end
                endcase // case (Funct)
            end else begin // Funct = jr or jalr
                case (Funct)
                FUNCT_JR: begin // jr $rs ($rt = 0)
                    PCSrc    = PCSRC_A;
                    ALUSrc1  = 0;
                    ALUSrc2  = 0;
                    ALUFun   = 0;
                    Sign     = 0;
                    MemRd    = MEMRD_DISABLE;
                    MemWr    = MEMWR_DISABLE;
                    MemToReg = 0;
                    RegWr    = REGWR_DISABLE;
                    RegDst   = 0;
                    EXTOp    = 0;
                    LUOp     = 0;
                end
                FUNCT_JALR: begin // jalr $rs(to jump to) ($rt = 0) $rd(to save to)
                    PCSrc    = PCSRC_A;
                    ALUSrc1  = 0;
                    ALUSrc2  = 0;
                    ALUFun   = 0;
                    Sign     = 0;
                    MemRd    = MEMRD_DISABLE;
                    MemWr    = MEMWR_DISABLE;
                    MemToReg = MEMTOREG_PC;
                    RegWr    = REGWR_ENABLE;
                    RegDst   = REGDST_RD;
                    EXTOp    = 0;
                    LUOp     = 0;
                end
                endcase // case (Funct)
            end
            
        end
        endcase // case (FORMAT)
    end

endmodule
