# Name of the ROM
name = poke$(version)

# Default version of the game to build
version := crystal

# All of the available versions
versions := crystal crystal11 crystal-au


# Variables used to locate the sources
# This dir_source allows you to use `make -f path/to/Makefile` in any directory.
dir_source := $(patsubst %/,%,$(dir $(word 1,$(MAKEFILE_LIST))))
dir_version := $(dir_source)/version/$(version)

ifeq ($(dir_source),.)

# If we're in the top-level directory, this makefile fragment will be used.
# This is where we implement common facilities for the programmer,
#   or simply create and jump into the build directory.
# The real build rules are below, after the else statement.

.SUFFIXES:

ifeq ($(shell which sha1sum),)
SHA1 := shasum
else
SHA1 := sha1sum
endif

dir_source := ../..
dir_build := build
dirs_versions := $(foreach version,$(versions),$(dir_build)/$(version))

# Allow setting ROM destination from the environment
POKECRYSTAL_OUTPUT ?= .
dir_output := $(POKECRYSTAL_OUTPUT)

.PHONY: all
all: $(version)

.PHONY: compare
compare: $(versions)
	@$(SHA1) -c roms.sha1

.PHONY: clean
clean:
	rm -rf $(dir_build)
	rm -f $(foreach version,$(versions),"$(dir_output)/$(name).gbc" "$(dir_output)/$(name).sym" "$(dir_output)/$(name).map")
	rm -f $(tools)

# `tidy` will be passed through MAKECMDGOALS
.PHONY: tidy
tidy: $(dirs_versions)
	rm -f $(foreach version,$(versions),"$(dir_output)/$(name).gbc" "$(dir_output)/$(name).sym" "$(dir_output)/$(name).map")

# Create the build directory and run make inside of it.
.PHONY: $(dirs_versions)
$(dirs_versions): $(dir_build)/%: tools
	+@mkdir -p $@
	+@$(MAKE) --no-print-directory -C $@ -f $(dir_source)/Makefile version=$* \
	          dir_source=$(dir_source) dir_tools=$(dir_source)/tools \
	          $(MAKECMDGOALS)

# It's rather important that the tools are available and up-to-date before
#   possibly multiple parallel builds of different versions start.
include tools/tools.mk
.PHONY: tools
tools: $(tools)

# Allow for `make <version>`
define defver
.PHONY: $(version)
$(version): MAKECMDGOALS :=
$(version): $(dir_build)/$(version)
ifneq ($(dir_output),.)
	@mkdir -p "$(dir_output)"
endif
	@cp $(dir_build)/$(version)/$(name).gbc "$(dir_output)/$(name).gbc"
	@cp $(dir_build)/$(version)/$(name).sym "$(dir_output)/$(name).sym"
	@cp $(dir_build)/$(version)/$(name).map "$(dir_output)/$(name).map"
endef
$(foreach version,$(versions),$(eval $(call defver)))

# Allow for `make version=<version> <path/to/file.o>`
%: $(dir_build)/$(version) ; @:

# We don't need to update any makefiles or create any directories here.
Makefile: ;
%.mk:: ;
%/.mkdir:: ;

else

# If we're in a directory other than the source code,
#   this makefile fragment will be used.
# Here, all the build rules for the different files are defined, and the final
#   output files will be stored in $(dir_output).
# The general utility rules are above, before the else statement.

.SUFFIXES:
.SECONDARY:
.SECONDEXPANSION:

VPATH := $(dir_version):$(dir_source)

# Find all files matching pattern $2 in directory $1
rwildcard = $(foreach d,$(wildcard $1*),$(filter $(subst *,%,$2),$d) $(call rwildcard,$d/,$2))

# Find all objects in source dir $1, inside subdirectories $2 and files $3 if they exist
getobjects = $(patsubst $1/%.asm,%.o,$(foreach d,$2,$(call rwildcard,$1/$d/,*.asm)) $(foreach f,$3,$(wildcard $1/$f)))


### Build tools

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Variables

# Look for object files
dirs := audio data engine gfx home lib maps mobile ram
files :=

objects := $(call getobjects,$(dir_source),$(dirs),$(files))
# Scan the version/ subdir if it exists
ifneq ($(wildcard $(dir_version)),)
objects := $(sort $(objects) $(call getobjects,$(dir_version),$(dirs),$(files)))
endif
deps := $(objects:.o=.d)

# Build flags
RGBASMFLAGS := -L
RGBFIXFLAGS := -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL

include $(dir_source)/version/$(version).mk


### Build targets

.PHONY: all
all: $(name).gbc

.PHONY: tidy
tidy:
	rm -f $(foreach f,gbc sym map,$(name).$f)
	@rm -f $(objects) $(deps)

$(name).gbc: layout.link $(objects)
	@echo $(RGBLINK) -n $(@:.gbc=.sym) -m $(@:.gbc=.map) -l $< -o $@
	@$(RGBLINK) -n $(@:.gbc=.sym) -m $(@:.gbc=.map) -l $< -o $@ $(filter-out $<, $^)
	$(RGBFIX) $(RGBFIXFLAGS) $@
	@$(dir_source)/tools/sort_symfile.sh $(@:.gbc=.sym)

%.o: %.asm | $$(@D)/.mkdir
	$(RGBASM) -i $(dir_version)/ -i $(dir_source)/ $(RGBASMFLAGS) -o $@ $<

include $(dir_source)/tools/tools.mk
include $(dir_source)/gfx/gfx.mk


### Dependency generation

%.d: %.asm $(dir_tools)/scan_includes | $$(@D)/.mkdir
	@printf '%s: ' $*.o > $@
	@$(dir_tools)/scan_includes -i $(dir_version)/ -i $(dir_source)/ $< >> $@

ifeq ($(filter tidy,$(MAKECMDGOALS)),)
-include $(deps)
endif


### Compression

# For files that the compressor can't match, there will be a .lz file
#   suffixed with the md5 hash of the correct uncompressed file.
# If the hash of the uncompressed file matches, use this .lz instead.
# This allows pngs to be used for compressed graphics and still match.

hash = $(shell $(dir_tools)/md5 $< | cut -c 1-8)
%.lz: % $(dir_tools)/md5 $(dir_tools)/lzcomp
	$(eval filename := $(dir_source)/$*.lz.$(hash))
	$(if $(wildcard $(filename)),\
		cp $(filename) $@,\
		$(dir_tools)/lzcomp -- $< $@)


### Directory creation

# Since we use VPATH, just using the path of the directory will cause it to be
#   found in the VPATH, and the directory never being created where we need it.
# That's why instead of just creating a directory, we also create a file simply
#   called ".mkdir", which is hopefully never used in any source directory.
.mkdir: ;
%/.mkdir::
	@mkdir -p $(@D)
	@touch $@

endif
