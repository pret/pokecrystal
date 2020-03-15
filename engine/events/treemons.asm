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
	; 70% chance of an encounter
	ld a, 10
	call RandomRange
	cp 7
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
