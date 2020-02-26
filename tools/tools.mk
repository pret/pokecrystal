CC := gcc
CFLAGS := -O3 -std=c99 -Wall -Wextra -Wno-missing-field-initializers

# The directory containing the _built_ tools
# Use $(dir_source)/tools/ to locate scripts
dir_tools := ./tools

# All tools that are used during the build
tools := \
	lzcomp \
	png_dimensions \
	scan_includes \
	palette \
	pokemon_animation \
	pokemon_animation_graphics \
	gfx \
	md5
tools := $(addprefix $(dir_tools)/, $(tools))

$(dir_tools)/gfx $(dir_tools)/md5: tools/common.h

$(dir_tools)/%: tools/%.c | $$(@D)/.mkdir
	$(CC) $(CFLAGS) -o $@ $<
