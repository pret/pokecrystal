#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 toc.py [-n] files.md...
Replace a "## TOC" heading in a Markdown file with a table of contents,
generated from the other headings in the file. Supports multiple files.
Use "-n" for numbered list items.
Headings must start with "##" signs to be detected.
"""

import sys
import re
from collections import namedtuple

toc_name = 'Contents'
valid_toc_headings = {'## TOC', '##TOC'}

TocItem = namedtuple('TocItem', ['name', 'anchor', 'level'])
punctuation_regexp = re.compile(r'[^\w\- ]+')

def name_to_anchor(name):
	# GitHub's algorithm for generating anchors from headings
	# https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb
	anchor = name.strip().lower()                   # lowercase
	anchor = re.sub(punctuation_regexp, '', anchor) # remove punctuation
	anchor = anchor.replace(' ', '-')               # replace spaces with dash
	return anchor

def get_toc_index(lines):
	toc_index = None
	for i, line in enumerate(lines):
		if line.rstrip() in valid_toc_headings:
			toc_index = i
			break
	return toc_index

def get_toc_items(lines, toc_index):
	for i, line in enumerate(lines):
		if i <= toc_index:
			continue
		if line.startswith('##'):
			name = line.lstrip('#')
			level = len(line) - len(name) - len('##')
			name = name.strip()
			anchor = name_to_anchor(name)
			yield TocItem(name, anchor, level)

def toc_string(toc_items, numeric):
	lines = ['## %s' % toc_name, '']
	for name, anchor, level in toc_items:
		padding = '  ' * level
		line = '%s- [%s](#%s)' % (padding, name, anchor)
		lines.append(line)
	return '\n'.join(lines) + '\n'

def add_toc(filename, numeric):
	with open(filename, 'r', encoding='utf-8') as f:
		lines = f.readlines()
	toc_index = get_toc_index(lines)
	if toc_index is None:
		return None # no TOC heading
	toc_items = list(get_toc_items(lines, toc_index))
	if not toc_items:
		return False # no content headings
	with open(filename, 'w', encoding='utf-8') as f:
		for i, line in enumerate(lines):
			if i == toc_index:
				f.write(toc_string(toc_items, numeric))
			else:
				f.write(line)
	return True # OK

def main():
	if len(sys.argv) < 2:
		print('*** ERROR: Not enough arguments')
		print(__doc__)
		exit(1)
	del sys.argv[0]
	numeric = False
	if sys.argv[0] == '-n':
		numeric = True
		del sys.argv[0]
	if not sys.argv:
		print('*** ERROR: No filenames specified')
		exit(1)
	for filename in sys.argv:
		print(filename)
		result = add_toc(filename, numeric)
		if result is None:
			print('*** WARNING: No "## TOC" heading found')
		elif result is False:
			print('*** WARNING: No content headings found')
		else:
			print('OK')

if __name__ == '__main__':
	main()
