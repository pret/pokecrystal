.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c11 -Wall -Wextra -pedantic -Wno-missing-field-initializers

tools := \
	lzcomp \
	gfx \
	png_dimensions \
	pokemon_animation \
	pokemon_animation_graphics \
	scan_includes \
	stadium
all: $(tools)
	@:

clean:
	rm -f $(tools)

gfx: common.h
png_dimensions: common.h
pokemon_animation: common.h
pokemon_animation_graphics: common.h
scan_includes: common.h
stadium: common.h

lzcomp: CFLAGS = -O3 -flto -std=c11 -Wall -Wextra -pedantic -Wno-strict-overflow -Wno-sign-compare
lzcomp: $(wildcard lz/*.c) $(wildcard lz/*.h)
	$(CC) $(CFLAGS) -o $@ lz/*.c

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
