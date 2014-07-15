`timescale 1ns / 1ps
// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/15

// ------------------------------------
// Module SUB
// Input:
//     A[31:0]
//     B[31:0]
//     Signed
// Output:
//     S[31:0]
//     Zero
//     Overflow
//     Negative

module SUB(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire Signed,
    output wire[31:0] S,
    output wire Zero,
    output wire Overflow,
    output wire Negative
);

    wire m_zero;
    wire m_overflow;
    wire m_negative;

    ADD m_add(A, ~B + 1, Signed, S, m_zero, m_overflow, m_negative);

    assign Zero = ((S == 0) & ~Overflow);
    // overflow
    // --------------------------------------------------------------
    // 1. Signed:
    //   1) pos - pos or neg - neg
    //      There will be no overflow in this situation
    //   2) pos - neg
    //      If the answer is negative then there is an overflow
    //   3) neg - pos
    //      If the answer is positive then there is an overflow
    //   Considering the above 3 situations, we know that
    //   Overflow = (NegA & ~NegB & ~NegS) | (~NegA & NegB & NegS)
    //
    // 2. Unsigned
    //   1) small - big
    //      There will definitely be an overflow
    //   2) big - small
    //      There will be no overflow
    //   3) big - big or small - small
    //      Pretend that the inputs are signed,
    //      then read the sign bit of output : S[31]
    //   Considering the above 3 situations, we know that
    //   Overflow = (~BigA & BigB) | (BigA == BigB) & BigS
    //            = (~BigA & BigB) | (~BigA & BigS) | (BigB & BigS)
    //
    assign Overflow = (
        Signed ? (
            (A[31] & ~B[31] & ~S[31]) | (~A[31] & B[31] & S[31])
        ) : (
            (~A[31] & B[31]) | ((A[31] == B[31]) & S[31])
        )
    );

    // negative
    // --------------------------------------------------------------
    // Although an overflow is possible
    // we try our best to identify the sign.
    // 1. Signed
    //   1) pos - pos or neg - neg
    //      There will be no overflow in this situation
    //      so just check the sign bit : S[31]
    //   2) neg - pos or pos - neg
    //      There could be an overflow, but we know that
    //      the sign is the same as what is subtracted from.
    //   Considering the above 2 situations, we know that
    //   NegOut = (NegA != NegB) ? NegA : NegS
    //
    //   Note that we cannot just grab the negative bit from the adder
    //   Consider this situation:
    //   0 - (-M) (Note that -M is the smallest possible number)
    //   The adder receives 0 + M but it recognize the equation as
    //     0 + (-M)
    //   Then the adder says that the answer is negative
    //   but indeed it should be positive
    //
    // 2. Unsigned
    //   1) big - small
    //      The answer is always positive
    //   2) small - big
    //      The answer is always negative
    //   3) big - big or small - small
    //      Pretend the inputs are signed,
    //      then read the sign bit of output : S[31]
    //   Considering the above 2 situations, we know that
    //   NegOut = (BigA != BigB) ? BigB : BigS
    //
    // Finally:
    //
    assign Negative = (A[31] ^ B[31]) ? (
        Signed ? A[31] : B[31]
    ) : S[31];

endmodule
