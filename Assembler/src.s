        li $s2 10         # line 0
        li $s0 1          # line 1
loop:   add $s1 $s1 $s0   # line 2
        addi $s0 $s0 1    # line 3
        bne $s0 $s2 loop  # line 4
        add $v0 $s1 $0    # line 5
        jr $ra            # line 6