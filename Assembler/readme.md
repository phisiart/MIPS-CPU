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
    loop:   add $s1 $s1 $s0   # line 2
            addi $s0 $s0 1    # line 3
            bne $s0 $s2 loop  # line 4
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

### Tutorial:

Now I'm going to show you how to use the assembler.

There are 3 python code files in the Assembler directory: `lex.py`, `parser.py`, and `assembler.py`. You will be using the `assembler.py` file only. There are generally two ways of using the assembler.

1) The first way to use the assembler is through command line. You go to the `Assembler` directory and type this command in the terminal:

    python assembler.py src.s
    
Note that `src.s` can be whatever file of your MIPS source code. 

In our case, the source code is

            li $s2 10         # line 1
            li $s0 1          # line 2
    loop:   add $s1 $s1 $s0   # line 3
            addi $s0 $s0 1    # line 4
            bne $s0 $s2 loop  # line 5
            add $v0 $s1 $0    # line 6
            jr $ra            # line 7

As soon as you press ENTER, the assembler gives you this output:

    --------------------------------------------------------------------------------
                                     MIPS Assembler

    Parser error at or near $ of line 1
    [0x00400000]  0x02308820  loop:
                              add $s1 $s1 $s0
    [0x00400004]  0x22100001  addi $s0 $s0 1
    [0x00400008]  0x1612FFFD  bne $s0 $s2 loop
                              (-> -3)
    [0x0040000C]  0x02201020  add $v0 $s1 $0
    [0x00400010]  0x03E00008  jr $ra

Oops! It says that you have a parsing error at line 1. Let's have a look at line 1. The code is

    li $2 10

You should notice that our CPU does not support the `li` instruction. That's the problem. Now we have to change the first two lines of code into

    addi $s2 $zero 10
    addi $s0 $zero 1

And run the assembler again. Now we are getting the correct answer. The style of the output is:

    [address] bitcode instruction

Note that if a tag is in the code (e.g. `loop` in the example), it will be shown in the output.

What is the `(-> -3)`? It shows the offset of the branch direction.

2) You may notice that the output style isn't what you want. So here comes the second usage. You can use the assembler through python code.

First, make sure your python code file is in the same directory where the 3 assembler files are stored, or open a python in the terminal in this directory.

Second, write the following python code:

    from assembler import *

This loads all the stuff in `assembler.py`. Then you write:

    insts = asbl_file('src.s')

`asbl_file` is a function that takes in a file name, and assemble the MIPS code in it. It returns a list of instructions. You may want to check what it has returned, so just write:

    print insts

Then you get something like

    [[4194304, 538050570, 'addi $s2 $zero 10'], [4194308, 537919489, 'addi $s0 $zero 1'], [4194312, 36735008, 'add $s1 $s1 $s0'], [4194316, 571473921, 'addi $s0 $s0 1'], [4194320, 370343933, 'bne $s0 $s2 loop', -3], [4194324, 35655712, 'add $v0 $s1 $0'], [4194328, 65011720, 'jr $ra']]

You can see that each element in the list is also a list, storing info of an instruction. Take the first instruction as an example:

    [4194304, 538050570, 'addi $s2 $zero 10']

The first element is the address of this instruction in the memory, the second is the bitcode, the third is just the instruction itself.

Now you know what you've get. You can do anything with it!
