// Zhixun TAN
// Created: 2014/6/14
// Last modified: 2014/6/14

// ------------------------------------
// Module Logic
// Input:
//     A[31:0]
//     B[31:0]
//     FT[3:0] : The last 4 bits of ALUFunc
// Output:
//     S[31:0]

module Logic(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire[3:0] FT,
    output wire[31:0] S
);

    parameter FT_LOGIC_AND = 4'b1000;
    parameter FT_LOGIC_OR  = 4'b1110;
    parameter FT_LOGIC_XOR = 4'b0110;
    parameter FT_LOGIC_NOR = 4'b0001;
    parameter FT_LOGIC_A   = 4'b1010;

    parameter ERROR_OUTPUT = 1;

    assign S = (
        (FT == FT_LOGIC_AND) ? (A & B) : (
            (FT == FT_LOGIC_OR) ? (A | B) : (
                (FT == FT_LOGIC_XOR) ? (A ^ B) : (
                    (FT == FT_LOGIC_NOR) ? ~(A | B) : (
                        (FT == FT_LOGIC_A) ? A : (
                            ERROR_OUTPUT
                        )
                    )
                )
            )
        )
    );

endmodule