#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define COMPRESSION_METHODS 72

struct command {
  unsigned command: 3;
  unsigned count:  12;
  signed value:    17;
};

struct options {
  const char * input;
  const char * output;
  unsigned char mode;
};

int main(int, char **);
struct options get_options(char **);
void usage(const char *);
void error_exit(int, const char *, ...);
void bit_flip(const unsigned char *, unsigned short, unsigned char *);
unsigned char * read_file_into_buffer(const char *, unsigned short *);
void write_commands_to_textfile(const char *, const struct command *, unsigned, const unsigned char *);
void write_command_to_textfile(FILE *, struct command, const unsigned char *);
void write_commands_to_file(const char *, const struct command *, unsigned, const unsigned char *);
void write_command_to_file(FILE *, struct command, const unsigned char *);
struct command * compress(const unsigned char *, unsigned short *);
struct command * store_uncompressed(unsigned short *);
struct command * try_compress(const unsigned char *, const unsigned char *, unsigned short *, unsigned);
struct command find_best_copy(const unsigned char *, unsigned short, unsigned short, const unsigned char *, unsigned);
unsigned short scan_forwards(const unsigned char *, unsigned short, const unsigned char *, unsigned short, short *);
unsigned short scan_backwards(const unsigned char *, unsigned short, unsigned short, short *);
struct command find_best_repetition(const unsigned char *, unsigned short, unsigned short);
struct command pick_best_command(unsigned, struct command, ...);
int is_better(struct command, struct command);
short command_size(struct command);
void optimize(struct command *, unsigned short);
void repack(struct command **, unsigned short *);
struct command * select_command_sequence(struct command **, const unsigned short *, unsigned, unsigned short *);
struct command * merge_command_sequences(const struct command *, unsigned short, const struct command *, unsigned short, unsigned short *);
unsigned short compressed_length(const struct command *, unsigned short);

int main (int argc __attribute__((unused)), char ** argv) {
  struct options options = get_options(argv);
  unsigned short size;
  unsigned char * file_buffer = read_file_into_buffer(options.input, &size);
  struct command * compressed = compress(file_buffer, &size);
  if (options.mode)
    write_commands_to_textfile(options.output, compressed, size, file_buffer);
  else
    write_commands_to_file(options.output, compressed, size, file_buffer);
  free(file_buffer);
  free(compressed);
  return 0;
}

struct options get_options (char ** argv) {
  struct options result = {.input = NULL, .output = NULL, .mode = 0};
  const char * program_name = *argv;
  for (argv ++; *argv; argv ++) {
    if (strncmp(*argv, "--", 2)) break;
    if (!strcmp(*argv, "--")) {
      argv ++;
      break;
    } else if (!strcmp(*argv, "--text"))
      result.mode = 1;
    else if (!strcmp(*argv, "--binary"))
      result.mode = 0;
    else
      error_exit(3, "unknown option: %s", *argv);
  }
  if (!*argv) usage(program_name);
  result.input = *argv;
  result.output = argv[1];
  return result;
}

void usage (const char * program_name) {
  fprintf(stderr, "Usage: %s [<options>] <source file> [<compressed output>]\n\n", program_name);
  fputs("Options:\n", stderr);
  fputs("    --text    Output the command stream as text.\n", stderr);
  fputs("    --binary  Output the command stream as binary data (default).\n", stderr);
  fputs("    --        End of option list.\n", stderr);
  exit(3);
}

void error_exit (int error_code, const char * error, ...) {
  va_list ap;
  va_start(ap, error);
  fputs("error: ", stderr);
  vfprintf(stderr, error, ap);
  fputc('\n', stderr);
  exit(error_code);
}

void bit_flip (const unsigned char * data, unsigned short length, unsigned char * result) {
  unsigned char new_value, pos;
  while (length --) {
    new_value = 0;
    for (pos = 0; pos < 8; pos ++) new_value |= ((*data >> pos) & 1) << (7 - pos);
    *(result ++) = new_value;
    data ++;
  }
}

