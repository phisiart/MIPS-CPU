`timescale 1ns / 1ps
// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/15

// ------------------------------------
// Module ADD
// Input:
//     A[31:0]
//     B[31:0]
//     Signed
// Output:
//     S[31:0]
//     Zero
//     Overflow
//     Negative

module ADD(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire Signed,
    output wire[31:0] S,
    output wire Zero,
    output wire Overflow,
    output wire Negative
);

    assign S = A + B;

    assign Zero = ((S == 0) & ~Overflow);

    // overflow
    // --------------------------------------------------------------
    // 1. Signed:
    //   1) pos + neg or neg + pos
    //      There will be no overflow in this situation
    //   2) pos + pos
    //      If the answer is negative then there is an overflow
    //   3) neg + neg
    //      If the answer is positive then there is an overflow
    //   Considering the above 3 situations, we know that
    //   Overflow = (NegA & NegB & ~NegS) | (~NegA & ~NegB & NegS)
    //
    //  2. Unsigned
    //    1) small + small
    //       There will be no overflow in this situation
    //    2) big + big
    //       There is definitely an overflow
    //    3) small + big or big + small
    //       If the answer is small then there is an overflow
    //    Considering the above 3 situations, we know that
    //    Overflow = (BigA & BigB) | (BigA != BigB) & ~BigS
    //             = BigA & BigB | BigA & ~BigS | BigB & ~BigS
    //
    assign Overflow = (Signed ? (
        (A[31] & B[31] & ~S[31]) | (~A[31] & ~B[31] & S[31])
    ) : (
        (A[31] & B[31]) | (A[31] & ~S[31]) | (B[31] & ~S[31])
    ));

    // negative
    // --------------------------------------------------------------
    // Although an overflow is possible,
    // we try our best to identify the sign.
    // 1. Signed
    //   1) pos + neg or neg + pos
    //      There will be no overflow in this situation
    //      so just check the sign bit : S[31]
    //   2) pos + pos or neg + neg
    //      there could be an overflow, but we definitely know that
    //      the sign is the same as the inputs, i.e. A[31]
    //   Considering the above 2 situations, we know that
    //   NegOut = (NegA != NegB) ? NegS : NegA
    //   Do a little simplification and we get
    //   NegOut = NegA & NegB | NegA & NegS | NegB & NegS
    //
    // 2. Unsigned
    //   There could be overflow,
    //   but we can tell that the answer is always pos.
    //   NegOut = 0
    //
    // Finally:
    //
    assign Negative = Signed & ((A[31] ^ B[31]) ? S[31] : A[31]);

endmodule
