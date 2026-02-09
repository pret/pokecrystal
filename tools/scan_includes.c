#define PROGRAM_NAME "scan_includes"
#define USAGE_OPTS "[-h|--help] [-b|--build-prefix dir] [-s|--strict] filename.asm"

#include "common.h"

#include <ctype.h>
#include <unistd.h>

struct Options {
	const char *build_prefix;
	bool strict;
};

struct Options options = {0};

char *join_build_prefix(const char *path) {
	if (!options.build_prefix || !*options.build_prefix) {
		size_t len = strlen(path) + 1;
		char *out = xmalloc(len);
		memcpy(out, path, len);
		return out;
	} else {
		size_t prefix_len = strlen(options.build_prefix);
		bool needs_slash = options.build_prefix[prefix_len - 1] != '/';
		size_t len = prefix_len + (needs_slash ? 1 : 0) + strlen(path) + 1;
		char *out = xmalloc(len);
		snprintf(out, len, "%s%s%s", options.build_prefix, needs_slash ? "/" : "", path);
		return out;
	}
}

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
		{"build-prefix", required_argument, 0, 'b'},
		{"strict", no_argument, 0, 's'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "b:sh", long_options)) != -1;) {
		switch (opt) {
		case 'b':
			options.build_prefix = optarg;
			break;
		case 's':
			options.strict = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

void scan_file(const char *filename) {
	errno = 0;
	FILE *f = fopen(filename, "rb");
	if (!f) {
		if (options.strict) {
			error_exit("Could not open file \"%s\": %s\n", filename, strerror(errno));
		} else {
			return;
		}
	}

	long size = xfsize(filename, f);
	char *contents = xmalloc(size + 1);
	xfread((uint8_t *)contents, size, filename, f);
	fclose(f);
	contents[size] = '\0';

	for (char *ptr = contents; ptr && ptr < contents + size; ptr++) {
		ptr = strpbrk(ptr, ";\"Ii");
		if (!ptr) {
			break;
		}
		switch (*ptr) {
		case ';':
			// Skip comments until the end of the line
			ptr += strcspn(ptr + 1, "\r\n");
			if (*ptr) {
				ptr++;
			}
			break;

		case '"':
			// Skip string literal until the closing quote
			ptr += strcspn(ptr + 1, "\"");
			if (*ptr) {
				ptr++;
			}
			break;

		case 'I':
		case 'i':
			/* empty statement between the label and the variable declaration */;
			// Check that an INCLUDE/INCBIN starts as its own token
			char before = ptr > contents ? *(ptr - 1) : '\n';
			if (!isspace((unsigned)before) && before != ':') {
				break;
			}
			bool is_incbin = !strncmp(ptr, "INCBIN", 6) || !strncmp(ptr, "incbin", 6);
			bool is_include = !strncmp(ptr, "INCLUDE", 7) || !strncmp(ptr, "include", 7);
			if (is_incbin || is_include) {
				// Check that an INCLUDE/INCBIN ends as its own token
				ptr += is_include ? 7 : 6;
				if (!isspace((unsigned)*ptr) && *ptr != '"') {
					break;
				}
				ptr += strspn(ptr, " \t");
				if (*ptr == '"') {
					// Print the file path and recursively scan INCLUDEs
					ptr++;
					char *include_path = ptr;
					size_t length = strcspn(ptr, "\"");
					ptr += length + 1;
					include_path[length] = '\0';
					const char *printed_path = include_path;
					char *prefixed_path = NULL;
					if (options.build_prefix && access(include_path, F_OK) != 0) {
						prefixed_path = join_build_prefix(include_path);
						printed_path = prefixed_path;
					}
					printf("%s ", printed_path);
					if (is_include) {
						scan_file(include_path);
					}
					free(prefixed_path);
				} else {
					fprintf(stderr, "%s: no file path after INC%s\n", filename, is_include ? "LUDE" : "BIN");
					// Continue to process a comment
					if (*ptr == ';') {
						ptr--;
					}
				}
			}
			break;
		}
	}

	free(contents);
}

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	scan_file(argv[0]);
	return 0;
}
