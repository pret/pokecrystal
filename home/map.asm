; Functions dealing with rendering and interacting with maps.

Clearwc7e8:: ; 210f
	ld hl, wc7e8
	ld bc, 24
	ld a, $0
	call ByteFill
	ret
; 211b

CheckScenes:: ; 211b
; Checks wCurrMapSceneScriptPointer.  If it's empty, returns -1 in a.  Otherwise, returns the active scene ID in a.
	push hl
	ld hl, wCurrMapSceneScriptPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ld a, [hl]
	jr nz, .scene_exists
	ld a, -1

.scene_exists
	pop hl
	ret
; 212a

GetCurrentMapSceneID:: ; 212a
; Grabs the wram map scene script pointer for the current map and loads it into wCurrMapSceneScriptPointer.
; If there is no scene, both bytes of wCurrMapSceneScriptPointer are wiped clean.
; Copy the current map group and number into bc.  This is needed for GetMapSceneID.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
; Blank out wCurrMapSceneScriptPointer; this is the default scenario.
	xor a
	ld [wCurrMapSceneScriptPointer], a
	ld [wCurrMapSceneScriptPointer + 1], a
	call GetMapSceneID
	ret c ; The map is not in the scene script table
; Load the scene script pointer from de into wCurrMapSceneScriptPointer
	ld a, e
	ld [wCurrMapSceneScriptPointer], a
	ld a, d
	ld [wCurrMapSceneScriptPointer + 1], a
	xor a
	ret
; 2147

GetMapSceneID:: ; 2147
; Searches the scene script table for the map group and number loaded in bc, and returns the wram pointer in de.
; If the map is not in the scene script table, returns carry.
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(MapScenes)
	rst Bankswitch

	ld hl, MapScenes
.loop
	push hl
	ld a, [hli] ; map group, or terminator
	cp -1
	jr z, .end ; the current map is not in the scene script table
	cp b
	jr nz, .next ; map group did not match
	ld a, [hli] ; map number
	cp c
	jr nz, .next ; map number did not match
	jr .found ; we found our map

.next
	pop hl
	ld de, 4 ; size of an entry in the scene script table
	add hl, de
	jr .loop

.end
	scf
	jr .done

.found
	ld e, [hl]
	inc hl
	ld d, [hl]

.done
	pop hl
	pop bc
	ld a, b
	rst Bankswitch

	pop bc
	ret
; 2173

OverworldTextModeSwitch:: ; 2173
	call LoadMapPart
	call FarCallSwapTextboxPalettes
	ret
; 217a

LoadMapPart:: ; 217a
	ld a, [hROMBank]
	push af

	ld a, [TilesetBlocksBank]
	rst Bankswitch

	call LoadMetatiles
	ld a, $60
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill

	ld a, BANK(_LoadMapPart)
	rst Bankswitch
	call _LoadMapPart

	pop af
	rst Bankswitch
	ret
; 2198

LoadMetatiles:: ; 2198
	; de <- wOverworldMapAnchor
	ld a, [wOverworldMapAnchor]
	ld e, a
	ld a, [wOverworldMapAnchor + 1]
	ld d, a
	ld hl, wMisc
	ld b, WMISC_HEIGHT / 4 ; 5

.row
	push de
	push hl
	ld c, WMISC_WIDTH / 4 ; 6

.col
	push de
	push hl
	; Load the current map block.
	; If the current map block is a border block, load the border block.
	ld a, [de]
	and a
	jr nz, .ok
	ld a, [MapBorderBlock]

.ok
	; Load the current wMisc address into de.
	ld e, l
	ld d, h
	; Set hl to the address of the current metatile data ([TilesetBlocksAddress] + (a) tiles).
	; This is buggy; it wraps around past 128 blocks.
	; To fix, uncomment the line below.
	add a ; Comment or delete this line to fix the above bug.
	ld l, a
	ld h, 0
	; add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [TilesetBlocksAddress]
	add l
	ld l, a
	ld a, [TilesetBlocksAddress + 1]
	adc h
	ld h, a

	; copy the 4x4 metatile
rept 3
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, e
	add WMISC_WIDTH - 4
	ld e, a
	jr nc, .next\@
	inc d
.next\@
endr
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr
	; Next metatile
	pop hl
	ld de, 4
	add hl, de
	pop de
	inc de
	dec c
	jp nz, .col
	; Next metarow
	pop hl
	ld de, WMISC_WIDTH * 4
	add hl, de
	pop de
	ld a, [MapWidth]
	add 6
	add e
	ld e, a
	jr nc, .ok2
	inc d
.ok2
	dec b
	jp nz, .row
	ret
; 222a

ReturnToMapFromSubmenu:: ; 222a
	ld a, MAPSETUP_SUBMENU
	ld [hMapEntryMethod], a
	farcall RunMapSetupScript
	xor a
	ld [hMapEntryMethod], a
	ret
; 2238

CheckWarpTile:: ; 2238
	call GetDestinationWarpNumber
	ret nc

	push bc
	farcall CheckDirectionalWarp
	pop bc
	ret nc

	call CopyWarpData
	scf
	ret
; 224a

WarpCheck:: ; 224a
	call GetDestinationWarpNumber
	ret nc
	call CopyWarpData
	ret
; 2252

GetDestinationWarpNumber:: ; 2252
	farcall CheckWarpCollision
	ret nc

	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call .GetDestinationWarpNumber

	pop de
	ld a, d
	rst Bankswitch
	ret
; 2266

