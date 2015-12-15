INCLUDE "includes.asm"

SECTION "bank1", ROMX, BANK[$1]

PlaceWaitingText:: ; 4000
	hlcoord 3, 10
	ld b, 1
	ld c, 11

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .proceed

.notinbattle
	predef Predef_LinkTextbox

.proceed
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames
; 4025

.Waiting ; 4025
	db "Waiting...!@"
; 4031

LoadPushOAM:: ; 4031
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret
; 403f

PushOAM: ; 403f
	ld a, Sprites / $100
	ld [rDMA], a
	ld a, 40
.loop
	dec a
	jr nz, .loop
	ret
PushOAMEnd
; 4049

INCLUDE "engine/map_objects.asm"

INCLUDE "engine/intro_menu.asm"

Function6454:: ; 6454
	call DelayFrame
	ld a, [hOAMUpdate]
	push af

	ld a, $1
	ld [hOAMUpdate], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	call Function6473

	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ld hl, VramState
	set 6, [hl]
	ret
; 6473

Function6473: ; 6473
	xor a
	ld [hLCDStatCustom], a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	call OverworldTextModeSwitch
	ld a, VBGMap1 / $100
	call Function64b9
	call Function2e20
	callba LoadOW_BGPal7
	callba Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	callba Function64db ; no need to farcall
	ld a, VBGMap0 / $100
	call Function64b9
	xor a
	ld [wBGMapAnchor], a
	ld a, VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call Function5958
	ret
; 64b9

Function64b9: ; 64b9
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ret
; 64bf

Function64bf:: ; 64bf
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	call Function64cd

	pop af
	ld [hOAMUpdate], a
	ret
; 64cd

Function64cd: ; 64cd
	call LoadFontsExtra
	ld a, $90
	ld [hWY], a
	call Function2e31
	call LoadStandardFont
	ret
; 64db

Function64db: ; 64db
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, $60
	ld hl, wBackupTilemap
	lb bc, 4, 0
	call ByteFill
	ld a, wBackupTilemap / $100
	ld [rHDMA1], a
	ld a, wBackupTilemap % $100
	ld [rHDMA2], a
	ld a, (VBGMap0 % $8000) / $100
	ld [rHDMA3], a
	ld a, (VBGMap0 % $8000) % $100
	ld [rHDMA4], a
	ld a, $3f
	ld [hDMATransfer], a
	call DelayFrame

	pop af
	ld [rSVBK], a
	ret
; 6508

INCLUDE "engine/learn.asm"

CheckNickErrors:: ; 669f
; error-check monster nick before use
; must be a peace offering to gamesharkers

; input: de = nick location

	push bc
	push de
	ld b, PKMN_NAME_LENGTH

.checkchar
; end of nick?
	ld a, [de]
	cp "@" ; terminator
	jr z, .end

; check if this char is a text command
	ld hl, .textcommands
	dec hl
.loop
; next entry
	inc hl
; reached end of commands table?
	ld a, [hl]
	cp a, -1
	jr z, .done

; is the current char between this value (inclusive)...
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
; ...and this one?
	cp [hl]
	jr nc, .loop

; replace it with a "?"
	ld a, "?"
	ld [de], a
	jr .loop

.done
; next char
	inc de
; reached end of nick without finding a terminator?
	dec b
	jr nz, .checkchar

; change nick to "?@"
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.end
; if the nick has any errors at this point it's out of our hands
	pop de
	pop bc
	ret
; 66cf

.textcommands ; 66cf
; table defining which characters are actually text commands
; format:
	;      ≥           <
	db "<START>",  $04       + 1
	db "<PLAY_G>", $18       + 1
	db $1d,        "%"       + 1
	db $35,        "<GREEN>" + 1
	db "<ENEMY>",  "<ENEMY>" + 1
	db $49,        "<TM>"    + 1
	db "<ROCKET>", "┘"       + 1
	db -1 ; end
; 66de

INCLUDE "engine/math.asm"

ItemAttributes: ; 67c1
INCLUDE "items/item_attributes.asm"
; 6ec1
INCLUDE "engine/npc_movement.asm"

GetFirstPokemonHappiness: ; 718d
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartySpecies
.loop
	ld a, [de]
	cp EGG
	jr nz, .done
	inc de
	add hl, bc
	jr .loop

.done
	ld [wd265], a
	ld a, [hl]
	ld [ScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3
; 71ac

CheckFirstMonIsEgg: ; 71ac
	ld a, [PartySpecies]
	ld [wd265], a
	cp EGG
	ld a, $1
	jr z, .egg
	xor a

.egg
	ld [ScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3
; 71c2

ChangeHappiness: ; 71c2
; Perform happiness action c on CurPartyMon

	ld a, [CurPartyMon]
	inc a
	ld e, a
	ld d, 0
	ld hl, PartySpecies - 1
	add hl, de
	ld a, [hl]
	cp EGG
	ret z

	push bc
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	pop bc

	ld d, h
	ld e, l

	push de
	ld a, [de]
	cp 100
	ld e, 0
	jr c, .ok
	inc e
	cp 200
	jr c, .ok
	inc e

.ok
	dec c
	ld b, 0
	ld hl, .Actions
rept 3
	add hl, bc
endr
	ld d, 0
	add hl, de
	ld a, [hl]
	cp 100
	pop de

	ld a, [de]
	jr nc, .negative
	add [hl]
	jr nc, .done
	ld a, -1
	jr .done

.negative
	add [hl]
	jr c, .done
	xor a

.done
	ld [de], a
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [CurPartyMon]
	ld b, a
	ld a, [wd0d8]
	cp b
	ret nz
	ld a, [de]
	ld [BattleMonHappiness], a
	ret
; 7221

.Actions
	db  +5,  +3,  +2 ; Gained a level
	db  +5,  +3,  +2 ; Vitamin
	db  +1,  +1,  +0 ; X Item
	db  +3,  +2,  +1 ; Battled a Gym Leader
	db  +1,  +1,  +0 ; Learned a move
	db  -1,  -1,  -1 ; Lost to an enemy
	db  -5,  -5, -10 ; Fainted due to poison
	db  -5,  -5, -10 ; Lost to a much stronger enemy
	db  +1,  +1,  +1 ; Haircut (Y1)
	db  +3,  +3,  +1 ; Haircut (Y2)
	db  +5,  +5,  +2 ; Haircut (Y3)
	db  +1,  +1,  +1 ; Haircut (O1)
	db  +3,  +3,  +1 ; Haircut (O2)
	db +10, +10,  +4 ; Haircut (O3)
	db  -5,  -5, -10 ; Used Heal Powder or Energypowder (bitter)
	db -10, -10, -15 ; Used Energy Root (bitter)
	db -15, -15, -20 ; Used Revival Herb (bitter)
	db  +3,  +3,  +1 ; Grooming
	db +10,  +6,  +4 ; Gained a level in the place where it was caught
; 725a

StepHappiness:: ; 725a
; Raise the party's happiness by 1 point every other step cycle.

	ld hl, wdc77
	ld a, [hl]
	inc a
	and 1
	ld [hl], a
	ret nz

	ld de, PartyCount
	ld a, [de]
	and a
	ret z

	ld c, a
	ld hl, PartyMon1Happiness
.loop
	inc de
	ld a, [de]
	cp EGG
	jr z, .next
	inc [hl]
	jr nz, .next
	ld [hl], $ff

.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec c
	jr nz, .loop
	ret
; 7282

DaycareStep:: ; 7282

	ld a, [wDaycareMan]
	bit 0, a
	jr z, .daycare_lady

	ld a, [wBreedMon1Level] ; level
	cp 100
	jr nc, .daycare_lady
	ld hl, wBreedMon1Exp + 2 ; exp
	inc [hl]
	jr nz, .daycare_lady
	dec hl
	inc [hl]
	jr nz, .daycare_lady
	dec hl
	inc [hl]
	ld a, [hl]
	cp 5242880 / $10000
	jr c, .daycare_lady
	ld a, 5242880 / $10000
	ld [hl], a

.daycare_lady
	ld a, [wDaycareLady]
	bit 0, a
	jr z, .check_egg

	ld a, [wBreedMon2Level] ; level
	cp 100
	jr nc, .check_egg
	ld hl, wBreedMon2Exp + 2 ; exp
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	jr nz, .check_egg
	dec hl
	inc [hl]
	ld a, [hl]
	cp 5242880 / $10000
	jr c, .check_egg
	ld a, 5242880 / $10000
	ld [hl], a

.check_egg
	ld hl, wDaycareMan
	bit 5, [hl] ; egg
	ret z
	ld hl, wStepsToEgg
	dec [hl]
	ret nz

	call Random
	ld [hl], a
	callab CheckBreedmonCompatibility
	ld a, [wd265]
	cp 230
	ld b, -1 + 32 percent
	jr nc, .okay
	ld a, [wd265]
	cp 170
	ld b, 16 percent
	jr nc, .okay
	ld a, [wd265]
	cp 110
	ld b, 12 percent
	jr nc, .okay
	ld b, 4 percent

.okay
	call Random
	cp b
	ret nc
	ld hl, wDaycareMan
	res 5, [hl]
	set 6, [hl]
	ret
; 7305

SpecialGiveShuckle: ; 7305

; Adding to the party.
	xor a
	ld [MonType], a

; Level 15 Shuckle.
	ld a, SHUCKLE
	ld [CurPartySpecies], a
	ld a, 15
	ld [CurPartyLevel], a

	predef TryAddMonToParty
	jr nc, .NotGiven

; Caught data.
	ld b, 0
	callba SetGiftPartyMonCaughtData

; Holding a Berry.
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	dec a
	push af
	push bc
	ld hl, PartyMon1Item
	call AddNTimes
	ld [hl], BERRY
	pop bc
	pop af

; OT ID.
	ld hl, PartyMon1ID
	call AddNTimes
	ld a, $2
	ld [hli], a
	ld [hl], $6

; Nickname.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld de, SpecialShuckleNick
	call CopyName2

; OT.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
	call CopyName2

; Engine flag for this event.
	ld hl, DailyFlags
	set 5, [hl]
; setflag ENGINE_SHUCKLE_GIVEN
	ld a, 1
	ld [ScriptVar], a
	ret

.NotGiven
	xor a
	ld [ScriptVar], a
	ret

SpecialShuckleOT:
	db "MANIA@"
SpecialShuckleNick:
	db "SHUCKIE@"
; 737e

SpecialReturnShuckle: ; 737e
	callba SelectMonFromParty
	jr c, .refused

	ld a, [CurPartySpecies]
	cp SHUCKLE
	jr nz, .DontReturn

	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

; OT ID
; 00518
	ld a, [hli]
	cp 00518 / $100
	jr nz, .DontReturn
	ld a, [hl]
	cp 00518 % $100
	jr nz, .DontReturn

; OT
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
.CheckOT
	ld a, [de]
	cp [hl]
	jr nz, .DontReturn
	cp "@"
	jr z, .done
	inc de
	inc hl
	jr .CheckOT

.done
	callba CheckCurPartyMonFainted
	jr c, .fainted
	ld a, [CurPartyMon]
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp 150
	ld a, $3
	jr nc, .HappyToStayWithYou
	xor a ; take from pc
	ld [wPokemonWithdrawDepositParameter], a
	callab RemoveMonFromPartyOrBox
	ld a, $2
.HappyToStayWithYou
	ld [ScriptVar], a
	ret

.refused
	ld a, $1
	ld [ScriptVar], a
	ret

.DontReturn
	xor a
	ld [ScriptVar], a
	ret

.fainted
	ld a, $4
	ld [ScriptVar], a
	ret
; 73f7

Special_BillsGrandfather: ; 73f7
	callba SelectMonFromParty
	jr c, .cancel
	ld a, [CurPartySpecies]
	ld [ScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [ScriptVar], a
	ret
; 7413

Special_YoungerHaircutBrother: ; 7413
	ld hl, Data_YoungerHaircutBrother
	jr MassageOrHaircut

Special_OlderHaircutBrother: ; 7418
	ld hl, Data_OlderHaircutBrother
	jr MassageOrHaircut

Special_DaisyMassage: ; 741d
	ld hl, Data_DaisyMassage

MassageOrHaircut: ; 7420
	push hl
	callba SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	call GetCurNick
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
; Bug: Subtracting $ff from $ff fails to set c.
; This can result in overflow into the next data array.
; In the case of getting a massage from Daisy, we bleed
; into CopyPokemonName_Buffer1_Buffer3, which passes
; $d0 to ChangeHappiness and returns $73 to the script.
; The end result is that there is a 0.4% chance your
; Pokemon's happiness will not change at all.
.loop
	sub [hl]
	jr c, .ok
rept 3
	inc hl
endr
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [ScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

.nope
	xor a
	ld [ScriptVar], a
	ret

.egg
	ld a, 1
	ld [ScriptVar], a
	ret
; 7459

Data_YoungerHaircutBrother: ; 7459
	db $4c, 2, HAPPINESS_YOUNGCUT1 ; 30% chance
	db $80, 3, HAPPINESS_YOUNGCUT2 ; 20% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 50% chance

Data_OlderHaircutBrother: ; 7462
	db $9a, 2, HAPPINESS_OLDERCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_OLDERCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 30% chance

Data_DaisyMassage: ; 746b
	db $ff, 2, HAPPINESS_MASSAGE ; 99.6% chance
; 746e

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, StringBuffer1
	ld de, StringBuffer3
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
; 747a

Predef1: ; 747a
; not used
	ret
; 747b

SECTION "bank2", ROMX, BANK[$2]

Function8000: ; 8000
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, TileMapEnd - TileMap
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, AttrMapEnd - AttrMap
	ld a, $7
	call ByteFill
	call WaitBGMap2
	call SetPalettes
	ret
; 8029

GetSpawnCoord: ; 8029
	ld a, -1
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ld a, $0
	ld hl, PlayerObjectTemplate
	call Function19a6
	ld b, $0
	call PlayerSpawn_ConvertCoords
	ld a, $0
	call GetMapObject
	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ln e, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a
	jr nz, .ok
	ld a, [PlayerGender]
	bit 0, a
	jr z, .ok
	ln e, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT

.ok
	ld [hl], e
	ld a, $0
	ld [hMapObjectIndexBuffer], a
	ld bc, MapObjects
	ld a, $0
	ld [hObjectStructIndexBuffer], a
	ld de, ObjectStructs
	call CopyMapObjectToObjectStruct
	ld a, PLAYER
	ld [wCenteredObject], a
	ret
; 8071

PlayerObjectTemplate: ; 8071
; A dummy map object used to initialize the player object.
; Shorter than the actual amount copied by two bytes.
; Said bytes seem to be unused.
	person_event SPRITE_CHRIS, -4, -4, SPRITEMOVEDATA_PLAYER, 15, 15, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
; 807e

CopyDECoordsToMapObject:: ; 807e
	push de
	ld a, b
	call GetMapObject
	pop de
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld [hl], d
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hl], e
	ret
; 808f

PlayerSpawn_ConvertCoords: ; 808f
	push bc
	ld a, [XCoord]
	add 4
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	pop bc
	call CopyDECoordsToMapObject
	ret
; 80a1

WritePersonXY:: ; 80a1
	ld a, b
	call CheckObjectVisibility
	ret c

	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [hMapObjectIndexBuffer]
	ld b, a
	call CopyDECoordsToMapObject
	and a
	ret
; 80b8

RefreshPlayerCoords: ; 80b8
	ld a, [XCoord]
	add 4
	ld d, a
	ld hl, PlayerNextMapX
	sub [hl]
	ld [hl], d
	ld hl, MapObjects + MAPOBJECT_X_COORD
	ld [hl], d
	ld hl, PlayerMapX
	ld [hl], d
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	ld hl, PlayerNextMapY
	sub [hl]
	ld [hl], e
	ld hl, MapObjects + MAPOBJECT_Y_COORD
	ld [hl], e
	ld hl, PlayerMapY
	ld [hl], e
	ld e, a
	ld a, [wObjectFollow_Leader]
	cp $0
	ret nz ; wtf
	ret
; 80e7

CopyObjectStruct:: ; 80e7
	call CheckObjectMask
	and a
	ret nz ; masked

	ld hl, ObjectStructs + OBJECT_STRUCT_LENGTH * 1
	ld a, 1
	ld de, OBJECT_STRUCT_LENGTH
.loop
	ld [hObjectStructIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .done
	add hl, de
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	scf
	ret ; overflow

.done
	ld d, h
	ld e, l
	call CopyMapObjectToObjectStruct
	ld hl, VramState
	bit 7, [hl]
	ret z

	ld hl, OBJECT_FLAGS2
	add hl, de
	set 5, [hl]
	ret
; 8116

CopyMapObjectToObjectStruct: ; 8116
	call .CopyMapObjectToTempObject
	call CopyTempObjectToObjectStruct
	ret
; 811d

.CopyMapObjectToTempObject: ; 811d
	ld a, [hObjectStructIndexBuffer]
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld [hl], a

	ld a, [hMapObjectIndexBuffer]
	ld [wTempObjectCopyMapObjectIndex], a

	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopySprite], a

	call GetSpriteVTile
	ld [wTempObjectCopySpriteVTile], a

	ld a, [hl]
	call GetSpritePalette
	ld [wTempObjectCopyPalette], a

	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .skip_color_override
	swap a
	and $7 ; OAM_PALETTE
	ld [wTempObjectCopyPalette], a

.skip_color_override
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyMovement], a

	ld hl, MAPOBJECT_RANGE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRange], a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyX], a

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyY], a

	ld hl, MAPOBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRadius], a
	ret
; 8177

InitializeVisibleSprites: ; 8177
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next

	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next

	ld a, [XCoord]
	ld d, a
	ld a, [YCoord]
	ld e, a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next

	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next

	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next

	push bc
	call CopyObjectStruct
	pop bc
	jp c, .ret

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 81c9

.ret: ; 81c9
	ret
; 81ca

Function81ca:: ; 81ca
	nop
	ld a, [wPlayerStepDirection]
	cp $ff
	ret z
	ld hl, .jumptable
	rst JumpTable
	ret
; 81d6

.jumptable: ; 81d6
	dw Function81e5
	dw Function81de
	dw Function8232
	dw Function8239
; 81de

Function81de: ; 81de
	ld a, [YCoord]
	sub $1
	jr Function81ea

Function81e5: ; 81e5
	ld a, [YCoord]
	add $9

Function81ea: ; 81ea
	ld d, a
	ld a, [XCoord]
	ld e, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .next
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 8232

Function8232: ; 8232
	ld a, [XCoord]
	sub 1
	jr Function823e

Function8239: ; 8239
	ld a, [XCoord]
	add $a

Function823e: ; 823e
	ld e, a
	ld a, [YCoord]
	ld d, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, e
	cp [hl]
	jr nz, .next
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 8286

CopyTempObjectToObjectStruct: ; 8286
	ld a, [wTempObjectCopyMapObjectIndex]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopyMovement]
	call CopySpriteMovementData

	ld a, [wTempObjectCopyPalette]
	ld hl, OBJECT_PALETTE
	add hl, de
	or [hl]
	ld [hl], a

	ld a, [wTempObjectCopyY]
	call .InitYCoord

	ld a, [wTempObjectCopyX]
	call .InitXCoord

	ld a, [wTempObjectCopySprite]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopySpriteVTile]
	ld hl, OBJECT_SPRITE_TILE
	add hl, de
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00

	ld hl, OBJECT_FACING_STEP
	add hl, de
	ld [hl], STANDING

	ld a, [wTempObjectCopyRadius]
	call .InitRadius

	ld a, [wTempObjectCopyRange]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a

	and a
	ret
; 82d5

.InitYCoord: ; 82d5
	ld hl, OBJECT_INIT_Y
	add hl, de
	ld [hl], a

	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], a

	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14d
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ret
; 82f1

.InitXCoord: ; 82f1
	ld hl, OBJECT_INIT_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], a
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14c
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ret
; 830d

.InitRadius: ; 830d
	ld h, a
	inc a
	and $f
	ld l, a
	ld a, h
	add $10
	and $f0
	or l
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], a
	ret
; 831e

TrainerWalkToPlayer: ; 831e
	ld a, [hLastTalked]
	call InitMovementBuffer
	ld a, movement_step_sleep_1
	call AppendToMovementBuffer
	ld a, [wd03f]
	dec a
	jr z, .TerminateStep
	ld a, [hLastTalked]
	ld b, a
	ld c, PLAYER
	ld d, 1
	call .GetPathToPlayer
	call DecrementMovementBufferCount

.TerminateStep
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret
; 8341

.GetPathToPlayer: ; 8341
	push de
	push bc
; get player object struct, load to de
	ld a, c
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld d, b
	ld e, c

; get last talked object struct, load to bc
	pop bc
	ld a, b
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct

; get last talked coords, load to bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

; get player coords, load to de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld e, [hl]
	ld d, a

	pop af
	call ComputePathToWalkToPlayer
	ret
; 8379

Special_SurfStartStep: ; 8379
	call InitMovementBuffer
	call .GetMovementData
	call AppendToMovementBuffer
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret
; 8388

.GetMovementData: ; 8388
	ld a, [PlayerDirection]
	srl a
	srl a
	and 3
	ld e, a
	ld d, 0
	ld hl, .movement_data
	add hl, de
	ld a, [hl]
	ret
; 839a

.movement_data
	slow_step_down
	slow_step_up
	slow_step_left
	slow_step_right
; 839e

FollowNotExact:: ; 839e
	push bc
	ld a, c
	call CheckObjectVisibility
	ld d, b
	ld e, c
	pop bc
	ret c

	ld a, b
	call CheckObjectVisibility
	ret c

; Person 2 is now in bc, person 1 is now in de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	cp b
	jr z, .same_x
	jr c, .to_the_left
	inc b
	jr .continue

.to_the_left
	dec b
	jr .continue

.same_x
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld a, [hl]
	cp c
	jr z, .continue
	jr c, .below
	inc c
	jr .continue

.below
	dec c

.continue
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], b
	ld a, b
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14c
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14d
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ld a, [hObjectStructIndexBuffer]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld [hl], SPRITEMOVEDATA_FOLLOWNOTEXACT
	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00
	ret
; 8417

GetRelativeFacing:: ; 8417
; Determines which way map object e would have to turn to face map object d.  Returns carry if it's impossible for whatever reason.
	ld a, d
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld d, a
	ld a, e
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld e, a
	call .GetFacing_e_relativeto_d
	ret

.carry
	scf
	ret
; 8439

.GetFacing_e_relativeto_d: ; 8439
; Determines which way object e would have to turn to face object d.  Returns carry if it's impossible.
; load the coordinates of object d into bc
	ld a, d
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a
	push bc
; load the coordinates of object e into de
	ld a, e
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop bc
; |x1 - x2|
	ld a, b
	sub d
	jr z, .same_x_1
	jr nc, .b_right_of_d_1
	cpl
	inc a

.b_right_of_d_1
; |y1 - y2|
	ld h, a
	ld a, c
	sub e
	jr z, .same_y_1
	jr nc, .c_below_e_1
	cpl
	inc a

.c_below_e_1
; |y1 - y2| - |x1 - x2|
	sub h
	jr c, .same_y_1

.same_x_1
; compare the y coordinates
	ld a, c
	cp e
	jr z, .same_x_and_y
	jr c, .c_directly_below_e
; c directly above e
	ld d, DOWN
	and a
	ret

.c_directly_below_e
	ld d, UP
	and a
	ret

.same_y_1
	ld a, b
	cp d
	jr z, .same_x_and_y
	jr c, .b_directly_right_of_d
; b directly left of d
	ld d, RIGHT
	and a
	ret

.b_directly_right_of_d
	ld d, LEFT
	and a
	ret

.same_x_and_y
	scf
	ret
; 848a

Function848a: ; 848a
	call Function849d
	jr c, .same
	ld [wd4d1], a
	xor a
	ld [wd4d0], a
	ret

.same
	ld a, -1
	ld [wd4d0], a
	ret
; 849d

Function849d: ; 849d
	ld a, [wObjectFollow_Leader]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [wObjectFollow_Follower]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr z, .check_y
	jr c, .left
	and a
	ld a, $c + RIGHT
	ret

.left
	and a
	ld a, $c + LEFT
	ret

.check_y
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, e
	cp [hl]
	jr z, .same_xy
	jr c, .up
	and a
	ld a, $c + DOWN
	ret

.up
	and a
	ld a, $c + UP
	ret

.same_xy
	scf
	ret
; 84d9

_Sine:: ; 84d9
; A simple sine function.
; Return d * sin(e) in hl.

; e is a signed 6-bit value.
	ld a, e
	and %111111
	cp  %100000
	jr nc, .negative

	call .ApplySineWave
	ld a, h
	ret

.negative
	and %011111
	call .ApplySineWave
	ld a, h
	xor -1
	inc a
	ret
; 84ef

.ApplySineWave: ; 84ef
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0

; Factor amplitude
.multiply
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret
; 850b

.sinewave: ; 850b
; A $20-word table representing a sine wave.
; 90 degrees is index $10 at a base amplitude of $100.
	sine_wave $100
; 854b

INCLUDE "engine/predef.asm"

INCLUDE "engine/color.asm"

SECTION "bank3", ROMX, BANK[$3]

CheckTime:: ; c000
	ld a, [TimeOfDay]
	ld hl, TimeOfDayTable
	ld de, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c

	xor a
	ld c, a
	ret
; c012

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db NITE, 1 << NITE
	db -1
; c01b

INCLUDE "engine/specials.asm"

_PrintNum:: ; c4c7
; Print c digits of the b-byte value from de to hl.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNum.
; Some extra flags can be given in bits 5-7 of b.
; Bit 5: money if set (unless left-aligned without leading zeros)
; Bit 6: right-aligned if set
; Bit 7: print leading zeros if set

	push bc

	bit 5, b
	jr z, .main
	bit 7, b
	jr nz, .moneyflag
	bit 6, b
	jr z, .main

.moneyflag ; 101xxxxx or 011xxxxx
	ld a, "¥"
	ld [hli], a
	res 5, b ; 100xxxxx or 010xxxxx

.main
	xor a
	ld [hPrintNum1], a
	ld [hPrintNum2], a
	ld [hPrintNum3], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
; maximum 3 bytes
.long
	ld a, [de]
	ld [hPrintNum2], a
	inc de
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.word
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.byte
	ld a, [de]
	ld [hPrintNum4], a

.start
	push de

	ld d, b
	ld a, c
	swap a
	and $f
	ld e, a
	ld a, c
	and $f
	ld b, a
	ld c, 0
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	cp 5
	jr z, .five
	cp 6
	jr z, .six

.seven
	ld a, 1000000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 1000000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 1000000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.six
	ld a, 100000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 100000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 100000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.five
	xor a
	ld [hPrintNum5], a
	ld a, 10000 / $100
	ld [hPrintNum6], a
	ld a, 10000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.four
	xor a
	ld [hPrintNum5], a
	ld a, 1000 / $100
	ld [hPrintNum6], a
	ld a, 1000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.three
	xor a
	ld [hPrintNum5], a
	xor a
	ld [hPrintNum6], a
	ld a, 100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.two
	dec e
	jr nz, .two_skip
	ld a, "0"
	ld [hPrintNum1], a
.two_skip

	ld c, 0
	ld a, [hPrintNum4]
.mod_10
	cp 10
	jr c, .modded_10
	sub 10
	inc c
	jr .mod_10
.modded_10

	ld b, a
	ld a, [hPrintNum1]
	or c
	jr nz, .money
	call .PrintLeadingZero
	jr .money_leading_zero

.money
	call .PrintYen
	push af
	ld a, "0"
	add c
	ld [hl], a
	pop af
	ld [hPrintNum1], a
	inc e
	dec e
	jr nz, .money_leading_zero
	inc hl
	ld [hl], $f2 ; XXX

.money_leading_zero
	call .AdvancePointer
	call .PrintYen
	ld a, "0"
	add b
	ld [hli], a

	pop de
	pop bc
	ret
; c5ba

.PrintYen: ; c5ba
	push af
	ld a, [hPrintNum1]
	and a
	jr nz, .stop
	bit 5, d
	jr z, .stop
	ld a, "¥"
	ld [hli], a
	res 5, d

.stop
	pop af
	ret
; c5cb

.PrintDigit: ; c5cb (3:45cb)
	dec e
	jr nz, .ok
	ld a, "0"
	ld [hPrintNum1], a
.ok
	ld c, 0
.loop
	ld a, [hPrintNum5]
	ld b, a
	ld a, [hPrintNum2]
	ld [$ffba], a
	cp b
	jr c, .skip1
	sub b
	ld [hPrintNum2], a
	ld a, [hPrintNum6]
	ld b, a
	ld a, [hPrintNum3]
	ld [hPrintNum9], a
	cp b
	jr nc, .skip2
	ld a, [hPrintNum2]
	or 0
	jr z, .skip3
	dec a
	ld [hPrintNum2], a
	ld a, [hPrintNum3]
.skip2
	sub b
	ld [hPrintNum3], a
	ld a, [hPrintNum7]
	ld b, a
	ld a, [hPrintNum4]
	ld [hPrintNum10], a
	cp b
	jr nc, .skip4
	ld a, [hPrintNum3]
	and a
	jr nz, .skip5
	ld a, [hPrintNum2]
	and a
	jr z, .skip6
	dec a
	ld [hPrintNum2], a
	xor a
.skip5
	dec a
	ld [hPrintNum3], a
	ld a, [hPrintNum4]
.skip4
	sub b
	ld [hPrintNum4], a
	inc c
	jr .loop
.skip6
	ld a, [hPrintNum9]
	ld [hPrintNum3], a
.skip3
	ld a, [$ffba]
	ld [hPrintNum2], a
.skip1
	ld a, [hPrintNum1]
	or c
	jr z, .PrintLeadingZero
	ld a, [hPrintNum1]
	and a
	jr nz, .done
	bit 5, d
	jr z, .done
	ld a, $f0
	ld [hli], a
	res 5, d
.done
	ld a, "0"
	add c
	ld [hl], a
	ld [hPrintNum1], a
	inc e
	dec e
	ret nz
	inc hl
	ld [hl], $f2
	ret

.PrintLeadingZero: ; c644
; prints a leading zero unless they are turned off in the flags
	bit 7, d ; print leading zeroes?
	ret z
	ld [hl], "0"
	ret

.AdvancePointer: ; c64a
; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
	bit 7, d ; print leading zeroes?
	jr nz, .inc
	bit 6, d ; left alignment or right alignment?
	jr z, .inc
	ld a, [hPrintNum1]
	and a
	ret z
.inc
	inc hl
	ret
; c658

HealParty: ; c658
	xor a
	ld [CurPartyMon], a
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr z, .next

	push hl
	call HealPartyMon
	pop hl

.next
	ld a, [CurPartyMon]
	inc a
	ld [CurPartyMon], a
	jr .loop

.done
	ret
; c677

HealPartyMon: ; c677
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld d, h
	ld e, l

	ld hl, MON_STATUS
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a

	ld hl, MON_MAXHP
	add hl, de

	; bc = MON_HP
	ld b, h
	ld c, l
rept 2
	dec bc
