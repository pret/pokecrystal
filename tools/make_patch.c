#define PROGRAM_NAME "make_patch"
#define USAGE_OPTS "labels.sym constants.out patched.gbc original.gbc vc.patch.template vc.patch"

#include "common.h"

#include <ctype.h>

#define HIGH(x) (((x) >> 8) & 0xff)
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

struct Buffer *create_buffer(void) {
	struct Buffer *buffer = xmalloc(sizeof(*buffer) + 0x100);
	buffer->size = 0x100;
	return buffer;
}

struct Buffer *expand_buffer(struct Buffer *buffer, size_t size) {
	if (size > buffer->size) {
		size_t new_size = size > buffer->size + 0x100 ? size : buffer->size + 0x100;
		buffer = xrealloc(buffer, new_size);
		buffer->size = new_size;
	}
	return buffer;
}

struct Patches *create_patches(void) {
	struct Patches *patches = xmalloc(sizeof(*patches));
	patches->size = 0;
	patches->capacity = 10;
	patches->data = xmalloc(patches->capacity * sizeof(*patches->data));
	return patches;
}

void append_patch(struct Patches *patches, unsigned int offset, unsigned int size) {
	if (patches->size >= patches->capacity) {
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
	return address >= 0x8000 && address < 0xa000 ? 0xa000 // VRAM
	     : address >= 0xa000 && address < 0xc000 ? 0xc000 // SRAM
	     : address >= 0xc000 && address < 0xf000 ? 0xd000 // WRAM
	     : address >= 0xff80 && address < 0xffff ? 0x10000 // HRAM
	     : 0x4000; // ROM
}

void create_symbol(struct Symbol **tip, const char *name, int bank, int address) {
	struct Symbol *symbol = xmalloc(sizeof(*symbol) + strlen(name) + 1);
	symbol->address = address;
	symbol->offset = bank > 0 ? address + (bank - 1) * get_address_type_limit(address) : address;
	strcpy(symbol->name, name);
	symbol->next = *tip;
	*tip = symbol;
}

void free_symbols(struct Symbol *list) {
	for (struct Symbol *next; list; list = next) {
		next = list->next;
		free(list);
	}
}

const struct Symbol *find_symbol(const struct Symbol *symbols, const char *name) {
	size_t namelen = strlen(name);
	for (const struct Symbol *symbol = symbols; symbol; symbol = symbol->next) {
		size_t symbolnamelen = strlen(symbol->name);
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
	error_exit("Error: Unknown symbol: %s\n", name);
	return NULL;
}

const struct Symbol *find_symbol_cat(const struct Symbol *symbols, const char *prefix, const char *suffix) {
	char *symname = xmalloc(strlen(prefix) + strlen(suffix) + 1);
	strcpy(symname, prefix);
	strcat(symname, suffix);
	const struct Symbol *symbol = find_symbol(symbols, symname);
	free(symname);
	return symbol;
}

void parse_symbol_value(char *input, int *bank, int *address) {
	char *buffer = xmalloc(strlen(input) + 1);
	strcpy(buffer, input);

	char *buffer2 = strchr(buffer, ':');
	if (buffer2) {
		// Parse symbol's bank:address
		*buffer2++ = '\0';

		char *endptr_bank, *endptr_address;
		*bank = strtol(buffer, &endptr_bank, 16);
		if (*bank > 0xff || *bank < 0) {
			*bank = -1;
		}
		*address = strtol(buffer2, &endptr_address, 16);
		if (*address > 0xffff || *address < 0) {
			*address = -1;
		}

		if (endptr_bank != buffer + strlen(buffer) || endptr_address != buffer2 + strlen(buffer2)) {
			error_exit("Error: Cannot parse bank+address: %s:%s\n", buffer, buffer2);
		}
	} else {
		// Parse constant's value
		*bank = 0;

		char *endptr;
		*address = strtol(buffer, &endptr, 16);
		if (*address < 0) {
			*address += 0x100;
		}

		if (endptr != buffer + strlen(buffer)) {
			error_exit("Error: Cannot parse value: %s\n", buffer);
		}
	}

	free(buffer);
}

struct Symbol *parse_symbols(const char *filename, struct Symbol **symbols) {
	FILE *file = xfopen(filename, 'r');

	struct Buffer *buffer = create_buffer();
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
			// This is the end of the symbol name
			buffer->data[buffer_index] = '\0';
			create_symbol(symbols, buffer->data, bank, address);
			buffer_index = SIZE_MAX;
			break;

		case ' ':
			if (offset != -1) {
				// Ignore leading spaces
				if (buffer_index) {
					buffer->data[buffer_index++] = c;
				}
			} else {
				// This is the end of the symbol value
				buffer->data[buffer_index] = '\0';
				parse_symbol_value(buffer->data, &bank, &address);
				buffer_index = offset ? 0 : SIZE_MAX;
			}
			break;

		default:
			buffer->data[buffer_index++] = c;
		}

		// Skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			offset = -1;
			while (c != '\n' && c != '\r' && c != EOF) {
				c = getc(file);
			}
		}
	}

	fclose(file);
	free(buffer);
	return *symbols;
}

