// Zhixun TAN
// Created: 2014/7/12
// Last modified: 2014/7/12

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

    // PCSrc
    // -----
    // There are 6 cases of the new PC.
    parameter PCSRC_NORMAL = 3'b000; // PC + 4
    parameter PCSRC_BRANCH = 3'b001; // for branches, could be ConBA or PC + 4
    parameter PCSRC_JUMP   = 3'b010; // jump
    parameter PCSRC_A      = 3'b011; // Databus A (normally $ra)
    parameter PCSRC_ILLOP  = 3'b100; // interrupt: 0x80000004
    parameter PCSRC_XADR   = 3'b101; // exception: 0x80000008
    assign PCSrc = ;

    // RegDst
    // ------
    // There are 4 possible RegDst.
    parameter REGDST_RD = 2'b00; // R-type instruction
    parameter REGDST_RT = 2'b01; // I-type instruction
    parameter REGDST_RA = 2'b10; // jal / jalr
    parameter REGDST_XP = 2'b11; // exception
    assign RegDst = ;

    // RegWr
    // -----
    // Whether to write reg.
    parameter REGWR_ENABLE  = 1'b1;
    parameter REGWR_DISABLE = 1'b0;
    assign RegWr = ;

    // ALUSrc1
    // -------
    // Whether to use shamt or databus A (Rs).
    parameter ALUSRC1_RS    = 1'b0;
    parameter ALUSRC1_SHAMT = 1'b1;
    assign ALUSrc1 = ;

    // ALUSrc2
    // -------
    // Whether to use databus B (Rt) or not.
    parameter ALUSRC2_RT   = 1'b0;
    parameter ALUSRC2_ELSE = 1'b1;
    assign ALUSrc2 = ;

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
            RegDst   = 
            EXTOp    = 
            LUOp     = 
        end

        FORMAT_ADDIU: begin
            PCSrc    = 
            ALUSrc1  = 
            ALUSrc2  = 
            ALUFun   = 
            Sign     = 
            MemRd    = 
            MemWr    = 
            MemToReg = 
            RegWr    = 
            RegDst   = 
            EXTOp    = 
            LUOp     = 
        end
        FORMAT_ANDI: begin
            PCSrc    = 
            ALUSrc1  = 
            ALUSrc2  = 
            ALUFun   = 
            Sign     = 
            MemRd    = 
            MemWr    = 
            MemToReg = 
            RegWr    = 
            RegDst   = 
            EXTOp    = 
            LUOp     = 
        end
        FORMAT_SLTI: begin
            PCSrc    = 
            ALUSrc1  = 
            ALUSrc2  = 
            ALUFun   = 
            Sign     = 
            MemRd    = 
            MemWr    = 
            MemToReg = 
            RegWr    = 
            RegDst   = 
            EXTOp    = 
            LUOp     = 
        end
        FORMAT_SLTIU: $display("sltiu");
        FORMAT_BEQ:   $display("beq");
        FORMAT_BNE:   $display("bne");
        FORMAT_BLEZ:  $display("blez");
        FORMAT_BGTZ:  $display("bgtz");
        FORMAT_BLTZ:  $display("bltz");
        FORMAT_J:     $display("j");
        FORMAT_JAL:   $display("jal");
        FORMAT_R: begin
            case (Funct)
                FUNCT_ADD:  $display("add");
                FUNCT_ADDU: $display("addu");
                FUNCT_SUB:  $display("sub");
                FUNCT_SUBU: $display("subu");
                FUNCT_AND:  $display("and");
                FUNCT_OR:   $display("or");
                FUNCT_XOR:  $display("xor");
                FUNCT_NOR:  $display("nor");
                FUNCT_SLL:  $display("sll");
                FUNCT_SRL:  $display("srl");
                FUNCT_SRA:  $display("sra");
                FUNCT_SLT:  $display("slt");
                FUNCT_JR:   $display("jr");
                FUNCT_JALR: $display("jalr");
            endcase
        end
        endcase
    end

    assign ALUFun  = ;

    // Sign
    // ----
    // signed or unsigned.
    parameter SIGN_SIGNED   = 1'b1;
    parameter SIGN_UNSIGNED = 1'b0;
    assign Sign = ;

    // MemWr
    // -----
    // Whether to write memory.
    parameter MEMWR_ENABLE  = 1'b1;
    parameter MEMWR_DISABLE = 1'b0;
    assign MemWr = ;

    // MemRd
    // -----
    // Whether to read memory.
    parameter MEMRD_ENABLE  = 1'b1;
    parameter MEMRD_DISABLE = 1'b0;
    assign MemRd = ;

    // MemToReg
    // --------
    parameter MEMTOREG_ALU  = 2'b00;
    parameter MEMTOREG_LOAD = 2'b01;
    parameter MEMTOREG_PC   = 2'b10;
    assign MemToReg = ;

    // EXTOp
    // -----
    // Whether to do signed extension or unsigned extension.
    parameter EXTOP_UNSIGNED = 1'b0;
    parameter EXTOP_SIGNED   = 1'b1;
    assign EXTOp = ;
    
    // LUOp
    // ----
    // Whether to get imm16 to MSB
    parameter LUOP_ENABLE  = 1'b1;
    parameter LUOP_DISABLE = 1'b0;
    assign LUOp = ;
    
endmodule
