BattleCommand_FalseSwipe:
; Makes sure wCurDamage < MonHP

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld de, wCurDamage
	ld c, 2
	push hl
	push de
	call CompareBytes
	pop de
	pop hl
	jr c, .done

	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	dec a
	ld [de], a

	inc a
	jr nz, .okay
	dec de
	ld a, [de]
	dec a
	ld [de], a
.okay

	ld a, [wCriticalHit]
	cp 2
	jr nz, .carry
	xor a
	ld [wCriticalHit], a

.carry
	scf
	ret

.done
	and a
	ret
