# -*- coding: utf-8 -*-
import ply.lex as lex
import re

# Reserved keywords.
# 保留关键字
reserved = {
    'NOP'   : r'(?i)nop'    ,
    'LW'    : r'(?i)lw'     ,
    'SW'    : r'(?i)sw'     ,
    'LUI'   : r'(?i)lui'    ,
    'ADD'   : r'(?i)add'    ,
    'ADDU'  : r'(?i)addu'   ,
    'SUB'   : r'(?i)sub'    ,
    'SUBU'  : r'(?i)subu'   ,
    'ADDI'  : r'(?i)addi'   ,
    'ADDIU' : r'(?i)addiu'  ,
    'AND'   : r'(?i)and'    ,
    'OR'    : r'(?i)or'     ,
    'XOR'   : r'(?i)xor'    ,
    'NOR'   : r'(?i)nor'    ,
    'NOR'   : r'(?i)nor'    ,
    'ANDI'  : r'(?i)andi'   ,
    'SLL'   : r'(?i)sll'    ,
    'SRL'   : r'(?i)srl'    ,
    'SRA'   : r'(?i)sra'    ,
    'SLT'   : r'(?i)slt'    ,
    'SLTI'  : r'(?i)slti'   ,
    'SLTIU' : r'(?i)sltiu'  ,
    'BEQ'   : r'(?i)beq'    ,
    'BNE'   : r'(?i)bne'    ,
    'BLEZ'  : r'(?i)blez'   ,
    'BGTZ'  : r'(?i)bgtz'   ,
    'BLTZ'  : r'(?i)bltz'   ,
    'J'     : r'(?i)j'      ,
    'JAL'   : r'(?i)jal'    ,
    'JR'    : r'(?i)jr'     ,
    'JALR'  : r'(?i)jalr'   ,
}

# List of token names. This is always required.
# token 列表的名字一定要叫 tokens
tokens = [
    'IDENTIFIER',   # identifier
    'LBRACKET',     # (
    'RBRACKET',     # )
    'NUMBER',       # number
    'REGPREFIX',    # $
] + list(reserved.keys())

# Regular expression rules for simple tokens
# 这些定义一定要用 t_ 前缀加上之前定义的 token 名
t_LBRACKET = r'\('
t_RBRACKET = r'\)'
t_REGPREFIX = r'\$'

# 有的 token 也可以被定义为函数，参数为识别出来的 token，返回值还是 token

def t_NUMBER(t):
    r'[0-9][0-9a-zA-Z]*'
    t.value = int(t.value)
    return t

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    for (_token, _pattern) in reserved.iteritems():
        if (re.match(_pattern, t.value)):
            t.type = _token
    return t

t_ignore = " \t"

def t_newline(t):
    r'\n+'
    t.lexer.lineno += t.value.count("\n")
    
def t_comment(t):
    r'\#[^\n]*\n'
    t.lexer.lineno += 1

def t_error(t):
    print ("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Build lexer.
lexer = lex.lex()

if __name__ == '__main__':
    data = '''
    lw $s0 4($sp) # comment
    addi $sp $sp 4 # another comment
    # new line test
    '''
    lexer.input(data)
    
    while True:
        tok = lexer.token()
        if not tok:
            break
        print((tok.type, tok.value))
        #print tok.value
