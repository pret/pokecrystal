# coding: utf-8
"""
Starting a new python process to preprocess each source file creates too much
overhead. Instead, a list of files to preprocess is fed into a script run from
a single process.
"""

import os
import sys

import extras.pokemontools.configuration as configuration

import preprocessor

def main():
    config = configuration.Config()
    macros = preprocessor.load_pokecrystal_macros()

    stdout = sys.stdout

    for source in sys.argv[1:]:
        dest = os.path.splitext(source)[0] + '.tx'
        sys.stdin  = open(source, 'r')
        sys.stdout = open(dest, 'w')
        preprocessor.preprocess(config, macros)

    # reset stdout
    sys.stdout = stdout

if __name__ == '__main__':
    main()
