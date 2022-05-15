DetermineLinkBattleResult:
	farcall UpdateEnemyMonInParty
	ld hl, wPartyMon1HP
	call .CountMonsRemaining
	push bc
	ld hl, wOTPartyMon1HP
	call .CountMonsRemaining
	ld a, c
	pop bc
	cp c
	jr z, .even_number_of_mons_remaining
	jr c, .defeat
	jr .victory

.even_number_of_mons_remaining
	call .BothSides_CheckNumberMonsAtFullHealth
	jr z, .drawn
	ld a, e
	cp $1
	jr z, .victory
	cp $2
	jr z, .defeat
	ld hl, wPartyMon1HP
	call .CalcPercentHPRemaining
	push de
	ld hl, wOTPartyMon1HP
	call .CalcPercentHPRemaining
	pop hl
	ld a, d
	cp h
	jr c, .victory
	jr z, .compare_lo
	jr .defeat

.compare_lo
	ld a, e
	cp l
	jr z, .drawn
	jr nc, .defeat

.victory
	ld a, [wBattleResult]
	and $f0
	ld [wBattleResult], a ; WIN
	ret

.defeat
	ld a, [wBattleResult]
	and $f0
	add LOSE
	ld [wBattleResult], a
	ret

.drawn
	ld a, [wBattleResult]
	and $f0
	add DRAW
	ld [wBattleResult], a
	ret

.CountMonsRemaining:
	ld c, 0
	ld b, 3
	ld de, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted
	inc c

.not_fainted
	add hl, de
	dec b
	jr nz, .loop
	ret

.CalcPercentHPRemaining:
	ld de, 0
	ld c, $3
.loop2
	ld a, [hli]
	or [hl]
	jr z, .next
	dec hl
	xor a
	ldh [hDividend + 0], a
	ld a, [hli]
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 2], a
	xor a
	ldh [hDividend + 3], a
	ld a, [hli]
	ld b, a
	ld a, [hld]
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	add e
	ld e, a
	ldh a, [hQuotient + 2]
	adc d
	ld d, a
	dec hl

.next
	push de
	ld de, $2f
	add hl, de
	pop de
	dec c
	jr nz, .loop2
	ret

.BothSides_CheckNumberMonsAtFullHealth:
	ld hl, wPartyMon1HP
	call .CheckFaintedOrFullHealth
	jr nz, .finish ; we have a pokemon that's neither fainted nor at full health
	ld hl, wOTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $1 ; victory
	ret

.finish
	ld hl, wOTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $0 ; drawn
	ret nz ; we both have pokemon that are neither fainted nor at full health
	ld e, $2 ; defeat
	ld a, $1 ; not drawn
	and a
	ret

.CheckFaintedOrFullHealth:
	ld d, 3
.loop3
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	or b
	jr z, .fainted_or_full_health
	ld a, [hli]
	cp b
	ret nz
	ld a, [hld]
	cp c
	ret nz

.fainted_or_full_health
	push de
	ld de, PARTYMON_STRUCT_LENGTH - 2
	add hl, de
	pop de
	dec d
	jr nz, .loop3
	ret
