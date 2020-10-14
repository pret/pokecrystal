#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: ./sym_comments.py file.asm [pokecrystal.sym] > file_commented.asm

Comments each label in file.asm with its bank:address from the sym file.
"""

import sys
import re

if len(sys.argv) != 2 and len(sys.argv) != 3:
	print('Usage: %s file.asm [pokecrystal.sym] > file_commented.asm' % sys.argv[0], file=sys.stderr)

wram_name = sys.argv[1]
sym_name = sys.argv[2] if len(sys.argv) == 3 else 'pokecrystal.sym'

sym_format = r'[A-Za-z_][A-Za-z0-9_#@]*'
sym_def_rx = re.compile(r'(^%s)(:.*)|(^\.%s)(.*)' % (sym_format, sym_format))

sym_addrs = {}
with open(sym_name, 'r', encoding='utf-8') as f:
	for line in f:
		line = line.split(';', 1)[0].rstrip()
		parts = line.split(' ', 1)
		if len(parts) != 2:
			continue
		addr, sym = parts
		sym_addrs[sym] = addr

with open(wram_name, 'r', encoding='utf-8') as f:
	cur_label = None
	for line in f:
		line = line.rstrip()
		m = re.match(sym_def_rx, line)
		if m:
			sym, rest = m.group(1), m.group(2)
			if sym is None and rest is None:
				sym, rest = m.group(3), m.group(4)
			key = sym
			if not sym.startswith('.'):
				cur_label = sym
			elif cur_label:
				key = cur_label + sym
			if key in sym_addrs:
				addr = sym_addrs[key]
				line = sym + rest + ' ; ' + addr
		print(line)
