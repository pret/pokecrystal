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

InexplicablyEmptyFunction:: ; 2d43
; unused
; Inexplicably empty.
; Seen in PredefPointers.
rept 16
	nop
endr
	ret
; 2d54

INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/window.asm"
INCLUDE "home/flag.asm"

Unreferenced_Function2ebb:: ; 2ebb
	ld a, [wMonStatusFlags]
	bit 1, a
	ret z

	ld a, [hJoyDown]
	bit B_BUTTON_F, a
	ret
; 2ec6

xor_a:: ; 2ec6
	xor a
	ret
; 2ec8

xor_a_dec_a:: ; 2ec8
	xor a
	dec a
	ret
; 2ecb

Unreferenced_Function2ecb:: ; 2ecb
	push hl
	ld hl, wMonStatusFlags
	bit 1, [hl]
	pop hl
	ret
; 2ed3

INCLUDE "home/sprite_updates.asm"
INCLUDE "home/string.asm"
INCLUDE "home/region.asm"

ret_2f3e:: ; 2f3e
	ret
; 2f3f

INCLUDE "home/item.asm"
INCLUDE "home/random.asm"
INCLUDE "home/sram.asm"

; Register aliases

_hl_:: ; 2fec
	jp hl
; 2fed

_de_:: ; 2fed
	push de
	ret
; 2fef

INCLUDE "home/double_speed.asm"
INCLUDE "home/clear_sprites.asm"
INCLUDE "home/copy2.asm"
INCLUDE "home/copy_tilemap.asm"
INCLUDE "home/copy_name.asm"

IsInArray:: ; 30e1
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
; 30f4

SkipNames:: ; 0x30f4
; Skip a names.
	ld bc, NAME_LENGTH
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x30fe

INCLUDE "home/math.asm"
INCLUDE "home/print_text.asm"

CallPointerAt:: ; 31be
	ld a, [hROMBank]
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
; 31cd

QueueScript:: ; 31cd
; Push pointer hl in the current bank to wQueuedScriptBank.
	ld a, [hROMBank]

FarQueueScript:: ; 31cf
; Push pointer a:hl to wQueuedScriptBank.
	ld [wQueuedScriptBank], a
	ld a, l
	ld [wQueuedScriptAddr], a
	ld a, h
	ld [wQueuedScriptAddr + 1], a
	ret
; 31db

StringCmp:: ; 31db
; Compare c bytes at de and hl.
; Return z if they all match.
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret
; 0x31e4

CompareLong:: ; 31e4
; Compare bc bytes at de and hl.
; Return carry if they all match.

	ld a, [de]
	cp [hl]
	jr nz, .Diff

	inc de
	inc hl
	dec bc

	ld a, b
	or c
	jr nz, CompareLong

	scf
	ret

.Diff:
	and a
	ret
; 31f3

INCLUDE "home/tilemap.asm"

SetHPPal:: ; 334e
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret
; 3353

GetHPPal:: ; 3353
; Get palette for hp bar pixel length e in d.
	ld d, HP_GREEN
	ld a, e
	cp (50 * 48 / 100)
	ret nc
	inc d ; HP_YELLOW
	cp (21 * 48 / 100)
	ret nc
	inc d ; HP_RED
	ret
; 335f

CountSetBits:: ; 0x335f
; Count the number of set bits in b bytes starting from hl.
; Return in a, c and [wd265].
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
	ld [wd265], a
	ret
; 0x3376

GetWeekday:: ; 3376
	ld a, [wCurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret
; 3380

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