unsigned char * read_file_into_buffer (const char * file, unsigned short * size) {
  FILE * fp = fopen(file, "rb");
  if (!fp) error_exit(1, "could not open file %s for reading", file);
  unsigned char * buf = malloc(32769);
  int rv = fread(buf, 1, 32769, fp);
  fclose(fp);
  if (rv < 0) error_exit(1, "could not read from file %s", file);
  if (rv > 32768) error_exit(1, "file %s is too big", file);
  *size = rv;
  return buf;
}

void write_commands_to_textfile (const char * file, const struct command * commands, unsigned count, const unsigned char * input_stream) {
  FILE * fp = file ? fopen(file, "w") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  while (count --) write_command_to_textfile(fp, *(commands ++), input_stream);
  if (fputs("\tlzend\n", fp) < 0) error_exit(1, "could not write terminator to compressed output");
  if (file) fclose(fp);
}

void write_command_to_textfile (FILE * fp, struct command command, const unsigned char * input_stream) {
  if ((!command.count) || (command.count > 1024)) error_exit(2, "invalid command in output stream");
  int rv = -1, pos;
  const char * kind;
  switch (command.command) {
    case 0:
      if ((rv = fprintf(fp, "\tlzdata")) < 0) break;
      for (pos = 0; pos < command.count; pos ++) if ((rv = fprintf(fp, "%s$%02hhx", pos ? ", " : " ", input_stream[command.value + pos])) < 0) break;
      rv = putc('\n', fp);
      break;
    case 1:
      if ((command.value < 0) || (command.value > 255)) error_exit(2, "invalid command in output stream");
      rv = fprintf(fp, "\tlzrepeat %u, $%02hhx\n", command.count, (unsigned char) command.value);
      break;
    case 2:
      if (command.value < 0) error_exit(2, "invalid command in output stream");
      rv = fprintf(fp, "\tlzrepeat %u, $%02hhx, $%02hhx\n", command.count, (unsigned char) command.value, (unsigned char) (command.value >> 8));
      break;
    case 3:
      rv = fprintf(fp, "\tlzzero %u\n", command.count);
      break;
    case 4:
      kind = "normal";
      goto copy;
    case 5:
      kind = "flipped";
      goto copy;
    case 6:
      kind = "reversed";
    copy:
      if ((command.value < -128) || (command.value > 32767)) error_exit(2, "invalid command in output stream");
      if (command.value < 0)
        rv = fprintf(fp, "\tlzcopy %s, %u, %d\n", kind, command.count, command.value);
      else
        rv = fprintf(fp, "\tlzcopy %s, %u, $%04hx\n", kind, command.count, (unsigned short) command.value);
      break;
    default:
      error_exit(2, "invalid command in output stream");
  }
  if (rv < 0) error_exit(1, "could not write command to compressed output");
}

void write_commands_to_file (const char * file, const struct command * commands, unsigned count, const unsigned char * input_stream) {
  FILE * fp = file ? fopen(file, "wb") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  while (count --) write_command_to_file(fp, *(commands ++), input_stream);
  unsigned char terminator = -1;
  if (fwrite(&terminator, 1, 1, fp) != 1) error_exit(1, "could not write terminator to compressed output");
  if (file) fclose(fp);
}

void write_command_to_file (FILE * fp, struct command command, const unsigned char * input_stream) {
  if ((!command.count) || (command.count > 1024)) error_exit(2, "invalid command in output stream");
  unsigned char buf[4];
  unsigned char * pos = buf;
  int n;
  command.count --;
  if (command.count < 32)
    *(pos ++) = (command.command << 5) + command.count;
  else {
    *(pos ++) = 224 + (command.command << 2) + (command.count >> 8);
    *(pos ++) = command.count;
  }
  switch (command.command) {
    case 1: case 2:
      if ((command.value < 0) || (command.value >= (1 << (command.command << 3)))) error_exit(2, "invalid command in output stream");
      for (n = 0; n < command.command; n ++) *(pos ++) = command.value >> (n << 3);
    case 0: case 3:
      break;
    default:
      if ((command.value < -128) || (command.value > 32767)) error_exit(2, "invalid command in output stream");
      if (command.value < 0)
        *(pos ++) = command.value ^ 127;
      else {
        *(pos ++) = command.value >> 8;
        *(pos ++) = command.value;
      }
  }
  if (fwrite(buf, 1, pos - buf, fp) != (size_t)(pos - buf)) error_exit(1, "could not write command to compressed output");
  if (command.command) return;
  command.count ++;
  if (fwrite(input_stream + command.value, 1, command.count, fp) != command.count) error_exit(1, "could not write data to compressed output");
}

