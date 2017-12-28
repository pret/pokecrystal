#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <getopt.h>

struct Frame {
	uint8_t* data;
	int size;
	int bitmask;
};

struct Frames {
	struct Frame* frames;
	int num_frames;
	int frame_size;
};

struct Bitmask {
	uint8_t* data;
	int bitlength;
};

struct Bitmasks {
	struct Bitmask* bitmasks;
	int num_bitmasks;
};


void make_frames(struct Frames* frames, struct Bitmasks* bitmasks, char* tilemap_filename, char* dimensions_filename);
int bitmask_exists(struct Bitmask *bitmask, struct Bitmasks *bitmasks);
void print_frames(struct Frames* frames);


void make_frames(struct Frames* frames, struct Bitmasks* bitmasks, char* tilemap_filename, char* dimensions_filename) {
	uint8_t* tilemap;
	uint8_t* this_frame;
	FILE* f;
	size_t size;
	int width;
	int height;
	uint8_t byte;
	int frame_size;
	int num_frames;
	int i, j;

	f = fopen(tilemap_filename, "rb");
	if (f == NULL) {
		fprintf(stderr, "could not open file %s\n", tilemap_filename);
		exit(1);
	}

	fseek(f, 0, SEEK_END);
	size = ftell(f);
	if (!size) {
		fprintf(stderr, "empty file %s\n", tilemap_filename);
		exit(1);
	}
	rewind(f);

	tilemap = malloc(size);
	if (!tilemap) {
		fprintf(stderr, "malloc failure\n");
		exit(1);
	}
	if (size != fread(tilemap, 1, size, f)) {
		fprintf(stderr, "failed to read file %s\n", tilemap_filename);
		exit(1);
	}
	fclose(f);

	f = fopen(dimensions_filename, "rb");
	if (f == NULL) {
		fprintf(stderr, "could not open file %s\n", dimensions_filename);
		exit(1);
	}
	if (1 != fread(&byte, 1, 1, f))  {
		fprintf(stderr, "failed to read file %s\n", dimensions_filename);
		exit(1);
	}
	fclose(f);

	width = byte & 0xf;
	height = byte >> 4;

	frame_size = width * height;

	num_frames = size / frame_size - 1;
	//fprintf(stderr, "num_frames: %d\n", num_frames);

	bitmasks->bitmasks = malloc((sizeof (struct Bitmask)) * num_frames);
	bitmasks->num_bitmasks = 0;

	frames->frames = malloc((sizeof (struct Frame)) * num_frames);
	frames->frame_size = frame_size;
	frames->num_frames = 0;

	uint8_t *first_frame = tilemap;
	this_frame = tilemap + frame_size;
	for (i = 0; i < num_frames; i++) {
		struct Frame *frame = (struct Frame*)malloc(sizeof(struct Frame));
		frame->data = malloc(frame_size);
		frame->size = 0;
		struct Bitmask *bitmask = (struct Bitmask*)malloc(sizeof(struct Bitmask));
		bitmask->data = calloc((frame_size + 7) / 8, 1);
		bitmask->bitlength = 0;
		for (j = 0; j < frame_size; j++) {
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
		// I don't remember exactly why this works.
		// I think it was that the bits are read backwards, but not indexed backwards.
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
		frames->num_frames++;
		this_frame += frame_size;
	}

	//for (i = 0; i < frames->num_frames; i++) {
		//free(frames->frames[i].data);
		//free(frames->frames[i]);
	//}
	//free(frames->frames);

	//fprintf(stderr, "num bitmasks: %d\n", bitmasks->num_bitmasks);
	//for (i = 0; i < bitmasks->num_bitmasks; i++) {
	//	free(bitmasks->bitmasks[i].data);
	//	fprintf(stderr, "freed bitmask %d\n", i);
		//free(bitmasks->bitmasks[i]);
	//}
	//free(bitmasks->bitmasks);
	//fprintf(stderr, "freed bitmasks\n");

	free(tilemap);
}

int bitmask_exists(struct Bitmask *bitmask, struct Bitmasks *bitmasks) {
	int i, j;
	struct Bitmask existing;
	for (i = 0; i < bitmasks->num_bitmasks; i++) {
		existing = bitmasks->bitmasks[i];
		if (bitmask->bitlength != existing.bitlength) {
			continue;
		}
		bool match = true;
		for (j = 0; j < (bitmask->bitlength + 7) / 8; j++) {
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

void print_frames(struct Frames* frames) {
	int i;
	int j;
	for (i = 0; i < frames->num_frames; i++) {
		printf("\tdw .frame%d\n", i + 1);
	}
	for (i = 0; i < frames->num_frames; i++) {
		struct Frame *frame = &frames->frames[i];
		printf(".frame%d\n", i + 1);
		printf("\tdb $%02x ; bitmask\n", frame->bitmask);
		if (frame->size > 0) {
			for (j = 0; j < frame->size; j++) {
				if (j % 12 == 0) {
					if (j) {
						printf("\n");
					}
					printf("\tdb $%02x", frame->data[j]);
				} else {
					printf(", $%02x", frame->data[j]);
				}
			}
			printf("\n");
		}
	}
}

void print_bitmasks(struct Bitmasks* bitmasks) {
	int i, j, k;
	int length;
	struct Bitmask bitmask;
	for (i = 0; i < bitmasks->num_bitmasks; i++) {
		printf("; %d\n", i);
		bitmask = bitmasks->bitmasks[i];
		length = (bitmask.bitlength + 7) / 8;
		for (j = 0; j < length; j++) {
			printf("\tdb %%");
			for (k = 0; k < 8; k++) {
				if ((bitmask.data[j] >> (7 - k)) & 1) {
					printf("1");
				} else {
					printf("0");
				};
			}
			printf("\n");
		}
	}
}

// HOW ARE YOU GENTLEMEN.
char* cats (char* head, char* tail) {
	char* string;
	string = malloc(strlen(head) + strlen(tail) + 1);
	strcpy(string, head);
	strcat(string, tail);
	return string;
}

static void usage(void) {
	printf("Usage: pokemon_animation [-b] [-f] tilemap_file dimensions_file\n");
	exit(1);
}

int main(int argc, char* argv[]) {
	struct Frames frames = {0};
	struct Bitmasks bitmasks = {0};
	int ch;
	bool use_bitmasks = false, use_frames = false;
	char* tilemap_filename;
	char* dimensions_filename;

	while ((ch = getopt(argc, argv, "bf")) != -1) {
		switch (ch) {
			case 'b':
				use_bitmasks = true;
				break;
			case 'f':
				use_frames = true;
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
	tilemap_filename = argv[0];
	dimensions_filename = argv[1];

	//ext = strrchr(argv[3], '.');
	//if (!ext || ext == argv[3]) {
	//	fprintf(stderr, "need a file extension to determine what to write to %s\n", argv[3]);
	//}

	make_frames(&frames, &bitmasks, tilemap_filename, dimensions_filename);
	if (use_frames) {
		print_frames(&frames);
	}
	if (use_bitmasks) {
		print_bitmasks(&bitmasks);
	}
	return 0;
}
