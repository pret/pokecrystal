#define PROGRAM_NAME "pokemon_animation"
#define USAGE_OPTS "[-h|--help] [-b|--bitmasks] [-f|--frames] front.animated.tilemap front.dimensions"

#include "common.h"

struct Options {
	bool use_bitmasks;
	bool use_frames;
};

void parse_args(int argc, char *argv[], struct Options *options) {
	struct option long_options[] = {
		{"bitmasks", no_argument, 0, 'b'},
		{"frames", no_argument, 0, 'f'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "bfh", long_options)) != -1;) {
		switch (opt) {
		case 'b':
			options->use_bitmasks = true;
			break;
		case 'f':
			options->use_frames = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

struct Frame {
	uint8_t *data;
	int size;
	int bitmask;
};

struct Frames {
	struct Frame *frames;
	int num_frames;
};

struct Bitmask {
	uint8_t *data;
	int bitlength;
};

struct Bitmasks {
	struct Bitmask *bitmasks;
	int num_bitmasks;
};

int bitmask_exists(const struct Bitmask *bitmask, const struct Bitmasks *bitmasks) {
	for (int i = 0; i < bitmasks->num_bitmasks; i++) {
		struct Bitmask existing = bitmasks->bitmasks[i];
		if (bitmask->bitlength != existing.bitlength) {
			continue;
		}
		bool match = true;
		int length = (bitmask->bitlength + 7) / 8;
		for (int j = 0; j < length; j++) {
			if (bitmask->data[j] != existing.data[j]) {
				match = false;
				break;
			}
		}
		if (match) {
			return i;
		}
	}
	return -1;
}

void make_frames(const uint8_t *tilemap, long tilemap_size, int width, struct Frames *frames, struct Bitmasks *bitmasks) {
	int num_tiles_per_frame = width * width;
	int num_frames = tilemap_size / num_tiles_per_frame - 1;

	frames->frames = xmalloc((sizeof *frames->frames) * num_frames);
	frames->num_frames = num_frames;

	bitmasks->bitmasks = xmalloc((sizeof *bitmasks->bitmasks) * num_frames);
	bitmasks->num_bitmasks = 0;

	const uint8_t *first_frame = &tilemap[0];
	const uint8_t *this_frame = &tilemap[num_tiles_per_frame];
	for (int i = 0; i < num_frames; i++) {
		struct Frame *frame = xmalloc(sizeof *frame);
		frame->data = xmalloc(num_tiles_per_frame);
		frame->size = 0;

		struct Bitmask *bitmask = xmalloc(sizeof *bitmask);
		bitmask->data = xcalloc((num_tiles_per_frame + 7) / 8);
		bitmask->bitlength = 0;

		for (int j = 0; j < num_tiles_per_frame; j++) {
			if (bitmask->bitlength % 8 == 0) {
				bitmask->data[bitmask->bitlength / 8] = 0;
			}
			bitmask->data[bitmask->bitlength / 8] >>= 1;
			if (this_frame[j] != first_frame[j]) {
				frame->data[frame->size] = this_frame[j];
				frame->size++;
				bitmask->data[bitmask->bitlength / 8] |= (1 << 7);
			}
			bitmask->bitlength++;
		}
		// tile order ABCDEFGHIJKLMNOP... becomes db order %HGFEDCBA %PONMLKJI ...
		int last = bitmask->bitlength - 1;
		bitmask->data[last / 8] >>= (7 - (last % 8));

		frame->bitmask = bitmask_exists(bitmask, bitmasks);
		if (frame->bitmask == -1) {
			frame->bitmask = bitmasks->num_bitmasks;
			bitmasks->bitmasks[bitmasks->num_bitmasks] = *bitmask;
			bitmasks->num_bitmasks++;
		} else {
			free(bitmask->data);
			free(bitmask);
		}
		frames->frames[i] = *frame;
		this_frame += num_tiles_per_frame;
	}
}

void print_frames(struct Frames *frames) {
	for (int i = 0; i < frames->num_frames; i++) {
		printf("\tdw .frame%d\n", i + 1);
	}
	for (int i = 0; i < frames->num_frames; i++) {
		const struct Frame *frame = &frames->frames[i];
		printf(".frame%d\n", i + 1);
		printf("\tdb $%02x ; bitmask\n", frame->bitmask);
		if (frame->size > 0) {
			for (int j = 0; j < frame->size; j++) {
				if (j % 12 == 0) {
					if (j) {
						putchar('\n');
					}
					printf("\tdb $%02x", frame->data[j]);
				} else {
					printf(", $%02x", frame->data[j]);
				}
			}
			putchar('\n');
		}
	}
}

void print_bitmasks(const struct Bitmasks *bitmasks) {
	for (int i = 0; i < bitmasks->num_bitmasks; i++) {
		struct Bitmask bitmask = bitmasks->bitmasks[i];
		printf("; %d\n", i);
		int length = (bitmask.bitlength + 7) / 8;
		for (int j = 0; j < length; j++) {
			printf("\tdb %%");
			for (int k = 0; k < 8; k++) {
				putchar(((bitmask.data[j] >> (7 - k)) & 1) ? '1' : '0');
			}
			putchar('\n');
		}
	}
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
	long tilemap_size;
	uint8_t *tilemap = read_u8(argv[0], &tilemap_size);

	struct Frames frames = {0};
	struct Bitmasks bitmasks = {0};
	make_frames(tilemap, tilemap_size, width, &frames, &bitmasks);

	if (options.use_frames) {
		print_frames(&frames);
	}
	if (options.use_bitmasks) {
		print_bitmasks(&bitmasks);
	}

	free(tilemap);
	return 0;
}
