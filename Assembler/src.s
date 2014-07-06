.kernal                 # starting from 0x80000000
    j reset
    j interrupt
    j exception
reset:
    addi $ra $0 1
    sll $ra $ra 22      # $ra = 0x00400000
    jr $ra
interrupt:
    addi $ra $0 1
    sll $ra $ra 22      # $ra = 0x00400000
    jr $ra
exception:
    addi $ra $0 1
    sll $ra $ra 22      # $ra = 0x00400000
    jr $ra

.text                   # starting from 0x00400000
main:
    addi $s2 $0 10
    addi $s0 $0 1
loop:   add $s1 $s1 $s0
    addi $s0 $s0 1
    bne $s0 $s2 loop
    add $v0 $s1 $0
    jr $ra