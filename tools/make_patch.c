#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>

#define HIGH(x) (((x) >> 8) & 0xff)
#define LOW(x) ((x) & 0xff)

struct symbol {
	struct symbol *next;
	unsigned int value;
	char name[];
};

struct patch {
	unsigned int offset;
	unsigned int size;
};

struct buffer {
	size_t size;
	char buffer[];
};

void free_buffer(void *buf) {
	struct buffer *buffer = (struct buffer *)((char *)buf - sizeof(struct buffer));
	free(buffer);
}

void *create_buffer(void) {
	struct buffer *buffer = malloc(sizeof(struct buffer) + 0x100);
	if (!buffer) {
		fprintf(stderr, "Error: Cannot allocate memory\n");
		return NULL;
	}

	buffer->size = 0x100;
	return buffer->buffer;
}

void *expand_buffer(void *buf, const size_t size) {
	struct buffer *buffer = (struct buffer *)((char *)buf - sizeof(struct buffer));

	if (size > buffer->size) {
		buffer = realloc(buffer, (buffer->size += 0x100));
		if (!buffer) {
			free_buffer(buf);
			fprintf(stderr, "Error: Cannot allocate memory\n");
			return NULL;
		}
	}

	return buffer->buffer;
}

void free_symbols(struct symbol *list) {
	while (list) {
		struct symbol *next = list->next;
		free(list);
		list = next;
	}
}

bool create_symbol(struct symbol **tip, const int value, const char *name) {
	struct symbol *symbol;

	symbol = malloc(sizeof(struct symbol) + strlen(name) + 1);
	if (!symbol) {
		fprintf(stderr, "Error: Cannot allocate memory\n");
		return true;
	}
	symbol->value = value;
	strcpy(symbol->name, name);

	// Link it at the start of the rest of the list
	symbol->next = *tip;
	*tip = symbol;

	return false;
}

const struct symbol *find_symbol(const struct symbol *symbols, const char *name) {
	const struct symbol *symbol = symbols;
	int namelen = strlen(name);
	while (symbol) {
		int symbolnamelen = strlen(symbol->name);
		if (namelen > symbolnamelen) {
			symbol = symbol->next;
			continue;
		}
		// If we're looking for a local label, only compare the part starting from the period
		const char *compare = symbol->name;
		if (name[0] == '.') compare += symbolnamelen - namelen;
		if (!strcmp(compare, name)) return symbol;
		symbol = symbol->next;
	}

	return NULL;
}

int parse_address_bank(char *buffer_input) {
	int bank;
	char *buffer = malloc(strlen(buffer_input) + 1);
	char *endptr_bank;
	char *buffer_address;

	strcpy(buffer, buffer_input);
	buffer_address = strchr(buffer, ':');
	if (buffer_address) *buffer_address++ = '\0';

	// Parse the bank part
	bank = strtol(buffer, &endptr_bank, 16);
	if (bank > 0xff || bank < 0) { return -1; }
	if (endptr_bank != buffer + strlen(buffer)){
		fprintf(stderr, "Error: Cannot parse bank %s:%s\n", buffer, buffer_address);
		return -1;
	}

	return bank;
}

int parse_address_address(char *buffer_input) {
	int address;
	char *buffer = malloc(strlen(buffer_input) + 1);
	char *endptr_address;
	char *buffer_address;

	strcpy(buffer, buffer_input);
	buffer_address = strchr(buffer, ':');
	if (buffer_address) *buffer_address++ = '\0';

	// Parse the address part
	address = strtol(buffer_address, &endptr_address, 16);
	if (address > 0xffff || address < 0) { return -1; }
	if (endptr_address != buffer_address + strlen(buffer_address)){
		fprintf(stderr, "Error: Cannot parse bank %s:%s\n", buffer, buffer_address);
		return -1;
	}

	return address;
}

int parse_abs_offset(int bank, int address, char type) {
	switch (type) {
	case('w'):
		return bank ? bank * 0xd000 + (address - 0xd000) : address;
	case('s'):
		return bank ? bank * 0xc000 + (address - 0xc000) : address;
	case('h'):
		return address;
	default:
		return bank ? bank * 0x4000 + (address - 0x4000) : address;
	}

	return -1;
}