struct command * compress (const unsigned char * data, unsigned short * size) {
  unsigned char * bitflipped = malloc(*size);
  bit_flip(data, *size, bitflipped);
  struct command * compressed_sequences[COMPRESSION_METHODS + 1];
  unsigned short lengths[COMPRESSION_METHODS + 1];
  unsigned current;
  for (current = 0; current < COMPRESSION_METHODS; current ++) {
    lengths[current] = *size;
    compressed_sequences[current] = try_compress(data, bitflipped, lengths + current, current);
  }
  free(bitflipped);
  lengths[COMPRESSION_METHODS] = *size;
  compressed_sequences[COMPRESSION_METHODS] = store_uncompressed(lengths + COMPRESSION_METHODS);
  struct command * result = select_command_sequence(compressed_sequences, lengths, COMPRESSION_METHODS + 1, size);
  for (current = 0; current <= COMPRESSION_METHODS; current ++) free(compressed_sequences[current]);
  return result;
}

struct command * store_uncompressed (unsigned short * size) {
  unsigned short position, block, remainder = *size;
  struct command * result = NULL;
  *size = 0;
  for (position = 0; remainder; position += block, remainder -= block) {
    block = (remainder > 1024) ? 1024 : remainder;
    if ((block <= 64) && (block > 32)) block = 32;
    result = realloc(result, sizeof(struct command) * (1 + *size));
    result[(*size) ++] = (struct command) {.command = 0, .count = block, .value = position};
  }
  return result;
}

struct command * try_compress (const unsigned char * data, const unsigned char * bitflipped, unsigned short * length, unsigned flags) {
  struct command * commands = malloc(sizeof(struct command) * *length);
  memset(commands, -1, sizeof(struct command) * *length);
  struct command * current_command = commands;
  unsigned short position = 0, previous_data = 0;
  unsigned char lookahead = 0, lookahead_flag = (flags >> 3) % 3;
  struct command copy, repetition;
  while (position < *length) {
    copy = find_best_copy(data, position, *length, bitflipped, flags);
    repetition = find_best_repetition(data, position, *length);
    if (flags & 1)
      *current_command = pick_best_command(2, repetition, copy);
    else
      *current_command = pick_best_command(2, copy, repetition);
    *current_command = pick_best_command(2, (struct command) {.command = 0, .count = 1, .value = position}, *current_command);
    if (flags & 2) {
      if (previous_data && (previous_data != 32) && (previous_data != 1024) && (command_size(*current_command) == current_command -> count))
        *current_command = (struct command) {.command = 0, .count = 1, .value = position};
    }
    if (lookahead_flag) {
      if (lookahead >= lookahead_flag)
        lookahead = 0;
      else if (current_command -> command) {
        lookahead ++;
        *current_command = (struct command) {.command = 0, .count = 1, .value = position};
      }
    }
    if (current_command -> command)
      previous_data = 0;
    else
      previous_data += current_command -> count;
    position += (current_command ++) -> count;
  }
  optimize(commands, current_command - commands);
  repack(&commands, length);
  return commands;
}