.GetDestinationWarpNumber: ; 2266
	ld a, [PlayerStandingMapY]
	sub $4
	ld e, a
	ld a, [PlayerStandingMapX]
	sub $4
	ld d, a
	ld a, [wCurrMapWarpCount]
	and a
	ret z

	ld c, a
	ld hl, wCurrMapWarpHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [hli]
	cp e
	jr nz, .next
	ld a, [hli]
	cp d
	jr nz, .next
	jr .found_warp

.next
	pop hl
	ld a, 5
	add l
	ld l, a
	jr nc, .okay
	inc h

.okay
	dec c
	jr nz, .loop
	xor a
	ret

.found_warp
	pop hl
	call .IncreaseHLTwice
	ret nc ; never encountered

	ld a, [wCurrMapWarpCount]
	inc a
	sub c
	ld c, a
	scf
	ret

.IncreaseHLTwice:
	inc hl
	inc hl
	scf
	ret
; 22a7

CopyWarpData:: ; 22a7
	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call .CopyWarpData

	pop af
	rst Bankswitch
	scf
	ret
; 22b4

.CopyWarpData: ; 22b4
	push bc
	ld hl, wCurrMapWarpHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	dec a
	ld bc, 5 ; warp size
	call AddNTimes
	ld bc, 2 ; warp number
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .skip
	ld hl, BackupWarpNumber
	ld a, [hli]

.skip
	pop bc
	ld [wNextWarp], a
	ld a, [hli]
	ld [wNextMapGroup], a
	ld a, [hli]
	ld [wNextMapNumber], a

	ld a, c
	ld [wPrevWarp], a
	ld a, [MapGroup]
	ld [wPrevMapGroup], a
	ld a, [MapNumber]
	ld [wPrevMapNumber], a
	scf
	ret
; 22ee

CheckOutdoorMap:: ; 22ee
	cp ROUTE
	ret z
	cp TOWN
	ret
; 22f4

CheckIndoorMap:: ; 22f4
	cp INDOOR
	ret z
	cp CAVE
	ret z
	cp DUNGEON
	ret z
	cp GATE
	ret
; 2300

; XXX
	cp INDOOR
	ret z
	cp GATE
	ret z
	cp ENVIRONMENT_5
	ret
; 2309

LoadMapAttributes:: ; 2309
	call CopyMapHeaders
	call SwitchToMapScriptHeaderBank
	call ReadMapScripts
	xor a
	call ReadMapEventHeader
	ret
; 2317

LoadMapAttributes_SkipPeople:: ; 2317
	call CopyMapHeaders
	call SwitchToMapScriptHeaderBank
	call ReadMapScripts
	ld a, $1
	call ReadMapEventHeader
	ret
; 2326

CopyMapHeaders:: ; 2326
	call PartiallyCopyMapHeader
	call SwitchToMapBank
	call GetSecondaryMapHeaderPointer
	call CopySecondMapHeader
	call GetMapConnections
	ret
; 2336

ReadMapEventHeader:: ; 2336
	push af
	ld hl, MapEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	call ReadWarps
	call ReadCoordEvents
	call ReadBGEvents

	pop af
	and a
	ret nz

	call ReadObjectEvents
	ret
; 234f

ReadMapScripts:: ; 234f
	ld hl, MapScriptHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSceneScripts
	call ReadMapCallbacks
	ret
; 235c

CopySecondMapHeader:: ; 235c
	ld de, MapHeader
	ld c, 12 ; size of the second map header
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
; 2368

GetMapConnections:: ; 2368
	ld a, $ff
	ld [NorthConnectedMapGroup], a
	ld [SouthConnectedMapGroup], a
	ld [WestConnectedMapGroup], a
	ld [EastConnectedMapGroup], a

	ld a, [MapConnections]
	ld b, a

	bit NORTH_F, b
	jr z, .no_north
	ld de, NorthMapConnection
	call GetMapConnection
.no_north

	bit SOUTH_F, b
	jr z, .no_south
	ld de, SouthMapConnection
	call GetMapConnection
.no_south

	bit WEST_F, b
	jr z, .no_west
	ld de, WestMapConnection
	call GetMapConnection
.no_west

	bit EAST_F, b
	jr z, .no_east
	ld de, EastMapConnection
	call GetMapConnection
.no_east

	ret
; 23a3

GetMapConnection:: ; 23a3
; Load map connection struct at hl into de.
	ld c, SouthMapConnection - NorthMapConnection
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
; 23ac

ReadMapSceneScripts:: ; 23ac
	ld a, [hli] ; scene script count
	ld c, a
	ld [wCurrMapSceneScriptCount], a ; current map scene script count
	ld a, l
	ld [wCurrMapSceneScriptHeaderPointer], a ; map scene script pointer
	ld a, h
	ld [wCurrMapSceneScriptHeaderPointer + 1], a
	ld a, c
	and a
	ret z

	ld bc, 4 ; size of a map scene script header entry
	call AddNTimes
	ret
; 23c3

ReadMapCallbacks:: ; 23c3
	ld a, [hli]
	ld c, a
	ld [wCurrMapCallbackCount], a
	ld a, l
	ld [wCurrMapCallbackHeaderPointer], a
	ld a, h
	ld [wCurrMapCallbackHeaderPointer + 1], a
	ld a, c
	and a
	ret z

	ld bc, 3
	call AddNTimes
	ret
; 23da

ReadWarps:: ; 23da
	ld a, [hli]
	ld c, a
	ld [wCurrMapWarpCount], a
	ld a, l
	ld [wCurrMapWarpHeaderPointer], a
	ld a, h
	ld [wCurrMapWarpHeaderPointer + 1], a
	ld a, c
	and a
	ret z
	ld bc, 5
	call AddNTimes
	ret
