FishAction: ; 92402
; Using a fishing rod.
; Fish for monsters with rod e in encounter group d.
; Return monster e at level d.

	push af
	push bc
	push hl

; Get the fishing group for this map.
	ld b, e
	call GetFishGroupHeader

	ld hl, FishGroupHeaders
rept 7
	add hl, de
endr

	call Fish

	pop hl
	pop bc
	pop af
	ret
; 9241a


Fish: ; 9241a
; Grandfathered from Red.

; Fish for monsters with rod b from encounter data in FishGroup at hl.
; Return monster e at level d.

	call Random

; Got a bite?
	cp [hl]
	jr nc, .NoBite

; Get encounter data by rod:
; 	0: Old
; 	1: Good
; 	2: Super
	inc hl
	ld e, b
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

; Encounter chance for this monster:
	call Random

.CheckEncounter
	cp [hl]
	jr z, .ReadMon
	jr c, .ReadMon

; Next monster...
rept 3
	inc hl
endr
	jr .CheckEncounter

.ReadMon
; We're done with the encounter chance
	inc hl

; Species 0 triggers a read from a time-based encounter table.
	ld a, [hli]
	ld d, a
	and a
	call z, .TimeEncounter

; Level
	ld e, [hl]
	ret

.NoBite
	ld de, 0
	ret

.TimeEncounter

; The level byte is repurposed as the index for the new table.
	ld e, [hl]
	ld d, 0
	ld hl, TimeFishGroups
rept 4
	add hl, de
endr

; One nightmon, then one daymon
	ld a, [TimeOfDay]
	and 3
	cp NITE
	jr c, .TimeSpecies
rept 2
	inc hl
endr

.TimeSpecies
	ld d, [hl]
	inc hl
	ret
; 9245b




GetFishGroupHeader: ; 9245b
; Return fishing encounter group header d in de.

	push hl
	ld hl, DailyFlags
	bit 2, [hl]
	pop hl
	jr z, .end

; Groups 11 and 12 have special attributes.
	ld a, d
	cp 11
	jr z, .group11
	cp 12
	jr z, .group12

.end
	dec d
	ld e, d
	ld d, 0
	ret

.group11
	ld a, [wdfce]
	cp 1
	jr nz, .end
	ld d, 6
	jr .end

.group12
	ld a, [wdfce]
	cp 2
	jr nz, .end
	ld d, 7
	jr .end
; 92488


FishGroupHeaders:

FishGroup1Header: ; 92488
	db $80 ; 50%
	dw FishGroup1_Old
	dw FishGroup1_Good
	dw FishGroup1_Super

FishGroup2Header: ; 9248f
	db $80 ; 50%
	dw FishGroup2_Old
	dw FishGroup2_Good
	dw FishGroup2_Super

FishGroup3Header: ; 92496
	db $80 ; 50%
	dw FishGroup3_Old
	dw FishGroup3_Good
	dw FishGroup3_Super

FishGroup4Header: ; 9249d
	db $80 ; 50%
	dw FishGroup4_Old
	dw FishGroup4_Good
	dw FishGroup4_Super

FishGroup5Header: ; 924a4
	db $80 ; 50%
	dw FishGroup5_Old
	dw FishGroup5_Good
	dw FishGroup5_Super

FishGroup6Header: ; 924ab
	db $80 ; 50%
	dw FishGroup6_Old
	dw FishGroup6_Good
	dw FishGroup6_Super

FishGroup7Header: ; 924b2
	db $80 ; 50%
	dw FishGroup7_Old
	dw FishGroup7_Good
	dw FishGroup7_Super

FishGroup8Header: ; 924b9
	db $80 ; 50%
	dw FishGroup8_Old
	dw FishGroup8_Good
	dw FishGroup8_Super

FishGroup9Header: ; 924c0
	db $80 ; 50%
	dw FishGroup9_Old
	dw FishGroup9_Good
	dw FishGroup9_Super

FishGroup10Header: ; 924c7
	db $80 ; 50%
	dw FishGroup10_Old
	dw FishGroup10_Good
	dw FishGroup10_Super

FishGroup11Header: ; 924ce
	db $80 ; 50%
	dw FishGroup11_Old
	dw FishGroup11_Good
	dw FishGroup11_Super

