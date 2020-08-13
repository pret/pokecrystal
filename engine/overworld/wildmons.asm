LoadWildMonData:
	call _GrassWildmonLookup
	jr c, .copy
	ld hl, wMornEncounterRate
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .done_copy

.copy
	inc hl
	inc hl
	ld de, wMornEncounterRate
	ld bc, 3
	call CopyBytes
.done_copy
	call _WaterWildmonLookup
	ld a, 0
	jr nc, .no_copy
	inc hl
	inc hl
	ld a, [hl]
.no_copy
	ld [wWaterEncounterRate], a
	ret

FindNest:
; Parameters:
; e: 0 = Johto, 1 = Kanto
; wNamedObjectIndexBuffer: species
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld a, e
	and a
	jr nz, .kanto
	decoord 0, 0
	ld hl, JohtoGrassWildMons
	call .FindGrass
	ld hl, JohtoWaterWildMons
	call .FindWater
	call .RoamMon1
	call .RoamMon2
	ret

.kanto
	decoord 0, 0
	ld hl, KantoGrassWildMons
	call .FindGrass
	ld hl, KantoWaterWildMons
	jp .FindWater

.FindGrass:
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	inc hl
	inc hl
	ld a, NUM_GRASSMON * 3
	call .SearchMapForMon
	jr nc, .next_grass
	ld [de], a
	inc de

.next_grass
	pop hl
	ld bc, GRASS_WILDDATA_LENGTH
	add hl, bc
	jr .FindGrass

.FindWater:
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	ld a, NUM_WATERMON
	call .SearchMapForMon
	jr nc, .next_water
	ld [de], a
	inc de

.next_water
	pop hl
	ld bc, WATER_WILDDATA_LENGTH
	add hl, bc
	jr .FindWater

.SearchMapForMon:
	inc hl
.ScanMapLoop:
	push af
	ld a, [wNamedObjectIndexBuffer]
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .ScanMapLoop
	and a
	ret

.found
	pop af
	jp .AppendNest

.AppendNest:
	push de
	call GetWorldMapLocation
	ld c, a
	hlcoord 0, 0
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
.AppendNestLoop:
	ld a, [hli]
	cp c
	jr z, .found_nest
	dec de
	ld a, e
	or d
	jr nz, .AppendNestLoop
	ld a, c
	pop de
	scf
	ret

.found_nest
	pop de
	and a
	ret

.RoamMon1:
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon1MapGroup]
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

.RoamMon2:
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

TryWildEncounter::
; Try to trigger a wild encounter.
	call .EncounterRate
	jr nc, .no_battle
	call ChooseWildEncounter
	jr nz, .no_battle
	call CheckRepelEffect
	jr nc, .no_battle
	xor a
	ret

.no_battle
	xor a ; BATTLETYPE_NORMAL
	ld [wTempWildMonSpecies], a
	ld [wBattleType], a
	ld a, 1
	and a
	ret

.EncounterRate:
	call GetMapEncounterRate
	call ApplyMusicEffectOnEncounterRate
	call ApplyCleanseTagEffectOnEncounterRate
	call Random
	cp b
	ret

GetMapEncounterRate:
	ld hl, wMornEncounterRate
	call CheckOnWater
	ld a, wWaterEncounterRate - wMornEncounterRate
	jr z, .ok
	ld a, [wTimeOfDay]
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	ret

ApplyMusicEffectOnEncounterRate::
; Pokemon March and Ruins of Alph signal double encounter rate.
; Pokemon Lullaby halves encounter rate.
	ld a, [wMapMusic]
	cp MUSIC_POKEMON_MARCH
	jr z, .double
	cp MUSIC_RUINS_OF_ALPH_RADIO
	jr z, .double
	cp MUSIC_POKEMON_LULLABY
	ret nz
	srl b
	ret

.double
	sla b
	ret

ApplyCleanseTagEffectOnEncounterRate::
; Cleanse Tag halves encounter rate.
	ld hl, wPartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .cleansetag
	add hl, de
	dec c
	jr nz, .loop
	ret

.cleansetag
	srl b
	ret

ChooseWildEncounter:
	call LoadWildMonDataPointer
	jp nc, .nowildbattle
	call CheckEncounterRoamMon
	jp c, .startwildbattle

	inc hl
	inc hl
	inc hl
	call CheckOnWater
	ld de, WaterMonProbTable
	jr z, .watermon
	inc hl
	inc hl
	ld a, [wTimeOfDay]
	ld bc, NUM_GRASSMON * 2
	call AddNTimes
	ld de, GrassMonProbTable