endr

	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a

	callba RestoreAllPP
	ret
; c699

ComputeHPBarPixels: ; c699
; bc * (6 * 8) / de
	ld a, b
	or c
	jr z, .zero
	push hl
	xor a
	ld [hMultiplicand + 0], a
	ld a, b
	ld [hMultiplicand + 1], a
	ld a, c
	ld [hMultiplicand + 2], a
	ld a, 6 * 8
	ld [hMultiplier], a
	call Multiply
	; We need de to be under 256 because hDivisor is only 1 byte.
	ld a, d
	and a
	jr z, .divide
	; divide de and hProduct by 4
	srl d
	rr e
	srl d
	rr e
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	srl b
	rr a
	srl b
	rr a
	ld [hDividend + 3], a
	ld a, b
	ld [hDividend + 2], a
.divide
	ld a, e
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 2]
	ld e, a
	pop hl
	and a
	ret nz
	ld e, 1
	ret

.zero
	ld e, 0
	ret
; c6e0

AnimateHPBar: ; c6e0
	call WaitBGMap
	call _AnimateHPBar
	call WaitBGMap
	ret
; c6ea

ClearBuffer1: ; c6ea
	xor a
	ld hl, Buffer1
	ld bc, 7
	call ByteFill
	ret
; c6f5

FieldMoveJumptable: ; c6f5
	ld a, [Buffer1]
	rst JumpTable
	ld [Buffer1], a
	bit 7, a
	jr nz, .okay
	and a
	ret

.okay
	and $7f
	scf
	ret
; c706

GetPartyNick: ; c706
; write CurPartyMon nickname to StringBuffer1-3
	ld hl, PartyMonNicknames
	ld a, BOXMON
	ld [MonType], a
	ld a, [CurPartyMon]
	call GetNick
	call CopyName1
; copy text from StringBuffer2 to StringBuffer3
	ld de, StringBuffer2
	ld hl, StringBuffer3
	call CopyName2
	ret
; c721

CheckEngineFlag: ; c721
; Check engine flag de
; Return carry if flag is not set
	ld b, CHECK_FLAG
	callba EngineFlagAction
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret
; c731

