#define PROGRAM_NAME "bpp2png"
#define USAGE_OPTS "[-h|--help] [-w width] [-d depth] [-t] in.2bpp|in.1bpp out.png"

#include "common.h"
#include "lodepng.h"

void parse_args(int argc, char *argv[], unsigned int *width, unsigned int *depth, bool *transpose) {
	struct option long_options[] = {
		{"width", required_argument, 0, 'w'},
		{"depth", required_argument, 0, 'd'},
		{"transpose", no_argument, 0, 't'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "w:d:th", long_options)) != -1;) {
		switch (opt) {
		case 'w':
			*width = (unsigned int)strtoul(optarg, NULL, 0);
			if (*width % 8) {
				error_exit("Width not divisible by 8 px: %u\n", *width);
			}
			break;
		case 'd':
			*depth = (unsigned int)strtoul(optarg, NULL, 0);
			if (*depth != 1 && *depth != 2) {
				error_exit("Depth is not 1 or 2: %u\n", *depth);
			}
			break;
		case 't':
			*transpose = true;
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
	return strlen(end) == 5 && end[1] == '1' && (end[2] == 'b' || end[2] == 'B')
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
		// Invert the bit patterns:
		// 00 = black, 01 = dark, 10 = light, 11 = white
		uint8_t b1 = ~bpp_data[i], b2 = ~bpp_data[i + 1];
		// Interleave aka "mingle" bits
		// <https://graphics.stanford.edu/~seander/bithacks.html#Interleave64bitOps>
		uint16_t r = (((b1 * 0x0101010101010101ULL & 0x8040201008040201ULL) * 0x0102040810204081ULL >> 49) & 0x5555)
			| (((b2 * 0x0101010101010101ULL & 0x8040201008040201ULL) * 0x0102040810204081ULL >> 48) & 0xAAAA);
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
		// If no width is specified, use up to 16 tiles (128 px)
		*width = pixels < 16 * 8 * 8 ? (unsigned int)(pixels / 8) : 128;
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
		memset(bpp_data + filesize, 0xff, size - filesize);
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

int main(int argc, char *argv[]) {
	unsigned int width = 0;
	unsigned int depth = 0;
	bool transpose = false;
	parse_args(argc, argv, &width, &depth, &transpose);

	argc -= optind;
	argv += optind;
	if (argc != 2) {
		usage_exit(1);
	}

	long filesize;
	uint8_t *bpp_data = read_u8(argv[0], &filesize);
	if (depth == 1 || (!depth && is_1bpp(argv[0]))) {
		bpp_data = extend_1bpp_to_2bpp(bpp_data, &filesize);
	}
	mingle_2bpp_planes(bpp_data, filesize);

	unsigned int height = calculate_size(filesize, &width);
	bpp_data = pad_to_rectangle(bpp_data, filesize, width, height);
	if (transpose) {
		bpp_data = transpose_tiles(bpp_data, width, height);
	}
	bpp_data = rearrange_tiles_to_scanlines(bpp_data, width, height);

	unsigned int error = lodepng_encode_file(argv[1], bpp_data, width, height, LCT_GREY, 2);
	if (error) {
		error_exit("Could not write to file \"%s\": %s\n", argv[1], lodepng_error_text(error));
	}

	free(bpp_data);
	return 0;
}
