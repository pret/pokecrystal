BattleCommand_Disable: ; 36fed
; disable

	ld a, [AttackMissed]
	and a
	jr nz, .failed

	ld de, EnemyDisableCount
	ld hl, EnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld de, PlayerDisableCount
	ld hl, BattleMonMoves
.got_moves

	ld a, [de]
	and a
	jr nz, .failed

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	cp STRUGGLE
	jr z, .failed

	ld b, a
	ld c, $ff
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, [hBattleTurn]
	and a
	ld hl, EnemyMonPP
	jr z, .got_pp
	ld hl, BattleMonPP
.got_pp
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .failed
.loop2
	call BattleRandom
	and 7
	jr z, .loop2
	inc a
	inc c
	swap c
	add c
	ld [de], a
	call AnimateCurrentMove
	ld hl, DisabledMove
	ld a, [hBattleTurn]
	and a
	jr nz, .got_disabled_move_pointer
	inc hl
.got_disabled_move_pointer
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld hl, WasDisabledText
	jp StdBattleTextBox

.failed
	jp FailMove

; 3705c
