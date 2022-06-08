#define PROGRAM_NAME "bpp2png"
#define USAGE_OPTS "[-h|--help] [-w width] [-d depth] [-p in.gbcpal] [-t] in.2bpp|in.1bpp out.png"

#include "common.h"
#include "lodepng/lodepng.h"

struct Options {
	unsigned int width;
	unsigned int depth;
	const char *palette;
	bool transpose;
};

typedef uint8_t Palette[4][3];

void parse_args(int argc, char *argv[], struct Options *options) {
	struct option long_options[] = {
		{"width", required_argument, 0, 'w'},
		{"depth", required_argument, 0, 'd'},
		{"palette", required_argument, 0, 'p'},
		{"transpose", no_argument, 0, 't'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "w:d:p:th", long_options)) != -1;) {
		switch (opt) {
		case 'w':
			options->width = (unsigned int)strtoul(optarg, NULL, 0);
			if (options->width % 8) {
				error_exit("Width not divisible by 8 px: %u\n", options->width);
			}
			break;
		case 'd':
			options->depth = (unsigned int)strtoul(optarg, NULL, 0);
			if (options->depth != 1 && options->depth != 2) {
				error_exit("Depth is not 1 or 2: %u\n", options->depth);
			}
			break;
		case 'p':
			options->palette = optarg;
			break;
		case 't':
			options->transpose = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

bool is_1bpp(const char *filename) {
	const char *end = strrchr(filename, '.');
	return end && strlen(end) == 5 && end[1] == '1' && (end[2] == 'b' || end[2] == 'B')
		&& (end[3] == 'p' || end[3] == 'P') && (end[4] == 'p' || end[4] == 'P');
}

uint8_t *extend_1bpp_to_2bpp(uint8_t *bpp_data, long *size) {
	*size *= 2;
	bpp_data = xrealloc(bpp_data, *size);
	for (long i = *size - 2; i >= 0; i -= 2) {
		bpp_data[i] = bpp_data[i + 1] = bpp_data[i >> 1];
	}
	return bpp_data;
}

void mingle_2bpp_planes(uint8_t *bpp_data, long size) {
	for (long i = 0; i < size; i += 2) {
		// Interleave aka "mingle" bits
		// <https://graphics.stanford.edu/~seander/bithacks.html#Interleave64bitOps>
#define EXPAND_PLANE(b) (((((b) * 0x0101010101010101ULL & 0x8040201008040201ULL) * 0x0102040810204081ULL) >> 48) & 0xAAAA)
		uint16_t r = (EXPAND_PLANE(bpp_data[i]) >> 1) | EXPAND_PLANE(bpp_data[i + 1]);
		bpp_data[i] = r >> 8;
		bpp_data[i + 1] = r & 0xff;
	}
}

unsigned int calculate_size(long bytes, unsigned int *width) {
	long pixels = bytes * 4;
	if (pixels % (8 * 8)) {
		return 0;
	}
	if (!*width) {
		// If no width is specified, try to guess an appropriate one
#define GUESS_SIZE(w, h) pixels == (w) * (h) * 8 * 8 ? (w) * 8
		*width = GUESS_SIZE(5, 5) // mon pic
			: GUESS_SIZE(6, 6) // mon front/back pic
			: GUESS_SIZE(7, 7) // mon/trainer pic
			: GUESS_SIZE(2, 4) // mon icon
			: GUESS_SIZE(2, 12) // walking sprite
			: GUESS_SIZE(2, 6) // standing sprite
			: GUESS_SIZE(2, 2) // still sprite
			: GUESS_SIZE(4, 4) // big sprite
			: pixels > 16 * 8 * 8 ? 16 * 8 // maximum width
			: (unsigned int)(pixels / 8);
	}
	unsigned int height = (unsigned int)((pixels + *width * 8 - 1) / (*width * 8) * 8);
	if (*width == 0 || height == 0) {
		error_exit("Not divisible into 8x8-px tiles: %ux%u\n", *width, height);
	}
	return height;
}

uint8_t *pad_to_rectangle(uint8_t *bpp_data, long filesize, unsigned int width, unsigned int height) {
	unsigned int size = width * height / 4;
	if (size > filesize) {
		bpp_data = xrealloc(bpp_data, size);
		// Fill padding with white
		memset(bpp_data + filesize, 0, size - filesize);
	}
	return bpp_data;
}

uint8_t *transpose_tiles(uint8_t *bpp_data, unsigned int width, unsigned int height) {
	unsigned int size = width * height / 4;
	uint8_t *transposed = xmalloc(size);
	unsigned int cols = width / 8;
	for (unsigned int i = 0; i < size; i++) {
		unsigned int j = (i / 0x10) * cols * 0x10;
		j = (j % size) + 0x10 * (j / size) + (i % 0x10);
		transposed[j] = bpp_data[i];
	}
	free(bpp_data);
	return transposed;
}

uint8_t *rearrange_tiles_to_scanlines(uint8_t *bpp_data, unsigned int width, unsigned int height) {
	unsigned int size = width * height / 4;
	uint8_t *rearranged = xmalloc(size);
	unsigned int cols = width / 8;
	unsigned int j = 0;
	for (unsigned int line = 0; line < height; line++) {
		unsigned int row = line / 8;
		for (unsigned int col = 0; col < cols; col++) {
			unsigned int i = ((row * cols + col) * 8 + line % 8) * 2;
			rearranged[j] = bpp_data[i];
			rearranged[j + 1] = bpp_data[i + 1];
			j += 2;
		}
	}
	free(bpp_data);
	return rearranged;
}

void read_gbcpal(Palette palette, const char *filename) {
	long filesize;
	uint8_t *pal_data = read_u8(filename, &filesize);
	if (filesize != 4 * 2) {
		error_exit("Invalid .gbcpal file: \"%s\"\n", filename);
	}
	for (int i = 0; i < 4; i++) {
		uint8_t b1 = pal_data[i * 2], b2 = pal_data[i * 2 + 1];
#define RGB5_TO_RGB8(x) (uint8_t)(((x) << 3) | ((x) >> 2))
		palette[i][0] = RGB5_TO_RGB8(b1 & 0x1f); // red
		palette[i][1] = RGB5_TO_RGB8(((b1 & 0xe0) >> 5) | ((b2 & 0x03) << 3)); // green
		palette[i][2] = RGB5_TO_RGB8((b2 & 0x7c) >> 2); // blue
	}
	free(pal_data);
}

unsigned int write_png(const char *filename, uint8_t *bpp_data, unsigned int width, unsigned int height, Palette palette) {
	LodePNGState state;
	lodepng_state_init(&state);
	state.info_raw.bitdepth = state.info_png.color.bitdepth = 2;

	if (palette) {
		state.info_raw.colortype = state.info_png.color.colortype =  LCT_PALETTE;
		for (int i = 0; i < 4; i++) {
			uint8_t *color = palette[i];
			lodepng_palette_add(&state.info_raw, color[0], color[1], color[2], 0xff);
			lodepng_palette_add(&state.info_png.color, color[0], color[1], color[2], 0xff);
		}
	} else {
		state.info_raw.colortype = state.info_png.color.colortype = LCT_GREY;
		// 2-bit PNG white/light/dark/gray indexes are the inverse of 2bpp
		for (unsigned int i = 0; i < width * height / 4; i++) {
			bpp_data[i] = ~bpp_data[i];
		}
	}

	unsigned char *buffer;
	size_t buffer_size;
	lodepng_encode(&buffer, &buffer_size, bpp_data, width, height, &state);
	unsigned int error = state.error;
	lodepng_state_cleanup(&state);
	if (!error) {
		error = lodepng_save_file(buffer, buffer_size, filename);
	}

	free(buffer);
	return error;
}

int main(int argc, char *argv[]) {
	struct Options options = {0};
	parse_args(argc, argv, &options);

	argc -= optind;
	argv += optind;
	if (argc != 2) {
		usage_exit(1);
	}

	Palette palette = {0};
	if (options.palette) {
		read_gbcpal(palette, options.palette);
	}

	const char *bpp_filename = argv[0];
	long filesize;
	uint8_t *bpp_data = read_u8(bpp_filename, &filesize);
	if (!options.depth) {
		options.depth = is_1bpp(bpp_filename) ? 1 : 2;
	}
	if (!filesize || filesize % (8 * options.depth)) {
		error_exit("Invalid .%dbpp file: \"%s\"\n", options.depth, bpp_filename);
	}
	if (options.depth == 1) {
		bpp_data = extend_1bpp_to_2bpp(bpp_data, &filesize);
	}
	mingle_2bpp_planes(bpp_data, filesize);

	unsigned int height = calculate_size(filesize, &options.width);
	bpp_data = pad_to_rectangle(bpp_data, filesize, options.width, height);
	if (options.transpose) {
		bpp_data = transpose_tiles(bpp_data, options.width, height);
	}
	bpp_data = rearrange_tiles_to_scanlines(bpp_data, options.width, height);

	const char *png_filename = argv[1];
	unsigned int error = write_png(png_filename, bpp_data, options.width, height, options.palette ? palette : NULL);
	if (error) {
		error_exit("Could not write to file \"%s\": %s\n", png_filename, lodepng_error_text(error));
	}

	free(bpp_data);
	return 0;
}
