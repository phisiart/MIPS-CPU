main:
	# initialize the address of peripherals

	##########################################
	# $s0: UART_CON ADDRESS 	0x40000020
	# $s1: UART_RXD ADDRESS 	0x4000001c
	# $s2: UART_TXD ADDRESS 	0x40000018
	# $s3: TCON 	ADDRESS 	0x40000008
	# $s4: TH 		ADDRESS 	0x40000000
	# $s5: LEDs		ADDRESS 	0x4000000c
	# $s6: DIGITs	ADDRESS 	0x40000014
	##########################################

	lui  $t0, 16384 	# $t0 = 0x40000000

	# set $s0 to the address of UART_CON
	addi $s0, $t0, 32

	# set $s1 to the address of UART_RXD
	addi $s1, $t0, 28

	# set $s2 to the address of UART_TXD
	addi $s2, $t0, 24

	# set $s3 to the address of TCON
	addi $s3, $t0, 8

	# set $s4 to the address of TH
	addi $s4, $t0, 0

	# set $s5 to the address of LEDs
	addi $s5, $t0, 5

	# set $s6 to the address of DIGITs
	addi $s6, $t0, 20

READ_LOOP_1:
	# this loop is to read the first parameter from UART
	lw  $t0, 0($s0)
	sll $t0, $t0, 30
	srl $t0, $t0, 31 	# $t0: 0 bit is RX_EFF
	bne $t0, $zero, EXIT_READ_LOOP_1
	j READ_LOOP_1

EXIT_READ_LOOP_1:
	# get the first parameter into $a0
	lw  $a0, 0($s1)

READ_LOOP_2:
	# this loop is to read the second parameter from UART
	lw  $t0, 0($s0)
	sll $t0, $t0, 30
	srl $t0, $t0, 31 	# $t0: 0 bit is RX_EFF
	bne $t0, $zero, EXIT_READ_LOOP_2
	j READ_LOOP_2

EXIT_READ_LOOP_2:
	lw 	$a1, 0($s2)
	jal Euclidean

	# use the LEDs to show the result
	sw  $v0, 0($s5)

	# save the result to UART_TXD
	sw  $v0, 0($s2)
SEND_LOOP:
	# this loop is to send the result through UART
	lw  $t0, 0($s0)
	sll $t0, $t0, 29
	srl $t0, $t0, 31 	# $t0: 0 bit is TX_STATUS
	bne $t0, $zero, SEND
	j SEND_LOOP 

SEND:
	# now the UART_Sender is available
	# set TX_EN to send the result in UART_TXD
	addi $t0, $zero, 1
	sw   $t0, 0($s0)
	sw 	 $zero, 0($s0)
	j READ_LOOP_1

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
