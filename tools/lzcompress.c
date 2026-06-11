#define PROGRAM_NAME "lzcompress"
#define USAGE_OPTS "[-h|--help] [-u|--uncompress] [-m|--matching [-bcdilnr]] [-a|--align alignment] infile outfile"

#include "common.h"

/******************************************** LZ format *******************************************/

#define SHORT_MAX_LENGTH (1 << 5) // Commands have a 5-bit length
#define LONG_MAX_LENGTH (1 << 10) // LZ_LONG extends length to 10 bits

// Offsets for lookback commands are 7 bits; above that they use a 16-bit index
#define LOOKBACK_MAX_OFFSET (1 << 7)

enum lz_command {
	LZ_LITERAL   = 0, // Read literal data for N bytes
	// Sequence commands
	LZ_ITERATE   = 1, // Write the same byte for N bytes
	LZ_ALTERNATE = 2, // Alternate two bytes for N bytes
	LZ_ZERO      = 3, // Write 0 for N bytes
	// Lookback commands
	LZ_REPEAT    = 4, // Repeat N bytes from the offset
	LZ_FLIP      = 5, // Repeat N bit-flipped bytes
	LZ_REVERSE   = 6, // Repeat N bytes in reverse
	// Extended commands
	LZ_LONG      = 7, // Use a new command with a long N
	// Sentinel commands
	LZ_END       = 0xff, // Terminate compressed data
};

struct command {
	enum lz_command cmd; // Picked compression command
	unsigned int length; // Command length N
	int offset;          // Offset for lookback commands; bytes for sequence commands
	uint8_t value;       // Uncompressed byte value
};

/**************************************** Argument options ****************************************/

struct Options {
	bool decompress;
	bool matching;
	uint8_t alignment;
	bool skip_initial_byte;
	bool no_lookback_3;
	bool odd_alternate;
	bool iterate_only;
	bool literal_only;
	bool long_32;
	bool prefer_alternate;
};

struct Options options = {0};

void parse_args(int argc, char *argv[]) {
	struct option long_options[] = {
	    {"uncompress", no_argument, 0, 'u'},
	    {"matching", no_argument, 0, 'm'},
	    {"align", required_argument, 0, 'a'},
	    {"skip-initial-byte", no_argument, 0, 'b'},
	    {"no-lookback-3", no_argument, 0, 'c'},
	    {"odd-alternate", no_argument, 0, 'd'},
	    {"iterate-only", no_argument, 0, 'i'},
	    {"literal-only", no_argument, 0, 'l'},
	    {"long-32", no_argument, 0, 'n'},
	    {"prefer-alternate", no_argument, 0, 'r'},
	    {"help", no_argument, 0, 'h'},
	    {0}
	};
	for (int opt; (opt = getopt_long(argc, argv, "mua:bcdilnrh", long_options)) != -1;) {
		switch (opt) {
		case 'u':
			options.decompress = true;
			break;
		case 'm':
			options.matching = true;
			break;
		case 'a':
			options.alignment = strtoul(optarg, NULL, 0);
			break;
		case 'c':
			options.no_lookback_3 = true;
			break;
		case 'd':
			options.odd_alternate = true;
			break;
		case 'r':
			options.prefer_alternate = true;
			break;
		case 'l':
			options.literal_only = true;
			break;
		case 'i':
			options.iterate_only = true;
			break;
		case 'n':
			options.long_32 = true;
			break;
		case 'b':
			options.skip_initial_byte = true;
			break;
		case 'h':
			fprintf(stderr, "Usage: " PROGRAM_NAME " " USAGE_OPTS "\n\n");
			fputs("Flags to adjust --matching compression:\n", stderr);
			fputs("  -a, --align N            Alignment of the final compressed byte (2^N)\n", stderr);
			fputs("  -b, --skip-initial-byte  First byte will always use LZ_LITERAL\n", stderr);
			fputs("  -c, --no-lookback-3      Don't use LZ_FLIP/LZ_REVERSE/LZ_LONG for length 3\n", stderr);
			fputs("  -d, --odd-alternate      Allow odd-length LZ_ALTERNATE\n", stderr);
			fputs("  -i, --iterate-only       Only use LZ_LITERAL and LZ_ITERATE\n", stderr);
			fputs("  -l, --literal-only       Only use LZ_LITERAL\n", stderr);
			fputs("  -n, --long-32            Use LZ_LONG for length 32\n", stderr);
			fputs("  -r, --prefer-alternate   Use LZ_ALTERNATE instead of equally-large LZ_ITERATE\n", stderr);
			exit(0);
			break;
		default:
			usage_exit(1);
		}
	}
}