CheckBadge: ; c731
; Check engine flag a (ENGINE_ZEPHYRBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and return carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	ld hl, .BadgeRequiredText
	call MenuTextBoxBackup ; push text to queue
	scf
	ret
; c73d

.BadgeRequiredText: ; c73d
	; Sorry! A new BADGE
	; is required.
	text_jump _BadgeRequiredText
	db "@"
; c742

CheckPartyMove: ; c742
; Check if a monster in your party has move d.

	ld e, 0
	xor a
	ld [CurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no
	cp a, -1
	jr z, .no
	cp a, EGG
	jr z, .next

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [CurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret
; c779

FieldMoveFailed: ; c779
	ld hl, .CantUseHere
	call MenuTextBoxBackup
	ret
; c780

.CantUseHere: ; 0xc780
	; Can't use that here.
	text_jump UnknownText_0x1c05c8
	db "@"
; 0xc785

CutFunction: ; c785
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; c796

.Jumptable: ; c796 (3:4796)
	jumptable_start
	jumptable .CheckAble
	jumptable .DoCut
	jumptable .FailCut

.CheckAble: ; c79c (3:479c)
	ld de, ENGINE_HIVEBADGE
	call CheckBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	ld a, $1
	ret

.nohivebadge
	ld a, $80
	ret

.nothingtocut
	ld a, $2
	ret

.DoCut: ; c7b2 (3:47b2)
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, $81
	ret

.FailCut: ; c7bb (3:47bb)
	ld hl, Text_NothingToCut
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_UsedCut: ; 0xc7c4
	; used CUT!
	text_jump UnknownText_0x1c05dd
	db "@"
; 0xc7c9

Text_NothingToCut: ; 0xc7c9
	; There's nothing to CUT here.
	text_jump UnknownText_0x1c05ec
	db "@"
; 0xc7ce

CheckMapForSomethingToCut: ; c7ce
	; Does the collision data of the facing tile permit cutting?
	call GetFacingTileCoord
	ld c, a
	push de
	callba CheckCutCollision
	pop de
	jr nc, .fail
	; Get the location of the current block in OverworldMap.
	call GetBlockLocation
	ld c, [hl]
	; See if that block contains something that can be cut.
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	; Back up the OverworldMap address to Buffer3
	ld a, l
	ld [Buffer3], a
	ld a, h
	ld [Buffer4], a
	; Back up the replacement tile to Buffer5
	ld a, b
	ld [Buffer5], a
	; Back up the animation index to Buffer6
	ld a, c
	ld [Buffer6], a
	xor a
	ret

.fail
	scf
	ret
; c7fe

Script_CutFromMenu: ; c7fe
	reloadmappart
	special UpdateTimePals

Script_Cut: ; 0xc802
	callasm GetPartyNick
	writetext Text_UsedCut
	reloadmappart
	callasm CutDownTreeOrGrass
	closetext
	end
; 0xc810

CutDownTreeOrGrass: ; c810
	ld hl, Buffer3 ; OverworldMapTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Buffer5] ; ReplacementTile
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call UpdateSprites
	call DelayFrame
	ld a, [Buffer6] ; Animation type
	ld e, a
	callba OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret
; c840

CheckOverworldTileArrays: ; c840
	; Input: c contains the tile you're facing
	; Output: Replacement tile in b and effect on wild encounters in c, plus carry set.
	;         Carry is not set if the facing tile cannot be replaced, or if the tileset
	;         does not contain a tile you can replace.

	; Dictionary lookup for pointer to tile replacement table
	push bc
	ld a, [wTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	; Load the pointer
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Look up the tile you're facing
	ld de, 3
	ld a, c
	call IsInArray
	jr nc, .nope
	; Load the replacement to b
	inc hl
	ld b, [hl]
	; Load the animation type parameter to c
	inc hl
	ld c, [hl]
	scf
	ret

.nope
	xor a
	ret
; c862

CutTreeBlockPointers: ; c862
; Which tileset are we in?
	dbw TILESET_JOHTO_1, .johto1
	dbw TILESET_JOHTO_2, .johto2
	dbw TILESET_KANTO, .kanto
	dbw TILESET_PARK, .park
	dbw TILESET_ILEX_FOREST, .ilex
	db -1
; c872

.johto1: ; Johto OW
; Which meta tile are we facing, which should we replace it with, and which animation?
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1
; c882

.johto2: ; Goldenrod area
	db $03, $02, $01 ; grass
	db -1
; c886

.kanto: ; Kanto OW
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1
; c899

.park: ; National Park
	db $13, $03, $01 ; grass
	db $03, $04, $01 ; grass
	db -1
; c8a0

.ilex: ; Ilex Forest
	db $0f, $17, $00
	db -1
; c8a4

WhirlpoolBlockPointers: ; c8a4
	dbw TILESET_JOHTO_1, .johto
	db -1
; c8a8

.johto: ; c8a8
	db $07, $36, $00
	db -1
; c8ac

OWFlash: ; c8ac
	call .CheckUseFlash
	and $7f
	ld [wd0ec], a
	ret
; c8b5

.CheckUseFlash: ; c8b5
; Flash
	ld de, ENGINE_ZEPHYRBADGE
	callba CheckBadge
	jr c, .nozephyrbadge
	push hl
	callba SpecialAerodactylChamber
	pop hl
	jr c, .useflash
	ld a, [wTimeOfDayPalset]
	cp %11111111 ; 3, 3, 3, 3
	jr nz, .notadarkcave
.useflash
	call UseFlash
	ld a, $81
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, $80
	ret

.nozephyrbadge
	ld a, $80
	ret
; c8e0

UseFlash: ; c8e0
	ld hl, Script_UseFlash
	jp QueueScript
; c8e6

Script_UseFlash: ; 0xc8e6
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xc8f3
	callasm BlindingFlash
	closetext
	end
; 0xc8f3

UnknownText_0xc8f3: ; 0xc8f3
	text_jump UnknownText_0x1c0609
	start_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, .BlankText
	ret
; c908

.BlankText: ; 0xc908
	db "@"
; 0xc909

SurfFunction: ; c909
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; c91a

.Jumptable: ; c91a (3:491a)
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing

.TrySurf: ; c922 (3:4922)
	ld de, ENGINE_FOGBADGE
	call CheckBadge
	jr c, .asm_c956
	ld hl, BikeFlags
	bit 1, [hl] ; always on bike
	jr nz, .cannotsurf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .alreadysurfing
	cp PLAYER_SURF_PIKA
	jr z, .alreadysurfing
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr nz, .cannotsurf
	call CheckDirection
	jr c, .cannotsurf
	callba CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.asm_c956
	ld a, $80
	ret
.alreadysurfing
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf: ; c95f (3:495f)
	call GetSurfType
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	call GetPartyNick
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, $81
	ret

.FailSurf: ; c971 (3:4971)
	ld hl, CantSurfText
	call MenuTextBoxBackup
	ld a, $80
	ret

.AlreadySurfing: ; c97a (3:497a)
	ld hl, AlreadySurfingText
	call MenuTextBoxBackup
	ld a, $80
	ret
; c983 (3:4983)

SurfFromMenuScript: ; c983
	special UpdateTimePals

UsedSurfScript: ; c986
	writetext UsedSurfText ; "used SURF!"
	waitbutton
	closetext

	callasm Functionc9a2 ; empty function

	copybytetovar Buffer2
	writevarcode VAR_MOVEMENT

	special ReplaceKrisSprite
	special PlayMapMusic
; step into the water
	special Special_SurfStartStep ; (slow_step_x, step_end)
	applymovement PLAYER, MovementBuffer ; PLAYER, MovementBuffer
	end
; c9a2

Functionc9a2: ; c9a2
	callba MobileFn_1060bb ; empty
	ret
; c9a9

UsedSurfText: ; c9a9
	text_jump _UsedSurfText
	db "@"
; c9ae

CantSurfText: ; c9ae
	text_jump _CantSurfText
	db "@"
; c9b3

AlreadySurfingText: ; c9b3
	text_jump _AlreadySurfingText
	db "@"
; c9b8

GetSurfType: ; c9b8
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.

	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	ld hl, PartySpecies
	add hl, de

	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret
; c9cb

CheckDirection: ; c9cb
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [PlayerDirection]
	and a, %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [TilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT
; c9e7

TrySurfOW:: ; c9e7
; Checking a tile in the overworld.
; Return carry if surfing is allowed.

; Don't ask to surf if already surfing.
	ld a, [PlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .quit
	cp PLAYER_SURF
	jr z, .quit

; Must be facing water.
	ld a, [EngineBuffer1]
	call GetTileCollision
	cp 1 ; surfable
	jr nz, .quit

; Check tile permissions.
	call CheckDirection
	jr c, .quit

	ld de, ENGINE_FOGBADGE
	call CheckEngineFlag
	jr c, .quit

	ld d, SURF
	call CheckPartyMove
	jr c, .quit

	ld hl, BikeFlags
	bit 1, [hl] ; always on bike (can't surf)
	jr nz, .quit

	call GetSurfType
	ld [MovementType], a
	call GetPartyNick

	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript

	scf
	ret

.quit
	xor a
	ret
; ca2c

AskSurfScript: ; ca2c
	opentext
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	closetext
	end
; ca36

AskSurfText: ; ca36
	text_jump _AskSurfText ; The water is calm.
	db "@"              ; Want to SURF?
; ca3b

FlyFunction: ; ca3b
	call ClearBuffer1
.asm_ca3e
	ld hl, .data_ca4c
	call FieldMoveJumptable
	jr nc, .asm_ca3e
	and $7f
	ld [wd0ec], a
	ret
; ca4c

.data_ca4c
 	dw .TryFly
 	dw .DoFly
 	dw .FailFly
; ca52

.TryFly: ; ca52
; Fly
	ld de, ENGINE_STORMBADGE
	call CheckBadge
	jr c, .nostormbadge
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .outdoors
	jr .indoors

.outdoors
	xor a
	ld [hMapAnims], a
	call LoadStandardMenuDataHeader
	call ClearSprites
	callba _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp $1c ; NUM_SPAWNS
	jr nc, .illegal

	ld [wd001], a
	call WriteBackup
	ld a, $1
	ret

.nostormbadge
	ld a, $82
	ret

.indoors
	ld a, $2
	ret

.illegal
	call WriteBackup
	call WaitBGMap
	ld a, $80
	ret
; ca94

.DoFly: ; ca94
	ld hl, .FlyScript
	call QueueScript
	ld a, $81
	ret
; ca9d

.FailFly: ; ca9d
	call FieldMoveFailed
	ld a, $82
	ret
; caa3

.FlyScript: ; 0xcaa3
	reloadmappart
	callasm HideSprites
	special UpdateTimePals
	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm DelayLoadingNewSprites
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm FlyToAnim
	special WaitSFX
	callasm .ReturnFromFly
	end
; 0xcacb

.ReturnFromFly: ; cacb
	callba Function561d
	call DelayFrame
	call ReplaceKrisSprite
	callba Function106594
	ret
; cade

Functioncade: ; cade
	call AttemptToWaterfall
	and $7f
	ld [wd0ec], a
	ret
; cae7

AttemptToWaterfall: ; cae7
; Waterfall
	ld de, ENGINE_RISINGBADGE
	callba CheckBadge
	ld a, $80
	ret c
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, $81
	ret

.failed
	call FieldMoveFailed
	ld a, $80
	ret
; cb07

CheckMapCanWaterfall: ; cb07
	ld a, [PlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .failed
	ld a, [TileUp]
	call CheckWaterfallTile
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret
; cb1c

Script_WaterfallFromMenu: ; 0xcb1c
	reloadmappart
	special UpdateTimePals

Script_UsedWaterfall: ; 0xcb20
	callasm GetPartyNick
	writetext UnknownText_0xcb51
	waitbutton
	closetext
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, WaterfallStep
	callasm CheckContinueWaterfall
	iffalse .loop
	end
; 0xcb38

CheckContinueWaterfall: ; cb38
	xor a
	ld [ScriptVar], a
	ld a, [PlayerNextTile]
	call CheckWaterfallTile
	ret z
	callba MobileFn_1060c1
	ld a, $1
	ld [ScriptVar], a
	ret
; cb4f

WaterfallStep: ; cb4f
	turn_waterfall_up
	step_end
; cb51

UnknownText_0xcb51: ; 0xcb51
	text_jump UnknownText_0x1c068e
	db "@"
; 0xcb56

TryWaterfallOW:: ; cb56
	ld d, WATERFALL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_RISINGBADGE
	call CheckEngineFlag
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret
; cb7e

Script_CantDoWaterfall: ; 0xcb7e
	jumptext UnknownText_0xcb81
; 0xcb81

UnknownText_0xcb81: ; 0xcb81
	text_jump UnknownText_0x1c06a3
	db "@"
; 0xcb86

Script_AskWaterfall: ; 0xcb86
	opentext
	writetext UnknownText_0xcb90
	yesorno
	iftrue Script_UsedWaterfall
	closetext
	end
; 0xcb90

UnknownText_0xcb90: ; 0xcb90
	text_jump UnknownText_0x1c06bf
	db "@"
; 0xcb95

EscapeRopeFunction: ; cb95
	call ClearBuffer1
	ld a, $1
	jr dig_incave

DigFunction: ; cb9c
	call ClearBuffer1
	ld a, $2

dig_incave
	ld [Buffer2], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cbb2

.DigTable: ; cbb2
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig
; cbb8

.CheckCanDig: ; cbb8
	call GetMapPermission
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	ld a, $2
	ret

.incave
	ld hl, wDigWarp
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	ld a, $1
	ret
; cbd8

.DoDig: ; cbd8
	ld hl, wDigWarp
	ld de, wNextWarp
	ld bc, 3
	call CopyBytes
	call GetPartyNick
	ld a, [Buffer2]
	cp $2
	jr nz, .escaperope
	ld hl, UsedDigScript
	call QueueScript
	ld a, $81
	ret

.escaperope
	callba SpecialKabutoChamber
	ld hl, UsedEscapeRopeScript
	call QueueScript
	ld a, $81
	ret
; cc06

.FailDig: ; cc06
	ld a, [Buffer2]
	cp $2
	jr nz, .failescaperope
	ld hl, UnknownText_0xcc26
	call MenuTextBox
	call WaitPressAorB_BlinkCursor
	call WriteBackup

.failescaperope
	ld a, $80
	ret
; cc1c

UnknownText_0xcc1c: ; 0xcc1c
	; used DIG!
	text_jump UnknownText_0x1c06de
	db "@"
; 0xcc21

UnknownText_0xcc21: ; 0xcc21
	; used an ESCAPE ROPE.
	text_jump UnknownText_0x1c06ed
	db "@"
; 0xcc26

UnknownText_0xcc26: ; 0xcc26
	; Can't use that here.
	text_jump UnknownText_0x1c0705
	db "@"
; 0xcc2b

UsedEscapeRopeScript: ; 0xcc2b
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xcc21
	jump UsedDigOrEscapeRopeScript
; 0xcc35

UsedDigScript: ; 0xcc35
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xcc1c

UsedDigOrEscapeRopeScript: ; 0xcc3c
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end
; 0xcc59

.DigOut: ; 0xcc59
	step_dig 32
	hide_person
	step_end
; 0xcc5d

.DigReturn: ; 0xcc5d
	show_person
	return_dig 32
	step_end
; 0xcc61

TeleportFunction: ; cc61
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cc72

.Jumptable: ; cc72
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport
; cc78

.TryTeleport: ; cc78
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .CheckIfSpawnPoint
	jr .nope

.CheckIfSpawnPoint
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	callba IsSpawnPoint
	jr nc, .nope
	ld a, c
	ld [wd001], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret
; cc9c

.DoTeleport: ; cc9c
	call GetPartyNick
	ld hl, Script_UsedTeleport
	call QueueScript
	ld a, $81
	ret
; cca8

.FailTeleport: ; cca8
	ld hl, UnknownText_0xccb6
	call MenuTextBoxBackup
	ld a, $80
	ret
; ccb1

UnknownText_0xccb1: ; 0xccb1
	; Return to the last #MON CENTER.
	text_jump UnknownText_0x1c071a
	db "@"
; 0xccb6

UnknownText_0xccb6: ; 0xccb6
	; Can't use that here.
	text_jump UnknownText_0x1c073b
	db "@"
; 0xccbb

Script_UsedTeleport: ; 0xccbb
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xccb1
	pause 60
	reloadmappart
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end
; 0xcce1

.TeleportFrom: ; cce1
	teleport_from
	step_end
; cce3

.TeleportTo: ; cce3
	teleport_to
	step_end
; cce5

StrengthFunction: ; cce5
	call .TryStrength
	and $7f
	ld [wd0ec], a
	ret
; ccee

.TryStrength: ; ccee
; Strength
	ld de, ENGINE_PLAINBADGE
	call CheckBadge
	jr c, FailedStrength
	jr StartToUseStrength
; ccf8

AlreadyUsingStrength: ; unreferenced
	ld hl, UnknownText_0xcd01
	call MenuTextBoxBackup
	ld a, $80
	ret
; cd01

UnknownText_0xcd01: ; 0xcd01
	text_jump UnknownText_0x1c0751
	db "@"
; 0xcd06

FailedStrength: ; cd06
	ld a, $80
	ret
; cd09

StartToUseStrength: ; cd09
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, $81
	ret
; cd12

Functioncd12: ; cd12
	ld hl, BikeFlags
	set 0, [hl]
	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	; fallthrough
; cd1d

Functioncd1d: ; cd1d
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [Buffer6], a
	call GetPartyNick
	ret
; cd29

Script_StrengthFromMenu: ; 0xcd29
	reloadmappart
	special UpdateTimePals

Script_UsedStrength: ; 0xcd2d
	callasm Functioncd12
	writetext UnknownText_0xcd41
	copybytetovar Buffer6
	cry 0
	pause 3
	writetext UnknownText_0xcd46
	closetext
	end
; 0xcd41

UnknownText_0xcd41: ; 0xcd41
	text_jump UnknownText_0x1c0774
	db "@"
; 0xcd46

UnknownText_0xcd46: ; 0xcd46
	text_jump UnknownText_0x1c0788
	db "@"
; 0xcd4b

AskStrengthScript:
	callasm TryStrengthOW
	iffalse .AskStrength
	if_equal $1, .DontMeetRequirements
	jump .AlreadyUsedStrength
; 0xcd59

.DontMeetRequirements: ; 0xcd59
	jumptext UnknownText_0xcd73
; 0xcd5c

.AlreadyUsedStrength: ; 0xcd5c
	jumptext UnknownText_0xcd6e
; 0xcd5f

.AskStrength: ; 0xcd5f
	opentext
	writetext UnknownText_0xcd69
	yesorno
	iftrue Script_UsedStrength
	closetext
	end
; 0xcd69

UnknownText_0xcd69: ; 0xcd69
	; A #MON may be able to move this. Want to use STRENGTH?
	text_jump UnknownText_0x1c07a0
	db "@"
; 0xcd6e

UnknownText_0xcd6e: ; 0xcd6e
	; Boulders may now be moved!
	text_jump UnknownText_0x1c07d8
	db "@"
; 0xcd73

UnknownText_0xcd73: ; 0xcd73
	; A #MON may be able to move this.
	text_jump UnknownText_0x1c07f4
	db "@"
; 0xcd78

TryStrengthOW: ; cd78
	ld d, STRENGTH
	call CheckPartyMove
	jr c, .nope

	ld de, ENGINE_PLAINBADGE
	call CheckEngineFlag
	jr c, .nope

	ld hl, BikeFlags
	bit 0, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.already_using
	xor a
	jr .done

.done
	ld [ScriptVar], a
	ret
; cd9d

WhirlpoolFunction: ; cd9d
	call ClearBuffer1
.loop
	ld hl, Jumptable_cdae
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cdae

Jumptable_cdae: ; cdae
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool
; cdb4

.TryWhirlpool: ; cdb4
	ld de, ENGINE_GLACIERBADGE
	call CheckBadge
	jr c, .noglacierbadge
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	ld a, $80
	ret
; cdca

.DoWhirlpool: ; cdca
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, $81
	ret
; cdd3

.FailWhirlpool: ; cdd3
	call FieldMoveFailed
	ld a, $80
	ret
; cdd9

UnknownText_0xcdd9: ; 0xcdd9
	; used WHIRLPOOL!
	text_jump UnknownText_0x1c0816
	db "@"
; 0xcdde

TryWhirlpoolMenu: ; cdde
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	ld a, l
	ld [Buffer3], a
	ld a, h
	ld [Buffer4], a
	ld a, b
	ld [Buffer5], a
	ld a, c
	ld [Buffer6], a
	xor a
	ret

.failed
	scf
	ret
; ce0b

Script_WhirlpoolFromMenu: ; 0xce0b
	reloadmappart
	special UpdateTimePals

Script_UsedWhirlpool: ; 0xce0f
	callasm GetPartyNick
	writetext UnknownText_0xcdd9
	reloadmappart
	callasm DisappearWhirlpool
	closetext
	end
; 0xce1d

DisappearWhirlpool: ; ce1d
	ld hl, Buffer3
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Buffer5]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	ld a, [Buffer6]
	ld e, a
	callba PlayWhirlpoolSound
	call BufferScreen
	call GetMovementPermissions
	ret
; ce3e

TryWhirlpoolOW:: ; ce3e
	ld d, WHIRLPOOL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_GLACIERBADGE
	call CheckEngineFlag
	jr c, .failed
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, BANK(Script_AskWhirlpoolOW)
	ld hl, Script_AskWhirlpoolOW
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret
; ce66

Script_MightyWhirlpool: ; 0xce66
	jumptext UnknownText_0xce69
; 0xce69

UnknownText_0xce69: ; 0xce69
	text_jump UnknownText_0x1c082b
	db "@"
; 0xce6e

Script_AskWhirlpoolOW: ; 0xce6e
	opentext
	writetext UnknownText_0xce78
	yesorno
	iftrue Script_UsedWhirlpool
	closetext
	end
; 0xce78

UnknownText_0xce78: ; 0xce78
	text_jump UnknownText_0x1c0864
	db "@"
; 0xce7d

HeadbuttFunction: ; ce7d
	call TryHeadbuttFromMenu
	and $7f
	ld [wd0ec], a
	ret
; ce86

TryHeadbuttFromMenu: ; ce86
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_tree
	call FieldMoveFailed
	ld a, $80
	ret
; ce9d

UnknownText_0xce9d: ; 0xce9d
	; did a HEADBUTT!
	text_jump UnknownText_0x1c0897
	db "@"
; 0xcea2

UnknownText_0xcea2: ; 0xcea2
	; Nope. Nothing…
	text_jump UnknownText_0x1c08ac
	db "@"
; 0xcea7

HeadbuttFromMenuScript: ; 0xcea7
	reloadmappart
	special UpdateTimePals

HeadbuttScript: ; 0xceab
	callasm GetPartyNick
	writetext UnknownText_0xce9d

	reloadmappart
	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	closetext
	randomwildmon
	startbattle
	returnafterbattle
	end

.no_battle
	writetext UnknownText_0xcea2
	waitbutton
	closetext
	end
; 0xcec9

TryHeadbuttOW:: ; cec9
	ld d, HEADBUTT
	call CheckPartyMove
	jr c, .no

	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret
; cedc

AskHeadbuttScript: ; 0xcedc
	opentext
	writetext UnknownText_0xcee6
	yesorno
	iftrue HeadbuttScript
	closetext
	end
; 0xcee6

UnknownText_0xcee6: ; 0xcee6
	; A #MON could be in this tree. Want to HEADBUTT it?
	text_jump UnknownText_0x1c08bc
	db "@"
; 0xceeb

RockSmashFunction: ; ceeb
	call TryRockSmashFromMenu
	and $7f
	ld [wd0ec], a
	ret
; cef4

TryRockSmashFromMenu: ; cef4
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp $18
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_rock
	call FieldMoveFailed
	ld a, $80
	ret
; cf0d

GetFacingObject: ; cf0d
	callba CheckFacingObject
	jr nc, .fail

	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret
; cf2e

RockSmashFromMenuScript: ; 0xcf2e
	reloadmappart
	special UpdateTimePals

RockSmashScript: ; cf32
	callasm GetPartyNick
	writetext UnknownText_0xcf58
	closetext
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement2 MovementData_0xcf55
	disappear -2

	callasm RockMonEncounter
	copybytetovar TempWildMonSpecies
	iffalse .done
	randomwildmon
	startbattle
	returnafterbattle
.done
	end
; 0xcf55

MovementData_0xcf55: ; 0xcf55
	rock_smash 10
	step_end

UnknownText_0xcf58: ; 0xcf58
	text_jump UnknownText_0x1c08f0
	db "@"
; 0xcf5d

AskRockSmashScript: ; 0xcf5d
	callasm HasRockSmash
	if_equal 1, .no

	opentext
	writetext UnknownText_0xcf77
	yesorno
	iftrue RockSmashScript
	closetext
	end
.no
	jumptext UnknownText_0xcf72
; 0xcf72

UnknownText_0xcf72: ; 0xcf72
	; Maybe a #MON can break this.
	text_jump UnknownText_0x1c0906
	db "@"
; 0xcf77

UnknownText_0xcf77: ; 0xcf77
	; This rock looks breakable. Want to use ROCK SMASH?
	text_jump UnknownText_0x1c0924
	db "@"
; 0xcf7c

HasRockSmash: ; cf7c
	ld d, ROCK_SMASH
	call CheckPartyMove
	jr nc, .yes
.no
	ld a, 1
	jr .done
.yes
	xor a
	jr .done
.done
	ld [ScriptVar], a
	ret

FishFunction: ; cf8e
	ld a, e
	push af
	call ClearBuffer1
	pop af
	ld [Buffer2], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cfa5

.FishTable: ; cfa5
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .SurfingFish
	dw .FailFish
; cfaf

.TryFish: ; cfaf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr z, .facingwater

.surfing
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [Buffer2]
	ld e, a
	callba FishAction
	ld a, d
	and a
	jr z, .nonibble
	ld [TempWildMonSpecies], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, BATTLETYPE_FISH
	ld [BattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret
; cff1

.SurfingFish: ; cff1
	ld a, $80
	ret
; cff4

.FishGotSomething: ; cff4
	ld a, $1
	ld [Buffer6], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, $81
	ret
; d002

.FishNoBite: ; d002
	ld a, $2
	ld [Buffer6], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret
; d010

.FailFish: ; d010
	ld a, $0
	ld [Buffer6], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, $81
	ret
; d01e

Script_NotEvenANibble: ; 0xd01e
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9
	jump Script_NotEvenANibble_FallThrough
; 0xd027

Script_NotEvenANibble2: ; 0xd027
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9

Script_NotEvenANibble_FallThrough: ; 0xd02d
	loademote EMOTE_SHADOW
	callasm PutTheRodAway
	closetext
	end
; 0xd035

Script_GotABite: ; 0xd035
	scall Script_FishCastRod
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, .Movement_FacingUp
	jump .FightTheHookedPokemon
; 0xd046

.NotFacingUp: ; 0xd046
	applymovement PLAYER, .Movement_NotFacingUp

.FightTheHookedPokemon: ; 0xd04a
	pause 40
	applymovement PLAYER, .Movement_RestoreRod
	writetext UnknownText_0xd0a4
	callasm PutTheRodAway
	closetext
	randomwildmon
	startbattle
	returnafterbattle
	end
; 0xd05c

.Movement_NotFacingUp: ; d05c
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end
; d062

.Movement_FacingUp: ; d062
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep_1
	show_emote
	step_end
; d069

.Movement_RestoreRod: ; d069
	hide_emote
	fish_cast_rod
	step_end
; d06c

Fishing_CheckFacingUp: ; d06c
	ld a, [PlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [ScriptVar], a
	ret
; d07c

Script_FishCastRod: ; 0xd07c
	reloadmappart
	loadvar hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_0xd093
	pause 40
	end
; 0xd093

MovementData_0xd093: ; d093
	fish_cast_rod
	step_end
; d095

PutTheRodAway: ; d095
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [PlayerAction], a
	call UpdateSprites
	call ReplaceKrisSprite
	ret
; d0a4

UnknownText_0xd0a4: ; 0xd0a4
	; Oh! A bite!
	text_jump UnknownText_0x1c0958
	db "@"
; 0xd0a9

UnknownText_0xd0a9: ; 0xd0a9
	; Not even a nibble!
	text_jump UnknownText_0x1c0965
	db "@"
; 0xd0ae

UnknownText_0xd0ae: ; unused
	; Looks like there's nothing here.
	text_jump UnknownText_0x1c0979
	db "@"
; 0xd0b3

BikeFunction: ; d0b3
	call .TryBike
	and $7f
	ld [wd0ec], a
	ret
; d0bc

.TryBike: ; d0bc
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	call QueueScript
	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.GetOffBike
	ld hl, BikeFlags
	bit 1, [hl]
	jr nz, .CantGetOffBike
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	ld a, $3
	jr .done

.CantGetOffBike
	ld hl, UnknownScript_0xd171
	jr .done

.CannotUseBike
	ld a, $0
	ret

.done
	call QueueScript
	ld a, $1
	ret
; d119

.CheckIfRegistered: ; d119
	ld a, [wd0ef]
	and a
	ret z
	ld h, d
	ld l, e
	ret
; d121

.CheckEnvironment: ; d121
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	jr .nope

.ok
	call Function184a
	and $f
	jr nz, .nope
	xor a
	ret

.nope
	scf
	ret
; d13e

Script_GetOnBike: ; 0xd13e
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_BIKE
	writetext UnknownText_0xd17c
	waitbutton
	closetext
	special ReplaceKrisSprite
	end
; 0xd14e

Script_GetOnBike_Register: ; 0xd14e
	writecode VAR_MOVEMENT, PLAYER_BIKE
	closetext
	special ReplaceKrisSprite
	end
; 0xd156

Functiond156: ; unreferenced
	nop
	ret

Script_GetOffBike: ; 0xd158
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext UnknownText_0xd181
	waitbutton

FinishGettingOffBike:
	closetext
	special ReplaceKrisSprite
	special PlayMapMusic
	end
; 0xd16b

Script_GetOffBike_Register: ; 0xd16b
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffBike
; 0xd171

UnknownScript_0xd171: ; 0xd171
	writetext UnknownText_0xd177
	waitbutton
	closetext
	end
; 0xd177

UnknownText_0xd177: ; 0xd177
	; You can't get off here!
	text_jump UnknownText_0x1c099a
	db "@"
; 0xd17c

UnknownText_0xd17c: ; 0xd17c
	; got on the @ .
	text_jump UnknownText_0x1c09b2
	db "@"
; 0xd181

UnknownText_0xd181: ; 0xd181
	; got off the @ .
	text_jump UnknownText_0x1c09c7
	db "@"
; 0xd186

TryCutOW:: ; d186
	ld d, CUT
	call CheckPartyMove
	jr c, .cant_cut

	ld de, ENGINE_HIVEBADGE
	call CheckEngineFlag
	jr c, .cant_cut

	ld a, BANK(AskCutScript)
	ld hl, AskCutScript
	call CallScript
	scf
	ret

.cant_cut
	ld a, BANK(CantCutScript)
	ld hl, CantCutScript
	call CallScript
	scf
	ret
; d1a9

AskCutScript: ; 0xd1a9
	opentext
	writetext UnknownText_0xd1c8
	yesorno
	iffalse .script_d1b8
	callasm .CheckMap
	iftrue Script_Cut
.script_d1b8
	closetext
	end
; 0xd1ba

.CheckMap: ; d1ba
	xor a
	ld [ScriptVar], a
	call CheckMapForSomethingToCut
	ret c
	ld a, TRUE
	ld [ScriptVar], a
	ret
; d1c8

UnknownText_0xd1c8: ; 0xd1c8
	text_jump UnknownText_0x1c09dd
	db "@"
; 0xd1cd

CantCutScript: ; 0xd1cd
	jumptext UnknownText_0xd1d0
; 0xd1d0

UnknownText_0xd1d0: ; 0xd1d0
	text_jump UnknownText_0x1c0a05
	db "@"
; 0xd1d5

_ReceiveItem:: ; d1d5
	call DoesHLEqualNumItems
	jp nz, PutItemInPocket
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret
; d1e9

.Pockets: ; d1e9
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d1f1

.Item: ; d1f1
	ld h, d
	ld l, e
	jp PutItemInPocket
; d1f6

.KeyItem: ; d1f6
	ld h, d
	ld l, e
	jp ReceiveKeyItem
; d1fb

.Ball: ; d1fb
	ld hl, NumBalls
	jp PutItemInPocket
; d201

.TMHM: ; d201
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp ReceiveTMHM
; d20d

_TossItem:: ; d20d
	call DoesHLEqualNumItems
	jr nz, .remove
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d228

.Ball ; d228
	ld hl, NumBalls
	jp RemoveItemFromPocket
; d22e

.TMHM ; d22e
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp TossTMHM
; d23a

.KeyItem ; d23a
	ld h, d
	ld l, e
	jp TossKeyItem
; d23f

.Item ; d23f
	ld h, d
	ld l, e
; d241

.remove
	jp RemoveItemFromPocket
; d244

_CheckItem:: ; d244
	call DoesHLEqualNumItems
	jr nz, .nope
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d25f

.Ball ; d25f
	ld hl, NumBalls
	jp CheckTheItem
; d265

.TMHM ; d265
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp CheckTMHM
; d271

.KeyItem ; d271
	ld h, d
	ld l, e
	jp CheckKeyItems
; d276

.Item ; d276
	ld h, d
	ld l, e
; d278

.nope
	jp CheckTheItem
; d27b

DoesHLEqualNumItems: ; d27b
	ld a, l
	cp NumItems % $100
	ret nz
	ld a, h
	cp NumItems / $100
	ret
; d283

GetPocketCapacity: ; d283
	ld c, MAX_ITEMS
	ld a, e
	cp NumItems % $100
	jr nz, .not_bag
	ld a, d
	cp NumItems / $100
	ret z

.not_bag
	ld c, MAX_PC_ITEMS
	ld a, e
	cp PCItems % $100
	jr nz, .not_pc
	ld a, d
	cp PCItems / $100
	ret z

.not_pc
	ld c, MAX_BALLS
	ret
; d29c

PutItemInPocket: ; d29c
	ld d, h
	ld e, l
	inc hl
	ld a, [CurItem]
	ld c, a
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp c
	jr nz, .next
	ld a, 99
	sub [hl]
	add b
	ld b, a
	ld a, [wItemQuantityChangeBuffer]
	cp b
	jr z, .ok
	jr c, .ok

.next
	inc hl
	jr .loop

.terminator
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret

.ok
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp c
	jr nz, .loop2
	ld a, [wItemQuantityBuffer]
	add [hl]
	cp 100
	jr nc, .newstack
	ld [hl], a
	jr .done

.newstack
	ld [hl], 99
	sub 99
	ld [wItemQuantityBuffer], a
	jr .loop2

.terminator2
	dec hl
	ld a, [CurItem]
	ld [hli], a
	ld a, [wItemQuantityBuffer]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret
; d2ff

RemoveItemFromPocket: ; d2ff
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [ItemCountBuffer]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, $0
rept 2
	add hl, bc
endr
	ld a, [CurItem]
	cp [hl]
	inc hl
	jr z, .skip
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [CurItem]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .skip
	cp -1
	jr z, .nope
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	and a
	jr nz, .yup
	dec hl
	ld b, h
	ld c, l
rept 2
	inc hl
endr
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret
; d349

CheckTheItem: ; d349
	ld a, [CurItem]
	ld c, a
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	scf
	ret

.done
	and a
	ret
; d35a

ReceiveKeyItem: ; d35a
	ld hl, NumKeyItems
	ld a, [hli]
	cp MAX_KEY_ITEMS
	jr nc, .nope
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurItem]
	ld [hli], a
	ld [hl], -1
	ld hl, NumKeyItems
	inc [hl]
	scf
	ret

.nope
	and a
	ret
; d374

TossKeyItem: ; d374
	ld a, [wd107]
	ld e, a
	ld d, 0
	ld hl, NumKeyItems
	ld a, [hl]
	cp e
	jr nc, .ok
	call .Toss
	ret nc
	jr .ok2

.ok
	dec [hl]
	inc hl
	add hl, de

.ok2
	ld d, h
	ld e, l
	inc hl
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp -1
	jr nz, .loop
	scf
	ret
; d396

.Toss: ; d396
	ld hl, NumKeyItems
	ld a, [CurItem]
	ld c, a
.loop3
	inc hl
	ld a, [hl]
	cp c
	jr z, .ok3
	cp -1
	jr nz, .loop3
	xor a
	ret

.ok3
	ld a, [NumKeyItems]
	dec a
	ld [NumKeyItems], a
	scf
	ret
; d3b1

CheckKeyItems: ; d3b1
	ld a, [CurItem]
	ld c, a
	ld hl, KeyItems
.loop
	ld a, [hli]
	cp c
	jr z, .done
	cp -1
	jr nz, .loop
	and a
	ret

.done
	scf
	ret
; d3c4

ReceiveTMHM: ; d3c4
	dec c
	ld b, 0
	ld hl, TMsHMs
	add hl, bc
	ld a, [wItemQuantityChangeBuffer]
	add [hl]
	cp 100
	jr nc, .toomany
	ld [hl], a
	scf
	ret

.toomany
	and a
	ret
; d3d8

TossTMHM: ; d3d8
	dec c
	ld b, 0
	ld hl, TMsHMs
	add hl, bc
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	jr nz, .yup
	ld a, [wTMHMPocketScrollPosition]
	and a
	jr z, .yup
	dec a
	ld [wTMHMPocketScrollPosition], a

.yup
	scf
	ret

.nope
	and a
	ret
; d3fb

CheckTMHM: ; d3fb
	dec c
	ld b, $0
	ld hl, TMsHMs
	add hl, bc
	ld a, [hl]
	and a
	ret z
	scf
	ret
; d407

GetTMHMNumber:: ; d407
; Return the number of a TM/HM by item id c.

	ld a, c

; Skip any dummy items.
	cp ITEM_C3 ; TM04-05
	jr c, .done
	cp ITEM_DC ; TM28-29
	jr c, .skip

	dec a
.skip
	dec a
.done
	sub TM01
	inc a
	ld c, a
	ret
; d417

GetNumberedTMHM: ; d417
; Return the item id of a TM/HM by number c.

	ld a, c

; Skip any gaps.
	cp ITEM_C3 - (TM01 - 1)
	jr c, .done
	cp ITEM_DC - (TM01 - 1) - 1
	jr c, .skip_one

.skip_two
	inc a
.skip_one
	inc a
.done
	add TM01
	dec a
	ld c, a
	ret
; d427

_CheckTossableItem:: ; d427
; Return 1 in wItemAttributeParamBuffer and carry if CurItem can't be removed from the bag.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit 7, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret
; d432

CheckSelectableItem: ; d432
; Return 1 in wItemAttributeParamBuffer and carry if CurItem can't be selected.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit 6, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret
; d43d

CheckItemPocket:: ; d43d
; Return the pocket for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_POCKET
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d448

CheckItemContext: ; d448
; Return the context for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d453

CheckItemMenu: ; d453
; Return the menu for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	swap a
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d460

GetItemAttr: ; d460
; Get attribute a of CurItem.

	push hl
	push bc

	ld hl, ItemAttributes
	ld c, a
	ld b, 0
	add hl, bc

	xor a
	ld [wItemAttributeParamBuffer], a

	ld a, [CurItem]
	dec a
	ld c, a
	ld a, NUM_ITEMATTRS
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarByte

	pop bc
	pop hl
	ret
; d47f

ItemAttr_ReturnCarry: ; d47f
	ld a, 1
	ld [wItemAttributeParamBuffer], a
	scf
	ret
; d486

GetItemPrice: ; d486
; Return the price of CurItem in de.
	push hl
	push bc
	ld a, ITEMATTR_PRICE
	call GetItemAttr
	ld e, a
	ld a, ITEMATTR_PRICE_HI
	call GetItemAttr
	ld d, a
	pop bc
	pop hl
	ret
; d497

Functiond497:: ; d497 (3:5497)
	ld a, [wPlayerStepFlags]
	and a
	ret z
	bit 7, a
	jr nz, .update_overworld_map
	bit 6, a
	jr nz, .update_player_coords
	bit 5, a
	jr nz, .finish
	ret

.update_overworld_map
	ld a, $4
	ld [wd13f], a
	call UpdateOverworldMap
	jr .finish

.update_player_coords
	call UpdatePlayerCoords
	jr .finish

.finish
	call Functiond4e5
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wd14c]
	sub d
	ld [wd14c], a
	ld a, [wd14d]
	sub e
	ld [wd14d], a
	ret

Functiond4d2:: ; d4d2 (3:54d2)
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [hSCX]
	add d
	ld [hSCX], a
	ld a, [hSCY]
	add e
	ld [hSCY], a
	ret

Functiond4e5: ; d4e5 (3:54e5)
	ld hl, wd13f
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable: ; d4f2 (3:54f2)
	jumptable_start
	jumptable GetMovementPermissions
	jumptable BufferScreen
	jumptable .mobile
	jumptable .fail2
	jumptable .fail1
	jumptable .fail1
	jumptable .fail1
	jumptable .fail1
	jumptable .fail1
	jumptable .fail1
	jumptable .fail1

.fail1: ; d508 (3:5508)
	ret

.mobile: ; d509 (3:5509)
	callba MobileFn_10602e
	ret

.fail2: ; d510 (3:5510)
	ret

UpdatePlayerCoords: ; d511 (3:5511)
	ld a, [wPlayerStepDirection]
	and a
	jr nz, .check_step_down
	ld hl, YCoord
	inc [hl]
	ret

.check_step_down
	cp UP
	jr nz, .check_step_left
	ld hl, YCoord
	dec [hl]
	ret

.check_step_left
	cp LEFT
	jr nz, .check_step_right
	ld hl, XCoord
	dec [hl]
	ret

.check_step_right
	cp RIGHT
	ret nz
	ld hl, XCoord
	inc [hl]
	ret

UpdateOverworldMap: ; d536 (3:5536)
	ld a, [wPlayerStepDirection]
	and a
	jr z, .step_down
	cp UP
	jr z, .step_up
	cp LEFT
	jr z, .step_left
	cp RIGHT
	jr z, .step_right
	ret

.step_down
	call .ScrollOverworldMapDown
	call LoadMapPart
	call ScrollMapUp
	ret

.step_up
	call .ScrollOverworldMapUp
	call LoadMapPart
	call ScrollMapDown
	ret

.step_left
	call .ScrollOverworldMapLeft
	call LoadMapPart
	call ScrollMapRight
	ret

.step_right
	call .ScrollOverworldMapRight
	call LoadMapPart
	call ScrollMapLeft
	ret

.ScrollOverworldMapDown: ; d571 (3:5571)
	ld a, [wBGMapAnchor]
	add 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wMetatileStandingY
	inc [hl]
	ld a, [hl]
	cp 2 ; was 1
	jr nz, .done_down
	ld [hl], 0
	call .Add6ToOverworldMapAnchor
.done_down
	ret

.Add6ToOverworldMapAnchor: ; d595 (3:5595)
	ld hl, wOverworldMapAnchor
	ld a, [MapWidth]
	add 6
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

.ScrollOverworldMapUp: ; d5a2 (3:55a2)
	ld a, [wBGMapAnchor]
	sub 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wMetatileStandingY
	dec [hl]
	ld a, [hl]
	cp -1 ; was 0
	jr nz, .done_up
	ld [hl], $1
	call .Sub6FromOverworldMapAnchor
.done_up
	ret

.Sub6FromOverworldMapAnchor: ; d5c6 (3:55c6)
	ld hl, wOverworldMapAnchor
	ld a, [MapWidth]
	add 6
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapLeft: ; d5d5 (3:55d5)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	dec [hl]
	ld a, [hl]
	cp -1
	jr nz, .done_left
	ld [hl], 1
	call .DecrementwOverworldMapAnchor
.done_left
	ret

.DecrementwOverworldMapAnchor: ; d5f4 (3:55f4)
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapRight: ; d5fe (3:55fe)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	inc [hl]
	ld a, [hl]
	cp 2
	jr nz, .done_right
	ld [hl], 0
	call .IncrementwOverworldMapAnchor
.done_right
	ret

.IncrementwOverworldMapAnchor: ; d61d (3:561d)
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	add 1
	ld [hli], a
	ret nc
	inc [hl]
	ret

INCLUDE "engine/anim_hp_bar.asm"

TryAddMonToParty: ; d88c
; Check if to copy wild Pkmn or generate new Pkmn
	; Whose is it?
	ld de, PartyCount
	ld a, [MonType]
	and $f
	jr z, .getpartylocation ; PARTYMON
	ld de, OTPartyCount

.getpartylocation
	; Do we have room for it?
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc
	; Increase the party count
	ld [de], a
	ld a, [de] ; Why are we doing this?
	ld [$ffae], a ; HRAM backup
	add e
	ld e, a
	jr nc, .loadspecies
	inc d

.loadspecies
	; Load the species of the Pokemon into the party list.
	; The terminator is usually here, but it'll be back.
	ld a, [CurPartySpecies]
	ld [de], a
	; Load the terminator into the next slot.
	inc de
	ld a, -1
	ld [de], a
	; Now let's load the OT name.
	ld hl, PartyMonOT
	ld a, [MonType]
	and $f
	jr z, .loadOTname
	ld hl, OTPartyMonOT

.loadOTname
	ld a, [$ffae] ; Restore index from backup
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [MonType]
	and a
	jr nz, .skipnickname
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PartyMonNicknames
	ld a, [$ffae]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skipnickname
	ld hl, PartyMon1Species
	ld a, [MonType]
	and $f
	jr z, .initializeStats
	ld hl, OTPartyMon1Species

.initializeStats
	ld a, [$ffae]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
GeneratePartyMonStats: ; d906
	ld e, l
	ld d, h
	push hl
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDexNo]
	ld [de], a
	inc de
	ld a, [wBattleMode]
	and a
	ld a, $0
	jr z, .skipitem
	ld a, [EnemyMonItem]

.skipitem
	ld [de], a
	inc de
	push de
	ld h, d
	ld l, e
	ld a, [wBattleMode]
	and a
	jr z, .randomlygeneratemoves
	ld a, [MonType]
	and a
	jr nz, .randomlygeneratemoves
	ld de, EnemyMonMoves
	rept NUM_MOVES + -1
	ld a, [de]
	inc de
	ld [hli], a
	endr
	ld a, [de]
	ld [hl], a
	jr .next

.randomlygeneratemoves
	xor a
	rept NUM_MOVES + -1
	ld [hli], a
	endr
	ld [hl], a
	ld [Buffer1], a
	predef FillMoves

.next
	pop de
rept 4
	inc de
endr
	ld a, [PlayerID]
	ld [de], a
	inc de
	ld a, [PlayerID + 1]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hProduct + 1]
	ld [de], a
	inc de
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de
	xor a
	ld b, $a
.loop
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop hl
	push hl
	ld a, [MonType]
	and $f
	jr z, .generateDVs
	push hl
	callba GetTrainerDVs
	pop hl
	jr .initializetrainermonstats

.generateDVs
	ld a, [CurPartySpecies]
	ld [wd265], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon
	pop de
	pop hl
	push hl
	ld a, [wBattleMode]
	and a
	jr nz, .copywildmonstats
	call Random
	ld b, a
	call Random
	ld c, a

.initializetrainermonstats
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	push hl
	push de
rept 2
	inc hl
endr
	call FillPP
	pop de
	pop hl
rept 4
	inc de
endr
	ld a, 70
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld bc, 10
	add hl, bc
	ld a, $1
	ld c, a
	ld b, $0
	call CalcPkmnStatC
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de
	jr .next2

.copywildmonstats
	ld a, [EnemyMonDVs]
	ld [de], a
	inc de
	ld a, [EnemyMonDVs + 1]
	ld [de], a
	inc de

	push hl
	ld hl, EnemyMonPP
	ld b, NUM_MOVES
.wildmonpploop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .wildmonpploop
	pop hl

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	ld hl, EnemyMonStatus
    ; Copy EnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
    ; Copy EnemyMonUnused
	ld a, [hli]
	ld [de], a
	inc de
    ; Copy EnemyMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

.next2
	ld a, [wBattleMode]
	dec a
	jr nz, .generatestats
	ld hl, EnemyMonMaxHP
	ld bc, 2*6 ; MaxHP + 5 Stats
	call CopyBytes
	pop hl
	jr .next3

.generatestats
	pop hl
	ld bc, 2*5 ; 5 Stats
	add hl, bc
	ld b, $0 ; if b = 1, then the Stats of the Pkmn are calculated
             ; only the current HP aren't set to MaxHP after this
	call CalcPkmnStats

.next3
	ld a, [MonType]
	and $f
	jr nz, .done
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab UpdateUnownDex

.done
	scf ; When this function returns, the carry flag indicates success vs failure.
	ret
; da6d

FillPP: ; da6d
	push bc
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .next
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	pop bc
	pop de
	pop hl
	ld a, [StringBuffer1 + MOVE_PP]

.next
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop bc
	ret
; da96

AddTempmonToParty: ; da96
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z

	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
	ld [hli], a
	ld [hl], $ff

	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, TempMonSpecies
	call CopyBytes

	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonOT
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes

	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonNicknames
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	cp EGG
	jr z, .egg
	dec a
	call SetSeenAndCaughtMon
	ld hl, PartyMon1Happiness
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], BASE_HAPPINESS
.egg

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab UpdateUnownDex
	ld a, [wFirstUnownSeen]
	and a
	jr nz, .done
	ld a, [UnownLetter]
	ld [wFirstUnownSeen], a
.done

	and a
	ret

SentGetPkmnIntoFromBox: ; db3f
; Sents/Gets Pkmn into/from Box depending on Parameter
; wPokemonWithdrawDepositParameter == 0: get Pkmn into Party
; wPokemonWithdrawDepositParameter == 1: sent Pkmn into Box
; wPokemonWithdrawDepositParameter == 2: get Pkmn from DayCare
; wPokemonWithdrawDepositParameter == 3: put Pkmn into DayCare

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .check_IfPartyIsFull
	cp DAYCARE_WITHDRAW
	jr z, .check_IfPartyIsFull
	cp DAYCARE_DEPOSIT
	ld hl, wBreedMon1Species
	jr z, .breedmon

    ; we want to sent a Pkmn into the Box
    ; so check if there's enough space
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .there_is_room
	jp CloseSRAM_And_SetCarryFlag

.check_IfPartyIsFull
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp z, CloseSRAM_And_SetCarryFlag

.there_is_room
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_WITHDRAW
	ld a, [wBreedMon1Species]
	jr z, .okay1
	ld a, [CurPartySpecies]

.okay1
	ld [hli], a
	ld [hl], $ff
	ld a, [wPokemonWithdrawDepositParameter]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	jr nz, .okay2
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [sBoxCount]

.okay2
	dec a ; PartyCount - 1
	call AddNTimes

.breedmon
	push hl
	ld e, l
	ld d, h
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	jr z, .okay3
	cp DAYCARE_WITHDRAW
	ld hl, wBreedMon1Species
	jr z, .okay4
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH

.okay3
	ld a, [CurPartyMon]
	call AddNTimes

.okay4
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1OT
	jr z, .okay5
	dec a
	ld hl, PartyMonOT
	ld a, [PartyCount]
	jr nz, .okay6
	ld hl, sBoxMonOT
	ld a, [sBoxCount]

.okay6
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay5
	ld hl, sBoxMonOT
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay7
	ld hl, wBreedMon1OT
	cp DAYCARE_WITHDRAW
	jr z, .okay8
	ld hl, PartyMonOT

.okay7
	ld a, [CurPartyMon]
	call SkipNames

.okay8
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1Nick
	jr z, .okay9
	dec a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	jr nz, .okay10
	ld hl, sBoxMonNicknames
	ld a, [sBoxCount]

.okay10
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay9
	ld hl, sBoxMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay11
	ld hl, wBreedMon1Nick
	cp DAYCARE_WITHDRAW
	jr z, .okay12
	ld hl, PartyMonNicknames

.okay11
	ld a, [CurPartyMon]
	call SkipNames

.okay12
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop hl

	ld a, [wPokemonWithdrawDepositParameter]
	cp PC_DEPOSIT
	jr z, .took_out_of_box
	cp DAYCARE_DEPOSIT
	jp z, .CloseSRAM_And_ClearCarryFlag

	push hl
	srl a
	add $2
	ld [MonType], a
	predef CopyPkmnToTempMon
	callab CalcLevel
	ld a, d
	ld [CurPartyLevel], a
	pop hl

	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EXP + 2
	add hl, bc

	push bc
	ld b, $1
	call CalcPkmnStats
	pop bc

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr nz, .CloseSRAM_And_ClearCarryFlag
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hl], a
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
rept 2
	inc hl
endr
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.took_out_of_box
	ld a, [sBoxCount]
	dec a
	ld b, a
	call Functiondcb6
.CloseSRAM_And_ClearCarryFlag
	call CloseSRAM
	and a
	ret
; dcb1

CloseSRAM_And_SetCarryFlag: ; dcb1
	call CloseSRAM
	scf
	ret
; dcb6

Functiondcb6: ; dcb6
	ld a, b
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_PP
	add hl, bc
	push hl
	push bc
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	ld hl, MON_MOVES
	add hl, bc
	push hl
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
	pop de

	ld a, [wMenuCursorY]
	push af
	ld a, [MonType]
	push af
	ld b, 0
.asm_dcec
	ld a, [hli]
	and a
	jr z, .asm_dd18
	ld [TempMonMoves], a
	ld a, BOXMON
	ld [MonType], a
	ld a, b
	ld [wMenuCursorY], a
	push bc
	push hl
	push de
	callba GetMaxPPOfMove
	pop de
	pop hl
	ld a, [wd265]
	ld b, a
	ld a, [de]
	and %11000000
	add b
	ld [de], a
	pop bc
	inc de
	inc b
	ld a, b
	cp NUM_MOVES
	jr c, .asm_dcec

.asm_dd18
	pop af
	ld [MonType], a
	pop af
	ld [wMenuCursorY], a
	ret
; dd21

Functiondd21: ; dd21
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call Functione698
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd42

Functiondd42: ; dd42
	ld a, [wBreedMon2Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call Functione6b3
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd64

Functiondd64: ; dd64
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .room_in_party
	scf
	ret

.room_in_party
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld a, [wBreedMon1Species]
	ld de, wBreedMon1Nick
	jr z, .okay
	ld a, [wBreedMon2Species]
	ld de, wBreedMon2Nick

.okay
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	push hl
	ld h, d
	ld l, e
	pop de
	call CopyBytes
	push hl
	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	push hl
	call Functionde1a
	pop hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	call GetBaseData
	call Functionde1a
	ld b, d
	ld c, e
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [CurPartyLevel]
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, $1
	call CalcPkmnStats
	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [Buffer1], a
	predef FillMoves
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	callba HealPartyMon
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop bc
	ld hl, $8
	add hl, bc
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	and a
	ret
; de1a

Functionde1a: ; de1a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ret
; de2a

Functionde2a: ; de2a
	ld de, wBreedMon1Nick
	call Functionde44
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox
; de37

Functionde37: ; de37
	ld de, wBreedMon2Nick
	call Functionde44
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp RemoveMonFromPartyOrBox
; de44

Functionde44: ; de44
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	jp CopyBytes

SentPkmnIntoBox: ; de6e
; Sents the Pkmn into one of Bills Boxes
; the data comes mainly from 'EnemyMon:'
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld de, sBoxCount
	ld a, [de]
	cp MONS_PER_BOX
	jp nc, .full
	inc a
	ld [de], a

	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	ld c, a
.loop
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .loop

	call GetBaseData
	call ShiftBoxMon

	ld hl, PlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName

	ld de, sBoxMonNicknames
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld hl, EnemyMon
	ld de, sBoxMon1
	ld bc, 1 + 1 + NUM_MOVES ; species + item + moves
	call CopyBytes

	ld hl, PlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hProduct + 1]
	ld [de], a
	inc de
	ld a, [hProduct + 2]
	ld [de], a
	inc de
	ld a, [hProduct + 3]
	ld [de], a
	inc de

    ; Set all 5 Experience Values to 0
	xor a
	ld b, 2 * 5
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2

	ld hl, EnemyMonDVs
	ld b, 2 + NUM_MOVES ; DVs and PP ; EnemyMonHappiness - EnemyMonDVs
.loop3
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop3

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	ld a, [CurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .not_unown
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callab UpdateUnownDex

.not_unown
	ld hl, sBoxMon1Moves
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, sBoxMon1PP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	ld b, 0
	call Functiondcb6

	call CloseSRAM
	scf
	ret
; df42

.full: ; df42
	call CloseSRAM
	and a
	ret
; df47

ShiftBoxMon: ; df47
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	call .shift

	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call .shift

	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH

.shift
	ld a, [sBoxCount]
	cp 2
	ret c

	push hl
	call AddNTimes
	dec hl
	ld e, l
	ld d, h
	pop hl

	ld a, [sBoxCount]
	dec a
	call AddNTimes
	dec hl

	push hl
	ld a, [sBoxCount]
	dec a
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; df8c

GiveEgg:: ; df8c
	ld a, [CurPartySpecies]
	push af
	callab GetPreEvolution
	callab GetPreEvolution
	ld a, [CurPartySpecies]
	dec a

; TryAddMonToParty sets Seen and Caught flags
; when it is successful.  This routine will make
; sure that we aren't newly setting flags.
	push af
	call CheckCaughtMon
	pop af
	push bc
	call CheckSeenMon
	push bc

	call TryAddMonToParty

; If we haven't caught this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_caught_flag
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexCaught
	ld b, RESET_FLAG
	predef FlagPredef

.skip_caught_flag
; If we haven't seen this Pokemon before receiving
; the Egg, reset the flag that was just set by
; TryAddMonToParty.
	pop bc
	ld a, c
	and a
	jr nz, .skip_seen_flag
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexSeen
	ld b, RESET_FLAG
	predef FlagPredef

.skip_seen_flag
	pop af
	ld [CurPartySpecies], a
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Species
	call AddNTimes
	ld a, [CurPartySpecies]
	ld [hl], a
	ld hl, PartyCount
	ld a, [hl]
	ld b, 0
	ld c, a
	add hl, bc
	ld a, EGG
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld de, String_Egg
	call CopyName2
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wc2cc]
	bit 1, a
	ld a, 1
	jr nz, .got_init_happiness
	ld a, [BaseEggSteps]

.got_init_happiness
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret
; e035

String_Egg: ; e035
	db "EGG@"
; e039

RemoveMonFromPartyOrBox: ; e039
	ld hl, PartyCount

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount

.okay
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.loop
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .loop
	ld hl, PartyMonOT
	ld d, PARTY_LENGTH - 1
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party
	ld hl, sBoxMonOT
	ld d, MONS_PER_BOX - 1

.party
	; If this is the last mon in our party (box),
	; shift all the other mons up to close the gap.
	ld a, [CurPartyMon]
	call SkipNames
	ld a, [CurPartyMon]
	cp d
	jr nz, .delete_inside
	ld [hl], -1
	jp .finish

.delete_inside
	; Shift the OT names
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party2
	ld bc, sBoxMonNicknames
.party2
	call CopyDataUntil
	; Shift the struct
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party4
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
.party4
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party5
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld bc, sBoxMonOT
	jr .copy

.party5
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, PartyMonOT
.copy
	call CopyDataUntil
	; Shift the nicknames
	ld hl, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party6
	ld hl, sBoxMonNicknames
.party6
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknamesEnd
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .party7
	ld bc, sBoxMonNicknamesEnd
.party7
	call CopyDataUntil
	; Mail time!
.finish
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jp nz, CloseSRAM
	ld a, [wLinkMode]
	and a
	ret nz
	; Shift mail
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	; If this is the last mon in our party, no need to shift mail.
	ld hl, PartyCount
	ld a, [CurPartyMon]
	cp [hl]
	jr z, .close_sram
	; Shift our mail messages up.
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	ld a, [CurPartyMon]
	ld b, a
.loop2
	push bc
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop hl
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	add hl, bc
	pop de
	pop bc
	inc b
	ld a, [PartyCount]
	cp b
	jr nz, .loop2
.close_sram
	jp CloseSRAM
; e134

ComputeNPCTrademonStats: ; e134
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [MON_LEVEL], a ; wow
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	push de
	ld a, MON_EXP + 2
	call GetPartyParamLocation
	ld b, $1
	call CalcPkmnStats
	pop de
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret
; e167

CalcPkmnStats: ; e167
; Calculates all 6 Stats of a Pkmn
; b = 0 or 1
; 'c' counts from 1-6 and points with 'BaseStats' to the base value
; results in $ffb5 and $ffb6 are saved in [de]

	ld c, $0
.loop
	inc c
	call CalcPkmnStatC
	ld a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ld a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF
	jr nz, .loop
	ret
; e17b

CalcPkmnStatC: ; e17b
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, BaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	ld a, c
	cp STAT_SDEF
	jr nz, .not_spdef
rept 2
	dec hl
endr

.not_spdef
	sla c
	ld a, d
	and a
	jr z, .SkipSqrt
	add hl, bc
	push de
	ld a, [hld]
	ld e, a
	ld d, [hl]
	callba GetSquareRoot
	pop de

.SkipSqrt
	srl c
	pop hl
	push bc
	ld bc, MON_DVS - MON_HP_EXP + 1
	add hl, bc
	pop bc
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 + (DV_DEF & 1) << 2 + (DV_SPD & 1) << 1 + (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and $1
rept 3
	add a
endr
	ld b, a
	ld a, [hli]
	and $1
rept 2
	add a
endr
	add b
	ld b, a
	ld a, [hl]
	swap a
	and $1
	add a
	add b
	ld b, a
	ld a, [hl]
	and $1
	add b
	pop bc
	jr .GotDV

.Attack
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense
	ld a, [hl]
	and $f
	jr .GotDV

.Speed
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special
	inc hl
	ld a, [hl]
	and $f

.GotDV
	ld d, 0
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ld [hMultiplicand + 2], a
	ld a, d
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand + 0], a
	ld a, [CurPartyLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 100
	ld [hDivisor], a
	ld a, 3
	ld b, a
	call Divide
	ld a, c
	cp STAT_HP
	ld a, 5
	jr nz, .not_hp
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_3
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_3
	ld a, 10

.not_hp
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_4
	ld a, [hQuotient + 1]
	cp (1000 / $100) + 1
	jr nc, .max_stat
	cp 1000 / $100
	jr c, .stat_value_okay
	ld a, [hQuotient + 2]
	cp 1000 % $100
	jr c, .stat_value_okay

.max_stat
	ld a, 999 / $100
	ld [hMultiplicand + 1], a
	ld a, 999 % $100
	ld [hMultiplicand + 2], a

.stat_value_okay
	pop bc
	pop de
	pop hl
	ret
; e277

GivePoke:: ; e277
	push de
	push bc
	xor a ; PARTYMON
	ld [MonType], a
	call TryAddMonToParty
	jr nc, .failed
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, 0
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [CurItem]
	ld [hl], a
	jr .done

.failed
	ld a, [CurPartySpecies]
	ld [TempEnemyMonSpecies], a
	callab LoadEnemyMon
	call SentPkmnIntoBox
	jp nc, .FailedToGiveMon
	ld a, BOXMON
	ld [MonType], a
	xor a
	ld [CurPartyMon], a
	ld de, wd050_MonNick
	pop bc
	ld a, b
	ld b, 1
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurItem]
	ld [sBoxMon1Item], a

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [TempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050_MonNick
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jp z, .wildmon
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [ScriptBank]
	call GetFarHalfword
	ld bc, PKMN_NAME_LENGTH
	ld a, [ScriptBank]
	call FarCopyBytes
	pop hl
rept 2
	inc hl
endr
	ld a, [ScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .send_to_box

	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, 01001 / $100
	ld [hli], a
	ld [hl], 01001 % $100
	pop bc
	callba SetGiftPartyMonCaughtData
	jr .skip_nickname

.send_to_box
	ld a, BANK(sBoxMonOT)
	call GetSRAMBank
	ld de, sBoxMonOT
.loop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .loop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	callba SetGiftBoxMonCaughtData
	jr .skip_nickname

.wildmon
	pop de
	pop bc
	push bc
	push de
	ld a, b
	and a
	jr z, .party
	callba SetBoxMonCaughtData
	jr .set_caught_data

.party
	callba SetCaughtData
.set_caught_data
	callba GiveANickname_YesNo
	pop de
	jr c, .skip_nickname
	call InitNickname

.skip_nickname
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld hl, wd050
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret
; e3d4

.FailedToGiveMon: ; e3d4
	pop bc
	pop de
	ld b, $2
	ret
; e3d9

TextJump_WasSentToBillsPC: ; 0xe3d9
	; was sent to BILL's PC.
	text_jump Text_WasSentToBillsPC
	db "@"
; 0xe3de

InitNickname: ; e3de
	push de
	call LoadStandardMenuDataHeader
	call DisableSpriteUpdates
	pop de
	push de
	ld b, $0
	callba NamingScreen
	pop hl
	ld de, StringBuffer1
	call InitName
	ld a, $4 ; XXX could this be in bank 4 in pokered?
	ld hl, ExitAllMenus
	rst FarCall
	ret
; e3fd

_BillsPC: ; e3fd
	call .CheckCanUsePC
	ret c
	call .LogIn
	call .UseBillsPC
	jp .LogOut

.CheckCanUsePC: ; e40a (3:640a)
	ld a, [PartyCount]
	and a
	ret nz
	ld hl, .Text_GottaHavePokemon
	call MenuTextBoxBackup
	scf
	ret
; e417 (3:6417)

.Text_GottaHavePokemon: ; 0xe417
	; You gotta have #MON to call!
	text_jump UnknownText_0x1c1006
	db "@"
; 0xe41c

.LogIn: ; e41c (3:641c)
	xor a
	ld [hBGMapMode], a
	call LoadStandardMenuDataHeader
	call ClearPCItemScreen
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld hl, .Text_What
	call PrintText
	pop af
	ld [Options], a
	call LoadFontsBattleExtra
	ret
; e43a (3:643a)

.Text_What: ; 0xe43a
	; What?
	text_jump UnknownText_0x1c1024
	db "@"
; 0xe43f

.LogOut: ; e43f (3:643f)
	call CloseSubmenu
	ret

.UseBillsPC: ; e443 (3:6443)
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ld a, $1
.loop
	ld [wMenuCursorBuffer], a
	call SetPalettes
	xor a
	ld [wcf76], a
	ld [hBGMapMode], a
	call DoNthMenu
	jr c, .cancel
	ld a, [wMenuCursorBuffer]
	push af
	ld a, [MenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	pop bc
	ld a, b
	jr nc, .loop
.cancel
	call WriteBackup
	ret
; e46f (3:646f)

.MenuDataHeader: ; 0xe46f
	db $40 ; flags
	db 00, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0xe477

.MenuData2: ; 0xe477
	db $80 ; flags
	db 0 ; items
	dw .items
	dw PlaceMenuStrings
	dw .strings
; 0xe47f

.strings: ; e47f
	db "WITHDRAW <PK><MN>@"
	db "DEPOSIT <PK><MN>@"
	db "CHANGE BOX@"
	db "MOVE <PK><MN> W/O MAIL@"
	db "SEE YA!@"

.Jumptable: ; e4ba (3:64ba)
	dw BillsPC_WithdrawMenu
	dw BillsPC_DepositMenu
	dw BillsPC_ChangeBoxMenu
	dw BillsPC_MovePKMNMenu
	dw BillsPC_SeeYa
; e4c4

.items: ; e4c4
	db 5
	db 0 ; WITHDRAW
	db 1;  DEPOSIT
	db 2 ; CHANGE BOX
	db 3 ; MOVE PKMN
	db 4 ; SEE YA!
	db -1
; e4cb

BillsPC_SeeYa: ; e4cb
	scf
	ret
; e4cd

BillsPC_MovePKMNMenu: ; e4cd
	call LoadStandardMenuDataHeader
	callba IsAnyMonHoldingMail
	jr nc, .no_mail
	ld hl, .Text_MonHoldingMail
	call PrintText
	jr .quit

.no_mail
	callba StartMovePkmnWOMail_SaveGame
	jr c, .quit
	callba _MovePKMNWithoutMail
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen

.quit
	call WriteBackup
	and a
	ret
; e4f9

.Text_MonHoldingMail: ; 0xe4f9
	; There is a #MON holding MAIL. Please remove the MAIL.
	text_jump UnknownText_0x1c102b
	db "@"
; 0xe4fe

BillsPC_DepositMenu: ; e4fe (3:64fe)
	call LoadStandardMenuDataHeader
	callba _DepositPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call WriteBackup
	and a
	ret
; e512 (3:6512)

Functione512: ; unused
	ld a, [PartyCount]
	and a
	jr z, .no_pkmn
	cp 2
	jr c, .only_one_pkmn
	and a
	ret

.no_pkmn
	ld hl, .Text_NoPKMN
	call MenuTextBoxBackup
	scf
	ret

.only_one_pkmn
	ld hl, .Text_ItsYourLastPKMN
	call MenuTextBoxBackup
	scf
	ret
; e52e

.Text_NoPKMN: ; 0xe52e
	; You don't have a single #MON!
	text_jump UnknownText_0x1c1062
	db "@"
; 0xe533

.Text_ItsYourLastPKMN: ; 0xe533
	; You can't deposit your last #MON!
	text_jump UnknownText_0x1c1080
	db "@"
; 0xe538

CheckCurPartyMonFainted: ; e538
	ld hl, PartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
	ld b, $0
.loop
	ld a, [CurPartyMon]
	cp b
	jr z, .skip
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	dec hl

.skip
	inc b
	ld a, [PartyCount]
	cp b
	jr z, .done
	add hl, de
	jr .loop

.done
	scf
	ret

.notfainted
	and a
	ret
; e559

BillsPC_WithdrawMenu: ; e559 (3:6559)
	call LoadStandardMenuDataHeader
	callba _WithdrawPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call WriteBackup
	and a
	ret
; e56d (3:656d)

Functione56d: ; unused
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .asm_e576
	and a
	ret

.asm_e576
	ld hl, UnknownText_0xe57e
	call MenuTextBoxBackup
	scf
	ret
; e57e

UnknownText_0xe57e: ; 0xe57e
	; You can't take any more #MON.
	text_jump UnknownText_0x1c10a2
	db "@"
; 0xe583

BillsPC_ChangeBoxMenu: ; e583 (3:6583)
	callba _ChangeBox
	and a
	ret

ClearPCItemScreen: ; e58b
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0,0
	lb bc, 10, 18
	call TextBox
	hlcoord 0,12
	lb bc, 4, 18
	call TextBox
	call WaitBGMap2
	call SetPalettes ; load regular palettes?
	ret
; 0xe5bb

Functione5bb: ; e5bb
	ld a, [CurPartyMon]
	ld hl, sBoxMon1Species
	ld bc, $20
	call AddNTimes
	ld de, TempMonSpecies
	ld bc, $20
	ld a, BANK(sBoxMon1Species)
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret
; e5d9

Functione5d9: ; unreferenced
	ld a, [wCurBox]
	cp b
	jr z, .asm_e5f1
	ld a, b
	ld hl, Unknown_e66e
	ld bc, 3
	call AddNTimes
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jr .asm_e5f6

.asm_e5f1
	ld a, BANK(sBoxCount)
	ld hl, sBoxCount

.asm_e5f6
	call GetSRAMBank
	ld a, [hl]
	ld bc, $16
	add hl, bc
	ld b, a
	ld c, $0
	ld de, wc608
	ld a, b
	and a
	jr z, .asm_e66a
.asm_e608
	push hl
	push bc
	ld a, c
	ld bc, 0
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	ld [CurSpecies], a
	call GetBaseData
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $35c
	add hl, bc
	call SkipNames
	call CopyBytes
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $1f
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $15
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hli]
	and $f0
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	or b
	ld b, a
	ld a, [BaseGender]
	cp b
	ld a, $1
	jr c, .asm_e662
	xor a

.asm_e662
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .asm_e608

.asm_e66a
	call CloseSRAM
	ret
; e66e

Unknown_e66e: ; e66e
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; e698

Functione698: ; e698
	ld hl, wBreedMon1Stats
	ld de, TempMon
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
; e6b3

Functione6b3: ; e6b3
	ld hl, wBreedMon2Stats
	ld de, TempMon
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
; e6ce

BugContest_SetCaughtContestMon: ; e6ce
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wd265], a
	callba DisplayAlreadyCaughtText
	callba DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [TempEnemyMonSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, .caughttext
	call PrintText
	ret
; e6fd

.generatestats: ; e6fd
	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [MonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats
; e71d

.caughttext: ; 0xe71d
	; Caught @ !
	text_jump UnknownText_0x1c10c0
	db "@"
; 0xe722

INCLUDE "items/item_effects.asm"

GetPokeBallWobble: ; f971 (3:7971)
; Returns whether a Poke Ball will wobble in the catch animation.
; Whether a Pokemon is caught is determined beforehand.

	push de

	ld a, [rSVBK]
	ld d, a
	push de

	ld a, 1 ; BANK(Buffer2)
	ld [rSVBK], a

	ld a, [Buffer2]
	inc a
	ld [Buffer2], a

; Wobble up to 3 times.
	cp 3 + 1
	jr z, .finished

	ld a, [wWildMon]
	and a
	ld c, 0 ; next
	jr nz, .done

	ld hl, WobbleChances
	ld a, [Buffer1]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr nc, .checkwobble
	inc hl
	jr .loop

.checkwobble
	ld b, [hl]
	call Random
	cp b
	ld c, 0 ; next
	jr c, .done
	ld c, 2 ; escaped
	jr .done

.finished
	ld a, [wWildMon]
	and a
	ld c, 1 ; caught
	jr nz, .done
	ld c, 2 ; escaped

.done
	pop de
	ld e, a
	ld a, d
	ld [rSVBK], a
	ld a, e
	pop de
	ret
; f9ba (3:79ba)

WobbleChances: ; f9ba
; catch rate, chance of wobbling / 255
	db   1,  63
	db   2,  75
	db   3,  84
	db   4,  90
	db   5,  95
	db   7, 103
	db  10, 113
	db  15, 126
	db  20, 134
	db  30, 149
	db  40, 160
	db  50, 169
	db  60, 177
	db  80, 191
	db 100, 201
	db 120, 211
	db 140, 220
	db 160, 227
	db 180, 234
	db 200, 240
	db 220, 246
	db 240, 251
	db 254, 253
	db 255, 255
; f9ea

KnowsMove: ; f9ea
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .Text_knows
	call PrintText
	scf
	ret
; fa06

.Text_knows: ; 0xfa06
	; knows @ .
	text_jump UnknownText_0x1c5ea8
	db "@"
; 0xfa0b

SECTION "bank4", ROMX, BANK[$4]

INCLUDE "engine/pack.asm"
INCLUDE "engine/time.asm"
INCLUDE "engine/tmhm.asm"
INCLUDE "engine/namingscreen.asm"
INCLUDE "engine/compose_mail.asm"

Script_AbortBugContest: ; 0x122c1
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special ContestReturnMons
.finish
	end
; 0x122ce

INCLUDE "event/itemball.asm"
INCLUDE "engine/healmachineanim.asm"
INCLUDE "event/whiteout.asm"
INCLUDE "event/forced_movement.asm"
INCLUDE "event/itemfinder.asm"
INCLUDE "engine/startmenu.asm"
INCLUDE "engine/selectmenu.asm"
INCLUDE "event/elevator.asm"

Special_GiveParkBalls: ; 135db
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	callba StartBugContestTimer
	ret
; 135eb

BugCatchingContestBattleScript:: ; 0x135eb
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	returnafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end
; 0x135f8

BugCatchingContestOverScript:: ; 0x135f8
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	jump BugCatchingContestReturnToGateScript
; 0x13603

BugCatchingContestOutOfBallsScript: ; 0x13603
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

BugCatchingContestReturnToGateScript: ; 0x1360b
	closetext
	jumpstd bugcontestresultswarp
; 0x1360f

BugCatchingContestText_BeeepTimesUp: ; 0x1360f
	; ANNOUNCER: BEEEP! Time's up!
	text_jump UnknownText_0x1bd2ca
	db "@"
; 0x13614

BugCatchingContestText_ContestIsOver: ; 0x13614
	; ANNOUNCER: The Contest is over!
	text_jump UnknownText_0x1bd2e7
	db "@"
; 0x13619

RepelWoreOffScript:: ; 0x13619
	opentext
	writetext .text
	waitbutton
	closetext
	end
; 0x13620

.text: ; 0x13620
	; REPEL's effect wore off.
	text_jump UnknownText_0x1bd308
	db "@"
; 0x13625

HiddenItemScript:: ; 0x13625
	opentext
	copybytetovar EngineBuffer3
	itemtotext 0, 0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	jump .finish
; 0x1363e

.bag_full: ; 0x1363e
	buttonsound
	writetext .no_room_text
	waitbutton

.finish: ; 13643
	closetext
	end
; 0x13645

.found_text: ; 0x13645
	; found @ !
	text_jump UnknownText_0x1bd321
	db "@"
; 0x1364a

.no_room_text: ; 0x1364a
	; But   has no space left…
	text_jump UnknownText_0x1bd331
	db "@"
; 0x1364f

SetMemEvent: ; 1364f
	ld hl, EngineBuffer1 ; wd03e (aliases: MenuItemsList, CurFruitTree, CurInput)
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret

CheckFacingTileForStd:: ; 1365b
; Checks to see if the tile you're facing has a std script associated with it.  If so, executes the script and returns carry.
	ld a, c
	ld de, 3
	ld hl, .table1
	call IsInArray
	jr nc, .notintable

	ld a, jumpstd_command
	ld [wJumpStdScriptBuffer], a
	inc hl
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 1], a
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 2], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret

.notintable
	xor a
	ret
; 13681

.table1
	dbw $91, magazinebookshelf
	dbw $93, pcscript
	dbw $94, radio1
	dbw $95, townmap
	dbw $96, merchandiseshelf
	dbw $97, tv
	dbw $9d, window
	dbw $9f, incenseburner
	db   -1 ; end
; 1369a

Script_JumpStdFromRAM: ; 0x1369a
	jump wJumpStdScriptBuffer
; 0x1369d

INCLUDE "event/bug_contest_judging.asm"

; decreases all pokemon's pokerus counter by b. if the lower nybble reaches zero, the pokerus is cured.
ApplyPokerusTick: ; 13988
	ld hl, PartyMon1PokerusStatus ; PartyMon1 + MON_PKRS
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
.loop
	ld a, [hl]
	and $f
	jr z, .does_not_have_pokerus
	sub b
	jr nc, .ok
	xor a

.ok
	ld d, a
	ld a, [hl]
	and $f0
	add d
	ld [hl], a

.does_not_have_pokerus
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
; 139a8

INCLUDE "event/bug_contest_2.asm"

INCLUDE "unknown/013a47.asm"

GetSquareRoot: ; 13b87
; Return the square root of de in b.

; Rather than calculating the result, we take the index of the
; first value in a table of squares that isn't lower than de.

	ld hl, Squares
	ld b, 0
.loop
; Make sure we don't go past the end of the table.
	inc b
	ld a, b
	cp $ff
	ret z

; Iterate over the table until b**2 >= de.
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d

	jr c, .loop
	ret

Squares: ; 13b98
root	set 1
	rept $ff
	dw root*root
root	set root+1
	endr
; 13d96

SECTION "bank5", ROMX, BANK[$5]

INCLUDE "engine/rtc.asm"
INCLUDE "engine/overworld.asm"
INCLUDE "engine/tile_events.asm"
INCLUDE "engine/save.asm"
INCLUDE "engine/spawn_points.asm"
INCLUDE "engine/map_setup.asm"
INCLUDE "engine/pokecenter_pc.asm"
INCLUDE "engine/mart.asm"
INCLUDE "engine/money.asm"
INCLUDE "items/marts.asm"
INCLUDE "event/mom.asm"
INCLUDE "event/daycare.asm"
INCLUDE "event/photo.asm"
INCLUDE "engine/breeding/egg.asm"

SECTION "Tileset Data 1", ROMX, BANK[TILESETS_1]

INCLUDE "tilesets/data_1.asm"

SECTION "Roofs", ROMX, BANK[ROOFS]

INCLUDE "tilesets/roofs.asm"

SECTION "Tileset Data 2", ROMX, BANK[TILESETS_2]

INCLUDE "tilesets/data_2.asm"

SECTION "bank8", ROMX, BANK[$8]

INCLUDE "engine/clock_reset.asm"

SECTION "Tileset Data 3", ROMX, BANK[TILESETS_3]

INCLUDE "tilesets/data_3.asm"

SECTION "bank9", ROMX, BANK[$9]

StringBufferPointers:: ; 24000
	dw StringBuffer3
	dw StringBuffer4
	dw StringBuffer5
	dw StringBuffer2
	dw StringBuffer1
	dw EnemyMonNick
	dw BattleMonNick
; 2400e

INCLUDE "engine/menu.asm"

UpdateItemDescription: ; 0x244c3
	ld a, [MenuSelection]
	ld [CurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	decoord 1, 14
	callba PrintItemDescription
	ret
; 0x244e3

Pokepic:: ; 244e3
	ld hl, PokepicMenuDataHeader
	call CopyMenuDataHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	ld b, SCGB_12
	call GetSGBLayout
	xor a
	ld [hBGMapMode], a
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld de, VTiles1
	predef GetFrontpic
	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	call Coord2Tile
	ld a, $80
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	call WaitBGMap
	ret
; 24528

ClosePokepic:: ; 24528
	ld hl, PokepicMenuDataHeader
	call CopyMenuDataHeader
	call ClearMenuBoxInterior
	call WaitBGMap
	call GetMemSGBLayout
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call LoadStandardFont
	ret
; 24547

PokepicMenuDataHeader: ; 0x24547
	db $40 ; flags
	db 04, 06 ; start coords
	db 13, 14 ; end coords
	dw NULL
	db 1 ; default option
; 0x2454f

LoadObjectMasks: ; 2454f
	ld hl, wObjectMasks
	xor a
	ld bc, NUM_OBJECTS
	call ByteFill
	nop
	ld bc, MapObjects
	ld de, wObjectMasks
	xor a
.loop
	push af
	push bc
	push de
	call GetObjectTimeMask
	jr c, .next
	call CheckObjectFlag
.next
	pop de
	ld [de], a
	inc de
	pop bc
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

CheckObjectFlag: ; 2457d (9:457d)
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .masked
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	cp -1
	jr nz, .check
	ld a, e
	cp -1
	jr z, .unmasked
	jr .masked
.check
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .masked
.unmasked
	xor a
	ret

.masked
	ld a, -1
	scf
	ret

GetObjectTimeMask: ; 245a7 (9:45a7)
	call CheckObjectTime
	ld a, -1
	ret c
	xor a
	ret

Function245af:: ; 245af
	xor a
	ld [wMenuJoypad], a
	ld [hBGMapMode], a
	inc a
	ld [hInMenu], a
	call ClearObjectStructsa
	call Function24764
	call Function247dd
	call Function245f1
	call ApplyTilemap
	xor a
	ld [hBGMapMode], a
	ret
; 245cb

Function245cb:: ; 245cb
.loop
	call MenuJoyAction
	jp c, .exit
	call z, .zero
	jr .loop
; 245d6

.exit: ; 245d6
	call MenuClickSound
	ld [wMenuJoypad], a
	ld a, 0
	ld [hInMenu], a
	ret
; 245e1

.zero: ; 245e1
	call Function245f1
	ld a, 1
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ret
; 245f1

Function245f1: ; 245f1
	xor a
	ld [hBGMapMode], a
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function247f0
	call Function2488b
	call Function248b8
	pop af
	ld [Options], a
	ret
; 24609

MenuJoyAction: ; 24609
.loop
	call ScrollingMenuJoypad
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyPressed]
	and BUTTONS
	or b
	bit 0, a ; A
	jp nz, .a_button
	bit 1, a ; B
	jp nz, .b_button
	bit 2, a ; Select
	jp nz, .select
	bit 3, a ; Start
	jp nz, .start
	bit 4, a ; Right
	jp nz, .d_right
	bit 5, a ; Left
	jp nz, .d_left
	bit 6, a ; Up
	jp nz, .d_up
	bit 7, a ; Down
	jp nz, .d_down
	jr .loop
; 24640

.unreferenced: ; unreferenced
	ld a, -1
	and a
	ret
; 24644

.a_button: ; 24644
	call Function1bee
	ld a, [wMenuCursorY]
	dec a
	call Function248d5
	ld a, [MenuSelection]
	ld [CurItem], a
	ld a, [wcf75]
	ld [wItemQuantityBuffer], a
	call Function246fc
	dec a
	ld [wcf77], a
	ld [wd107], a
	ld a, [MenuSelection]
	cp -1
	jr z, .b_button
	ld a, A_BUTTON
	scf
	ret
; 2466f

.b_button: ; 2466f
	ld a, B_BUTTON
	scf
	ret
; 24673

.select: ; 24673
	ld a, [wMenuData2Flags]
	bit 7, a
	jp z, xor_a_dec_a
	ld a, [wMenuCursorY]
	dec a
	call Function248d5
	ld a, [MenuSelection]
	cp -1
	jp z, xor_a_dec_a
	call Function246fc
	dec a
	ld [wcf77], a
	ld a, SELECT
	scf
	ret
; 24695

.start: ; 24695
	ld a, [wMenuData2Flags]
	bit 6, a
	jp z, xor_a_dec_a
	ld a, START
	scf
	ret
; 246a1

.d_left: ; 246a1
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 3, a
	jp z, xor_a_dec_a
	ld a, D_LEFT
	scf
	ret
; 246b5

.d_right: ; 246b5
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 2, a
	jp z, xor_a_dec_a
	ld a, D_RIGHT
	scf
	ret
; 246c9

.d_up: ; 246c9
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a
	ld hl, wMenuScrollPosition
	ld a, [hl]
	and a
	jr z, .xor_dec_up
	dec [hl]
	jp xor_a

.xor_dec_up
	jp xor_a_dec_a
; 246df

.d_down: ; 246df
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a
	ld hl, wMenuScrollPosition
	ld a, [wMenuData2Items]
	add [hl]
	ld b, a
	ld a, [wd144]
	cp b
	jr c, .xor_dec_down
	inc [hl]
	jp xor_a

.xor_dec_down
	jp xor_a_dec_a
; 246fc

Function246fc: ; 246fc
	ld a, [wMenuScrollPosition]
	ld c, a
	ld a, [wMenuCursorY]
	add c
	ld c, a
	ret
; 24706

Function24706: ; 24706 (9:4706)
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH
	add hl, de
	ld de, 2 * SCREEN_WIDTH
	ld a, [wMenuData2Items]
.asm_24713
	ld [hl], " "
	add hl, de
	dec a
	jr nz, .asm_24713
	ret

ClearObjectStructsa: ; 2471a
; Get the value of (wMenuData2Bank):(wMenuData2Addr) and store it in wd144.
	ld hl, wMenuData2Addr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMenuData2Bank]
	call GetFarByte
	ld [wd144], a
; if ([wd144] + 1) < [wMenuData2Items] + [wMenuScrollPosition]: [wMenuScrollPosition] = max(([wd144] + 1) - [wMenuData2Items], 0)
	ld a, [wMenuData2Items]
	ld c, a
	ld a, [wMenuScrollPosition]
	add c
	ld c, a
	ld a, [wd144]
	inc a
	cp c
	jr nc, .skip
	ld a, [wMenuData2Items]
	ld c, a
	ld a, [wd144]
	inc a
	sub c
	jr nc, .store
	xor a

.store
	ld [wMenuScrollPosition], a

.skip
	ld a, [wMenuScrollPosition]
	ld c, a
	ld a, [wMenuCursorBuffer]
	add c
	ld b, a
	ld a, [wd144]
	inc a
	cp b
	jr c, .asm_2475a
	jr nc, .asm_24763

.asm_2475a
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [wMenuCursorBuffer], a

.asm_24763
	ret
; 24764

Function24764: ; 24764
	ld a, [wMenuData2Flags]
	ld c, a
	ld a, [wd144]
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add $1
	ld [wcfa1], a
	ld a, [wMenuBorderLeftCoord]
	add $0
	ld [wcfa2], a
	ld a, [wMenuData2Items]
	cp b
	jr c, .asm_24786
	jr z, .asm_24786
	ld a, b
	inc a

.asm_24786
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $8c
	bit 2, c
	jr z, .asm_24796
	set 0, a

.asm_24796
	bit 3, c
	jr z, .asm_2479c
	set 1, a

.asm_2479c
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	ld a, $20
	ld [wcfa7], a
	ld a, $c3
	bit 7, c
	jr z, .asm_247b0
	add $4

.asm_247b0
	bit 6, c
	jr z, .asm_247b6
	add $8

.asm_247b6
	ld [wcfa8], a
	ld a, [wcfa3]
	ld b, a
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .asm_247c8
	cp b
	jr z, .asm_247ca
	jr c, .asm_247ca

.asm_247c8
	ld a, $1

.asm_247ca
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	xor a
	ld [wCursorCurrentTile], a
	ld [wCursorCurrentTile + 1], a
	ld [wCursorOffCharacter], a
	ret
; 247dd

Function247dd: ; 247dd
	ld a, [wd144]
	ld c, a
	ld a, [wd0e3]
	and a
	jr z, .asm_247ef
	dec a
	cp c
	jr c, .asm_247ef
	xor a
	ld [wd0e3], a

.asm_247ef
	ret
; 247f0

Function247f0: ; 247f0
	call ClearWholeMenuBox
	ld a, [wMenuData2Flags]
	bit 4, a
	jr z, .asm_2480d
	ld a, [wMenuScrollPosition]
	and a
	jr z, .asm_2480d
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], $61

.asm_2480d
	call MenuBoxCoord2Tile
	ld bc, $15
	add hl, bc
	ld a, [wMenuData2Items]
	ld b, a
	ld c, $0
.asm_2481a
	ld a, [wMenuScrollPosition]
	add c
	ld [wcf77], a
	ld a, c
	call Function248d5
	ld a, [MenuSelection]
	cp $ff
	jr z, .asm_24851
	push bc
	push hl
	call Function2486e
	pop hl
	ld bc, $28
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp b
	jr nz, .asm_2481a
	ld a, [wMenuData2Flags]
	bit 4, a
	jr z, .asm_24850
	ld a, [wMenuBorderBottomCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], $ee

.asm_24850
	ret

.asm_24851
	ld a, [wMenuData2Flags]
	bit 0, a
	jr nz, .asm_24866
	ld de, .string_2485f
	call PlaceString
	ret

.string_2485f
	db "CANCEL@"

.asm_24866
	ld d, h
	ld e, l
	ld hl, wcf98
	jp CallPointerAt
; 2486e

Function2486e: ; 2486e
	push hl
	ld d, h
	ld e, l
	ld hl, wcf98
	call CallPointerAt
	pop hl
	ld a, [wcf93]
	and a
	jr z, .asm_2488a
	ld e, a
	ld d, $0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wcf9b
	call CallPointerAt

.asm_2488a
	ret
; 2488b

Function2488b: ; 2488b
	ld a, [wd0e3]
	and a
	jr z, .asm_248b7
	ld b, a
	ld a, [wMenuScrollPosition]
	cp b
	jr nc, .asm_248b7
	ld c, a
	ld a, [wMenuData2Items]
	add c
	cp b
	jr c, .asm_248b7
	ld a, b
	sub c
	dec a
	add a
	add $1
	ld c, a
	ld a, [wMenuBorderTopCoord]
	add c
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	add $0
	ld c, a
	call Coord2Tile
	ld [hl], $ec

.asm_248b7
	ret
; 248b8

Function248b8: ; 248b8
	ld a, [wMenuData2Flags]
	bit 5, a
	ret z
	bit 1, a
	jr z, .asm_248c7
	ld a, [wd0e3]
	and a
	ret nz

.asm_248c7
	ld a, [wMenuCursorY]
	dec a
	call Function248d5
	ld hl, wcf9e
	call CallPointerAt
	ret
; 248d5

Function248d5: ; 248d5
	push de
	push hl
	ld e, a
	ld a, [wMenuScrollPosition]
	add e
	ld e, a
	ld d, $0
	ld hl, wMenuData2Addr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wcf94]
	cp $1
	jr z, .asm_248f2
	cp $2
	jr z, .asm_248f1

