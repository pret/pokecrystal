#include "proto.h"

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