/************************************** Matching compression **************************************/

// Above this length, assume the current command is optimal and jump to its end
#define SKIP_LOOKBACK_MIN_LENGTH (1 << 6)

struct list {
	unsigned int *items;
	unsigned int size;
	unsigned int capacity;
};

struct multimap {
	uint32_t key;
	struct list *values;
	struct multimap *next;
};

struct multimap **multimap_find(struct multimap **mp, uint32_t key) {
	while (*mp && (*mp)->key != key) {
		mp = &(*mp)->next;
	}
	return mp;
}

void multimap_put(struct multimap **mp, uint32_t key, unsigned int value) {
	mp = multimap_find(mp, key);
	if (!*mp) {
		*mp = xcalloc(sizeof(**mp));
		(*mp)->key = key;
		(*mp)->values = xcalloc(sizeof(*(*mp)->values));
	}
	struct list *values = (*mp)->values;
	if (values->size == values->capacity) {
		values->capacity = (values->capacity + 1) * 2;
		values->items = xrealloc(values->items, values->capacity * sizeof(*values->items));
	}
	values->items[values->size++] = value;
}

// Input and output data
struct command *commands = NULL;
unsigned int commands_size = 0;

uint8_t iterate_f(unsigned int i, __attribute__((unused)) unsigned int len) {
	return commands[i].value;
}

uint8_t alternate_f(unsigned int i, unsigned int len) {
	return commands[i + (len & 1)].value;
}

uint8_t zero_f(__attribute__((unused)) unsigned int i, __attribute__((unused)) unsigned int len) {
	return 0;
}

uint8_t plain_f(uint8_t v) {
	return v;
}

uint8_t flip_f(uint8_t v) {
	uint8_t f = 0;
	for (unsigned int b = 0; b < 8; b++) {
		f |= ((v >> b) & 1) << (7 - b);
	}
	return f;
}

void try_sequence_command(enum lz_command cmd, unsigned int i, uint8_t (*f)(unsigned int, unsigned int)) {
	unsigned int len;
	for (len = 0; i + len < commands_size && commands[i + len].value == f(i, len); len++) {}
	if (len > 0 && (cmd != LZ_ALTERNATE || commands[i].length < len + options.prefer_alternate)) {
		commands[i].cmd = cmd;
		commands[i].length = len;
	}
}

uint32_t data_key(unsigned int i, uint8_t (*cmd_fn)(uint8_t), int dir) {
	uint32_t result = 0;
	for (unsigned int j = 0; j < 4 && i < commands_size; j++, i += dir) {
		result |= (uint32_t)cmd_fn(commands[i].value) << (uint32_t)(8 * j);
	}
	return result;
}

unsigned int try_lookback_command(
	enum lz_command cmd,
	unsigned int i,
	unsigned int rep_i,
	uint32_t key,
	struct multimap *rep_idxs,
	uint8_t (*cmd_fn)(uint8_t),
	int dir
) {
	rep_idxs = *multimap_find(&rep_idxs, key);
	struct list *idxs = rep_idxs ? rep_idxs->values : NULL;

	unsigned int len = 0;
	for (unsigned int li = 0; idxs && li < idxs->size; li++) {
		unsigned int prev_i = idxs->items[li];
		unsigned int rep_len = 0;
		for (unsigned int j = i, rj = prev_i;
			j < commands_size && rj < commands_size && commands[j].value == cmd_fn(commands[rj].value);
			rep_len++, j++, rj += dir) {}
		if (rep_len > len || (rep_len == len && prev_i > rep_i)) {
			// This repetition is longer than the last one found,
			// or it is the same length and closer
			len = rep_len;
			rep_i = prev_i;
		}
	}
	if (len >= (unsigned int)(3 + options.no_lookback_3) && commands[i].length < len) {
		commands[i].cmd = cmd;
		commands[i].length = len;
		commands[i].offset = i - rep_i - 1;
	}
	return rep_i;
}

