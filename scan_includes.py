# coding: utf-8

"""
Recursively scan an asm file for rgbasm INCLUDEs and INCBINs.
This is used to generate dependencies for each rgbasm object file.
"""

import os
import sys

def scan_for_includes(filename):
	filenames = []
	if os.path.exists(filename):
		for line in open(filename, 'r').readlines():
			if 'INCLUDE' in line or 'INCBIN' in line:
				line = line.split(';')[0]
				if 'INCLUDE' in line or 'INCBIN' in line:
					filenames += [line.split('"')[1]]
	return filenames

def recursive_scan_for_includes(filename):
	filenames = []
	if '.asm' in filename or '.tx' in filename:
		for include in scan_for_includes(filename):
			filenames += [include] + recursive_scan_for_includes(include)
	return filenames

if len(sys.argv) > 1:
	for arg in sys.argv[1:]:
		sys.stdout.write(' '.join(recursive_scan_for_includes(arg)))

