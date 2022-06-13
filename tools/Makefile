.PHONY: all clean

CC := gcc
CFLAGS := -O3 -flto -std=c11 -Wall -Wextra -pedantic

tools := \
	bpp2png \
	lzcomp \
	gfx \
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

gfx: common.h
png_dimensions: common.h
pokemon_animation: common.h
pokemon_animation_graphics: common.h
scan_includes: common.h
stadium: common.h

bpp2png: bpp2png.c lodepng/lodepng.c common.h lodepng/lodepng.h
	$(CC) $(CFLAGS) -o $@ bpp2png.c lodepng/lodepng.c

lzcomp: CFLAGS += -Wno-strict-overflow -Wno-sign-compare
lzcomp: $(wildcard lz/*.c) $(wildcard lz/*.h)
	$(CC) $(CFLAGS) -o $@ lz/*.c

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