void pick_best_command(unsigned int i) {
	if (options.literal_only) {
		return;
	}

	// Try LZ_ITERATE: find sequence of one byte
	try_sequence_command(LZ_ITERATE, i, iterate_f);

	if (options.iterate_only) {
		return;
	}

	// Try LZ_ALTERNATE: find sequence of two alternating bytes
	try_sequence_command(LZ_ALTERNATE, i, alternate_f);

	// Try LZ_ZERO: find sequence of 0 bytes
	try_sequence_command(LZ_ZERO, i, zero_f);

	// Assume that a sequence command is optimal; don't try lookback commands
	if (commands[i].length >= SKIP_LOOKBACK_MIN_LENGTH) {
		return;
	}

	unsigned int rep_i = 0;

	// These map a data key (the first four bytes of a data sequence)
	// to a list of indexes where that data is found
	static struct multimap *repeat_idxs = NULL, *reverse_idxs = NULL;

	// Try LZ_REPEAT: find repetition of previous data
	uint32_t repeat_key = data_key(i, plain_f, 1);
	rep_i = try_lookback_command(LZ_REPEAT, i, rep_i, repeat_key, repeat_idxs, plain_f, 1);

	// Try LZ_FLIP: find repetition of previous bit-flipped data
	uint32_t flip_key = data_key(i, flip_f, 1);
	rep_i = try_lookback_command(LZ_FLIP, i, rep_i, flip_key, repeat_idxs, flip_f, 1);

	// Try LZ_REVERSE: find repetition of previous reversed data
	uint32_t reverse_key = data_key(i, plain_f, -1);
	rep_i = try_lookback_command(LZ_REVERSE, i, rep_i, repeat_key, reverse_idxs, plain_f, -1);

	multimap_put(&repeat_idxs, repeat_key, i);
	multimap_put(&reverse_idxs, reverse_key, i);
}

unsigned int command_length(const struct command *command) {
	switch (command->cmd) {
	case LZ_LITERAL:
		return 1;
	case LZ_ITERATE:
		return 2;
	case LZ_ALTERNATE:
		return 3;
	case LZ_ZERO:
		return 1;
	case LZ_REPEAT:
	case LZ_FLIP:
	case LZ_REVERSE:
		return 2 + (command->offset >= LOOKBACK_MAX_OFFSET);
	default:
		error_exit("invalid LZ command $%02x\n", command->cmd);
	}
}

void pick_optimized_commands(void) {
	// Pick best commands at each index
	for (unsigned int i = options.skip_initial_byte; i < commands_size; i++) {
		pick_best_command(i);
		if (commands[i].length >= SKIP_LOOKBACK_MIN_LENGTH) {
			i += commands[i].length - 1;
		}
	}

	// Reduce lengths so one command won't overlap a subsequent more optimal command
	for (unsigned int i = 0; i < commands_size; i++) {
		for (unsigned int j = 1; j < commands[i].length; j++) {
			if (commands[i + j].length > commands[i].length) {
				commands[i].length = j - (!options.odd_alternate && commands[i].cmd == LZ_ALTERNATE && j % 2);
			}
		}
	}

	// Don't use commands whose encoding would be longer than literal data
	for (unsigned int i = 0; i < commands_size; i++) {
		if (commands[i].length < command_length(&commands[i]) + !options.iterate_only) {
			commands[i].cmd = LZ_LITERAL;
			commands[i].length = 0;
		}
	}

	// Compute the lengths of LZ_LITERAL commands
	for (unsigned int i = 0; i < commands_size; i += commands[i].length) {
		if (commands[i].cmd == LZ_LITERAL) {
			unsigned int len;
			for (len = 1; i + len < commands_size && commands[i + len].cmd == LZ_LITERAL; len++);
			commands[i].length = len;
		}
	}

	// Limit command lengths to LONG_MAX_LENGTH
	for (unsigned int i = 0; i < commands_size; i += commands[i].length) {
		if (commands[i].length > LONG_MAX_LENGTH) {
			commands[i + LONG_MAX_LENGTH].cmd = commands[i].cmd;
			commands[i + LONG_MAX_LENGTH].length = commands[i].length - LONG_MAX_LENGTH;
			commands[i].length = LONG_MAX_LENGTH;
		}
	}
}

