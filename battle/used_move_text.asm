DisplayUsedMoveText: ; 105db0
; battle command 03
	ld hl, UsedMoveText
	call BattleTextBox
	jp WaitBGMap
; 105db9


UsedMoveText: ; 105db9
; this is a stream of text and asm from 105db9 to 105ef6

	text_jump _ActorNameText
	start_asm
	ld a, [hBattleTurn]
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
	ld [wd265], a

	push hl
	callba CheckUserIsCharging
	pop hl
	jr nz, .grammar

	; update last move
	ld a, [wd265]
	ld [hl], a
	ld [de], a

.grammar
	call GetMoveGrammar
; wd265 now contains MoveGrammar


; everything except 'instead' made redundant in localization

	; check obedience
	ld a, [AlreadyDisobeyed]
	and a
	ld hl, UsedMove2Text
	ret nz

	; check move grammar
	ld a, [wd265]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret
; 105e04

UsedMove1Text: ; 105e04
	text_jump _UsedMove1Text
	start_asm
	jr UsedMoveText_CheckObedience
; 105e0b

UsedMove2Text: ; 105e0b
	text_jump _UsedMove2Text
	start_asm
UsedMoveText_CheckObedience: ; 105e10
; check obedience
	ld a, [AlreadyDisobeyed]
	and a
	jr z, .GetMoveNameText
; print "instead,"
	ld hl, .UsedInsteadText
	ret
; 105e1a

.UsedInsteadText:
	text_jump _UsedInsteadText
	start_asm
.GetMoveNameText:
	ld hl, MoveNameText
	ret
; 105e23

MoveNameText: ; 105e23
	text_jump _MoveNameText
	start_asm
; get start address
	ld hl, .endusedmovetexts

; get move id
	ld a, [wd265]

; 2-byte pointer
	add a

; seek
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc

; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 105e39

.endusedmovetexts ; 105e39
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text
; 105e43

EndUsedMove1Text: ; 105e43
	text_jump _EndUsedMove1Text
	db "@"
; 105e48
EndUsedMove2Text: ; 105e48
	text_jump _EndUsedMove2Text
	db "@"
; 105e4d
EndUsedMove3Text: ; 105e4d
	text_jump _EndUsedMove3Text
	db "@"
; 105e52
EndUsedMove4Text: ; 105e52
	text_jump _EndUsedMove4Text
	db "@"
; 105e57
EndUsedMove5Text: ; 105e57
	text_jump _EndUsedMove5Text
	db "@"
; 105e5c


GetMoveGrammar: ; 105e5c
; store move grammar type in wd265

	push bc
; c = move id
	ld a, [wd265]
	ld c, a
	ld b, $0

; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp $ff
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at $00
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wd265 now contains move grammar
	ld a, b
	ld [wd265], a

; we're done
	pop bc
	ret
; 105e7a

MoveGrammar: ; 105e7a
; made redundant in localization
; each move is given an identifier for what usedmovetext to use (0-4):

; 0
	db SWORDS_DANCE
	db GROWTH
	db STRENGTH
	db HARDEN
	db MINIMIZE
	db SMOKESCREEN
	db WITHDRAW
	db DEFENSE_CURL
	db EGG_BOMB
	db SMOG
	db BONE_CLUB
	db FLASH
	db SPLASH
	db ACID_ARMOR
	db BONEMERANG
	db REST
	db SHARPEN
	db SUBSTITUTE
	db MIND_READER
	db SNORE
	db PROTECT
	db SPIKES
	db ENDURE
	db ROLLOUT
	db SWAGGER
	db SLEEP_TALK
	db HIDDEN_POWER
	db PSYCH_UP
	db EXTREMESPEED
	db 0 ; end set

; 1
	db RECOVER
	db TELEPORT
	db BIDE
	db SELFDESTRUCT
	db AMNESIA
	db FLAIL
	db 0 ; end set

; 2
	db MEDITATE
	db AGILITY
	db MIMIC
	db DOUBLE_TEAM
	db BARRAGE
	db TRANSFORM
	db STRUGGLE
	db SCARY_FACE
	db 0 ; end set

; 3
	db POUND
	db SCRATCH
	db VICEGRIP
	db WING_ATTACK
	db FLY
	db BIND
	db SLAM
	db HORN_ATTACK
	db WRAP
	db THRASH
	db TAIL_WHIP
	db LEER
	db BITE
	db GROWL
	db ROAR
	db SING
	db PECK
	db ABSORB
	db STRING_SHOT
	db EARTHQUAKE
	db FISSURE
	db DIG
	db TOXIC
	db SCREECH
	db METRONOME
	db LICK
	db CLAMP
	db CONSTRICT
	db POISON_GAS
	db BUBBLE
	db SLASH
	db SPIDER_WEB
	db NIGHTMARE
	db CURSE
	db FORESIGHT
	db CHARM
	db ATTRACT
	db ROCK_SMASH
	db 0 ; end set

; all other moves = 4
	db $ff ; end
; 105ed0


UpdateUsedMoves: ; 105ed0
; append move a to PlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, PlayerUsedMoves
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
	ld hl, PlayerUsedMoves + 1
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
	ld [PlayerUsedMoves + 3], a
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
; 105ef6
