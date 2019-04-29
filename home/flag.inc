ResetMapBufferEventFlags::
	xor a
	ld hl, wEventFlags
	ld [hli], a
	ret

ResetBikeFlags::
	xor a
	ld hl, wBikeFlags
	ld [hli], a
	ld [hl], a
	ret

ResetFlashIfOutOfCave::
	ld a, [wEnvironment]
	cp ROUTE
	jr z, .outdoors
	cp TOWN
	jr z, .outdoors
	ret

.outdoors
	ld hl, wStatusFlags
	res STATUSFLAGS_FLASH_F, [hl]
	ret

EventFlagAction::
	ld hl, wEventFlags
	call FlagAction
	ret

FlagAction::
; Perform action b on bit de in flag array hl.

; inputs:
; b: function
;    0  RESET_FLAG  clear bit
;    1  SET_FLAG    set bit
;    2  CHECK_FLAG  check bit
; de: bit number
; hl: pointer to the flag array

	; get index within the byte
	ld a, e
	and 7

	; shift de right by three bits (get the index within memory)
rept 3
	srl d
	rr e
endr
	add hl, de

	; implement a decoder
	ld c, 1
	rrca
	jr nc, .one
	rlc c
.one
	rrca
	jr nc, .two
	rlc c
	rlc c
.two
	rrca
	jr nc, .three
	swap c
.three

	; check b's value: 0, 1, 2
	ld a, b
	cp SET_FLAG
	jr c, .clearbit ; RESET_FLAG
	jr z, .setbit ; SET_FLAG

	; check bit
	ld a, [hl]
	and c
	ld c, a
	ret

.setbit
	; set bit
	ld a, [hl]
	or c
	ld [hl], a
	ret

.clearbit
	; clear bit
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	ret

CheckReceivedDex::
	ld de, ENGINE_POKEDEX
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	ret