struct command find_best_copy (const unsigned char * data, unsigned short position, unsigned short length, const unsigned char * bitflipped, unsigned flags) {
  struct command simple = {.command = 7};
  struct command flipped = simple, backwards = simple;
  short count, offset;
  if ((count = scan_forwards(data + position, length - position, data, position, &offset)))
    simple = (struct command) {.command = 4, .count = count, .value = offset};
  if ((count = scan_forwards(data + position, length - position, bitflipped, position, &offset)))
    flipped = (struct command) {.command = 5, .count = count, .value = offset};
  if ((count = scan_backwards(data, length - position, position, &offset)))
    backwards = (struct command) {.command = 6, .count = count, .value = offset};
  struct command command;
  switch (flags / 24) {
    case 0: command = pick_best_command(3, simple, backwards, flipped); break;
    case 1: command = pick_best_command(3, backwards, flipped, simple); break;
    case 2: command = pick_best_command(3, flipped, backwards, simple);
  }
  if ((flags & 4) && (command.count > 32)) command.count = 32;
  return command;
}

unsigned short scan_forwards (const unsigned char * target, unsigned short limit, const unsigned char * source, unsigned short real_position, short * offset) {
  unsigned short best_match, best_length = 0;
  unsigned short current_length;
  unsigned short position;
  for (position = 0; position < real_position; position ++) {
    if (source[position] != *target) continue;
    for (current_length = 0; (current_length < limit) && (source[position + current_length] == target[current_length]); current_length ++);
    if (current_length > 1024) current_length = 1024;
    if (current_length < best_length) continue;
    best_match = position;
    best_length = current_length;
  }
  if (!best_length) return 0;
  if ((best_match + 128) >= real_position)
    *offset = best_match - real_position;
  else
    *offset = best_match;
  return best_length;
}

unsigned short scan_backwards (const unsigned char * data, unsigned short limit, unsigned short real_position, short * offset) {
  if (real_position < limit) limit = real_position;
  unsigned short best_match, best_length = 0;
  unsigned short current_length;
  unsigned short position;
  for (position = 0; position < real_position; position ++) {
    if (data[position] != data[real_position]) continue;
    for (current_length = 0; (current_length <= position) && (current_length < limit) &&
                             (data[position - current_length] == data[real_position + current_length]); current_length ++);
    if (current_length > 1024) current_length = 1024;
    if (current_length < best_length) continue;
    best_match = position;
    best_length = current_length;
  }
  if (!best_length) return 0;
  if ((best_match + 128) >= real_position)
    *offset = best_match - real_position;
  else
    *offset = best_match;
  return best_length;
}

struct command find_best_repetition (const unsigned char * data, unsigned short position, unsigned short length) {
  if ((position + 1) >= length) return data[position] ? ((struct command) {.command = 7}) : ((struct command) {.command = 3, .count = 1});
  unsigned char value[2] = {data[position], data[position + 1]};
  unsigned repcount, limit = length - position;
  if (limit > 1024) limit = 1024;
  for (repcount = 2; (repcount < limit) && (data[position + repcount] == value[repcount & 1]); repcount ++);
  struct command result;
  result.count = repcount;
  if (*value != value[1]) {
    if (!*value && (repcount < 3)) return (struct command) {.command = 3, .count = 1};
    result.command = 2;
    result.value = ((unsigned) (*value)) | (((unsigned) (value[1])) << 8);
  } else if (*value) {
    result.command = 1;
    result.value = *value;
  } else
    result.command = 3;
  return result;
}

struct command pick_best_command (unsigned count, struct command command, ...) {
  struct command result = command;
  va_list ap;
  va_start(ap, command);
  while (-- count) {
    command = va_arg(ap, struct command);
    if (is_better(command, result)) result = command;
  }
  va_end(ap);
  return result;
}

int is_better (struct command new, struct command old) {
  if (new.command == 7) return 0;
  if (old.command == 7) return 1;
  short new_savings = new.count - command_size(new), old_savings = old.count - command_size(old);
  return new_savings > old_savings;
}

short command_size (struct command command) {
  short header_size = 1 + (command.count > 32);
  if (command.command & 4) return header_size + 1 + (command.value >= 0);
  return header_size + command.command[(short []) {command.count, 1, 2, 0}];
}

