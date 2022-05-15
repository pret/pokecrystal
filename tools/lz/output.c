#include "proto.h"

void write_commands_to_textfile (const char * file, const struct command * commands, unsigned count, const unsigned char * input_stream,
                                 unsigned char alignment) {
  FILE * fp = file ? fopen(file, "w") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  unsigned length = 0;
  while (count --) {
    write_command_to_textfile(fp, *commands, input_stream);
    length += command_size(*(commands ++));
  }
  if (fputs("\tlzend\n", fp) < 0) error_exit(1, "could not write terminator to compressed output");
  length = ~length & ((1 << alignment) - 1);
  if (length --) {
    int rv = fputs("\tdb 0", fp);
    while ((rv >= 0) && length --) rv = fputs(", 0", fp);
    if (rv >= 0) rv = -(putc('\n', fp) == EOF);
    if (rv < 0) error_exit(1, "could not write padding to compressed output");
  }
  if (file) fclose(fp);
}

void write_commands_and_padding_to_textfile (const char * file, const struct command * commands, unsigned count, const unsigned char * input_stream,
                                             unsigned padding_offset, unsigned padding_size) {
  FILE * fp = file ? fopen(file, "w") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  while (count --) write_command_to_textfile(fp, *(commands ++), input_stream);
  if (fputs("\tlzend\n", fp) < 0) error_exit(1, "could not write terminator to compressed output");
  if (padding_size) {
    input_stream += padding_offset;
    int rv = 0;
    unsigned pos;
    const char * prefix = "\tdb";
    for (pos = 0; (rv >= 0) && (pos < padding_size); pos ++) {
      if (input_stream[pos])
        rv = fprintf(fp, "%s $%02hhx", prefix, input_stream[pos]);
      else
        rv = fprintf(fp, "%s 0", prefix);
      prefix = ",";
    }
    if (rv >= 0) rv = -(putc('\n', fp) == EOF);
    if (rv < 0) error_exit(1, "could not write padding to compressed output");
  }
  if (file) fclose(fp);
}

void write_command_to_textfile (FILE * fp, struct command command, const unsigned char * input_stream) {
  if ((!command.count) || (command.count > MAX_COMMAND_COUNT)) error_exit(2, "invalid command in output stream");
  int rv, pos;
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
      if ((command.value < -LOOKBACK_LIMIT) || (command.value >= MAX_FILE_SIZE)) error_exit(2, "invalid command in output stream");
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

void write_commands_to_file (const char * file, const struct command * commands, unsigned count, const unsigned char * input_stream, unsigned char alignment) {
  FILE * fp = file ? fopen(file, "wb") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  unsigned length = 0;
  while (count --) {
    write_command_to_file(fp, *commands, input_stream);
    length += command_size(*(commands ++));
  }
  if (putc(-1, fp) == EOF) error_exit(1, "could not write terminator to compressed output");
  length = ~length & ((1 << alignment) - 1);
  while (length --) if (putc(0, fp) == EOF) error_exit(1, "could not write padding to compressed output");
  if (file) fclose(fp);
}

void write_command_to_file (FILE * fp, struct command command, const unsigned char * input_stream) {
  if ((!command.count) || (command.count > MAX_COMMAND_COUNT)) error_exit(2, "invalid command in output stream");
  unsigned char buf[4];
  unsigned char * pos = buf;
  int n;
  command.count --;
  if (command.count < SHORT_COMMAND_COUNT)
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
      if ((command.value < -LOOKBACK_LIMIT) || (command.value >= MAX_FILE_SIZE)) error_exit(2, "invalid command in output stream");
      if (command.value < 0)
        *(pos ++) = command.value ^ 127;
      else {
        *(pos ++) = command.value >> 8;
        *(pos ++) = command.value;
      }
  }
  if (fwrite(buf, 1, pos - buf, fp) != (pos - buf)) error_exit(1, "could not write command to compressed output");
  if (command.command) return;
  command.count ++;
  if (fwrite(input_stream + command.value, 1, command.count, fp) != command.count) error_exit(1, "could not write data to compressed output");
}

void write_raw_data_to_file (const char * file, const void * data, unsigned length) {
  FILE * fp = file ? fopen(file, "w") : stdout;
  if (!fp) error_exit(1, "could not open file %s for writing", file);
  while (length) {
    unsigned rv = fwrite(data, 1, length, fp);
    if (!rv) error_exit(1, "could not write raw data to output");
    data = (const char *) data + rv;
    length -= rv;
  }
  if (file) fclose(fp);
}
