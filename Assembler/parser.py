# -*- coding: utf-8 -*-

import ply.yacc as yacc

from lex import tokens

# register
# (5bit index, 'register name')
#
# instruction
# (32bit code, 'instruction string')
#
# immediate
# immediate

def putins(ins):
    print '0x%08X  # %s' % (ins[0], ins[1])

def p_program(p):
    '''program : program instruction
               | instruction'''
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else:
        p[0] = [p[1]]

# def p_nop(p):
#     '''nop :'''
#     p[0] = (0, 'nop')
    
def p_lw(p):
    '''instruction : LW register NUMBER LBRACKET register RBRACKET'''
    p[0] = (
        (0b100011 << 26) | (p[5][0] << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'lw ' + p[2][1] + ' ' + str(p[3]) + '(' + p[5][1] + ')'
    )
    putins(p[0])

def p_sw(p):
    '''instruction : SW register NUMBER LBRACKET register RBRACKET'''
    p[0] = (
        (0b101011 << 26) | (p[5][0] << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'sw ' + p[2][1] + ' ' + str(p[3]) + '(' + p[5][1] + ')'
    )
    putins(p[0])

def p_lui(p):
    '''instruction : LUI register NUMBER'''
    p[0] = (
        (0b001111 << 26) | (0 << 21) | (p[2][0] << 16) | (p[3] % (1 << 16)),
        'lui ' + p[2][1] + ' ' + str(p[3])
    )
    putins(p[0])

def p_add(p):
    '''instruction : ADD register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100000),
        'add ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_addu(p):
    '''instruction : ADDU register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100001),
        'addu ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_sub(p):
    '''instruction : SUB register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100010),
        'sub ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_subu(p):
    '''instruction : SUBU register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100011),
        'subu ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_addi(p):
    pass

def p_addiu(p):
    pass

def p_and(p):
    '''instruction : AND register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100100),
        'and ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_or(p):
    '''instruction : OR register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100101),
        'or ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_xor(p):
    '''instruction : XOR register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100110),
        'xor ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_nor(p):
    '''instruction : NOR register register register'''
    p[0] = (
        (0 << 26) | (p[3][0] << 21) | (p[4][0] << 16) | (p[2][0] << 11) | (0b00000100111),
        'nor ' + p[2][1] + ' ' + p[3][1] + ' ' + p[4][1]
    )
    putins(p[0])

def p_andi(p):
    pass

def p_sll(p):
    pass

def p_srl(p):
    pass

def p_sra(p):
    pass

def p_slt(p):
    pass

def p_slti(p):
    pass

def p_sltiu(p):
    pass

def p_beq(p):
    pass

def p_bne(p):
    pass

def p_blez(p):
    pass

def p_bgtz(p):
    pass

def p_bltz(p):
    pass

def p_j(p):
    pass

def p_jal(p):
    pass

def p_jr(p):
    pass

def p_jalr(p):
    pass

def p_register(p):
    '''register : REGPREFIX NUMBER'''
    p[0] = (p[2], '$' + str(p[2]))

params = {}

# def p_error(p):
#     print('error!')

# Build parser.
parser = yacc.yacc()


if __name__ == '__main__':
    data = '''
    lw $4 4($3)
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
    '''
    parser.parse(data)