int parse_offset(int offset, char type) {
	switch(type) {
	case('w'):
		return offset > 0xd000 ? 0xd000 + offset % 0xd000 : offset;
	case('s'):
		return offset > 0xc000 ? 0xc000 + offset % 0xc000 : offset;
	case('h'):
		return offset;
	default:
		return offset > 0x4000 ? 0x4000 + offset % 0x4000 : offset;
	}

	return -1;
}

struct symbol *parse_symfile(FILE *file) {
	struct symbol *symbols = NULL;
	char *buffer;
	size_t buffer_index = 0;
	int c;
	int bank = 0;
	int address = 0;
	int offset = -1;

	buffer = create_buffer();
	if (!buffer) goto error;

	// Parse the entire symfile, to gather the symbols
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch (c) {
		case ';':
		case '\r':
		case '\n':
			// If we encounter a newline or comment,
			// we've reached the end of the label name.
			buffer[buffer_index] = '\0';

			// This is the end of the parsable line
			buffer_index = SIZE_MAX;
			offset = parse_abs_offset(bank, address, buffer[0]);
			if (offset == -1) break;

			if (create_symbol(&symbols, offset, buffer)) goto error;

			offset = -1;
			break;

		case ' ':
			// If we've just encountered a space, ignore this one
			if (offset != -1) {
				if (buffer_index) {
					buffer[buffer_index++] = c;
				}
				break;
			}

			// If we encounter a space, we've reached the end of the address.
			buffer[buffer_index] = '\0';
			bank = parse_address_bank(buffer);
			address = parse_address_address(buffer);
			buffer_index = offset ? 0 : SIZE_MAX;

			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			offset = -1;

			while (c != '\n' && c != '\r') {
				if ((c = getc(file)) == EOF) break;
			}
		}
	}

	if (!symbols) {
		fprintf(stderr, "Error: No symbols found.");
	}

	free_buffer(buffer);
	return symbols;

error:
	if (buffer) free_buffer(buffer);
	return NULL;
}

struct symbol *parse_constfile(FILE *file, struct symbol **symbols) {
	char *buffer;
	size_t buffer_index = 0;
	char *endvalue;
	int c;
	int value = -1;

	buffer = create_buffer();
	if (!buffer) goto error;

	// Parse the entire const file, to gather the symbols
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch (c) {
		case ';':
		case '\r':
		case '\n':
			// If we encounter a newline or comment,
			// we've reached the end of the label name.
			buffer[buffer_index] = '\0';

			// This is the end of the parsable line
			buffer_index = SIZE_MAX;
			if (value == -1) break;

			if (create_symbol(symbols, value, buffer)) goto error;

			value = -1;
			break;

		case ' ':
			// If we've just encountered a space, ignore this one
			if (value != -1) {
				if (buffer_index) {
					buffer[buffer_index++] = c;
				}
				break;
			}

			// If we encounter a space, we've reached the end of the value.
			buffer[buffer_index] = '\0';
			value = strtol(buffer, &endvalue, 10);
			if (endvalue != buffer + strlen(buffer)) {
				value = -1;
			}
			buffer_index = 0;

			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			value = -1;

			while (c != '\n' && c != '\r') {
				if ((c = getc(file)) == EOF) break;
			}
		}
	}

	free_buffer(buffer);
	return *symbols;

error:
	if (buffer) free_buffer(buffer);
	return *symbols;
}

