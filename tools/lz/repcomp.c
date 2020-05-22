#include "proto.h"

/*
   Repetitions compressor: compresses the data only using a subset of the available repetition commands.
   Methods defined: 6
   Flags values: the value plus one is taken as a bitfield indicating which kinds of repetition commands are used
                 (lowest bit to highest: repeat single byte (1), repeat two bytes (2), repeat zeros (3)).
*/

struct command * try_compress_repetitions (const unsigned char * data, __attribute__((unused)) const unsigned char * bitflipped, unsigned short * size, unsigned flags) {
  unsigned short pos = 0, skipped = 0;
  struct command * result = malloc(*size * sizeof(struct command));
  struct command * current = result;
  struct command candidate;
  flags = (flags + 1) << 1;
  while (pos < *size) {
    candidate = find_repetition_at_position(data, pos, *size);
    if ((candidate.command == 3) && !(flags & 8)) {
      candidate.command = 1;
      candidate.value = 0;
    }
    if ((candidate.command == 1) && !(flags & 2)) {
      candidate.command = 2;
      candidate.value |= candidate.value << 8;
    }
    if ((flags & (1 << candidate.command)) && (command_size(candidate) <= candidate.count)) {
      if (skipped) *(current ++) = (struct command) {.command = 0, .count = skipped, .value = pos - skipped};
      skipped = 0;
      *(current ++) = candidate;
      pos += candidate.count;
    } else {
      pos ++;
      if ((++ skipped) == MAX_COMMAND_COUNT) {
        *(current ++) = (struct command) {.command = 0, .count = MAX_COMMAND_COUNT, .value = pos - MAX_COMMAND_COUNT};
        skipped = 0;
      }
    }
  }
  if (skipped) *(current ++) = (struct command) {.command = 0, .count = skipped, .value = pos - skipped};
  *size = current - result;
  result = realloc(result, *size * sizeof(struct command));
  return result;
}

struct command find_repetition_at_position (const unsigned char * data, unsigned short position, unsigned short length) {
  if ((position + 1) >= length) return data[position] ? ((struct command) {.command = 7}) : ((struct command) {.command = 3, .count = 1});
  unsigned char value[2] = {data[position], data[position + 1]};
  unsigned repcount, limit = length - position;
  if (limit > MAX_COMMAND_COUNT) limit = MAX_COMMAND_COUNT;
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
