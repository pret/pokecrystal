#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <string.h>

#include "common.h"

static void usage(void) {
	fprintf(stderr, "Usage: gfx [--trim-whitespace] [--remove-whitespace] [-d depth] [-h] [-o outfile] infile \n");
}

struct Options {
	int trim_whitespace;
	int remove_whitespace;
	int help;
	char *outfile;
	int depth;
};

struct Options Options = {
	.depth = 2,
};

void get_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"remove-whitespace", no_argument, &Options.remove_whitespace, 1},
		{"trim-whitespace", no_argument, &Options.trim_whitespace, 1},
		{"depth", required_argument, 0, 'd'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt = 0; opt != -1;) {
		switch(opt = getopt_long(argc, argv, "ho:d:", long_options)) {
		case 'h':
			Options.help = true;
			break;
		case 'o':
			Options.outfile = optarg;
			break;
		case 'd':
			Options.depth = strtoul(optarg, NULL, 0);
			break;
		case 0:
		case -1:
			break;
		default:
			printf("ay %d", opt);
			usage();
			exit(1);
			break;
		}
	}
}

bool is_whitespace(uint8_t *tile, int tile_size) {
	uint8_t WHITESPACE = 0;
	for (int i = 0; i < tile_size; i++) {
		if (tile[i] != WHITESPACE) {
			return false;
		}
	}
	return true;
}

void trim_whitespace(char *infile, char *outfile) {
	int size;
	uint8_t *data = read_u8(infile, &size);
	int tile_size = Options.depth * 8;
	for (int i = size - tile_size; i > 0; i -= tile_size) {
		if (is_whitespace(&data[i], tile_size)) {
			size = i;
		} else {
			break;
		}
	}
	write_u8(outfile, data, size);
}

void remove_whitespace(char *infile, char *outfile) {
	int size;
	uint8_t *data = read_u8(infile, &size);
	int tile_size = Options.depth * 8;
	int i = 0;
	for (int j = 0; i < size && j < size; i += tile_size, j += tile_size) {
		while (is_whitespace(&data[j], tile_size)) {
			j += tile_size;
		}
		if (j > i) {
			memcpy(&data[i], &data[j], tile_size);
		}
	}
	size = i;
	write_u8(outfile, data, size);
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
	if (Options.remove_whitespace) {
		if (Options.outfile) {
			remove_whitespace(infile, Options.outfile);
		}
	} else if (Options.trim_whitespace) {
		if (Options.outfile) {
			trim_whitespace(infile, Options.outfile);
		}
	}
	return 0;
}