void write_commands(FILE *file) {
	unsigned int compressed_size = 0;

	for (unsigned int i = 0; i < commands_size; i += commands[i].length) {
		if (commands[i].length + options.long_32 > SHORT_MAX_LENGTH) {
			fputc((LZ_LONG << 5) | (commands[i].cmd << 2) | ((commands[i].length - 1) >> 8), file);
			fputc((commands[i].length - 1) & 0xff, file);
			compressed_size += 2;
		} else {
			fputc((commands[i].cmd << 5) | (commands[i].length - 1), file);
			compressed_size++;
		}
		switch (commands[i].cmd) {
		case LZ_LITERAL:
			for (unsigned int j = 0; j < commands[i].length; j++) {
				fputc(commands[i + j].value, file);
			}
			compressed_size += commands[i].length;
			break;
		case LZ_ITERATE:
			fputc(commands[i].value, file);
			compressed_size++;
			break;
		case LZ_ALTERNATE:
			fputc(commands[i].value, file);
			fputc(commands[i + 1].value, file);
			compressed_size += 2;
			break;
		case LZ_ZERO:
			break;
		case LZ_REPEAT:
		case LZ_FLIP:
		case LZ_REVERSE:
			if (commands[i].offset < LOOKBACK_MAX_OFFSET) {
				fputc(commands[i].offset | 0x80, file);
				compressed_size++;
			} else {
				unsigned int address = i - commands[i].offset - 1;
				fputc(address >> 8, file);
				fputc(address & 0xff, file);
				compressed_size += 2;
			}
			break;
		default:
			error_exit("invalid LZ command $%02x in output\n", commands[i].cmd);
		}
	}

	fputc(LZ_END, file);
	compressed_size++;

	while (options.alignment && compressed_size % (1 << options.alignment)) {
		fputc(0, file);
		compressed_size++;
	}
}

void compress_matching(char const *input_name, char const *output_name) {
	long input_size;
	uint8_t *input_data = read_u8(input_name, &input_size);

	commands_size = (unsigned int)input_size;
	commands = xcalloc(sizeof(*commands) * commands_size);
	for (unsigned int i = 0; i < commands_size; i++) {
		commands[i].value = input_data[i];
	}

	free(input_data);

	pick_optimized_commands();

	FILE *output = xfopen(output_name, 'w');
	write_commands(output);
	xfclose(output);

	free(commands);
}

/********************************** Optimized dynamic compression *********************************/

// Original `lzcomp` implementation by ax6 <https://github.com/aaaaaa123456789/lzcomp>
// Dynamic programming `dpcomp` algorithm by mei <https://github.com/meithecatte/lzcomp>
// Licensed with the Unlicense into the public domain <https://unlicense.org>

// Uncompressed data
uint8_t *raw_data = NULL;
unsigned int raw_data_size = 0;

// best_sizes[i] = the best compressed length for the first i bytes of input
// Note that this is nondecreasing, since truncating even in the middle of a command won't enlarge it
unsigned int *best_sizes = NULL;
// best_commands[i] = the last command of the commands that yields best_sizes[i]
struct command *best_commands = NULL;

unsigned int min(unsigned int a, unsigned int b) {
	return a < b ? a : b;
}

