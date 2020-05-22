#include "proto.h"

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
        ((commands -> count + next -> count) <= MAX_COMMAND_COUNT) &&
        ((commands -> count > SHORT_COMMAND_COUNT) || ((commands -> count + next -> count) <= SHORT_COMMAND_COUNT))
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
        if (commands -> count <= MAX_COMMAND_COUNT) goto skip;
        next -> command = 0;
        next -> value = commands -> value + MAX_COMMAND_COUNT;
        next -> count = commands -> count - MAX_COMMAND_COUNT;
        commands -> count = MAX_COMMAND_COUNT;
        break;
      case 1:
        if (commands -> value != next -> value) break;
      case 3:
        if ((commands -> count + next -> count) <= MAX_COMMAND_COUNT) {
          commands -> count += next -> count;
          next -> command = 7;
          goto skip;
        }
        next -> count = (commands -> count + next -> count) - MAX_COMMAND_COUNT;
        commands -> count = MAX_COMMAND_COUNT;
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
