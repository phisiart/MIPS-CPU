# -*- coding: utf-8 -*-

import sys, os
from parser import *

if __name__ == '__main__':

    # Read source file.
    source_file_name = sys.argv[1]
    source_file_handle = open(source_file_name, 'r')
    source_code = source_file_handle.read()
    source_file_handle.close()

    print('Source code:')
    print('-' * 80)
    print(source_code)
    print('-' * 80 + '\n')

    # Construct the abstract syntax tree.
    ast = parser.parse(source_code, tracking = True)

    # Get module name.
    module_name = ast[1]
    verilog_code = 'module ' + module_name + '(\n'
    print('Module name = %s\n' % module_name)

    # Recognize the inputs.
    input_lens = {}
    input2idx = {}
    input_count = 0
    pla = '.ilb '
    print('The inputs are:')
    for (input_name, input_len) in ast[2]:
        if input_name in input_lens:
            print('Error! Input \'%s\' has already been defined.' % input_name)
            sys.exit(1)

        input2idx[input_name] = input_count

        if input_len == -1:
            input_lens[input_name] = 1
            input_count += 1
            pla += input_name + ' '
            verilog_code += '    input wire ' + input_name + ',\n'
        else:
            input_lens[input_name] = input_len
            input_count += input_len
            for offset in range(0, input_len):
                pla += input_name + '[' + str(offset) + ']' + ' '
            verilog_code += '    input wire [' + str(input_len - 1) + ':0] ' + input_name + ',\n'

        print('  (index = %d) %s[%d]' % (input2idx[input_name], input_name, input_lens[input_name]))
    print()

    # Recognize the outputs.
    output_lens = {}
    output2idx = {}
    output_count = 0
    pla += '\n.ob '
    print('The outputs are:')
    for (output_name, output_len) in ast[3]:
        if output_name in input_lens:
            print('Error! Trying to add output \'%s\' but it has already been defined as input.' % output_name)
            sys.exit(1)

        if output_name in output_lens:
            print('Error! Output \'%s\' has already been defined.' % output_name)
            sys.exit(1)

        output2idx[output_name] = output_count

        if output_len == -1:
            output_lens[output_name] = 1
            output_count += 1
            pla += output_name + ' '
            verilog_code += '    output wire ' + output_name + ',\n'
        else:
            output_lens[output_name] = output_len
            output_count += output_len
            for offset in range(0, output_len):
                pla += output_name + '[' + str(offset) + ']' + ' '
            verilog_code += '    output wire [' + str(output_len - 1) + ':0] ' + output_name + ',\n'

        print('  (index = %d) %s[%d]' % (output2idx[output_name], output_name, output_lens[output_name]))
    print()

    pla = '.i ' + str(input_count) + '\n.o ' + str(output_count) + '\n.type fr\n' + pla

    if (verilog_code[-2] == ','):
        verilog_code = verilog_code[:-2] + '\n);\n\n'
    else:
        verilog_code += '\n);\n\n'

    class Rule:
        def __init__(self):
            self.inputs = {} # inputidx(int) : str
            self.outputs = {} # inputidx(int) : str

        def InputStr(self):
            ret = ''
            for idx in range(0, input_count):
                if idx in self.inputs:
                    ret += str(self.inputs[idx])
                else:
                    ret += '-'
            return ret

        def OutputStr(self):
            ret = ''
            for idx in range(0, output_count):
                if idx in self.outputs:
                    ret += str(self.outputs[idx])
                else:
                    ret += '-'
            return ret

    rules = []

    print('The rules are:')
    for (input_specs, output_specs) in ast[4]:
        rule = Rule()
        print('----Rule:----')
        # input_specs = t_rule[0]
        print('  Inputs:')
        for ((var, offset), val) in input_specs:
            print('    %s[%d] = %s' % (var, offset, val))
            if offset == -1:
                print('      (len[%s] = %d)' % (var, input_lens[var]))
                for off in range(0, input_lens[var]):
                    va = (int(val) & (1 << off)) >> off
                    idx = input2idx[var] + off
                    print('      idx = %d, var = %d' % (idx, va))
                    rule.inputs[idx] = va
            else:
                idx = input2idx[var] + offset
                val = int(val != 0)
                rule.input_lens[idx] = val
                print('      idx = %d, val = %d' % (idx, val))

        print('  Outputs:')
        for ((var, offset), val) in output_specs:
            print('    %s[%d] = %s' % (var, offset, val))
            if offset == -1:
                print('      (len[%s] = %d)' % (var, output_lens[var]))
                for off in range(0, output_lens[var]):
                    va = (int(val) & (1 << off)) >> off
                    idx = output2idx[var] + off
                    print('      idx = %d, var = %d' % (idx, va))
                    rule.outputs[idx] = va
            else:
                idx = output2idx[var] + offset
                val = int(val != 0)
                rule.outputs[idx] = val
                print('      idx = %d, val = %d' % (idx, val))

        rules.append(rule)
        print()
    print()

    print('-' * 80)
    print(' Rules in pla file:')
    print('-' * 80)
    for rule in rules:
        print('%s : %s' % (rule.InputStr(), rule.OutputStr()))
        pla += '\n' + rule.InputStr() + ' ' + rule.OutputStr()
    print()

    print('-' * 80)
    pla += '\n.e'
    print(' Final pla file:')
    print('-' * 80)
    print(pla)
    print()

    # Write the pla file.
    pla_file_handle = open(module_name + '.in', 'w')
    pla_file_handle.write(pla)
    pla_file_handle.close()

    # Use the espresso program.
    cmd = './espresso.linux -o eqntott ' + module_name + '.in >' + module_name + '.out'
    os.system(cmd)

    # Load the espresso output.
    pla_file_handle = open(module_name + '.out', 'r')
    new_assign = True;
    for line in pla_file_handle:
        line = line.replace('()', '1')
        line = line.replace('= ;', '= 0;')
        # line = line.replace('(', '( ')
        # line = line.replace(')', ' )')
        line = line.replace('&', ' & ')
        # line = line.replace('|', ' | ')

        if line == '\n':
            new_assign = True
        else:
            if new_assign:
                verilog_code += '    assign ' + line
                new_assign = False
            else:
                verilog_code += '              ' + line

    verilog_code += '\nendmodule\n\n'

    print('-' * 80)
    print(' Verilog code:')
    print('-' * 80)
    print(verilog_code)

    veriloghandle = open(module_name + '.v', 'w')
    veriloghandle.write(verilog_code)
    veriloghandle.close()
    print('-' * 80)
    print(' Finished! File saved as \'%s\'' % (module_name + '.v'))
    print('-' * 80)
    print()