; 23f1

ReadCoordEvents:: ; 23f1
	ld a, [hli]
	ld c, a
	ld [wCurrMapCoordEventCount], a
	ld a, l
	ld [wCurrMapCoordEventHeaderPointer], a
	ld a, h
	ld [wCurrMapCoordEventHeaderPointer + 1], a

	ld a, c
	and a
	ret z

	ld bc, 8
	call AddNTimes
	ret
; 2408

ReadBGEvents:: ; 2408
	ld a, [hli]
	ld c, a
	ld [wCurrMapBGEventCount], a
	ld a, l
	ld [wCurrMapBGEventHeaderPointer], a
	ld a, h
	ld [wCurrMapBGEventHeaderPointer + 1], a

	ld a, c
	and a
	ret z

	ld bc, 5
	call AddNTimes
	ret
; 241f

ReadObjectEvents:: ; 241f
	push hl
	call ClearObjectStructs
	pop de
	ld hl, Map1Object
	ld a, [de]
	inc de
	ld [wCurrMapObjectEventCount], a
	ld a, e
	ld [wCurrMapObjectEventHeaderPointer], a
	ld a, d
	ld [wCurrMapObjectEventHeaderPointer + 1], a

	ld a, [wCurrMapObjectEventCount]
	call CopyMapObjectHeaders

; get NUM_OBJECTS - [wCurrMapObjectEventCount]
	ld a, [wCurrMapObjectEventCount]
	ld c, a
	ld a, NUM_OBJECTS ; - 1
	sub c
	jr z, .skip
	; jr c, .skip

; stupid waste of time and space
	ld bc, 1
	add hl, bc
; Fill the remaining sprite IDs and y coords with 0 and -1, respectively.
; Bleeds into wObjectMasks due to a bug.  Uncomment the above subtraction
; to fix.
	ld bc, OBJECT_LENGTH
.loop
	ld [hl],  0
	inc hl
	ld [hl], -1
	dec hl
	add hl, bc
	dec a
	jr nz, .loop

.skip
	ld h, d
	ld l, e
	ret
; 2457

CopyMapObjectHeaders:: ; 2457
	and a
	ret z

	ld c, a
.loop
	push bc
	push hl
	ld a, $ff
	ld [hli], a
	ld b, MAPOBJECT_E - MAPOBJECT_SPRITE
.loop2
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop2

	pop hl
	ld bc, OBJECT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret
; 2471

ClearObjectStructs:: ; 2471
	ld hl, Object1Struct
	ld bc, OBJECT_STRUCT_LENGTH * (NUM_OBJECT_STRUCTS - 1)
	xor a
	call ByteFill

; Just to make sure (this is rather pointless)
	ld hl, Object1Struct
	ld de, OBJECT_STRUCT_LENGTH
	ld c, NUM_OBJECT_STRUCTS - 1
	xor a
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret
; 248a

RestoreFacingAfterWarp:: ; 248a
	call GetMapScriptHeaderBank
	rst Bankswitch

	ld hl, MapEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; get to the warp coords
	inc hl ; get to the warp coords
	inc hl ; get to the warp coords
	ld a, [WarpNumber]
	dec a
	ld c, a
	ld b, 0
	ld a, 5
	call AddNTimes
	ld a, [hli]
	ld [YCoord], a
	ld a, [hli]
	ld [XCoord], a
	; destination warp number
	ld a, [hli]
	cp $ff
	jr nz, .skip
	call .backup

.skip
	farcall GetCoordOfUpperLeftCorner
	ret
; 24ba

.backup
	ld a, [wPrevWarp]
	ld [BackupWarpNumber], a
	ld a, [wPrevMapGroup]
	ld [BackupMapGroup], a
	ld a, [wPrevMapNumber]
	ld [BackupMapNumber], a
	ret
; 24cd

LoadBlockData:: ; 24cd
	ld hl, OverworldMap
	ld bc, OverworldMapEnd - OverworldMap
	ld a, 0
	call ByteFill
	call ChangeMap
	call FillMapConnections
	ld a, MAPCALLBACK_TILES
	call RunMapCallback
	ret
; 24e4

ChangeMap:: ; 24e4
	ld a, [hROMBank]
	push af

	ld hl, OverworldMap
	ld a, [MapWidth]
	ld [hConnectedMapWidth], a
	add $6
	ld [hConnectionStripLength], a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld c, 3
	add hl, bc
	ld a, [MapBlockDataBank]
	rst Bankswitch

	ld a, [MapBlockDataPointer]
	ld e, a
	ld a, [MapBlockDataPointer+1]
	ld d, a
	ld a, [MapHeight]
	ld b, a
.row
	push hl
	ld a, [hConnectedMapWidth]
	ld c, a
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld a, [hConnectionStripLength]
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	dec b
	jr nz, .row

	pop af
	rst Bankswitch
	ret
; 2524

FillMapConnections:: ; 2524

; North
	ld a, [NorthConnectedMapGroup]
	cp $ff
	jr z, .South
	ld b, a
	ld a, [NorthConnectedMapNumber]
	ld c, a
	call GetAnyMapBlockdataBank

	ld a, [NorthConnectionStripPointer]
	ld l, a
	ld a, [NorthConnectionStripPointer + 1]
	ld h, a
	ld a, [NorthConnectionStripLocation]
	ld e, a
	ld a, [NorthConnectionStripLocation + 1]
	ld d, a
	ld a, [NorthConnectionStripLength]
	ld [hConnectionStripLength], a
	ld a, [NorthConnectedMapWidth]
	ld [hConnectedMapWidth], a
	call FillNorthConnectionStrip

