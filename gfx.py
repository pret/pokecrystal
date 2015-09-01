"""Supplementary scripts for graphics conversion."""

import os
import argparse

from extras.pokemontools import gfx, lz


# Graphics with inverted tilemaps that aren't covered by filepath_rules.
pics = [
	'gfx/shrink1',
	'gfx/shrink2',
]

base_stats = None
def get_base_stats():
	global base_stats
	if not base_stats:
		base_stats = open('data/base_stats.asm').read()
	return base_stats

def get_pokemon_dimensions(name):
	if name == 'egg':
		return 5, 5
	if name.startswith('unown_'):
		name = 'unown'
	base_stats = get_base_stats()
	start = base_stats.find(name.title() + 'BaseData:')
	start = base_stats.find('\tdn ', start)
	end = base_stats.find('\n', start)
	line = base_stats[start:end].replace(',', ' ')
	w, h = map(int, line.split()[1:3])
	return w, h

def filepath_rules(filepath):
	"""Infer attributes of certain graphics by their location in the filesystem."""
	args = {}

	filedir, filename = os.path.split(filepath)
	name, ext = os.path.splitext(filename)

	pokemon_name = ''

	if 'gfx/pics/' in filedir:
		pokemon_name = filedir.split('/')[-1]
		if pokemon_name.startswith('unown_'):
			index = filedir.find(pokemon_name)
			if index != -1:
				filedir = filedir[:index + len('unown')] + filedir[index + len('unown_a'):]
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
		if os.path.exists(args['pal_file']):
			args['palout'] = args['pal_file']
		else:
			del args['pal_file']

	if args.get('pic'):
		if ext == '.png':
			w, h = gfx.png.Reader(filepath).asRGBA8()[:2]
			w = min(w/8, h/8)
			args['pic_dimensions'] = w, w
		elif ext == '.2bpp':
			if pokemon_name and name == 'front':
				w, h = get_pokemon_dimensions(pokemon_name)
				args['pic_dimensions'] = w, w
			elif pokemon_name and name == 'back':
				args['pic_dimensions'] = 6, 6
			else:
				args['pic_dimensions'] = 7, 7
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
