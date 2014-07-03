## A Simple MIPS Assembler (still under construction...)

This program turns MIPS assembly language into bitcode. It is implemented with ply (python lex and yacc) under python.

### Important notes:
* There are **two** memories in a MIPS machine: the `data memory` and the `instruction memory`. The CPU has the `PC` register storing the address of the current instruction.

* The user-written code starts at `0x00400000` in the instruction memory. The address grows by 4 bytes each instruction. So the following instructions would have addresses `0x00400004`, `0x00400008` ...

* Addresses `0x0080****` are for system code. I'm figuring them out.

* The `branch` and `jump` instructions are tricky. I'm writting a documentation for them so that you will get it right.

### Branches:

This CPU implements 5 types of branching instructions: `beq`, `bne`, `blez`, `bgtz`, and `bltz`.

For branches, the addresses are calculated on an `offset` basis. The [15:0] of the instruction is the offset of `the instruction we are branching to` from `the next instruction`. For example, consider this sequence of instructions:

            li $s2 10         # line 0
            li $s0 1          # line 1
    loop:   add $s1 Ss1 Ss0   # line 2
            addi $s0 $s0 1    # line 3
            bne $s0 Ss2 loop  # line 4
            add $v0 $s1 $0    # line 5
            jr $ra            # line 6
            
Notice the `bne` in line 4. It directs to the `loop` tag in line 2. The offset is `2 - (4 + 1) = -3`.

How do we store the offset in the instruction? We store it as a 16-bit **signed** integer. In our case here, `-3` is just `0xFFFD` (or `2^16 - 3`).

The CPU would load this 16-bit integer, multiply it by 4, and extend it to a 32-bit integer. Take a look at how to make it right.

* If the offset is positive (namely `offset[15] = 0`), it is fairly straight-foward. You shift the integer left by 2 bits, adding 2 zero's on the right side, and then add 14 zero's to the left to extend it.

* If the offset is negative (namely `offset[15] = 1`). Then the 16-bit integer stored is `2^16 + offset`, something like `1xxx,xxxx,xxxx,xxxx`. Shifting the integer left by 2 bits results in a 18-bit integer `2^18 + offset * 4`, something like `1x,xxxx,xxxx,xxxx,xx00`. We want to extend the integer so that the 32-bit would be `2^32 + offset * 4`. It turns out that the result is just `1111,1111,1111,111x,xxxx,xxxx,xxxx,xx00`. So we just need to add 14 one's to the left.

Having considered the two cases, we now know what to do. First, we shift the 16-bit offset by 2 bits, adding 2 zero's on the right. Then, we extend the 18-bit integer to 32 bits, what to add on the left is the sign bit of the original integer.

### Jumps:

This CPU implements 4 types of jumping instructions: `j`, `jal`, `jr`, and `jalr`.

`jr` and `jalr` are simple, because they use registers to find addresses. Our concern is `j` and `jal`.

The jumping direction is stored in the [25:0] bits. You 1) take it out, shift it left by 2 bits, adding 2 zero's on the right, and 2) splice it with (PC + 4)[31:28].


### Difference with QtSpim:

It turns out QtSpim isn't implementing a standard MIPS. If you look at the bit-code it generates, you will find that something is different.

* The offset of branches in QtSpim is from the current instruction, not from the next instruction. So in the example above, the offset would be -2, not -3.

* The `jalr` instruction is defined as `jalr rs rd` and `rs` and `rd` are stored in [25:21] and [20:16], but it seems that QtSpim stores them up side down. In QtSpim, `rs` is stored in [20:16] and `rd` is stored in [25:21].

### Features:

* comments are correctly ignored
* register names are correctly recognized

### Usage:

* to be done...
