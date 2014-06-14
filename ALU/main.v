// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/14

// ------------------------------------
// Testbench module

module main;

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

    reg[31:0] A;
    reg[31:0] B;
    wire[31:0] LogicOut;
    wire[31:0] ShiftOut; 
    reg[4:0] shamt;
    reg[5:0] ALUFunc;

    Shift m_shift(shamt, B, ALUFunc[1:0], ShiftOut);
    Logic m_logic(A, B, ALUFunc[3:0], LogicOut);

    initial begin
        A = 10;
        B = -35;

        ALUFunc = ALUFUNC_AND;
        #20 $display("%b = A\n%b = B\n%b = A and B\n", A, B, LogicOut);

        ALUFunc = ALUFUNC_OR;
        #20 $display("%b = A\n%b = B\n%b = A or B\n", A, B, LogicOut);

        ALUFunc = ALUFUNC_XOR;
        #20 $display("%b = A\n%b = B\n%b = A xor B\n", A, B, LogicOut);

        ALUFunc = ALUFUNC_NOR;
        #20 $display("%b = A\n%b = B\n%b = A nor B\n", A, B, LogicOut);

        ALUFunc = ALUFUNC_A;
        #20 $display("%b = A\n%b = B\n%b = A\n", A, B, LogicOut);

        shamt = 5'b10110;
        ALUFunc = ALUFUNC_SLL;
        #20 $display("%b = B\n%d = shamt\n%b = B << shamt\n", B, shamt, ShiftOut);

        shamt = 5'b00011;
        ALUFunc = ALUFUNC_SRL;
        #20 $display("%b = B\n%d = shamt\n%b = B >> shamt\n", B, shamt, ShiftOut);
    
        ALUFunc = ALUFUNC_SRA;
        #20 $display("%b = B\n%d = shamt\n%b = B >>> shamt\n", B, shamt, ShiftOut);

    end

endmodule
