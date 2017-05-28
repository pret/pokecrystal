FontExtra:
INCBIN "gfx/misc/font_extra.2bpp"

Font:
INCBIN "gfx/misc/font.1bpp"

FontBattleExtra:
INCBIN "gfx/misc/font_battle_extra.2bpp"

Frames: ; f8800
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
INCBIN "gfx/frames/9.1bpp"
; f89b0

; TODO: Various misc graphics here.

StatsScreenPageTilesGFX: ; f89b0
INCBIN "gfx/unknown/0f89b0.2bpp"
; f8a90

ShinyIcon: ; f8a90
; also part of StatsScreenPageTilesGFX
INCBIN "gfx/stats/shiny.2bpp"

StatsScreenPageTilesGFX_Part2: ; f8aa0
; not referenced on its own, but part of StatsScreenPageTilesGFX
INCBIN "gfx/unknown/0f8aa0.2bpp"
; f8ac0

EnemyHPBarBorderGFX: ; f8ac0
INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"
; f8ae0

HPExpBarBorderGFX: ; f8ae0
INCBIN "gfx/battle/hp_exp_bar_border.1bpp"
; f8b10

ExpBarGFX: ; f8b10
INCBIN "gfx/battle/expbar.2bpp"
; f8ba0

TownMapGFX: ; f8ba0
INCBIN "gfx/misc/town_map.2bpp.lz"
; f8ea4

GFX_f8ea4: ; unused kanji
INCBIN "gfx/unknown/0f8ea4.2bpp"
; f8f24

OverworldPhoneIconGFX: ; f8f24
INCBIN "gfx/mobile/overworld_phone_icon.2bpp"
; f8f34

GFX_f8f34: ; unused bold letters + unown chars
INCBIN "gfx/unknown/0f8f34.w64.1bpp"
; f9204

TextBoxSpaceGFX: ; f9204
INCBIN "gfx/frames/space.2bpp"
; f9214

MobilePhoneTilesGFX: ; f9214
INCBIN "gfx/mobile/phone_tiles.2bpp"
; f9344

MapEntryFrameGFX: ; f9344
INCBIN "gfx/frames/map_entry_sign.2bpp"
; f9424

FontsExtra2_UpArrowGFX: ; f9424
INCBIN "gfx/unknown/0f9424.2bpp"
; f9434

Footprints: ; f9434
INCBIN "gfx/misc/footprints.1bpp"
; fb434

; This and the following two functions are unreferenced.
; Debug, perhaps?
Unknown_fb434:
	db 0

Functionfb435: ; 4b435
	ld a, [Unknown_fb434]
	and a
	jp nz, Get1bpp_2
	jp Get1bpp
; fb43f

Functionfb43f: ; fb43f
	ld a, [Unknown_fb434]
	and a
	jp nz, Get2bpp_2
	jp Get2bpp
; End unreferenced block
; fb449

_LoadStandardFont:: ; fb449
	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $80
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy1bpp

	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $20 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $20
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $40 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $40
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $60 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $60
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ret
; fb48a

_LoadFontsExtra1:: ; fb48a
	ld de, MobilePhoneTilesGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(MobilePhoneTilesGFX), 1
	call Get1bpp_2
	ld de, OverworldPhoneIconGFX
	ld hl, VTiles2 tile $62
	lb bc, BANK(OverworldPhoneIconGFX), 1
	call Get2bpp_2
	ld de, FontExtra + 3 * LEN_2BPP_TILE
	ld hl, VTiles2 tile $63
	lb bc, BANK(FontExtra), $16
	call Get2bpp_2
	jr LoadFrame
; fb4b0

_LoadFontsExtra2:: ; fb4b0
	ld de, FontsExtra2_UpArrowGFX
	ld hl, VTiles2 tile $61
	ld b, BANK(FontsExtra2_UpArrowGFX)
	ld c, 1
	call Get2bpp_2
	ret
; fb4be

_LoadFontsBattleExtra:: ; fb4be
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $19
	call Get2bpp_2
	jr LoadFrame
; fb4cc

LoadFrame: ; fb4cc
	ld a, [TextBoxFrame]
	and 7
	ld bc, TILES_PER_FRAME * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $79
	lb bc, BANK(Frames), TILES_PER_FRAME
	call Get1bpp_2
	ld hl, VTiles2 tile $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	call Get1bpp_2
	ret
; fb4f2

LoadBattleFontsHPBar: ; fb4f2
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $c
	call Get2bpp_2
	ld hl, VTiles2 tile $70
	ld de, FontBattleExtra + $10 * LEN_2BPP_TILE
	lb bc, BANK(FontBattleExtra), 3
	call Get2bpp_2
	call LoadFrame

LoadHPBar: ; fb50d
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bpp_2
	ld de, MobilePhoneTilesGFX + 9 * LEN_2BPP_TILE
	ld hl, VTiles2 tile $5e
	lb bc, BANK(MobilePhoneTilesGFX), 2
	call Get2bpp_2
	ret
; fb53e

StatsScreen_LoadFont: ; fb53e
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp_2
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, VTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp_2
LoadStatsScreenPageTilesGFX: ; fb571
	ld de, StatsScreenPageTilesGFX
	ld hl, VTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), $11
	call Get2bpp_2
	ret
; fb57e
