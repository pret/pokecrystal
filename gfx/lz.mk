# Delete these rules if you don't care about matching.

%.lz: LZFLAGS = --compressor multipass

gfx/battle_anims/%.lz: LZFLAGS += --method 2 --align 4

gfx/battle/dude.2bpp.lz: LZFLAGS += --align 4

gfx/diploma/diploma.2bpp.lz: LZFLAGS += --method 8 --align 1

gfx/memory_game/memory_game.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/intro/%.lz: LZFLAGS += --align 4
gfx/intro/suicune_close.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/intro/unown_back.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/mobile/mobile_trade.%.lz: LZFLAGS += --align 4
gfx/mobile/mobile_trade_sprites.2bpp.lz: LZFLAGS += --align 4

gfx/new_game/shrink1.2bpp.lz: LZFLAGS += --align 4
gfx/new_game/shrink2.2bpp.lz: LZFLAGS += --align 4

gfx/pc/pc.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/player/chris_back.2bpp.lz: LZFLAGS += --align 4

gfx/pokedex/pokedex.2bpp.lz: LZFLAGS += --method 8 --align 1
gfx/pokedex/pokedex_sgb.2bpp.lz: LZFLAGS += --method 8 --align 1
gfx/pokedex/question_mark.2bpp.lz: LZFLAGS += --align 4
gfx/pokedex/slowpoke.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/pokegear/pokegear.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/pokegear/pokegear_sprites.2bpp.lz: LZFLAGS += --align 4
gfx/pokegear/town_map.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/pokemon/corsola/front.animated.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/hitmontop/back.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/nidoran_f/front.animated.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/primeape/front.animated.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/scyther/front.animated.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/unown_g/front.animated.2bpp.lz: LZFLAGS += --method 4
gfx/pokemon/voltorb/front.animated.2bpp.lz: LZFLAGS += --method 4

gfx/sgb/gbc_only.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1

gfx/slots/slots_1.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/slots/slots_2.2bpp.lz: LZFLAGS += --align 4
gfx/slots/slots_3.2bpp.lz: LZFLAGS += --align 4

gfx/splash/ditto.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/tilesets/%.lz: LZFLAGS += --align 4
gfx/tilesets/aerodactyl_word_room.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/battle_tower_outside.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/beta_word_room.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/ho_oh_word_room.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/house.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/johto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/johto_modern.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/kabuto_word_room.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/kanto.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/mansion.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/mart.2bpp.lz: LZFLAGS += --method 2 --align 4
gfx/tilesets/omanyte_word_room.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/players_room.2bpp.lz: LZFLAGS += --method 4 --align 4
gfx/tilesets/ruins_of_alph.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/tilesets/tower.2bpp.lz: LZFLAGS += --method 2 --align 4

gfx/title/crystal.2bpp.lz: LZFLAGS += --align 4
gfx/title/logo.2bpp.lz: LZFLAGS = --compressor null --method 1 --align 1
gfx/title/suicune.2bpp.lz: LZFLAGS += --align 4

gfx/unown_puzzle/%.lz: LZFLAGS += --align 4
gfx/unown_puzzle/start_cancel.2bpp.lz: LZFLAGS += --method 8 --align 1
