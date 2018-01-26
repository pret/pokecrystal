BattleCommand_Encore: ; 35864
; encore

	ld hl, EnemyMonMoves
	ld de, EnemyEncoreCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, BattleMonMoves
	ld de, PlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	and a
	jp z, .failed
	cp STRUGGLE
	jp z, .failed
	cp ENCORE
	jp z, .failed
	cp MIRROR_MOVE
	jp z, .failed
	ld b, a

.got_move
	ld a, [hli]
	cp b
	jr nz, .got_move

	ld bc, BattleMonPP - BattleMonMoves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jp z, .failed
	ld a, [AttackMissed]
	and a
	jp nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jp nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	call CheckOpponentWentFirst
	jr nz, .finish_move
	ld a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move

	push hl
	ld a, [LastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, BattleMonMoves
.find_player_move
	ld a, [hli]
	cp b
	jr z, .got_player_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_player_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_player_move
	pop hl
	ld a, c
	ld [CurMoveNum], a
	ld a, b
	ld [CurPlayerMove], a
	dec a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	ld a, [LastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, EnemyMonMoves
.find_enemy_move
	ld a, [hli]
	cp b
	jr z, .got_enemy_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_enemy_move
	pop hl
	ld a, c
	ld [CurEnemyMoveNum], a
	ld a, b
	ld [CurEnemyMove], a
	dec a
	ld de, wEnemyMoveStruct
	call GetMoveData

.finish_move
	call AnimateCurrentMove
	ld hl, GotAnEncoreText
	jp StdBattleTextBox

.failed
	jp PrintDidntAffect2

; 35926
