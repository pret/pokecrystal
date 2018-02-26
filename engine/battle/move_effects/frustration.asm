BattleCommand_FrustrationPower: ; 3790e
; frustrationpower

	push bc
	ld hl, wBattleMonHappiness
	ld a, [hBattleTurn]
	and a
	jr z, .got_happiness
	ld hl, wEnemyMonHappiness
.got_happiness
	ld a, $ff
	sub [hl]
	ld [hMultiplicand + 2], a
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, 10
	ld [hMultiplier], a
	call Multiply
	ld a, 25
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld d, a
	pop bc
	ret

; 37939
