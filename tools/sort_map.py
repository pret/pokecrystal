#!/usr/bin/env python3

import sys
import re

encoding = 'utf-8'

def total_bank_size(type):
	# used to output the size of EMPTY banks
	sizes = {
		'ROM0':  0x4000, # 0000–3FFF
		'ROMX':  0x4000, # 4000–7FFF
		'VRAM':  0x2000, # 8000–9FFF
		'SRAM':  0x2000, # A000-BFFF
		'WRAM0': 0x1000, # C000-CFFF
		'WRAMX': 0x1000, # D000-DFFF
		                 # E000-FDFF: echo RAM
		'OAM':     0xA0, # FE00-FE9F
		                 # FEA0-FEFF: unusable
		                 # FF00-FF7F: hardware I/O registers
		'HRAM':    0x80, # FF80-FFFF
	}
	return sizes[type]

def sorted_mapfile(input):
	bank_rx = re.compile(r'^([A-Z]+) Bank #([0-9]+)')
	section_rx = re.compile(r' +SECTION: \$([0-9A-F]+)(?:-\$([0-9A-F]+))? \(\$([0-9A-F]+) bytes\) \["(.+)"\]')
	label_rx = re.compile(r' +\$([0-9A-F]+) = (.+)')
	slack_rx = re.compile(r' +SLACK: \$([0-9A-F]+) bytes')

	bank_type = None
	bank_number = None
	bank_size = 0
	bank_queue = []
	section_queue = []

	for line in input:

		if line.startswith('  EMPTY'):
			# empty banks have their entire capacity as slack
			line = '    SLACK: $%04X bytes\n' % total_bank_size(bank_type)

		x = re.match(bank_rx, line)
		if x:
			# start a new bank
			bank_type = x.group(1)
			bank_number = '%02X' % int(x.group(2))
			if bank_type == 'ROM':
				bank_type = 'ROM0' if bank_number == '00' else 'ROMX'
			if bank_type == 'WRAM':
				bank_type = 'WRAM0' if bank_number == '00' else 'WRAMX'
			bank_size = 0
			bank_queue.clear()
			section_queue.clear()
			continue

		x = re.match(section_rx, line)
		if x:
			# finish current section
			bank_queue.extend(sorted(section_queue))
			# start a new section
			start = x.group(1)
			end = x.group(2) or start
			size = x.group(3).zfill(4)
			name = x.group(4)
			bank_size += int(size, 16)
			bank_queue.append('; %s:%s-%s ($%s) %s\n' % (bank_number, start, end, size, name))
			section_queue.clear()
			continue

		x = re.match(label_rx, line)
		if x:
			# add label to section
			address = x.group(1)
			label = x.group(2)
			section_queue.append('%s:%s %s\n' % (bank_number, address, label))
			continue

		x = re.match(slack_rx, line)
		if x:
			# finish current section
			bank_queue.extend(sorted(section_queue))
			# finish current bank
			slack = int(x.group(1), 16)
			yield '; %s $%s ($%04X) ($%04X free)\n' % (bank_type, bank_number, bank_size, slack)
			yield from bank_queue
			continue

def main():
	if len(sys.argv) < 3:
		print('Usage: %s pokecrystal.map sorted.sym' % sys.argv[0], file=sys.stderr)
		sys.exit(1)
	input_filename = sys.argv[1]
	output_filename = sys.argv[2]
	with open(input_filename, 'r', encoding=encoding) as infile:
		input = infile.readlines()
		output = sorted_mapfile(input)
	with open(output_filename, 'w', encoding=encoding) as outfile:
		for line in output:
			outfile.write(line)

if __name__ == '__main__':
	main()
