.PHONY: all

all: \
	lzcomp \
	png_dimensions \
	scan_includes \
	palette \
	pokemon_animation \
	pokemon_animation_graphics \
	gfx
	@:

%: %.c
	$(CC) -o $@ $<
