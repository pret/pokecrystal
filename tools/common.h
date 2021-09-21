#ifndef GUARD_COMMON_H
#define GUARD_COMMON_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <inttypes.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <getopt.h>

#ifndef PROGRAM_NAME
#error Define PROGRAM_NAME before including common.h!
#endif
#ifndef USAGE_OPTS
#error Define USAGE_OPTS before including common.h!
#endif

#define error_exit(...) exit((fprintf(stderr, PROGRAM_NAME ": " __VA_ARGS__), 1))

void usage_exit(int status) {
	fprintf(stderr, "Usage: " PROGRAM_NAME " " USAGE_OPTS "\n");
	exit(status);
}

int getopt_long_index;
#define getopt_long(argc, argv, optstring, longopts) getopt_long(argc, argv, optstring, longopts, &getopt_long_index)

void *malloc_verbose(size_t size) {
	errno = 0;
	void *m = malloc(size);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

void *calloc_verbose(size_t size) {
	errno = 0;
	void *m = calloc(size, 1);
	if (!m) {
		error_exit("Could not allocate %zu bytes: %s\n", size, strerror(errno));
	}
	return m;
}

FILE *fopen_verbose(const char *filename, char rw) {
	char mode[3] = {rw, 'b', '\0'};
	errno = 0;
	FILE *f = fopen(filename, mode);
	if (!f) {
		error_exit("Could not open file \"%s\": %s\n", filename, strerror(errno));
	}
	return f;
}

void fread_verbose(uint8_t *data, size_t size, const char *filename, FILE *f) {
	errno = 0;
	if (fread(data, 1, size, f) != size) {
		fclose(f);
		error_exit("Could not read from file \"%s\": %s\n", filename, strerror(errno));
	}
}

void fwrite_verbose(const uint8_t *data, size_t size, const char *filename, FILE *f) {
	errno = 0;
	if (fwrite(data, 1, size, f) != size) {
		fclose(f);
		error_exit("Could not write to file \"%s\": %s\n", filename, strerror(errno));
	}
}

long file_size_verbose(const char *filename, FILE *f) {
	long size = -1;
	errno = 0;
	if (!fseek(f, 0, SEEK_END)) {
		size = ftell(f);
		if (size != -1) {
			rewind(f);
		}
	}
	if (size == -1) {
		error_exit("Could not measure file \"%s\": %s\n", filename, strerror(errno));
	}
	return size;
}

uint8_t *read_u8(const char *filename, long *size) {
	FILE *f = fopen_verbose(filename, 'r');
	*size = file_size_verbose(filename, f);
	uint8_t *data = malloc_verbose(*size);
	fread_verbose(data, *size, filename, f);
	fclose(f);
	return data;
}

void write_u8(const char *filename, uint8_t *data, size_t size) {
	FILE *f = fopen_verbose(filename, 'w');
	fwrite_verbose(data, size, filename, f);
	fclose(f);
}

uint32_t read_png_width_verbose(const char *filename) {
	FILE *f = fopen_verbose(filename, 'r');
	uint8_t header[16] = {0};
	fread_verbose(header, sizeof(header), filename, f);
	static uint8_t expected_header[16] = {
		0x89, 'P', 'N', 'G', '\r', '\n', 0x1A, '\n', // signature
		0, 0, 0, 13,                                 // IHDR chunk length
		'I', 'H', 'D', 'R',                          // IHDR chunk type
	};
	if (memcmp(header, expected_header, sizeof(header))) {
		fclose(f);
		error_exit("Not a valid PNG file: \"%s\"\n", filename);
	}
	uint8_t bytes[4] = {0};
	fread_verbose(bytes, sizeof(bytes), filename, f);
	fclose(f);
	return (bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | bytes[3];
}

void read_dimensions(const char *filename, int *width) {
	long filesize;
	uint8_t *bytes = read_u8(filename, &filesize);
	if (filesize != 1) {
		error_exit("%s: invalid dimensions file\n", filename);
	}
	uint8_t dimensions = bytes[0];
	free(bytes);
	*width = dimensions & 0xF;
	int height = dimensions >> 4;
	if (*width != height || (*width != 5 && *width != 6 && *width != 7)) {
		error_exit("%s: invalid dimensions: %dx%d tiles\n", filename, *width, height);
	}
}

#endif // GUARD_COMMON_H