.watermon
; hl contains the pointer to the wild mon data, let's save that to the stack
	push hl
.randomloop
	call Random
	cp 100
	jr nc, .randomloop
	inc a ; 1 <= a <= 100
	ld b, a
	ld h, d
	ld l, e
; This next loop chooses which mon to load up.
.prob_bracket_loop
	ld a, [hli]
	cp b
	jr nc, .got_it
	inc hl
	jr .prob_bracket_loop

.got_it
	ld c, [hl]
	ld b, 0
	pop hl
	add hl, bc ; this selects our mon
	ld a, [hli]
	ld b, a
; If the Pokemon is encountered by surfing, we need to give the levels some variety.
	call CheckOnWater
	jr nz, .ok
; Check if we buff the wild mon, and by how much.
	call Random
	cp 35 percent
	jr c, .ok
	inc b
	cp 65 percent
	jr c, .ok
	inc b
	cp 85 percent
	jr c, .ok
	inc b
	cp 95 percent
	jr c, .ok
	inc b
; Store the level
.ok
	ld a, b
	ld [wCurPartyLevel], a
	ld b, [hl]
	; ld a, b
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle

	ld a, b ; This is in the wrong place.
	cp UNOWN
	jr nz, .done

	ld a, [wUnlockedUnowns]
	and a
	jr z, .nowildbattle

.done
	jr .loadwildmon

.nowildbattle
	ld a, 1
	and a
	ret

.loadwildmon
	ld a, b
	ld [wTempWildMonSpecies], a

.startwildbattle
	xor a
	ret

INCLUDE "data/wild/probabilities.asm"

CheckRepelEffect::
; If there is no active Repel, there's no need to be here.
	ld a, [wRepelEffect]
	and a
	jr z, .encounter
; Get the first Pokemon in your party that isn't fainted.
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop

.ok
; to PartyMonLevel
rept 4
	dec hl
endr

	ld a, [wCurPartyLevel]
	cp [hl]
	jr nc, .encounter
	and a
	ret

.encounter
	scf
	ret

LoadWildMonDataPointer:
	call CheckOnWater
	jr z, _WaterWildmonLookup

_GrassWildmonLookup:
	ld hl, SwarmGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoGrassWildMons
	ld de, KantoGrassWildMons
	call _JohtoWildmonCheck
	ld bc, GRASS_WILDDATA_LENGTH
	jr _NormalWildmonOK

_WaterWildmonLookup:
	ld hl, SwarmWaterWildMons
	ld bc, WATER_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoWaterWildMons
	ld de, KantoWaterWildMons
	call _JohtoWildmonCheck
	ld bc, WATER_WILDDATA_LENGTH
	jr _NormalWildmonOK

_JohtoWildmonCheck:
	call IsInJohto
	and a
	ret z
	ld h, d
	ld l, e
	ret

_SwarmWildmonCheck:
	call CopyCurrMapDE
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_DUNSPARCE_SWARM_F, [hl]
	pop hl
	jr z, .CheckYanma
	ld a, [wDunsparceMapGroup]
	cp d
	jr nz, .CheckYanma
	ld a, [wDunsparceMapNumber]
	cp e
	jr nz, .CheckYanma
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

.CheckYanma:
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_YANMA_SWARM_F, [hl]
	pop hl
	jr z, _NoSwarmWildmon
	ld a, [wYanmaMapGroup]
	cp d
	jr nz, _NoSwarmWildmon
	ld a, [wYanmaMapNumber]
	cp e
	jr nz, _NoSwarmWildmon
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

_NoSwarmWildmon:
	and a
	ret

_NormalWildmonOK:
	call CopyCurrMapDE
	jr LookUpWildmonsForMapDE

CopyCurrMapDE:
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	ret

LookUpWildmonsForMapDE:
.loop
	push hl
	ld a, [hl]
	inc a
	jr z, .nope
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .yup

.next
	pop hl
	add hl, bc
	jr .loop

.nope
	pop hl
	and a
	ret

.yup
	pop hl
	scf
	ret

InitRoamMons:
; initialize wRoamMon structs

