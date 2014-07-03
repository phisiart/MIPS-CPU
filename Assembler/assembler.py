# -*- coding: utf-8 -*-

import sys, os
from parser import *

def print_inst(ins):
    global addrTags

    if (addrTags.has_key(ins[0])): # There is a tag here.
        print '[0x%08X]  0x%08X  %s:' % (ins[0], ins[1], addrTags[ins[0]])
        print ' ' * 26 + '%s' % ins[2]
    else:
        print '[0x%08X]  0x%08X  %s' % (ins[0], ins[1], ins[2])

    if len(ins) == 4:
        print ' ' * 26 + '(-> %X)' % ins[3]

def asbl_file(file_name):
    file_handle = open(file_name, 'r')
    source = file_handle.read()
    file_handle.close()

    insts = parser.parse(source, tracking = True)
    global addrTags
    for inst in insts:
        if len(inst) == 4:
            finded = 0
            for (key, value) in addrTags.items():
                if inst[3] == value:
                    instype = ((inst[1] >> 26) % (1 << 6))
                    finded = 1
                    if instype in [1, 4, 5, 6, 7]: # branch
                        offset = ((key - inst[0] - 4) / 4)
                        inst[1] = inst[1] | (offset % (1 << 16))
                        inst[3] = offset
                    elif instype in [2, 3]: # jump
                        direction = (key / 4) % (1 << 28)
                        inst[1] = inst[1] | direction
                        inst[3] = direction
                    else:
                        raise Exception('spam', "I don't know this instruction")
            if not finded:
                raise Exception('span', "Error: Cannot find address tag " + inst[3])
    return insts
    
if __name__ == '__main__':
    global addrTags

    print('-' * 80 + '\n' + ' ' * 33 + 'MIPS Assembler\n')
    # Read source file.
    source_file_name = sys.argv[1]
    source_file_handle = open(source_file_name, 'r')
    source_code = source_file_handle.read()
    source_file_handle.close()

    # print('Source code begins:\n' + '-' * 80)
    # print(source_code)
    # print('-' * 80 + '\nSource code ends.\n')

    # Construct the abstract syntax tree.
    insts = parser.parse(source_code, tracking = True)

    for inst in insts:
        if len(inst) == 4:
            finded = 0
            for (key, value) in addrTags.items():
                if inst[3] == value:
                    instype = ((inst[1] >> 26) % (1 << 6))
                    finded = 1
                    if instype in [1, 4, 5, 6, 7]: # branch
                        offset = ((key - inst[0] - 4) / 4)
                        inst[1] = inst[1] | (offset % (1 << 16))
                        inst[3] = offset
                    elif instype in [2, 3]: # jump
                        direction = (key / 4) % (1 << 28)
                        inst[1] = inst[1] | direction
                        inst[3] = direction
                    else:
                        raise Exception('spam', "I don't know this instruction")
            if not finded:
                raise Exception('span', "Error: Cannot find address tag " + inst[3])


    for inst in insts:
        print_inst(inst)
        
    # print addrTags