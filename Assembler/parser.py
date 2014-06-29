# -*- coding: utf-8 -*-

import ply.yacc as yacc

from lex import tokens

def p_program(p):
    '''program : program instruction
               | instruction'''
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else
        p[0] = [p[1]]

def p_nop(p):
    '''nop :'''
    ??
    
def p_lw(p):
    '''instruction : LW register NUMBER LBRACKET register RBRACKET'''
    print 'lw : reg =', p[2], 'pointer =', p[5], 'offset =', p[3]
params = {}

# def p_program_with_params(p):
#     'program : IDENTIFIER LBRACE INPUT COLON input_list OUTPUT COLON output_list RULES COLON rules_list RBRACE'
#     p[0] = ('program', p[1], p[5], p[8], p[11])
    
def p_program(p):
    '''program : IDENTIFIER LBRACE PARAMS COLON params_list INPUT COLON input_list OUTPUT COLON output_list RULES COLON rules_list RBRACE
               | IDENTIFIER LBRACE INPUT COLON input_list OUTPUT COLON output_list RULES COLON rules_list RBRACE'''
    if len(p) == 16:
        p[0] = ('program', p[1], p[8], p[11], p[14])
    else:
        p[0] = ('program', p[1], p[5], p[8], p[11])

def p_params_list(p):
    '''params_list : params_list param
                   | param'''
    p[0] = 0
    print('params')

def p_param(p):
    '''param : IDENTIFIER EQUAL NUMBER SEMICOLON'''
    params[p[1]] = p[3]
    p[0] = 0
    print(params)

def p_input_list(p):
    '''input_list : input_list input
                  | input'''
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else:
        p[0] = [p[1]]
    print('input_list')
        
def p_dispatch_1(p):
    '''dispatch : IDENTIFIER LSQUARE NUMBER RSQUARE'''
    p[0] = (p[1], p[3])
    
def p_dispatch_2(p):
    '''dispatch : IDENTIFIER'''
    p[0] = (p[1], -1)
    
def p_input(p):
    '''input : dispatch SEMICOLON'''
    p[0] = p[1]
    print('input')
    
def p_output_list(p):
    '''output_list : output_list output
                   | output'''
                   
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else:
        p[0] = [p[1]]
    print('output')
        
def p_output(p):
    '''output : dispatch SEMICOLON'''
    p[0] = p[1]
    
def p_rules_list(p):
    '''rules_list : rules_list rule
                  | rule'''
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else:
        p[0] = [p[1]]
        
def p_rule(p):
    '''rule : spec ARROW spec SEMICOLON'''
    p[0] = (p[1], p[3])
    
def p_spec(p):
    '''spec : spec COMMA assign
            | assign'''
    if len(p) == 4:
        p[0] = p[1] + [p[3]]
    else:
        p[0] = [p[1]]

def p_assign(p):
    '''assign : dispatch EQUAL rvalue'''
    p[0] = (p[1], p[3])
    
def p_rvalue_number(p):
    '''rvalue : NUMBER'''
    p[0] = p[1]

def p_rvalue_param(p):
    '''rvalue : IDENTIFIER'''
    p[0] = params[p[1]]

def p_error(p):
    print('error!')

# Build parser.
parser = yacc.yacc()


if __name__ == '__main__':
    data = '''
    Test {
    input:
        A;
    output:
        B[2];
    rules:
        A = 0 -> B = 1;    
    }
    '''
    print(parser.parse(data))