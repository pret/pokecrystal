; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_JOHTO                ; 01
	const TILESET_JOHTO_MODERN         ; 02
	const TILESET_KANTO                ; 03
	const TILESET_BATTLE_TOWER_OUTSIDE ; 04
	const TILESET_HOUSE                ; 05
	const TILESET_PLAYERS_HOUSE        ; 06
	const TILESET_POKECENTER           ; 07
	const TILESET_GATE                 ; 08
	const TILESET_PORT                 ; 09
	const TILESET_LAB                  ; 0a
	const TILESET_FACILITY             ; 0b
	const TILESET_MART                 ; 0c
	const TILESET_MANSION              ; 0d
	const TILESET_GAME_CORNER          ; 0e
	const TILESET_ELITE_FOUR_ROOM      ; 0f
	const TILESET_TRADITIONAL_HOUSE    ; 10
	const TILESET_TRAIN_STATION        ; 11
	const TILESET_CHAMPIONS_ROOM       ; 12
	const TILESET_LIGHTHOUSE           ; 13
	const TILESET_PLAYERS_ROOM         ; 14
	const TILESET_POKECOM_CENTER       ; 15
	const TILESET_BATTLE_TOWER_INSIDE  ; 16
	const TILESET_TOWER                ; 17
	const TILESET_CAVE                 ; 18
	const TILESET_PARK                 ; 19
	const TILESET_RUINS_OF_ALPH        ; 1a
	const TILESET_RADIO_TOWER          ; 1b
	const TILESET_UNDERGROUND          ; 1c
	const TILESET_ICE_PATH             ; 1d
	const TILESET_DARK_CAVE            ; 1e
	const TILESET_FOREST               ; 1f
	const TILESET_BETA_WORD_ROOM       ; 20
	const TILESET_HO_OH_WORD_ROOM      ; 21
	const TILESET_KABUTO_WORD_ROOM     ; 22
	const TILESET_OMANYTE_WORD_ROOM    ; 23
	const TILESET_AERODACTYL_WORD_ROOM ; 24
DEF NUM_TILESETS EQU const_value - 1

; wTileset struct size
DEF TILESET_LENGTH EQU 15

; roof length (see gfx/tilesets/roofs)
DEF ROOF_LENGTH EQU 9

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7
