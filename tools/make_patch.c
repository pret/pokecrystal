#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>

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

struct asmfile {
	struct asmfile *next;
	struct symbol *symbols;
	char name[];
};

struct asmfile *asmfiles = NULL;

void free_buffer(void *buf)
{
	struct buffer *buffer = buf - sizeof(struct buffer);
	free(buffer);
}

void *create_buffer()
{
	struct buffer *buffer = malloc(sizeof(struct buffer) + 0x100);
	if (!buffer) {
		fprintf(stderr, "Error: Cannot allocate memory\n");
		return NULL;
	}

	buffer->size = 0x100;
	return buffer->buffer;
}

void *expand_buffer(void *buf, const size_t size)
{
	struct buffer *buffer = buf - sizeof(struct buffer);

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

void free_list(void *list)
{
	// Frees an entire linked list
	// Expects the ->next entry to be the first element!

	while (list) {
		void *next = *(void **)list;
		free(list);
		list = next;
	}
}

void free_asmfiles(struct asmfile *asmfile)
{
	void *temp;
	while (asmfile) {
		if (asmfile->symbols) free_list(asmfile->symbols);
		temp = asmfile;
		asmfile = asmfile->next;
		free(temp);
	}
}

int create_symbol(struct symbol **tip, const int value, const char *name)
{
	struct symbol *symbol;

	symbol = malloc(sizeof(struct symbol) + strlen(name) + 1);
	if (!symbol) {
		fprintf(stderr, "Error: Cannot allocate memory\n");
		return -1;
	}
	symbol->value = value;
	strcpy(symbol->name, name);

	// Link it at the start of the rest of the list
	symbol->next = *tip;
	*tip = symbol;

	return 0;
}

const struct symbol *find_symbol(const struct symbol *symbols, const char *name)
{
	const struct symbol *symbol = symbols;
	while (symbol) {
		if (strcmp(symbol->name, name) == 0) {
			return symbol;
		}
		symbol = symbol->next;
	}

	return NULL;
}

int parse_address(char *buffer)
{
	int offset;
	int bank, address;
	char *endptr_bank, *endptr_address;
	char *buffer_address;

	buffer_address = strchr(buffer, ':');
	if (buffer_address) *buffer_address++ = '\0';

	// Verify it consists of expected elements
	if (strlen(buffer) > 2 || !buffer_address || strlen(buffer_address) > 4) {
		if (buffer_address) *--buffer_address = ':';
		fprintf(stderr, "Error: Unexpected %s\n", buffer);
		return -1;
	}

	// Parse the bank and address parts
	bank = strtol(buffer, &endptr_bank, 16);
	address = strtol(buffer_address, &endptr_address, 16);
	if (endptr_bank != buffer + strlen(buffer) ||
			endptr_address != buffer_address + strlen(buffer_address)) {
		fprintf(stderr, "Error: Cannot parse %s:%s\n", buffer, buffer_address);
		return -1;
	}

	// If it's not a ROM address, (silently) ignore it.
	if (address > 0x7FFF) return 0;

	// Calculate the absolute offset in the ROM
	if (bank == 0) {
		offset = address;
	} else {
		offset = bank * 0x4000 + (address - 0x4000);
	}

	return offset;
}

struct symbol *parse_symfile(FILE *file, const char *prefix)
{
	struct symbol *symbols = NULL;
	char *buffer;
	size_t buffer_index = 0;
	int c;
	int offset = -1;

	buffer = create_buffer();
	if (!buffer) goto error;

	// Parse the symfile, to get the symbols we want.
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch (c) {
		case ';':
		case '\n':
			// If we encounter a newline or comment,
			//   we've reached the end of the label name.
			buffer[buffer_index] = '\0';

			// Only do stuff if we managed to read a valid offset.
			if (offset == -1 && buffer_index > 0) {
				fprintf(stderr, "Error: Cannot parse %s\n", buffer);
				goto error;
			}

			// This is the end of the parsable line
			buffer_index = SIZE_MAX;
			if (offset == -1) break;

			// Check if the symbol starts with the requested prefix
			if (strncmp(prefix, buffer, strlen(prefix)) != 0) break;

			if (create_symbol(&symbols, offset, buffer + strlen(prefix))) goto error;

			offset = -1;
			break;

		case '.':
			// If a local symbol has been requested,
			//   we can clear the buffer at the first '.'
			if (offset != -1 && prefix[0] == '.' && buffer[0] != '.') {
				buffer_index = 0;
			}

			buffer[buffer_index++] = c;
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
			offset = parse_address(buffer);
			if (offset == -1) goto error;
			buffer_index = offset ? 0 : SIZE_MAX;

			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			offset = -1;

			while (c != '\n') {
				if ((c = getc(file)) == EOF) break;
			}
		}
	}

	if (!symbols) {
		fprintf(stderr, "Error: No symbols found starting with: %s\n", prefix);
	}

	free_buffer(buffer);
	return symbols;

error:
	if (buffer) free_buffer(buffer);
	return NULL;
}

