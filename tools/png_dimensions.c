#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

void usage(void) {
	fprintf(stderr, "Usage: png_dimensions infile outfile\n");
	exit(1);
}

void output_dimensions(char* png_filename, char* out_filename) {
	FILE* f;
	int width, height;
	int i;
	uint8_t bytes[4];
	uint8_t output;

	f = fopen(png_filename, "rb");
	if (f == NULL) {
		fprintf(stderr, "failed to open file %s\n", png_filename);
		exit(1);
	}

	// width
	fseek(f, 16, SEEK_SET);
	int size = fread(bytes, 1, 4, f);
	fclose(f);
	if (size != 4) {
		fprintf(stderr, "failed to read at offset 0x10 in file %s\n", png_filename);
		exit(1);
	}

	width = 0;
	for (i = 0; i < 4; i++) {
		width |= bytes[i] << (8 * (3 - i));
	}
	width >>= 3;
	height = width;

	output = width & 0xf;
	output |= (height & 0xf) << 4;

	f = fopen(out_filename, "wb");
	if (f == NULL) {
		fprintf(stderr, "failed to open file %s\n", out_filename);
		exit(1);
	}
	fwrite(&output, 1, 1, f);
	fclose(f);
}

int main(int argc, char* argv[]) {
	if (argc < 3) {
		usage();
	}
	output_dimensions(argv[1], argv[2]);
	return 0;
}
