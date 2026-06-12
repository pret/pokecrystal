.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c17 -Wall -Wextra -pedantic

tools := \
	gbcpal \
	gfx \
	lzcompress \
	make_patch \
	png_dimensions \
	pokemon_animation \
	pokemon_animation_graphics \
	scan_includes \
	stadium

all: $(tools)
	@:

clean:
	$(RM) $(tools)

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<