int parse_arg_value(char *arg, bool absolute, const struct Symbol *symbols, const char *patch_name) {
	static const char *comparisons[6] = {"==", ">", "<", ">=", "<=", "!="};
	for (int i = 0; i < sizeof(comparisons) / sizeof(*comparisons); i++) {
		if (!strcmp(arg, comparisons[i])) {
			return i;
		}
	}
	if (isdigit((unsigned char)arg[0])) {
		return strtol(arg, NULL, 0);
	}
	int offset_mod = 0;
	const char *plus = strchr(arg, '+');
	if (plus) {
		offset_mod = strtol(plus, NULL, 0);
		arg[strlen(arg) - strlen(plus)] = '\0';
	}
	const char *sym_name = !strcmp(arg, "@") ? patch_name : arg;
	const struct Symbol *symbol = find_symbol(symbols, sym_name);
	return (absolute ? symbol->offset : symbol->address) + offset_mod;
}

void interpret_command(
	char *command, const struct Symbol *current_hook, const struct Symbol *symbols,
	struct Patches *patches, FILE *new_rom, FILE *orig_rom, FILE *output
) {
	// Strip all leading spaces and all but one trailing space
	int x = 0;
	for (int i = 0; command[i]; i++) {
		if (command[i] != ' ' || (i > 0 && command[i-1] != ' ')) {
			command[x++] = command[i];
		}
	}
	command[x] = '\0';

	// Count the arguments
	int argc = 0;
	for (char *c = command; *c; c++) {
		if (*c == ' ') {
			argc++;
		}
	}

	// Get the arguments
	char *argv[argc]; // VLA
	char *arg = command;
	for (int i = 0; i < argc; i++) {
		arg = strchr(arg, ' ');
		if (!arg) {
			break;
		}
		*arg++ = '\0';
		argv[i] = arg;
	}

	// Use the arguments
	if (!strcmp(command, "patch") || !strcmp(command, "Patch")) {
		int current_offset = current_hook ? current_hook->offset : -1;
		if (argc > 0) {
			current_offset += strtol(argv[0], NULL, 0);
		}
		if (fseek(orig_rom, current_offset, SEEK_SET)) {
			error_exit("Error: Cannot seek to 'vc_patch %s' in the original ROM\n", current_hook->name);
		}
		if (fseek(new_rom, current_offset, SEEK_SET)) {
			error_exit("Error: Cannot seek to 'vc_patch %s' in the new ROM\n", current_hook->name);
		}
		const struct Symbol *current_hook_end = find_symbol_cat(symbols, current_hook->name, "_End");
		int length = current_hook_end->offset - current_offset;
		if (length == 1) {
			int c = getc(new_rom);
			if (c == getc(orig_rom)) {
				fprintf(stderr, PROGRAM_NAME ": Warning: 'vc_patch %s' doesn't alter the ROM\n", current_hook->name);
			}
			append_patch(patches, current_offset, 1);
			fprintf(output, isupper((unsigned char)command[0]) ? "0x%02X" : "0x%02x", c);
		} else {
			fseek(new_rom, current_offset, SEEK_SET);
			append_patch(patches, current_offset, length);
			fprintf(output, "a%d:", length);
			for (int i = 0; i < length; i++) {
				if (i) {
					putc(' ', output);
				}
				fprintf(output, isupper((unsigned char)command[0]) ? "%02X" : "%02x", getc(new_rom));
			}
		}

	} else if (!strcmp(command, "dws") || !strcmp(command, "Dws") || !strcmp(command, "DWs")) {
		if (argc < 1) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		fprintf(output, "a%d:", argc * 2);
		for (int i = 0; i < argc; i++) {
			int value = parse_arg_value(argv[i], false, symbols, current_hook->name);
			fprintf(output, isupper((unsigned char)command[0]) ? " %02X %02X": " %02x %02x",
				LOW(value), HIGH(value));
		}

	} else if (!strcmp(command, "db") || !strcmp(command, "Db") || !strcmp(command, "DB")) {
		if (argc != 1) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		int value = parse_arg_value(argv[0], false, symbols, current_hook->name);
		fprintf(output, isupper((unsigned char)command[0]) ? "a1:%02X": "a1:%02x", LOW(value));

	} else if (!strcmp(command, "hex") || !strcmp(command, "Hex") || !strcmp(command, "HEx")) {
		if (argc != 1 && argc != 2) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		int value = parse_arg_value(argv[0], true, symbols, current_hook->name);
		int padding = argc > 1 ? strtol(argv[1], NULL, 10) : 2;
		if (!strcmp(command, "HEx")) {
			fprintf(output, "0x%0*X%02x", padding - 2, value >> 8, LOW(value));
		} else {
			fprintf(output, isupper((unsigned char)command[0]) ? "0x%0*X" : "0x%0*x", padding, value);
		}

	} else {
		error_exit("Error: Unknown command: %s\n", command);
	}
}