void interpret_command(char *command, const struct symbol *current_patch, const struct symbol *symbols,
                       struct patch *patch, FILE *new_rom, FILE *orig_rom, FILE *output) {
	int argc = 0;
	int offset = -1;
	if (current_patch) {
		offset = current_patch->value;
	}
	char *s;

	const struct symbol *getsymbol = NULL;
	// Count the arguments
	s = command;
	while (*s) if (*s++ == ':') argc++;

	// Get the arguments
	char *argv[argc];
	if ((s = strchr(command, ':'))) {
		*s++ = '\0';
		argv[0] = s;
		for (int i = 1; i < argc; i++) {
			if (!(s = strchr(s, ':'))) break;
			*s++ = '\0';
			argv[i] = s;
		}
	}

	// Now we finally can do stuff with it
	if (!strcmp(command, "comment")) {
		// Comments do nothing
	} else if (!strcmp(command, "ADDREss")) {
		// This is only necessary to match the exact upper/lower casing in the original patch
		int high = offset >> 8;
		int low = offset & 0xFF;
		fprintf(output, "0x%X%x", high, low);
	} else if (!strcmp(command, "Address") || !strcmp(command, "address")) {
		if (argc > 0) offset += strtol(argv[0], NULL, 0);

		fprintf(output, "0x");
		if (argc > 1) {
			for (int i = strtol(argv[1], NULL, 0); i > 0; i--) {
				putchar('0');
			}
		}

		fprintf(output, isupper((unsigned char)command[0]) ? "%X" : "%x", offset);
	} else if (!strcmp(command, "Patch") || !strcmp(command, "patch")) {
		if (argc > 0) offset += strtol(argv[0], NULL, 0);

		if (fseek(orig_rom, offset, SEEK_SET) != 0) {
			fprintf(stderr, "Error: Could not seek to the offset of %s in the original ROM\n", current_patch->name);
			return;
		}

		if (fseek(new_rom, offset, SEEK_SET) != 0) {
			fprintf(stderr, "Error: Could not seek to offset of %s in the new ROM\n", current_patch->name);
			return;
		}

		if (argc <= 1 || strcmp(argv[1], "big")) {
			int c = getc(new_rom);
			if (c == getc(orig_rom)) {
				fprintf(stderr, "Warning: %s doesn't actually contain any differences\n", current_patch->name);
			}

			patch->offset = offset;
			patch->size = 1;
			fprintf(output, "0x");
			fprintf(output, isupper((unsigned char)command[0]) ? "%02X" : "%02x", c);
		} else {
			char *searchend = malloc(strlen(current_patch->name) + 5);
			strcpy(searchend, current_patch->name);
			strcat(searchend, "_End");
			current_patch = find_symbol(symbols, searchend);
			if (!current_patch) {
				fprintf(stderr, "Error: Could not find symbol: %s", searchend);
			} else {
				// Figure out the length of the patch
				int length = current_patch->value - offset;
				memset(searchend, 0, (strlen(current_patch->name)));

				// We've got the length, now go back
				fseek(new_rom, offset, SEEK_SET);

				// Print out the patch
				patch->offset = offset;
				patch->size = length;
				fprintf(output, "a%d:", length);
				for (int i = 0; i < length; i++) {
					if (i != 0) putc(' ', output);
					fprintf(output, isupper((unsigned char)command[0]) ? "%02X" : "%02x", getc(new_rom));
				}
			}
		}
	} else if (!strcmp(command, "Constant") || !strcmp(command, "constant")) {
		if (argc != 2) {
			fprintf(stderr, "Error: Missing argument for %s", command);
		}
		getsymbol = find_symbol(symbols, argv[1]);
		if (!getsymbol) return;
		int parsed_offset = parse_offset(getsymbol->value, getsymbol->name[0]);
		if (!strcmp(argv[0], "db")) {
			fprintf(output, isupper((unsigned char)command[0]) ? "%02X": "%02x",
				parsed_offset);
		} else {
			fprintf(output, isupper((unsigned char)command[0]) ? "%02X %02X": "%02x %02x",
				parsed_offset, HIGH(parsed_offset));
		}
	} else if (!strcmp(command, "findaddress")) {
		if (argc != 1) {
			fprintf(stderr, "Error: Missing argument for %s", command);
		}
		getsymbol = find_symbol(symbols, argv[0]);
		if (!getsymbol) return;
		fprintf(output, "0x%x", getsymbol->value);
	} else if (!strcmp(command, "conaddress")) {
		if (argc != 2) {
			fprintf(stderr, "Error: Missing argument for %s", command);
		}
		getsymbol = find_symbol(symbols, argv[1]);
		if (!getsymbol) return;
		int parsed_offset = parse_offset(getsymbol->value, getsymbol->name[0]);
		if (!strcmp(argv[0], "dw")) {
			fprintf(output, "%02x ", LOW(parsed_offset));
			fprintf(output, "%02x ", HIGH(parsed_offset));
			fprintf(output, "%02x ", LOW(parsed_offset + 1));
			fprintf(output, "%02x",  HIGH(parsed_offset + 1));
		} else {
			fprintf(output, "%02x ", LOW(parsed_offset));
			fprintf(output, "%02x",  HIGH(parsed_offset));
		}

	} else if (!strcmp(command, "==")) {
		fprintf(output, "00 00");
	} else if (!strcmp(command, ">")) {
		fprintf(output, "01 00");
	} else if (!strcmp(command, "<")) {
		fprintf(output, "02 00");
	} else if (!strcmp(command, ">=")) {
		fprintf(output, "03 00");
	} else if (!strcmp(command, "<=")) {
		fprintf(output, "04 00");
	} else if (!strcmp(command, "!=")) {
		fprintf(output, "05 00");
	} else {
		fprintf(stderr, "Error: Unknown command: %s\n", command);
	}
}