FishGroup12Header: ; 924d5
	db $80 ; 50%
	dw FishGroup12_Old
	dw FishGroup12_Good
	dw FishGroup12_Super

FishGroup13Header: ; 924dc
	db $80 ; 50%
	dw FishGroup11_Old
	dw FishGroup11_Good
	dw FishGroup11_Super

FishGroup1:
FishGroup1_Old: ; 924e3
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, KRABBY,     10
FishGroup1_Good: ; 924ec
	db $59, MAGIKARP,   20
	db $b2, KRABBY,     20
	db $e6, KRABBY,     20
	db $ff, $0,         0
FishGroup1_Super: ; 924f8
	db $66, KRABBY,     40
	db $b2, $0,         1
	db $e6, KRABBY,     40
	db $ff, KINGLER,    40

FishGroup2:
FishGroup2_Old: ; 92504
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, TENTACOOL,  10
FishGroup2_Good: ; 9250d
	db $59, MAGIKARP,   20
	db $b2, TENTACOOL,  20
	db $e6, CHINCHOU,   20
	db $ff, $0,         2
FishGroup2_Super: ; 92519
	db $66, CHINCHOU,   40
	db $b2, $0,         3
	db $e6, TENTACRUEL, 40
	db $ff, LANTURN,    40

FishGroup3:
FishGroup3_Old: ; 92525
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, GOLDEEN,    10
FishGroup3_Good: ; 9252e
	db $59, MAGIKARP,   20
	db $b2, GOLDEEN,    20
	db $e6, GOLDEEN,    20
	db $ff, $0,         4
FishGroup3_Super: ; 9253a
	db $66, GOLDEEN,    40
	db $b2, $0,         5
	db $e6, MAGIKARP,   40
	db $ff, SEAKING,    40

FishGroup4:
FishGroup4_Old: ; 92546
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, POLIWAG,    10
FishGroup4_Good: ; 9254f
	db $59, MAGIKARP,   20
	db $b2, POLIWAG,    20
	db $e6, POLIWAG,    20
	db $ff, $0,         6
FishGroup4_Super: ; 9255b
	db $66, POLIWAG,    40
	db $b2, $0,         7
	db $e6, MAGIKARP,   40
	db $ff, POLIWAG,    40

FishGroup5:
FishGroup5_Old: ; 92567
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup5_Good: ; 92570
	db $59, MAGIKARP,   20
	db $b2, MAGIKARP,   20
	db $e6, MAGIKARP,   20
	db $ff, $0,         8
FishGroup5_Super: ; 9257c
	db $66, MAGIKARP,   40
	db $b2, $0,         9
	db $e6, MAGIKARP,   40
	db $ff, DRAGONAIR,  40

FishGroup6:
FishGroup6_Old: ; 92588
	db $b3, MAGIKARP,   5
	db $d9, MAGIKARP,   5
	db $ff, QWILFISH,   5
FishGroup6_Good: ; 92591
	db $59, MAGIKARP,   20
	db $b2, QWILFISH,   20
	db $e6, QWILFISH,   20
	db $ff, $0,         10
FishGroup6_Super: ; 9259d
	db $66, QWILFISH,   40
	db $b2, $0,         11
	db $e6, QWILFISH,   40
	db $ff, QWILFISH,   40

FishGroup7:
FishGroup7_Old: ; 925a9
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, REMORAID,   10
FishGroup7_Good: ; 925b2
	db $59, MAGIKARP,   20
	db $b2, REMORAID,   20
	db $e6, REMORAID,   20
	db $ff, $0,         12
FishGroup7_Super: ; 925be
	db $66, REMORAID,   40
	db $b2, $0,         13
	db $e6, REMORAID,   40
	db $ff, REMORAID,   40

FishGroup8:
FishGroup8_Old: ; 925ca
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup8_Good: ; 925d3
	db $59, MAGIKARP,   20
	db $b2, MAGIKARP,   20
	db $e6, MAGIKARP,   20
	db $ff, $0,         14
FishGroup8_Super: ; 925df
	db $66, MAGIKARP,   40
	db $b2, $0,         15
	db $e6, MAGIKARP,   40
	db $ff, MAGIKARP,   40

