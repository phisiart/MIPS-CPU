// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/14

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

    wire m_overflow;

    ADD m_add(A, ~B + 1, Signed, S, Zero, m_overflow, Negative);

    // overflow
    // if signed: pos - neg => neg
    //            or
    //            neg - pos => pos
    // if unsigned: small - big
    //              or
    //              small - small or big - big but get big
    assign Overflow = (
        Signed ? (
            (A[31] & ~B[31] & ~S[31]) | (~A[31] & B[31] & S[31])
        ) : (
            (~A[31] & B[31]) | ((A[31] == B[31]) & S[31])
        )
    );

endmodule