struct patch *process_template(FILE *file, FILE *new_rom, FILE *orig_rom, FILE *output, const struct symbol *symbols) {
	struct patch *patches = NULL;
	struct patch *patch = NULL;
	const struct symbol *current_patch = NULL;
	char *buffer;
	size_t buffer_index = 0;
	int c;
	int line_pos = 0;

	buffer = create_buffer();
	if (!buffer) goto error;

	patches = create_buffer();
	if (!patches) goto error;
	patch = patches;

	// Implicitly add the ROM checksum and the stadium checksum to the patch list,
	// since that will always differ.
	patch->offset = 0x14e;
	patch->size = 2;
	patch++;
	patch->offset = 0x1FFDE0;
	patch->size = 0xFFFFFF - 0x1FFDE0;
	patch++;


	// Fill in the template
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch (c) {
		case '\r':
		case '\n':
			// A newline simply resets the line_pos
			putc(c, output);
			line_pos = 0;
			break;

		case '{':
			// Check if we've found two of them.
			c = getc(file);
			if (c != '{') {
				putc('{', output);
				line_pos++;
				ungetc(c, file);
				break;
			}

			// If we have, we store the contents before it ends into buffer
			buffer_index = 0;
			while ((c = getc(file)) != EOF) {
				if (c == '}') {
					if ((c = getc(file)) == EOF) break;
					if (c == '}') break;
				}

				buffer[buffer_index++] = c;
				buffer = expand_buffer(buffer, buffer_index);
				if (!buffer) goto error;
			}

			buffer[buffer_index] = '\0';


			patch->offset = 0;
			interpret_command(buffer, current_patch, symbols, patch, new_rom, orig_rom, output);
			if (patch->offset) patch++;
			patches = expand_buffer(patches, (uintptr_t)patch - (uintptr_t)patches);
			if (!patches) goto error;

			break;

		case '[':
			// End immediately if this is not the beginning of the line.
			if (line_pos) {
				putc(c, output);
				line_pos++;
				break;
			}

			// Try to read the label
			putc(c, output);
			buffer_index = 0;

			while ((c = getc(file)) != EOF) {
				putc(c, output);

				if (c == ']') {
					// If we're at the end, we can get the symbol for the label
					buffer[buffer_index] = '\0';

					// Translate spaces to underscores
					for (char *p = buffer; *p != '\0'; p++) {
						if (*p == ' ') *p = '_';
					}

					// Look for the symbol starting with .VC_
					char *searchlabel = malloc(strlen(".VC_") + strlen(buffer) + 1);
					strcpy(searchlabel, ".VC_");
					strcat(searchlabel, buffer);
					current_patch = find_symbol(symbols, searchlabel);
					if (!current_patch) {
						fprintf(stderr, "Error: Cannot find symbol: %s\n", searchlabel);
					}

					free(searchlabel);
					// Skip until the next newline
					while ((c = getc(file)) != EOF) {
						putc(c, output);
						if (c == '\n' || c == '\r') break;
					}
					buffer_index = 0;
					break;
				}

				buffer[buffer_index++] = c;
			}

			break;

		default:
			putc(c, output);
			line_pos++;
		}
	}

	patch->offset = 0;
	free_buffer(buffer);
	return patches;

