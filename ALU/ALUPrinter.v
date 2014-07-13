// Zhixun TAN
// Created: 2014/7/12
// Last modified: 2014/7/12

// -----------------------------------
// module ALUPrinter
// Input:
//     A[31:0]
//     B[31:0]
//     Signed
//     ALUFunc[5:0]
//     S[31:0]       The upper 5 are connected to an ALU
//     pulse         The posedge triggers a print
module ALUPrinter(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire Signed,
    input wire[5:0] ALUFunc,
    input wire[31:0] S,
    input wire pulse
);
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

    always @(posedge pulse) begin
        $display("ALUFunc = %6b (%d)", ALUFunc, ALUFunc);
        case (ALUFunc)
        ALUFUNC_ADD: $display("ADD");
        ALUFUNC_SUB: $display("SUB");
        ALUFUNC_AND: $display("AND");
        ALUFUNC_OR:  $display("OR");
        ALUFUNC_XOR: $display("XOR");
        ALUFUNC_NOR: $display("NOR");
        ALUFUNC_A:   $display("A");
        ALUFUNC_SLL: $display("SLL");
        ALUFUNC_SRL: $display("SRL");
        ALUFUNC_SRA: $display("SRA");
        ALUFUNC_EQ:  $display("EQ");
        ALUFUNC_NEQ: $display("NEQ");
        ALUFUNC_LT:  $display("LT");
        ALUFUNC_LEZ: $display("LEZ");
        ALUFUNC_GEZ: $display("GEZ");
        ALUFUNC_GTZ: $display("GTZ");
        endcase
        if (Signed) begin
            $display("Signed");
        end else begin
            $display("Unsigned");
        end
        $display("A = %32b (%d)", A, A);
        $display("B = %32b (%d)", B, B);
        $display("S = %32b (%d)", S, S);
    end
endmodule
