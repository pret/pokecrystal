### Catch-all graphics rules

%.2bpp: %.png $(dir_output)/tools/gfx | $$(@D)/.mkdir
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		$(dir_output)/tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png $(dir_output)/tools/gfx | $$(@D)/.mkdir
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		$(dir_output)/tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png | $$(@D)/.mkdir
	$(RGBGFX) -p $@ $<

%.dimensions: %.png $(dir_output)/tools/png_dimensions | $$(@D)/.mkdir
	$(dir_output)/tools/png_dimensions $< $@


### Pokemon pic animation rules

gfx/pokemon/%/front.animated.2bpp: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions $(dir_output)/tools/pokemon_animation_graphics | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation_graphics -o $@ $(word 1,$^) $(word 2,$^)
gfx/pokemon/%/front.animated.tilemap: gfx/pokemon/%/front.2bpp gfx/pokemon/%/front.dimensions $(dir_output)/tools/pokemon_animation_graphics | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation_graphics -t $@ $(word 1,$^) $(word 2,$^)
gfx/pokemon/%/bitmask.inc: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions $(dir_output)/tools/pokemon_animation | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation -b $(word 1,$^) $(word 2,$^) > $@
gfx/pokemon/%/frames.inc: gfx/pokemon/%/front.animated.tilemap gfx/pokemon/%/front.dimensions $(dir_output)/tools/pokemon_animation | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation -f $(word 1,$^) $(word 2,$^) > $@

ifneq ($(filter 3.%,$(MAKE_VERSION)),)
include $(dir_source)/gfx/make-3.x-hack.mk
endif


### Terrible hacks to match animations. Delete these rules if you don't care about matching.

# Dewgong has an unused tile id in its last frame. The tile itself is missing.
gfx/pokemon/dewgong/frames.inc: gfx/pokemon/dewgong/front.animated.tilemap gfx/pokemon/dewgong/front.dimensions $(dir_output)/tools/pokemon_animation | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation -f $(word 1,$^) $(word 2,$^) > $@
	echo "	db \$$4d" >> $@

# Lugia has two unused tile ids in its last frame. The tiles themselves are missing.
gfx/pokemon/lugia/frames.inc: gfx/pokemon/lugia/front.animated.tilemap gfx/pokemon/lugia/front.dimensions $(dir_output)/tools/pokemon_animation | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation -f $(word 1,$^) $(word 2,$^) > $@
	echo "	db \$$5e, \$$59" >> $@

# Girafarig has a redundant tile after the end. It is used in two frames, so it must be injected into the generated graphics.
# This is more involved, so it's hacked into pokemon_animation_graphics.
gfx/pokemon/girafarig/front.animated.2bpp: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions $(dir_output)/tools/pokemon_animation_graphics | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation_graphics --girafarig -o $@ $(word 1,$^) $(word 2,$^)
gfx/pokemon/girafarig/front.animated.tilemap: gfx/pokemon/girafarig/front.2bpp gfx/pokemon/girafarig/front.dimensions $(dir_output)/tools/pokemon_animation_graphics | $$(@D)/.mkdir
	$(dir_output)/tools/pokemon_animation_graphics --girafarig -t $@ $(word 1,$^) $(word 2,$^)


### Misc file-specific graphics rules

gfx/pokemon/%/back.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy_n64.2bpp: tools/gfx += --trim-whitespace

gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/chris.2bpp: rgbgfx += -h
gfx/player/chris_back.2bpp: rgbgfx += -h
gfx/player/kris.2bpp: rgbgfx += -h
gfx/player/kris_back.2bpp: rgbgfx += -h

gfx/trainer_card/chris_card.2bpp: rgbgfx += -h
gfx/trainer_card/kris_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace

gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/electro_ball_nonmatching.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/mobile_adapter.2bpp: tools/gfx += --trim-whitespace
gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace

gfx/unknown/unknown_egg.2bpp: rgbgfx += -h
