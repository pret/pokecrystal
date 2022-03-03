#define PROGRAM_NAME "make_patch"
#define USAGE_OPTS "constants.txt labels.sym patched.gbc original.gbc vc.patch.template vc.patch"

#include "common.h"

#include <ctype.h>

#define HIGH(x) ((x) >> 8)
#define LOW(x) ((x) & 0xff)

struct Buffer {
	size_t size;
	char data[];
};

struct Patch {
	unsigned int offset;
	unsigned int size;
};

struct Patches {
	size_t size;
	size_t capacity;
	struct Patch *data;
};

struct Symbol {
	struct Symbol *next;
	int address;
	unsigned int offset;
	char name[];
};

char *create_buffer(void) {
	struct Buffer *buffer = xmalloc(sizeof(*buffer) + 0x100);
	buffer->size = 0x100;
	return buffer->data;
}

void free_buffer(char *data) {
	struct Buffer *buffer = (struct Buffer *)(data - sizeof(*buffer));
	free(buffer);
}

char *expand_buffer(char *data, size_t size) {
	struct Buffer *buffer = (struct Buffer *)(data - sizeof(*buffer));
	size_t old_size = buffer->size;
	if (size > buffer->size) {
		buffer = xrealloc(buffer, old_size + 0x100);
	}
	buffer->size = old_size + 0x100;
	return buffer->data;
}

struct Patches *create_patches(void) {
	struct Patches *patches = xmalloc(sizeof(*patches));
	patches->size = 0;
	patches->capacity = 0;
	patches->data = NULL;
	return patches;
}

void append_patch(struct Patches *patches, unsigned int offset, unsigned int size) {
	if (patches->size == patches->capacity) {
		patches->capacity = (patches->capacity + 1) * 2;
		patches->data = xrealloc(patches->data, patches->capacity * sizeof(*patches->data));
	}
	patches->data[patches->size++] = (struct Patch){.offset = offset, .size = size};
}

void free_patches(struct Patches *patches) {
	free(patches->data);
	free(patches);
}

int get_address_type_limit(int address) {
	if (address >= 0x8000 && address < 0xa000) {
		return 0xa000; // VRAM
	} else if (address >= 0xa000 && address < 0xc000) {
		return 0xc000; // SRAM
	} else if (address >= 0xc000 && address < 0xf000) {
		return 0xd000; // WRAM
	} else if (address >= 0xff80 && address < 0xffff) {
		return 0x10000; // HRAM
	} else {
		return 0x4000; // ROM
	}
}

void create_symbol(struct Symbol **tip, const char *name, const int bank, const int address) {
	struct Symbol *symbol = xmalloc(sizeof(struct Symbol) + strlen(name) + 1);
	symbol->address = address;
	symbol->offset = bank > 0 ? address + (bank - 1) * get_address_type_limit(address) : address;
	strcpy(symbol->name, name);
	symbol->next = *tip;
	*tip = symbol;
}

void free_symbols(struct Symbol *list) {
	while (list) {
		struct Symbol *next = list->next;
		free(list);
		list = next;
	}
}

const struct Symbol *find_symbol(const struct Symbol *symbols, const char *name) {
	int namelen = strlen(name);
	for (const struct Symbol *symbol = symbols; symbol; symbol = symbol->next) {
		int symbolnamelen = strlen(symbol->name);
		if (namelen > symbolnamelen) {
			continue;
		}
		const char *symbolname = symbol->name;
		if (name[0] == '.') {
			// If `name` is a local label, compare it to the local part of `symbol->name`
			symbolname += symbolnamelen - namelen;
		}
		if (!strcmp(symbolname, name)) {
			return symbol;
		}
	}
	return NULL;
}

void parse_address(char *buffer_input, int *bank, int *address) {
	char *buffer = xmalloc(strlen(buffer_input) + 1);
	strcpy(buffer, buffer_input);

	char *buffer_address = strchr(buffer, ':');
	if (buffer_address) {
		*buffer_address++ = '\0';
	}

	char *endptr_bank, *endptr_address;
	*bank = strtol(buffer, &endptr_bank, 16);
	if (*bank > 0xff || *bank < 0) {
		*bank = -1;
	}
	*address = strtol(buffer_address, &endptr_address, 16);
	if (*address > 0xffff || *address < 0) {
		*address = -1;
	}

	if (endptr_bank != buffer + strlen(buffer) || endptr_address != buffer_address + strlen(buffer_address)) {
		fprintf(stderr, "Error: Cannot parse bank+address: %s: %s\n", buffer, buffer_address);
	}

	free(buffer);
}

