#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 used_space.py [pokecrystal.map] [used_space.png]

Generate a PNG visualizing the space used by each bank in the ROM.
"""

import sys
from pokemontools import png
from colorsys import hls_to_rgb

from mapreader import MapReader

def main():
	mapfile = sys.argv[1] if len(sys.argv) >= 2 else 'pokecrystal.map'
	filename = sys.argv[2] if len(sys.argv) >= 3 else 'used_space.png'

	num_banks = 0x80
	bank_mask = 0x3FFF
	bank_size = 0x4000 # bytes

	bpp = 8 # bytes per pixel
	height = 256 # pixels
	assert bank_size % bpp == 0 and (bank_size // bpp) % height == 0

	pixels_per_bank = bank_size // bpp # 2048 pixels
	bank_width = pixels_per_bank // height # 8 pixels
	width = bank_width * num_banks # 1024 pixels

	r = MapReader()
	with open(mapfile, 'r', encoding='utf-8') as f:
		l = f.readlines()
	r.read_map_data(l)

	hit_data = []
	default_bank_data = {'sections': [], 'used': 0, 'slack': bank_size}
	for bank in range(num_banks):
		hits = [0] * pixels_per_bank
		data = r.bank_data['ROM Bank'].get(bank, default_bank_data)
		for s in data['sections']:
			beg = s['beg'] & bank_mask
			end = s['end'] & bank_mask
			for i in range(beg, end + 1):
				hits[i // bpp] += 1
		hit_data.append(hits)

	pixels = [[(0xFF, 0xFF, 0xFF)] * width for _ in range(height)]
	for bank, hits in enumerate(hit_data):
		hue = 0 if not bank else 210 if bank % 2 else 270
		for i, h in enumerate(hits):
			y = i // bank_width
			x = i % bank_width + bank * bank_width
			hls = (hue / 360.0, 1.0 - (h / bpp * (100 - 15)) / 100.0, 1.0)
			rgb = tuple(c * 255 for c in hls_to_rgb(*hls))
			pixels[y][x] = rgb

	png_data = [tuple(c for pixel in row for c in pixel) for row in pixels]
	with open(filename, 'wb') as f:
		w = png.Writer(width, height)
		w.write(f, png_data)

if __name__ == '__main__':
	main()
