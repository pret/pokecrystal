TreeMonEncounter:
	farcall StubbedTrainerRankings_TreeEncounters

	xor a
	ld [wTempWildMonSpecies], a
	ld [wCurPartyLevel], a

	ld hl, TreeMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	call GetTreeMon
	jr nc, .no_battle

	ld a, BATTLETYPE_TREE
	ld [wBattleType], a
	ld a, 1
	ld [wScriptVar], a
	ret

.no_battle
	xor a
	ld [wScriptVar], a
	ret

RockMonEncounter:
	xor a
	ld [wTempWildMonSpecies], a
	ld [wCurPartyLevel], a

	ld hl, RockMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	; 40% chance of an encounter
	ld a, 10
	call RandomRange
	cp 4
	jr nc, .no_battle

	call SelectTreeMon
	jr nc, .no_battle

	ret

.no_battle
	xor a
	ret

	db $05 ; ????

GetTreeMonSet:
; Return carry and treemon set in a
; if the current map is in table hl.
	ld a, [wMapNumber]
	ld e, a
	ld a, [wMapGroup]
	ld d, a
.loop
	ld a, [hli]
	cp -1
	jr z, .not_in_table

	cp d
	jr nz, .skip2

	ld a, [hli]
	cp e
	jr nz, .skip1

	jr .in_table

.skip2
	inc hl
.skip1
	inc hl
	jr .loop

.not_in_table
	xor a
	ret

.in_table
	ld a, [hl]
	scf
	ret

INCLUDE "data/wild/treemon_maps.asm"

GetTreeMons:
; Return the address of TreeMon table a in hl.
; Return nc if table a doesn't exist.

	cp NUM_TREEMON_SETS
	jr nc, .quit

	and a
	jr z, .quit

	ld e, a
	ld d, 0
	ld hl, TreeMons
	add hl, de
	add hl, de

	ld a, [hli]
	ld h, [hl]
	ld l, a

	scf
	ret

.quit
	xor a
	ret

INCLUDE "data/wild/treemons.asm"

GetTreeMon:
	push hl
	call GetTreeScore
	pop hl
	and a ; TREEMON_SCORE_BAD
	jr z, .bad
	cp TREEMON_SCORE_GOOD
	jr z, .good
	cp TREEMON_SCORE_RARE
	jr z, .rare
	ret

.bad
	; 10% chance of an encounter
	ld a, 10
	call RandomRange
	and a
	jr nz, NoTreeMon
	jr SelectTreeMon

.good
	; 50% chance of an encounter
	ld a, 10
	call RandomRange
	cp 5
	jr nc, NoTreeMon
	jr SelectTreeMon

.rare
	; 80% chance of an encounter
	ld a, 10
	call RandomRange
	cp 8
	jr nc, NoTreeMon
	jr .skip
.skip
	ld a, [hli]
	cp -1
	jr nz, .skip
	call SelectTreeMon
	ret

SelectTreeMon:
; Read a TreeMons table and pick one monster at random.

	ld a, 100
	call RandomRange
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	ld a, [hli]
	cp -1
	jr z, NoTreeMon

	ld a, [hli]
	ld [wTempWildMonSpecies], a
	ld a, [hl]
	ld [wCurPartyLevel], a
	scf
	ret

NoTreeMon:
	xor a
	ld [wTempWildMonSpecies], a
	ld [wCurPartyLevel], a
	ret

GetTreeScore:
	call .CoordScore
	ld [wTreeMonCoordScore], a
	call .OTIDScore
	ld [wTreeMonOTIDScore], a
	ld c, a
	ld a, [wTreeMonCoordScore]
	sub c
	jr z, .rare
	jr nc, .ok
	add 10
.ok
	cp 5
	jr c, .good

; bad
	xor a ; TREEMON_SCORE_BAD
	ret

.good
	ld a, TREEMON_SCORE_GOOD
	ret

.rare
	ld a, TREEMON_SCORE_RARE
	ret

.CoordScore:
	call GetFacingTileCoord
	ld hl, 0
	ld c, e
	ld b, 0
	ld a, d

	and a
	jr z, .next
.loop
	add hl, bc
	dec a
	jr nz, .loop
.next

	add hl, bc
	ld c, d
	add hl, bc

	ld a, h
	ldh [hDividend], a
	ld a, l
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2
	call Divide

	ldh a, [hQuotient + 2]
	ldh [hDividend], a
	ldh a, [hQuotient + 3]
	ldh [hDividend + 1], a
	ld a, 10
	ldh [hDivisor], a
	ld b, 2
	call Divide

	ldh a, [hRemainder]
	ret

.OTIDScore:
	ld a, [wPlayerID]
	ldh [hDividend], a
	ld a, [wPlayerID + 1]
	ldh [hDividend + 1], a
	ld a, 10
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hRemainder]
	ret
