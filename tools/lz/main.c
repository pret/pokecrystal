#include "proto.h"

int main (int argc, char ** argv) {
  struct options options = get_options(argc, argv);
  unsigned short size;
  unsigned char * file_buffer = read_file_into_buffer(options.input, &size);
  struct command * commands;
  if (options.mode & 2) {
    unsigned short original_size = size, remainder;
    commands = get_commands_from_file(file_buffer, &size, &remainder);
    if (!commands) error_exit(1, "invalid command stream");
    if (options.mode == 2) {
      unsigned char * uncompressed = get_uncompressed_data(commands, file_buffer, &size);
      if (!uncompressed) error_exit(1, "output data is too large");
      write_raw_data_to_file(options.output, uncompressed, size);
      free(uncompressed);
    } else
      write_commands_and_padding_to_textfile(options.output, commands, size, file_buffer, original_size - remainder, remainder);
  } else {
    commands = compress(file_buffer, &size, options.method);
    (options.mode ? write_commands_to_textfile : write_commands_to_file)(options.output, commands, size, file_buffer, options.alignment);
  }
  free(file_buffer);
  free(commands);
  return 0;
}

struct command * compress (const unsigned char * data, unsigned short * size, unsigned method) {
  unsigned char * bitflipped = malloc(*size);
  unsigned current;
  for (current = 0; current < *size; current ++) bitflipped[current] = bit_flipping_table[data[current]];
  const struct compressor * compressor = compressors;
  struct command * result;
  if (method < COMPRESSION_METHODS) {
    while (method >= compressor -> methods) method -= (compressor ++) -> methods;
    result = compressor -> function(data, bitflipped, size, method);
  } else {
    struct command * compressed_sequences[COMPRESSION_METHODS];
    unsigned short lengths[COMPRESSION_METHODS];
    unsigned flags = 0;
    for (current = 0; current < COMPRESSION_METHODS; current ++) {
      lengths[current] = *size;
      if (flags == compressor -> methods) {
        flags = 0;
        compressor ++;
      }
      compressed_sequences[current] = compressor -> function(data, bitflipped, lengths + current, flags ++);
    }
    result = select_optimal_sequence(compressed_sequences, lengths, size);
    for (current = 0; current < COMPRESSION_METHODS; current ++) free(compressed_sequences[current]);
  }
  free(bitflipped);
  return result;
}
