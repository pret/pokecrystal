#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>

void usage(void) {
	printf("Usage: palette palfile\n");
	exit(1);
}

void print_rgb(uint16_t word) {
	int r, g, b;
	r = word & 0x1f;
	g = (word >> 5) & 0x1f;
	b = (word >> 10) & 0x1f;
	printf("\tRGB %2d, %2d, %2d\n", r, g, b);
}

void print_pokemon_palette(char* palette_filename) {
	FILE* f;
	uint8_t bytes[4];

	f = fopen(palette_filename, "rb");
	if (f == NULL) {
		fprintf(stderr, "failed to open file %s\n", palette_filename);
		exit(1);
	}

	fseek(f, 2, SEEK_SET);
	fread(bytes, 1, 4, f);
	fclose(f);

	print_rgb((bytes[1] << 8) | bytes[0]);
	print_rgb((bytes[3] << 8) | bytes[2]);
}

void print_palette(char* palette_filename) {
	FILE* f;
	uint8_t* bytes;
	long size;
	int i;

	f = fopen(palette_filename, "rb");
	if (f == NULL) {
		fprintf(stderr, "failed to open file %s\n", palette_filename);
		exit(1);
	}

	fseek(f, 0, SEEK_END);
	size = ftell(f);
	rewind(f);

	bytes = malloc(size);

	fseek(f, 0, SEEK_SET);
	fread(bytes, 1, size, f);
	fclose(f);

	for (i = 0; i + 1 < size; i += 2) {
		print_rgb((bytes[i + 1] << 8) | bytes[i]);
	}
}

int main(int argc, char* argv[]) {
	int ch;
	bool pokemon;

	while ((ch = getopt(argc, argv, "p")) != -1) {
		switch (ch) {
			case 'p':
				pokemon = true;
				break;
			default:
				usage();
		}
	}
	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage();
	}
	if (pokemon) {
		print_pokemon_palette(argv[0]);
	} else {
		print_palette(argv[0]);
	}
	return 0;
}
