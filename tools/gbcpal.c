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

double luminance(struct Color color) {
	return 0.299 * color.r * color.r + 0.587 * color.g * color.g + 0.114 * color.b * color.b;
}

int compare_colors(const void *color1, const void *color2) {
	double lum1 = luminance(*(const struct Color *)color1);
	double lum2 = luminance(*(const struct Color *)color2);
	return (lum1 < lum2) - (lum1 > lum2); // sort lightest to darkest
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

void filter_colors(struct Color **colors, size_t *num_colors) {
	size_t num_filtered = 0;
	struct Color *filtered = xmalloc((sizeof **colors) * *num_colors);

	for (size_t i = 0; i < *num_colors; i++) {
		struct Color color = (*colors)[i];
		if (color.r == 0 && color.g == 0 && color.b == 0) {
			continue; // filter out black
		}
		if (color.r == 31 && color.g == 31 && color.b == 31) {
			continue; // filter out white
		}
		if (num_filtered > 0) {
			struct Color last = filtered[num_filtered - 1];
			if (color.r == last.r && color.g == last.g && color.b == last.b) {
				continue; // filter out duplicates
			}
		}
		filtered[num_filtered++] = color;
	}

	free(*colors);
	*num_colors = num_filtered;
	*colors = filtered;
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

	qsort(colors, num_colors, sizeof(*colors), compare_colors);
	filter_colors(&colors, &num_colors);

	uint16_t first, second;
	if (num_colors == 0) {
		// colors are white and black
		first = 0x7fff;
		second = 0x0000;
	} else if (num_colors == 1) {
		// colors are both the same one
		first = pack_color(colors[0]);
		second = first;
	} else if (num_colors == 2) {
		// colors are light and dark
		first = pack_color(colors[0]);
		second = pack_color(colors[1]);
		if (reverse) {
			// darker color is first
			uint16_t tmp = first;
			first = second;
			second = tmp;
		}
	} else {
		error_exit("%s: more than 2 colors besides black and white (%zu)\n", out_filename, num_colors);
	}

	uint8_t bytes[8] = {
		0xff, 0x7f, // white
		first & 0xff, first >> 8,
		second & 0xff, second >> 8,
		0x00, 0x00, // black
	};
	write_u8(out_filename, bytes, COUNTOF(bytes));

	free(colors);
	return 0;
}
