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
	inc c
	inc c
	inc c
	inc c
	inc c
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
	call FindEnemyMonsWithAtLeastQuarterMaxHP
	call FindEnemyMonsThatResistPlayer
	call FindAliveEnemyMonsWithASuperEffectiveMove

	ld a, e
	cp 2
	jr nz, .not_2

	ld a, [wEnemyAISwitchScore]
	add $30 ; maximum chance
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
	add $30 ; maximum chance
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

	call FindEnemyMonsImmuneToLastCounterMove
	ld a, [wEnemyAISwitchScore]
	and a
	jr z, .no_last_counter_move

	ld c, a
	call FindEnemyMonsWithASuperEffectiveMove
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
	call FindEnemyMonsWithAtLeastQuarterMaxHP
	call FindEnemyMonsThatResistPlayer
	call FindAliveEnemyMonsWithASuperEffectiveMove

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


FindEnemyMonsImmuneToLastCounterMove: ; 34a2a
	ld hl, OTPartyMon1
	ld a, [OTPartyCount]
	ld b, a
	ld c, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	xor a
	ld [wEnemyAISwitchScore], a

.loop
	ld a, [CurOTMon]
	cp d
	push hl
	jr z, .next

	push hl
	push bc

	; If the Pokemon has at least 1 HP...
	ld bc, MON_HP
	add hl, bc
	pop bc
	ld a, [hli]
	or [hl]
	pop hl
	jr z, .next

	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData

	; the enemy's last move is damaging...
	ld a, [LastEnemyCounterMove]
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .next

	; and the Pokemon is immune to it...
	inc hl
	call GetMoveByte
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	jr nz, .next

	; ... encourage that Pokemon.
	ld a, [wEnemyAISwitchScore]
	or c
	ld [wEnemyAISwitchScore], a
.next
	pop hl
	dec b
	ret z

	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc

	inc d
	srl c
	jr .loop
; 34a85


FindAliveEnemyMonsWithASuperEffectiveMove: ; 34a85
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
FindEnemyMonsWithASuperEffectiveMove: ; 34aa7

	ld a, -1
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
	; for move on mon:
	ld b, NUM_MOVES
	ld c, 0
.loop3
	; if move is None: break
	ld a, [hli]
	and a
	push hl
	jr z, .break3

	; if move has no power: continue
	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .nope

	; check type matchups
	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call CheckTypeMatchup

	; if immune or not very effective: continue
	ld a, [wTypeMatchup]
	cp 10
	jr c, .nope

	; if neutral: load 1 and continue
	ld e, 1
	cp 10 + 1
	jr c, .nope

	; if super-effective: load 2 and break
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
	cp 2
	jr z, .done2 ; at least one move is super-effective
	cp 1
	jr nz, .next ; no move does more than half damage

	; encourage this pokemon
	ld a, d
	or b
	ld d, a
	jr .next ; such a long jump

.next
	; next pokemon?
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	srl b
	jr nc, .loop

	; if no pokemon has a super-effective move: return
	ld a, d
	ld b, a
	and a
	ret z

.done2
	; convert the bit flag to an int and return
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


FindEnemyMonsWithAtLeastQuarterMaxHP: ; 34b77
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
	inc hl
	inc hl
; hl = MaxHP + 1
; bc = [CurHP] * 4
	srl c
	rl b
	srl c
	rl b
; if bc >= [hl], encourage
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
