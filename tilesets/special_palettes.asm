LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE_1
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_CELADON_MANSION
	jr z, .mansion_mobile
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret
; 494f2

LoadPokeComPalette: ; 494f2
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49501

PokeComPalette: ; 49501
INCLUDE "gfx/tilesets/pokecom_center.pal"
; 49541

LoadBattleTowerPalette: ; 49541
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49550

BattleTowerPalette: ; 49550
INCLUDE "gfx/tilesets/battle_tower.pal"
; 49590

LoadIcePathPalette: ; 49590
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4959f

IcePathPalette: ; 4959f
INCLUDE "gfx/tilesets/ice_path.pal"
; 495df

LoadHousePalette: ; 495df
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 495ee

HousePalette: ; 495ee
INCLUDE "gfx/tilesets/house_1.pal"
; 4962e

LoadRadioTowerPalette: ; 4962e
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4963d

RadioTowerPalette: ; 4963d
INCLUDE "gfx/tilesets/radio_tower.pal"
; 4967d

MansionPalette1: ; 4967d
	RGB 30, 28, 26
	RGB 19, 19, 19
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 18, 24, 09
	RGB 15, 20, 01
	RGB 09, 13, 00
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 15, 16, 31
	RGB 09, 09, 31
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 26, 24, 17
	RGB 21, 17, 07
	RGB 16, 13, 03
	RGB 07, 07, 07

MansionPalette3: ; 496ad
	RGB 30, 28, 26
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 07, 07, 07

	RGB 31, 31, 16
	RGB 31, 31, 16
	RGB 14, 09, 00
	RGB 00, 00, 00
; 496bd

MansionPalette4: ; 496bd
	RGB 05, 05, 16
	RGB 08, 19, 28
	RGB 00, 00, 00
	RGB 31, 31, 31
; 496c5

LoadMansionPalette: ; 496c5
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette3
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette4
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
; 496fe

MansionPalette2: ; 496fe
	RGB 25, 24, 23
	RGB 20, 19, 19
	RGB 14, 16, 31
	RGB 07, 07, 07
; 49706
