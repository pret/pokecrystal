CC := gcc
CFLAGS := -O3 -march=native -std=c99 -Wall -Wextra -Wno-missing-field-initializers

# All tools that are used during the build
tools := \
	lzcomp \
	png_dimensions \
	scan_includes \
	pokemon_animation \
	pokemon_animation_graphics \
	gfx \
	md5
tools := $(addprefix $(dir_output)/tools/, $(tools))

$(dir_output)/tools/gfx $(dir_output)/tools/md5: tools/common.h

$(dir_output)/tools/%: tools/%.c | $$(@D)/-
	$(CC) $(CFLAGS) -o $@ $<
