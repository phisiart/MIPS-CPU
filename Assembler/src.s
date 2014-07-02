addr:
    lw $4 4($3) # User code starts at [0x00400000]
    nop
    sw $4 4($3)
    lui $4 1000 # Whatever comment
    add $4 $3 $4
    addu $4 $3 $4
    sub $4 $3 $4
    subu $4 $3 $4
    and $4 $3 $4
    or $4 $3 $4
    xor $4 $3 $4
    nor $4 $3 $4
    addi $4 $4 100
    addiu $4 $3 200
    sll $4 $3 10
    srl $4 $3 10
    sra $4 $3 10
    slt $4 $4 $4
    slti $4 $4 10
    beq $0 $0 addr
    bne $0 $0 addr
    blez $3 addr
    bltz $4 addr
    bgtz $5 addr
    j addr
    jal addr
    jalr $3 $31
    jr $3