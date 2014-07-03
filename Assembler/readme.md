## A Simple MIPS Assembler (still under construction...)

This program turns MIPS assembly language into bitcode. It is implemented with ply (python lex and yacc) under python.

### Important notes:
* There are **two** memories in a MIPS machine: the `data memory` and the `instruction memory`. The CPU has the `PC` register storing the address of the current instruction.

* The user-written code starts at `0x00400000` in the instruction memory. The address grows by 4 bytes each instruction. So the following instructions would have addresses `0x00400004`, `0x00400008` ...

* Addresses `0x0080****` are for system code. I'm figuring them out.

* The `branch` and `jump` instructions are tricky. I'm writting a documentation for them so that you will get it right.

### Branches:

This CPU implements 5 branching instructions: `beq`, `bne`, `blez`, `bgtz`, and `bltz`.

For branches, the addresses are calculated on an `offset` basis. The [15:0] of the instruction is 

### Features:

* comments are correctly ignored
* register names are correctly recognized

### Usage:

* to be done...