int parse_rgbds_int(char *string)
{
	char *start = string;
	char *end;
	int base = 10;
	int value;

	// Figure out the base
	if (*start == '$') {
		base = 16;
		start++;
	}

	errno = 0;
	value = strtol(start, &end, base);

	if (errno || end != string + strlen(string)) {
		// Parsing complex things is out of this program's scope.
		// Warning the user would be a good thing, but warning
		//  for things we just can't parse would be annoying...
		return -1;
	}

	return value;
}

struct symbol *parse_asm(FILE *file)
{
	struct symbol *symbols = NULL;
	char *label = NULL;
	char *buffer;
	size_t buffer_index = 0;
	int const_value = -1;
	int c;

	enum {
		PARSING_LABEL,
		PARSING_INSTRUCTION,
		PARSING_EQU,
		PARSING_CONST_DEF,
		PARSING_CONST
	} parsing = PARSING_LABEL;

	buffer = create_buffer();
	if (!buffer) goto error;

	// Get all the constants defined in a file
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch(c) {
		case ' ':
		case '\t':
			// Eat these characters if we haven't picked up anything else yet
			if (!buffer_index) {
				// If the line starts with one of these characters,
				//  we're parsing an instruction.
				if (parsing == PARSING_LABEL) parsing = PARSING_INSTRUCTION;
				break;
			}

			if (parsing == PARSING_LABEL) {
				// A label starts with its name
				buffer[buffer_index] = '\0';
				buffer_index = 0;
				label = malloc(strlen(buffer) + 1);
				if (!label) {
					fprintf(stderr, "Error: Cannot allocate memory\n");
					goto error;
				}
				strcpy(label, buffer);
				parsing = PARSING_INSTRUCTION;
				break;
			} else if (parsing == PARSING_INSTRUCTION) {
				// Figure out what instruction we've encountered
				buffer[buffer_index] = '\0';
				buffer_index = SIZE_MAX;

				if (label && strcmp(buffer, "EQU") == 0) {
					buffer_index = 0;
					parsing = PARSING_EQU;
				} else if (strcmp(buffer, "const_def") == 0) {
					buffer_index = 0;
					parsing = PARSING_CONST_DEF;
				} else if (strcmp(buffer, "const") == 0) {
					buffer_index = 0;
					parsing = PARSING_CONST;
				}
				break;
			}

			buffer[buffer_index++] = c;
			break;

		case '\n':
		case ';':
			buffer[buffer_index] = '\0';

			// Trim ending whitespace
			while (isspace(buffer[--buffer_index])) buffer[buffer_index] = '\0';
			buffer_index++;

			if (parsing == PARSING_INSTRUCTION) {
				// const_def may also take 0 arguments
				if (strcmp(buffer, "const_def") == 0) {
					const_value = 0;
				}
			} else if (parsing == PARSING_EQU) {
				int value = parse_rgbds_int(buffer);
				if (value != -1) {
					if (create_symbol(&symbols, value, label)) goto error;
				}
			} else if (parsing == PARSING_CONST_DEF) {
				int value = parse_rgbds_int(buffer);
				if (value != -1) {
					const_value = value;
				}
			} else if (parsing == PARSING_CONST) {
				if (const_value == -1) {
					fprintf(stderr, "Error: Found `const` before `const_def`\n");
					goto error;
				}
				if (create_symbol(&symbols, const_value++, buffer)) goto error;
			}

			buffer_index = SIZE_MAX;
			parsing = PARSING_LABEL;
			break;

		default:
			buffer[buffer_index++] = c;
		}

