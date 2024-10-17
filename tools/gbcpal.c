#define PROGRAM_NAME "gbcpal"
#define USAGE_OPTS "[-h|--help] [-r|--reverse] out.gbcpal in.gbcpal..."

#include "common.h"

bool reverse;

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"reverse", no_argument, 0, 'r'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "rh", long_options)) != -1;) {
		switch (opt) {
		case 'r':
			reverse = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

struct Color {
	uint8_t r, g, b;
};

const struct Color BLACK = {0, 0, 0};
const struct Color WHITE = {31, 31, 31};

uint16_t pack_color(struct Color color) {
	return (color.b << 10) | (color.g << 5) | color.r;
}

struct Color unpack_color(uint16_t gbc_color) {
	return (struct Color){
		.r = gbc_color & 0x1f,
		.g = (gbc_color >> 5) & 0x1f,
		.b = (gbc_color >> 10) & 0x1f,
	};
}

bool same_color(struct Color color1, struct Color color2) {
	return color1.r == color2.r && color1.g == color2.g && color1.b == color2.b;
}

double luminance(struct Color color) {
	return 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
}

int compare_luminance(const void *color1, const void *color2) {
	double lum1 = luminance(*(const struct Color *)color1);
	double lum2 = luminance(*(const struct Color *)color2);
	// sort lightest to darkest, or darkest to lightest if reversed
	return ((lum1 < lum2) - (lum1 > lum2)) * (reverse ? -1 : 1);
}

void read_gbcpal(const char *filename, struct Color **colors, size_t *num_colors) {
	long filesize;
	uint8_t *bytes = read_u8(filename, &filesize);
	if (filesize == 0) {
		error_exit("%s: empty gbcpal file\n", filename);
	}
	if (filesize % 2) {
		error_exit("%s: invalid gbcpal file\n", filename);
	}

	size_t new_colors = filesize / 2;
	*colors = xrealloc(*colors, (sizeof **colors) * (*num_colors + new_colors));
	for (size_t i = 0; i < new_colors; i++) {
		uint16_t gbc_color = (bytes[i * 2 + 1] << 8) | bytes[i * 2];
		(*colors)[*num_colors + i] = unpack_color(gbc_color);
	}
	*num_colors += new_colors;

	free(bytes);
}

void filter_colors(struct Color *colors, size_t *num_colors) {
	size_t num_filtered = 0;
	// filter out black, white, and duplicate colors
	for (size_t i = 0; i < *num_colors; i++) {
		struct Color color = colors[i];
		if (!same_color(color, BLACK) && !same_color(color, WHITE) &&
			(num_filtered == 0 || !same_color(color, colors[num_filtered - 1]))) {
			colors[num_filtered++] = color;
		}
	}
	*num_colors = num_filtered;
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (argc < 2) {
		usage_exit(1);
	}

	const char *out_filename = argv[0];

	struct Color *colors = NULL;
	size_t num_colors = 0;
	for (int i = 1; i < argc; i++) {
		read_gbcpal(argv[i], &colors, &num_colors);
	}

	qsort(colors, num_colors, sizeof(*colors), compare_luminance);
	filter_colors(colors, &num_colors);

	struct Color pal_colors[4] = {
		WHITE,
		num_colors > 0 ? colors[0] : WHITE,
		num_colors > 1 ? colors[1] : num_colors > 0 ? colors[0] : BLACK,
		BLACK,
	};
	if (num_colors > 2) {
		error_exit("%s: more than 2 colors besides black and white (%zu)\n", out_filename, num_colors);
	}

	uint8_t bytes[COUNTOF(pal_colors) * 2] = {0};
	for (size_t i = 0; i < COUNTOF(pal_colors); i++) {
		uint16_t packed_color = pack_color(pal_colors[i]);
		bytes[2 * i] = packed_color & 0xff;
		bytes[2 * i + 1] = packed_color >> 8;
	}
	write_u8(out_filename, bytes, COUNTOF(bytes));

	free(colors);
	return 0;
}
