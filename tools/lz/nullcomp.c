#include "proto.h"

/*
   Null compressor: stores data uncompressed, using literal (0) commands only.
   Methods defined: 2
   Flags values: 0 = split a trailing 33-to-64-byte block at the end into two short blocks; 1 = don't
*/

struct command * store_uncompressed (__attribute__((unused)) const unsigned char * data, __attribute__((unused)) const unsigned char * bitflipped, unsigned short * size, unsigned flags) {
  unsigned short position, block, remainder = *size;
  struct command * result = NULL;
  *size = 0;
  for (position = 0; remainder; position += block, remainder -= block) {
    block = (remainder > MAX_COMMAND_COUNT) ? MAX_COMMAND_COUNT : remainder;
    if (!(flags & 1) && (block <= (2 * SHORT_COMMAND_COUNT)) && (block > SHORT_COMMAND_COUNT)) block = SHORT_COMMAND_COUNT;
    result = realloc(result, sizeof(struct command) * (1 + *size));
    result[(*size) ++] = (struct command) {.command = 0, .count = block, .value = position};
  }
  return result;
}
