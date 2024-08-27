#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python palflags.py

Create .flags files for palettes of Pokemon and trainer sprites.
"""

import sys
import glob

import png

def luminance(c):
	r, g, b = c
	return 0.299 * r**2 + 0.587 * g**2 + 0.114 * b**2

def hex_color(c):
	r, g, b = c
	return f'#{r:02x}{g:02x}{b:02x}'

def rgb_pixels(row):
	yield from (tuple(row[x:x+3]) for x in range(0, len(row), 4))

def make_palette_flags(filename, flags_name):
	with open(filename, 'rb') as file:
		reader = png.Reader(file)
		rows = list(reader.asRGBA8()[2])
		indexed = reader.palette()
	if indexed:
		palette = [c[:3] for c in indexed]
	else:
		colors = {c for row in rows for c in rgb_pixels(row)}
		palette = list(sorted(colors, key=luminance, reverse=True))
	palette += [[0, 0, 0]] * (4 - len(palette))
	content = ','.join(hex_color(c) for c in palette)
	with open(flags_name, 'w', encoding='utf-8') as file:
		file.write(f'-c {content}\n')

def get_inputs():
	for filename in sorted(glob.glob('gfx/pokemon/*/front.png')):
		yield (filename, filename.removesuffix('front.png') + 'palette.flags')
	for filename in sorted(glob.glob('gfx/trainers/*.png')):
		yield (filename, filename.removesuffix('.png') + '.flags')

def main():
	for filename, flags_name in get_inputs():
		make_palette_flags(filename, flags_name)
		print(f'Created {flags_name}!')

if __name__ == '__main__':
	main()