.asm_248f1
	add hl, de

.asm_248f2
	add hl, de
	ld a, [wMenuData2Bank]
	call GetFarByte
	ld [MenuSelection], a
	ld [CurItem], a
	inc hl
	ld a, [wMenuData2Bank]
	call GetFarByte
	ld [wcf75], a
	pop hl
	pop de
	ret
; 2490c

INCLUDE "engine/switch_items.asm"

PlaceMenuItemName: ; 0x24ab4
	push de
	ld a, [MenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret
; 0x24ac3

PlaceMenuItemQuantity: ; 0x24ac3
	push de
	ld a, [MenuSelection]
	ld [CurItem], a
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	jr nz, .done
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wcf75
	lb bc, 1, 2
	call PrintNum

.done
	ret
; 0x24ae8

PlaceMoneyTopRightOW: ; 24ae8
	ld hl, MenuDataHeader_0x24b15
	call CopyMenuDataHeader
	jr Function24b01

PlaceMoneyBottomLeftOW: ; 24af0
	ld hl, MenuDataHeader_0x24b1d
	call CopyMenuDataHeader
	jr Function24b01

PlaceMoneyTopRightMenu: ; 24af8
	ld hl, MenuDataHeader_0x24b15
	ld de, $b
	call Function1e2e

Function24b01: ; 24b01
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, $15
	add hl, de
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	ret
; 24b15

MenuDataHeader_0x24b15: ; 0x24b15
	db $40 ; flags
	db 00, 11 ; start coords
	db 02, 19 ; end coords
	dw NULL
	db 1 ; default option
; 0x24b1d

MenuDataHeader_0x24b1d: ; 0x24b1d
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 08 ; end coords
	dw NULL
	db 1 ; default option
; 0x24b25

Special_DisplayCoinCaseBalance: ; 24b25
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call TextBox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, Coins
	lb bc, 2, 4
	hlcoord 13, 1
	call PrintNum
	ret
; 24b4e

Special_DisplayMoneyAndCoinBalance: ; 24b4e
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 15, 3
	ld de, Coins
	lb bc, 2, 4
	call PrintNum
	ret
; 24b83

MoneyString: ; 24b83
	db "MONEY@"
CoinString: ; 24b89
	db "COIN@"
ShowMoney_TerminatorString: ; 24b8e
	db "@"
; 24b8f

Function24b8f: ; 24b8f
; unreferenced, related to safari?
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	hlcoord 0, 0
	ld b, 3
	ld c, 7
	call TextBox
	hlcoord 1, 1
	ld de, wSafariTimeRemaining
	lb bc, 2, 3
	call PrintNum
	hlcoord 4, 1
	ld de, .slash_500
	call PlaceString
	hlcoord 1, 3
	ld de, .booru_ko
	call PlaceString
	hlcoord 5, 3
	ld de, wSafariBallsRemaining
	lb bc, 1, 2
	call PrintNum
	pop af
	ld [Options], a
	ret
; 24bcf

.slash_500: ; 24bcf
	db "/500@"
.booru_ko: ; 24bd4
	db "ボール   こ@"
; 24bdc

Function24bdc: ; 24bdc
	hlcoord 0, 0
	ld b, $5
	ld c, $11
	call TextBox
	ret
; 24be7

Function24be7: ; 24be7
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function24bdc
	hlcoord 1, 5
	ld de, String24c52
	call PlaceString
	hlcoord 8, 5
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, String24c4b
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, String24c59
	jr z, .asm_24c1e
	ld [wd265], a
	call GetPokemonName

.asm_24c1e
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .asm_24c3e
	hlcoord 1, 3
	ld de, String24c5e
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, $3
	call Function3842

.asm_24c3e
	pop af
	ld [Options], a
	ret
; 24c43

String24c43: ; 24c43
	db "ボール   こ@"
String24c4b: ; 24c4b
	db "CAUGHT@"
String24c52: ; 24c52
	db "BALLS:@"
String24c59: ; 24c59
	db "None@"
String24c5e: ; 24c5e
	db "LEVEL@"
; 24c64

FindApricornsInBag: ; 24c64
; Checks the bag for Apricorns.
	ld hl, Buffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, .ApricornBalls
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
rept 2
	inc hl
endr
	jr .loop

.done
	ld a, [Buffer1]
	and a
	ret nz
	scf
	ret
; 24c94

.addtobuffer: ; 24c94
	push hl
	ld hl, Buffer1
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret
; 24ca0

.ApricornBalls: ; 24ca0
	db RED_APRICORN, LEVEL_BALL
	db BLU_APRICORN, LURE_BALL
	db YLW_APRICORN, MOON_BALL
	db GRN_APRICORN, FRIEND_BALL
	db WHT_APRICORN, FAST_BALL
	db BLK_APRICORN, HEAVY_BALL
	db PNK_APRICORN, LOVE_BALL
	db -1
; 24caf

INCLUDE "engine/mon_menu.asm"
INCLUDE "battle/menu.asm"
INCLUDE "engine/buy_sell_toss.asm"
INCLUDE "engine/trainer_card.asm"

ProfOaksPC: ; 0x265d3
	ld hl, OakPCText1
	call MenuTextBox
	call YesNoBox
	jr c, .shutdown
	call ProfOaksPCBoot ; player chose "yes"?
.shutdown
	ld hl, OakPCText4
	call PrintText
	call JoyWaitAorB
	call ExitMenu
	ret
; 0x265ee

ProfOaksPCBoot ; 0x265ee
	ld hl, OakPCText2
	call PrintText
	call Rate
	call PlaySFX ; sfx loaded by previous Rate function call
	call JoyWaitAorB
	call WaitSFX
	ret
; 0x26601

ProfOaksPCRating: ; 0x26601
	call Rate
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	call PlaySFX
	call JoyWaitAorB
	call WaitSFX
	ret
; 0x26616

Rate: ; 0x26616
; calculate Seen/Owned
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld [wd002], a
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld [wd003], a

; print appropriate rating
	call .UpdateRatingBuffers
	ld hl, OakPCText3
	call PrintText
	call JoyWaitAorB
	ld a, [wd003]
	ld hl, OakRatings
	call FindOakRating
	push de
	call PrintText
	pop de
	ret
; 0x26647

.UpdateRatingBuffers: ; 0x26647
	ld hl, StringBuffer3
	ld de, wd002
	call .UpdateRatingBuffer
	ld hl, StringBuffer4
	ld de, wd003
	call .UpdateRatingBuffer
	ret
; 0x2665a

.UpdateRatingBuffer: ; 0x2665a
	push hl
	ld a, "@"
	ld bc, ITEM_NAME_LENGTH
	call ByteFill
	pop hl
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ret
; 0x2666b

FindOakRating: ; 0x2666b
; return sound effect in de
; return text pointer in hl
	nop
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nc, .match
rept 4
	inc hl
endr
	jr .loop

.match
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 0x2667f

OakRatings: ; 0x2667f
oakrating: MACRO
	db \1
	dw \2, \3
endm

; if you caught at most this many, play this sound, load this text
	oakrating   9, SFX_DEX_FANFARE_LESS_THAN_20, OakRating01
	oakrating  19, SFX_DEX_FANFARE_LESS_THAN_20, OakRating02
	oakrating  34, SFX_DEX_FANFARE_20_49,        OakRating03
	oakrating  49, SFX_DEX_FANFARE_20_49,        OakRating04
	oakrating  64, SFX_DEX_FANFARE_50_79,        OakRating05
	oakrating  79, SFX_DEX_FANFARE_50_79,        OakRating06
	oakrating  94, SFX_DEX_FANFARE_80_109,       OakRating07
	oakrating 109, SFX_DEX_FANFARE_80_109,       OakRating08
	oakrating 124, SFX_CAUGHT_MON,               OakRating09
	oakrating 139, SFX_CAUGHT_MON,               OakRating10
	oakrating 154, SFX_DEX_FANFARE_140_169,      OakRating11
	oakrating 169, SFX_DEX_FANFARE_140_169,      OakRating12
	oakrating 184, SFX_DEX_FANFARE_170_199,      OakRating13
	oakrating 199, SFX_DEX_FANFARE_170_199,      OakRating14
	oakrating 214, SFX_DEX_FANFARE_200_229,      OakRating15
	oakrating 229, SFX_DEX_FANFARE_200_229,      OakRating16
	oakrating 239, SFX_DEX_FANFARE_230_PLUS,     OakRating17
	oakrating 248, SFX_DEX_FANFARE_230_PLUS,     OakRating18
	oakrating 255, SFX_DEX_FANFARE_230_PLUS,     OakRating19

OakPCText1: ; 0x266de
	text_jump _OakPCText1
	db "@"

OakPCText2: ; 0x266e3
	text_jump _OakPCText2
	db "@"

OakPCText3: ; 0x266e8
	text_jump _OakPCText3
	db "@"

OakRating01:
	text_jump _OakRating01
	db "@"

OakRating02:
	text_jump _OakRating02
	db "@"

OakRating03:
	text_jump _OakRating03
	db "@"

OakRating04:
	text_jump _OakRating04
	db "@"

OakRating05:
	text_jump _OakRating05
	db "@"

OakRating06:
	text_jump _OakRating06
	db "@"

OakRating07:
	text_jump _OakRating07
	db "@"

OakRating08:
	text_jump _OakRating08
	db "@"

OakRating09:
	text_jump _OakRating09
	db "@"

OakRating10:
	text_jump _OakRating10
	db "@"

OakRating11:
	text_jump _OakRating11
	db "@"

OakRating12:
	text_jump _OakRating12
	db "@"

OakRating13:
	text_jump _OakRating13
	db "@"

OakRating14:
	text_jump _OakRating14
	db "@"

OakRating15:
	text_jump _OakRating15
	db "@"

OakRating16:
	text_jump _OakRating16
	db "@"

OakRating17:
	text_jump _OakRating17
	db "@"

OakRating18:
	text_jump _OakRating18
	db "@"

OakRating19:
	text_jump _OakRating19
	db "@"

OakPCText4: ; 0x2674c
	text_jump _OakPCText4
	db "@"

INCLUDE "engine/decorations.asm"

PadCoords_de: ; 27092
	ld a, d
	add 4
	ld d, a
	ld a, e
	add 4
	ld e, a
	call GetBlockLocation
	ret
; 2709e

LevelUpHappinessMod: ; 2709e
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	callab ChangeHappiness
	ret
; 270c4

INCLUDE "trainers/dvs.asm"

_ReturnToBattle_UseBall: ; 2715c
	call ClearBGPalettes
	call ClearTileMap
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	callba GetMonBackpic
	jr .continue

.gettutorialbackpic
	callba GetTrainerBackpic
.continue
	callba GetMonFrontpic
	callba _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call WriteBackup
	call LoadStandardMenuDataHeader
	call WaitBGMap
	jp SetPalettes
; 27192

ConsumeHeldItem: ; 27192
	push hl
	push de
	push bc
	ld a, [hBattleTurn]
	and a
	ld hl, OTPartyMon1Item
	ld de, EnemyMonItem
	ld a, [CurOTMon]
	jr z, .theirturn
	ld hl, PartyMon1Item
	ld de, BattleMonItem
	ld a, [CurBattleMon]

.theirturn
	push hl
	push af
	ld a, [de]
	ld b, a
	callba GetItemHeldEffect
	ld hl, .ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop af
	pop hl
	pop bc
	pop de
	pop hl
	ret

.ok
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], $0

