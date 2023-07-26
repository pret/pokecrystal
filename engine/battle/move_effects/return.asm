BattleCommand_HappinessPower:
	push bc
	ld hl, wBattleMonHappiness
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHappiness
.ok
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, 10
	ldh [hMultiplier], a
	call Multiply
	ld a, 25
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	and a
	jr nz, .done
	inc a
.done
	ld d, a
	pop bc
	ret