; species
	ld a, RAIKOU
	ld [wRoamMon1Species], a
	ld a, ENTEI
	ld [wRoamMon2Species], a

; level
	ld a, 40
	ld [wRoamMon1Level], a
	ld [wRoamMon2Level], a

; raikou starting map
	ld a, GROUP_ROUTE_42
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_42
	ld [wRoamMon1MapNumber], a

; entei starting map
	ld a, GROUP_ROUTE_37
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_37
	ld [wRoamMon2MapNumber], a

; hp
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ld [wRoamMon2HP], a

	ret

CheckEncounterRoamMon:
	push hl
; Don't trigger an encounter if we're on water.
	call CheckOnWater
	jr z, .DontEncounterRoamMon
; Load the current map group and number to de
	call CopyCurrMapDE
; Randomly select a beast.
	call Random
	cp 100 ; 25/64 chance
	jr nc, .DontEncounterRoamMon
	and %00000011 ; Of that, a 3/4 chance.  Running total: 75/256, or around 29.3%.
	jr z, .DontEncounterRoamMon
	dec a ; 1/3 chance that it's Entei, 1/3 chance that it's Raikou
; Compare its current location with yours
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, 7 ; length of the roam_struct
	call AddNTimes
	ld a, d
	cp [hl]
	jr nz, .DontEncounterRoamMon
	inc hl
	ld a, e
	cp [hl]
	jr nz, .DontEncounterRoamMon
; We've decided to take on a beast, so stage its information for battle.
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [wTempWildMonSpecies], a
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [wBattleType], a

	pop hl
	scf
	ret

.DontEncounterRoamMon:
	pop hl
	and a
	ret

UpdateRoamMons:
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.Finished:
	jp _BackUpMapIndices

.Update:
	ld hl, RoamMaps
.loop
; Are we at the end of the table?
	ld a, [hl]
	cp -1
	ret z
; Is this the correct entry?
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, c
	cp [hl]
	jr z, .yes
; We don't have the correct entry yet, so let's continue.  A 0 terminates each entry.
.next
	ld a, [hli]
	and a
	jr nz, .next
	jr .loop

; We have the correct entry now, so let's choose a random map from it.
.yes
	inc hl
	ld d, h
	ld e, l
.update_loop
	ld h, d
	ld l, e
; Choose which map to warp to.
	call Random
	and %00011111 ; 1/8n chance it moves to a completely random map, where n is the number of roaming connections from the current map.
	jr z, JumpRoamMon
	and %11
	cp [hl]
	jr nc, .update_loop ; invalid index, try again
	inc hl
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [wRoamMons_LastMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wRoamMons_LastMapNumber]
	cp [hl]
	jr z, .update_loop
	dec hl

.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

JumpRoamMons:
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	call JumpRoamMon
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	call JumpRoamMon
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .Finished
	call JumpRoamMon
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.Finished:
	jp _BackUpMapIndices

JumpRoamMon:
.loop
	ld hl, RoamMaps
.innerloop1
	; 0-15 are all valid indexes into RoamMaps,
	; so this retry loop is unnecessary
	; since NUM_ROAMMON_MAPS happens to be 16
	call Random
	maskbits NUM_ROAMMON_MAPS
	cp NUM_ROAMMON_MAPS
	jr nc, .innerloop1
	inc a
	ld b, a
.innerloop2 ; Loop to get hl to the address of the chosen roam map.
	dec b
	jr z, .ok
.innerloop3 ; Loop to skip the current roam map, which is terminated by a 0.
	ld a, [hli]
	and a
	jr nz, .innerloop3
	jr .innerloop2
; Check to see if the selected map is the one the player is currently in.  If so, try again.
.ok
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr z, .loop
	dec hl
; Return the map group and number in bc.
.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

_BackUpMapIndices:
	ld a, [wRoamMons_CurMapNumber]
	ld [wRoamMons_LastMapNumber], a
	ld a, [wRoamMons_CurMapGroup]
	ld [wRoamMons_LastMapGroup], a
	ld a, [wMapNumber]
	ld [wRoamMons_CurMapNumber], a
	ld a, [wMapGroup]
	ld [wRoamMons_CurMapGroup], a
	ret

INCLUDE "data/wild/roammon_maps.asm"