void optimize (struct command * commands, unsigned short count) {
  while (count && (commands -> command == 7)) commands ++, count --;
  if (count < 2) return;
  struct command * end = commands + count;
  struct command * next = commands + 1;
  while (next < end) {
    if (next -> command == 7) goto skip;
    if (
        !(commands -> command) &&
        (command_size(*next) == next -> count) &&
        ((commands -> count + next -> count) <= 1024) &&
        ((commands -> count > 32) || ((commands -> count + next -> count) <= 32))
       ) {
      commands -> count += next -> count;
      next -> command = 7;
      goto skip;
    }
    if (next -> command != commands -> command) goto accept;
    switch (commands -> command) {
      case 0:
        if ((commands -> value + commands -> count) != next -> value) break;
        commands -> count += next -> count;
        next -> command = 7;
        if (commands -> count <= 1024) goto skip;
        next -> command = 0;
        next -> value = commands -> value + 1024;
        next -> count = commands -> count - 1024;
        commands -> count = 1024;
        break;
      case 1:
        if (commands -> value != next -> value) break;
        // fall through
      case 3:
        if ((commands -> count + next -> count) <= 1024) {
          commands -> count += next -> count;
          next -> command = 7;
          goto skip;
        }
        next -> count = (commands -> count + next -> count) - 1024;
        commands -> count = 1024;
        break;
    }
    accept:
    commands = next;
    skip:
    next ++;
  }
}

void repack (struct command ** commands, unsigned short * length) {
  struct command * new_commands = malloc(sizeof(struct command) * *length);
  struct command * current = new_commands;
  unsigned short p;
  for (p = 0; p < *length; p ++) if (p[*commands].command != 7) *(current ++) = p[*commands];
  free(*commands);
  *commands = new_commands;
  *length = current - new_commands;
}

struct command * select_command_sequence (struct command ** sequences, const unsigned short * lengths, unsigned count, unsigned short * final_length) {
  unsigned short min_sequence = 0, min_length = compressed_length(*sequences, *lengths);
  unsigned short seq, len;
  for (seq = 1; seq < count; seq ++) {
    len = compressed_length(sequences[seq], lengths[seq]);
    if (len < min_length) {
      min_sequence = seq;
      min_length = len;
    }
  }
  *final_length = lengths[min_sequence];
  struct command * current = malloc(*final_length * sizeof(struct command));
  memcpy(current, sequences[min_sequence], *final_length * sizeof(struct command));
  struct command * new;
  for (seq = 1; seq < count; seq ++) {
    new = merge_command_sequences(current, *final_length, sequences[(seq + min_sequence) % count], lengths[(seq + min_sequence) % count], final_length);
    free(current);
    current = new;
  }
  return current;
}

struct command * merge_command_sequences (const struct command * current, unsigned short current_length, const struct command * new, unsigned short new_length,
                                          unsigned short * result_length) {
  struct command * result = malloc(sizeof(struct command) * (current_length + new_length));
  struct command * current_command = result;
  const struct command * saved_current;
  const struct command * saved_new;
  unsigned short current_pos, new_pos;
  while (current_length) {
    if (current -> count == new -> count) {
      *(current_command ++) = pick_best_command(2, *(current ++), *(new ++));
      current_length --;
      continue;
    }
    saved_current = current;
    saved_new = new;
    current_pos = (current ++) -> count;
    new_pos = (new ++) -> count;
    current_length --;
    while (current_pos != new_pos)
      if (current_pos < new_pos) {
        current_pos += (current ++) -> count;
        current_length --;
      } else
        new_pos += (new ++) -> count;
    current_pos = compressed_length(saved_current, current - saved_current);
    new_pos = compressed_length(saved_new, new - saved_new);
    if (new_pos < current_pos) {
      memcpy(current_command, saved_new, sizeof(struct command) * (new - saved_new));
      current_command += new - saved_new;
    } else {
      memcpy(current_command, saved_current, sizeof(struct command) * (current - saved_current));
      current_command += current - saved_current;
    }
  }
  *result_length = current_command - result;
  return result;
}

unsigned short compressed_length (const struct command * commands, unsigned short count) {
  unsigned short current, total = 0;
  for (current = 0; current < count; current ++) if (commands[current].command != 7) total += command_size(commands[current]);
  return total;
}