.South:
	ld a, [SouthConnectedMapGroup]
	cp $ff
	jr z, .West
	ld b, a
	ld a, [SouthConnectedMapNumber]
	ld c, a
	call GetAnyMapBlockdataBank

	ld a, [SouthConnectionStripPointer]
	ld l, a
	ld a, [SouthConnectionStripPointer + 1]
	ld h, a
	ld a, [SouthConnectionStripLocation]
	ld e, a
	ld a, [SouthConnectionStripLocation + 1]
	ld d, a
	ld a, [SouthConnectionStripLength]
	ld [hConnectionStripLength], a
	ld a, [SouthConnectedMapWidth]
	ld [hConnectedMapWidth], a
	call FillSouthConnectionStrip

.West:
	ld a, [WestConnectedMapGroup]
	cp $ff
	jr z, .East
	ld b, a
	ld a, [WestConnectedMapNumber]
	ld c, a
	call GetAnyMapBlockdataBank

	ld a, [WestConnectionStripPointer]
	ld l, a
	ld a, [WestConnectionStripPointer + 1]
	ld h, a
	ld a, [WestConnectionStripLocation]
	ld e, a
	ld a, [WestConnectionStripLocation + 1]
	ld d, a
	ld a, [WestConnectionStripLength]
	ld b, a
	ld a, [WestConnectedMapWidth]
	ld [hConnectionStripLength], a
	call FillWestConnectionStrip

.East:
	ld a, [EastConnectedMapGroup]
	cp $ff
	jr z, .Done
	ld b, a
	ld a, [EastConnectedMapNumber]
	ld c, a
	call GetAnyMapBlockdataBank

	ld a, [EastConnectionStripPointer]
	ld l, a
	ld a, [EastConnectionStripPointer + 1]
	ld h, a
	ld a, [EastConnectionStripLocation]
	ld e, a
	ld a, [EastConnectionStripLocation + 1]
	ld d, a
	ld a, [EastConnectionStripLength]
	ld b, a
	ld a, [EastConnectedMapWidth]
	ld [hConnectionStripLength], a
	call FillEastConnectionStrip

.Done:
	ret
; 25d3

FillNorthConnectionStrip::
FillSouthConnectionStrip:: ; 25d3

	ld c, 3
.y
	push de

	push hl
	ld a, [hConnectionStripLength]
	ld b, a
.x
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .x
	pop hl

	ld a, [hConnectedMapWidth]
	ld e, a
	ld d, 0
	add hl, de
	pop de

	ld a, [MapWidth]
	add 6
	add e
	ld e, a
	jr nc, .okay
	inc d
.okay
	dec c
	jr nz, .y
	ret
; 25f6

FillWestConnectionStrip::
FillEastConnectionStrip:: ; 25f6

.loop
	ld a, [MapWidth]
	add 6
	ld [hConnectedMapWidth], a

	push de

	push hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl

	ld a, [hConnectionStripLength]
	ld e, a
	ld d, 0
	add hl, de
	pop de

	ld a, [hConnectedMapWidth]
	add e
	ld e, a
	jr nc, .okay
	inc d
.okay
	dec b
	jr nz, .loop
	ret
; 261b

LoadMapStatus:: ; 261b
	ld [MapStatus], a
	ret
; 261f

CallScript:: ; 261f
; Call a script at a:hl.

	ld [ScriptBank], a
	ld a, l
	ld [ScriptPos], a
	ld a, h
	ld [ScriptPos + 1], a

	ld a, PLAYEREVENT_MAPSCRIPT
	ld [ScriptRunning], a

	scf
	ret
; 2631

CallMapScript:: ; 2631
; Call a script at hl in the current bank if there isn't already a script running
	ld a, [ScriptRunning]
	and a
	ret nz
	call GetMapScriptHeaderBank
	jr CallScript
; 263b

RunMapCallback:: ; 263b
; Will run the first callback found in the map header with execution index equal to a.
	ld b, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call .FindCallback
	jr nc, .done

	call GetMapScriptHeaderBank
	ld b, a
	ld d, h
	ld e, l
	call ExecuteCallbackScript

.done
	pop af
	rst Bankswitch
	ret
; 2653

.FindCallback: ; 2653
	ld a, [wCurrMapCallbackCount]
	ld c, a
	and a
	ret z
	ld hl, wCurrMapCallbackHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld de, 3
.loop
	ld a, [hl]
	cp b
	jr z, .found
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ret

.found
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret
; 2674

ExecuteCallbackScript:: ; 2674
; Do map callback de and return to script bank b.
	farcall CallCallback
	ld a, [ScriptMode]
	push af
	ld hl, ScriptFlags
	ld a, [hl]
	push af
	set 1, [hl]
	farcall EnableScriptMode
	farcall ScriptEvents
	pop af
	ld [ScriptFlags], a
	pop af
	ld [ScriptMode], a
	ret
; 269a

MapTextbox:: ; 269a
	ld a, [hROMBank]
	push af

	ld a, b
	rst Bankswitch

	push hl
	call SpeechTextBox
	call SafeUpdateSprites
	ld a, 1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop hl
	call PrintTextBoxText
	xor a
	ld [hOAMUpdate], a

	pop af
	rst Bankswitch
	ret
; 26b7

Call_a_de:: ; 26b7
; Call a:de.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call .de

	pop af
	rst Bankswitch
	ret

.de
	push de
	ret
; 26c7

