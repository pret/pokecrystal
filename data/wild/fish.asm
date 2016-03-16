Fish: ; 92402
; Using a fishing rod.
; Fish for monsters with rod e in encounter group d.
; Return monster e at level d.

	push af
	push bc
	push hl

	ld b, e
	call GetFishGroupIndex

	ld hl, FishGroups
rept 7
	add hl, de
endr
	call .Fish

	pop hl
	pop bc
	pop af
	ret
; 9241a


.Fish: ; 9241a
; Fish for monsters with rod b from encounter data in FishGroup at hl.
; Return monster e at level d.

	call Random
	cp [hl]
	jr nc, .no_bite

	; Get encounter data by rod:
	; 0: Old
	; 1: Good
	; 2: Super
	inc hl
	ld e, b
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Compare the encounter chance to select a Pokemon.
	call Random
.loop
	cp [hl]
	jr z, .ok
	jr c, .ok
rept 3
	inc hl
endr
	jr .loop
.ok
	inc hl

	; Species 0 reads from a time-based encounter table.
	ld a, [hli]
	ld d, a
	and a
	call z, .TimeEncounter

	ld e, [hl]
	ret

.no_bite
	ld de, 0
	ret

.TimeEncounter:
	; The level byte is repurposed as the index for the new table.
	ld e, [hl]
	ld d, 0
	ld hl, TimeFishGroups
rept 4
	add hl, de
endr

	ld a, [TimeOfDay]
	and 3
	cp NITE
	jr c, .time_species
rept 2
	inc hl
endr

.time_species
	ld d, [hl]
	inc hl
	ret
; 9245b


GetFishGroupIndex: ; 9245b
; Return the index of fishgroup d in de.

	push hl
	ld hl, DailyFlags
	bit 2, [hl]
	pop hl
	jr z, .done

	ld a, d
	cp FISHGROUP_QWILFISH
	jr z, .qwilfish
	cp FISHGROUP_REMORAID
	jr z, .remoraid

.done
	dec d
	ld e, d
	ld d, 0
	ret

.qwilfish
	ld a, [wFishingSwarmFlag]
	cp FISHSWARM_QWILFISH
	jr nz, .done
	ld d, FISHGROUP_QWILFISH_SWARM
	jr .done

.remoraid
	ld a, [wFishingSwarmFlag]
	cp FISHSWARM_REMORAID
	jr nz, .done
	ld d, FISHGROUP_REMORAID_SWARM
	jr .done
; 92488


FishGroups:
	dbwww 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	dbwww 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	dbwww 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	dbwww 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	dbwww 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	dbwww 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	dbwww 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	dbwww 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	dbwww 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	dbwww 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	dbwww 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	dbwww 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	dbwww 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super

.Shore_Old: ; 924e3
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.Shore_Good: ; 924ec
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     0, 0
.Shore_Super: ; 924f8
	db  40 percent,     KRABBY,     40
	db  70 percent,     0, 1
	db  90 percent + 1, KRABBY,     40
	db 100 percent,     KINGLER,    40

.Ocean_Old: ; 92504
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Ocean_Good: ; 9250d
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     0, 2
.Ocean_Super: ; 92519
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     0, 3
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Lake_Old: ; 92525
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Lake_Good: ; 9252e
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     0, 4
.Lake_Super: ; 9253a
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     0, 5
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     SEAKING,    40

.Pond_Old: ; 92546
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Pond_Good: ; 9254f
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     0, 6
.Pond_Super: ; 9255b
	db  40 percent,     POLIWAG,    40
	db  70 percent,     0, 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     POLIWAG,    40

.Dratini_Old: ; 92567
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good: ; 92570
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     0, 8
.Dratini_Super: ; 9257c
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     0, 9
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     DRAGONAIR,  40

.Qwilfish_Swarm_Old: ; 92588
	db  70 percent + 1, MAGIKARP,   5
	db  85 percent + 1, MAGIKARP,   5
	db 100 percent,     QWILFISH,   5
.Qwilfish_Swarm_Good: ; 92591
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     QWILFISH,   20
	db  90 percent + 1, QWILFISH,   20
	db 100 percent,     0, 10
.Qwilfish_Swarm_Super: ; 9259d
	db  40 percent,     QWILFISH,   40
	db  70 percent,     0, 11
	db  90 percent + 1, QWILFISH,   40
	db 100 percent,     QWILFISH,   40

.Remoraid_Swarm_Old: ; 925a9
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     REMORAID,   10
.Remoraid_Swarm_Good: ; 925b2
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     REMORAID,   20
	db  90 percent + 1, REMORAID,   20
	db 100 percent,     0, 12
.Remoraid_Swarm_Super: ; 925be
	db  40 percent,     REMORAID,   40
	db  70 percent,     0, 13
	db  90 percent + 1, REMORAID,   40
	db 100 percent,     REMORAID,   40

.Gyarados_Old: ; 925ca
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good: ; 925d3
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     0, 14
.Gyarados_Super: ; 925df
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     0, 15
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     MAGIKARP,   40

.Dratini_2_Old: ; 925eb
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good: ; 925f4
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     MAGIKARP,   10
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     0, 16
.Dratini_2_Super: ; 92600
	db  40 percent,     MAGIKARP,   10
	db  70 percent,     0, 17
	db  90 percent + 1, MAGIKARP,   10
	db 100 percent,     DRAGONAIR,  10

.WhirlIslands_Old: ; 9260c
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.WhirlIslands_Good: ; 92615
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     0, 18
.WhirlIslands_Super: ; 92621
	db  40 percent,     KRABBY,     40
	db  70 percent,     0, 19
	db  90 percent + 1, KINGLER,    40
	db 100 percent,     SEADRA,     40

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old: ; 9262d
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good: ; 92636
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     0, 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super: ; 92642
	db  40 percent,     TENTACOOL,  40
	db  70 percent,     0, 21
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     QWILFISH,   40

.Remoraid_Old: ; 9264e
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Remoraid_Good: ; 92657
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     POLIWAG,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     0, 6
.Remoraid_Super: ; 92663
	db  40 percent,     POLIWAG,    40
	db  70 percent,     0, 7
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     REMORAID,   40
; 9266f


TimeFishGroups: ; 9266f
	;  day              nite
	db CORSOLA,    20,  STARYU,     20
	db CORSOLA,    40,  STARYU,     40
	db SHELLDER,   20,  SHELLDER,   20
	db SHELLDER,   40,  SHELLDER,   40
	db GOLDEEN,    20,  GOLDEEN,    20
	db GOLDEEN,    40,  GOLDEEN,    40
	db POLIWAG,    20,  POLIWAG,    20
	db POLIWAG,    40,  POLIWAG,    40
	db DRATINI,    20,  DRATINI,    20
	db DRATINI,    40,  DRATINI,    40
	db QWILFISH,   20,  QWILFISH,   20
	db QWILFISH,   40,  QWILFISH,   40
	db REMORAID,   20,  REMORAID,   20
	db REMORAID,   40,  REMORAID,   40
	db GYARADOS,   20,  GYARADOS,   20
	db GYARADOS,   40,  GYARADOS,   40
	db DRATINI,    10,  DRATINI,    10
	db DRATINI,    10,  DRATINI,    10
	db HORSEA,     20,  HORSEA,     20
	db HORSEA,     40,  HORSEA,     40
	db TENTACOOL,  20,  TENTACOOL,  20
	db TENTACOOL,  40,  TENTACOOL,  40
; 926c7
