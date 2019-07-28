KnowsMove:
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .MoveKnowsText
	call PrintText
	scf
	ret

.MoveKnowsText:
	; knows @ .
	text_far _MoveKnowsText
	text_end
