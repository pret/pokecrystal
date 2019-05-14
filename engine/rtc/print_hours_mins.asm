INCLUDE "charmap.inc"
INCLUDE "macros/code.inc"
INCLUDE "macros/enum.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/text_constants.inc"


SECTION "engine/rtc/print_hours_mins.asm@Unreferenced_Function1dd6a9", ROMX

Unreferenced_Function1dd6a9:
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, sp+$2
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret


SECTION "engine/rtc/print_hours_mins.asm", ROMX

PrintHoursMins::
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM:
	or a
	jr nz, .PM
	ld a, 12
.PM:
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, sp+$1
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, sp+$0
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	inc hl
	call PlaceString
	ret

String_AM: db "AM@"
String_PM: db "PM@"
