# coding: utf-8

# Starting a new python process to preprocess each source file
# creates too much overhead. Instead, a list of files to preprocess
# is fed into a script run from a single process.

import os
import sys
import preprocessor

if __name__ == '__main__':
	for source in sys.argv[1:]:
		dest = os.path.splitext(source)[0] + '.tx'
		sys.stdin  = open(source, 'r')
		sys.stdout = open(dest, 'w')
		preprocessor.preprocess()