GetMovementData:: ; 26c7
; Initialize the movement data for object c at b:hl
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, c
	call LoadMovementDataPointer

	pop hl
	ld a, h
	rst Bankswitch
	ret
; 26d4

GetScriptByte:: ; 0x26d4
; Return byte at ScriptBank:ScriptPos in a.

	push hl
	push bc
	ld a, [hROMBank]
	push af
	ld a, [ScriptBank]
	rst Bankswitch

	ld hl, ScriptPos
	ld c, [hl]
	inc hl
	ld b, [hl]

	ld a, [bc]

	inc bc
	ld [hl], b
	dec hl
	ld [hl], c

	ld b, a
	pop af
	rst Bankswitch
	ld a, b
	pop bc
	pop hl
	ret
; 0x26ef

ObjectEvent:: ; 0x26ef
	jumptextfaceplayer ObjectEventText
; 0x26f2

ObjectEventText::
	text_jump _ObjectEventText
	db "@"
; 0x26f7

BGEvent:: ; 26f7
	jumptext BGEventText
; 26fa

BGEventText:: ; 26fa
	text_jump UnknownText_0x1c46fc
	db "@"
; 26ff

CoordinatesEvent:: ; 26ff
	jumptext CoordinatesEventText
; 2702

CoordinatesEventText:: ; 2702
	text_jump UnknownText_0x1c4706
	db "@"
; 2707

CheckObjectMask:: ; 2707
	ld a, [hMapObjectIndexBuffer]
	ld e, a
	ld d, $0
	ld hl, wObjectMasks
	add hl, de
	ld a, [hl]
	ret
; 2712

MaskObject:: ; 2712
	ld a, [hMapObjectIndexBuffer]
	ld e, a
	ld d, $0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], -1 ; , masked
	ret
; 271e

UnmaskObject:: ; 271e
	ld a, [hMapObjectIndexBuffer]
	ld e, a
	ld d, $0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], 0 ; unmasked
	ret
; 272a

ScrollMapDown:: ; 272a
	hlcoord 0, 0
	ld de, BGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2748

ScrollMapUp:: ; 2748
	hlcoord 0, SCREEN_HEIGHT - 2
	ld de, BGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld bc, $0200
	add hl, bc
; cap d at HIGH(vBGMap0)
	ld a, h
	and %00000011
	or HIGH(vBGMap0)
	ld e, l
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2771

ScrollMapRight:: ; 2771
	hlcoord 0, 0
	ld de, BGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 278f

ScrollMapLeft:: ; 278f
	hlcoord SCREEN_WIDTH - 2, 0
	ld de, BGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call FarCallScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	and %11100000
	ld b, a
	ld a, e
	add SCREEN_HEIGHT
	and %00011111
	or b
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 27b7

BackupBGMapRow:: ; 27b7
	ld c, 2 * SCREEN_WIDTH
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
; 27c0

BackupBGMapColumn:: ; 27c0
	ld c, SCREEN_HEIGHT
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, SCREEN_WIDTH - 1
	add l
	ld l, a
	jr nc, .skip
	inc h

.skip
	dec c
	jr nz, .loop
	ret
; 27d3

UpdateBGMapRow:: ; 27d3
	ld hl, BGMapBufferPtrs
	push de
	call .iteration
	pop de
	ld a, $20
	add e
	ld e, a

.iteration
	ld c, 10
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .loop
	ld a, SCREEN_WIDTH
	ld [hFFDC], a
	ret
; 27f8

UpdateBGMapColumn:: ; 27f8
	ld hl, BGMapBufferPtrs
	ld c, SCREEN_HEIGHT
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .skip
	inc d
; cap d at HIGH(vBGMap0)
	ld a, d
	and $3
	or HIGH(vBGMap0)
	ld d, a

.skip
	dec c
	jr nz, .loop
	ld a, SCREEN_HEIGHT
	ld [hFFDC], a
	ret
; 2816

; unreferenced
	ld hl, BGMapBuffer
	ld bc, BGMapBufferEnd - BGMapBuffer
	xor a
	call ByteFill
	ret
; 2821

LoadTilesetGFX:: ; 2821
	ld hl, TilesetAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [TilesetBank]
	ld e, a

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, e
	ld de, wDecompressScratch
	call FarDecompress

	ld hl, wDecompressScratch
	ld de, vTiles2
	ld bc, $60 tiles
	call CopyBytes

	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a

	ld hl, wDecompressScratch + $60 tiles
	ld de, vTiles2
	ld bc, $60 tiles
	call CopyBytes

	pop af
	ld [rVBK], a

	pop af
	ld [rSVBK], a

	ld a, [wTileset]
	cp TILESET_JOHTO_1
	jr z, .load_roof
	cp TILESET_JOHTO_2
	jr z, .load_roof
	cp TILESET_BATTLE_TOWER_OUTSIDE
	jr z, .load_roof
	jr .skip_roof

.load_roof
	farcall LoadMapGroupRoof

.skip_roof
	xor a
	ld [hTileAnimFrame], a
	ret
; 2879

BufferScreen:: ; 2879
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wScreenSave
	ld c, $5
	ld b, $6
.row
	push bc
	push hl
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .col
	pop hl
	ld a, [MapWidth]
	add $6
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, .row
	ret
; 289d

SaveScreen:: ; 289d
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wScreenSave
	ld a, [MapWidth]
	add 6
	ld [hMapObjectIndexBuffer], a
	ld a, [wPlayerStepDirection]
	and a
	jr z, .down
	cp UP
	jr z, .up
	cp LEFT
	jr z, .left
	cp RIGHT
	jr z, .right
	ret

