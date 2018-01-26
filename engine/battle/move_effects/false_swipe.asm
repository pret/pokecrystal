BattleCommand_FalseSwipe: ; 35c94
; falseswipe

	ld hl, EnemyMonHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, BattleMonHP
.got_hp
	ld de, CurDamage
	ld c, 2
	push hl
	push de
	call StringCmp
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
	ld a, [CriticalHit]
	cp 2
	jr nz, .carry
	xor a
	ld [CriticalHit], a
.carry
	scf
	ret

.done
	and a
	ret

; 35cc9
