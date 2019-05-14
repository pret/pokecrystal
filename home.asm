INCLUDE "charmap.inc"
INCLUDE "macros/code.inc"
INCLUDE "macros/coords.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/gfx.inc"
INCLUDE "macros/predef.inc"
INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/movement.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/text_constants.inc"
INCLUDE "constants/audio_constants.inc"
INCLUDE "constants/battle_constants.inc"
INCLUDE "constants/collision_constants.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/hardware_constants.inc"
INCLUDE "constants/input_constants.inc"
INCLUDE "constants/item_constants.inc"
INCLUDE "constants/landmark_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_data_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/map_setup_constants.inc"
INCLUDE "constants/menu_constants.inc"
INCLUDE "constants/misc_constants.inc"
INCLUDE "constants/move_constants.inc"
INCLUDE "constants/music_constants.inc"
INCLUDE "constants/pokemon_constants.inc"
INCLUDE "constants/pokemon_data_constants.inc"
INCLUDE "constants/scgb_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/serial_constants.inc"
INCLUDE "constants/sfx_constants.inc"
INCLUDE "constants/tileset_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "home.asm@NULL", ROM0[$0000]

NULL::

INCLUDE "home/rst.inc"

INCLUDE "home/interrupts.inc"


SECTION "home.asm@Header", ROM0[$0100]

Start:
	nop
	jp _Start

	ds $0150 - $0104


SECTION "home.asm@Home", ROM0

INCLUDE "home/init.inc"
INCLUDE "home/vblank.inc"
INCLUDE "home/delay.inc"
INCLUDE "home/rtc.inc"
INCLUDE "home/fade.inc"
INCLUDE "home/lcd.inc"
INCLUDE "home/time.inc"
INCLUDE "home/serial.inc"
INCLUDE "home/joypad.inc"
INCLUDE "home/decompress.inc"
INCLUDE "home/palettes.inc"
INCLUDE "home/copy.inc"
INCLUDE "home/text.inc"
INCLUDE "home/video.inc"
INCLUDE "home/map_objects.inc"
INCLUDE "home/sine.inc"
INCLUDE "home/movement.inc"
INCLUDE "home/menu_window.inc"
INCLUDE "home/menu.inc"
INCLUDE "home/handshake.inc"
INCLUDE "home/game_time.inc"
INCLUDE "home/map.inc"

InexplicablyEmptyFunction::
; unused
; Inexplicably empty.
; Seen in PredefPointers.
rept 16
	nop
endr
	ret

INCLUDE "home/farcall.inc"
INCLUDE "home/predef.inc"
INCLUDE "home/window.inc"
INCLUDE "home/flag.inc"

Unreferenced_CheckBPressedDebug:
; Used in debug ROMs to walk through walls and avoid encounters.

	ld a, [wDebugFlags]
	bit DEBUG_FIELD_F, a
	ret z

	ldh a, [hJoyDown]
	bit B_BUTTON_F, a
	ret

xor_a::
	xor a
	ret

xor_a_dec_a::
	xor a
	dec a
	ret

Unreferenced_CheckFieldDebug:
	push hl
	ld hl, wDebugFlags
	bit DEBUG_FIELD_F, [hl]
	pop hl
	ret

INCLUDE "home/sprite_updates.inc"
INCLUDE "home/string.inc"
INCLUDE "home/region.inc"

ret_2f3e::
	ret

INCLUDE "home/item.inc"
INCLUDE "home/random.inc"
INCLUDE "home/sram.inc"

; Register aliases

_hl_::
	jp hl

_de_::
	push de
	ret

INCLUDE "home/double_speed.inc"
INCLUDE "home/clear_sprites.inc"
INCLUDE "home/copy2.inc"
INCLUDE "home/copy_tilemap.inc"
INCLUDE "home/copy_name.inc"

IsInArray::
; Find value a for every de bytes in array hl.
; Return index in b and carry if found.

	ld b, 0
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .NotInArray
	cp c
	jr z, .InArray
	inc b
	add hl, de
	jr .loop

.NotInArray:
	and a
	ret

.InArray:
	scf
	ret

SkipNames::
; Skip a names.
	ld bc, NAME_LENGTH
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret

INCLUDE "home/math.inc"
INCLUDE "home/print_text.inc"

CallPointerAt::
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	pop hl
	ld a, h
	rst Bankswitch
	ret

INCLUDE "home/queue_script.inc"
INCLUDE "home/compare.inc"
INCLUDE "home/tilemap.inc"
INCLUDE "home/hp_pals.inc"

CountSetBits::
; Count the number of set bits in b bytes starting from hl.
; Return in a, c and [wNumSetBits].
	ld c, 0
.next
	ld a, [hli]
	ld e, a
	ld d, 8

.count
	srl e
	ld a, 0
	adc c
	ld c, a
	dec d
	jr nz, .count

	dec b
	jr nz, .next

	ld a, c
	ld [wNumSetBits], a
	ret

GetWeekday::
	ld a, [wCurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret

INCLUDE "home/pokedex_flags.inc"
INCLUDE "home/names.inc"
INCLUDE "home/scrolling_menu.inc"
INCLUDE "home/stone_queue.inc"
INCLUDE "home/trainers.inc"
INCLUDE "home/mon_stats.inc"
INCLUDE "home/cry.inc"
INCLUDE "home/print_level.inc"
INCLUDE "home/mon_data.inc"
INCLUDE "home/print_bcd.inc"
INCLUDE "home/mon_data_2.inc"
INCLUDE "home/battle.inc"
INCLUDE "home/sprite_anims.inc"
INCLUDE "home/audio.inc"
INCLUDE "home/mobile.inc"