.up
	ld de, wScreenSave + 6
	ld a, [hMapObjectIndexBuffer]
	ld c, a
	ld b, $0
	add hl, bc
	jr .vertical

.down
	ld de, wScreenSave
.vertical
	ld b, 6
	ld c, 4
	jr SaveScreen_LoadNeighbor

.left
	ld de, wScreenSave + 1
	inc hl
	jr .horizontal

.right
	ld de, wScreenSave
.horizontal
	ld b, 5
	ld c, 5
	jr SaveScreen_LoadNeighbor

LoadNeighboringBlockData:: ; 28e3
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MapWidth]
	add 6
	ld [hConnectionStripLength], a
	ld de, wScreenSave
	ld b, 6
	ld c, 5

SaveScreen_LoadNeighbor:: ; 28f7
.row
	push bc
	push hl
	push de
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .col
	pop de
	ld a, e
	add 6
	ld e, a
	jr nc, .okay
	inc d

.okay
	pop hl
	ld a, [hConnectionStripLength]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .row
	ret
; 2914

GetMovementPermissions:: ; 2914
	xor a
	ld [TilePermissions], a
	call .LeftRight
	call .UpDown
; get coords of current tile
	ld a, [PlayerStandingMapX]
	ld d, a
	ld a, [PlayerStandingMapY]
	ld e, a
	call GetCoordTile
	ld [PlayerStandingTile], a
	call .CheckHiNybble
	ret nz

	ld a, [PlayerStandingTile]
	and 7
	ld hl, .MovementPermissionsData
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld hl, TilePermissions
	or [hl]
	ld [hl], a
	ret
; 2945

.MovementPermissionsData: ; 2945
	db DOWN_MASK
	db UP_MASK
	db LEFT_MASK
	db RIGHT_MASK
	db DOWN_MASK | RIGHT_MASK
	db UP_MASK | RIGHT_MASK
	db DOWN_MASK | LEFT_MASK
	db UP_MASK | LEFT_MASK
; 294d

.UpDown:
	ld a, [PlayerStandingMapX]
	ld d, a
	ld a, [PlayerStandingMapY]
	ld e, a

	push de
	inc e
	call GetCoordTile
	ld [TileDown], a
	call .Down

	pop de
	dec e
	call GetCoordTile
	ld [TileUp], a
	call .Up
	ret
; 296c

.LeftRight:
	ld a, [PlayerStandingMapX]
	ld d, a
	ld a, [PlayerStandingMapY]
	ld e, a

	push de
	dec d
	call GetCoordTile
	ld [TileLeft], a
	call .Left

	pop de
	inc d
	call GetCoordTile
	ld [TileRight], a
	call .Right
	ret
; 298b

.Down:
	call .CheckHiNybble
	ret nz
	ld a, [TileDown]
	and 7
	cp $2
	jr z, .ok_down
	cp $6
	jr z, .ok_down
	cp $7
	ret nz

.ok_down
	ld a, [TilePermissions]
	or FACE_DOWN
	ld [TilePermissions], a
	ret
; 29a8

.Up:
	call .CheckHiNybble
	ret nz
	ld a, [TileUp]
	and 7
	cp $3
	jr z, .ok_up
	cp $4
	jr z, .ok_up
	cp $5
	ret nz

.ok_up
	ld a, [TilePermissions]
	or FACE_UP
	ld [TilePermissions], a
	ret
; 29c5

.Right:
	call .CheckHiNybble
	ret nz
	ld a, [TileRight]
	and 7
	cp $1
	jr z, .ok_right
	cp $5
	jr z, .ok_right
	cp $7
	ret nz

.ok_right
	ld a, [TilePermissions]
	or FACE_RIGHT
	ld [TilePermissions], a
	ret
; 29e2

.Left:
	call .CheckHiNybble
	ret nz
	ld a, [TileLeft]
	and 7
	cp $0
	jr z, .ok_left
	cp $4
	jr z, .ok_left
	cp $6
	ret nz

.ok_left
	ld a, [TilePermissions]
	or FACE_LEFT
	ld [TilePermissions], a
	ret
; 29ff

.CheckHiNybble:
	and $f0
	cp $b0
	ret z
	cp $c0
	ret
; 2a07

GetFacingTileCoord:: ; 2a07
; Return map coordinates in (d, e) and tile id in a
; of the tile the player is facing.

	ld a, [PlayerDirection]
	and %1100
	srl a
	srl a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, .Directions
	add hl, de

	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl

	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [PlayerStandingMapX]
	add d
	ld d, a
	ld a, [PlayerStandingMapY]
	add e
	ld e, a
	ld a, [hl]
	ret

.Directions:
	;   x,  y
	db  0,  1
	dw TileDown
	db  0, -1
	dw TileUp
	db -1,  0
	dw TileLeft
	db  1,  0
	dw TileRight
; 2a3c

GetCoordTile:: ; 2a3c
; Get the collision byte for tile d, e
	call GetBlockLocation
	ld a, [hl]
	and a
	jr z, .nope
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld a, [TilesetCollisionAddress]
	ld c, a
	ld a, [TilesetCollisionAddress + 1]
	ld b, a
	add hl, bc
	rr d
	jr nc, .nocarry
	inc hl

.nocarry
	rr e
	jr nc, .nocarry2
	inc hl
	inc hl

.nocarry2
	ld a, [TilesetCollisionBank]
	call GetFarByte
	ret

.nope
	ld a, -1
	ret
; 2a66

GetBlockLocation:: ; 2a66
	ld a, [MapWidth]
	add 6
	ld c, a
	ld b, 0
	ld hl, OverworldMap + 1
	add hl, bc
	ld a, e
	srl a
	jr z, .nope
	and a
