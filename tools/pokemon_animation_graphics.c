#define PROGRAM_NAME "pokemon_animation_graphics"
#define USAGE_OPTS "[-h|--help] [-o|--output front.animated.2bpp] [-t|--tilemap front.animated.tilemap] [--girafarig] front.2bpp front.dimensions"

#include "common.h"

struct Options {
	const char *out_filename;
	const char *map_filename;
	bool girafarig;
};

void parse_args(int argc, char *argv[], struct Options *options) {
	struct option long_options[] = {
		{"output", required_argument, 0, 'o'},
		{"tilemap", required_argument, 0, 't'},
		{"girafarig", no_argument, 0, 'g'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "o:t:h", long_options)) != -1;) {
		switch (opt) {
		case 'o':
			options->out_filename = optarg;
			break;
		case 't':
			options->map_filename = optarg;
			break;
		case 'g':
			options->girafarig = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

#define TILE_SIZE 16

void transpose_tiles(uint8_t *tiles, int width, int size) {
	uint8_t *new_tiles = xmalloc(size);
	for (int i = 0; i < size; i++) {
		int j = i / TILE_SIZE * width * TILE_SIZE;
		j = (j / size) * TILE_SIZE + j % size + i % TILE_SIZE;
		new_tiles[j] = tiles[i];
	}
	memcpy(tiles, new_tiles, size);
	free(new_tiles);
}

int get_tile_index(const uint8_t *tile, const uint8_t *tiles, int num_tiles, int preferred_tile_id) {
	if (preferred_tile_id >= 0 && preferred_tile_id < num_tiles) {
		if (!memcmp(tile, &tiles[preferred_tile_id * TILE_SIZE], TILE_SIZE)) {
			return preferred_tile_id;
		}
	}
	for (int i = 0; i < num_tiles; i++) {
		if (!memcmp(tile, &tiles[i * TILE_SIZE], TILE_SIZE)) {
			return i;
		}
	}
	return -1;
}

uint8_t *read_tiles(const char *filename, int width, long *tiles_size) {
	int frame_size = width * width * TILE_SIZE;

	uint8_t *tiles = read_u8(filename, tiles_size);
	if (!*tiles_size) {
		error_exit("%s: empty file\n", filename);
	} else if (*tiles_size % TILE_SIZE) {
		error_exit("%s: not divisible into 8x8-px 2bpp tiles\n", filename);
	} else if (*tiles_size % frame_size) {
		error_exit("%s: not divisible into %dx%d-tile frames\n", filename, width, width);
	}

	int num_frames = *tiles_size / frame_size;
	for (int i = 0; i < num_frames; i++) {
		transpose_tiles(&tiles[i * frame_size], width, frame_size);
	}

	return tiles;
}

void write_graphics(const char *filename, const uint8_t *tiles, long tiles_size, int num_tiles_per_frame, bool girafarig) {
	int max_size = tiles_size;
	int max_num_tiles = max_size / TILE_SIZE;
	if (girafarig) {
		// Ensure space for a duplicate of tile 0 at the end
		max_size += TILE_SIZE;
	}
	uint8_t *data = xmalloc(max_size);

	int num_tiles = 0;
#define DATA_APPEND_TILES(tile, length) do { \
	memcpy(&data[num_tiles * TILE_SIZE], &tiles[(tile) * TILE_SIZE], (length) * TILE_SIZE); \
	num_tiles += (length); \
} while (0)
	// Copy the first frame directly
	DATA_APPEND_TILES(0, num_tiles_per_frame);
	// Skip redundant tiles in the animated frames
	for (int i = num_tiles_per_frame; i < max_num_tiles; i++) {
		int index = get_tile_index(&tiles[i * TILE_SIZE], data, num_tiles, i % num_tiles_per_frame);
		if (index == -1) {
			DATA_APPEND_TILES(i, 1);
		}
	}
	if (girafarig) {
		// Add a duplicate of tile 0 to the end
		DATA_APPEND_TILES(0, 1);
	}
#undef DATA_APPEND_TILES

	write_u8(filename, data, num_tiles * TILE_SIZE);
	free(data);
}

void write_tilemap(const char *filename, const uint8_t *tiles, long tiles_size, int num_tiles_per_frame, bool girafarig) {
	int size = tiles_size / TILE_SIZE;
	uint8_t *data = xmalloc(size);

	int num_tiles = num_tiles_per_frame;
	// Copy the first frame directly
	for (int i = 0; i < num_tiles_per_frame; i++) {
		data[i] = i;
	}
	// Skip redundant tiles in the animated frames
	for (int i = num_tiles_per_frame; i < size; i++) {
		int index = get_tile_index(&tiles[i * TILE_SIZE], tiles, i, i % num_tiles_per_frame);
		int tile;
		if (girafarig && index == 0) {
			tile = num_tiles;
		} else if (index == -1) {
			tile = num_tiles++;
		} else {
			tile = data[index];
		}
		data[i] = tile;
	}

	write_u8(filename, data, size);
	free(data);
}

int main(int argc, char *argv[]) {
	struct Options options = {0};
	parse_args(argc, argv, &options);

	argc -= optind;
	argv += optind;
	if (argc < 2) {
		usage_exit(1);
	}

	int width;
	read_dimensions(argv[1], &width);
	long tiles_size;
	uint8_t *tiles = read_tiles(argv[0], width, &tiles_size);

	if (options.out_filename) {
		write_graphics(options.out_filename, tiles, tiles_size, width * width, options.girafarig);
	}
	if (options.map_filename) {
		write_tilemap(options.map_filename, tiles, tiles_size, width * width, options.girafarig);
	}

	free(tiles);
	return 0;
}
