        addi $s2 $zero 10         # line 1
        addi $s0 $zero 1          # line 2
loop:   add $s1 $s1 $s0   # line 3
        addi $s0 $s0 1    # line 4
        bne $s0 $s2 loop  # line 5
        add $v0 $s1 $0    # line 6
        jr $ra            # line 7