		// We were requested to skip to the next line
		if (buffer_index == SIZE_MAX) {
			buffer_index = 0;
			parsing = PARSING_LABEL;
			if (label) free(label);
			label = NULL;

			while (c != '\n') {
				if ((c = getc(file)) == EOF) break;
			}
		}
	}

	free_buffer(buffer);
	if (label) free(label);
	return symbols;

error:
	if (buffer) free_buffer(buffer);
	if (label) free(label);
	return NULL;
}

int get_constant(const char *filename, const char *constant)
{
	int value = -1;
	FILE *file = NULL;
	struct symbol *symbols = NULL;
	struct asmfile *asmfile = asmfiles;
	const struct symbol *symbol;

	// Check if we've already loaded the symbols
	while (asmfile) {
		if (strcmp(asmfile->name, filename) == 0) {
			symbols = asmfile->symbols;
			break;
		}
		asmfile = asmfile->next;
	}

	// If not, well, load them
	if (!symbols) {
		file = fopen(filename, "r");
		if (!file) {
			fprintf(stderr, "Error: Cannot open file: %s\n", filename);
			goto error;
		}
		symbols = parse_asm(file);
		fclose(file);
		file = NULL;

		// Save them for later re-use
		asmfile = malloc(sizeof(struct asmfile) + strlen(filename) + 1);
		if (!asmfile) {
			fprintf(stderr, "Error: Cannot allocate memory\n");
			if (symbols) free_list(symbols);
			goto error;
		}
		asmfile->symbols = symbols;
		strcpy(asmfile->name, filename);
		asmfile->next = asmfiles;
		asmfiles = asmfile;
	}

	// Look for the symbol
	symbol = find_symbol(symbols, constant);
	if (!symbol) {
		fprintf(stderr, "Error: Could not find constant %s in file %s\n", constant, filename);
		goto error;
	}

	value = symbol->value;

error:
	if (file) fclose(file);
	return value;
}

void interpret_command(char *command, const struct symbol *symbol, struct patch *patch,
                       FILE *new_rom, FILE *orig_rom, FILE *output)
{
	int argc = 0;
	int offset = symbol->value;
	char *s;

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
	if (strcmp(command, "ADDREss") == 0) {
		// Shitty hack, shouldn't be used anyway
		int high = offset >> 8;
		int low = offset & 0xFF;
		fprintf(output, "0x%X%x", high, low);
	} else if (strcmp(command, "Address") == 0 ||
			   strcmp(command, "address") == 0) {
		if (argc > 0) offset += strtol(argv[0], NULL, 0);

		fprintf(output, "0x");
		if (argc > 1) {
			for (int i = strtol(argv[1], NULL, 0); i > 0; i--) {
				putchar('0');
			}
		}

		fprintf(output, isupper(command[0]) ? "%X" : "%x", offset);
	} else if (strcmp(command, "Patch") == 0 ||
			   strcmp(command, "patch") == 0) {
		if (argc > 0) offset += strtol(argv[0], NULL, 0);

		if (fseek(orig_rom, offset, SEEK_SET) != 0) {
			fprintf(stderr, "Error: Could not seek to the offset of %s in the original ROM\n", symbol->name);
			return;
		}

		if (fseek(new_rom, offset, SEEK_SET) != 0) {
			fprintf(stderr, "Error: Could not seek to offset of %s in the new ROM\n", symbol->name);
			return;
		}

		if (argc <= 1 || strcmp(argv[1], "big") != 0) {
			int c = getc(new_rom);
			if (c == getc(orig_rom)) {
				fprintf(stderr, "Warning: %s doesn't actually contain any differences\n", symbol->name);
			}

			patch->offset = offset;
			patch->size = 1;
			fprintf(output, "0x");
			fprintf(output, isupper(command[0]) ? "%02X" : "%02x", c);
		} else {
			int length = 0;

			// Figure out the length of the patch
			while(getc(orig_rom) == getc(new_rom)) length++;
			length++;
			while(getc(orig_rom) != getc(new_rom)) length++;

			// We've got the length, now go back
			fseek(new_rom, offset, SEEK_SET);

			// Print out the patch
			patch->offset = offset;
			patch->size = length;
			fprintf(output, "a%d:", length);
			for (int i = 0; i < length; i++) {
				if (i != 0) putc(' ', output);
				fprintf(output, isupper(command[0]) ? "%02X" : "%02x", getc(new_rom));
			}
		}
	} else if (strcmp(command, "Constant") == 0 ||
			   strcmp(command, "constant") == 0) {
		if (argc <= 1) {
			fprintf(stderr, "Error: Missing arguments for %s", command);
		}

		int value = get_constant(argv[0], argv[1]);
		if (value == -1) return;

		fprintf(output, isupper(command[0]) ? "%X": "%x", value);
	} else {
		fprintf(stderr, "Error: Unknown command: %s\n", command);
	}
}

