#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void usage(void) {
	printf("Usage: scan_includes filename\n");
	exit(1);
}

void scan_file(char* filename) {
	FILE* f;
	long size;
	char* orig;
	char* buffer;
	char* include;
	int length;

	f = fopen(filename, "r");
	if (f == NULL) {
		fprintf(stderr, "Could not open file: '%s'\n", filename);
		exit(1);
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

int main(int argc, char* argv[]) {
	if (argc < 2) {
		usage();
	}
	scan_file(argv[1]);
	return 0;
}
