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
	addi $s0, $t0, 32

	add  $s3, $t0, $zero

	# use the LEDs to show the result
	sw  $s3, -20($s0)
	# save the result to UART_TXD
	sw  $s3, -8($s0)
	