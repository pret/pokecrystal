SetSeenAndCaughtMon:: ; 3380
	push af
	ld c, a
	ld hl, wPokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction
	pop af
	; fallthrough
; 338b

SetSeenMon:: ; 338b
	ld c, a
	ld hl, wPokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction
; 3393

CheckCaughtMon:: ; 3393
	ld c, a
	ld hl, wPokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction
; 339b

CheckSeenMon:: ; 339b
	ld c, a
	ld hl, wPokedexSeen
	ld b, CHECK_FLAG
	; fallthrough
; 33a1

PokedexFlagAction:: ; 33a1
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	and a
	ret
; 33ab
