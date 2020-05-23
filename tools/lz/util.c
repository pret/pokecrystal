#include "proto.h"

noreturn error_exit (int error_code, const char * error, ...) {
  va_list ap;
  va_start(ap, error);
  fputs("error: ", stderr);
  vfprintf(stderr, error, ap);
  va_end(ap);
  fputc('\n', stderr);
  exit(error_code);
}

unsigned char * read_file_into_buffer (const char * file, unsigned short * size) {
  FILE * fp = file ? fopen(file, "rb") : stdin;
  if (!fp) error_exit(1, "could not open file %s for reading", file);
  unsigned char * buf = malloc(MAX_FILE_SIZE + 1);
  int rv = fread(buf, 1, MAX_FILE_SIZE + 1, fp);
  if (file) fclose(fp);
  if (rv < 0) error_exit(1, "could not read from file %s", file);
  if (rv > MAX_FILE_SIZE) error_exit(1, "file %s is too big", file ? file : "<standard input>");
  *size = rv;
  return buf;
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
  short header_size = 1 + (command.count > SHORT_COMMAND_COUNT);
  if (command.command & 4) return header_size + 1 + (command.value >= 0);
  return header_size + command.command[(short []) {command.count, 1, 2, 0}];
}

unsigned short compressed_length (const struct command * commands, unsigned short count) {
  unsigned short current, total = 0;
  for (current = 0; current < count; current ++) if (commands[current].command != 7) total += command_size(commands[current]);
  return total;
}