struct patch *process_template(FILE *file, FILE *new_rom, FILE *orig_rom, FILE *output,
                               const struct symbol *symbols)
{
	struct patch *patches = NULL;
	struct patch *patch = NULL;
	const struct symbol *symbol = NULL;
	char *buffer;
	size_t buffer_index = 0;
	int c;
	int line_pos = 0;

	buffer = create_buffer();
	if (!buffer) goto error;

	patches = create_buffer();
	if (!patches) goto error;
	patch = patches;

	// Implicitly add the ROM checksum to the patch list,
	//   since that will always differ.
	patch->offset = 0x14e;
	patch->size = 2;
	patch++;

	// Fill in the template
	while ((c = getc(file)) != EOF) {
		buffer = expand_buffer(buffer, buffer_index);
		if (!buffer) goto error;

		switch (c) {
		case '\n':
			// A newline simply resets line_pos
			putc(c, output);
			line_pos = 0;
			break;

		case '/':
			// Check if we've encountered a comment
			c = getc(file);
			if (c != '*') {
				putc('/', output);
				line_pos++;
				ungetc(c, file);
				break;
			}

			// Simply gobble everything up until we hit the end
			while ((c = getc(file)) != EOF) {
				if (c == '*') {
					if ((c = getc(file)) == EOF) break;
					if (c == '/') break;
				}
			}

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

			// If we didn't manage to find the symbol,
			//   we can just end inmediately.
			if (!symbol) break;

			patch->offset = 0;
			interpret_command(buffer, symbol, patch, new_rom, orig_rom, output);
			if (patch->offset) patch++;
			patches = expand_buffer(patches, (uintptr_t)patch - (uintptr_t)patches);
			if (!patches) goto error;

			break;

		case '[':
			// End inmediately if this is not the beginning of the line.
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

					// Look for the symbol
					symbol = find_symbol(symbols, buffer);
					if (!symbol) {
						fprintf(stderr, "Error: Cannot find symbol: %s\n",
						        buffer);
					}

					// Skip until the next newline
					while ((c = getc(file)) != EOF) {
						putc(c, output);
						if (c == '\n') break;
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

int compare_patch(const void *_patch1, const void *_patch2)
{
	const struct patch *patch1 = _patch1;
	const struct patch *patch2 = _patch2;
	return patch1->offset - patch2->offset;
}

int verify_completeness(FILE *orig_rom, FILE *new_rom, struct patch *patches)
{
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

		if (c != d) return -1;
	}

	return c != d;
}

int main(int argc, char *argv[])
{
	struct symbol *symbols = NULL;
	struct patch *patches = NULL;
	FILE *file = NULL;
	FILE *new_rom = NULL;
	FILE *orig_rom = NULL;

	if (argc < 6) {
		fprintf(stderr, "Usage: %s <label prefix> <symfile> <patched rom> <original rom>\n", argv[0]);
		return 1;
	}

	file = fopen(argv[2], "r");
	if (!file) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[2]);
		goto error;
	}

	if (!(symbols = parse_symfile(file, argv[1]))) goto error;

	fclose(file);
	file = NULL;

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

	file = fopen(argv[5], "r");
	if (!file) {
		fprintf(stderr, "Error: Cannot open file: %s\n", argv[5]);
		goto error;
	}

	if (!(patches = process_template(file, new_rom, orig_rom, stdout, symbols))) goto error;
	if (verify_completeness(orig_rom, new_rom, patches)) {
		fprintf(stderr, "Warning: Not all differences in the ROM are defined in the patch\n");
	}

	free_asmfiles(asmfiles);
	free_list(symbols);
	fclose(file);
	fclose(new_rom);
	fclose(orig_rom);

	return 0;

error:
	free_asmfiles(asmfiles);
	free_list(symbols);
	if (file) fclose(file);
	if (new_rom) fclose(new_rom);
	if (orig_rom) fclose(orig_rom);

	return 1;
}