FishGroup9:
FishGroup9_Old: ; 925eb
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, MAGIKARP,   10
FishGroup9_Good: ; 925f4
	db $59, MAGIKARP,   10
	db $b2, MAGIKARP,   10
	db $e6, MAGIKARP,   10
	db $ff, $0,         16
FishGroup9_Super: ; 92600
	db $66, MAGIKARP,   10
	db $b2, $0,         17
	db $e6, MAGIKARP,   10
	db $ff, DRAGONAIR,  10

FishGroup10:
FishGroup10_Old: ; 9260c
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, KRABBY,     10
FishGroup10_Good: ; 92615
	db $59, MAGIKARP,   20
	db $b2, KRABBY,     20
	db $e6, KRABBY,     20
	db $ff, $0,         18
FishGroup10_Super: ; 92621
	db $66, KRABBY,     40
	db $b2, $0,         19
	db $e6, KINGLER,    40
	db $ff, SEADRA,     40

FishGroup11:
FishGroup11_Old: ; 9262d
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, TENTACOOL,  10
FishGroup11_Good: ; 92636
	db $59, MAGIKARP,   20
	db $b2, TENTACOOL,  20
	db $e6, TENTACOOL,  20
	db $ff, $0,         20
FishGroup11_Super: ; 92642
	db $66, TENTACOOL,  40
	db $b2, $0,         21
	db $e6, MAGIKARP,   40
	db $ff, QWILFISH,   40

FishGroup12:
FishGroup12_Old: ; 9264e
	db $b3, MAGIKARP,   10
	db $d9, MAGIKARP,   10
	db $ff, POLIWAG,    10
FishGroup12_Good: ; 92657
	db $59, MAGIKARP,   20
	db $b2, POLIWAG,    20
	db $e6, POLIWAG,    20
	db $ff, $0,         6
FishGroup12_Super: ; 92663
	db $66, POLIWAG,    40
	db $b2, $0,         7
	db $e6, MAGIKARP,   40
	db $ff, REMORAID,   40

; 9266f

TimeFishGroups: ; 9266f
; 0
	db CORSOLA,    20 ; nite
	db STARYU,     20 ; day
; 1
	db CORSOLA,    40 ; nite
	db STARYU,     40 ; day
; 2
	db SHELLDER,   20 ; nite
	db SHELLDER,   20 ; day
; 3
	db SHELLDER,   40 ; nite
	db SHELLDER,   40 ; day
; 4
	db GOLDEEN,    20 ; nite
	db GOLDEEN,    20 ; day
; 5
	db GOLDEEN,    40 ; nite
	db GOLDEEN,    40 ; day
; 6
	db POLIWAG,    20 ; nite
	db POLIWAG,    20 ; day
; 7
	db POLIWAG,    40 ; nite
	db POLIWAG,    40 ; day
; 8
	db DRATINI,    20 ; nite
	db DRATINI,    20 ; day
; 9
	db DRATINI,    40 ; nite
	db DRATINI,    40 ; day
; 10
	db QWILFISH,   20 ; nite
	db QWILFISH,   20 ; day
; 11
	db QWILFISH,   40 ; nite
	db QWILFISH,   40 ; day
; 12
	db REMORAID,   20 ; nite
	db REMORAID,   20 ; day
; 13
	db REMORAID,   40 ; nite
	db REMORAID,   40 ; day
; 14
	db GYARADOS,   20 ; nite
	db GYARADOS,   20 ; day
; 15
	db GYARADOS,   40 ; nite
	db GYARADOS,   40 ; day
; 16
	db DRATINI,    10 ; nite
	db DRATINI,    10 ; day
; 17
	db DRATINI,    10 ; nite
	db DRATINI,    10 ; day
; 18
	db HORSEA,     20 ; nite
	db HORSEA,     20 ; day
; 19
	db HORSEA,     40 ; nite
	db HORSEA,     40 ; day
; 20
	db TENTACOOL,  20 ; nite
	db TENTACOOL,  20 ; day
; 21
	db TENTACOOL,  40 ; nite
	db TENTACOOL,  40 ; day

; 926c7
