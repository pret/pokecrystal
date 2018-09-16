INCLUDE "constants.asm"


SECTION "NULL", ROM0

NULL::

INCLUDE "home/rst.asm"

INCLUDE "home/interrupts.asm"


SECTION "Header", ROM0

Start::
	nop
	jp _Start


SECTION "Home", ROM0

INCLUDE "home/init.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/rtc.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/time.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/text.asm"
INCLUDE "home/video.asm"
INCLUDE "home/map_objects.asm"
INCLUDE "home/sine.asm"
INCLUDE "home/movement.asm"
INCLUDE "home/menu_window.asm"
INCLUDE "home/menu.asm"
INCLUDE "home/handshake.asm"
INCLUDE "home/game_time.asm"
INCLUDE "home/map.asm"

InexplicablyEmptyFunction::
; unused
; Inexplicably empty.
; Seen in PredefPointers.
rept 16
	nop
endr
	ret

INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/window.asm"
INCLUDE "home/flag.asm"

Unreferenced_CheckBPressedDebug::
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

Unreferenced_CheckFieldDebug::
	push hl
	ld hl, wDebugFlags
	bit DEBUG_FIELD_F, [hl]
	pop hl
	ret

INCLUDE "home/sprite_updates.asm"
INCLUDE "home/string.asm"
INCLUDE "home/region.asm"

ret_2f3e::
	ret

INCLUDE "home/item.asm"
INCLUDE "home/random.asm"
INCLUDE "home/sram.asm"

; Register aliases

_hl_::
	jp hl

_de_::
	push de
	ret

INCLUDE "home/double_speed.asm"
INCLUDE "home/clear_sprites.asm"
INCLUDE "home/copy2.asm"
INCLUDE "home/copy_tilemap.asm"
INCLUDE "home/copy_name.asm"

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

INCLUDE "home/math.asm"
INCLUDE "home/print_text.asm"

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

INCLUDE "home/queue_script.asm"
INCLUDE "home/compare.asm"
INCLUDE "home/tilemap.asm"
INCLUDE "home/hp_pals.asm"

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

INCLUDE "home/pokedex_flags.asm"
INCLUDE "home/names.asm"
INCLUDE "home/scrolling_menu.asm"
INCLUDE "home/stone_queue.asm"
INCLUDE "home/trainers.asm"
INCLUDE "home/mon_stats.asm"
INCLUDE "home/cry.asm"
INCLUDE "home/print_level.asm"
INCLUDE "home/mon_data.asm"
INCLUDE "home/print_bcd.asm"
INCLUDE "home/mon_data_2.asm"
INCLUDE "home/battle.asm"
INCLUDE "home/sprite_anims.asm"
INCLUDE "home/audio.asm"
INCLUDE "home/mobile.asm"
