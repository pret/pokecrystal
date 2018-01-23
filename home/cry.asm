PlayStereoCry:: ; 37b6
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	call _PlayMonCry
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
	jp _PlayMonCry
; 37ce

PlayMonCry:: ; 37ce
	call PlayMonCry2
	call WaitSFX
	ret
; 37d5

PlayMonCry2:: ; 37d5
; Don't wait for the cry to end.
	push af
	xor a
	ld [wStereoPanningMask], a
	ld [CryTracks], a
	pop af
	call _PlayMonCry
	ret
; 37e2

_PlayMonCry:: ; 37e2
	push hl
	push de
	push bc

	call GetCryIndex
	jr c, .done

	ld e, c
	ld d, b
	call PlayCry

.done
	pop bc
	pop de
	pop hl
	ret
; 37f3

LoadCry:: ; 37f3
; Load cry bc.

	call GetCryIndex
	ret c

	ld a, [hROMBank]
	push af
	ld a, BANK(PokemonCries)
	rst Bankswitch

	ld hl, PokemonCries
rept 6 ; sizeof(mon_cry)
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
