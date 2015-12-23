PlayStereoCry:: ; 37b6
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	call _PlayCry
	call WaitSFX
	ret
; 37c4

PlayStereoCry2:: ; 37c4
; Don't wait for the cry to end.
; Used during pic animations.
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	jp _PlayCry
; 37ce

PlayCry:: ; 37ce
	call PlayCry2
	call WaitSFX
	ret
; 37d5

PlayCry2:: ; 37d5
; Don't wait for the cry to end.
	push af
	xor a
	ld [wStereoPanningMask], a
	ld [CryTracks], a
	pop af
	call _PlayCry
	ret
; 37e2

_PlayCry:: ; 37e2
	push hl
	push de
	push bc

	call GetCryIndex
	jr c, .done

	ld e, c
	ld d, b
	call PlayCryHeader

.done
	pop bc
	pop de
	pop hl
	ret
; 37f3

LoadCryHeader:: ; 37f3
; Load cry header bc.

	call GetCryIndex
	ret c

	ld a, [hROMBank]
	push af
	ld a, BANK(CryHeaders)
	rst Bankswitch

	ld hl, CryHeaders
rept 6
	add hl, bc
endr

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [CryPitch], a
	ld a, [hli]
	ld [CryPitch + 1], a
	ld a, [hli]
	ld [CryLength], a
	ld a, [hl]
	ld [CryLength + 1], a

	pop af
	rst Bankswitch
	and a
	ret
; 381e

GetCryIndex:: ; 381e
	and a
	jr z, .no
	cp NUM_POKEMON + 1
	jr nc, .no

	dec a
	ld c, a
	ld b, 0
	and a
	ret

.no
	scf
	ret
; 382d
