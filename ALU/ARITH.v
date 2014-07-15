`timescale 1ns / 1ps
// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/15

// ------------------------------------
// Module Arith
// Input:
//     A[31:0]
//     B[31:0]
//     FT: ALUFunc[0]
//     Signed
// Output:
//     S[31:0]
//     Zero
//     Overflow
//     Negative

module Arith(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire FT,
    input wire Signed,
    output wire[31:0] S,
    output wire Zero,
    output wire Overflow,
    output wire Negative
);

    // parameter FT_ARITH_ADD = 1'b0;
    // parameter FT_ARITH_SUB = 1'b1;

    wire[31:0] S_ADD;
    wire[31:0] S_SUB;

    wire Zero_ADD, Overflow_ADD, Negative_ADD;
    ADD m_add(A, B, Signed, S_ADD, Zero_ADD, Overflow_ADD, Negative_ADD);

    wire Zero_SUB, Overflow_SUB, Negative_SUB;
    SUB m_sub(A, B, Signed, S_SUB, Zero_SUB, Overflow_SUB, Negative_SUB);

    assign S = FT ? S_SUB : S_ADD;
    assign Zero = FT ? Zero_SUB : Zero_ADD;
    assign Overflow = FT ? Overflow_SUB : Overflow_ADD;
    assign Negative = FT ? Negative_SUB : Negative_ADD;
    
endmodule
