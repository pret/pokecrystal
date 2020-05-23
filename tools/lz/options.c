#include "proto.h"

struct options get_options (int argc, char ** argv) {
  struct options result = {.input = NULL, .output = NULL, .mode = 0, .alignment = 0, .method = COMPRESSION_METHODS};
  const char * program_name = *argv;
  int compressor = -1;
  if (argc == 1) usage(program_name);
  for (argv ++; *argv; argv ++) {
    if (**argv != '-') break;
    if (!1[*argv]) break;
    if (!strcmp(*argv, "--")) {
      argv ++;
      break;
    } else if (!(strcmp(*argv, "--text") && strcmp(*argv, "-t")))
      result.mode = 1;
    else if (!(strcmp(*argv, "--binary") && strcmp(*argv, "-b")))
      result.mode = 0;
    else if (!(strcmp(*argv, "--uncompress") && strcmp(*argv, "-u")))
      result.mode = 2;
    else if (!(strcmp(*argv, "--dump") && strcmp(*argv, "-d")))
      result.mode = 3;
    else if (!(strcmp(*argv, "--align") && strncmp(*argv, "-a", 2)))
      result.alignment = parse_numeric_option_argument(&argv, 12);
    else if (!(strcmp(*argv, "--method") && strncmp(*argv, "-m", 2)))
      result.method = parse_numeric_option_argument(&argv, COMPRESSION_METHODS - 1);
    else if (!(strcmp(*argv, "--compressor") && strncmp(*argv, "-c", 2)))
      compressor = parse_compressor_option_argument(&argv);
    else if (!(strcmp(*argv, "--optimize") && strcmp(*argv, "-o"))) {
      result.method = COMPRESSION_METHODS;
      compressor = -1;
    } else if (!(strcmp(*argv, "--help") && strcmp(*argv, "-?")))
      usage(program_name);
    else if (!(strcmp(*argv, "--list") && strcmp(*argv, "-l")))
      list_compressors();
    else
      error_exit(3, "unknown option: %s", *argv);
  }
  if (compressor >= 0) {
    if (result.method >= COMPRESSION_METHODS) result.method = 0;
    if (result.method >= compressors[compressor].methods)
      error_exit(3, "method for the %s compressor must be between 0 and %u", compressors[compressor].name, compressors[compressor].methods - 1);
    while (compressor > 0) result.method += compressors[-- compressor].methods;
  }
  if (*argv) {
    if (strcmp(*argv, "-")) result.input = *argv;
    if (*(++ argv)) {
      if (argv[1]) error_exit(3, "too many command-line arguments");
      if (strcmp(*argv, "-")) result.output = *argv;
    }
  }
  return result;
}

unsigned parse_numeric_option_argument (char *** alp, unsigned limit) {
  const char * option;
  const char * value = get_argument_for_option(alp, &option);
  char * error;
  unsigned long result = strtoul(value, &error, 10);
  if (*error) error_exit(3, "invalid argument to option %s", option);
  if (result > limit) error_exit(3, "argument to option %s must be between 0 and %u", option, limit);
  return result;
}

int parse_compressor_option_argument (char *** alp) {
  const char * name = get_argument_for_option(alp, NULL);
  if (!strcmp(name, "*")) return -1;
  int result = -1;
  unsigned length = strlen(name);
  const struct compressor * compressor;
  for (compressor = compressors; compressor -> name; compressor ++) {
    if (strncmp(name, compressor -> name, length)) continue;
    if (result >= 0) error_exit(3, "ambiguous compressor prefix: %s", name);
    result = compressor - compressors;
  }
  if (result < 0) error_exit(3, "unknown compressor: %s", name);
  return result;
}

const char * get_argument_for_option (char *** alp, const char ** option_name) {
  // alp: argument list pointer (i.e., address of the current value of argv after indexing)
  // will point at the last consumed argument on exit (since the caller will probably increment it once more)
  const char * option;
  const char * result;
  if (1[**alp] == '-') {
    option = *((*alp) ++);
    result = **alp;
  } else {
    option_name_buffer[1] = 1[**alp];
    option = option_name_buffer;
    result = **alp + 2;
  }
  if (!(result && *result)) error_exit(3, "option %s requires an argument", option);
  if (option_name) *option_name = option;
  return result;
}

noreturn usage (const char * program_name) {
  fprintf(stderr, "Usage: %s [<options>] [<source file> [<output>]]\n\n", program_name);
  fputs("Execution mode:\n", stderr);
  fputs("    -b, --binary      Output the command stream as binary data (default).\n", stderr);
  fputs("    -t, --text        Output the command stream as text.\n", stderr);
  fputs("    -u, --uncompress  Process a compressed file and output the original data.\n", stderr);
  fputs("    -d, --dump        Process a compressed file and dump the command stream as\n", stderr);
  fputs("                      text (as if compressed with the --text option).\n", stderr);
  fputs("    -l, --list        List compressors and their method numbers.\n", stderr);
  fputs("    -?, --help        Print this help text and exit.\n", stderr);
  fputs("Compression options:\n", stderr);
  fputs("    -o, --optimize                 Use the best combination of compression\n", stderr);
  fputs("                                   methods available (default).\n", stderr);
  fputs("    -m<number>, --method <number>  Use only one specific compression method.\n", stderr);
  fprintf(stderr, "                                   Valid method numbers are between 0 and %u.\n", COMPRESSION_METHODS - 1);
  fputs("    -c<name>, --compressor <name>  Use the specified compressor: the method\n", stderr);
  fputs("                                   number will be relative to that compressor.\n", stderr);
  fputs("                                   Any prefix of the compressor name may be\n", stderr);
  fputs("                                   specified. Use * to indicate any compressor.\n", stderr);
  fputs("    -a<number>, --align <number>   Pad the compressed output with zeros until\n", stderr);
  fputs("                                   the size has the specified number of low bits\n", stderr);
  fputs("                                   cleared (default: 0).\n", stderr);
  fputs("The source and output filenames can be given as - (or omitted) to use standard\n", stderr);
  fputs("input and output. Use -- to indicate that subsequent arguments are file names.\n", stderr);
  exit(3);
}

noreturn list_compressors (void) {
  const struct compressor * compressor;
  unsigned current, length = 10;
  for (compressor = compressors; compressor -> name; compressor ++) if ((current = strlen(compressor -> name)) > length) length = current;
  fprintf(stderr, "%-*s  Offset  Methods\n", length, "Compressor");
  for (current = 0; current < length; current ++) putc('-', stderr);
  fputs("  ------  -------\n", stderr);
  current = 0;
  for (compressor = compressors; compressor -> name; compressor ++) {
    fprintf(stderr, "%-*s  %6u  %7u\n", length, compressor -> name, current, compressor -> methods);
    current += compressor -> methods;
  }
  putc('\n', stderr);
  fputs("Note: the offset indicates the compressor's lowest method number when the\n", stderr);
  fputs("--compressor option is not given. When that option is used, every compressor's\n", stderr);
  fputs("methods are numbered from zero.\n", stderr);
  exit(3);
}
