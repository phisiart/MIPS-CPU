.text
    nop
    lw  $s0 0($sp)
    sw  $s0 0($sp)
    lui $s0 10
    add $s0 $s1 $s2
    addu $s0 $s1 $s2
    sub $s0 $s1 $s2
    subu $s0 $s1 $s2
    addi $s0 $s1 10
    addiu $s0 $s1 10
    and $s0 $s1 $s2
    or $s0 $s1 $s2
    xor $s0 $s1 $s2
    nor $s0 $s1 $s2
    andi $s0 $s1 10
    sll $s0 $s1 5
    srl $s0 $s1 5
    sra $s0 $s1 5
    slt $s0 $s1 $s2
    slti $s0 $s1 5
LOC:
    sltiu $s0 $s1 5
    beq $s0 $s0 LOC
    bne $s0 $s0 LOC
    blez $s0 LOC
    bgtz $s0 LOC
    bltz $s0 LOC
    j LOC
    jal LOC
    jr $ra
    jalr $ra $ra