.loop
	srl a
	jr nc, .ok
	add hl, bc

.ok
	sla c
	rl b
	and a
	jr nz, .loop

.nope
	ld c, d
	srl c
	ld b, 0
	add hl, bc
	ret
; 2a8b

CheckFacingBGEvent:: ; 2a8b
	call GetFacingTileCoord
; Load facing into b.
	ld b, a
; Convert the coordinates at de to within-boundaries coordinates.
	ld a, d
	sub 4
	ld d, a
	ld a, e
	sub 4
	ld e, a
; If there are no BG events, we don't need to be here.
	ld a, [wCurrMapBGEventCount]
	and a
	ret z

	ld c, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call CheckIfFacingTileCoordIsBGEvent
	pop hl
	ld a, h
	rst Bankswitch
	ret
; 2aaa

CheckIfFacingTileCoordIsBGEvent:: ; 2aaa
; Checks to see if you are facing a BG event.  If so, copies it into EngineBuffer1 and sets carry.
	ld hl, wCurrMapBGEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [hli]
	cp e
	jr nz, .next
	ld a, [hli]
	cp d
	jr nz, .next
	jr .copysign

.next
	pop hl
	ld a, 5 ; BG event event length
	add l
	ld l, a
	jr nc, .nocarry
	inc h

.nocarry
	dec c
	jr nz, .loop
	xor a
	ret

.copysign
	pop hl
	ld de, wCurBGEventYCoord
	ld bc, 5 ; BG event event length
	call CopyBytes
	scf
	ret
; 2ad4

CheckCurrentMapCoordEvents:: ; 2ad4
; If there are no coord events, we don't need to be here.
	ld a, [wCurrMapCoordEventCount]
	and a
	ret z
; Copy the coord event count into c.
	ld c, a
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call .CoordEventCheck
	pop hl
	ld a, h
	rst Bankswitch
	ret

.CoordEventCheck:
; Checks to see if you are standing on a coord event.  If yes, copies the event to EngineBuffer1 and sets carry.
	ld hl, wCurrMapCoordEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Load the active scene ID into b
	call CheckScenes
	ld b, a
; Load your current coordinates into de.  This will be used to check if your position is in the coord event table for the current map.
	ld a, [PlayerStandingMapX]
	sub 4
	ld d, a
	ld a, [PlayerStandingMapY]
	sub 4
	ld e, a

.loop
	push hl
	ld a, [hli]
	cp b
	jr z, .got_id
	cp -1
	jr nz, .next

.got_id
	ld a, [hli]
	cp e
	jr nz, .next
	ld a, [hli]
	cp d
	jr nz, .next
	jr .copy_coord_event

.next
	pop hl
	ld a, $8 ; coord event size
	add l
	ld l, a
	jr nc, .nocarry
	inc h

.nocarry
	dec c
	jr nz, .loop
	xor a
	ret

.copy_coord_event
	pop hl
	ld de, wCurCoordEventSceneID
	ld bc, 8 ; coord event size
	call CopyBytes
	scf
	ret
; 2b29

FadeToMenu:: ; 2b29
	xor a
	ld [hBGMapMode], a
	call LoadStandardMenuDataHeader
	farcall FadeOutPalettes
	call ClearSprites
	call DisableSpriteUpdates
	ret
; 2b3c

CloseSubmenu:: ; 2b3c
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call Call_ExitMenu
	call ret_d90
	jr FinishExitMenu
; 2b4d

ExitAllMenus:: ; 2b4d
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call ret_d90
FinishExitMenu:: ; 2b5c
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call WaitBGMap2
	farcall FadeInPalettes
	call EnableSpriteUpdates
	ret
; 2b74

ReturnToMapWithSpeechTextbox:: ; 0x2b74
	push af
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call ClearBGPalettes
	call ClearSprites
	call ReloadTilesetAndPalettes
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ld hl, VramState
	set 0, [hl]
	call UpdateSprites
	call WaitBGMap2
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call UpdateTimePals
	call DelayFrame
	ld a, $1
	ld [hMapAnims], a
	pop af
	ret
; 0x2bae

ReloadTilesetAndPalettes:: ; 2bae
	call DisableLCD
	call ClearSprites
	farcall RefreshSprites
	call LoadStandardFont
	call LoadFontsExtra
	ld a, [hROMBank]
	push af
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call SwitchToAnyMapBank
	farcall UpdateTimeOfDayPal
	call OverworldTextModeSwitch
	call LoadTilesetGFX
	ld a, 9
	call SkipMusic
	pop af
	rst Bankswitch

	call EnableLCD
	ret
; 2be5

GetMapHeaderPointer:: ; 2be5
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
GetAnyMapHeaderPointer:: ; 0x2bed
; Prior to calling this function, you must have switched banks so that
; MapGroupPointers is visible.

; inputs:
; b = map group, c = map number
; XXX de = ???

; outputs:
; hl points to the map header
	push bc ; save map number for later

	; get pointer to map group
	dec b
	ld c, b
	ld b, 0
	ld hl, MapGroupPointers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc ; restore map number

	; find the cth map header
	dec c
	ld b, 0
	ld a, 9
	call AddNTimes
	ret
; 0x2c04

GetMapHeaderMember:: ; 0x2c04
; Extract data from the current map's header.

; inputs:
; de = offset of desired data within the mapheader (a MAPHEADER_* constant)

