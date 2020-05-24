#include "proto.h"

struct command * select_optimal_sequence (struct command ** sequences, const unsigned short * lengths, unsigned short * final_length) {
  struct command * compressor_sequences[NUM_COMPRESSORS * 2];
  unsigned short compressor_lengths[NUM_COMPRESSORS * 2];
  struct command * inverted_sequences[COMPRESSION_METHODS];
  unsigned short inverted_lengths[COMPRESSION_METHODS];
  unsigned p, current, method = 0;
  for (current = 0; current < NUM_COMPRESSORS; current ++) {
    compressor_sequences[current] = select_command_sequence(sequences + method, lengths + method, compressors[current].methods, compressor_lengths + current);
    compressor_sequences[current + NUM_COMPRESSORS] = select_command_sequence(sequences + method, lengths + method, -(int) compressors[current].methods,
                                                                              compressor_lengths + (current + NUM_COMPRESSORS));
    for (p = 0; p < compressors[current].methods; p ++) {
      inverted_sequences[method + compressors[current].methods - 1 - p] = sequences[method + p];
      inverted_lengths[method + compressors[current].methods - 1 - p] = lengths[method + p];
    }
    method += compressors[current].methods;
  }
  unsigned short final_lengths[8];
  struct command * final_sequences[8] = {
    select_command_sequence(compressor_sequences, compressor_lengths, NUM_COMPRESSORS, final_lengths),
    select_command_sequence(compressor_sequences, compressor_lengths, -NUM_COMPRESSORS, final_lengths + 1),
    select_command_sequence(compressor_sequences + NUM_COMPRESSORS, compressor_lengths + NUM_COMPRESSORS, NUM_COMPRESSORS, final_lengths + 2),
    select_command_sequence(compressor_sequences + NUM_COMPRESSORS, compressor_lengths + NUM_COMPRESSORS, -NUM_COMPRESSORS, final_lengths + 3),
    select_command_sequence(sequences, lengths, COMPRESSION_METHODS, final_lengths + 4),
    select_command_sequence(sequences, lengths, -COMPRESSION_METHODS, final_lengths + 5),
    select_command_sequence(inverted_sequences, inverted_lengths, COMPRESSION_METHODS, final_lengths + 6),
    select_command_sequence(inverted_sequences, inverted_lengths, -COMPRESSION_METHODS, final_lengths + 7)
  };
  for (current = 0; current < (2 * NUM_COMPRESSORS); current ++) free(compressor_sequences[current]);
  struct command * result = select_command_sequence(final_sequences, final_lengths, 8, final_length);
  for (current = 0; current < 8; current ++) free(final_sequences[current]);
  return result;
}

struct command * select_command_sequence (struct command ** sequences, const unsigned short * lengths, int count, unsigned short * final_length) {
  // negative count indicates iterating backwards
  unsigned short min_sequence = 0, min_length = compressed_length(*sequences, *lengths);
  unsigned short seq, len;
  int backwards = 0;
  if (count < 0) {
    backwards = 1;
    count = -count;
  }
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
    if (backwards) seq = count - seq;
    new = merge_command_sequences(current, *final_length, sequences[(seq + min_sequence) % count], lengths[(seq + min_sequence) % count], final_length);
    if (backwards) seq = count - seq; // restore the value for the loop
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
