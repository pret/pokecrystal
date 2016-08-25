#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

	//fprintf(stderr, "malloc: %s\n", filename);
	buffer = malloc(size + 1);
	orig = buffer;
	fread(buffer, 1, size, f);
	buffer[size] = '\0';
	fclose(f);
	//fprintf(stderr, "read: %s\n", filename);

	for (; (buffer != NULL) && (buffer != 0) && (buffer - orig < size); buffer++) {
		//fprintf(stderr, "%c", buffer[0]);
		if (buffer[0] == ';') {
			buffer = strchr(buffer, '\n');
			if (buffer == NULL) {
				fprintf(stderr, "%s: no newline at end of file\n", filename);
				break;
			}
			continue;
		}
		if (
			(strncmp(buffer, "INCBIN", 6) == 0) ||
			(strncmp(buffer, "incbin", 6) == 0)
		) {
			buffer = strchr(buffer, '"') + 1;
			if (buffer == NULL) break;
			length = strcspn(buffer, "\"");
			include = malloc(length + 1);
			strncpy(include, buffer, length);
			include[length] = '\0';
			printf("%s ", include);
			free(include);
		} else if (
			(strncmp(buffer, "INCLUDE", 7) == 0) ||
			(strncmp(buffer, "include", 7) == 0)
		) {
			buffer = strchr(buffer, '"') + 1;
			if (buffer == NULL) break;
			length = strcspn(buffer, "\"");
			include = malloc(length + 1);
			strncpy(include, buffer, length);
			include[length] = '\0';
			printf("%s ", include);
			scan_file(include);
			free(include);
		}
	}

	//fprintf(stderr, "free: %s\n", filename);
	free(orig);
	//fprintf(stderr, "freed: %s\n", filename);
}

int main(int argc, char* argv[]) {
	if (argc < 2) {
		usage();
	}
	scan_file(argv[1]);
	return 0;
}
