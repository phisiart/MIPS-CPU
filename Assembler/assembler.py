# -*- coding: utf-8 -*-

import sys, os
from parser import *

if __name__ == '__main__':

    print('-' * 80 + '\n' + ' ' * 33 + 'MIPS Assembler\n')
    # Read source file.
    source_file_name = sys.argv[1]
    source_file_handle = open(source_file_name, 'r')
    source_code = source_file_handle.read()
    source_file_handle.close()

    print('Source code begins:\n' + '-' * 80)
    print(source_code)
    print('-' * 80 + '\nSource code ends.\n')

    # Construct the abstract syntax tree.
    insts = parser.parse(source_code, tracking = True)

    