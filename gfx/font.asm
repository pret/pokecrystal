FontExtra:
INCBIN "gfx/font/font_extra.2bpp"

Font:
INCBIN "gfx/font/font.1bpp"

FontBattleExtra:
INCBIN "gfx/font/font_battle_extra.2bpp"

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

; Various misc graphics here.

StatsScreenPageTilesGFX: ; f89b0
INCBIN "gfx/stats/stats_tiles.2bpp"
; f8a90

ShinyIconGFX: ; f8a90
; also part of StatsScreenPageTilesGFX
INCBIN "gfx/stats/shiny.2bpp"

ExpBarEndsGFX: ; f8aa0
; not referenced on its own, but part of StatsScreenPageTilesGFX
INCBIN "gfx/stats/exp_bar_ends.2bpp"
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
INCBIN "gfx/pokegear/town_map.2bpp.lz"
; f8ea4

UnusedWeekdayKanjiGFX: ; unused kanji
INCBIN "gfx/font/unused_weekday_kanji.2bpp"
; f8f24

PokegearPhoneIconGFX: ; f8f24
INCBIN "gfx/font/phone_icon.2bpp"
; f8f34

UnusedBoldFontGFX: ; unused bold letters + unown chars
INCBIN "gfx/font/unused_bold_font.1bpp"
; f9204

TextBoxSpaceGFX: ; f9204
INCBIN "gfx/frames/space.1bpp"
; f9214

FontsExtra_SolidBlackGFX: ; f9214
INCBIN "gfx/font/black.1bpp"
; f921c

UnusedUpArrowGFX: ; unused up arrow + whitespace
INCBIN "gfx/font/unused_arrow.1bpp"
; f9234

MobilePhoneTilesGFX: ; f9234
INCBIN "gfx/mobile/phone_tiles.2bpp"
; f9344

MapEntryFrameGFX: ; f9344
INCBIN "gfx/frames/map_entry_sign.2bpp"
; f9424

FontsExtra2_UpArrowGFX: ; f9424
INCBIN "gfx/font/up_arrow.2bpp"
; f9434

Footprints: ; f9434
INCLUDE "gfx/footprints.asm"
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
	ld hl, vTiles1
	lb bc, BANK(Font), 128 ; "A" to "9"
	ld a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 32 ; "A" to "]"
	call Get1bpp_2
	ld de, Font + 32 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $20
	lb bc, BANK(Font), 32 ; "a" to $bf
	call Get1bpp_2
	ld de, Font + 64 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 32 ; "Ä" to "←"
	call Get1bpp_2
	ld de, Font + 96 * LEN_1BPP_TILE
	ld hl, vTiles1 tile $60
	lb bc, BANK(Font), 32 ; "'" to "9"
	call Get1bpp_2
	ret
; fb48a

_LoadFontsExtra1:: ; fb48a
	ld de, FontsExtra_SolidBlackGFX
	ld hl, vTiles2 tile "<BLACK>" ; $60
	lb bc, BANK(FontsExtra_SolidBlackGFX), 1
	call Get1bpp_2
	ld de, PokegearPhoneIconGFX
	ld hl, vTiles2 tile "<PHONE>" ; $62
	lb bc, BANK(PokegearPhoneIconGFX), 1
	call Get2bpp_2
	ld de, FontExtra tile 3
	ld hl, vTiles2 tile "<BOLD_D>"
	lb bc, BANK(FontExtra), 22 ; "<BOLD_D>" to "ぉ"
	call Get2bpp_2
	jr LoadFrame
; fb4b0

_LoadFontsExtra2:: ; fb4b0
	ld de, FontsExtra2_UpArrowGFX
	ld hl, vTiles2 tile "▲" ; $61
	ld b, BANK(FontsExtra2_UpArrowGFX)
	ld c, 1
	call Get2bpp_2
	ret
; fb4be

_LoadFontsBattleExtra:: ; fb4be
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bpp_2
	jr LoadFrame
; fb4cc

LoadFrame: ; fb4cc
	ld a, [TextBoxFrame]
	and 7
	ld bc, 6 * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles2 tile "┌" ; $79
	lb bc, BANK(Frames), 6 ; "┌" to "┘"
	call Get1bpp_2
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	call Get1bpp_2
	ret
; fb4f2

LoadBattleFontsHPBar: ; fb4f2
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bpp_2
	ld hl, vTiles2 tile $70
	ld de, FontBattleExtra tile 16
	lb bc, BANK(FontBattleExtra), 3 ; "<ど>" to "『"
	call Get2bpp_2
	call LoadFrame

LoadHPBar: ; fb50d
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bpp_2
	ld de, MobilePhoneTilesGFX tile 7 ; mobile phone icon
	ld hl, vTiles2 tile $5e
	lb bc, BANK(MobilePhoneTilesGFX), 2
	call Get2bpp_2
	ret
; fb53e

StatsScreen_LoadFont: ; fb53e
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp_2
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, vTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp_2
LoadStatsScreenPageTilesGFX: ; fb571
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), $11
	call Get2bpp_2
	ret
; fb57e
