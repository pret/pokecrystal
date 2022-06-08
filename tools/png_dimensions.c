#define PROGRAM_NAME "png_dimensions"
#define USAGE_OPTS "front.png front.dimensions"

#include "common.h"

uint8_t read_png_dimensions(const char *filename) {
	uint32_t width_px = read_png_width(filename);
	if (width_px != 40 && width_px != 48 && width_px != 56) {
		error_exit("Not a valid width for \"%s\": %" PRIu32 " px\n", filename, width_px);
	}
	uint8_t width_tiles = (uint8_t)(width_px / 8);
	return (width_tiles << 4) | width_tiles;
}

int main(int argc, char *argv[]) {
	if (argc < 3) {
		usage_exit(1);
	}

	uint8_t output_byte = read_png_dimensions(argv[1]);
	write_u8(argv[2], &output_byte, 1);
	return 0;
}
