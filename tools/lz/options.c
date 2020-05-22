#include "proto.h"

struct options get_options (int argc, char ** argv) {
  struct options result = {.input = NULL, .output = NULL, .mode = 0, .alignment = 0, .method = COMPRESSION_METHODS};
  const char * program_name = *argv;
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
    else if (!(strcmp(*argv, "--optimize") && strcmp(*argv, "-o")))
      result.method = COMPRESSION_METHODS;
    else if (!(strcmp(*argv, "--help") && strcmp(*argv, "-?")))
      usage(program_name);
    else
      error_exit(3, "unknown option: %s", *argv);
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
  // alp: argument list pointer (i.e., address of the current value of argv after indexing)
  // will point at the last consumed argument on exit (since the caller will probably increment it once more)
  const char * option;
  const char * value;
  char option_buffer[] = "-?";
  if (1[**alp] == '-') {
    option = *((*alp) ++);
    value = **alp;
  } else {
    option_buffer[1] = 1[**alp];
    option = option_buffer;
    value = **alp + 2;
  }
  if (!(value && *value)) error_exit(3, "option %s requires an argument", option);
  char * error;
  unsigned long result = strtoul(value, &error, 10);
  if (*error) error_exit(3, "invalid argument to option %s", option);
  if (result > limit) error_exit(3, "argument to option %s must be between 0 and %u", option, limit);
  return result;
}

void usage (const char * program_name) {
  fprintf(stderr, "Usage: %s [<options>] [<source file> [<output>]]\n\n", program_name);
  fputs("Execution mode:\n", stderr);
  fputs("    -b, --binary      Output the command stream as binary data (default).\n", stderr);
  fputs("    -t, --text        Output the command stream as text.\n", stderr);
  fputs("    -u, --uncompress  Process a compressed file and output the original data.\n", stderr);
  fputs("    -d, --dump        Process a compressed file and dump the command stream as\n", stderr);
  fputs("                      text (as if compressed with the --text option).\n", stderr);
  fputs("    -?, --help        Print this help text and exit.\n", stderr);
  fputs("Compression options:\n", stderr);
  fputs("    -o, --optimize                 Use the best combination of compression\n", stderr);
  fputs("                                   methods available (default).\n", stderr);
  fputs("    -m<number>, --method <number>  Use only one specific compression method.\n", stderr);
  fprintf(stderr, "                                   Valid method numbers are between 0 and %u.\n", COMPRESSION_METHODS - 1);
  fputs("    -a<number>, --align <number>   Pad the compressed output with zeros until\n", stderr);
  fputs("                                   the size has the specified number of low bits\n", stderr);
  fputs("                                   cleared (default: 0).\n", stderr);
  fputs("The source and output filenames can be given as - (or omitted) to use standard\n", stderr);
  fputs("input and output. Use -- to indicate that subsequent arguments are file names,\n", stderr);
  fputs("not options.\n", stderr);
  exit(3);
}
