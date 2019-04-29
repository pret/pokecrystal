BattleCommand_PsychUp:
; psychup

	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .pointers_correct
; It's the enemy's turn, so swap the pointers.
	push hl
	ld h, d
	ld l, e
	pop de
.pointers_correct
	push hl
	ld b, NUM_LEVEL_STATS
; If any of the enemy's stats is modified from its base level,
; the move succeeds.  Otherwise, it fails.
.loop
	ld a, [hli]
	cp BASE_STAT_LEVEL
	jr nz, .break
	dec b
	jr nz, .loop
	pop hl
	call AnimateFailedMove
	jp PrintButItFailed

.break
	pop hl
	ld b, NUM_LEVEL_STATS
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .merge

.calc_enemy_stats
	call CalcEnemyStats
.merge
	call AnimateCurrentMove
	ld hl, CopiedStatsText
	jp StdBattleTextbox
