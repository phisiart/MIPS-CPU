// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/15

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
    reg Signed;
    reg[5:0] ALUFunc;
    wire[31:0] S;

    ALU m_alu(A, B, Signed, ALUFunc, S);

    initial begin

        $display("-------------- Testbench for ALU --------------");
        $display("Start testing...");

        A = 15;
        B = -35;
        Signed = 1;
        ALUFunc = ALUFUNC_AND;
        #20 $display("%b = A\n%b = B\n%b = A and B\n", A, B, S);

        ALUFunc = ALUFUNC_OR;
        #20 $display("%b = A\n%b = B\n%b = A or B\n", A, B, S);

        ALUFunc = ALUFUNC_XOR;
        #20 $display("%b = A\n%b = B\n%b = A xor B\n", A, B, S);

        ALUFunc = ALUFUNC_NOR;
        #20 $display("%b = A\n%b = B\n%b = A nor B\n", A, B, S);

        ALUFunc = ALUFUNC_A;
        #20 $display("%b = A\n%b = B\n%b = A\n", A, B, S);

        A = 5'b10110;
        ALUFunc = ALUFUNC_SLL;
        #20 $display("%b = B\n%d = shamt\n%b = B << shamt\n", B, A, S);

        A = 5'b00011;
        ALUFunc = ALUFUNC_SRL;
        #20 $display("%b = B\n%d = shamt\n%b = B >> shamt\n", B, A, S);
    
        ALUFunc = ALUFUNC_SRA;
        #20 $display("%b = B\n%d = shamt\n%b = B >>> shamt\n", B, A, S);

        ALUFunc = ALUFUNC_SUB;
        A = {32{1'b1}};
        B = 1;
        Signed = 0;
        #20 $display("%b = A\n%b = B\n%b = A - B\n", A, B, S);
            //$display("Overflow = %d\nZero = %d\nNegative = %d", Overflow, Zero, Negative);

        ALUFunc = ALUFUNC_ADD;
        #20 $display("%b = A\n%b = B\n%b = A + B\n", A, B, S);
            //$display("Overflow = %d\nZero = %d\nNegative = %d", Overflow, Zero, Negative);

    end

    /*
    wire[31:0] LogicOut;
    wire[31:0] ShiftOut; 
    wire[31:0] ArithOut;
    wire Zero;
    wire Overflow;
    wire Negative;

    reg[4:0] shamt;
    reg[5:0] ALUFunc;
    reg Signed;

    Shift m_shift(shamt, B, ALUFunc[1:0], ShiftOut);
    Logic m_logic(A, B, ALUFunc[3:0], LogicOut);
    Arith m_arith(A, B, ALUFunc[0], Signed, ArithOut, Zero, Overflow, Negative);

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

        ALUFunc = ALUFUNC_SUB;
        A = {32{1'b1}};
        B = 1;
        Signed = 0;
        #20 $display("%b = A\n%b = B\n%b = A - B", A, B, ArithOut);
            $display("Overflow = %d\nZero = %d\nNegative = %d", Overflow, Zero, Negative);

        ALUFunc = ALUFUNC_ADD;
        #20 $display("%b = A\n%b = B\n%b = A + B", A, B, ArithOut);
            $display("Overflow = %d\nZero = %d\nNegative = %d", Overflow, Zero, Negative);
    
    end
    */
endmodule
