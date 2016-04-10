CheckPlayerMoveTypeMatchups: ; 3484e
; Check how well the moves you've already used
; fare against the enemy's Pokemon.  Used to
; score a potential switch.
	push hl
	push de
	push bc
	ld a, 10
	ld [wEnemyAISwitchScore], a
	ld hl, PlayerUsedMoves
	ld a, [hl]
	and a
	jr z, .unknown_moves

	ld d, NUM_MOVES
	ld e, 0
.loop
	ld a, [hli]
	and a
	jr z, .exit
	push hl
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .next

	inc hl
	call GetMoveByte
	ld hl, EnemyMonType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10 + 1 ; 1.0 + 0.1
	jr nc, .super_effective
	and a
	jr z, .next
	cp 10 ; 1.0
	jr nc, .neutral

.not_very_effective
	ld a, e
	cp 1 ; 0.1
	jr nc, .next
	ld e, 1
	jr .next

.neutral
	ld e, 2
	jr .next

.super_effective
	call .DecreaseScore
	pop hl
	jr .done

.next
	pop hl
	dec d
	jr nz, .loop

.exit
	ld a, e
	cp 2
	jr z, .done
	call .IncreaseScore
	ld a, e
	and a
	jr nz, .done
	call .IncreaseScore
	jr .done

.unknown_moves
	ld a, [BattleMonType1]
	ld b, a
	ld hl, EnemyMonType1
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .ok
	call .DecreaseScore
.ok
	ld a, [BattleMonType2]
	cp b
	jr z, .ok2
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10 + 1 ; 1.0 + 0.1
	jr c, .ok2
	call .DecreaseScore
.ok2

.done
	call .CheckEnemyMoveMatchups
	pop bc
	pop de
	pop hl
	ret
; 348de


.CheckEnemyMoveMatchups: ; 348de
	ld de, EnemyMonMoves
	ld b, NUM_MOVES + 1
	ld c, 0

	ld a, [wTypeMatchup]
	push af
.loop2
	dec b
	jr z, .exit2

	ld a, [de]
	and a
	jr z, .exit2

	inc de
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .loop2

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call CheckTypeMatchup

	ld a, [wTypeMatchup]
	; immune
	and a
	jr z, .loop2

	; not very effective
	inc c
	cp 10
	jr c, .loop2

	; neutral
rept 5
	inc c
endr
	cp 10
	jr z, .loop2

	; super effective
	ld c, 100
	jr .loop2

.exit2
	pop af
	ld [wTypeMatchup], a

	ld a, c
	and a
	jr z, .doubledown ; double down
	cp 5
	jr c, .DecreaseScore ; down
	cp 100
	ret c
	jr .IncreaseScore ; up

.doubledown
	call .DecreaseScore

	; fallthrough
; 34931


.DecreaseScore: ; 34931
	ld a, [wEnemyAISwitchScore]
	dec a
	ld [wEnemyAISwitchScore], a
	ret
; 34939


.IncreaseScore: ; 34939
	ld a, [wEnemyAISwitchScore]
	inc a
	ld [wEnemyAISwitchScore], a
	ret
; 34941