; outputs:
; bc = data from the current map's header
; (e.g., de = MAPHEADER_MAPHEADER2 would return a pointer to the secondary map header)

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
GetAnyMapHeaderMember:: ; 0x2c0c
	; bankswitch
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch

	call GetAnyMapHeaderPointer
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]

	; bankswitch back
	pop af
	rst Bankswitch
	ret
; 0x2c1c

SwitchToMapBank:: ; 2c1c
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
SwitchToAnyMapBank:: ; 2c24
	call GetAnyMapBank
	rst Bankswitch
	ret
; 2c29

GetMapBank:: ; 2c29
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
GetAnyMapBank:: ; 2c31
	push hl
	push de
	ld de, MAPHEADER_MAPHEADER2_BANK
	call GetAnyMapHeaderMember
	ld a, c
	pop de
	pop hl
	ret
; 2c3d

PartiallyCopyMapHeader:: ; 2c3d
; Copy second map header bank, tileset, environment, and second map header address
; from the current map's map header.
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch

	call GetMapHeaderPointer
	ld de, wSecondMapHeaderBank
	ld bc, MapHeader - wSecondMapHeaderBank
	call CopyBytes

	pop af
	rst Bankswitch
	ret
; 2c52

SwitchToMapScriptHeaderBank:: ; 2c52
	ld a, [MapScriptHeaderBank]
	rst Bankswitch
	ret
; 2c57

GetMapScriptHeaderBank:: ; 2c57
	ld a, [MapScriptHeaderBank]
	ret
; 2c5b

GetAnyMapBlockdataBank:: ; 2c5b
; Return the blockdata bank for group b map c.
	push hl
	push de
	push bc

	push bc
	ld de, MAPHEADER_MAPHEADER2
	call GetAnyMapHeaderMember
	ld l, c
	ld h, b
	pop bc

	push hl
	ld de, MAPHEADER_MAPHEADER2_BANK
	call GetAnyMapHeaderMember
	pop hl

	ld de, MAPHEADER_MAPHEADER2 ; blockdata bank
	add hl, de
	ld a, c
	call GetFarByte
	rst Bankswitch

	pop bc
	pop de
	pop hl
	ret
; 2c7d

GetSecondaryMapHeaderPointer:: ; 0x2c7d
; returns the current map's secondary map header pointer in hl.
	push bc
	push de
	ld de, MAPHEADER_MAPHEADER2
	call GetMapHeaderMember
	ld l, c
	ld h, b
	pop de
	pop bc
	ret
; 2c8a

GetMapEnvironment:: ; 2c8a
	push hl
	push de
	push bc
	ld de, MAPHEADER_ENVIRONMENT
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 2c98

	ret ; XXX
; 2c99

GetAnyMapEnvironment:: ; 2c99
	push hl
	push de
	push bc
	ld de, MAPHEADER_ENVIRONMENT
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 2ca7

GetAnyMapTileset:: ; 2ca7
	ld de, MAPHEADER_TILESET
	call GetAnyMapHeaderMember
	ld a, c
	ret
; 2caf

GetWorldMapLocation:: ; 0x2caf
; given a map group/id in bc, return its location on the Pokégear map.
	push hl
	push de
	push bc

	ld de, MAPHEADER_LOCATION
	call GetAnyMapHeaderMember
	ld a, c

	pop bc
	pop de
	pop hl
	ret
; 0x2cbd

GetMapHeaderMusic:: ; 2cbd
	push hl
	push bc
	ld de, MAPHEADER_MUSIC
	call GetMapHeaderMember
	ld a, c
	cp MUSIC_MAHOGANY_MART
	jr z, .mahoganymart
	bit RADIO_TOWER_MUSIC_F, c
	jr nz, .radiotower
	farcall Function8b342
	ld e, c
	ld d, 0
.done
	pop bc
	pop hl
	ret

.radiotower
	ld a, [wStatusFlags2]
	bit 0, a
	jr z, .clearedradiotower
	ld de, MUSIC_ROCKET_OVERTURE
	jr .done

.clearedradiotower
	; the rest of the byte
	ld a, c
	and RADIO_TOWER_MUSIC - 1
	ld e, a
	ld d, 0
	jr .done

.mahoganymart
	ld a, [wStatusFlags2]
	bit 7, a
	jr z, .clearedmahogany
	ld de, MUSIC_ROCKET_HIDEOUT
	jr .done

.clearedmahogany
	ld de, MUSIC_CHERRYGROVE_CITY
	jr .done
; 2cff

GetMapHeaderTimeOfDayNybble:: ; 2cff
	call GetPhoneServiceTimeOfDayByte
	and $f
	ret
; 2d05

GetMapHeaderPhoneServiceNybble:: ; 2d05
	call GetPhoneServiceTimeOfDayByte
	and $f0
	swap a
	ret
; 2d0d

GetPhoneServiceTimeOfDayByte:: ; 2d0d
	push hl
	push bc

	ld de, MAPHEADER_PALETTE
	call GetMapHeaderMember
	ld a, c

	pop bc
	pop hl
	ret
; 2d19

GetFishingGroup:: ; 2d19
	push de
	push hl
	push bc

	ld de, MAPHEADER_FISHGROUP
	call GetMapHeaderMember
	ld a, c

	pop bc
	pop hl
	pop de
	ret
; 2d27

LoadTileset:: ; 2d27
	push hl
	push bc

	ld hl, Tilesets
	ld bc, TilesetEnd - Tileset
	ld a, [wTileset]
	call AddNTimes

	ld de, TilesetBank
	ld bc, TilesetEnd - Tileset

	ld a, BANK(Tilesets)
	call FarCopyBytes

	pop bc
	pop hl
	ret
; 2d43