ValidateTempWildMonSpecies:
; Due to a development oversight, this function is called with the wild Pokemon's level, not its species, in a.
	and a
	jr z, .nowildmon ; = 0
	cp NUM_POKEMON + 1 ; 252
	jr nc, .nowildmon ; >= 252
	and a ; 1 <= Species <= 251
	ret

.nowildmon
	scf
	ret

; Finds a rare wild Pokemon in the route of the trainer calling, then checks if it's been Seen already.
; The trainer will then tell you about the Pokemon if you haven't seen it.
RandomUnseenWildMon:
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .GetGrassmon
	ld hl, KantoGrassWildMons
	call LookUpWildmonsForMapDE
	jr nc, .done

.GetGrassmon:
	push hl
	ld bc, 5 + 4 * 2 ; Location of the level of the 5th wild Pokemon in that map
	add hl, bc
	ld a, [wTimeOfDay]
	ld bc, NUM_GRASSMON * 2
	call AddNTimes
.randloop1
	call Random
	and %11
	jr z, .randloop1
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
; We now have the pointer to one of the last (rarest) three wild Pokemon found in that area.
	inc hl
	ld c, [hl] ; Contains the species index of this rare Pokemon
	pop hl
	ld de, 5 + 0 * 2
	add hl, de
	inc hl ; Species index of the most common Pokemon on that route
	ld b, 4
.loop2
	ld a, [hli]
	cp c ; Compare this most common Pokemon with the rare one stored in c.
	jr z, .done
	inc hl
	dec b
	jr nz, .loop2
; This Pokemon truly is rare.
	push bc
	dec c
	ld a, c
	call CheckSeenMon
	pop bc
	jr nz, .done
; Since we haven't seen it, have the caller tell us about it.
	ld de, wStringBuffer1
	call CopyName1
	ld a, c
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .JustSawSomeRareMonText
	call PrintText
	xor a
	ld [wScriptVar], a
	ret

.done
	ld a, $1
	ld [wScriptVar], a
	ret

.JustSawSomeRareMonText:
	text_far _JustSawSomeRareMonText
	text_end

RandomPhoneWildMon:
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, JohtoGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .ok
	ld hl, KantoGrassWildMons
	call LookUpWildmonsForMapDE

.ok
	ld bc, 5 + 0 * 2
	add hl, bc
	ld a, [wTimeOfDay]
	inc a
	ld bc, NUM_GRASSMON * 2
.loop
	dec a
	jr z, .done
	add hl, bc
	jr .loop

.done
	call Random
	and %11
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

RandomPhoneMon:
; Get a random monster owned by the trainer who's calling.
	farcall GetCallerLocation
	ld hl, TrainerGroups
	ld a, d
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(TrainerGroups)
	call GetFarHalfword

.skip_trainer
	dec e
	jr z, .skipped
.skip
	ld a, BANK(Trainers)
	call GetFarByte
	inc hl
	cp -1
	jr nz, .skip
	jr .skip_trainer
.skipped

.skip_name
	ld a, BANK(Trainers)
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name

	ld a, BANK(Trainers)
	call GetFarByte
	inc hl
	ld bc, 2 ; level, species
	cp TRAINERTYPE_NORMAL
	jr z, .got_mon_length
	ld bc, 2 + NUM_MOVES ; level, species, moves
	cp TRAINERTYPE_MOVES
	jr z, .got_mon_length
	ld bc, 2 + 1 ; level, species, item
	cp TRAINERTYPE_ITEM
	jr z, .got_mon_length
	; TRAINERTYPE_ITEM_MOVES
	ld bc, 2 + 1 + NUM_MOVES ; level, species, item, moves
.got_mon_length

	ld e, 0
	push hl
.count_mon
	inc e
	add hl, bc
	ld a, BANK(Trainers)
	call GetFarByte
	cp -1
	jr nz, .count_mon
	pop hl

.rand
	call Random
	maskbits PARTY_LENGTH
	cp e
	jr nc, .rand

	inc a
.get_mon
	dec a
	jr z, .got_mon
	add hl, bc
	jr .get_mon
.got_mon

	inc hl ; species
	ld a, BANK(Trainers)
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

INCLUDE "data/wild/johto_grass.asm"
INCLUDE "data/wild/johto_water.asm"
INCLUDE "data/wild/kanto_grass.asm"
INCLUDE "data/wild/kanto_water.asm"
INCLUDE "data/wild/swarm_grass.asm"
INCLUDE "data/wild/swarm_water.asm"
