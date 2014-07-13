module InstPrint(
    input wire[31:0] instruction,
    input wire pulse
);
    
    assign Format = instruction[31:26];
    assign JT = instruction[25:0];
    assign Imm16 = instruction[15:0];
    assign Shamt = instruction[10:6];
    assign Rd = instruction[15:11];
    assign Rt = instruction[20:16];
    assign Rs = instruction[25:21];
    assign Funct = instruction[5:0];

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

    // For R-type instructions, look at funct (instr[5:0])
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

    always @(posedge pulse) begin
        $display("Instruction");
        $display("-----------");

        case (Format)
        FORMAT_LW:    $display("lw");
        FORMAT_SW:    $display("sw");
        FORMAT_LUI:   $display("lui");
        FORMAT_ADDI:  $display("addi");
        FORMAT_ADDIU: $display("addiu");
        FORMAT_ANDI:  $display("andi");
        FORMAT_SLTI:  $display("slti");
        FORMAT_SLTIU: $display("sltiu");
        FORMAT_BEQ:   $display("beq");
        FORMAT_BNE:   $display("bne");
        FORMAT_BLEZ:  $display("blez");
        FORMAT_BGTZ:  $display("bgtz");
        FORMAT_BLTZ:  $display("bltz");
        FORMAT_J:     $display("j");
        FORMAT_JAL:   $display("jal");
        endcase

        if (Format == FORMAT_R) begin
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

        $display("format = %06b (%d)", Format, Format);
        $display("JT = %026b (%d)", JT, JT);
        $display("Imm16 = %016b (%d)", Imm16, Imm16);
        $display("Shamt = %05b (%d)", Shamt, Shamt);
        $display("Rd = %05b (%d)", Rd, Rd);
        $display("Rt = %05b (%d)", Rt, Rt);
        $display("Rs = %05b (%d)", Rs, Rs);
        $display("");

    end

endmodule