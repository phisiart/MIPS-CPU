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
    pass

def p_addu(p):
    pass

def p_sub(p):
    pass

def p_subu(p):
    pass

def p_addi(p):
    pass

def p_addiu(p):
    pass

def p_and(p):
    pass

def p_or(p):
    pass

def p_xor(p):
    pass

def p_nor(p):
    pass

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
    lui $4 1000
    '''
    parser.parse(data)