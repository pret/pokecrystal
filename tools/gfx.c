#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <string.h>

#include "common.h"

static void usage(void) {
	fprintf(stderr, "Usage: gfx [--trim-whitespace] [--remove-whitespace] [--interleave] [-w width] [-d depth] [-h] [-o outfile] infile\n");
}

static void error(char *message) {
	fprintf(stderr, message);
	fprintf(stderr, "\n");
}

struct Options {
	int trim_whitespace;
	int remove_whitespace;
	int help;
	char *outfile;
	int depth;
	int interleave;
	int width;
};

struct Options Options = {
	.depth = 2,
};

void get_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"remove-whitespace", no_argument, &Options.remove_whitespace, 1},
		{"trim-whitespace", no_argument, &Options.trim_whitespace, 1},
		{"interleave", no_argument, &Options.interleave, 1},
		{"width", required_argument, 0, 'w'},
		{"depth", required_argument, 0, 'd'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt = 0; opt != -1;) {
		switch (opt = getopt_long(argc, argv, "ho:d:", long_options)) {
		case 'h':
			Options.help = true;
			break;
		case 'o':
			Options.outfile = optarg;
			break;
		case 'd':
			Options.depth = strtoul(optarg, NULL, 0);
			break;
		case 'w':
			Options.width = strtoul(optarg, NULL, 0);
			break;
		case 0:
		case -1:
			break;
		default:
			usage();
			exit(1);
			break;
		}
	}
}

struct Graphic {
	int size;
	uint8_t *data;
};

bool is_whitespace(uint8_t *tile, int tile_size) {
	uint8_t WHITESPACE = 0;
	for (int i = 0; i < tile_size; i++) {
		if (tile[i] != WHITESPACE) {
			return false;
		}
	}
	return true;
}

void trim_whitespace(struct Graphic *graphic) {
	int tile_size = Options.depth * 8;
	for (int i = graphic->size - tile_size; i > 0; i -= tile_size) {
		if (is_whitespace(&graphic->data[i], tile_size)) {
			graphic->size = i;
		} else {
			break;
		}
	}
}

void remove_whitespace(struct Graphic *graphic) {
	int tile_size = Options.depth * 8;
	int i = 0;
	for (int j = 0; i < graphic->size && j < graphic->size; i += tile_size, j += tile_size) {
		while (is_whitespace(&graphic->data[j], tile_size)) {
			j += tile_size;
		}
		if (j > i) {
			memcpy(&graphic->data[i], &graphic->data[j], tile_size);
		}
	}
	graphic->size = i;
}

void interleave(struct Graphic *graphic, int width) {
	int tile_size = Options.depth * 8;
	int width_tiles = width / 8;
	int num_tiles = graphic->size / tile_size;
	uint8_t *interleaved = malloc(graphic->size);
	for (int i = 0; i < num_tiles; i++) {
		int tile = i * 2;
		int row = i / width_tiles;
		tile -= width_tiles * row;
		if (row % 2) {
			tile -= width_tiles;
			tile += 1;
		}
		memcpy(&interleaved[tile * tile_size], &graphic->data[i * tile_size], tile_size);
	}
	memcpy(graphic->data, interleaved, graphic->size);
	free(interleaved);
}


int main(int argc, char *argv[]) {
	get_args(argc, argv);
	argc -= optind;
	argv += optind;
	if (Options.help) {
		usage();
		return 0;
	}
	if (argc < 1) {
		usage();
		exit(1);
	}
	char *infile = argv[0];
	struct Graphic graphic;
	graphic.data = read_u8(infile, &graphic.size);
	if (Options.remove_whitespace) {
		remove_whitespace(&graphic);
	}
	if (Options.trim_whitespace) {
		trim_whitespace(&graphic);
	}
	if (Options.interleave) {
		if (!Options.width) {
			error("interleave: must set --width to a nonzero value");
			usage();
			exit(1);
		}
		interleave(&graphic, Options.width);
	}
	if (Options.outfile) {
		write_u8(Options.outfile, graphic.data, graphic.size);
	}
	free(graphic.data);
	return 0;
}