CheckAbleToSwitch: ; 34941
	xor a
	ld [wEnemySwitchMonParam], a
	call FindAliveEnemyMons
	ret c

	ld a, [EnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_perish

	ld a, [EnemyPerishCount]
	cp 1
	jr nz, .no_perish

	; Perish count is 1

	call FindAliveEnemyMons
	call FindEnemyMonsWithEnoughHP
	call FindEnemyMonsThatResistPlayer
	call Function34a85

	ld a, e
	cp 2
	jr nz, .not_2

	ld a, [wEnemyAISwitchScore]
	add $30
	ld [wEnemySwitchMonParam], a
	ret

.not_2
	call FindAliveEnemyMons
	sla c
	sla c
	ld b, $ff

.loop1
	inc b
	sla c
	jr nc, .loop1

	ld a, b
	add $30
	ld [wEnemySwitchMonParam], a
	ret

.no_perish

	call CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 11
	ret nc

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .no_last_counter_move

	call Function34a2a
	ld a, [wEnemyAISwitchScore]
	and a
	jr z, .no_last_counter_move

	ld c, a
	call Function34aa7
	ld a, [wEnemyAISwitchScore]
	cp $ff
	ret z

	ld b, a
	ld a, e
	cp 2
	jr z, .not_2_again

	call CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10
	ret nc

	ld a, b
	add $10
	ld [wEnemySwitchMonParam], a
	ret

.not_2_again
	ld c, $10
	call CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10
	jr nc, .okay
	ld c, $20

.okay
	ld a, b
	add c
	ld [wEnemySwitchMonParam], a
	ret

.no_last_counter_move
	call CheckPlayerMoveTypeMatchups
	ld a, [wEnemyAISwitchScore]
	cp 10
	ret nc

	call FindAliveEnemyMons
	call FindEnemyMonsWithEnoughHP
	call FindEnemyMonsThatResistPlayer
	call Function34a85

	ld a, e
	cp $2
	ret nz

	ld a, [wEnemyAISwitchScore]
	add $10
	ld [wEnemySwitchMonParam], a
	ret
; 349f4


FindAliveEnemyMons: ; 349f4
	ld a, [OTPartyCount]
	cp 2
	jr c, .only_one

	ld d, a
	ld e, 0
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
	ld hl, OTPartyMon1HP

.loop
	ld a, [CurOTMon]
	cp e
	jr z, .next

	push bc
	ld b, [hl]
	inc hl
	ld a, [hld]
	or b
	pop bc
	jr z, .next

	ld a, c
	or b
	ld c, a

.next
	srl b
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc e
	dec d
	jr nz, .loop

	ld a, c
	and a
	jr nz, .more_than_one

.only_one
	scf
	ret

.more_than_one
	and a
	ret
; 34a2a


Function34a2a: ; 34a2a
	ld hl, OTPartyMon1
	ld a, [OTPartyCount]
	ld b, a
	ld c, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	xor a
	ld [wEnemyAISwitchScore], a

.asm_34a39
	ld a, [CurOTMon]
	cp d
	push hl
	jr z, .asm_34a77

	push hl
	push bc
	ld bc, MON_HP
	add hl, bc
	pop bc
	ld a, [hli]
	or [hl]
	pop hl
	jr z, .asm_34a77

	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34a77

	inc hl
	call GetMoveByte
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	jr nz, .asm_34a77

	ld a, [wEnemyAISwitchScore]
	or c
	ld [wEnemyAISwitchScore], a
.asm_34a77
	pop hl
	dec b
	ret z

	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc

	inc d
	srl c
	jr .asm_34a39
; 34a85


Function34a85: ; 34a85
	push bc
	ld a, [OTPartyCount]
	ld e, a
	ld hl, OTPartyMon1HP
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
.loop
	ld a, [hli]
	or [hl]
	jr z, .next

	ld a, b
	or c
	ld c, a

.next
	srl b
	push bc
	ld bc, PartyMon2HP - (PartyMon1HP + 1)
	add hl, bc
	pop bc
	dec e
	jr nz, .loop

	ld a, c
	pop bc

	and c
	ld c, a

	; fallthrough
; 34aa7

Function34aa7: ; 34aa7

	ld a, $ff
	ld [wEnemyAISwitchScore], a
	ld hl, OTPartyMon1Moves
	ld b, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	ld e, 0
.loop
	ld a, b
	and c
	jr z, .next

	push hl
	push bc
	ld b, NUM_MOVES
	ld c, 0
.loop3
	ld a, [hli]
	and a
	push hl
	jr z, .break3

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .nope

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10
	jr c, .nope

	ld e, 1
	cp 10 + 1
	jr c, .nope

	ld e, 2
	jr .break3

.nope
	pop hl
	dec b
	jr nz, .loop3

	jr .done

.break3
	pop hl
.done
	ld a, e
	pop bc
	pop hl
	cp $2
	jr z, .done2

	cp $1
	jr nz, .next

	ld a, d
	or b
	ld d, a
	jr .next

.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	srl b
	jr nc, .loop

	ld a, d
	ld b, a
	and a
	ret z

.done2
	push bc
	sla b
	sla b
	ld c, $ff
.loop2
	inc c
	sla b
	jr nc, .loop2

	ld a, c
	ld [wEnemyAISwitchScore], a
	pop bc
	ret
; 34b20


FindEnemyMonsThatResistPlayer: ; 34b20
	push bc
	ld hl, OTPartySpecies
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0

.loop
	ld a, [hli]
	cp $ff
	jr z, .done

	push hl
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .skip_move

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .skip_move

	inc hl
	call GetMoveByte
	jr .check_type

.skip_move
	ld a, [BattleMonType1]
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10 + 1
	jr nc, .dont_choose_mon
	ld a, [BattleMonType2]

.check_type
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10 + 1
	jr nc, .dont_choose_mon

	ld a, b
	or c
	ld c, a

.dont_choose_mon
	srl b
	pop hl
	jr .loop

.done
	ld a, c
	pop bc
	and c
	ld c, a
	ret
; 34b77


FindEnemyMonsWithEnoughHP: ; 34b77
	push bc
	ld de, OTPartySpecies
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0
	ld hl, OTPartyMon1HP

.loop
	ld a, [de]
	inc de
	cp $ff
	jr z, .done

	push hl
	push bc
	ld b, [hl]
	inc hl
	ld c, [hl]
rept 2
	inc hl
endr
; hl = MaxHP + 1
; b = (4 * b) % $100 + (c & 3)
; c = c / 4
	srl c
	rl b
	srl c
	rl b
; a = (MaxHP / $100) - b - (1 if c > (MaxHP % $100) else 0)
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	jr nc, .next

	ld a, b
	or c
	ld c, a

.next
	srl b
	pop hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	jr .loop

.done
	ld a, c
	pop bc
	and c
	ld c, a
	ret
; 34bb1