struct Patches *process_template(const char *template_filename, const char *patch_filename, FILE *new_rom, FILE *orig_rom, const struct Symbol *symbols) {
	FILE *input = xfopen(template_filename, 'r');
	FILE *output = xfopen(patch_filename, 'w');

	struct Patches *patches = create_patches();

	// The ROM checksum will always differ
	append_patch(patches, 0x14e, 2);
	// The Stadium data (see stadium.c) will always differ
	unsigned int rom_size = (unsigned int)xfsize("", orig_rom);
	unsigned int stadium_size = 24 + 6 + 2 + (rom_size / 0x2000) * 2;
	append_patch(patches, rom_size - stadium_size, stadium_size);

	struct Buffer *buffer = create_buffer();
	size_t buffer_index = 0;
	const struct Symbol *current_hook = NULL;
	int line_pos = 0;

	// Fill in the template
	for (int c = getc(input); c != EOF; c = getc(input)) {
		buffer = expand_buffer(buffer, buffer_index);

		switch (c) {
		case '\r':
		case '\n':
			// Start a new line
			putc(c, output);
			line_pos = 0;
			break;

		case '{':
			// Two "{{" begins a command
			c = getc(input);
			if (c != '{') {
				putc('{', output);
				line_pos++;
				ungetc(c, input);
				break;
			}
			buffer_index = 0;
			for (c = getc(input); c != EOF; c = getc(input)) {
				if (c == '}') {
					// Two "}}" ends a command
					c = getc(input);
					if (c == EOF || c == '}') {
						break;
					}
				}
				buffer->data[buffer_index++] = c;
				buffer = expand_buffer(buffer, buffer_index);
			}
			buffer->data[buffer_index] = '\0';
			interpret_command(buffer->data, current_hook, symbols, patches, new_rom, orig_rom, output);
			break;

		case '[':
			// "[" at the start of a line begins a patch label
			if (line_pos) {
				putc(c, output);
				line_pos++;
				break;
			}
			putc(c, output);
			buffer_index = 0;
			for (c = getc(input); c != EOF; c = getc(input)) {
				putc(c, output);
				if (c == ']') {
					// "]" ends the patch label
					buffer->data[buffer_index] = '\0';
					// Convert spaces to underscores
					for (char *p = buffer->data; *p != '\0'; p++) {
						if (*p == ' ') {
							*p = '_';
						}
					}
					// Look for the symbol starting with ".VC_"
					current_hook = find_symbol_cat(symbols, ".VC_", buffer->data);
					// Skip to the next line
					for (c = getc(input); c != EOF; c = getc(input)) {
						putc(c, output);
						if (c == '\n' || c == '\r') {
							break;
						}
					}
					buffer_index = 0;
					break;
				}
				buffer->data[buffer_index++] = c;
			}
			break;

		default:
			putc(c, output);
			line_pos++;
		}
	}

	rewind(orig_rom);
	rewind(new_rom);

	fclose(input);
	fclose(output);
	free(buffer);
	return patches;
}

int compare_patch(const void *patch1, const void *patch2) {
	unsigned int offset1 = ((const struct Patch *)patch1)->offset;
	unsigned int offset2 = ((const struct Patch *)patch2)->offset;
	return offset1 > offset2 ? 1 : offset1 < offset2 ? -1 : 0;
}

bool verify_completeness(FILE *orig_rom, FILE *new_rom, struct Patches *patches) {
	qsort(patches->data, patches->size, sizeof(*patches->data), compare_patch);
	for (unsigned int offset = 0, index = 0; ; offset++) {
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
			fprintf(stderr, PROGRAM_NAME ": Warning: Unpatched difference at offset: 0x%x\n", offset - 1);
			fprintf(stderr, "    Original ROM value: %02x\n", orig_byte);
			fprintf(stderr, "    Patched ROM value: %02x\n", new_byte);
			fprintf(stderr, "    Current patch offset: 0x%x\n", patch->offset);
			return false;
		}
	}
}

int main(int argc, char *argv[]) {
	if (argc != 7) {
		usage_exit(1);
	}

	struct Symbol *symbols = NULL;
	symbols = parse_symbols(argv[1], &symbols);
	symbols = parse_symbols(argv[2], &symbols);

	FILE *new_rom = xfopen(argv[3], 'r');
	FILE *orig_rom = xfopen(argv[4], 'r');
	struct Patches *patches = process_template(argv[5], argv[6], new_rom, orig_rom, symbols);

	if (!verify_completeness(orig_rom, new_rom, patches)) {
		fprintf(stderr, PROGRAM_NAME ": Warning: Not all ROM differences are defined by \"%s\"\n", argv[6]);
	}

	free_symbols(symbols);
	fclose(new_rom);
	fclose(orig_rom);
	free_patches(patches);

	return 0;
}
