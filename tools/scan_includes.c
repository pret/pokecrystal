#define PROGRAM_NAME "scan_includes"
#define USAGE_OPTS "[-h|--help] [-s|--strict] filename.asm"

#include "common.h"

void parse_args(int argc, char *argv[], bool *strict) {
	struct option long_options[] = {
		{"strict", no_argument, 0, 's'},
		{"help", no_argument, 0, 'h'},
		{0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "sh", long_options)) != -1;) {
		switch (opt) {
		case 's':
			*strict = true;
			break;
		case 'h':
			usage_exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

void scan_file(const char *filename, bool strict) {
	errno = 0;
	FILE *f = fopen(filename, "rb");
	if (!f) {
		if (strict) {
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

	for (char *ptr = contents; ptr && ptr - contents < size; ptr++) {
		bool is_incbin = false, is_include = false;
		switch (*ptr) {
		case ';':
			ptr = strchr(ptr, '\n');
			if (!ptr) {
				fprintf(stderr, "%s: no newline at end of file, after comment\n", filename);
				goto end_of_scan_file;
			}
			break;
		case '"':
			ptr = strchr(ptr + 1, '"');
			if (ptr) {
				ptr++;
			} else {
				fprintf(stderr, "%s: unterminated string\n", filename);
				goto end_of_scan_file;
			}
			break;
		case 'I':
		case 'i':
			is_incbin = !strncmp(ptr, "INCBIN", 6) || !strncmp(ptr, "incbin", 6);
			is_include = !strncmp(ptr, "INCLUDE", 7) || !strncmp(ptr, "include", 7);
			if (is_incbin || is_include) {
				// Worst case, this is the \0 placed before
				char after_inc_char = *(ptr + 6);
				if(is_include)
					after_inc_char = *(ptr + 7);
				// This is not a valid include/incbin. It might be something else, keep iterating
				if((after_inc_char != ' ') && (after_inc_char != '"') && (after_inc_char != '\t'))
					break;

				char* newline_ptr = strchr(ptr, '\n');
				ptr = strchr(ptr, '"');
				if (ptr) {
					if((!newline_ptr) || (ptr < newline_ptr)) {
						ptr++;
						char *include_path = ptr;
						size_t length = strcspn(ptr, "\"");
						ptr += length + 1;
						include_path[length] = '\0';
						printf("%s ", include_path);
						if (is_include) {
							scan_file(include_path, strict);
						}
					}
					else {
						// No '"' until the newline, skip to the next one
						ptr = newline_ptr;
					}
				}
				else {
					fprintf(stderr, "%s: couldn't find a path\n", filename);
					goto end_of_scan_file;
				}
			}
			break;
		}
	}

	end_of_scan_file: free(contents);
}

int main(int argc, char *argv[]) {
	bool strict = false;
	parse_args(argc, argv, &strict);

	argc -= optind;
	argv += optind;
	if (argc < 1) {
		usage_exit(1);
	}

	scan_file(argv[0], strict);
	return 0;
}
