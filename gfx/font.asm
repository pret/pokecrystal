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
INCBIN "gfx/font/unused_up_arrow.1bpp"
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