struct Symbol *parse_symfile(const char *filename) {
	FILE *file = xfopen(filename, 'r');

	struct Symbol *symbols = NULL;

	char *buffer = create_buffer();
	size_t buffer_index = 0;
	int bank = 0;
	int address = 0;
	int offset = -1;

	for (int c = getc(file); c != EOF; c = getc(file)) {
		buffer = expand_buffer(buffer, buffer_index);

		switch (c) {
		case ';':
		case '\r':
		case '\n':
			// If we encounter a newline or comment, we've reached the end of the label name
			buffer[buffer_index] = '\0';
			// This is the end of the parsable line
			buffer_index = SIZE_MAX;
			create_symbol(&symbols, buffer, bank, address);
			offset = -1;
			break;

		case ' ':
			if (offset != -1) {
				// If we've just encountered a space, ignore this one
				if (buffer_index) {
					buffer[buffer_index++] = c;
				}
			} else {
				// If we encounter a space, we've reached the end of the address
				buffer[buffer_index] = '\0';
				parse_address(buffer, &bank, &address);
				buffer_index = offset ? 0 : SIZE_MAX;
			}
			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			offset = -1;
			while (c != '\n' && c != '\r' && c != EOF) {
				c = getc(file);
			}
		}
	}

	fclose(file);
	free_buffer(buffer);
	return symbols;
}

struct Symbol *parse_constfile(const char *filename, struct Symbol **symbols) {
	FILE *file = xfopen(filename, 'r');

	char *buffer = create_buffer();
	size_t buffer_index = 0;
	int value = -1;

	for (int c = getc(file); c != EOF; c = getc(file)) {
		buffer = expand_buffer(buffer, buffer_index);

		switch (c) {
		case ';':
		case '\r':
		case '\n':
			// If we encounter a newline or comment, we've reached the end of the label name
			buffer[buffer_index] = '\0';
			// This is the end of the parsable line
			buffer_index = SIZE_MAX;
			if (value != -1) {
				create_symbol(symbols, buffer, 0, value);
				value = -1;
			}
			break;

		case ' ':
			if (value != -1) {
				// If we've just encountered a space, ignore this one
				if (buffer_index) {
					buffer[buffer_index++] = c;
				}
			} else {
				// If we encounter a space, we've reached the end of the value
				buffer[buffer_index] = '\0';
				char *endvalue;
				value = strtol(buffer, &endvalue, 10);
				if (endvalue != buffer + strlen(buffer)) {
					value = -1;
				}
				buffer_index = 0;
			}
			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			value = -1;
			while (c != '\n' && c != '\r' && c != EOF) {
				c = getc(file);
			}
		}
	}

	fclose(file);
	free_buffer(buffer);
	return *symbols;
}

