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

READ_LOOP_1:
	# this loop is to read the first parameter from UART
	lw  $t0, 0($s0)
	sll $t0, $t0, 30
	srl $t0, $t0, 31 	# $t0: 0 bit is RX_EFF
	bne $t0, $zero, EXIT_READ_LOOP_1
	j READ_LOOP_1

EXIT_READ_LOOP_1:
	# get the first parameter into $a0
	lw  $s1, -4($s0)
	sw 	$s1, -20($s0)
	j READ_LOOP_1
	