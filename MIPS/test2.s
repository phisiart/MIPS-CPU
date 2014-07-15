.text
	lui  $t0, 16384 	# $t0 = 0x40000000
	# set $s0 to the address of UART_CON
	addi $s0, $t0, 32