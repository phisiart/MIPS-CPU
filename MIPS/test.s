.text

main:
	# this is basically the same as main.s
	# except all the code dealing with peripherals
	# initialize $s1, $s2 directly for test

	##########################################
	# $s0: UART_CON ADDRESS 	0x40000020
	# $s1: PARAMETER 1
	# $s2: PARAMETER 2
	# $s3: GREATEST COMMON DIVISOR
	# $s4: DECODE AN0
	# $s5: DECODE AN1
	# $s6: DECODE AN2
	# $s7: DECODE AN3
	# $t7: INDEX OF AN TO SHOW
	##########################################

	lui  $t0, 16384 	# $t0 = 0x40000000

	# set $s0 to the address of UART_CON
	addi $s0, $t0, 32

	addi $s1, $zero, 54
	addi $s2, $zero, 45

	# decode the parameter
	sll $a0, $s1, 24
	srl $a0, $a0, 28

	jal DECODER
	sw $v0, -20($s0)

	sll $s4, $v0, 5
	addi $t0, $zero, 7
	or $s4, $s4, $t0
	sw $s4, -12($s0)


	sll $a0, $s1, 28
	srl $a0, $a0, 28
	jal DECODER
	sw $v0, -20($s0)
	sll $s5, $v0, 5
	addi $t0, $zero, 11
	or $s5, $s5, $t0

	sw $s5, -12($s0)

	sll $a0, $s2, 24
	srl $a0, $a0, 28
	jal DECODER
	sw $v0, -20($s0)
	sll $s6, $v0, 5
	addi $t0, $zero, 13
	or $s6, $s6, $t0

	sw $s6, -12($s0)

	sll $a0, $s2, 28
	srl $a0, $a0, 28
	jal DECODER
	sw $v0, -20($s0)
	sll $s7, $v0, 5
	addi $t0, $zero, 14
	or $s7, $s7, $t0

	sw $s7, -12($s0)

	# set $t7 to 0
	add $t7, $zero, $zero

	# find the greatest common divisor
	add $a0, $s1, $zero
	add $a1, $s2, $zero
	jal Euclidean
	add $s3, $v0, $zero
	sw  $s3, -20($s0)
	j main

Euclidean:
	slt $t0, $a0, $a1
	beq $t0, $zero, NOT_SWITCH

	# switch $a0 and $a1 to make sure $a0 > $a1
	add $t0, $a0, $zero
	add $a0, $a1, $zero
	add $a1, $t0, $zero

NOT_SWITCH:
	sub $t0, $a0, $a1

	# if $t0 == 0, then we have found the greatest common divisor
	beq $t0, $zero, Euclidean_RETURN
	add $a0, $t0, $zero
	j Euclidean

Euclidean_RETURN:
	add $v0, $a0, $zero
	jr $ra

DECODER:
	# take in an 4 bits number in $a0
	# decode it to an 7 bits DIGITs
	# retrun it in $v0

	# 0 -> 000_0001 (1)
	bne $a0, $zero, DECODER_NOT_0
	addi $v0, $zero, 1
	j DECODER_RETURN

DECODER_NOT_0:
	addi $t0, $zero, 1
	bne $a0, $t0, DECODER_NOT_1

	# 1 -> 100_1111 (79)
	addi $v0, $zero, 79
	j DECODER_RETURN

DECODER_NOT_1:
	addi $t0, $zero, 2
	bne $a0, $t0, DECODER_NOT_2

	# 2 -> 001_0010 (18)
	addi $v0, $zero, 18
	j DECODER_RETURN

DECODER_NOT_2:
	addi $t0, $zero, 3
	bne $a0, $t0, DECODER_NOT_3

	# 3 -> 000_0110 (6)
	addi $v0, $zero, 6
	j DECODER_RETURN

DECODER_NOT_3:
	addi $t0, $zero, 4
	bne $a0, $t0, DECODER_NOT_4

	# 4 -> 100_1100 (76)
	addi $v0, $zero, 76
	j DECODER_RETURN

DECODER_NOT_4:
	addi $t0, $zero, 5
	bne $a0, $t0, DECODER_NOT_5

	# 5 -> 010_0100 (36)
	addi $v0, $zero, 36
	j DECODER_RETURN

DECODER_NOT_5:
	addi $t0, $zero, 6
	bne $a0, $t0, DECODER_NOT_6

	# 6 -> 010_0000 (32)
	addi $v0, $zero, 32
	j DECODER_RETURN

DECODER_NOT_6:
	addi $t0, $zero, 7
	bne $a0, $t0, DECODER_NOT_7

	# 7 -> 000_1111 (15)
	addi $v0, $zero, 15
	j DECODER_RETURN

DECODER_NOT_7:
	addi $t0, $zero, 8
	bne $a0, $t0, DECODER_NOT_8

	# 8 -> 000_0000 (0)
	addi $v0, $zero, 0
	j DECODER_RETURN

DECODER_NOT_8:
	addi $t0, $zero, 9
	bne $a0, $t0, DECODER_NOT_9

	# 9 -> 000_0100 (4)
	addi $v0, $zero, 4
	j DECODER_RETURN

DECODER_NOT_9:
	addi $t0, $zero, 10
	bne $a0, $t0, DECODER_NOT_A

	# A -> 000_1000 (8)
	addi $v0, $zero, 8
	j DECODER_RETURN

DECODER_NOT_A:
	addi $t0, $zero, 11
	bne $a0, $t0, DECODER_NOT_B

	# B -> 110_0000 (96)
	addi $v0, $zero, 96
	j DECODER_RETURN

DECODER_NOT_B:
	addi $t0, $zero, 12
	bne $a0, $t0, DECODER_NOT_C

	# C -> 011_0001 (49)
	addi $v0, $zero, 49
	j DECODER_RETURN

DECODER_NOT_C:
	addi $t0, $zero, 13
	bne $a0, $t0, DECODER_NOT_D

	# D -> 100_0010 (66)
	addi $v0, $zero, 66
	j DECODER_RETURN

DECODER_NOT_D:
	addi $t0, $zero, 14
	bne $a0, $t0, DECODER_NOT_E

	# E -> 011_0000 (48)
	addi $v0, $zero, 48
	j DECODER_RETURN

DECODER_NOT_E:
	# F -> 011_1000 (56)
	addi $v0, $zero, 56
	j DECODER_RETURN

DECODER_RETURN:
	jr $ra
	