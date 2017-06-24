.PHONY: all

CFLAGS := -std=c99

all: \
	lzcomp \
	png_dimensions \
	scan_includes \
	palette \
	pokemon_animation \
	pokemon_animation_graphics \
	gfx \
	md5
	@:

%: %.c
	$(CC) $(CFLAGS) -o $@ $<
