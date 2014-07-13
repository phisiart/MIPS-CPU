# -*- coding: utf-8 -*-

import ply.yacc as yacc

from mipslex import tokens

addr = 0x00400000
kernaladdr = 0x80000000
textaddr = 0x00400000
kernal = False

addrTags = {}

# register
# (5bit index, 'register name')
#
# instruction
# (32bit code, 'instruction string')
#
# immediate
# immediate

def putins(ins):
    global addr
    global kernaladdr
    global textaddr
    global kernal

    # global addrTags
    # if (addrTags.has_key(ins[0])):
    #     print '[0x%08X]  0x%08X  %s:' % (ins[0], ins[1], addrTags[ins[0]])
    #     print ' ' * 26 + '%s' % ins[2],
    # else:
    #     print '[0x%08X]  0x%08X  %s' % (ins[0], ins[1], ins[2]),
    # if len(ins) == 4:
    #     if (type(ins[3]) == int):
    #         print '  (%X)' % ins[3]
    #     else:
    #         print '  %s' % ins[3]
    # else:
    #     print
    addr += 4
    if kernal:
        kernaladdr += 4
    else:
        textaddr += 4


def p_program(p):
    '''program : program instruction
               | instruction'''
    if len(p) == 3:
        if p[2] != None:
            p[0] = p[1] + [p[2]]
        else:
            p[0] = p[1]
    else:
        if p[1] != None:
            p[0] = [p[1]]
        else:
            p[0] = []

def p_kernal(p):
    '''instruction : DOT KERNAL'''
    global kernal
    global addr
    kernal = True
    addr = kernaladdr
    pass

def p_text(p):
    '''instruction : DOT TEXT'''
    global kernal
    global addr
    kernal = False
    addr = textaddr
    pass

def p_tag(p):
    '''instruction : IDENTIFIER COLON'''
    addrTags[addr] = p[1]

def p_nop(p):
    '''instruction : NOP'''
    p[0] = [addr, 0, 'nop']
    putins(p[0])
    
