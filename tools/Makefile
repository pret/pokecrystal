.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c11 -Wall -Wextra -pedantic -Wno-missing-field-initializers \
          -Walloc-zero \
          -Wcast-align \
          -Wcast-qual \
          -Wduplicated-branches \
          -Wduplicated-cond \
          -Wfloat-equal \
          -Wformat=2 \
          -Wformat-overflow=2 \
          -Wformat-truncation=1 \
          -Winline \
          -Wlogical-op \
          -Wnested-externs \
          -Wno-sign-compare \
          -Wnull-dereference \
          -Wold-style-definition \
          -Wshadow \
          -Wshift-overflow=2 \
          -Wstrict-overflow=2 \
          -Wstrict-prototypes \
          -Wstringop-overflow=4 \
          -Wundef \
          -Wuninitialized \
          -Wunused \
          -Wwrite-strings \
          -g3 -ggdb3

tools := \
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
