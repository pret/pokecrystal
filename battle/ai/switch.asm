CheckPlayerMoveTypeMatchups: ; 3484e
; Check how well the moves you've already used
; fare against the enemy's Pokemon.  Used to
; score a potential switch.
	push hl
	push de
	push bc
	ld a, 10
	ld [wc716], a
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
	ld a, [wc716]
	dec a
	ld [wc716], a
	ret
; 34939


.IncreaseScore: ; 34939
	ld a, [wc716]
	inc a
	ld [wc716], a
	ret
; 34941

CheckAbleToSwitch: ; 34941
	xor a
	ld [wc717], a
	call CountEnemyAliveMons
	ret c

	ld a, [EnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .no_perish

	ld a, [EnemyPerishCount]
	cp 1
	jr nz, .no_perish

	; Perish count is 1

	call CountEnemyAliveMons
	call Function34b77
	call Function34b20
	call Function34a85

	ld a, e
	cp 2
	jr nz, .not_2

	ld a, [wc716]
	add $30
	ld [wc717], a
	ret

.not_2
	call CountEnemyAliveMons
	sla c
	sla c
	ld b, $ff

.loop1
	inc b
	sla c
	jr nc, .loop1

	ld a, b
	add $30
	ld [wc717], a
	ret

.no_perish

	call CheckPlayerMoveTypeMatchups
	ld a, [wc716]
	cp 11
	ret nc

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_349d2

	call Function34a2a
	ld a, [wc716]
	and a
	jr z, .asm_349d2

	ld c, a
	call Function34aa7
	ld a, [wc716]
	cp $ff
	ret z

	ld b, a
	ld a, e
	cp 2
	jr z, .asm_349be

	call CheckPlayerMoveTypeMatchups
	ld a, [wc716]
	cp 10
	ret nc

	ld a, b
	add $10
	ld [wc717], a
	ret

.asm_349be
	ld c, $10
	call CheckPlayerMoveTypeMatchups
	ld a, [wc716]
	cp 10
	jr nc, .asm_349cc
	ld c, $20

.asm_349cc
	ld a, b
	add c
	ld [wc717], a
	ret

.asm_349d2
	call CheckPlayerMoveTypeMatchups
	ld a, [wc716]
	cp 10
	ret nc

	call CountEnemyAliveMons
	call Function34b77
	call Function34b20
	call Function34a85

	ld a, e
	cp $2
	ret nz

	ld a, [wc716]
	add $10
	ld [wc717], a
	ret
; 349f4


CountEnemyAliveMons: ; 349f4
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
	ld [wc716], a

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

	ld a, [wc716]
	or c
	ld [wc716], a
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
.asm_34a91
	ld a, [hli]
	or [hl]
	jr z, .asm_34a98

	ld a, b
	or c
	ld c, a

.asm_34a98
	srl b
	push bc
	ld bc, PartyMon2HP - (PartyMon1HP + 1)
	add hl, bc
	pop bc
	dec e
	jr nz, .asm_34a91

	ld a, c
	pop bc

	and c
	ld c, a

	; fallthrough
; 34aa7

Function34aa7: ; 34aa7

	ld a, $ff
	ld [wc716], a
	ld hl, OTPartyMon1Moves
	ld b, 1 << (PARTY_LENGTH - 1)
	ld d, 0
	ld e, 0
.asm_34ab5
	ld a, b
	and c
	jr z, .asm_34b00

	push hl
	push bc
	ld b, NUM_MOVES
	ld c, 0
.asm_34abf
	ld a, [hli]
	and a
	push hl
	jr z, .asm_34aef

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34ae9

	inc hl
	call GetMoveByte
	ld hl, BattleMonType1
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp 10
	jr c, .asm_34ae9

	ld e, 1
	cp 11
	jr c, .asm_34ae9

	ld e, 2
	jr .asm_34aef

.asm_34ae9
	pop hl
	dec b
	jr nz, .asm_34abf

	jr .asm_34af0

.asm_34aef
	pop hl
.asm_34af0
	ld a, e
	pop bc
	pop hl
	cp $2
	jr z, .asm_34b0e

	cp $1
	jr nz, .asm_34b00

	ld a, d
	or b
	ld d, a
	jr .asm_34b00

.asm_34b00
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	srl b
	jr nc, .asm_34ab5

	ld a, d
	ld b, a
	and a
	ret z

.asm_34b0e
	push bc
	sla b
	sla b
	ld c, $ff
.asm_34b15
	inc c
	sla b
	jr nc, .asm_34b15

	ld a, c
	ld [wc716], a
	pop bc
	ret
; 34b20


Function34b20: ; 34b20
	push bc
	ld hl, OTPartySpecies
	ld b, 1 << (PARTY_LENGTH - 1)
	ld c, 0

.asm_34b28
	ld a, [hli]
	cp $ff
	jr z, .asm_34b72

	push hl
	ld [CurSpecies], a
	call GetBaseData
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_34b4a

	dec a
	ld hl, Moves + MOVE_POWER
	call GetMoveAttr
	and a
	jr z, .asm_34b4a

	inc hl
	call GetMoveByte
	jr .asm_34b5d

.asm_34b4a
	ld a, [BattleMonType1]
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp $b
	jr nc, .asm_34b6d
	ld a, [BattleMonType2]

.asm_34b5d
	ld hl, BaseType
	call CheckTypeMatchup
	ld a, [wTypeMatchup]
	cp $b
	jr nc, .asm_34b6d

	ld a, b
	or c
	ld c, a

.asm_34b6d
	srl b
	pop hl
	jr .asm_34b28

.asm_34b72
	ld a, c
	pop bc
	and c
	ld c, a
	ret
; 34b77


Function34b77: ; 34b77
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
	srl c
	rl b
	srl c
	rl b
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