def p_lw(p):
    '''instruction : LW register NUMBER LBRACKET register RBRACKET'''
    p[0] = [
        addr,
        (0b100011 << 26) | (p[5][0] << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'lw ' + p[2][1] + ' ' + str(p[3]) + '(' + p[5][1] + ')'
    ]
    putins(p[0])

def p_sw(p):
    '''instruction : SW register NUMBER LBRACKET register RBRACKET'''
    p[0] = [
        addr,
        (0b101011 << 26) | (p[5][0] << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'sw ' + p[2][1] + ' ' + str(p[3]) + '(' + p[5][1] + ')'
    ]
    putins(p[0])

def p_lui(p):
    '''instruction : LUI register NUMBER'''
    p[0] = [
        addr,
        (0b001111 << 26) | (0 << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'lui ' + p[2][1] + ' ' + str(p[3])
    ]
    putins(p[0])

def p_add(p):
    '''instruction : ADD register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100000),
        'add ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_addu(p):
    '''instruction : ADDU register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100001),
        'addu ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_sub(p):
    '''instruction : SUB register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100010),
        'sub ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_subu(p):
    '''instruction : SUBU register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100011),
        'subu ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_addi(p):
    '''instruction : ADDI register register NUMBER'''
    p[0] = [
        addr,
        (0b001000 << 26) | (p[3][0] << 21) | (p[2][0] << 16) | (p[4] % (1 << 16)),
        'addi ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_addiu(p):
    '''instruction : ADDIU register register NUMBER'''
    p[0] = [
        addr,
        (0b001001 << 26) | (p[3][0] << 21) | (p[2][0] << 16) | (p[4] % (1 << 16)),
        'addiu ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_and(p):
    '''instruction : AND register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100100),
        'and ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_or(p):
    '''instruction : OR register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100101),
        'or ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_xor(p):
    '''instruction : XOR register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100110),
        'xor ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_nor(p):
    '''instruction : NOR register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100111),
        'nor ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_andi(p):
    '''instruction : ANDI register register NUMBER'''
    p[0] = [
        addr,
        (0b001100 << 26) | (p[3][0] << 21) | (p[2][0] << 16) | (p[4] % (1 << 16)),
        'andi ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_sll(p):
    '''instruction : SLL register register NUMBER'''
    p[0] = [
        addr,
        (0 << 26) | (0 << 21) | (p[3][0] << 16) | (p[2][0] << 11) | ((p[4] % (1 << 5)) << 6) | (0 << 0),
        'sll ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_srl(p):
    '''instruction : SRL register register NUMBER'''
    p[0] = [
        addr,
        (0 << 26) | (0 << 21) | (p[3][0] << 16) | (p[2][0] << 11) | ((p[4] % (1 << 5)) << 6) | (0b000010 << 0),
        'srl ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_sra(p):
    '''instruction : SRA register register NUMBER'''
    p[0] = [
        addr,
        (0 << 26) | (0 << 21) | (p[3][0] << 16) | (p[2][0] << 11) | ((p[4] % (1 << 5)) << 6) | (0b000011 << 0),
        'sra ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_slt(p):
    '''instruction : SLT register register register'''
    p[0] = [
        addr,
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0x2A),
        'slt ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    ]
    putins(p[0])

def p_slti(p):
    '''instruction : SLTI register register NUMBER'''
    p[0] = [
        addr,
        (0b001010 << 26) | (p[3][0] << 21) | (p[2][0] << 16) | (p[4] % (1 << 16)),
        'slti ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_sltiu(p):
    '''instruction : SLTIU register register NUMBER'''
    p[0] = [
        addr,
        (0b001011 << 26) | (p[3][0] << 21) | (p[2][0] << 16) | (p[4] % (1 << 16)),
        'sltiu ' + p[2][1] + ' ' + p[3][1] + ' ' + str(p[4])
    ]
    putins(p[0])

def p_beq(p):
    '''instruction : BEQ register register IDENTIFIER'''
    p[0] = [
        addr,
        (0b000100 << 26) | (p[2][0] << 21) | (p[3][0] << 16) | (0),
        'beq ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4],
        p[4]
    ]
    putins(p[0])

def p_bne(p):
    '''instruction : BNE register register IDENTIFIER'''
    p[0] = [
        addr,
        (0b000101 << 26) | (p[2][0] << 21) | (p[3][0] << 16) | (0),
        'bne ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4],
        p[4]
    ]
    putins(p[0])

def p_blez(p):
    '''instruction : BLEZ register IDENTIFIER'''
    p[0] = [
        addr,
        (0b000110 << 26) | (p[2][0] << 21) | (0 << 16) | (0),
        'blez ' + p[2][1] + ' ' + p[3],
        p[3]
    ]
    putins(p[0])

def p_bgtz(p):
    '''instruction : BGTZ register IDENTIFIER'''
    p[0] = [
        addr,
        (0b000111 << 26) | (p[2][0] << 21) | (0 << 16) | (0),
        'bgtz ' + p[2][1] + ' ' + p[3],
        p[3]
    ]
    putins(p[0])

def p_bltz(p):
    '''instruction : BLTZ register IDENTIFIER'''
    p[0] = [
        addr,
        (0b000001 << 26) | (p[2][0] << 21) | (0 << 16) | (0),
        'bltz ' + p[2][1] + ' ' + p[3],
        p[3]
    ]
    putins(p[0])

def p_j(p):
    '''instruction : J IDENTIFIER'''
    p[0] = [
        addr,
        (0b000010 << 26) | (0),
        'j ' + p[2],
        p[2]
    ]
    putins(p[0])

def p_jal(p):
    '''instruction : JAL IDENTIFIER'''
    p[0] = [
        addr,
        (0b000011 << 26) | (0),
        'jal ' + p[2],
        p[2]
    ]
    putins(p[0])

def p_jr(p):
    '''instruction : JR register'''
    p[0] = [
        addr,
        (0b000000 << 26) | (p[2][0] << 21) | (0 << 6) | (0b001000),
        'jr ' + p[2][1]
    ]
    putins(p[0])

def p_jalr(p):
    '''instruction : JALR register register'''
    p[0] = [
        addr,
        (0b000000 << 26) | (p[2][0] << 21) | (0 << 16) | (p[3][0] << 11) | (0 << 6) | (9),
        'jalr ' + p[2][1] + ' ' + p[3][1]
    ]
    putins(p[0])

def p_reg_zero(p):
    '''register : REGPREFIX ZERO'''
    p[0] = [0, '$zero']

def p_reg_at(p):
    '''register : REGPREFIX AT'''
    p[0] = [1, '$at']

def p_reg_v(p):
    '''register : REGPREFIX V'''
    index = int(p[2][1:])
    p[0] = [index + 2, '$v%d' % index]

def p_reg_a(p):
    '''register : REGPREFIX A'''
    index = int(p[2][1:])
    p[0] = [index + 4, '$a%d' % index]

def p_reg_t(p):
    '''register : REGPREFIX T'''
    index = int(p[2][1:])
    if index < 8:
        p[0] = [index + 8, '$t%d' % index]
    else:
        p[0] = [index + 16, '$t%d' % index]

def p_reg_s(p):
    '''register : REGPREFIX S'''
    index = int(p[2][1:])
    p[0] = [index + 16, '$s%d' % index]

def p_reg_k(p):
    '''register : REGPREFIX K'''
    index = int(p[2][1:])
    p[0] = [index + 26, '$k%d' % index]

def p_reg_gp(p):
    '''register : REGPREFIX GP'''
    p[0] = [28, '$gp']

def p_reg_sp(p):
    '''register : REGPREFIX SP'''
    p[0] = [29, '$sp']

def p_reg_fp(p):
    '''register : REGPREFIX FP'''
    p[0] = [30, '$fp']

def p_reg_ra(p):
    '''register : REGPREFIX RA'''
    p[0] = [31, '$ra']

def p_register(p):
    '''register : REGPREFIX NUMBER'''
    p[0] = [p[2], '$' + str(p[2])]

def p_error(p):
    if (p == None):
        print('error')
    else:
        print('\033[93mParser error\033[0m at or near \033[93m%s\033[0m of line %d' % (p.value, p.lexer.lineno))

params = {}

# def p_error(p):
#     print('error!')

# Build parser.
parser = yacc.yacc()

if __name__ == '__main__':
    addr = 0x00400000
    data = '''addr: lw $4 4($3) # User code starts at [0x00400000]
    nop
    sw $4 4($3)
    lui $4 1000 # Whatever comment
    add $4 $3 $4
    addu $4 $3 $4
    sub $4 $3 $4
    subu $4 $3 $4
    and $4 $3 $4
    or $4 $3 $4
    xor $4 $3 $4
    nor $4 $3 $4
    addi $4 $4 100
    addiu $4 $3 200
    sll $4 $3 10
    srl $4 $3 10
    sra $4 $3 10
    slt $4 $4 $4
    slti $4 $4 10
    beq $0 $0 addr
    bne $0 $0 addr
    blez $3 addr
    bltz $4 addr
    bgtz $5 addr
    j addr
    jal addr
    jalr $3 $31
    jr $3
    '''
    parser.parse(data)
    print addrTags