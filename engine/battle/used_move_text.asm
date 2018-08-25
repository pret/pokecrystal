DisplayUsedMoveText:
; battle command 03
	ld hl, UsedMoveText
	call BattleTextBox
	jp WaitBGMap

UsedMoveText:
; this is a stream of text and asm from 105db9 to 105ef6
	text_jump _ActorNameText
	start_asm
	ldh a, [hBattleTurn]
	and a
	jr nz, .start

	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	call UpdateUsedMoves

.start
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [wMoveGrammar], a

	push hl
	farcall CheckUserIsCharging
	pop hl
	jr nz, .grammar

	; update last move
	ld a, [wMoveGrammar]
	ld [hl], a
	ld [de], a

.grammar
	call GetMoveGrammar ; convert move id to grammar index

; everything except 'instead' made redundant in localization

	; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	ld hl, UsedMove2Text
	ret nz

	; check move grammar
	ld a, [wMoveGrammar]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret

UsedMove1Text:
	text_jump _UsedMove1Text
	start_asm
	jr UsedMoveText_CheckObedience

UsedMove2Text:
	text_jump _UsedMove2Text
	start_asm
UsedMoveText_CheckObedience:
; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	jr z, .GetMoveNameText
; print "instead,"
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text_jump _UsedInsteadText
	start_asm
.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText:
	text_jump _MoveNameText
	start_asm
; get start address
	ld hl, .endusedmovetexts

; get move id
	ld a, [wMoveGrammar]

; 2-byte pointer
	add a

; seek
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc

; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.endusedmovetexts
; entries correspond to MoveGrammar sets
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text

EndUsedMove1Text:
	text_jump _EndUsedMove1Text
	db "@"
EndUsedMove2Text:
	text_jump _EndUsedMove2Text
	db "@"
EndUsedMove3Text:
	text_jump _EndUsedMove3Text
	db "@"
EndUsedMove4Text:
	text_jump _EndUsedMove4Text
	db "@"
EndUsedMove5Text:
	text_jump _EndUsedMove5Text
	db "@"

GetMoveGrammar:
; store move grammar type in wMoveGrammar

	push bc
; wMoveGrammar contains move id
	ld a, [wMoveGrammar]
	ld c, a ; move id
	ld b, 0 ; grammar index

; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp -1
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at 0
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wMoveGrammar now contains move grammar
	ld a, b
	ld [wMoveGrammar], a

; we're done
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"

UpdateUsedMoves:
; append move a to wPlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, wPlayerUsedMoves
; get move id
	ld b, a
; next count
	ld c, NUM_MOVES

.loop
; get move from the list
	ld a, [hli]
; not used yet?
	and a
	jr z, .add
; already used?
	cp b
	jr z, .quit
; next byte
	dec c
	jr nz, .loop

; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, wPlayerUsedMoves + 1
; 1 = 2
	ld a, [hld]
	ld [hli], a
; 2 = 3
	inc hl
	ld a, [hld]
	ld [hli], a
; 3 = 4
	inc hl
	ld a, [hld]
	ld [hl], a
; 4 = new move
	ld a, b
	ld [wPlayerUsedMoves + 3], a
	jr .quit

.add
; go back to the byte we just inced from
	dec hl
; add the new move
	ld [hl], b

.quit
; list updated
	pop bc
	ret
