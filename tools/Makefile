.PHONY: all clean

tools := \
	lzcomp \
	png_dimensions \
	scan_includes \
	palette \
	pokemon_animation \
	pokemon_animation_graphics

all: $(tools)
	@:

clean:
	rm -f $(tools)

%: %.c
	$(CC) -o $@ $<
