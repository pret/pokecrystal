# -*- coding: utf-8 -*-

import json

# from crystal import load_rom
# from gbz80disasm import load_labels


def make_sym_from_json(filename = '../pokecrystal.sym', j = 'labels.json'):
	# todo: delete and remake labels.json at runtime
	with open(filename, 'w') as sym:
		for label in json.load(open(j)):
			sym.write('{0:x}:{1:x} {2}\n'.format(label['bank'], label['address']%0x4000 + (0x4000 if label['bank'] else 0), label['label']))


def make_sym_from_mapfile(filename = '../pokecrystal.sym', mapfile = '../mapfile.txt'):
	# todo: sort label definitions by address
	
	output = ''
	# get label definitions
	with open(mapfile,'r') as map:
		lines = map.readlines()
		for line in lines:
			# bank #
			if 'Bank #' in line:
				cur_bank = int(line.lstrip('Bank #').strip(':\n').strip(' (HOME)'))
			
			# label definition
			elif '=' in line:
				thing = line.split('=')
				spacing = ' ' * 11 # arbitrary
				addr = int(thing[0].lstrip(spacing)[1:5],16)
				
				# rgbds doesn't support wram banks yet,
				# so this hack is applied instead
				if addr > 0xbfff: # 0xc000+ (wram only)
					cur_bank = 0
				if addr > 0xcfff: # 0xd000+ (wram only)
					cur_bank = 1
				
				# convert to sym format (bank:addr label)
				label = thing[1].strip('\n')
				output += hex(cur_bank)[2:] + ':' + hex(addr)[2:] + ' ' + label + '\n'
	
	# dump contents to symfile
	with open(filename, 'w') as sym:
		sym.write(output)


if __name__ == "__main__":
	# default behavior: generate sym file from rgbds mapfile
	try: make_sym_from_mapfile()
	# if no mapfile exists, generate from labels.json
	except: make_sym_from_json()