.done
	pop bc
	pop de
	pop hl
	ret
; 271de

.ConsumableEffects: ; 271de
; Consumable items?
	db HELD_BERRY
	db HELD_2
	db HELD_5
	db HELD_HEAL_POISON
	db HELD_HEAL_FREEZE
	db HELD_HEAL_BURN
	db HELD_HEAL_SLEEP
	db HELD_HEAL_PARALYZE
	db HELD_HEAL_STATUS
	db HELD_30
	db HELD_ATTACK_UP
	db HELD_DEFENSE_UP
	db HELD_SPEED_UP
	db HELD_SP_ATTACK_UP
	db HELD_SP_DEFENSE_UP
	db HELD_ACCURACY_UP
	db HELD_EVASION_UP
	db HELD_38
	db HELD_71
	db HELD_ESCAPE
	db HELD_CRITICAL_UP
	db -1
; 271f4

MoveEffectsPointers: ; 271f4
INCLUDE "battle/moves/move_effects_pointers.asm"

MoveEffects: ; 2732e
INCLUDE "battle/moves/move_effects.asm"

Function27a28: ; 27a28
	call BuySellToss_InterpretJoypad
	ld b, a
	ret
; 27a2d

SECTION "bankA", ROMX, BANK[$A]

INCLUDE "engine/link.asm"

Function29fe4: ; unreferenced
	ld a, $0
	call GetSRAMBank
	ld d, $0
	ld b, CHECK_FLAG
	predef FlagPredef
	call CloseSRAM
	ld a, c
	and a
	ret
; 29ff8

INCLUDE "engine/wildmons.asm"

DetermineLinkBattleResult: ; 2b930
	callba UpdateEnemyMonInParty
	ld hl, PartyMon1HP
	call .CountMonsRemaining
	push bc
	ld hl, OTPartyMon1HP
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
	ld hl, PartyMon1HP
	call .CalcPercentHPRemaining
	push de
	ld hl, OTPartyMon1HP
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
	ld [wBattleResult], a
	ret

.defeat
	ld a, [wBattleResult]
	and $f0
	add $1
	ld [wBattleResult], a
	ret

.drawn
	ld a, [wBattleResult]
	and $f0
	add $2
	ld [wBattleResult], a
	ret
; 2b995

.CountMonsRemaining: ; 2b995
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
; 2b9a6

.CalcPercentHPRemaining: ; 2b9a6
	ld de, 0
	ld c, $3
.loop2
	ld a, [hli]
	or [hl]
	jr z, .next
	dec hl
	xor a
	ld [hDividend + 0], a
	ld a, [hli]
	ld [hDividend + 1], a
	ld a, [hli]
	ld [hDividend + 2], a
	xor a
	ld [hDividend + 3], a
	ld a, [hli]
	ld b, a
	ld a, [hld]
	srl b
	rr a
	srl b
	rr a
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 2]
	add e
	ld e, a
	ld a, [hQuotient + 1]
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
; 2b9e1

.BothSides_CheckNumberMonsAtFullHealth: ; 2b9e1
	ld hl, PartyMon1HP
	call .CheckFaintedOrFullHealth
	jr nz, .finish ; we have a pokemon that's neither fainted nor at full health
	ld hl, OTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $1
	ret

.finish
	ld hl, OTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $0
	ret nz ; we both have pokemon that are neither fainted nor at full health
	ld e, $2
	ld a, $1
	and a
	ret
; 2ba01

.CheckFaintedOrFullHealth: ; 2ba01
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
; 2ba1a

ChrisBackpic: ; 2ba1a
INCBIN "gfx/misc/player.6x6.2bpp.lz"
; 2bbaa

DudeBackpic: ; 2bbaa
INCBIN "gfx/misc/dude.6x6.2bpp.lz"
; 2bcea

SECTION "bankB", ROMX, BANK[$B]

INCLUDE "battle/trainer_huds.asm"

TrainerClassNames:: ; 2c1ef
INCLUDE "text/trainer_class_names.asm"

INCLUDE "battle/ai/redundant.asm"

INCLUDE "event/move_deleter.asm"

INCLUDE "engine/mysterygift2.asm"

INCLUDE "engine/tmhm2.asm"

MoveDescriptions:: ; 2cb52
INCLUDE "battle/moves/move_descriptions.asm"
; 2ed44