error:
	if (patches) free_buffer(patches);
	if (buffer) free_buffer(buffer);
	return NULL;
}

int compare_patch(const void *patch1, const void *patch2) {
	unsigned int patch1_offset = ((const struct patch *)patch1)->offset;
	unsigned int patch2_offset = ((const struct patch *)patch2)->offset;
	return patch1_offset > patch2_offset ? 1 : patch1_offset < patch2_offset ? -1 : 0;
}

int verify_completeness(FILE *orig_rom, FILE *new_rom, struct patch *patches) {
	struct patch *patch = patches;
	size_t offset = 0;
	int c, d;

	while (patch->offset != 0) patch++;
	qsort(patches, patch - patches, sizeof(struct patch), compare_patch);

	rewind(orig_rom);
	rewind(new_rom);
	patch = patches;
	for (;;) {
		c = getc(orig_rom);
		d = getc(new_rom);
		if (c == EOF || d == EOF) break;
		if (patch->offset && patch->offset == offset) {
			if (fseek(orig_rom, patch->size, SEEK_CUR) != 0) return -1;
			if (fseek(new_rom, patch->size, SEEK_CUR) != 0) return -1;

			offset += patch->size + 1;
			patch++;
			continue;
		}
		offset++;
		if (c != d) {
			fprintf(stderr, "Value Mismatch at decimal offset: %li\n", offset-1);
			fprintf(stderr, "Orig_rom value: %x\n", c);
			fprintf(stderr, "New_rom value: %x\n", d);
			fprintf(stderr, "Current Patch Start Address: %x\n", patch->offset);
			return -1;
		}
	}

	return c != d;
}

int main(int argc, char *argv[]) {
	struct symbol *symbols = NULL;
	struct patch *patches = NULL;
	FILE *sym_file = NULL;
	FILE *const_file = NULL;
	FILE *new_rom = NULL;
	FILE *orig_rom = NULL;
	FILE *template_file = NULL;

	if (argc < 6) {
		fprintf(stderr, "Usage: %s <const file> <symfile> <patched rom> <original rom> <patch template>\n", argv[0]);
		return 1;
	}

	sym_file = fopen(argv[2], "r");
	if (!sym_file) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[2]);
		goto error;
	}

	if (!(symbols = parse_symfile(sym_file))) goto error;

	const_file = fopen(argv[1], "r");
	if (!const_file) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[1]);
		goto error;
	}

	if (!(symbols = parse_constfile(const_file, &symbols))) goto error;

	new_rom = fopen(argv[3], "r");
	if (!new_rom) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[3]);
		goto error;
	}

	orig_rom = fopen(argv[4], "r");
	if (!orig_rom) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[4]);
		goto error;
	}

	template_file = fopen(argv[5], "r");
	if (!template_file) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[5]);
		goto error;
	}

	if (!(patches = process_template(template_file, new_rom, orig_rom, stdout, symbols))) goto error;

	if (verify_completeness(orig_rom, new_rom, patches)) {
		fprintf(stderr, "Warning: Not all differences in the ROM are defined in the patch\n");
	}

	free_symbols(symbols);
	fclose(sym_file);
	fclose(const_file);
	fclose(new_rom);
	fclose(orig_rom);
	fclose(template_file);

	return 0;

error:
	free_symbols(symbols);
	if (sym_file) fclose(sym_file);
	if (const_file) fclose(const_file);
	if (new_rom) fclose(new_rom);
	if (orig_rom) fclose(orig_rom);
	if (template_file) fclose(template_file);

	return 1;
}
