#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 free_space.py [BANK=none] [pokecrystal.map]

Calculate the free space in the ROM or its individual banks.

The BANK argument allows printing free space in one, all, or none of the ROM's banks.
Valid arguments are numbers (in decimal "42" or hexadecimal "0x2A"), "all" or "none".
If not specified, defaults to "none".
"""

import sys

from mapreader import MapReader

def main():
	print_bank = 'none'
	mapfile = 'pokecrystal.map'

	if len(sys.argv) >= 2 and sys.argv[1].startswith('BANK='):
		print_bank = sys.argv[1].split('=', 1)[-1]
		if len(sys.argv) >= 3:
			mapfile = sys.argv[2]
	elif len(sys.argv) >= 3 and sys.argv[2].startswith('BANK='):
		print_bank = sys.argv[2].split('=', 1)[-1]
		mapfile = sys.argv[1]

	if print_bank not in {'all', 'none'}:
		try:
			if print_bank.startswith('0x') or print_bank.startswith('0X'):
				print_bank = int(print_bank[2:], 16)
			else:
				print_bank = int(print_bank)
		except ValueError:
			error = 'Error: invalid BANK: %s' % print_bank
			if print_bank.isalnum():
				error += ' (did you mean: 0x%s?)' % print_bank
			print(error, file=sys.stderr)
			sys.exit(1)

	num_banks = 0x80
	bank_size = 0x4000 # bytes
	total_size = num_banks * bank_size

	r = MapReader()
	with open(mapfile, 'r', encoding='utf-8') as f:
		l = f.readlines()
	r.read_map_data(l)

	free_space = 0
	per_bank = []
	default_bank_data = {'sections': [], 'used': 0, 'slack': bank_size}
	for bank in range(num_banks):
		bank_data = r.bank_data['ROM0 bank'] if bank == 0 else r.bank_data['ROMX bank']
		data = bank_data.get(bank, default_bank_data)
		used = data['used']
		slack = data['slack']
		per_bank.append((used, slack))
		free_space += slack

	print('Free space: %d/%d (%.2f%%)' % (free_space, total_size, free_space * 100.0 / total_size))
	if print_bank != 'none':
		print()
		print('bank, used, free')
	for bank in range(num_banks):
		used, slack = per_bank[bank]
		if print_bank in {'all', bank}:
				print('$%02X, %d, %d' % (bank, used, slack))

if __name__ == '__main__':
	main()