void interpret_command(
	char *command, const struct Symbol *current_hook, const struct Symbol *symbols,
	struct Patches *patches, FILE *new_rom, FILE *orig_rom, FILE *output
) {
	// Count the arguments
	int argc = 0;
	for (char *c = command; *c; c++) {
		if (*c == ':') {
			argc++;
		}
	}

	// Get the arguments
	char *argv[argc]; // VLA
	char *arg = command;
	for (int i = 0; i < argc; i++) {
		arg = strchr(arg, ':');
		if (!arg) {
			break;
		}
		*arg++ = '\0';
		argv[i] = arg;
	}

	int offset = current_hook ? current_hook->offset : -1;

	// Use the arguments
	if (!strcmp(command, "ADDREss")) {
		// This is only necessary to match the exact upper/lower casing in the original patch
		fprintf(output, "0x%X%x", HIGH(offset), LOW(offset));

	} else if (!strcmp(command, "Address") || !strcmp(command, "address")) {
		if (argc > 0) {
			offset += strtol(argv[0], NULL, 0);
		}
		fprintf(output, "0x");
		if (argc > 1) {
			for (int i = strtol(argv[1], NULL, 0); i > 0; i--) {
				putc('0', output);
			}
		}
		fprintf(output, isupper((unsigned char)command[0]) ? "%X" : "%x", offset);

	} else if (!strcmp(command, "Patch") || !strcmp(command, "patch")) {
		if (argc > 0) {
			offset += strtol(argv[0], NULL, 0);
		}
		if (fseek(orig_rom, offset, SEEK_SET)) {
			fprintf(stderr, "Error: Could not seek to the offset of %s in the original ROM\n", current_hook->name);
			return;
		}
		if (fseek(new_rom, offset, SEEK_SET)) {
			fprintf(stderr, "Error: Could not seek to offset of %s in the new ROM\n", current_hook->name);
			return;
		}
		if (argc <= 1 || strcmp(argv[1], "big")) {
			int c = getc(new_rom);
			if (c == getc(orig_rom)) {
				fprintf(stderr, "Warning: %s doesn't actually contain any differences\n", current_hook->name);
			}
			append_patch(patches, offset, 1);
			fprintf(output, "0x");
			fprintf(output, isupper((unsigned char)command[0]) ? "%02X" : "%02x", c);
		} else {
			char *searchend = xmalloc(strlen(current_hook->name) + strlen("_End") + 1);
			strcpy(searchend, current_hook->name);
			strcat(searchend, "_End");
			current_hook = find_symbol(symbols, searchend);
			if (!current_hook) {
				fprintf(stderr, "Error: Could not find symbol: %s", searchend);
			} else {
				// Figure out the length of the patch
				int length = current_hook->offset - offset;
				memset(searchend, 0, (strlen(current_hook->name)));
				// We've got the length, now go back
				fseek(new_rom, offset, SEEK_SET);
				// Print out the patch
				append_patch(patches, offset, length);
				fprintf(output, "a%d:", length);
				for (int i = 0; i < length; i++) {
					if (i) {
						putc(' ', output);
					}
					fprintf(output, isupper((unsigned char)command[0]) ? "%02X" : "%02x", getc(new_rom));
				}
			}
		}

	} else if (!strcmp(command, "Constant") || !strcmp(command, "constant")) {
		if (argc != 2) {
			fprintf(stderr, "Error: Missing argument for %s", command);
		}
		const struct Symbol *getsymbol = find_symbol(symbols, argv[1]);
		if (!getsymbol) {
			return;
		}
		int parsed_offset = getsymbol->address;
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
		const struct Symbol *getsymbol = find_symbol(symbols, argv[0]);
		if (!getsymbol) {
			return;
		}
		fprintf(output, "0x%x", getsymbol->offset);

	} else if (!strcmp(command, "conaddress")) {
		if (argc != 2) {
			fprintf(stderr, "Error: Missing argument for %s", command);
		}
		const struct Symbol *getsymbol = find_symbol(symbols, argv[1]);
		if (!getsymbol) {
			return;
		}
		int parsed_offset = getsymbol->address;
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

struct Patches *process_template(
	const char *template_filename, FILE *new_rom, FILE *orig_rom,
	const char *output_filename, const struct Symbol *symbols
) {
	FILE *file = xfopen(template_filename, 'r');
	FILE *output = xfopen(output_filename, 'w');

	struct Patches *patches = create_patches();

	// The ROM checksum and Stadium data will always differ
	append_patch(patches, 0x14e, 2);
	append_patch(patches, 0x1ffde0, 0xffffff - 0x1ffde0);

	char *buffer = create_buffer();
	size_t buffer_index = 0;
	const struct Symbol *current_hook = NULL;
	int line_pos = 0;

	// Fill in the template
	for (int c = getc(file); c != EOF; c = getc(file)) {
		buffer = expand_buffer(buffer, buffer_index);

		switch (c) {
		case '\r':
		case '\n':
			// A newline simply resets the line_pos
			putc(c, output);
			line_pos = 0;
			break;

		case '{':
			// Check if we've found two of them
			c = getc(file);
			if (c != '{') {
				putc('{', output);
				line_pos++;
				ungetc(c, file);
				break;
			}
			// If we have, we store the contents before it ends into buffer
			buffer_index = 0;
			for (c = getc(file); c != EOF; c = getc(file)) {
				if (c == '}') {
					c = getc(file);
					if (c == EOF || c == '}') {
						break;
					}
				}
				buffer[buffer_index++] = c;
				buffer = expand_buffer(buffer, buffer_index);
			}
			buffer[buffer_index] = '\0';
			interpret_command(buffer, current_hook, symbols, patches, new_rom, orig_rom, output);
			break;

		case '[':
			// End immediately if this is not the beginning of the line
			if (line_pos) {
				putc(c, output);
				line_pos++;
				break;
			}
			// Try to read the label
			putc(c, output);
			buffer_index = 0;
			for (c = getc(file); c != EOF; c = getc(file)) {
				putc(c, output);
				if (c == ']') {
					// If we're at the end, we can get the symbol for the label
					buffer[buffer_index] = '\0';
					// Translate spaces to underscores
					for (char *p = buffer; *p != '\0'; p++) {
						if (*p == ' ') {
							*p = '_';
						}
					}
					// Look for the symbol starting with .VC_
					char *searchlabel = xmalloc(strlen(".VC_") + strlen(buffer) + 1);
					strcpy(searchlabel, ".VC_");
					strcat(searchlabel, buffer);
					current_hook = find_symbol(symbols, searchlabel);
					if (!current_hook) {
						fprintf(stderr, "Error: Cannot find symbol: %s\n", searchlabel);
					}
					free(searchlabel);
					// Skip until the next newline
					for (c = getc(file); c != EOF; c = getc(file)) {
						putc(c, output);
						if (c == '\n' || c == '\r') {
							break;
						}
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

	rewind(orig_rom);
	rewind(new_rom);

	fclose(file);
	fclose(output);
	free_buffer(buffer);
	return patches;
}

int compare_patch(const void *patch1, const void *patch2) {
	unsigned int patch1_offset = ((const struct Patch *)patch1)->offset;
	unsigned int patch2_offset = ((const struct Patch *)patch2)->offset;
	return patch1_offset > patch2_offset ? 1 : patch1_offset < patch2_offset ? -1 : 0;
}

bool verify_completeness(FILE *orig_rom, FILE *new_rom, struct Patches *patches) {
	qsort(patches->data, patches->size, sizeof(*patches->data), compare_patch);
	size_t index = 0;

	for (size_t offset = 0; ; offset++) {
		int orig_byte = getc(orig_rom);
		int new_byte = getc(new_rom);
		if (orig_byte == EOF || new_byte == EOF) {
			return orig_byte == new_byte;
		}
		struct Patch *patch = patches->data + index;
		if (index < patches->size && patch->offset == offset) {
			if (fseek(orig_rom, patch->size, SEEK_CUR)) {
				return false;
			}
			if (fseek(new_rom, patch->size, SEEK_CUR)) {
				return false;
			}
			offset += patch->size;
			index++;
		} else if (orig_byte != new_byte) {
			fprintf(stderr, "Value mismatch at decimal offset: %li\n", offset - 1);
			fprintf(stderr, "Original ROM value: %x\n", orig_byte);
			fprintf(stderr, "Patched ROM value: %x\n", new_byte);
			fprintf(stderr, "Current patch start address: %x\n", patch->offset);
			return false;
		}
	}
}

int main(int argc, char *argv[]) {
	if (argc != 7) {
		usage_exit(1);
	}

	struct Symbol *symbols = parse_symfile(argv[2]);
	symbols = parse_constfile(argv[1], &symbols);

	FILE *new_rom = xfopen(argv[3], 'r');
	FILE *orig_rom = xfopen(argv[4], 'r');
	struct Patches *patches = process_template(argv[5], new_rom, orig_rom, argv[6], symbols);

	free_symbols(symbols);

	if (!verify_completeness(orig_rom, new_rom, patches)) {
		fprintf(stderr, "Warning: Not all ROM differences are defined by \"%s\"\n", argv[6]);
	}

	fclose(new_rom);
	fclose(orig_rom);
	free_patches(patches);

	return 0;
}