unsigned int command_size(const struct command *command) {
	unsigned int header_size = 1 + (command->length > SHORT_MAX_LENGTH);
	switch (command->cmd) {
	case LZ_LITERAL:
		return header_size + command->length;
	case LZ_ITERATE:
		return header_size + 1;
	case LZ_ALTERNATE:
		return header_size + 2;
	case LZ_ZERO:
		return header_size;
	case LZ_REPEAT:
	case LZ_FLIP:
	case LZ_REVERSE:
		return header_size + 1 + (command->offset >= 0);
	default:
		error_exit("invalid LZ command $%02x\n", command->cmd);
	}
}

void consider(unsigned int pos, const struct command *command) {
	unsigned int new_size = best_sizes[pos - command->length] + command_size(command);
	if (new_size < best_sizes[pos]) {
		best_sizes[pos] = new_size;
		best_commands[pos] = *command;
	}
}

unsigned int match_right(unsigned int pos, unsigned int at) {
	unsigned int n = 0;
	while (pos + n < raw_data_size && raw_data[pos + n] == raw_data[at + n]) {
		n++;
	}
	return n;
}

unsigned int match_flipped(unsigned int pos, unsigned int at) {
	unsigned int n = 0;
	while (pos + n < raw_data_size && flip_f(raw_data[pos + n]) == raw_data[at + n]) {
		n++;
	}
	return n;
}

unsigned int match_left(unsigned int pos, unsigned int at) {
	unsigned int n = 0;
	while (pos + n < raw_data_size && n <= at && raw_data[pos + n] == raw_data[at - n]) {
		n++;
	}
	return n;
}

int encode_offset(int pos, int at) {
	return at - pos >= -LOOKBACK_MAX_OFFSET ? at - pos : at;
}

void find_optimal_commands(void) {
	best_sizes = xmalloc(sizeof(*best_sizes) * (raw_data_size + 1));
	best_commands = xmalloc(sizeof(*best_commands) * (raw_data_size + 1));

	best_sizes[0] = 0;
	for (unsigned int i = 1; i <= raw_data_size; i++) {
		best_sizes[i] = -1u;
	}

	for (unsigned int i = 1; i <= raw_data_size; i++) {
		uint8_t byte = raw_data[i - 1];
		for (unsigned int prev = i > LONG_MAX_LENGTH ? i - LONG_MAX_LENGTH : 0; prev < i; prev++) {
			consider(i, &(struct command){LZ_LITERAL, i - prev, prev, 0});
		}

		unsigned int len = 0;
		do {
			len++;
			if (len >= 2) {
				consider(i, &(struct command){byte ? LZ_ITERATE : LZ_ZERO, len, byte, 0});
			}
		} while (len < LONG_MAX_LENGTH && len < i && raw_data[i - (len + 1)] == byte);

		if (i > 1) {
			len = 1;
			do {
				len++;
				if (len >= 3) {
					int bytes = (raw_data[i - len + 1] << 8) | (raw_data[i - len]);
					consider(i, &(struct command){LZ_ALTERNATE, len, bytes, 0});
				}
			} while (len < LONG_MAX_LENGTH && len < i && raw_data[i - (len + 1)] == raw_data[i - (len - 1)]);
		}

		for (unsigned int at = 0; at < i - 1; at++) {
			unsigned int k = min(LONG_MAX_LENGTH, match_right(i - 1, at));
			for (unsigned int j = 2; j <= k; j++) {
				consider(i + j - 1, &(struct command){LZ_REPEAT, j, encode_offset(i - 1, at), 0});
			}

			k = min(LONG_MAX_LENGTH, match_left(i - 1, at));
			for (unsigned int j = 2; j <= k; j++) {
				consider(i + j - 1, &(struct command){LZ_REVERSE, j, encode_offset(i - 1, at), 0});
			}

			k = min(LONG_MAX_LENGTH, match_flipped(i - 1, at));
			for (unsigned int j = 2; j <= k; j++) {
				consider(i + j - 1, &(struct command){LZ_FLIP, j, encode_offset(i - 1, at), 0});
			}
		}
	}

	unsigned int command_count = 0;
	for (unsigned int pos = raw_data_size; pos > 0; pos -= best_commands[pos].length) {
		command_count++;
	}
	commands_size = command_count;

	commands = xmalloc(sizeof(*commands) * command_count);
	for (unsigned int pos = raw_data_size; pos > 0; pos -= best_commands[pos].length) {
		commands[--command_count] = best_commands[pos];
	}
}

