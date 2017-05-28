#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <getopt.h>

void usage(void) {
	printf("Usage: scan_includes [-h] [-s] filename\n"
	       "-h, --help\n"
	       "    Print usage and exit\n"
	       "-s, --strict\n"
	       "    Fail if a file cannot be read\n");
}

struct Options {
	bool help;
	bool strict;
};

struct Options Options = {0};


void scan_file(char* filename) {
	FILE* f;
	long size;
	char* orig;
	char* buffer;
	char* include;
	int length;

	f = fopen(filename, "r");
	if (!f) {
		if (Options.strict) {
			fprintf(stderr, "Could not open file: '%s'\n", filename);
			exit(1);
		} else {
			return;
		}
	}

	fseek(f, 0, SEEK_END);
	size = ftell(f);
	rewind(f);

	buffer = malloc(size + 1);
	orig = buffer;
	fread(buffer, 1, size, f);
	buffer[size] = '\0';
	fclose(f);

	for (; buffer && (buffer - orig < size); buffer++) {
		if (buffer[0] == ';') {
			buffer = strchr(buffer, '\n');
			if (!buffer) {
				fprintf(stderr, "%s: no newline at end of file\n", filename);
				break;
			}
			continue;
		}
		bool is_include = false;
		bool is_incbin = false;
		if ((strncmp(buffer, "INCBIN", 6) == 0) || (strncmp(buffer, "incbin", 6) == 0)) {
			is_incbin = true;
		} else if ((strncmp(buffer, "INCLUDE", 7) == 0) || (strncmp(buffer, "include", 7) == 0)) {
			is_include = true;
		}
		if (is_incbin || is_include) {
			buffer = strchr(buffer, '"') + 1;
			if (!buffer) {
				break;
			}
			length = strcspn(buffer, "\"");
			include = malloc(length + 1);
			strncpy(include, buffer, length);
			include[length] = '\0';
			printf("%s ", include);
			if (is_include) {
				scan_file(include);
			}
			free(include);
		}
	}

	free(orig);
}

void get_args(int argc, char *argv[]) {
	while (1) {
		struct option long_options[] = {
			{"strict", no_argument, 0, 's'},
			{"help", no_argument, 0, 'h'},
			{0}
		};
		int i = 0;
		int opt = getopt_long(argc, argv, "sh", long_options, &i);

		if (opt == -1) {
			break;
		}

		switch (opt) {
		case 's':
			Options.strict = true;
			break;
		case 'h':
			Options.help = true;
			break;
		}
	}
}

int main(int argc, char* argv[]) {
	get_args(argc, argv);
	argc -= optind;
	argv += optind;
	if (Options.help) {
		usage();
		return 0;
	}
	if (argc < 1) {
		usage();
		exit(1);
	}
	scan_file(argv[0]);
	return 0;
}
