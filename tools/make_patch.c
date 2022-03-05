#define PROGRAM_NAME "make_patch"
#define USAGE_OPTS "labels.sym constants.out patched.gbc original.gbc vc.patch.template vc.patch"

#include "common.h"

#include <ctype.h>

struct Buffer {
	size_t size;
	size_t capacity;
	char *data;
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
	unsigned int address;
	unsigned int offset;
	char name[]; // VLA
};

struct Buffer *create_buffer(void) {
	struct Buffer *buffer = xmalloc(sizeof(*buffer));
	buffer->size = 0;
	buffer->capacity = 0x10;
	buffer->data = xmalloc(buffer->capacity);
	return buffer;
}

void append_to_buffer(struct Buffer *buffer, char c) {
	if (buffer->size >= buffer->capacity) {
		buffer->capacity = (buffer->capacity + 1) * 2;
		buffer->data = xrealloc(buffer->data, buffer->capacity);
	}
	buffer->data[buffer->size++] = c;
}

void free_buffer(struct Buffer *buffer) {
	free(buffer->data);
	free(buffer);
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

void append_symbol(struct Symbol **symbols, const char *name, int bank, int address) {
	struct Symbol *symbol = xmalloc(sizeof(*symbol) + strlen(name) + 1);
	symbol->address = address;
	symbol->offset = bank > 0 ? address + (bank - 1) * get_address_type_limit(address) : address;
	strcpy(symbol->name, name);
	symbol->next = *symbols;
	*symbols = symbol;
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

	int bank = 0;
	int address = 0;
	bool skip_line = false;

	for (int c = getc(file); c != EOF; c = getc(file)) {
		switch (c) {
		case ';':
		case '\r':
		case '\n':
			// This is the end of the symbol name
			append_to_buffer(buffer, '\0');
			append_symbol(symbols, buffer->data, bank, address);
			// Clear the buffer and skip to the next line for another symbol
			buffer->size = 0;
			skip_line = true;
			break;

		case ' ':
			// This is the end of the symbol value
			append_to_buffer(buffer, '\0');
			parse_symbol_value(buffer->data, &bank, &address);
			// Clear the buffer for the symbol name
			buffer->size = 0;
			break;

		default:
			append_to_buffer(buffer, c);
		}

		if (skip_line) {
			// Skip to the next line
			while (c != '\n' && c != '\r' && c != EOF) {
				c = getc(file);
			}
			skip_line = false;
		}
	}

	fclose(file);
	free_buffer(buffer);
	return *symbols;
}

int parse_arg_value(char *arg, bool absolute, const struct Symbol *symbols, const char *patch_name) {
	static const char *comparisons[6] = {"==", ">", "<", ">=", "<=", "!="};
	for (unsigned int i = 0; i < sizeof(comparisons) / sizeof(*comparisons); i++) {
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
	if (!strcmp(command, "patch") || !strcmp(command, "PATCH")) {
		if (!current_hook) {
			error_exit("Error: No current patch for command: %s", command);
		}
		int current_offset = current_hook->offset;
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

	} else if (!strcmp(command, "dws") || !strcmp(command, "DWS")) {
		if (argc < 1) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		fprintf(output, "a%d:", argc * 2);
		for (int i = 0; i < argc; i++) {
			int value = parse_arg_value(argv[i], false, symbols, current_hook->name);
			if (value > 0xffff) {
				error_exit("Error: Invalid value for '%s' argument: %d", command, value);
			}
			fprintf(output, isupper((unsigned char)command[0]) ? " %02X %02X": " %02x %02x", value & 0xff, value >> 8);
		}

	} else if (!strcmp(command, "db") || !strcmp(command, "DB")) {
		if (argc != 1) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		int value = parse_arg_value(argv[0], false, symbols, current_hook->name);
		if (value > 0xff) {
			error_exit("Error: Invalid value for '%s' argument: %d", command, value);
		}
		fprintf(output, isupper((unsigned char)command[0]) ? "a1:%02X": "a1:%02x", value);

	} else if (!strcmp(command, "hex") || !strcmp(command, "HEX") || !strcmp(command, "HEx") || !strcmp(command, "Hex") || !strcmp(command, "heX") || !strcmp(command, "hEX")) {
		if (argc != 1 && argc != 2) {
			error_exit("Error: Invalid arguments for command: %s", command);
		}
		int value = parse_arg_value(argv[0], true, symbols, current_hook->name);
		int padding = argc > 1 ? strtol(argv[1], NULL, 10) : 2;
		if (!strcmp(command, "HEx")) {
			fprintf(output, "0x%0*X%02x", padding - 2, value >> 8, value & 0xff);
		} else if (!strcmp(command, "Hex")) {
			fprintf(output, "0x%0*X%03x", padding - 3, value >> 12, value & 0xfff);
		} else if (!strcmp(command, "heX")) {
			fprintf(output, "0x%0*x%02X", padding - 2, value >> 8, value & 0xff);
		} else if (!strcmp(command, "hEX")) {
			fprintf(output, "0x%0*x%03X", padding - 3, value >> 12, value & 0xfff);
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
	struct Buffer *buffer = create_buffer();

	struct Patches *patches = create_patches();

	// The ROM checksum will always differ
	append_patch(patches, 0x14e, 2);
	// The Stadium data (see stadium.c) will always differ
	unsigned int rom_size = (unsigned int)xfsize("", orig_rom);
	unsigned int stadium_size = 24 + 6 + 2 + (rom_size / 0x2000) * 2;
	append_patch(patches, rom_size - stadium_size, stadium_size);

	const struct Symbol *current_hook = NULL;
	int line_col = 0;

	// Fill in the template
	for (int c = getc(input); c != EOF; c = getc(input)) {
		switch (c) {
		case '\r':
		case '\n':
			// Start a new line
			putc(c, output);
			line_col = 0;
			break;

		case '{':
			// "{...}" is a template command; buffer its contents
			buffer->size = 0;
			for (c = getc(input); c != EOF; c = getc(input)) {
				if (c == '}') {
					break;
				}
				append_to_buffer(buffer, c);
			}
			append_to_buffer(buffer, '\0');
			// Interpret the command in the context of the current patch
			interpret_command(buffer->data, current_hook, symbols, patches, new_rom, orig_rom, output);
			break;

		case '[':
			putc(c, output);
			if (line_col) {
				line_col++;
				break;
			}
			// "[...]" at the start of a line is a patch label; buffer its contents
			buffer->size = 0;
			for (c = getc(input); c != EOF; c = getc(input)) {
				putc(c, output);
				if (c == ']') {
					break;
				}
				append_to_buffer(buffer, c);
			}
			append_to_buffer(buffer, '\0');
			// Convert spaces to underscores
			for (size_t i = 0; i < buffer->size; i++) {
				if (buffer->data[i] == ' ') {
					buffer->data[i] = '_';
				}
			}
			// The current patch should have a corresponding ".VC_" label
			current_hook = find_symbol_cat(symbols, ".VC_", buffer->data);
			// Skip to the next line
			for (c = getc(input); c != EOF; c = getc(input)) {
				putc(c, output);
				if (c == '\n' || c == '\r') {
					break;
				}
			}
			break;

		default:
			putc(c, output);
			line_col++;
		}
	}

	rewind(orig_rom);
	rewind(new_rom);

	fclose(input);
	fclose(output);
	free_buffer(buffer);
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