void write_commands_dynamic(FILE *file) {
	unsigned int compressed_size = 0;

	for (unsigned int i = 0; i < commands_size; i++) {
		struct command command = commands[i];

		uint8_t buf[4] = {0};
		uint8_t *buf_pos = buf;

		command.length--;

		if (command.length >= LONG_MAX_LENGTH) {
			error_exit("invalid LZ command $%02x (length %u) in output\n", command.cmd, command.length);
		}

		if (command.length < SHORT_MAX_LENGTH) {
			*(buf_pos++) = (command.cmd << 5) + command.length;
		} else {
			*(buf_pos++) = (LZ_LONG << 5) + (command.cmd << 2) + (command.length >> 8);
			*(buf_pos++) = command.length & 0xff;
		}

		switch (command.cmd) {
		case LZ_LITERAL:
			break;
		case LZ_ITERATE:
			if (command.offset < 0 || command.offset > 0xff) {
				error_exit("invalid LZ command $%02x (byte $%x) in output\n", command.cmd, command.offset);
			}
			*(buf_pos++) = command.offset & 0xff;
			break;
		case LZ_ALTERNATE:
			if (command.offset < 0 || command.offset > 0xffff) {
				error_exit("invalid LZ command $%02x (bytes $%x) in output\n", command.cmd, command.offset);
			}
			*(buf_pos++) = command.offset & 0xff;
			*(buf_pos++) = command.offset >> 8;
			break;
		case LZ_ZERO:
			break;
		case LZ_REPEAT:
		case LZ_FLIP:
		case LZ_REVERSE:
			if (command.offset < -LOOKBACK_MAX_OFFSET) {
				error_exit("invalid LZ command $%02x (offset %d) in output\n", command.cmd, command.offset);
			}
			if (command.offset < 0) {
				*(buf_pos++) = command.offset ^ 0x7f;
			} else {
				*(buf_pos++) = command.offset >> 8;
				*(buf_pos++) = command.offset & 0xff;
			}
			break;
		default:
			error_exit("invalid LZ command $%02x in output\n", command.cmd);
		}

		fwrite(buf, 1, buf_pos - buf, file);
		if (!command.cmd) {
			command.length++;
			fwrite(raw_data + command.offset, 1, command.length, file);
		}

		compressed_size += command_size(&commands[i]);
	}

	putc(LZ_END, file);

	unsigned int padding_size = ~compressed_size & ((1 << options.alignment) - 1);
	while (padding_size--) {
		putc(0, file);
	}
}

void compress_dynamic(char const *input_name, char const *output_name) {
	long input_size;
	raw_data = read_u8(input_name, &input_size);

	raw_data_size = (unsigned int)input_size;
	find_optimal_commands();

	free(best_commands);
	free(best_sizes);

	FILE *output = xfopen(output_name, 'w');
	write_commands_dynamic(output);
	xfclose(output);

	free(raw_data);
	free(commands);
}

/****************************************** Decompression *****************************************/

struct command *read_commands(char const *filename, unsigned int *num_commands) {
	long filesize;
	uint8_t *data = read_u8(filename, &filesize);

	// There will be at most one command per byte of compressed data, so
	// `filesize` is a valid upper bound for the count of `command_data`
	struct command *command_data = xmalloc(sizeof(*command_data) * filesize);
	*num_commands = 0;

