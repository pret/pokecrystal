#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <getopt.h>
#include <stdint.h>

static void usage(void) {
	printf("Usage: pokemon_animation_graphics [-o outfile] [-t mapfile] 2bpp_file dimensions_file\n");
	exit(1);
}

struct Options {
	int girafarig;
};

struct Options Options = {0};


struct Tilemap {
	uint8_t* data;
	int size;
};

struct Graphic {
	uint8_t* data;
	int size;
};

void transpose_tiles(uint8_t* tiles, int width, int size, int tile_size) {
	int i;
	int j;
	uint8_t* new_tiles;
	new_tiles = malloc(size);
	for (i = 0; i < size; i++) {
		j = i / tile_size * width * tile_size;
		j = j % size + tile_size * (j / size) + i % tile_size;
		new_tiles[j] = tiles[i];
	}
	memcpy(tiles, new_tiles, size);
	free(new_tiles);
}

bool compare_tile(uint8_t *tile, uint8_t *other) {
	int j;
	for (j = 0; j < 16; j++) {
		if (tile[j] != other[j]) {
			return false;
		}
	}
	return true;
}

int get_tile_index(uint8_t* tile, uint8_t* tiles, int num_tiles, int preferred_tile_id) {
	if (preferred_tile_id >= 0 && preferred_tile_id < num_tiles) {
		uint8_t *other = &tiles[preferred_tile_id * 16];
		if (compare_tile(tile, other)) {
			return preferred_tile_id;
		}
	}
	int i;
	for (i = 0; i < num_tiles; i++) {
		uint8_t *other = &tiles[i * 16];
		if (compare_tile(tile, other)) {
			return i;
		}
	}
	return -1;
}

FILE *fopen_verbose(char *filename, char *mode) {
	FILE *f = fopen(filename, mode);
	if (!f) {
		fprintf(stderr, "Could not open file: \"%s\"\n", filename);
	}
	return f;
}

void create_tilemap(struct Tilemap* tilemap, struct Graphic* graphic, char* graphics_filename, int width, int height) {
	long graphics_size;
	uint8_t* graphics;
	FILE* f;
	int i;
	int tile;

	f = fopen_verbose(graphics_filename, "rb");
	if (!f) {
		exit(1);
	}
	fseek(f, 0, SEEK_END);
	graphics_size = ftell(f);
	if (!graphics_size) {
		fprintf(stderr, "empty file %s\n", graphics_filename);
		exit(1);
	}
	rewind(f);
	graphics = malloc(graphics_size);
	if (!graphics) {
		fprintf(stderr, "malloc failure\n");
		exit(1);
	}
	if (graphics_size != (long)fread(graphics, 1, graphics_size, f)) {
		fprintf(stderr, "failed to read file %s\n", graphics_filename);
		exit(1);
	}
	fclose(f);

	int num_tiles_per_frame = width * height;
	int tile_size = 16;
	int num_frames = graphics_size / (tile_size * num_tiles_per_frame);
	int frame_size = num_tiles_per_frame * tile_size;

	// transpose each frame
	for (i = 0; i < num_frames; i++) {
		transpose_tiles(graphics + i * frame_size, width, frame_size, tile_size);
	}

	// first frame is naively populated with redundant tiles,
	// so fill it unconditionally and start from the second frame
	int num_tiles = width * height;
	int tilemap_size = graphics_size / tile_size;
	tilemap->data = malloc(tilemap_size * 2);
	for (i = 0; i < num_tiles; i++) {
		tilemap->data[tilemap->size] = i;
		tilemap->size++;
	}
	for (i = num_tiles; i < tilemap_size; i++) {
		int preferred = i % num_tiles_per_frame;
		int index = get_tile_index(graphics + i * tile_size, graphics, i, preferred);
		if (Options.girafarig && index == 0) {
			tile = num_tiles;
		} else if (index == -1) {
			tile = num_tiles++;
		} else {
			tile = tilemap->data[index];
		}
		tilemap->data[tilemap->size] = tile;
		tilemap->size++;
	}

	int graphic_size = tilemap->size * 16;
	if (Options.girafarig) {
		// This is probably not needed, but just in case...
		graphic_size += 16;
	}

	graphic->data = malloc(graphic_size);
	graphic->size = 16 * width * height;
	memcpy(graphic->data, graphics, graphic->size);
	for (i = width * height; i < tilemap->size; i++) {
		tile = get_tile_index(graphics + 16 * i, graphic->data, graphic->size / 16, i % num_tiles_per_frame);
		if (tile == -1) {
			memcpy(graphic->data + graphic->size, graphics + 16 * i, 16);
			graphic->size += 16;
		}
	}
	if (Options.girafarig) {
		// Add a duplicate of tile 0 to the end.
		memcpy(graphic->data + graphic->size, graphics, 16);
		graphic->size += 16;
	}

	free(graphics);
}

int main(int argc, char* argv[]) {
	char* dimensions_filename;
	char* graphics_filename;
	char* outfile = NULL;
	char* mapfile = NULL;
	FILE* f;
	uint8_t bytes[1];
	int width;
	int height;
	struct Graphic graphic = {0};
	struct Tilemap tilemap = {0};

	while (1) {
		struct option long_options[] = {
			{"girafarig", no_argument, &Options.girafarig, 1},
			{"tilemap", required_argument, 0, 't'},
			{"output", required_argument, 0, 'o'},
			{0}
		};
		int long_option_index = 0;
		int opt = getopt_long(argc, argv, "o:t:", long_options, &long_option_index);
		if (opt == -1) {
			break;
		}
		switch (opt) {
		case 0:
			break;
		case 'o':
			outfile = optarg;
			break;
		case 't':
			mapfile = optarg;
			break;
		default:
			usage();
			break;
		}
	}
	argc -= optind;
	argv += optind;

	if (argc < 2) {
		usage();
	}

	graphics_filename = argv[0];
	dimensions_filename = argv[1];

	f = fopen_verbose(dimensions_filename, "rb");
	if (!f) {
		exit(1);
	}
	if (1 != fread(bytes, 1, 1, f)) {
		fprintf(stderr, "failed to read file %s\n", dimensions_filename);
		exit(1);
	}
	fclose(f);
	width = bytes[0] & 0xf;
	height = bytes[0] >> 4;

	create_tilemap(&tilemap, &graphic, graphics_filename, width, height);

	if (outfile) {
		f = fopen_verbose(outfile, "wb");
		if (f) {
			fwrite(graphic.data, 1, graphic.size, f);
			fclose(f);
		}
	}

	if (mapfile) {
		f = fopen_verbose(mapfile, "wb");
		if (f) {
			fwrite(tilemap.data, 1, tilemap.size, f);
			fclose(f);
		}
	}

	free(graphic.data);
	free(tilemap.data);

	return 0;
}
