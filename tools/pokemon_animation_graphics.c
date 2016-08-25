#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

static void usage(void) {
	printf("Usage: pokemon_animation_graphics [-o outfile] [-t mapfile] 2bpp_file dimensions_file\n");
	exit(1);
}

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

int get_tile_index(uint8_t* tile, uint8_t* tiles, int num_tiles) {
	int i;
	int j;
	for (i = 0; i < num_tiles; i++) {
		for (j = 0; j < 16; j++) {
			if (tile[j] != tiles[16 * i + j]) {
				break;
			}
		}
		if (j == 16) {
			return i;
		}
	}
	return -1;
}

void create_tilemap(struct Tilemap* tilemap, struct Graphic* graphic, char* graphics_filename, int width, int height) {
	long graphics_size;
	uint8_t* graphics;
	FILE* f;
	int tile;
	int num_tiles;
	int i;

	f = fopen(graphics_filename, "rb");
	fseek(f, 0, SEEK_END);
	graphics_size = ftell(f);
	rewind(f);
	graphics = malloc(graphics_size);
	fread(graphics, 1, graphics_size, f);
	fclose(f);

	// transpose each frame
	for (i = 0; i < graphics_size / (width * height); i++) {
		transpose_tiles(graphics + i * (width * height) * 16, width, width * height * 16, 16);
	}

	// first frame is naively populated with redundant tiles
	num_tiles = width * height;
	tilemap->data = malloc(graphics_size / 16);
	for (i = 0; i < num_tiles; i++) {
		tilemap->data[tilemap->size] = i;
		tilemap->size++;
	}
	for (i = width * height; i < graphics_size / 16; i++) {
		tile = get_tile_index(graphics + i * 16, graphics, i);
		if (tile == -1) {
			tilemap->data[tilemap->size] = num_tiles;
			tilemap->size++;
			num_tiles++;
		} else {
			tilemap->data[tilemap->size] = tile;
			tilemap->size++;
		}
	}

	graphic->data = malloc(tilemap->size * 16);
	graphic->size = 16 * width * height;
	memcpy(graphic->data, graphics, graphic->size);
	for (i = width * height; i < tilemap->size; i++) {
		tile = get_tile_index(graphics + 16 * i, graphic->data, graphic->size / 16);
		if (tile == -1) {
			memcpy(graphic->data + graphic->size, graphics + 16 * i, 16);
			graphic->size += 16;
		}
	}

	free(graphics);
}

int main(int argc, char* argv[]) {
	int ch;
	char* dimensions_filename;
	char* graphics_filename;
	char* outfile;
	char* mapfile;
	FILE* f;
	long size;
	uint8_t bytes[1];
	int width;
	int height;
	struct Graphic graphic = {0};
	struct Tilemap tilemap = {0};

	while ((ch = getopt(argc, argv, "o:t:")) != -1) {
		switch (ch) {
			case 'o':
				outfile = optarg;
				break;
			case 't':
				mapfile = optarg;
				break;
			default:
				usage();
		}
	}
	argc -= optind;
	argv += optind;

	if (argc < 2) {
		usage();
	}

	graphics_filename = argv[0];
	dimensions_filename = argv[1];

	f = fopen(dimensions_filename, "rb");
	fread(bytes, 1, 1, f);
	fclose(f);
	width = bytes[0] & 0xf;
	height = bytes[0] >> 4;

	create_tilemap(&tilemap, &graphic, graphics_filename, width, height);

	if (outfile != NULL) {
		f = fopen(outfile, "wb");
		fwrite(graphic.data, 1, graphic.size, f);
		fclose(f);
	}

	if (mapfile != NULL) {
		f = fopen(mapfile, "wb");
		fwrite(tilemap.data, 1, tilemap.size, f);
		fclose(f);
	}

	free(graphic.data);
	free(tilemap.data);

	return 0;
}
