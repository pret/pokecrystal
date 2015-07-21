"""Supplementary scripts for graphics conversion."""

import os
import argparse

from extras.pokemontools import gfx, lz


# Graphics with inverted tilemaps that aren't covered by filepath_rules.
pics = [
	'gfx/shrink1',
	'gfx/shrink2',
]

def filepath_rules(filepath):
	"""Infer attributes of certain graphics by their location in the filesystem."""
	args = {}

	filedir, filename = os.path.split(filepath)
	name, ext = os.path.splitext(filename)

	if 'gfx/pics/' in filedir:
		if name == 'front':
			args['pal_file'] = os.path.join(filedir, 'normal.pal')
			args['pic'] = True
			args['animate'] = True
		elif name == 'back':
			args['pal_file'] = os.path.join(filedir, 'shiny.pal')
			args['pic'] = True

	elif 'gfx/trainers' in filedir:
		args['pic'] = True

	elif os.path.join(filedir, name) in pics:
		args['pic'] = True

	if args.get('pal_file'):
		args['palout'] = args['pal_file']

	if args.get('pic'):
		if ext == '.png':
			w, h = gfx.png.Reader(filepath).asRGBA8()[:2]
			w = min(w/8, h/8)
			args['pic_dimensions'] = w, w
	return args


def to_1bpp(filename, **kwargs):
	_, ext = os.path.splitext(filename)
	if   ext == '.1bpp': pass
	elif ext == '.2bpp': gfx.export_2bpp_to_1bpp(filename, **kwargs)
	elif ext == '.png':  gfx.export_png_to_1bpp(filename, **kwargs)

def to_2bpp(filename, **kwargs):
	_, ext = os.path.splitext(filename)
	if   ext == '.1bpp': gfx.export_1bpp_to_2bpp(filename, **kwargs)
	elif ext == '.2bpp': pass
	elif ext == '.png':  gfx.export_png_to_2bpp(filename, **kwargs)

def to_png(filename, **kwargs):
	_, ext = os.path.splitext(filename)
	if   ext == '.1bpp': gfx.export_1bpp_to_png(filename, **kwargs)
	elif ext == '.2bpp': gfx.export_2bpp_to_png(filename, **kwargs)
	elif ext == '.png':  pass

def compress(filename, **kwargs):
	data = open(filename, 'rb').read()
	lz_data = lz.Compressed(data).output
	open(filename + '.lz', 'wb').write(bytearray(lz_data))

def decompress(filename, **kwargs):
	lz_data = open(filename, 'rb').read()
	data = lz.Decompressed(lz_data).output
	name, ext = os.path.splitext(filename)
	open(name, 'wb').write(bytearray(data))


methods = {
	'2bpp': to_2bpp,
	'1bpp': to_1bpp,
	'png':  to_png,
	'lz':   compress,
	'unlz': decompress,
}

def main(method_name, filenames=None):
	if filenames is None: filenames = []
	for filename in filenames:
		args = filepath_rules(filename)
		method = methods.get(method_name)
		if method:
			method(filename, **args)

def get_args():
	ap = argparse.ArgumentParser()
	ap.add_argument('method_name')
	ap.add_argument('filenames', nargs='*')
	args = ap.parse_args()
	return args

if __name__ == '__main__':
	main(**get_args().__dict__)
