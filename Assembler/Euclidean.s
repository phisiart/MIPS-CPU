main:
	nop
	nop
	addi $a0, $zero, 10
	addi $a1, $zero, 8
	jal Euclidean
	add $a0, $v0, $zero # a0 is now the answer

Euclidean:
	# save $s0, $s1 to the stack
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)

	# load $a0, $a1 into $s0, $s1
	add $s0, $a0, $zero
	add $s1, $a1, $zero
LOOP:
	slt $t0, $s0, $s1
	beq $t0, $zero, NOT_SWITCH

	# switch $s0 and $s1 to make sure $s0 > $s1
	add $t0, $s0, $zero
	add $s0, $s1, $zero
	add $s1, $t0, $zero

NOT_SWITCH:
	sub $t0, $s0, $s1

	# if $t0 == 0, then we have found the greatest common divisor
	beq $t0, $zero, RETURN
	add $s0, $t0, $zero
	j LOOP

RETURN:
	add $v0, $s0, $zero
	lw $s1, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 8
	jr $ra
