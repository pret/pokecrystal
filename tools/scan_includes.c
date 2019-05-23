#define _DEFAULT_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <getopt.h>
#include <limits.h>

void usage(void) {
	printf("Usage: scan_includes [-h] [-s] [-i path] filename\n"
	       "-h, --help\n"
	       "    Print usage and exit\n"
	       "-s, --strict\n"
	       "    Fail if a file cannot be read\n"
	       "-i, --include\n"
	       "    Add an include path\n");
}

struct Options {
	bool help;
	bool strict;
	char **include_paths;
	int include_paths_len;
};

struct Options Options = {0};

void *xmalloc(const size_t size)
{
	void *ptr = malloc(size);
	if (!ptr) {
		perror("malloc");
		exit(1);
	}
	return ptr;
}

void options_add_file(char *fname)
{
	char *filename = strdup(fname);
	if (!filename) {
		perror("strdup");
		exit(1);
	}
	if (!(Options.include_paths = realloc(Options.include_paths,
			sizeof(Options.include_paths[0]) * ++Options.include_paths_len))) {
		perror("realloc");
		exit(1);
	}
	Options.include_paths[Options.include_paths_len - 1] = filename;
}

void scan_file(char *filename) {
	FILE *f = fopen(filename, "r");
	if (!f) {
		for (char **include = Options.include_paths;
				include < Options.include_paths + Options.include_paths_len;
				include++) {
			size_t len = strlen(*include) + strlen(filename) + 1;
			char *path = xmalloc(len);
			snprintf(path, len, "%s%s", *include, filename);
			f = fopen(path, "r");
			free(path);
			if (f) break;
		}
	}

	if (!f) {
		if (Options.strict) {
			fprintf(stderr, "Could not open file: '%s'\n", filename);
			exit(1);
		} else {
			return;
		}
	}

	fseek(f, 0, SEEK_END);
	long size = ftell(f);
	rewind(f);

	char *buffer = xmalloc(size + 1);
	char *orig = buffer;
	size = fread(buffer, 1, size, f);
	buffer[size] = '\0';
	fclose(f);

	for (; buffer && (buffer - orig < size); buffer++) {
		bool is_include = false;
		bool is_incbin = false;
		switch (*buffer) {
			case ';':
				buffer = strchr(buffer, '\n');
				if (!buffer) {
					fprintf(stderr, "%s: no newline at end of file\n", filename);
					break;
				}
				break;

			case '"':
				buffer++;
				buffer = strchr(buffer, '"');
				if (!buffer) {
					fprintf(stderr, "%s: unterminated string\n", filename);
					break;
				}
				buffer++;
				break;

			case 'i':
			case 'I':
				if ((strncmp(buffer, "INCBIN", 6) == 0) || (strncmp(buffer, "incbin", 6) == 0)) {
					is_incbin = true;
				} else if ((strncmp(buffer, "INCLUDE", 7) == 0) || (strncmp(buffer, "include", 7) == 0)) {
					is_include = true;
				}
				if (is_incbin || is_include) {
					buffer = strchr(buffer, '"');
					if (!buffer) {
						break;
					}
					buffer++;
					int length = strcspn(buffer, "\"");
					char *include = xmalloc(length + 1);
					strncpy(include, buffer, length);
					include[length] = '\0';
					printf("%s ", include);
					if (is_include) {
						scan_file(include);
					}
					free(include);
					buffer = strchr(buffer, '"');
				}
				break;

		}
		if (!buffer) {
			break;
		}

	}

	free(orig);
}

int main(int argc, char* argv[]) {
	int i = 0;
	struct option long_options[] = {
		{"strict", no_argument, 0, 's'},
		{"help", no_argument, 0, 'h'},
		{"include", required_argument, 0, 'i'},
		{0}
	};
	int opt = -1;
	while ((opt = getopt_long(argc, argv, "shi:", long_options, &i)) != -1) {
		switch (opt) {
		case 's':
			Options.strict = true;
			break;
		case 'h':
			Options.help = true;
			break;
		case 'i':
			options_add_file(optarg);
			break;
		default:
			usage();
			exit(1);
			break;
		}
	}
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