Function2ed44: ; 2ed44
	call ConvertBerriesToBerryJuice
	ld hl, PartyMon1PokerusStatus
	ld a, [PartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
.loopMons
	ld a, [hl]
	and $f
	jr nz, .monHasActivePokerus
	add hl, de
	dec b
	jr nz, .loopMons
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	ld a, [hRandomAdd]
	and a
	ret nz
	ld a, [hRandomSub]
	cp $3
	ret nc                 ; 3/65536 chance (00 00, 00 01 or 00 02)
	ld a, [PartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, PartyMon1PokerusStatus
	call GetPartyLocation  ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz                 ; if it already has pokerus, do nothing
.randomPokerusLoop
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .asm_2ed91
	ld a, b
	and $7
	inc a

.asm_2ed91
	ld b, a
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.monHasActivePokerus
	call Random
	cp $55
	ret nc              ; 1/3 chance
	ld a, [PartyCount]
	cp $1
	ret z               ; only one mon, nothing to do
	ld c, [hl]
	ld a, b
	cp $2
	jr c, .checkPreviousMonsLoop    ; no more mons after this one, go backwards
	call Random
	cp $80
	jr c, .checkPreviousMonsLoop    ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	dec b               ; go on to next mon
	ld a, b
	cp $1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	ret

.checkPreviousMonsLoop
	ld a, [PartyCount]
	cp b
	ret z               ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	inc b               ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	ret
; 2ede6

; any berry held by a Shuckle may be converted to berry juice
ConvertBerriesToBerryJuice: ; 2ede6
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	cp $10
	ret nc              ; 1/16 chance
	ld hl, PartyMons
	ld a, [PartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [hl]
	cp SHUCKLE
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp BERRY
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
	ret

.convertToJuice
	ld a, BERRY_JUICE
	ld [hl], a
	pop hl
	pop af
	ret
; 2ee18

ShowLinkBattleParticipants: ; 2ee18
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	callba _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTileMap
	call ClearSprites
	ret
; 2ee2f

FindFirstAliveMon: ; 2ee2f
	xor a
	ld [hMapAnims], a
	call DelayFrame
	ld b, 6
	ld hl, PartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .okay
	add hl, de
	dec b
	jr nz, .loop

.okay
	ld de, MON_LEVEL - MON_HP
	add hl, de
	ld a, [hl]
	ld [BattleMonLevel], a
	predef Predef_StartBattle
	callba _LoadBattleFontsHPBar
	ld a, 1
	ld [hBGMapMode], a
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	ld [rWY], a
	ld [hMapAnims], a
	ret
; 2ee6c

PlayBattleMusic: ; 2ee6c

	push hl
	push de
	push bc

	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	ld a, [BattleType]
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done
	cp BATTLETYPE_ROAMING
	jp z, .done

	; Are we fighting a trainer?
	ld a, [OtherTrainerClass]
	and a
	jr nz, .trainermusic

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [TimeOfDay]
	cp NITE
	jr nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jr .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	jr .done

.trainermusic
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr z, .done
	cp RED
	jr z, .done

	; really, they should have included admins and scientists here too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	callba IsKantoGymLeader
	jr c, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	callba IsJohtoGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [OtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .othertrainer

	ld a, [OtherTrainerID]
	cp 4 ; Rival in Indigo Plateau
	jr c, .done
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johtotrainer

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret
; 2ef18

ClearBattleRAM: ; 2ef18
	xor a
	ld [wd0ec], a
	ld [wBattleResult], a

	ld hl, wd0d8
rept 3
	ld [hli], a
endr
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [CriticalHit], a
	ld [BattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [CurBattleMon], a
	ld [wForcedSwitch], a
	ld [TimeOfDayPal], a
	ld [PlayerTurnsTaken], a
	ld [EnemyTurnsTaken], a
	ld [EvolvableFlags], a

	ld hl, PlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, BattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, EnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callab ResetEnemyStatLevels

	call ResetTextRelatedRAM

	ld hl, hBGMapAddress
	xor a
	ld [hli], a
	ld [hl], $98
	ret
; 2ef6e

FillBox: ; 2ef6e
; Fill wc2c6-aligned box width b height c
; with iterating tile starting from hFillBox at hl.
; Predef $13

	ld de, 20

	ld a, [wc2c6]
	and a
	jr nz, .left

	ld a, [hFillBox]
.x1
	push bc
	push hl

.y1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y1

	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .x1
	ret

.left
; Right-aligned.
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc

	ld a, [hFillBox]
.x2
	push bc
	push hl

.y2
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y2

	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .x2
	ret
; 2ef9f

SECTION "Tileset Data 4", ROMX, BANK[TILESETS_4]

INCLUDE "tilesets/data_4.asm"

SECTION "Effect Commands", ROMX, BANK[$D]

INCLUDE "battle/effect_commands.asm"

SECTION "Enemy Trainers", ROMX, BANK[$E]

INCLUDE "battle/ai/items.asm"

AIScoring: ; 38591
INCLUDE "battle/ai/scoring.asm"

GetTrainerClassName: ; 3952d
	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .rival

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	ret

.rival
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret
; 39550

GetOTName: ; 39550
	ld hl, OTPlayerName
	ld a, [wLinkMode]
	and a
	jr nz, .ok

	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .ok

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld hl, StringBuffer1

.ok
	ld bc, TRAINER_CLASS_NAME_LENGTH
	ld de, OTName
	push de
	call CopyBytes
	pop de
	ret
; 3957b

GetTrainerAttributes: ; 3957b
	ld a, [TrainerClass]
	ld c, a
	call GetOTName
	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_ITEM1
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld de, wEnemyTrainerItem1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [wEnemyTrainerBaseReward], a
	ret
; 3959c

INCLUDE "trainers/attributes.asm"

INCLUDE "trainers/read_party.asm"

INCLUDE "trainers/trainer_pointers.asm"

INCLUDE "trainers/trainers.asm"

SECTION "Battle Core", ROMX, BANK[$F]

INCLUDE "battle/core.asm"

INCLUDE "battle/effect_command_pointers.asm"

SECTION "bank10", ROMX, BANK[$10]

INCLUDE "engine/pokedex.asm"

INCLUDE "battle/moves/moves.asm"

INCLUDE "engine/evolve.asm"

SECTION "bank11", ROMX, BANK[$11]

INCLUDE "engine/fruit_trees.asm"

INCLUDE "battle/ai/move.asm"

AnimateDexSearchSlowpoke: ; 441cf
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	call DelayFrames
	ret
; 441fc

.FrameIDs: ; 441fc
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2
; 44207

DoDexSearchSlowpokeFrame: ; 44207
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SpriteData
	ld de, Sprites
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop
; 44228

.SpriteData: ; 44228
	dsprite 11, 0,  9, 0, $00, $00
	dsprite 11, 0, 10, 0, $01, $00
	dsprite 11, 0, 11, 0, $02, $00
	dsprite 12, 0,  9, 0, $10, $00
	dsprite 12, 0, 10, 0, $11, $00
	dsprite 12, 0, 11, 0, $12, $00
	dsprite 13, 0,  9, 0, $20, $00
	dsprite 13, 0, 10, 0, $21, $00
	dsprite 13, 0, 11, 0, $22, $00
	db -1
; 4424d

DisplayDexEntry: ; 4424d
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wd265]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
rept 2
	inc hl
endr
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, 36
	call PrintNum
	hlcoord 14, 7
	ld [hl], $5e ; ft symbol
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, PRINTNUM_RIGHTALIGN | 5
	call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61 ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 11
	call FarString
	ret
; 44331

String_44331: ; 44331
	db "#@"
; 44333

GetDexEntryPointer: ; 44333
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret
; 44351

.PokedexEntryBanks: ; 44351

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; 44355

GetDexEntryPagePointer: ; 44355
	call GetDexEntryPointer ; b:de
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret
; 44378

PokedexDataPointerTable: ; 0x44378
INCLUDE "data/pokedex/entry_pointers.asm"

INCLUDE "engine/mail.asm"

SECTION "Crystal Unique", ROMX, BANK[$12]

INCLUDE "engine/init_gender.asm"

DrawKrisPackGFX: ; 48e81
	ld hl, PackFGFXPointers
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, VTiles2 tile $50
	lb bc, BANK(PackFGFX), 15
	call Request2bpp
	ret
; 48e93

PackFGFXPointers: ; 48e93
	dw PackFGFX + $f0 * 1
	dw PackFGFX + $f0 * 3
	dw PackFGFX + $f0 * 0
	dw PackFGFX + $f0 * 2
; 48e9b

PackFGFX: ; 48e9b
INCBIN "gfx/misc/pack_f.2bpp"
; 4925b

Special_MoveTutor: ; 4925b
	call FadeToMenu
	call ClearBGPalettes
	call ClearScreen
	call DelayFrame
	ld b, SCGB_14
	call GetSGBLayout
	xor a
	ld [wItemAttributeParamBuffer], a
	call .GetMoveTutorMove
	ld [wd265], a
	ld [wPutativeTMHMMove], a
	call GetMoveName
	call CopyName1
	callba ChooseMonToLearnTMHM
	jr c, .cancel
	jr .enter_loop

.loop
	callba ChooseMonToLearnTMHM_NoRefresh
	jr c, .cancel
.enter_loop
	call CheckCanLearnMoveTutorMove
	jr nc, .loop
	xor a
	ld [ScriptVar], a
	jr .quit

.cancel
	ld a, -1
	ld [ScriptVar], a
.quit
	call CloseSubmenu
	ret
; 492a5

.GetMoveTutorMove: ; 492a5
	ld a, [ScriptVar]
	cp 1
	jr z, .flamethrower
	cp 2
	jr z, .thunderbolt
	ld a, ICE_BEAM
	ret

.flamethrower
	ld a, FLAMETHROWER
	ret

.thunderbolt
	ld a, THUNDERBOLT
	ret
; 492b9

CheckCanLearnMoveTutorMove: ; 492b9
	ld hl, MenuDataHeader_0x4930a
	call LoadMenuDataHeader

	predef CanLearnTMHMMove

	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .can_learn
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, BANK(Text_TMHMNotCompatible)
	ld hl, Text_TMHMNotCompatible
	call FarPrintText
	jr .didnt_learn

.can_learn
	callab KnowsMove
	jr c, .didnt_learn

	predef LearnMove
	ld a, b
	and a
	jr z, .didnt_learn

	ld c, HAPPINESS_LEARNMOVE
	callab ChangeHappiness
	jr .learned

.didnt_learn
	call ExitMenu
	and a
	ret

.learned
	call ExitMenu
	scf
	ret
; 4930a

MenuDataHeader_0x4930a: ; 0x4930a
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords
; 4930f

Function4930f: ; 4930f (mobile)
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [SGBPredef]
.not_ram
	push af
	callba Function9673
	pop af
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp [hl]
.done
	ret
; 49330 (12:5330)

.jumptable: ; 49330
	jumptable_start
	jumptable Function4936e
	jumptable Function4942f
	jumptable Function49706
; 49336

Function49336: ; 49336
.asm_49336
	push bc
	push hl
.asm_49338
	ld [hli], a
	dec c
	jr nz, .asm_49338
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_49336
	ret
; 49346

Function49346: ; 49346 (12:5346)
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

Function49351: ; 49351 (12:5351)
	ld de, UnknBGPals
	ld hl, Palette_493e1
	ld bc, $28
	ld a, $5 ; BANK(UnknBGPals)
	call FarCopyWRAM
	ld de, UnknBGPals + $38
	ld hl, Palette_TextBG7
	ld bc, $8
	ld a, $5 ; BANK(UnknBGPals)
	call FarCopyWRAM
	ret

Function4936e: ; 4936e (12:536e)
	call Function49351
	call Function49346
	call Function49384
	callba Function96b3
	callba Function96a4
	ret

Function49384: ; 49384 (12:5384)
	hlcoord 0, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call Function49336
	lb bc, 2, 1
	ld a, $2
	call Function49336
	lb bc, 6, 1
	ld a, $3
	call Function49336
	hlcoord 1, 0, AttrMap
	ld a, $1
	lb bc, 3, 18
	call Function49336
	lb bc, 2, 18
	ld a, $2
	call Function49336
	lb bc, 12, 18
	ld a, $3
	call Function49336
	hlcoord 19, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call Function49336
	lb bc, 2, 1
	ld a, $2
	call Function49336
	lb bc, 6, 1
	ld a, $3
	call Function49336
	hlcoord 0, 12, AttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ret
; 493e1 (12:53e1)

Palette_493e1: ; 493e1
	RGB 03, 07, 09
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 31, 31, 31

	RGB 13, 24, 29
	RGB 11, 16, 30
	RGB 07, 11, 22
	RGB 05, 06, 18

	RGB 31, 31, 31
	RGB 20, 26, 31
	RGB 13, 24, 29
	RGB 11, 16, 30

	RGB 31, 31, 31
	RGB 20, 26, 31
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 16, 08
	RGB 31, 00, 00
	RGB 00, 00, 00
; 49409

LoadOW_BGPal7:: ; 49409
	ld hl, Palette_TextBG7
	ld de, UnknBGPals + 8 * 7
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	ret
; 49418

Palette_TextBG7: ; 49418
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
; 49420

Function49420:: ; 49420 (12:5420)
	ld hl, MansionPalette4
	ld de, UnknBGPals + $30
	ld bc, $8
	ld a, $5 ; BANK(UnknBGPals)
	call FarCopyWRAM
	ret
; 4942f (12:542f)

Function4942f: ; 4942f
	call Function49351
	ld de, UnknBGPals + $38
	ld hl, Palette_49478
	ld bc, $8
	ld a, $5 ; BANK(UnknBGPals)
	call FarCopyWRAM
	call Function49346
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 14, AttrMap
	ld bc, 4 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ld a, [wd002]
	bit 6, a
	jr z, .asm_49464
	call Function49480
	jr .asm_49467

.asm_49464
	call Function49496

.asm_49467
	callba Function96b3
	callba Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 49478

Palette_49478: ; 49478
	RGB 31, 31, 31
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 00, 00, 00
; 49480

Function49480: ; 49480
	hlcoord 0, 0, AttrMap
	lb bc, 4, SCREEN_WIDTH
	ld a, $7
	call Function49336
	hlcoord 0, 2, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 2, AttrMap
	ld [hl], a
	ret
; 49496

Function49496: ; 49496
	hlcoord 0, 0, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $7
	call Function49336
	hlcoord 0, 1, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 1, AttrMap
	ld [hl], a
	ret
; 494ac

LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE_1
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_CELADON_MANSION
	jr z, .mansion_mobile
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wPermission] ; permission
	and 7
	cp 3 ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret
; 494f2

LoadPokeComPalette: ; 494f2
	ld a, $5
	ld de, UnknBGPals
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49501

PokeComPalette: ; 49501
INCLUDE "tilesets/pokecom.pal"
; 49541

LoadBattleTowerPalette: ; 49541
	ld a, $5
	ld de, UnknBGPals
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49550

BattleTowerPalette: ; 49550
INCLUDE "tilesets/battle_tower.pal"
; 49590

LoadIcePathPalette: ; 49590
	ld a, $5
	ld de, UnknBGPals
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4959f

IcePathPalette: ; 4959f
INCLUDE "tilesets/ice_path.pal"
; 495df

LoadHousePalette: ; 495df
	ld a, $5
	ld de, UnknBGPals
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 495ee

HousePalette: ; 495ee
INCLUDE "tilesets/house.pal"
; 4962e

LoadRadioTowerPalette: ; 4962e
	ld a, $5
	ld de, UnknBGPals
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4963d

RadioTowerPalette: ; 4963d
INCLUDE "tilesets/radio_tower.pal"
; 4967d

MansionPalette1: ; 4967d
	RGB 30, 28, 26
	RGB 19, 19, 19
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 18, 24, 09
	RGB 15, 20, 01
	RGB 09, 13, 00
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 15, 16, 31
	RGB 09, 09, 31
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 26, 24, 17
	RGB 21, 17, 07
	RGB 16, 13, 03
	RGB 07, 07, 07

MansionPalette3: ; 496ad
	RGB 30, 28, 26
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 07, 07, 07

	RGB 31, 31, 16
	RGB 31, 31, 16
	RGB 14, 09, 00
	RGB 00, 00, 00
; 496bd

MansionPalette4: ; 496bd
	RGB 05, 05, 16
	RGB 08, 19, 28
	RGB 00, 00, 00
	RGB 31, 31, 31
; 496c5

LoadMansionPalette: ; 496c5
	ld a, $5
	ld de, UnknBGPals
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, UnknBGPals + 4 palettes
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, UnknBGPals + 3 palettes
	ld hl, MansionPalette3
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, UnknBGPals + 6 palettes
	ld hl, MansionPalette4
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
; 496fe

MansionPalette2: ; 496fe
	RGB 25, 24, 23
	RGB 20, 19, 19
	RGB 14, 16, 31
	RGB 07, 07, 07
; 49706

Function49706: ; 49706
	ld hl, Palette_49732
	ld de, UnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	call Function49346
	callba Function96b3
	ld hl, Palette_4973a
	ld de, UnknOBPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ret
; 49732

Palette_49732: ; 49732
	RGB 31, 31, 31
	RGB 23, 16, 07
	RGB 23, 07, 07
	RGB 03, 07, 20
; 4973a

Palette_4973a: ; 4973a
	RGB 00, 00, 00
	RGB 07, 05, 31
	RGB 14, 18, 31
	RGB 31, 31, 31
; 49742

Function49742: ; 49742
	ld hl, Palette_49757
	ld de, UnknBGPals
	ld bc, $40
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 49757

Palette_49757: ; 49757
	RGB 31, 31, 63
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 63
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 31, 00, 00
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 30, 16, 26
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 16, 16, 16
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 31, 12, 12
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 07, 08, 31
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 29, 28, 09
	RGB 31, 31, 31
; 49797

Function49797: ; 49797
	hlcoord 0, 0, AttrMap
	lb bc, 16, 2
	ld a, $4
	call Function49336
	ld a, $3
	ldcoord_a 0, 1, AttrMap
	ldcoord_a 0, 14, AttrMap
	hlcoord 2, 0, AttrMap
	lb bc, 8, 18
	ld a, $5
	call Function49336
	hlcoord 2, 8, AttrMap
	lb bc, 8, 18
	ld a, $6
	call Function49336
	hlcoord 0, 16, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, AttrMap
	call Function49336
	ld a, $2
	hlcoord 2, 16, AttrMap
	ld [hli], a
	ld a, $7
rept 3
	ld [hli], a
endr
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, AttrMap
	ld a, $3
	ld bc, 6
	call ByteFill
	ret
; 49811

Function49811: ; 49811
	ld hl, Palette_49826
	ld de, UnknBGPals + $10
	ld bc, $30
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 49826

Palette_49826: ; 49826
	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 31, 00, 00
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 15, 23, 30
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 16, 16, 16
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 25, 07, 04
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 03, 22, 08
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 29, 28, 09
	RGB 31, 31, 31
; 49856

Function49856: ; 49856
	call Function49797
	ret
; 4985a

Unknown_4985a: ; unreferenced
	db $ab, $03, $57, $24, $ac, $0e, $13, $32
	db $be, $30, $5b, $4c, $47, $60, $ed, $f2
	db $ab, $03, $55, $26, $aa, $0a, $13, $3a
	db $be, $28, $33, $24, $6e, $71, $df, $b0
	db $a8, $00, $e5, $e0, $9a, $fc, $f4, $2c
	db $fe, $4c, $a3, $5e, $c6, $3a, $ab, $4d
	db $a8, $00, $b5, $b0, $de, $e8, $fc, $1c
	db $ba, $66, $f7, $0e, $ba, $5e, $43, $bd

INCLUDE "event/celebi.asm"
INCLUDE "engine/main_menu.asm"
INCLUDE "engine/search.asm"
INCLUDE "misc/mobile_12_2.asm"
; mobile battle selection

AskRememberPassword: ; 4ae12
	call .DoMenu
	ld a, $0
	jr c, .okay
	ld a, $1

.okay
	ld [ScriptVar], a
	ret
; 4ae1f

.DoMenu: ; 4ae1f
	lb bc, 14, 7
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	and a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret
; 4ae5e

Buena_ExitMenu: ; 4ae5e
	ld a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ld [hOAMUpdate], a
	ret
; 4ae78

SECTION "bank13", ROMX, BANK[$13]

SwapTextboxPalettes:: ; 4c000
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
.innerloop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret
; 4c03f

ScrollBGMapPalettes:: ; 4c03f
	ld hl, BGMapBuffer
	ld de, BGMapPalBuffer
.loop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble

; .LowerNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret
; 4c075

INCLUDE "tilesets/palette_maps.asm"

TileCollisionTable:: ; 4ce1f
; 00 land
; 01 water
; 0f wall
; 11 talkable water
; 1f talkable wall

	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WALLTILE, NULL + WALLTILE, TALK + WALLTILE, NULL + LANDTILE, TALK + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WATRTILE
	db NULL + WALLTILE, NULL + WALLTILE, TALK + WALLTILE, NULL + LANDTILE, TALK + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WATRTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE

	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE

	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE

	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
; 4cf1f

EmptyAllSRAMBanks: ; 4cf1f
	ld a, $0
	call .EmptyBank
	ld a, $1
	call .EmptyBank
	ld a, $2
	call .EmptyBank
	ld a, $3
	call .EmptyBank
	ret
; 4cf34

.EmptyBank: ; 4cf34
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
; 4cf45

SaveMenu_LoadEDTile: ; 4cf45 (13:4f45)
	ld a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of Function3246.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.WaitLY
	ld a, [rLY]
	cp $60
	jr c, .WaitLY

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call Function4cf80
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call Function4cf80
.WaitLY2
	ld a, [rLY]
	cp $60
	jr c, .WaitLY2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

Function4cf80: ; 4cf80 (13:4f80)
	ld [hSPBuffer], sp ; $ffd9
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

CheckSave:: ; 4cffe
	ld a, BANK(s1_a008)
	call GetSRAMBank
	ld a, [s1_a008]
	ld b, a
	ld a, [s1_ad0f]
	ld c, a
	call CloseSRAM
	ld a, b
	cp 99
	jr nz, .ok
	ld a, c
	cp " "
	jr nz, .ok
	ld c, $1
	ret

.ok
	ld c, $0
	ret
; 4d01e

INCLUDE "engine/map_triggers.asm"

_LoadMapPart:: ; 4d15b
	ld hl, wMisc
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, WMISC_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
rept 2
	inc hl
endr

.left_column
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add 4
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret
; 4d188

PhoneRing_LoadEDTile: ; 4d188
	ld a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	cp $0
	jp z, WaitBGMap

; What follows is a modified version of Function3246 (LoadEDTile).
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.wait
	ld a, [rLY]
	cp $8f
	jr c, .wait

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .LoadEDTile
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call .LoadEDTile
.wait2
	ld a, [rLY]
	cp $8f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 4d1cb

.LoadEDTile: ; 4d1cb
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 4d249

Shrink1Pic: ; 4d249
INCBIN "gfx/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/shrink2.2bpp.lz"
; 4d319

Function4d319: ; 4d319
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	predef StatsScreenInit
	ld a, [CurPartyMon]
	inc a
	ld [wMenuCursorY], a
	call ClearScreen
	call ClearBGPalettes
	call MaxVolume
	callba Function28ef8
	callba Function4d354
	callba Function16d673
	callba Function28eff
	call WaitBGMap2
	ret
; 4d354

Function4d354: ; 4d354
	call WaitBGMap
	call WaitBGMap2
	ret
; 4d35b

Function4d35b: ; 4d35b
	ld h, d
	ld l, e
	push bc
	push hl
	call Function4d37e
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, $7
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret
; 4d37e

Function4d37e: ; 4d37e
	push hl
	ld a, $76
	ld [hli], a
	inc a
	call Function4d3ab
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, "┌"
	ld [hli], a
	ld a, " "
	call Function4d3ab
	ld [hl], "─"
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, "┐"
	ld [hli], a
	ld a, "│"
	call Function4d3ab
	ld [hl], "└"
	ret
; 4d3ab

Function4d3ab: ; 4d3ab
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret
; 4d3b1

_ResetClock: ; 4d3b1
	callba Function8000
	ld b, SCGB_08
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .text_askreset
	call PrintText
	ld hl, .NoYes_MenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	call ClockResetPassword
	jr c, .wrongpassword
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	ld a, $80
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ld hl, .text_okay
	call PrintText
	ret

.wrongpassword
	ld hl, .text_wrong
	call PrintText
	ret
; 4d3fe

.text_okay: ; 0x4d3fe
	; Password OK. Select CONTINUE & reset settings.
	text_jump UnknownText_0x1c55db
	db "@"
; 0x4d403

.text_wrong: ; 0x4d403
	; Wrong password!
	text_jump UnknownText_0x1c560b
	db "@"
; 0x4d408

.text_askreset: ; 0x4d408
	; Reset the clock?
	text_jump UnknownText_0x1c561c
	db "@"
; 0x4d40d

.NoYes_MenuDataHeader: ; 0x4d40d
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .NoYes_MenuData2
	db 1 ; default option
; 0x4d415

.NoYes_MenuData2: ; 0x4d415
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
; 0x4d41e

ClockResetPassword: ; 4d41e
	call .CalculatePassword
	push de
	ld hl, StringBuffer2
	ld bc, 5
	xor a
	call ByteFill
	ld a, $4
	ld [StringBuffer2 + 5], a
	ld hl, .pleaseenterpasswordtext
	call PrintText
.loop
	call .updateIDdisplay
.loop2
	call JoyTextDelay
	ld a, [hJoyLast]
	ld b, a
	and A_BUTTON
	jr nz, .confirm
	ld a, b
	and D_PAD
	jr z, .loop2
	call .dpadinput
	ld c, 3
	call DelayFrames
	jr .loop

.confirm
	call .ConvertDecIDToBytes
	pop de
	ld a, e
	cp l
	jr nz, .nope
	ld a, d
	cp h
	jr nz, .nope
	and a
	ret

.nope
	scf
	ret
; 4d463

.pleaseenterpasswordtext: ; 0x4d463
	; Please enter the password.
	text_jump UnknownText_0x1c562e
	db "@"
; 0x4d468

.updateIDdisplay: ; 4d468
	hlcoord 14, 15
	ld de, StringBuffer2
	ld c, 5
.loop3
	ld a, [de]
	add "0"
	ld [hli], a
	inc de
	dec c
	jr nz, .loop3
	hlcoord 14, 16
	ld bc, 5
	ld a, " "
	call ByteFill
	hlcoord 14, 16
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $61
	ret
; 4d490

.dpadinput: ; 4d490
	ld a, b
	and D_LEFT
	jr nz, .left
	ld a, b
	and D_RIGHT
	jr nz, .right
	ld a, b
	and D_UP
	jr nz, .up
	ld a, b
	and D_DOWN
	jr nz, .down
	ret

.left
	ld a, [StringBuffer2 + 5]
	and a
	ret z
	dec a
	ld [StringBuffer2 + 5], a
	ret

.right
	ld a, [StringBuffer2 + 5]
	cp $4
	ret z
	inc a
	ld [StringBuffer2 + 5], a
	ret

.up
	call .getcurrentdigit
	ld a, [hl]
	cp 9
	jr z, .wraparound_up
	inc a
	ld [hl], a
	ret

.wraparound_up
	ld [hl], $0
	ret

.down
	call .getcurrentdigit
	ld a, [hl]
	and a
	jr z, .wraparound_down
	dec a
	ld [hl], a
	ret

.wraparound_down
	ld [hl], 9
	ret
; 4d4d5

.getcurrentdigit: ; 4d4d5
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	ld hl, StringBuffer2
	add hl, de
	ret
; 4d4e0

.ConvertDecIDToBytes: ; 4d4e0
	ld hl, 0
	ld de, StringBuffer2 + 4
	ld bc, 1
	call .ConvertToBytes
	ld bc, 10
	call .ConvertToBytes
	ld bc, 100
	call .ConvertToBytes
	ld bc, 1000
	call .ConvertToBytes
	ld bc, 10000
.ConvertToBytes: ; 4d501
	ld a, [de]
	dec de
	push hl
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
	add hl, bc
	ret
; 4d50f

.CalculatePassword: ; 4d50f
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld de, 0
	ld hl, sPlayerData + (PlayerID - wPlayerData)
	ld c, $2
	call .ComponentFromNumber
	ld hl, sPlayerData + (PlayerName - wPlayerData)
	ld c, $5 ; PLAYER_NAME_LENGTH_J
	call .ComponentFromString
	ld hl, sPlayerData + (Money - wPlayerData)
	ld c, $3
	call .ComponentFromNumber
	call CloseSRAM
	ret
; 4d533

.ComponentFromNumber: ; 4d533
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromNumber
	ret
; 4d53e

.ComponentFromString: ; 4d53e
	ld a, [hli]
	cp "@"
	ret z
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromString
	ret
; 4d54c

Function4d54c: ; 4d54c
	callba Function8000
	ld b, SCGB_08
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, UnknownText_0x4d580
	call PrintText
	ld hl, MenuDataHeader_0x4d585
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	callba EmptyAllSRAMBanks
	ret
; 4d580

UnknownText_0x4d580: ; 0x4d580
	; Clear all save data?
	text_jump UnknownText_0x1c564a
	db "@"
; 0x4d585

MenuDataHeader_0x4d585: ; 0x4d585
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x4d58d
	db 1 ; default option
; 0x4d58d

MenuData2_0x4d58d: ; 0x4d58d
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
; 0x4d596

Tilesets::
INCLUDE "tilesets/tileset_headers.asm"

FlagPredef: ; 4d7c1
; Perform action b on flag c in flag array hl.
; If checking a flag, check flag array d:hl unless d is 0.

; For longer flag arrays, see FlagAction.

	push hl
	push bc

; Divide by 8 to get the byte we want.
	push bc
	srl c
	srl c
	srl c
	ld b, 0
	add hl, bc
	pop bc

; Which bit we want from the byte
	ld a, c
	and 7
	ld c, a

; Shift left until we can mask the bit
	ld a, 1
	jr z, .shifted
.shift
	add a
	dec c
	jr nz, .shift
.shifted
	ld c, a

; What are we doing to this flag?
	dec b
	jr z, .set ; 1
	dec b
	jr z, .check ; 2

.reset
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	jr .done

.set
	ld a, [hl]
	or c
	ld [hl], a
	jr .done

.check
	ld a, d
	cp 0
	jr nz, .farcheck

	ld a, [hl]
	and c
	jr .done

.farcheck
	call GetFarByte
	and c

.done
	pop bc
	pop hl
	ld c, a
	ret
; 4d7fd

Function4d7fd: ; 4d7fd
	ld a, [wc702]
	ld hl, wEnemyTrappingMove
	ld de, VTiles2
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef FrontpicPredef
	ret
; 4d81e

Function4d81e: ; 4d81e
	ld a, [wc702]
	call IsAPokemon
	ret c
	callba Function29549
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wEnemyTrappingMove]
	ld [TempMonDVs], a
	ld a, [wPlayerWrapCount]
	ld [TempMonDVs + 1], a
	ld b, SCGB_1A
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	callba Function294c0
	ld a, [wc702]
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret
; 4d860

CheckPokerus: ; 4d860
; Return carry if a monster in your party has Pokerus

; Get number of monsters to iterate over
	ld a, [PartyCount]
	and a
	jr z, .NoPokerus
	ld b, a
; Check each monster in the party for Pokerus
	ld hl, PartyMon1PokerusStatus
	ld de, PARTYMON_STRUCT_LENGTH
.Check
	ld a, [hl]
	and $0f ; only the bottom nybble is used
	jr nz, .HasPokerus
; Next PartyMon
	add hl, de
	dec b
	jr nz, .Check
.NoPokerus
	and a
	ret
.HasPokerus
	scf
	ret
; 4d87a

Special_CheckForLuckyNumberWinners: ; 4d87a
	xor a
	ld [ScriptVar], a
	ld [wFoundMatchingIDInParty], a
	ld a, [PartyCount]
	and a
	ret z
	ld d, a
	ld hl, PartyMon1ID
	ld bc, PartySpecies
.PartyLoop
	ld a, [bc]
	inc bc
	cp EGG
	call nz, .CompareLuckyNumberToMonID
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .PartyLoop
	ld a, BANK(sBox)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .SkipOpenBox
	ld d, a
	ld hl, sBoxMon1ID
	ld bc, sBoxSpecies
.OpenBoxLoop
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipOpenBoxMon
	call .CompareLuckyNumberToMonID
	jr nc, .SkipOpenBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipOpenBoxMon
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .OpenBoxLoop

.SkipOpenBox
	call CloseSRAM
	ld c, $0
.BoxesLoop
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .SkipBox
	ld hl, .BoxBankAddresses
	ld b, 0
rept 3
	add hl, bc
endr
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl now contains the address of the loaded box in SRAM
	ld a, [hl]
	and a
	jr z, .SkipBox ; no mons in this box
	push bc
	ld b, h
	ld c, l
	inc bc
	ld de, sBoxMon1ID - sBox
	add hl, de
	ld d, a
.BoxNLoop
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipBoxMon

	call .CompareLuckyNumberToMonID ; sets ScriptVar and CurPartySpecies appropriately
	jr nc, .SkipBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipBoxMon
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .BoxNLoop
	pop bc

.SkipBox
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .BoxesLoop

	call CloseSRAM
	ld a, [ScriptVar]
	and a
	ret z ; found nothing
	callba MobileFn_1060cd
	ld a, [wFoundMatchingIDInParty]
	and a
	push af
	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .FoundPartymonText
	pop af
	jr z, .print
	ld hl, .FoundBoxmonText

.print
	jp PrintText
; 4d939

.CompareLuckyNumberToMonID: ; 4d939
	push bc
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, Buffer1
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, LuckyNumberDigit1Buffer
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld b, 5
	ld c, 0
	ld hl, LuckyNumberDigit5Buffer
	ld de, Buffer5
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	dec de
	dec hl
	inc c
	dec b
	jr nz, .loop

.done
	pop hl
	push hl
	ld de, -6
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	push af
	ld a, c
	ld b, 1
	cp 5
	jr z, .okay
	ld b, 2
	cp 3
	jr nc, .okay
	ld b, 3
	cp 2
	jr nz, .nomatch

.okay
	inc b
	ld a, [ScriptVar]
	and a
	jr z, .bettermatch
	cp b
	jr c, .nomatch

.bettermatch
	dec b
	ld a, b
	ld [ScriptVar], a
	pop bc
	ld a, b
	ld [CurPartySpecies], a
	pop bc
	scf
	ret

.nomatch
	pop bc
	pop bc
	and a
	ret
; 4d99f

.BoxBankAddresses: ; 4d99f
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; 4d9c9

.FoundPartymonText: ; 0x4d9c9
	; Congratulations! We have a match with the ID number of @  in your party.
	text_jump UnknownText_0x1c1261
	db "@"
; 0x4d9ce

.FoundBoxmonText: ; 0x4d9ce
	; Congratulations! We have a match with the ID number of @  in your PC BOX.
	text_jump UnknownText_0x1c12ae
	db "@"
; 0x4d9d3

Special_PrintTodaysLuckyNumber: ; 4d9d3
	ld hl, StringBuffer3
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [StringBuffer3 + 5], a
	ret
; 4d9e5

CheckPartyFullAfterContest: ; 4d9e5
	ld a, [wContestMon]
	and a
	jp z, .DidntCatchAnything
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, PartyCount
	ld a, [hl]
	cp 6
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [MonType], a
	ld de, wd050
	callab InitNickname

.Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wd050
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	call SetCaughtData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a
	ld [ScriptVar], a
	ret
; 4daa3

.TryAddToBox: ; 4daa3
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [CurPartyMon], a
	ld hl, wContestMon
	ld de, wd018_Mon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, PlayerName
	ld de, wd00d_MonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	callab Function51322
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, StringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [MonType], a
	ld de, wd050_MonNick
	callab InitNickname
	ld hl, wd050_MonNick

.Box_SkipNickname
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM

.BoxFull
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [CurPartyLevel], a
	call CloseSRAM
	call SetBoxMonCaughtData
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ld a, $1
	ld [ScriptVar], a
	ret
; 4db35

.DidntCatchAnything: ; 4db35
	ld a, $2
	ld [ScriptVar], a
	ret
; 4db3b

GiveANickname_YesNo: ; 4db3b
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox
; 4db44

TextJump_GiveANickname: ; 0x4db44
	; Give a nickname to the @  you received?
	text_jump UnknownText_0x1c12fc
	db "@"
; 0x4db49

SetCaughtData: ; 4db49
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData: ; 4db53
	ld a, [TimeOfDay]
	inc a
	rrca
	rrca
	ld b, a
	ld a, [CurPartyLevel]
	or b
	ld [hli], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokeCenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokeCenter2F

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a

.NotPokeCenter2F
	call GetWorldMapLocation
	ld b, a
	ld a, [PlayerGender]
	rrca
	or b
	ld [hl], a
	ret
; 4db83

SetBoxMonCaughtData: ; 4db83
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	call SetBoxmonOrEggmonCaughtData
	call CloseSRAM
	ret
; 4db92

SetGiftBoxMonCaughtData: ; 4db92
	push bc
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	pop bc
	call SetGiftMonCaughtData
	call CloseSRAM
	ret
; 4dba3

SetGiftPartyMonCaughtData: ; 4dba3
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData: ; 4dbaf
	xor a
	ld [hli], a
	ld a, $7e
	rrc b
	or b
	ld [hl], a
	ret
; 4dbb8

SetEggMonCaughtData: ; 4dbb8 (13:5bb8)
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
	ld a, [CurPartyLevel]
	push af
	ld a, $1
	ld [CurPartyLevel], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [CurPartyLevel], a
	ret

_FindGreaterThanThatLevel: ; 4dbd2
	ld hl, PartyMon1Level
	call FindGreaterThanThatLevel
	ret
; 4dbd9

_FindAtLeastThatHappy: ; 4dbd9
	ld hl, PartyMon1Happiness
	call FindAtLeastThatHappy
	ret
; 4dbe0

_FindThatSpecies: ; 4dbe0
	ld hl, PartyMon1Species
	jp FindThatSpecies
; 4dbe6

_FindThatSpeciesYourTrainerID: ; 4dbe6
	ld hl, PartyMon1Species
	call FindThatSpecies
	ret z
	ld a, c
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [PlayerID]
	cp [hl]
	jr nz, .nope
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	jr nz, .nope
	ld a, $1
	and a
	ret

.nope
	xor a
	ret
; 4dc0a

FindAtLeastThatHappy: ; 4dc0a
; Sets the bits for the Pokemon that have a happiness greater than or equal to b.
; The lowest bits are used.  Sets z if no Pokemon in your party is at least that happy.
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr z, .greater_equal
	jr nc, .lower

.greater_equal
	ld a, c
	or $1
	ld c, a

.lower
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret
; 4dc31

FindGreaterThanThatLevel: ; 4dc31
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr c, .greater
	ld a, c
	or $1
	ld c, a

.greater
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret
; 4dc56

FindThatSpecies: ; 4dc56
; Find species b in your party.
; If you have no Pokemon, returns c = -1 and z.
; If that species is in your party, returns its location in c, and nz.
; Otherwise, returns z.
	ld c, -1
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	inc c
	cp b
	jr nz, .loop
	ld a, $1
	and a
	ret
; 4dc67

RetroactivelyIgnoreEggs: ; 4dc67
	ld e, -2
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr nz, .skip_notegg
	ld a, c
	and e
	ld c, a

.skip_notegg
	rlc e
	jr .loop
; 4dc7b

INCLUDE "engine/stats_screen.asm"

CatchTutorial:: ; 4e554
	ld a, [BattleType]
	dec a
	ld c, a
	ld hl, .jumptable
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 4e564

.jumptable: ; 4e564 (13:6564)
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial: ; 4e56a (13:656a)
; Back up your name to your Mom's name.
	ld hl, PlayerName
	ld de, MomsName
	ld bc, NAME_LENGTH
	call CopyBytes
; Copy Dude's name to your name
	ld hl, .Dude
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadDudeData

	xor a
	ld [hJoyDown], a
	ld [hJoyPressed], a
	ld a, [Options]
	push af
	and $f8
	add $3
	ld [Options], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callab StartBattle
	call StopAutoInput
	pop af

	ld [Options], a
	ld hl, MomsName
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.LoadDudeData: ; 4e5b7 (13:65b7)
	ld hl, wDudeNumItems
	ld [hl], 1
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], 1
	inc hl
	ld [hl], -1
	ld hl, wDudeNumKeyItems
	ld [hl], 0
	inc hl
	ld [hl], -1
	ld hl, wDudeNumBalls
	ld a, 1
	ld [hli], a
	ld a, POKE_BALL ; 5
rept 2
	ld [hli], a
endr
	ld [hl], -1
	ret
; 4e5da (13:65da)

.Dude: ; 4e5da
	db "DUDE@"
; 4e5df

.AutoInput: ; 4e5df
	db NO_INPUT, $ff ; end
; 4e5e1

INCLUDE "engine/evolution_animation.asm"

Function4e881: ; 4e881
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	ld hl, .SavingRecordDontTurnOff
	call PrintText
	call WaitBGMap2
	call SetPalettes
	ret
; 4e8bd

.SavingRecordDontTurnOff: ; 0x4e8bd
	; SAVING RECORD… DON'T TURN OFF!
	text_jump UnknownText_0x1bd39e
	db "@"
; 0x4e8c2

Function4e8c2: ; 4e8c2
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld hl, wd000 ; UnknBGPals
	ld c, 4 * $10
.load_white_palettes
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [hli], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [hli], a
	dec c
	jr nz, .load_white_palettes
	xor a
	ld [hSCY], a
	ld [hSCX], a
	call EnableLCD
	call WaitBGMap2
	call SetPalettes
	ret
; 4e906

Function4e906: ; 4e906
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, wBackupTilemap
	ld bc, wBackupAttrMap - wBackupTilemap
	ld a, " "
	call ByteFill
	hlbgcoord 0, 0
	ld de, wBackupTilemap
	ld b, $0
	ld c, $40
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret
; 4e929

Function4e929: ; mobile function
	ld h, b
	ld l, c
	call Function4e930
	ld c, a
	ret
; 4e930

Function4e930: ; 4e930
	ld a, [hli]
	xor [hl]
	ld c, a
	jr z, .skip_male_trainers
	srl c
	srl c
.male_trainer_loop
	srl c
	ld a, c
	cp MaleTrainersEnd - MaleTrainers - 1
	jr nc, .male_trainer_loop
	inc c

.skip_male_trainers
	ld a, [de]
	cp $1
	ld hl, MaleTrainers
	jr nz, .finished

	ld hl, FemaleTrainers
	ld a, c
	and a
	jr z, .finished

.female_trainer_loop
	srl c
	ld a, c
	cp FemaleTrainersEnd - FemaleTrainers - 1
	jr nc, .female_trainer_loop
	inc c

.finished
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret
; 4e95d

MaleTrainers: ; 4e95d
	db BURGLAR
	db YOUNGSTER
	db SCHOOLBOY
	db BIRD_KEEPER
	db POKEMANIAC
	db GENTLEMAN
	db BUG_CATCHER
	db FISHER
	db SWIMMERM
	db SAILOR
	db SUPER_NERD
	db GUITARIST
	db HIKER
	db FIREBREATHER
	db BLACKBELT_T
	db PSYCHIC_T
	db CAMPER
	db COOLTRAINERM
	db BOARDER
	db JUGGLER
	db POKEFANM
	db OFFICER
	db SAGE
	db BIKER
	db SCIENTIST
MaleTrainersEnd:
; 4e976

FemaleTrainers: ; 4e976
	db MEDIUM
	db LASS
	db BEAUTY
	db SKIER
	db TEACHER
	db SWIMMERF
	db PICNICKER
	db KIMONO_GIRL
	db POKEFANF
	db COOLTRAINERF
FemaleTrainersEnd:
; 4e980

INCLUDE "battle/sliding_intro.asm"

Function4ea0a: ; 4ea0a
	ld a, c
	push af
	call SpeechTextBox
	call MobileTextBorder
	pop af
	dec a
	ld bc, $c
	ld hl, w5_dc1a
	call AddNTimes
	ld de, wcd53
	ld bc, $c
	ld a, $5 ; BANK(w5_dc1a)
	call FarCopyWRAM

	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld bc, wcd53
	decoord 1, 14
	callba Function11c0c6

	pop af
	ld [rSVBK], a

	ld c, 180
	call DelayFrames
	ret
; 4ea44

CheckBattleScene: ; 4ea44
; Return carry if battle scene is turned off.

	ld a, 0
	ld hl, wLinkMode
	call GetFarWRAMByte
	cp LINK_MOBILE
	jr z, .mobile

	ld a, [Options]
	bit BATTLE_SCENE, a
	jr nz, .off

	and a
	ret

.mobile
	ld a, [wcd2f]
	and a
	jr nz, .asm_4ea72

	ld a, $4
	call GetSRAMBank
	ld a, [$a60c]
	ld c, a
	call CloseSRAM

	ld a, c
	bit 0, c
	jr z, .off

	and a
	ret

.asm_4ea72
	ld a, $5
	ld hl, wdc00
	call GetFarWRAMByte
	bit 0, a
	jr z, .off

	and a
	ret

.off
	scf
	ret
; 4ea82

INCLUDE "misc/gbc_only.asm"

INCLUDE "event/poke_seer.asm"

SECTION "bank14", ROMX, BANK[$14]

INCLUDE "engine/party_menu.asm"
INCLUDE "event/poisonstep.asm"
INCLUDE "event/sweet_scent.asm"
INCLUDE "event/squirtbottle.asm"
INCLUDE "event/card_key.asm"
INCLUDE "event/basement_key.asm"
INCLUDE "event/sacred_ash.asm"

CopyPkmnToTempMon: ; 5084a
; gets the BaseData of a Pkmn
; and copys the PkmnStructure to TempMon

	ld a, [CurPartyMon]
	ld e, a
	call GetPkmnSpecies
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData

	ld a, [MonType]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	and a
	jr z, .copywholestruct
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	cp OTPARTYMON
	jr z, .copywholestruct
	ld bc, BOXMON_STRUCT_LENGTH
	callab Functione5bb
	jr .done

.copywholestruct
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

.done
	ret
; 5088b

Function5088b: ; 5088b
	ld bc, wd018_Mon
	jr Function50893
; 50890

Function50890: ; 50890
	ld bc, TempMon
	; fallthrough
; 50893

Function50893: ; 50893
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ld b, $1
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr nz, .asm_508c1
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .asm_508cd

.asm_508c1
	push bc
	ld hl, MON_MAXHP
	add hl, bc
	ld bc, 2
	call CopyBytes
	pop bc

.asm_508cd
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret
; 508d5

GetPkmnSpecies: ; 508d5
; [MonType] has the type of the Pkmn
; e = Nr. of Pkmn (i.e. [CurPartyMon])

	ld a, [MonType]
	and a ; PARTYMON
	jr z, .partymon
	cp OTPARTYMON
	jr z, .otpartymon
	cp BOXMON
	jr z, .boxmon
	cp BREEDMON
	jr z, .breedmon
	; WILDMON

.partymon
	ld hl, PartySpecies
	jr .done

.otpartymon
	ld hl, OTPartySpecies
	jr .done

.boxmon
	ld a, BANK(sBoxSpecies)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call .done
	call CloseSRAM
	ret

.breedmon
	ld a, [wBreedMon1Species]
	jr .done2

.done
	ld d, 0
	add hl, de
	ld a, [hl]

.done2
	ld [CurPartySpecies], a
	ret
; 5090d

INCLUDE "text/types.asm"

Function50a28: ; 50a28
	ld hl, Strings50a42
	ld a, [TrainerClass]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret
; 50a42

Strings50a42: ; 50a42
; Untranslated trainer class names from Red.

	dw .Youngster
	dw .BugCatcher
	dw .Lass
	dw OTName
	dw .JrTrainerM
	dw .JrTrainerF
	dw .Pokemaniac
	dw .SuperNerd
	dw OTName
	dw OTName
	dw .Burglar
	dw .Engineer
	dw .Jack
	dw OTName
	dw .Swimmer
	dw OTName
	dw OTName
	dw .Beauty
	dw OTName
	dw .Rocker
	dw .Juggler
	dw OTName
	dw OTName
	dw .Blackbelt
	dw OTName
	dw .ProfOak
	dw .Chief
	dw .Scientist
	dw OTName
	dw .Rocket
	dw .CooltrainerM
	dw .CooltrainerF
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName

.Youngster    db "たんパン@"
.BugCatcher   db "むしとり@"
.Lass         db "ミニスカ@"
.JrTrainerM   db "ボーイ@"
.JrTrainerF   db "ガール@"
.Pokemaniac   db "マニア@"
.SuperNerd    db "りかけい@"
.Burglar      db "どろぼう@"
.Engineer     db "ォヤジ@"
.Jack         db "ジャック@"
.Swimmer      db "かいパン@"
.Beauty       db "おねえさん@"
.Rocker       db "グループ@"
.Juggler      db "ジャグラー@"
.Blackbelt    db "からて@"
.ProfOak      db "ォーキド@"
.Chief        db "チーフ@"
.Scientist    db "けんきゅういん@"
.Rocket       db "だんいん@"
.CooltrainerM db "エりート♂@"
.CooltrainerF db "エりート♀@"
; 50b0a

DrawPlayerHP: ; 50b0a
	ld a, $1
	jr DrawHP

DrawEnemyHP: ; 50b0e
	ld a, $2

DrawHP: ; 50b10
	ld [wd10a], a
	push hl
	push bc
	ld a, [MonType]
	cp BOXMON
	jr z, .asm_50b30

	ld a, [TempMonHP]
	ld b, a
	ld a, [TempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .asm_50b30

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .asm_50b4a

.asm_50b30
	ld a, [TempMonMaxHP]
	ld d, a
	ld a, [TempMonMaxHP + 1]
	ld e, a
	ld a, [MonType]
	cp BOXMON
	jr nz, .asm_50b41

	ld b, d
	ld c, e

.asm_50b41
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.asm_50b4a
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	ld bc, $15 ; move (1,1)
	add hl, bc
	ld de, TempMonHP
	ld a, [MonType]
	cp BOXMON
	jr nz, .asm_50b66
	ld de, TempMonMaxHP
.asm_50b66
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, TempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret
; 50b7b

PrintTempMonStats: ; 50b7b
; Print TempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, TempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, TempMonDefense
	call .PrintStat
	ld de, TempMonSpclAtk
	call .PrintStat
	ld de, TempMonSpclDef
	call .PrintStat
	ld de, TempMonSpeed
	jp PrintNum
; 50bab

.PrintStat: ; 50bab
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret
; 50bb5

.StatNames: ; 50bb5
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"
; 50bdd

GetGender: ; 50bdd
; Return the gender of a given monster (CurPartyMon/CurOTMon/CurWildMon).
; When calling this function, a should be set to an appropriate MonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by comparing the Attack and Speed DVs
; with the species' gender ratio.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [MonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, OTPartyMon1DVs
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, TempMonDVs
	dec a
	jr z, .DVs

; else: WildMon
	ld hl, EnemyMonDVs
	jr .DVs

; Get our place in the party/box.

.PartyMon
.sBoxMon
	ld a, [CurPartyMon]
	call AddNTimes

.DVs

; sBoxMon data is read directly from SRAM.
	ld a, [MonType]
	cp BOXMON
	ld a, 1
	call z, GetSRAMBank

; Attack DV
	ld a, [hli]
	and $f0
	ld b, a
; Speed DV
	ld a, [hl]
	and $f0
	swap a

; Put our DVs together.
	or b
	ld b, a

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [MonType]
	cp BOXMON
	call z, CloseSRAM

; We need the gender ratio to do anything with this.
	push bc
	ld a, [CurPartySpecies]
	dec a
	ld hl, BaseData + BaseGender - CurBaseData
	ld bc, BaseData1 - BaseData
	call AddNTimes
	pop bc

	ld a, BANK(BaseData)
	call GetFarByte

; The higher the ratio, the more likely the monster is to be female.

	cp $ff
	jr z, .Genderless

	and a
	jr z, .Male

	cp $fe
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female
	xor a
	ret

.Male
	ld a, 1
	and a
	ret

.Genderless
	scf
	ret
; 50c50

ListMovePP: ; 50c50
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [Buffer1]
	ld e, a
	ld d, $0
	ld a, $3e ; P
	call .load_loop
	ld a, b
	and a
	jr z, .skip
	ld c, a
	ld a, "-"
	call .load_loop

.skip
	pop hl
rept 3
	inc hl
endr
	ld d, h
	ld e, l
	ld hl, TempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	jr z, .done
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callab GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, TempMonPP - (TempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, StringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, "/"
	ld [hli], a
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [Buffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop

.done
	ret
; 50cc9

.load_loop: ; 50cc9
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret
; 50cd0

Function50cd0: ; 50cd0
.asm_50cd0
	ld [hl], $32
	inc hl
	ld [hl], $3e
	dec hl
	add hl, de
	dec c
	jr nz, .asm_50cd0
	ret
; 50cdb

Function50cdb: ; unreferenced predef
	push hl
	push hl
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	pop hl
	call PlaceString
	call CopyPkmnToTempMon
	pop hl
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_50d09
	push hl
	ld bc, -12
	add hl, bc
	ld b, $0
	call DrawEnemyHP
	pop hl
	ld bc, 5
	add hl, bc
	push de
	call PrintLevel
	pop de

.asm_50d09
	ret
; 50d0a

PlaceStatusString: ; 50d0a
	push de
rept 2
	inc de
endr
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr nz, PlaceNonFaintStatus
	push de
	ld de, FntString
	call CopyStatusString
	pop de
	ld a, $1
	and a
	ret
; 50d22

FntString: ; 50d22
	db "FNT@"
; 50d25

CopyStatusString: ; 50d25
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret
; 50d2e

PlaceNonFaintStatus: ; 50d2e
	push de
	ld a, [de]
	ld de, PsnString
	bit PSN, a
	jr nz, .place
	ld de, BrnString
	bit BRN, a
	jr nz, .place
	ld de, FrzString
	bit FRZ, a
	jr nz, .place
	ld de, ParString
	bit PAR, a
	jr nz, .place
	ld de, SlpString
	and SLP
	jr z, .no_status

.place
	call CopyStatusString
	ld a, $1
	and a

.no_status
	pop de
	ret
; 50d5b

SlpString: db "SLP@"
PsnString: db "PSN@"
BrnString: db "BRN@"
FrzString: db "FRZ@"
ParString: db "PAR@"
; 50d6f

ListMoves: ; 50d6f
; List moves at hl, spaced every [Buffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves
	push de
	push hl
	push hl
	ld [CurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret
; 50db9

Function50db9: ; 50db9
	ld a, [wd263]

	cp $1
	jr nz, .check_party_ot_name
	ld hl, OTPartyCount
	ld de, OTPartyMonOT
	ld a, ENEMY_OT_NAME
	jr .done
.check_party_ot_name

	cp $4
	jr nz, .check_mon_name
	ld hl, PartyCount
	ld de, PartyMonOT
	ld a, PARTY_OT_NAME
	jr .done
.check_mon_name

	cp $5
	jr nz, .check_item_name
	ld hl, CurMart
	ld de, PokemonNames
	ld a, PKMN_NAME
	jr .done
.check_item_name

	cp $2
	jr nz, .check_ob_item_name
	ld hl, NumItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done
.check_ob_item_name

	ld hl, CurMart
	ld de, ItemNames
	ld a, ITEM_NAME

.done
	ld [wNamedObjectTypeBuffer], a
	ld a, l
	ld [wd100], a
	ld a, h
	ld [wd101], a
	ld a, e
	ld [wd102], a
	ld a, d
	ld [wd103], a
	ld bc, ItemAttributes
	ld a, c
	ld [wd104], a
	ld a, b
	ld [wd105], a
	ret
; 50e1b

CalcLevel: ; 50e1b
	ld a, [TempMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp (MAX_LEVEL + 1) % $100
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, TempMonExp + 2
	ld a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret
; 50e47

CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, [BaseGrowthRate]
rept 2
	add a
endr
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ld [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ld [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ld [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ld a, [hQuotient + 0]
	push af
	ld a, [hQuotient + 1]
	push af
	ld a, [hQuotient + 2]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ld [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ld a, [hProduct + 1]
	push af
	ld a, [hProduct + 2]
	push af
	ld a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	ld b, $0
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	ret
; 50eed

.LevelSquared: ; 50eed
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	jp Multiply
; 50efa

GrowthRates: ; 50efa

growth_rate: MACRO
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 & $80 ; signed
		db -\3 | $80
	else
		db \3
	endc
	db \4, \5
ENDM

	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 3, 4,  10,   0,  30 ; Slightly Fast
	growth_rate 3, 4,  20,   0,  70 ; Slightly Slow
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	growth_rate 4, 5,   0,   0,   0 ; Fast
	growth_rate 5, 4,   0,   0,   0 ; Slow
; 50f12

_SwitchPartyMons:
	ld a, [wd0e3]
	dec a
	ld [Buffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	cp b
	jr z, .skip
	call .SwapMonAndMail
	ld a, [Buffer3]
	call .ClearSprite
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call .ClearSprite
.skip
	ret

.ClearSprite: ; 50f34 (14:4f34)
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, Sprites
	ld bc, $10
	call AddNTimes
	ld de, $4
	ld c, $4
.gfx_loop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ret

.SwapMonAndMail: ; 50f62 (14:4f62)
	push hl
	push de
	push bc
	ld bc, PartySpecies
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [Buffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer3]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMonOT
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld a, [Buffer3]
	ld hl, PartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, PartyMonNicknames
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld hl, PartyMonNicknames
	ld a, [Buffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, sPartyMail
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	ld hl, sPartyMail
	ld a, [Buffer3]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameTowd002: ; 51036 (14:5036)
	ld de, wd002

.CopyName: ; 51039 (14:5039)
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

GetUnownLetter: ; 51040
; Return Unown letter in UnownLetter based on DVs at hl

; Take the middle 2 bits of each DV and place them in order:
;	atk  def  spd  spc
;	.ww..xx.  .yy..zz.

	; atk
	ld a, [hl]
	and %01100000
	sla a
	ld b, a
	; def
	ld a, [hli]
	and %00000110
	swap a
	srl a
	or b
	ld b, a

	; spd
	ld a, [hl]
	and %01100000
	swap a
	sla a
	or b
	ld b, a
	; spc
	ld a, [hl]
	and %00000110
	srl a
	or b

; Divide by 10 to get 0-25
	ld [hDividend + 3], a
	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
	ld a, 10
	ld [hDivisor], a
	ld b, 4
	call Divide

; Increment to get 1-26
	ld a, [hQuotient + 2]
	inc a
	ld [UnownLetter], a
	ret
; 51077

GetFrontpic: ; 51077
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ld [rSVBK], a
	ret
; 5108b

FrontpicPredef: ; 5108b
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	xor a
	ld [hBGMapMode], a
	call _GetFrontpic
	call Function51103
	pop af
	ld [rSVBK], a
	ret
; 510a5

_GetFrontpic: ; 510a5
	push de
	call GetBaseData
	ld a, [BasePicSize]
	and $f
	ld b, a
	push bc
	call GetFrontpicPointer
	ld a, $6
	ld [rSVBK], a
	ld a, b
	ld de, wBackupTilemap + $800
	call FarDecompress
	pop bc
	ld hl, wBackupTilemap
	ld de, wBackupTilemap + $800
	call Function512ab
	pop hl
	push hl
	ld de, wBackupTilemap
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ret
; 510d7

GetFrontpicPointer: ; 510d7
GLOBAL PicPointers, UnownPicPointers

	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [CurPartySpecies]
	ld d, BANK(PicPointers)
	jr .ok

.unown
	ld a, [UnownLetter]
	ld d, BANK(UnownPicPointers)

.ok
	ld hl, PicPointers ; UnownPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ret
; 51103

Function51103: ; 51103
	ld a, $1
	ld [rVBK], a
	push hl
	ld de, wBackupTilemap
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ld de, 7 * 7 tiles
	add hl, de
	push hl
	ld a, $1
	ld hl, BasePicSize
	call GetFarWRAMByte
	pop hl
	and $f
	ld de, w6_d800 + 5 * 5 tiles
	ld c, 5 * 5
	cp 5
	jr z, .got_dims
	ld de, w6_d800 + 6 * 6 tiles
	ld c, 6 * 6
	cp 6
	jr z, .got_dims
	ld de, w6_d800 + 7 * 7 tiles
	ld c, 7 * 7
.got_dims

	push hl
	push bc
	call Function5114f
	pop bc
	pop hl
	ld de, wBackupTilemap
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	xor a
	ld [rVBK], a
	ret
; 5114f

Function5114f: ; 5114f
	ld hl, wBackupTilemap
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	push bc
	call Function512f2
	pop bc
.asm_51161
	push bc
	ld c, $0
	call Function512f2
	pop bc
	dec b
	jr nz, .asm_51161
	ret
; 5116c

GetBackpic: ; 5116c
	ld a, [CurPartySpecies]
	call IsAPokemon
	ret c

	ld a, [CurPartySpecies]
	ld b, a
	ld a, [UnownLetter]
	ld c, a
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de

	; These are assumed to be at the same
	; address in their respective banks.
	GLOBAL PicPointers,  UnownPicPointers
	ld hl, PicPointers ; UnownPicPointers
	ld a, b
	ld d, BANK(PicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	ld de, wBackupTilemap
	pop af
	call FarDecompress
	ld hl, wBackupTilemap
	ld c, 6 * 6
	call Function5127c
	pop hl
	ld de, wBackupTilemap
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret
; 511c5

FixPicBank: ; 511c5
; This is a thing for some reason.
	push hl
	push bc
	sub PICS_1 - PICS_FIX
	ld c, a
	ld b, 0
	ld hl, .PicsBanks
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret
; 511d4

.PicsBanks: ; 511d4
	db PICS_1
	db PICS_2
	db PICS_3
	db PICS_4
	db PICS_5
	db PICS_6
	db PICS_7
	db PICS_8
	db PICS_9
	db PICS_10
	db PICS_11
	db PICS_12
	db PICS_13
	db PICS_14
	db PICS_15
	db PICS_16
	db PICS_17
	db PICS_18
	db PICS_19
	db PICS_19 + 1
	db PICS_19 + 2
	db PICS_19 + 3
	db PICS_19 + 4
	db PICS_19 + 5

Function511ec: ; 511ec
	ld a, c
	push de
	ld hl, PicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, BANK(PicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(PicPointers)
	call GetFarHalfword
	pop af
	pop de
	call FarDecompress
	ret
; 0x5120d

GetTrainerPic: ; 5120d
	ld a, [TrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [TrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarHalfword
	pop af
	ld de, wBackupTilemap
	call FarDecompress
	pop hl
	ld de, wBackupTilemap
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret
; 5125d

DecompressPredef: ; 5125d
; Decompress lz data from b:hl to scratch space at 6:d000, then copy it to address de.

	ld a, [rSVBK]
	push af
	ld a, 6
	ld [rSVBK], a

	push de
	push bc
	ld a, b
	ld de, wBackupTilemap
	call FarDecompress
	pop bc
	ld de, wBackupTilemap
	pop hl
	ld a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ld [rSVBK], a
	ret
; 5127c

Function5127c: ; 5127c
	push de
	push bc
	ld a, [wc2c6]
	and a
	jr z, .asm_512a8
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 tiles
	jr z, .got_dims
	cp 6 * 6
	ld de, 6 * 6 tiles
	jr z, .got_dims
	ld de, 5 * 5 tiles

.got_dims
	ld a, [hl]
	ld b, $0
	ld c, $8
.loop
	rra
	rl b
	dec c
	jr nz, .loop
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.asm_512a8
	pop bc
	pop de
	ret
; 512ab

Function512ab: ; 512ab
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven
	ld c, $70
	call Function512f2
	dec b
	jr nz, .seven
	ret

.six
	ld c, $70
	xor a
	call .Fill
.asm_512c3
	ld c, $10
	xor a
	call .Fill
	ld c, $60
	call Function512f2
	dec b
	jr nz, .asm_512c3
	ret

.five
	ld c, $70
	xor a
	call .Fill
.asm_512d8
	ld c, $20
	xor a
	call .Fill
	ld c, $50
	call Function512f2
	dec b
	jr nz, .asm_512d8
	ld c, $70
	xor a
	call .Fill
	ret

.Fill
	ld [hli], a
	dec c
	jr nz, .Fill
	ret
; 512f2

Function512f2: ; 512f2
	ld a, [wc2c6]
	and a
	jr nz, .asm_512ff
.asm_512f8
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_512f8
	ret

.asm_512ff
	push bc
.asm_51300
	ld a, [de]
	inc de
	ld b, a
	xor a
	rept 8
	rr b
	rla
	endr
	ld [hli], a
	dec c
	jr nz, .asm_51300
	pop bc
	ret
; 51322

Function51322: ; 51322
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call Function513cb
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wd002
	call Function513e0
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	ld de, wd00d
	call Function513e0
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld de, wd018_Mon
	call Function513e0
	ld hl, wd018_MonMoves
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, wd018_MonPP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [CurPartyMon]
	ld b, a
	callba Functiondcb6
	jp CloseSRAM
; 5138b

Function5138b: ; 5138b
	ld hl, PartyCount
	call Function513cb
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wd002
	call Function513e0
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld de, wd00d
	call Function513e0
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wd018_Mon
	call Function513e0
	ret
; 513cb

Function513cb: ; 513cb
	inc [hl]
	inc hl
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
	ld c, a
.asm_513d8
	ld a, [hl]
	ld [hl], c
	inc hl
	inc c
	ld c, a
	jr nz, .asm_513d8
	ret
; 513e0

Function513e0: ; 513e0
	push de
	push hl
	push bc
	ld a, [wd265]
	dec a
	call AddNTimes
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
.asm_513ef
	push bc
	ld a, [wd265]
	ld b, a
	ld a, [CurPartyMon]
	cp b
	pop bc
	jr z, .asm_51415
	push hl
	push de
	push bc
	call CopyBytes
	pop bc
	pop de
	pop hl
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	pop de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr .asm_513ef

.asm_51415
	pop bc
	pop hl
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	ret
; 51424

BaseData::
INCLUDE "data/base_stats.asm"

PokemonNames::
INCLUDE "data/pokemon_names.asm"

Unknown_53d84: ; unreferenced
	db $1a, $15
	db $33, $16
	db $4b, $17
	db $62, $18
	db $79, $19
	db $90, $1a
	db $a8, $1b
	db $c4, $1c
	db $e0, $1d
	db $f6, $1e
	db $ff, $1f
	db $ff, $20
; 53d9c

UnknownEggPic:: ; 53d9c
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/misc/unknown_egg.5x5.2bpp.lz"
; 53e2e

SECTION "bank19", ROMX, BANK[$19]

INCLUDE "text/phone/extra.asm"

SECTION "bank20", ROMX, BANK[$20]

DoPlayerMovement:: ; 80000

	call GetMovementInput
	ld a, movement_step_sleep_1
	ld [MovementAnimation], a
	xor a
	ld [wd041], a
	call GetPlayerMovement
	ld c, a
	ld a, [MovementAnimation]
	ld [wc2de], a
	ret
; 80017

GetMovementInput: ; 80017

	ld a, [hJoyDown]
	ld [CurInput], a

; Standing downhill instead moves down.

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	ret z

	ld c, a
	and D_PAD
	ret nz

	ld a, c
	or D_DOWN
	ld [CurInput], a
	ret
; 8002d

GetPlayerMovement: ; 8002d

	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_SLIP
	jr z, .Ice

.Normal
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TryStep
	ret c
	call TryJumpLedge
	ret c
	call CheckEdgeWarp
	ret c
	jr .NotMoving

.Surf
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TrySurfStep
	ret c
	jr .NotMoving

.Ice
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TryStep
	ret c
	call TryJumpLedge
	ret c
	call CheckEdgeWarp
	ret c
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .HitWall
	call PlayBump
.HitWall
	call StandInPlace
	xor a
	ret

.NotMoving
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [EngineBuffer4]
	and a
	jr nz, .CantMove
	call PlayBump
.CantMove
	call WalkInPlace
	xor a
	ret

.Standing
	call StandInPlace
	xor a
	ret
; 800b7

CheckTileMovement: ; 800b7
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [PlayerNextTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .asm_800c4
	ld a, 3
	scf
	ret

.asm_800c4
	and $f0
	cp $30 ; moving water
	jr z, .water
	cp $40 ; moving land 1
	jr z, .land1
	cp $50 ; moving land 2
	jr z, .land2
	cp $70 ; warps
	jr z, .warps
	jr .asm_8013c

.water
	ld a, c
	and 3
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [WalkingDirection], a
	jr .asm_8013e

.water_table
	db RIGHT
	db LEFT
	db UP
	db DOWN

.land1
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .asm_8013c
	ld [WalkingDirection], a
	jr .asm_8013e

.land1_table
	db STANDING
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING

.land2
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .asm_8013c
	ld [WalkingDirection], a
	jr .asm_8013e

.land2_table
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING
	db STANDING

.warps
	ld a, c
	cp $71 ; door
	jr z, .down
	cp $79
	jr z, .down
	cp $7a ; stairs
	jr z, .down
	cp $7b ; cave
	jr nz, .asm_8013c

.down
	ld a, DOWN
	ld [WalkingDirection], a
	jr .asm_8013e

.asm_8013c
	xor a
	ret

.asm_8013e
	ld a, STEP_WALK
	call DoStep
	ld a, 5
	scf
	ret
; 80147

CheckTurning: ; 80147
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wd04e]
	cp 0
	jr nz, .asm_80169
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .asm_80169

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr z, .asm_80169

	ld a, STEP_TURN
	call DoStep
	ld a, 2
	scf
	ret

.asm_80169
	xor a
	ret
; 8016b

TryStep: ; 8016b

; Surfing actually calls TrySurfStep directly instead of passing through here.
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, TrySurfStep
	cp PLAYER_SURF_PIKA
	jr z, TrySurfStep

	call CheckLandPermissions
	jr c, .bump

	call IsNPCInFront
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [PlayerNextTile]
	call CheckIceTile
	jr nc, .ice

; Downhill riding is slower when not moving down.
	call CheckRiding
	jr nz, .walk

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	jr z, .fast

	ld a, [WalkingDirection]
	cp DOWN
	jr z, .fast

	ld a, STEP_WALK
	call DoStep
	scf
	ret

.fast
	ld a, STEP_BIKE
	call DoStep
	scf
	ret

.walk
	ld a, STEP_WALK
	call DoStep
	scf
	ret

.ice
	ld a, STEP_ICE
	call DoStep
	scf
	ret

; unused?
	xor a
	ret

.bump
	xor a
	ret
; 801c0

TrySurfStep: ; 801c0

	call CheckWaterPermissions
	ld [wd040], a
	jr c, .bump

	call IsNPCInFront
	ld [wd03f], a
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [wd040]
	and a
	jr nz, .ExitWater

	ld a, STEP_WALK
	call DoStep
	scf
	ret

.ExitWater
	call WaterToLandSprite
	call PlayMapMusic
	ld a, STEP_WALK
	call DoStep
	ld a, 6
	scf
	ret

.bump
	xor a
	ret
; 801f3

TryJumpLedge: ; 801f3
	ld a, [PlayerNextTile]
	ld e, a
	and $f0
	cp $a0 ; ledge
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_8021e
	add hl, de
	ld a, [FacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call DoStep
	ld a, 7
	scf
	ret

.DontJump
	xor a
	ret

.data_8021e
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT
; 80226

CheckEdgeWarp: ; 80226

; Bug: Since no case is made for STANDING here, it will check
; [.edgewarps + $ff]. This resolves to $3e at $8035a.
; This causes wd041 to be nonzero when standing on tile $3e,
; making bumps silent.

	ld a, [WalkingDirection]
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [PlayerNextTile]
	cp [hl]
	jr nz, .nope

	ld a, 1
	ld [wd041], a
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .nope

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr nz, .nope
	call WarpCheck
	jr nc, .nope

	call StandInPlace
	scf
	ld a, 1
	ret

.nope
	xor a
	ret

.EdgeWarps
	db $70, $78, $76, $7e
; 8025f

DoStep: ; 8025f
	ld e, a
	ld d, 0
	ld hl, .Steps
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [WalkingDirection]
	ld e, a
	cp STANDING
	jp z, StandInPlace

	add hl, de
	ld a, [hl]
	ld [MovementAnimation], a

	ld hl, .WalkInPlace
	add hl, de
	ld a, [hl]
	ld [wd04e], a

	ld a, 4
	ret

.Steps
	dw .Slow
	dw .Walk
	dw .Bike
	dw .Ledge
	dw .Ice
	dw .Turn
	dw .BackwardsLedge
	dw .WalkInPlace

.Slow
	slow_step_down
	slow_step_up
	slow_step_left
	slow_step_right
.Walk
	step_down
	step_up
	step_left
	step_right
.Bike
	big_step_down
	big_step_up
	big_step_left
	big_step_right
.Ledge
	jump_step_down
	jump_step_up
	jump_step_left
	jump_step_right
.Ice
	fast_slide_step_down
	fast_slide_step_up
	fast_slide_step_left
	fast_slide_step_right
.BackwardsLedge
	jump_step_up
	jump_step_down
	jump_step_right
	jump_step_left
.Turn
	half_step_down
	half_step_up
	half_step_left
	half_step_right
.WalkInPlace
	db $80 + movement_turn_head_down
	db $80 + movement_turn_head_up
	db $80 + movement_turn_head_left
	db $80 + movement_turn_head_right
; 802b3

StandInPlace: ; 802b3
	ld a, 0
	ld [wd04e], a
	ld a, movement_step_sleep_1
	ld [MovementAnimation], a
	xor a
	ret
; 802bf

WalkInPlace: ; 802bf
	ld a, 0
	ld [wd04e], a
	ld a, movement_step_bump
	ld [MovementAnimation], a
	xor a
	ret
; 802cb

CheckForcedMovementInput: ; 802cb
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wd04e]
	cp 0
	ret z

	and 3
	ld e, a
	ld d, 0
	ld hl, .data_802e8
	add hl, de
	ld a, [CurInput]
	and BUTTONS
	or [hl]
	ld [CurInput], a
	ret

.data_802e8
	db D_DOWN, D_UP, D_LEFT, D_RIGHT
; 802ec

GetMovementAction: ; 802ec
; Poll player input and update movement info.

	ld hl, .table
	ld de, .table2 - .table1
	ld a, [CurInput]
	bit 7, a
	jr nz, .down
	bit 6, a
	jr nz, .up
	bit 5, a
	jr nz, .left
	bit 4, a
	jr nz, .right
; Standing
	jr .update

.down 	add hl, de
.up   	add hl, de
.left 	add hl, de
.right	add hl, de

.update
	ld a, [hli]
	ld [WalkingDirection], a
	ld a, [hli]
	ld [FacingDirection], a
	ld a, [hli]
	ld [WalkingX], a
	ld a, [hli]
	ld [WalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [WalkingTile], a
	ret

.table
; struct:
;	walk direction
;	facing
;	x movement
;	y movement
;	tile collision pointer
.table1
	db STANDING, FACE_CURRENT, 0, 0
	dw PlayerNextTile
.table2
	db RIGHT, FACE_RIGHT,  1,  0
	dw TileRight
	db LEFT,  FACE_LEFT,  -1,  0
	dw TileLeft
	db UP,    FACE_UP,     0, -1
	dw TileUp
	db DOWN,  FACE_DOWN,   0,  1
	dw TileDown
; 80341

IsNPCInFront: ; 80341
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front
	ld a, 0
	ld [hMapObjectIndexBuffer], a
; Load the next X coordinate into d
	ld a, [PlayerNextMapX]
	ld d, a
	ld a, [WalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [PlayerNextMapY]
	ld e, a
	ld a, [WalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, ObjectStructs ; redundant
	callba IsNPCAtCoord
	jr nc, .nope
	call Function8036f
	jr c, .no_bump

; .bump
	xor a
	ret

.nope
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret
; 8036f

Function8036f: ; 8036f

	ld hl, BikeFlags
	bit 0, [hl] ; using strength
	jr z, .nope

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .nope

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 6, [hl]
	jr z, .nope

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [WalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and $fc
	or d
	ld [hl], a

	scf
	ret

.nope
	xor a
	ret
; 8039e

CheckLandPermissions: ; 8039e
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [WalkingTile]
	call CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable
	scf
	ret
; 803b4

CheckWaterPermissions: ; 803b4
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [WalkingTile]
	call CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable
	scf
	ret
; 803ca

CheckRiding: ; 803ca

	ld a, [PlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SLIP
	ret
; 803d3

CheckWalkable: ; 803d3
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; land
	ret z
	scf
	ret
; 803da

CheckSurfable: ; 803da
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp 1
	jr z, .Water

; Can walk back onto land from water.
	and a
	jr z, .Land

	jr .Neither

.Water
	xor a
	ret

.Land
	ld a, 1
	and a
	ret

.Neither
	scf
	ret
; 803ee

PlayBump: ; 803ee

	call CheckSFX
	ret c
	ld de, SFX_BUMP
	call PlaySFX
	ret
; 803f9

WaterToLandSprite: ; 803f9
	push bc
	ld a, PLAYER_NORMAL
	ld [PlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ret
; 80404

CheckStandingOnIce:: ; 80404
	ld a, [wd04e]
	cp 0
	jr z, .nope
	cp $f0
	jr z, .nope
	ld a, [PlayerNextTile]
	call CheckIceTile
	jr nc, .yep
	ld a, [PlayerState]
	cp PLAYER_SLIP
	jr nz, .nope

.yep
	scf
	ret

.nope
	and a
	ret
; 80422

Function80422:: ; 80422
	ld hl, wc2de
	ld a, movement_step_sleep_1
	cp [hl]
	ret z

	ld [hl], a
	ld a, 0
	ld [wd04e], a
	ret
; 80430

INCLUDE "engine/engine_flags.asm"
; 80648

INCLUDE "engine/variables.asm"

BattleText::
INCLUDE "text/battle.asm"

INCLUDE "engine/debug.asm"

SECTION "bank21", ROMX, BANK[$21]

INCLUDE "engine/printer.asm"

INCLUDE "battle/anim_gfx.asm"

INCLUDE "event/halloffame.asm"

SECTION "bank22", ROMX, BANK[$22]

INCLUDE "event/kurt.asm"

Function88248: ; 88248
	ld c, CAL
	ld a, [PlayerGender]
	bit 0, a
	jr z, .okay
	ld c, KAREN

.okay
	ld a, c
	ld [TrainerClass], a
	ret
; 88258

MovePlayerPicRight: ; 88258
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft: ; 88260
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic: ; 88266
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ld [hBGMapMode], a
	lb bc, 7, 7
	predef FillBox
	xor a
	ld [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop
; 88297

ShowPlayerNamingChoices: ; 88297
	ld hl, ChrisNameMenuHeader
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotGender
	ld hl, KrisNameMenuHeader
.GotGender
	call LoadMenuDataHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call WriteBackup
	ret
; 882b5

ChrisNameMenuHeader: ; 882b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option
; 882be

.MaleNames: ; 882be
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
MalePlayerNameArray: ; 882c9
	db "CHRIS@"
	db "MAT@"
	db "ALLAN@"
	db "JON@"
	db 2 ; displacement
	db " NAME @" ; title
; 882e5

KrisNameMenuHeader: ; 882e5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option
; 882ee

.FemaleNames: ; 882ee
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
FemalePlayerNameArray: ; 882f9
	db "KRIS@"
	db "AMANDA@"
	db "JUANA@"
	db "JODI@"
	db 2 ; displacement
	db " NAME @" ; title
; 88318

GetPlayerNameArray: ; 88318 This Function is never called
	ld hl, PlayerName
	ld de, MalePlayerNameArray
	ld a, [PlayerGender]
	bit 0, a
	jr z, .done
	ld de, FemalePlayerNameArray

.done
	call InitName
	ret
; 8832c

GetPlayerIcon: ; 8832c
; Get the player icon corresponding to gender

; Male
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)

	ld a, [PlayerGender]
	bit 0, a
	jr z, .done

; Female
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)

.done
	ret
; 8833e

Function8833e: ; 8833e
	ld hl, ChrisCardPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld hl, KrisCardPic
.GotClass
	ld de, VTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(ChrisCardPic) ; BANK(KrisCardPic)
	call FarCopyBytes
	ld hl, CardGFX
	ld de, VTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(CardGFX)
	call FarCopyBytes
	ret
; 88365 (22:4365)

ChrisCardPic: ; 88365
INCBIN "gfx/misc/chris_card.5x7.2bpp"
; 88595

KrisCardPic: ; 88595
INCBIN "gfx/misc/kris_card.5x7.2bpp"
; 887c5

CardGFX: ; 887c5
INCBIN "gfx/misc/trainer_card.2bpp"
; 88825

GetPlayerBackpic: ; 88825
	ld a, [PlayerGender]
	bit 0, a
	jr z, GetChrisBackpic
	call GetKrisBackpic
	ret

GetChrisBackpic: ; 88830
	ld hl, ChrisBackpic
	ld b, BANK(ChrisBackpic)
	ld de, VTiles2 tile $31
	ld c, 7 * 7
	predef DecompressPredef
	ret
; 88840

Function88840: ; 88840
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld e, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1

.GotClass
	ld a, e
	ld [TrainerClass], a
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic

.GotPic
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7
	call Get2bpp
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret
; 88874

DrawIntroPlayerPic: ; 88874
; Draw the player pic at (6,4).

; Get class
	ld e, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1
.GotClass
	ld a, e
	ld [TrainerClass], a

; Load pic
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic
.GotPic
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7 ; dimensions
	call Get2bpp

; Draw
	xor a
	ld [hFillBox], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef FillBox
	ret
; 888a9

ChrisPic: ; 888a9
INCBIN "gfx/misc/chris.7x7.2bpp"
; 88bb9

KrisPic: ; 88bb9
INCBIN "gfx/misc/kris.7x7.2bpp"
; 88ec9

GetKrisBackpic: ; 88ec9
; Kris's backpic is uncompressed.
	ld de, KrisBackpic
	ld hl, VTiles2 tile $31
	lb bc, BANK(KrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret
; 88ed6

KrisBackpic: ; 88ed6
INCBIN "gfx/misc/kris_back.6x6.2bpp"
; 89116

String_89116:
	db "-----@"
; 8911c

INCLUDE "misc/mobile_22.asm"
INCLUDE "event/unown.asm"
INCLUDE "event/buena.asm"
INCLUDE "event/dratini.asm"
INCLUDE "event/battle_tower.asm"
INCLUDE "misc/mobile_22_2.asm"

SECTION "bank23", ROMX, BANK[$23]

Predef35: ; 8c000
Predef36:
	ret
; 8c001

INCLUDE "engine/timeofdaypals.asm"
INCLUDE "engine/battle_start.asm"

Function8c7c9: ; unreferenced
	ld a, $1
	ld [hBGMapMode], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 8c7d4

INCLUDE "event/field_moves.asm"
INCLUDE "event/magnet_train.asm"

Function8cf4f: ; 8cf4f
	call Function3238
	ret
; 8cf53

INCLUDE "engine/sprites.asm"

INCLUDE "engine/mon_icons.asm"

SECTION "bank24", ROMX, BANK[$24]

INCLUDE "engine/phone.asm"
INCLUDE "engine/timeset.asm"
INCLUDE "engine/pokegear.asm"

INCLUDE "data/wild/fish.asm"
INCLUDE "engine/slot_machine.asm"

SECTION "Phone Engine", ROMX, BANK[$28]

INCLUDE "engine/more_phone_scripts.asm"
INCLUDE "engine/buena_phone_scripts.asm"

SECTION "Phone Text", ROMX, BANK[$29]

INCLUDE "text/phone/anthony_overworld.asm"
INCLUDE "text/phone/todd_overworld.asm"
INCLUDE "text/phone/gina_overworld.asm"
INCLUDE "text/phone/irwin_overworld.asm"
INCLUDE "text/phone/arnie_overworld.asm"
INCLUDE "text/phone/alan_overworld.asm"
INCLUDE "text/phone/dana_overworld.asm"
INCLUDE "text/phone/chad_overworld.asm"
INCLUDE "text/phone/derek_overworld.asm"
INCLUDE "text/phone/tully_overworld.asm"
INCLUDE "text/phone/brent_overworld.asm"
INCLUDE "text/phone/tiffany_overworld.asm"
INCLUDE "text/phone/vance_overworld.asm"
INCLUDE "text/phone/wilton_overworld.asm"
INCLUDE "text/phone/kenji_overworld.asm"
INCLUDE "text/phone/parry_overworld.asm"
INCLUDE "text/phone/erin_overworld.asm"

SECTION "Tileset Data 5", ROMX, BANK[TILESETS_5]

INCLUDE "tilesets/data_5.asm"

SECTION "bank2E", ROMX, BANK[$2E]

INCLUDE "engine/events_3.asm"

INCLUDE "engine/radio.asm"

INCLUDE "gfx/mail.asm"

SECTION "bank2F", ROMX, BANK[$2F]

INCLUDE "engine/std_scripts.asm"

INCLUDE "engine/phone_scripts.asm"

TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	encountermusic
	jump StartBattleWithMapTrainerScript
; 0xbe675

SeenByTrainerScript:: ; 0xbe675
	loadmemtrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovement2 MovementBuffer
	writepersonxy LAST_TALKED
	faceperson PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript
; 0xbe68a

StartBattleWithMapTrainerScript: ; 0xbe68a
	opentext
	trainertext $0
	waitbutton
	closetext
	loadmemtrainer
	startbattle
	returnafterbattle
	trainerflagaction SET_FLAG
	loadvar wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter
; 0xbe699

SECTION "bank30", ROMX, BANK[$30]

INCLUDE "gfx/overworld/sprites_1.asm"

SECTION "bank31", ROMX, BANK[$31]

INCLUDE "gfx/overworld/sprites_2.asm"

SECTION "bank32", ROMX, BANK[$32]

INCLUDE "battle/bg_effects.asm"

INCLUDE "battle/anims.asm"

LoadPoisonBGPals: ; cbcdd
	call .LoadPals
	ld a, [hCGB]
	and a
	ret nz
	ret
; cbce5

.LoadPals: ; cbce5
	ld a, [hCGB]
	and a
	jr nz, .cgb
	ld a, [TimeOfDayPal]
	and $3
	cp $3
	ld a, $0
	jr z, .convert_pals
	ld a, $aa

.convert_pals
	call DmgToCgbBGPals
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret

.cgb
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld c, $20
.loop
; RGB 31, 21, 28
	ld a, (palred 31 + palgreen 21 + palblue 28) % $100
	ld [hli], a
	ld a, (palred 31 + palgreen 21 + palblue 28) / $100
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret
; cbd2e

TheEndGFX:: ; cbd2e
INCBIN "gfx/credits/theend.2bpp"
; cbe2e

SECTION "bank33", ROMX, BANK[$33]

DisplayCaughtContestMonStats: ; cc000

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call LoadFontsBattleExtra

	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]

	hlcoord 0, 0
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 0, 6
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 2, 0
	ld de, .Stock
	call PlaceString

	hlcoord 2, 6
	ld de, .This
	call PlaceString

	hlcoord 5, 4
	ld de, .Health
	call PlaceString

	hlcoord 5, 10
	ld de, .Health
	call PlaceString

	ld a, [wContestMon]
	ld [wd265], a
	call GetPokemonName
	ld de, StringBuffer1
	hlcoord 1, 2
	call PlaceString

	ld h, b
	ld l, c
	ld a, [wContestMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	ld de, EnemyMonNick
	hlcoord 1, 8
	call PlaceString

	ld h, b
	ld l, c
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	hlcoord 11, 4
	ld de, wContestMonMaxHP
	lb bc, 2, 3
	call PrintNum

	hlcoord 11, 10
	ld de, EnemyMonMaxHP
	call PrintNum

	ld hl, SwitchMonText
	call PrintText

	pop af
	ld [Options], a

	call WaitBGMap
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ret
; cc0a7

.Health
	db "HEALTH@"
.Stock
	db " STOCK ", $4a, " @"
.This
	db " THIS ", $4a, "  @"

SwitchMonText: ; cc0c2
	; Switch #MON?
	text_jump UnknownText_0x1c10cf
	db "@"
; cc0c7

DisplayAlreadyCaughtText: ; cc0c7
	call GetPokemonName
	ld hl, .AlreadyCaughtText
	jp PrintText
; cc0d0

.AlreadyCaughtText: ; 0xcc0d0
	; You already caught a @ .
	text_jump UnknownText_0x1c10dd
	db "@"
; 0xcc0d5

Predef2F:
Predef38:
Predef39: ; cc0d5
	ret
; cc0d6

INCLUDE "battle/anim_commands.asm"

INCLUDE "battle/anim_objects.asm"

SECTION "Pic Animations 1", ROMX, BANK[$34]

INCLUDE "gfx/pics/animation.asm"

; Pic animations are assembled in 3 parts:

; Top-level animations:
; 	frame #, duration: Frame 0 is the original pic (no change)
;	setrepeat #:       Sets the number of times to repeat
; 	dorepeat #:        Repeats from command # (starting from 0)
; 	end

; Bitmasks:
;	Layered over the pic to designate affected tiles

; Frame definitions:
;	first byte is the bitmask used for this frame
;	following bytes are tile ids mapped to each bit in the mask

; Main animations (played everywhere)
INCLUDE "gfx/pics/anim_pointers.asm"
INCLUDE "gfx/pics/anims.asm"

; Extra animations, appended to the main animation
; Used in the status screen (blinking, tail wags etc.)
INCLUDE "gfx/pics/extra_pointers.asm"
INCLUDE "gfx/pics/extras.asm"

; Unown has its own animation data despite having an entry in the main tables
INCLUDE "gfx/pics/unown_anim_pointers.asm"
INCLUDE "gfx/pics/unown_anims.asm"
INCLUDE "gfx/pics/unown_extra_pointers.asm"
INCLUDE "gfx/pics/unown_extras.asm"

; Bitmasks
INCLUDE "gfx/pics/bitmask_pointers.asm"
INCLUDE "gfx/pics/bitmasks.asm"
INCLUDE "gfx/pics/unown_bitmask_pointers.asm"
INCLUDE "gfx/pics/unown_bitmasks.asm"

SECTION "Pic Animations 2", ROMX, BANK[$35]

INCLUDE "gfx/pics/frame_pointers.asm"
INCLUDE "gfx/pics/kanto_frames.asm"

SECTION "bank36", ROMX, BANK[$36]

FontInversed: INCBIN "gfx/misc/font_inversed.1bpp"

SECTION "Pic Animations 3", ROMX, BANK[$36]

INCLUDE "gfx/pics/johto_frames.asm"
INCLUDE "gfx/pics/unown_frame_pointers.asm"
INCLUDE "gfx/pics/unown_frames.asm"

SECTION "Tileset Data 6", ROMX, BANK[TILESETS_6]

INCLUDE "tilesets/data_6.asm"

SECTION "bank38", ROMX, BANK[$38]

Functione0000: ; e0000
; something to do with Unown printer
	push de
	xor a
	call GetSRAMBank
	ld hl, sScratch
	ld bc, 0
.loop
	push bc
	push hl
	push bc
	ld de, wd002
	call .Copy
	call .Decompress
	ld hl, Unknown_e008b
	pop bc
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wd012
	call .Copy
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp $31
	jr c, .loop

	ld hl, OverworldMap
	ld de, sScratch
	ld bc, $31 tiles
	call CopyBytes
	pop hl
	ld de, sScratch
	ld c, $31
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret
; e004e

.Copy: ; e004e
	ld c, $10
.loop_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop_copy
	ret
; e0057

.Decompress: ; e0057
	ld hl, wd012
	ld e, $80
	ld d, 8
.loop_decompress
	push hl
	ld hl, wd002
	call .CountSetBit
	pop hl
	ld a, b
	ld [hli], a
	push hl
	ld hl, wd003
	call .CountSetBit
	pop hl
	ld a, b
	ld [hli], a
	srl e
	dec d
	jr nz, .loop_decompress
	ret
; e0078

.CountSetBit: ; e0078
	ld b, 0
	ld c, 8
.loop_count
	ld a, [hli]
	and e
	jr z, .clear
	scf
	jr .apply

.clear
	and a

.apply
	rr b
	inc hl
	dec c
	jr nz, .loop_count
	ret
; e008b

overworldmaptile EQUS "dw OverworldMap + $10 *"
overworldmaprect: MACRO
y = 0
rept \1
x = \1 * (\2 +- 1) + y
rept \2
	overworldmaptile x
x = x +- \2
endr
y = y + 1
endr
endm

Unknown_e008b: ; e008b
	overworldmaprect 7, 7
; e00ed

Unknown_e00ed:
; Graphics for an unused Game Corner
; game were meant to be here.

ret_e00ed: ; e00ed (38:40ed)
	ret
; e00ee (38:40ee)

INCLUDE "engine/card_flip.asm"
INCLUDE "engine/unown_puzzle.asm"
INCLUDE "engine/dummy_game.asm"
INCLUDE "engine/billspc.asm"

SECTION "bank39", ROMX, BANK[$39]

CopyrightGFX:: ; e4000
INCBIN "gfx/misc/copyright.2bpp"
; e41d0

INCLUDE "engine/options_menu.asm"
INCLUDE "engine/crystal_intro.asm"

SECTION "bank3E", ROMX, BANK[$3E]

INCLUDE "gfx/font.asm"
INCLUDE "engine/time_capsule/conversion.asm"
INCLUDE "engine/unowndex.asm"
INCLUDE "event/magikarp.asm"

INCLUDE "battle/hidden_power.asm"

INCLUDE "battle/misc.asm"

SECTION "bank3F", ROMX, BANK[$3F]

INCLUDE "tilesets/animations.asm"

INCLUDE "engine/npctrade.asm"

INCLUDE "event/mom_phone.asm"

INCLUDE "misc/mobile_40.asm"

SECTION "bank41", ROMX, BANK[$41]

INCLUDE "misc/gfx_41.asm"

INCLUDE "engine/warp_connection.asm"

INCLUDE "engine/mysterygift.asm"

INCLUDE "battle/used_move_text.asm"

INCLUDE "misc/mobile_41.asm"

INCLUDE "misc/mobile_42.asm"

SECTION "Intro Logo", ROMX, BANK[$42]

IntroLogoGFX: ; 109407
INCBIN "gfx/intro/logo.2bpp.lz"
; 109847

INCLUDE "misc/unused_title.asm"

INCLUDE "engine/title.asm"

INCLUDE "misc/mobile_45.asm"
INCLUDE "misc/mobile_46.asm"

SECTION "bank47", ROMX, BANK[$47]

INCLUDE "misc/battle_tower_47.asm"

SECTION "bank5B", ROMX, BANK[$5B]

INCLUDE "misc/mobile_5b.asm"

SECTION "bank5C", ROMX, BANK[$5C]

INCLUDE "misc/mobile_5c.asm"

SECTION "bank5D", ROMX, BANK[$5D]

INCLUDE "text/phone/extra3.asm"

SECTION "bank5E", ROMX, BANK[$5E]

_UpdateBattleHUDs:
	callba DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	callba DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	callba FinishBattleAnim
	ret
; 17801f (5e:401f)

INCLUDE "misc/mobile_5f.asm"

SECTION "Common Text 1", ROMX, BANK[$6C]

INCLUDE "text/common.asm"
INCLUDE "text/phone/jack_overworld.asm"
INCLUDE "text/phone/beverly_overworld.asm"
INCLUDE "text/phone/huey_overworld.asm"
INCLUDE "text/phone/gaven_overworld.asm"
INCLUDE "text/phone/beth_overworld.asm"
INCLUDE "text/phone/jose_overworld.asm"
INCLUDE "text/phone/reena_overworld.asm"
INCLUDE "text/phone/joey_overworld.asm"
INCLUDE "text/phone/wade_overworld.asm"
INCLUDE "text/phone/ralph_overworld.asm"
INCLUDE "text/phone/liz_overworld.asm"

SECTION "bank6D", ROMX, BANK[$6D]

INCLUDE "text/phone/mom.asm"
INCLUDE "text/phone/bill.asm"
INCLUDE "text/phone/elm.asm"
INCLUDE "text/phone/trainers1.asm"

SECTION "Common Text 2", ROMX, BANK[$6F]

INCLUDE "text/common_2.asm"

SECTION "Common Text 3", ROMX, BANK[$70]

INCLUDE "text/common_3.asm"

SECTION "Common Text 4", ROMX, BANK[$71]

INCLUDE "text/common_4.asm"

SECTION "bank72", ROMX, BANK[$72]

ItemNames::
INCLUDE "items/item_names.asm"

INCLUDE "items/item_descriptions.asm"

MoveNames::
INCLUDE "battle/move_names.asm"

INCLUDE "engine/landmarks.asm"

SECTION "bank75", ROMX, BANK[$75]

SECTION "bank76", ROMX, BANK[$76]

SECTION "bank77", ROMX, BANK[$77]

UnownFont: ; 1dc000
INCBIN "gfx/misc/unown_font.2bpp"
; 1dc1b0

INCLUDE "misc/printer_77.asm"

MobileHPIcon: ; 1dc591
INCBIN "gfx/mobile/hp.1bpp"

MobileLvIcon: ; 1dc599
INCBIN "gfx/mobile/lv.1bpp"

SECTION "Tileset Data 7", ROMX, BANK[TILESETS_7]

INCLUDE "tilesets/data_7.asm"

SECTION "bank77_2", ROMX, BANK[$77]

Function1dd6a9: ; 1dd6a9
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, [sp+$2]
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret
; 1dd6bb

PrintHoursMins ; 1dd6bb (77:56bb)
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM
	or a
	jr nz, .PM
	ld a, 12
.PM
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, [sp+$1]
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, [sp+$0]
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	inc hl
	call PlaceString
	ret
; 1dd6fc (77:56fc)

String_AM: db "AM@" ; 1dd6fc
String_PM: db "PM@" ; 1dd6ff
; 1dd702

INCLUDE "engine/diploma.asm"

LoadSGBPokedexGFX: ; 1ddf1c
	ld hl, LZ_1ddf33
	ld de, VTiles2 tile $31
	call Decompress
	ret
; 1ddf26

Function1ddf26: ; 1ddf26 (77:5f26)
	ld hl, LZ_1ddf33
	ld de, VTiles2 tile $31
	lb bc, BANK(LZ_1ddf33), $3a
	call DecompressRequest2bpp
	ret
; 1ddf33 (77:5f33)

LZ_1ddf33: ; 1ddf33
INCBIN "gfx/pokedex/sgb.2bpp.lz"
; 1de0d7

LoadQuestionMarkPic: ; 1de0d7
	ld hl, .QuestionMarkLZ
	ld de, sScratch
	call Decompress
	ret
; 1de0e1

.QuestionMarkLZ: ; 1de0e1
INCBIN "gfx/pics/questionmark/front.2bpp.lz"
; 1de171

DrawPokedexListWindow: ; 1de171 (77:6171)
	ld a, $32
	hlcoord 0, 17
	ld bc, 12
	call ByteFill
	hlcoord 0, 1
	lb bc, 15, 11
	call ClearBox
	ld a, $34
	hlcoord 0, 0
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 16
	ld bc, 11
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 16
	ld [hl], $40
	ld a, [wCurrentDexMode]
	cp DEXMODE_OLD
	jr z, .OldMode
; scroll bar
	hlcoord 11, 0
	ld [hl], $50
	ld a, $51
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT - 3
	call Bank77_FillColumn
	ld [hl], $52
	jr .Done

.OldMode
; no scroll bar
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT - 3
	call Bank77_FillColumn
	ld [hl], $68
.Done
	ret

DrawPokedexSearchResultsWindow: ; 1de1d1 (77:61d1)
	ld a, $34
	hlcoord 0, 0
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 10
	ld bc, 11
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 10
	ld [hl], $40
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, SCREEN_HEIGHT / 2
	call Bank77_FillColumn
	ld [hl], $68
	ld a, $34
	hlcoord 0, 11
	ld bc, 11
	call ByteFill
	ld a, $39
	hlcoord 0, 17
	ld bc, 11
	call ByteFill
	hlcoord 11, 11
	ld [hl], $66
	ld a, $67
	hlcoord 11, 12
	ld b, 5
	call Bank77_FillColumn
	ld [hl], $68
	hlcoord 0, 12
	lb bc, 5, 11
	call ClearBox
	ld de, .esults_D
	hlcoord 0, 12
	call PlaceString
	ret
; 1de23c (77:623c)

.esults_D: ; 1de23c
; (SEARCH R)
	db   "ESULTS<NEXT>"
; (### FOUN)
	next "D!@"
; 1de247

Function1de247: ; 1de247
	ld a, [hBGMapAddress]
	ld l, a
	ld a, [hBGMapAddress + 1]
	ld h, a
	push hl
	inc hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	hlcoord 19, 0
	ld [hl], $66
	hlcoord 19, 1
	ld a, $67
	ld b, 15
	call Bank77_FillColumn
	ld [hl], $68
	hlcoord 19, 17
	ld [hl], $3c
	xor a
	ld b, SCREEN_HEIGHT
	hlcoord 19, 0, AttrMap
	call Bank77_FillColumn
	call WaitBGMap2
	pop hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	ret
; 1de27f

Bank77_FillColumn: ; 1de27f
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret
; 1de28a

_DudeAutoInput_A:: ; 1de28a
	ld hl, DudeAutoInput_A
	jr _DudeAutoInput
; 1de28f

_DudeAutoInput_RightA: ; 1de28f
	ld hl, DudeAutoInput_RightA
	jr _DudeAutoInput
; 1de294

_DudeAutoInput_DownA: ; 1de294
	ld hl, DudeAutoInput_DownA
	jr _DudeAutoInput
; 1de299

_DudeAutoInput: ; 1de299
	ld a, BANK(DudeAutoInputs)
	call StartAutoInput
	ret
; 1de29f

DudeAutoInputs:

DudeAutoInput_A: ; 1de29f
	db NO_INPUT, $50
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2a5

DudeAutoInput_RightA: ; 1de2a5
	db NO_INPUT, $08
	db D_RIGHT,  $00
	db NO_INPUT, $08
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2af

DudeAutoInput_DownA: ; 1de2af
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db D_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2c5

Function1de2c5: ; 1de2c5
	ld hl, StringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "%"
	jr z, .line_break
	cp "¯"
	jr z, .line_break
	inc hl
	jr .loop

.line_break
	ld [hl], "<LNBRK>"

.end
	ld de, StringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret
; 1de2e4

PokegearGFX: ; 1de2e4
INCBIN "gfx/misc/pokegear.2bpp.lz"
; 1de5c8

IsMailEuropean: ; 1de5c8
; return 1 if French
; return 2 if German
; return 3 if Italian
; return 4 if Spanish
; return 0 if none of the above
	ld c, $0
	ld hl, sPartyMon1MailAuthorNationality - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	cp "E"
	ret nz
	ld a, [hli]
	inc c
	cp "F"
	ret z
	inc c
	cp "G"
	ret z
	inc c
	cp "I"
	ret z
	inc c
	cp "S"
	ret z
	ld c, $0
	ret
; 1de5e6

; The regular font.
StandardEnglishFont: ; 1de5e6
INCBIN "gfx/font/english.1bpp"

; An extended font.
FrenchGermanFont: ; 1de9e6
INCBIN "gfx/font/french_german.1bpp"

; An even more extended font.
SpanishItalianFont: ; 1dede6
INCBIN "gfx/font/spanish_italian.1bpp"

HandleFrenchGermanMail: ; 1df1e6
; called if mail is french or german
; fix 's 't 'v
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp $dc ; 's in french/german font
	jr nz, .check_intermediate_chars
	ld a, "'s"
	jr .replace

.check_intermediate_chars
	sub "'s"
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add $cd

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret
; 1df203

LireLeCourrierAnglais:
DeutenEnglischenPost: ; 1df203
; Cette fonction convertit certains des caractères anglais pour
; leur équivalent dans le jeu de caractères français.
; Diese Funktion wandelt bestimmte englische Zeichen, um ihre
; Entsprechung in der Deutschen-Zeichensatz.
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	cp "'s"
	jr nz, .check_intermediate_chars
	ld a, $dc
	jr .replace

.check_intermediate_chars
	sub $cd
	jr c, .dont_replace
	cp "'v" - "'s" + 1
	jr nc, .dont_replace
	add "'s"

.replace
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret
; 1df220

HandleSpanishItalianMail: ; 1df220
LeerCorreosIngleses:
LeggiPostaInglese:
; This function converts certain characters between
; the English and Spanish/Italian character sets.
; Esta función convierte ciertos caracteres entre
; el juego de caracteres Inglés y Español.
; Questa funzione converte alcuni caratteri tra
; l'inglese e il set di caratteri italiani.
	ld b, sPartyMon1MailAuthor - sPartyMon1Mail
	ld h, d
	ld l, e
.loop
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .dont_replace
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.dont_replace
	inc hl
	dec b
	jr nz, .loop
	ret
; 1df238

SECTION "Tileset Data 8", ROMX, BANK[TILESETS_8]

INCLUDE "tilesets/data_8.asm"

SECTION "bank79", ROMX, BANK[$79]

SECTION "bank7A", ROMX, BANK[$7A]

SECTION "bank7B", ROMX, BANK[$7B]

INCLUDE "text/battle_tower.asm"

SECTION "bank7C", ROMX, BANK[$7C]

INCLUDE "data/battle_tower_2.asm"

SECTION "bank7D", ROMX, BANK[$7D]

	db $cc, $6b, $1e ; XXX

Function1f4003: ; 1f4003
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f4018
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f4018

Unknown_1f4018:
INCBIN "unknown/1f4018.bin"

Function1f4dbe: ; 1f4dbe
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f4dd3
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f4dd3

Unknown_1f4dd3:
INCBIN "unknown/1f4dd3.bin"

Function1f5d9f: ; 1f5d9f
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f5db4
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f5db4

Unknown_1f5db4:
INCBIN "unknown/1f5db4.bin"

SECTION "bank7E", ROMX, BANK[$7E]

INCLUDE "data/battle_tower.asm"
INCLUDE "data/odd_eggs.asm"

SECTION "bank7F", ROMX, BANK[$7F]

SECTION "stadium2", ROMX[$8000-$220], BANK[$7F]

IF DEF(CRYSTAL11)
INCBIN "misc/stadium2_2.bin"
ELSE
INCBIN "misc/stadium2_1.bin"
ENDC