	for (long i = 0; i < filesize;) {
		uint8_t byte = data[i++];
		struct command *command = &command_data[(*num_commands)++];

		unsigned int following_len = 0;

		if (byte == LZ_END) {
			command->cmd = LZ_END;
		} else {
			command->cmd = byte >> 5;
			command->length = byte & 31;
			if (command->cmd == LZ_LONG) {
				if (i >= filesize) {
					error_exit("incomplete long command at end of input\n");
				}
				command->cmd = command->length >> 2;
				command->length = ((command->length & 3) << 8) | data[i++];
			}
			command->length++;
		}

		switch (command->cmd) {
		case LZ_END:
			following_len = filesize - i;
			break;
		case LZ_LITERAL:
			following_len = command->length;
			break;
		case LZ_ITERATE:
			following_len = 1;
			break;
		case LZ_ALTERNATE:
			following_len = 2;
			break;
		case LZ_ZERO:
			break;
		case LZ_REPEAT:
		case LZ_FLIP:
		case LZ_REVERSE:
			if (i >= filesize) {
				error_exit("incomplete $%02x command at end of input\n", command->cmd);
			}
			command->offset = data[i++];
			if (command->offset & 0x80) {
				command->offset = -((command->offset & 0x7f) + 1);
			} else {
				if (i >= filesize) {
					error_exit("incomplete $%02x command at end of input\n", command->cmd);
				}
				command->offset = (command->offset << 8) | data[i++];
			}
			break;
		default:
			error_exit("invalid LZ command $%02x\n", command->cmd);
		}

		if (i + following_len > filesize) {
			error_exit("incomplete $%02x command at end of input\n", command->cmd);
		}
		for (unsigned int j = 0; j < following_len; j++) {
			command_data[(*num_commands)++].value = data[i++];
		}
	}

	free(data);
	return command_data;
}

void decompress(char const *input_name, char const *output_name) {
	unsigned int input_size;
	struct command *input_data = read_commands(input_name, &input_size);

	unsigned int output_capacity = input_size * 2;
	uint8_t *output_data = xmalloc(output_capacity);
	unsigned int output_size = 0;

	for (unsigned int i = 0; i < input_size;) {
		struct command *command = &input_data[i++];

		if (command->cmd == LZ_END) {
			break;
		}

		if (output_size + command->length > output_capacity) {
			output_capacity = output_capacity * 2 + command->length;
			output_data = xrealloc(output_data, output_capacity);
		}

		switch (command->cmd) {
		case LZ_LITERAL:
			if (i + command->length > input_size) {
				error_exit("incomplete $%02x command at end of input\n", command->cmd);
			}
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = input_data[i++].value;
			}
			break;
		case LZ_ITERATE:
			if (i + 1 > input_size) {
				error_exit("incomplete $%02x command at end of input\n", command->cmd);
			}
			uint8_t byte = input_data[i++].value;
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = byte;
			}
			break;
		case LZ_ALTERNATE:
			if (i + 2 > input_size) {
				error_exit("incomplete $%02x command at end of input\n", command->cmd);
			}
			uint8_t bytes[2] = {input_data[i].value, input_data[i + 1].value};
			i += 2;
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = bytes[j & 1];
			}
			break;
		case LZ_ZERO:
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = 0;
			}
			break;
		case LZ_REPEAT: {
			unsigned int base = (command->offset < 0 ? output_size : 0) + command->offset;
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = output_data[base + j];
			}
			break;
		}
		case LZ_FLIP: {
			unsigned int base = (command->offset < 0 ? output_size : 0) + command->offset;
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = flip_f(output_data[base + j]);
			}
			break;
		}
		case LZ_REVERSE: {
			unsigned int base = (command->offset < 0 ? output_size : 0) + command->offset;
			for (unsigned int j = 0; j < command->length; j++) {
				output_data[output_size++] = output_data[base - j];
			}
			break;
		}
		default:
			error_exit("invalid LZ command $%02x in input\n", command->cmd);
		}
	}

	write_u8(output_name, output_data, output_size);

	free(input_data);
	free(output_data);
}

/********************************************** Main **********************************************/

int main(int argc, char *argv[]) {
	parse_args(argc, argv);

	argc -= optind;
	argv += optind;
	if (argc != 2) {
		usage_exit(1);
	}

	if (options.decompress) {
		decompress(argv[0], argv[1]);
	} else if (options.matching) {
		compress_matching(argv[0], argv[1]);
	} else {
		compress_dynamic(argv[0], argv[1]);
	}

	return 0;
}
