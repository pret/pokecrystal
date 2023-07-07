; Functions dealing with rendering and interacting with maps.

ClearUnusedMapBuffer::
	ld hl, wUnusedMapBuffer
	ld bc, wUnusedMapBufferEnd - wUnusedMapBuffer
	ld a, 0
	call ByteFill
	ret

CheckScenes::
; Checks wCurMapSceneScriptPointer.  If it's empty, returns -1 in a.  Otherwise, returns the active scene ID in a.
	push hl
	ld hl, wCurMapSceneScriptPointer
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

GetCurrentMapSceneID::
; Grabs the wram map scene script pointer for the current map and loads it into wCurMapSceneScriptPointer.
; If there is no scene, both bytes of wCurMapSceneScriptPointer are wiped clean.
; Copy the current map group and number into bc.  This is needed for GetMapSceneID.
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
; Blank out wCurMapSceneScriptPointer; this is the default scenario.
	xor a
	ld [wCurMapSceneScriptPointer], a
	ld [wCurMapSceneScriptPointer + 1], a
	call GetMapSceneID
	ret c ; The map is not in the scene script table
; Load the scene script pointer from de into wCurMapSceneScriptPointer
	ld a, e
	ld [wCurMapSceneScriptPointer], a
	ld a, d
	ld [wCurMapSceneScriptPointer + 1], a
	xor a
	ret

GetMapSceneID::
; Searches the scene_var table for the map group and number loaded in bc, and returns the wram pointer in de.
; If the map is not in the scene_var table, returns carry.
	push bc
	ldh a, [hROMBank]
	push af
	ld a, BANK(MapScenes)
	rst Bankswitch

	ld hl, MapScenes
.loop
	push hl
	ld a, [hli] ; map group, or terminator
	cp -1
	jr z, .end ; the current map is not in the scene_var table
	cp b
	jr nz, .next ; map group did not match
	ld a, [hli] ; map number
	cp c
	jr nz, .next ; map number did not match
	jr .found ; we found our map

.next
	pop hl
	ld de, 4 ; scene_var size
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

OverworldTextModeSwitch::
	call LoadMapPart
	call SwapTextboxPalettes
	ret

LoadMapPart::
	ldh a, [hROMBank]
	push af

	ld a, [wTilesetBlocksBank]
	rst Bankswitch
	call LoadMetatiles

	ld a, "■"
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill

	ld a, BANK(_LoadMapPart)
	rst Bankswitch
	call _LoadMapPart

	pop af
	rst Bankswitch
	ret

LoadMetatiles::
	; de <- wOverworldMapAnchor
	ld a, [wOverworldMapAnchor]
	ld e, a
	ld a, [wOverworldMapAnchor + 1]
	ld d, a
	ld hl, wSurroundingTiles
	ld b, SCREEN_META_HEIGHT

.row
	push de
	push hl
	ld c, SCREEN_META_WIDTH

.col
	push de
	push hl
	; Load the current map block.
	; If the current map block is a border block, load the border block.
	ld a, [de]
	and a
	jr nz, .ok
	ld a, [wMapBorderBlock]

.ok
	; Load the current wSurroundingTiles address into de.
	ld e, l
	ld d, h
	; Set hl to the address of the current metatile data ([wTilesetBlocksAddress] + (a) tiles).
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [wTilesetBlocksAddress]
	add l
	ld l, a
	ld a, [wTilesetBlocksAddress + 1]
	adc h
	ld h, a

	; copy the 4x4 metatile
rept METATILE_WIDTH - 1
rept METATILE_WIDTH
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, e
	add SURROUNDING_WIDTH - METATILE_WIDTH
	ld e, a
	jr nc, .next\@
	inc d
.next\@
endr
rept METATILE_WIDTH
	ld a, [hli]
	ld [de], a
	inc de
endr
	; Next metatile
	pop hl
	ld de, METATILE_WIDTH
	add hl, de
	pop de
	inc de
	dec c
	jp nz, .col
	; Next metarow
	pop hl
	ld de, SURROUNDING_WIDTH * METATILE_WIDTH
	add hl, de
	pop de
	ld a, [wMapWidth]
	add MAP_CONNECTION_PADDING_WIDTH * 2
	add e
	ld e, a
	jr nc, .ok2
	inc d
.ok2
	dec b
	jp nz, .row
	ret

ReturnToMapFromSubmenu::
	ld a, MAPSETUP_SUBMENU
	ldh [hMapEntryMethod], a
	farcall RunMapSetupScript
	xor a
	ldh [hMapEntryMethod], a
	ret

CheckWarpTile::
	call GetDestinationWarpNumber
	ret nc

	push bc
	farcall CheckDirectionalWarp
	pop bc
	ret nc

	call CopyWarpData
	scf
	ret

WarpCheck::
	call GetDestinationWarpNumber
	ret nc
	call CopyWarpData
	ret

GetDestinationWarpNumber::
	farcall CheckWarpCollision
	ret nc

	ldh a, [hROMBank]
	push af

	call SwitchToMapScriptsBank
	call .GetDestinationWarpNumber

	pop de
	ld a, d
	rst Bankswitch
	ret

.GetDestinationWarpNumber:
	ld a, [wPlayerMapY]
	sub 4
	ld e, a
	ld a, [wPlayerMapX]
	sub 4
	ld d, a
	ld a, [wCurMapWarpCount]
	and a
	ret z

	ld c, a
	ld hl, wCurMapWarpsPointer
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
	ld a, WARP_EVENT_SIZE
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

	ld a, [wCurMapWarpCount]
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

CopyWarpData::
	ldh a, [hROMBank]
	push af

	call SwitchToMapScriptsBank
	call .CopyWarpData

	pop af
	rst Bankswitch
	scf
	ret

.CopyWarpData:
	push bc
	ld hl, wCurMapWarpsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	dec a
	ld bc, WARP_EVENT_SIZE
	call AddNTimes
	ld bc, 2 ; warp number
	add hl, bc
	ld a, [hli]
	cp -1
	jr nz, .skip
	ld hl, wBackupWarpNumber
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
	ld a, [wMapGroup]
	ld [wPrevMapGroup], a
	ld a, [wMapNumber]
	ld [wPrevMapNumber], a
	scf
	ret

CheckOutdoorMap::
	cp ROUTE
	ret z
	cp TOWN
	ret

CheckIndoorMap::
	cp INDOOR
	ret z
	cp CAVE
	ret z
	cp DUNGEON
	ret z
	cp GATE
	ret

CheckUnknownMap:: ; unreferenced
	cp INDOOR
	ret z
	cp GATE
	ret z
	cp ENVIRONMENT_5
	ret

LoadMapAttributes::
	call CopyMapPartialAndAttributes
	call SwitchToMapScriptsBank
	call ReadMapScripts
	xor a ; do not skip object events
	call ReadMapEvents
	ret

LoadMapAttributes_SkipObjects::
	call CopyMapPartialAndAttributes
	call SwitchToMapScriptsBank
	call ReadMapScripts
	ld a, TRUE ; skip object events
	call ReadMapEvents
	ret

CopyMapPartialAndAttributes::
	call CopyMapPartial
	call SwitchToMapAttributesBank
	call GetMapAttributesPointer
	call CopyMapAttributes
	call GetMapConnections
	ret

ReadMapEvents::
	push af
	ld hl, wMapEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	call ReadWarps
	call ReadCoordEvents
	call ReadBGEvents

	pop af
	and a ; skip object events?
	ret nz

	call ReadObjectEvents
	ret

ReadMapScripts::
	ld hl, wMapScriptsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSceneScripts
	call ReadMapCallbacks
	ret

CopyMapAttributes::
	ld de, wMapAttributes
	ld c, wMapAttributesEnd - wMapAttributes
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

GetMapConnections::
	ld a, $ff
	ld [wNorthConnectedMapGroup], a
	ld [wSouthConnectedMapGroup], a
	ld [wWestConnectedMapGroup], a
	ld [wEastConnectedMapGroup], a

	ld a, [wMapConnections]
	ld b, a

	bit NORTH_F, b
	jr z, .no_north
	ld de, wNorthMapConnection
	call GetMapConnection
.no_north

	bit SOUTH_F, b
	jr z, .no_south
	ld de, wSouthMapConnection
	call GetMapConnection
.no_south

	bit WEST_F, b
	jr z, .no_west
	ld de, wWestMapConnection
	call GetMapConnection
.no_west

	bit EAST_F, b
	jr z, .no_east
	ld de, wEastMapConnection
	call GetMapConnection
.no_east

	ret

GetMapConnection::
; Load map connection struct at hl into de.
	ld c, wSouthMapConnection - wNorthMapConnection
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

ReadMapSceneScripts::
	ld a, [hli] ; scene_script count
	ld c, a
	ld [wCurMapSceneScriptCount], a
	ld a, l
	ld [wCurMapSceneScriptsPointer], a
	ld a, h
	ld [wCurMapSceneScriptsPointer + 1], a
	ld a, c
	and a
	ret z

	ld bc, SCENE_SCRIPT_SIZE
	call AddNTimes
	ret

ReadMapCallbacks::
	ld a, [hli]
	ld c, a
	ld [wCurMapCallbackCount], a
	ld a, l
	ld [wCurMapCallbacksPointer], a
	ld a, h
	ld [wCurMapCallbacksPointer + 1], a
	ld a, c
	and a
	ret z

	ld bc, CALLBACK_SIZE
	call AddNTimes
	ret

ReadWarps::
	ld a, [hli]
	ld c, a
	ld [wCurMapWarpCount], a
	ld a, l
	ld [wCurMapWarpsPointer], a
	ld a, h
	ld [wCurMapWarpsPointer + 1], a
	ld a, c
	and a
	ret z
	ld bc, WARP_EVENT_SIZE
	call AddNTimes
	ret

ReadCoordEvents::
	ld a, [hli]
	ld c, a
	ld [wCurMapCoordEventCount], a
	ld a, l
	ld [wCurMapCoordEventsPointer], a
	ld a, h
	ld [wCurMapCoordEventsPointer + 1], a

	ld a, c
	and a
	ret z

	ld bc, COORD_EVENT_SIZE
	call AddNTimes
	ret

ReadBGEvents::
	ld a, [hli]
	ld c, a
	ld [wCurMapBGEventCount], a
	ld a, l
	ld [wCurMapBGEventsPointer], a
	ld a, h
	ld [wCurMapBGEventsPointer + 1], a

	ld a, c
	and a
	ret z

	ld bc, BG_EVENT_SIZE
	call AddNTimes
	ret

ReadObjectEvents::
	push hl
	call ClearObjectStructs
	pop de
	ld hl, wMap1Object
	ld a, [de]
	inc de
	ld [wCurMapObjectEventCount], a
	ld a, e
	ld [wCurMapObjectEventsPointer], a
	ld a, d
	ld [wCurMapObjectEventsPointer + 1], a

	ld a, [wCurMapObjectEventCount]
	call CopyMapObjectEvents

; get NUM_OBJECTS - [wCurMapObjectEventCount]
; BUG: ReadObjectEvents overflows into wObjectMasks (see docs/bugs_and_glitches.md)
	ld a, [wCurMapObjectEventCount]
	ld c, a
	ld a, NUM_OBJECTS
	sub c
	jr z, .skip

	; could have done "inc hl" instead
	ld bc, 1
	add hl, bc
	ld bc, MAPOBJECT_LENGTH
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

CopyMapObjectEvents::
	and a
	ret z

	ld c, a
.loop
	push bc
	push hl
	ld a, $ff
	ld [hli], a
	ld b, OBJECT_EVENT_SIZE
.loop2
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop2

	pop hl
	ld bc, MAPOBJECT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

ClearObjectStructs::
	ld hl, wObject1Struct
	ld bc, OBJECT_LENGTH * (NUM_OBJECT_STRUCTS - 1)
	xor a
	call ByteFill

; Just to make sure (this is rather pointless)
	ld hl, wObject1Struct
	ld de, OBJECT_LENGTH
	ld c, NUM_OBJECT_STRUCTS - 1
	xor a
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

GetWarpDestCoords::
	call GetMapScriptsBank
	rst Bankswitch

	ld hl, wMapEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 3 ; get to the warp coords
	inc hl
endr
	ld a, [wWarpNumber]
	dec a
	ld c, a
	ld b, 0
	ld a, WARP_EVENT_SIZE
	call AddNTimes
	ld a, [hli]
	ld [wYCoord], a
	ld a, [hli]
	ld [wXCoord], a
	; destination warp number
	ld a, [hli]
	cp -1
	jr nz, .skip
	call .backup

.skip
	farcall GetMapScreenCoords
	ret

.backup
	ld a, [wPrevWarp]
	ld [wBackupWarpNumber], a
	ld a, [wPrevMapGroup]
	ld [wBackupMapGroup], a
	ld a, [wPrevMapNumber]
	ld [wBackupMapNumber], a
	ret

LoadBlockData::
	ld hl, wOverworldMapBlocks
	ld bc, wOverworldMapBlocksEnd - wOverworldMapBlocks
	ld a, 0
	call ByteFill
	call ChangeMap
	call FillMapConnections
	ld a, MAPCALLBACK_TILES
	call RunMapCallback
	ret

ChangeMap::
	ldh a, [hROMBank]
	push af

	ld hl, wOverworldMapBlocks
	ld a, [wMapWidth]
	ldh [hConnectedMapWidth], a
	add $6
	ldh [hConnectionStripLength], a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld c, 3
	add hl, bc
	ld a, [wMapBlocksBank]
	rst Bankswitch

	ld a, [wMapBlocksPointer]
	ld e, a
	ld a, [wMapBlocksPointer + 1]
	ld d, a
	ld a, [wMapHeight]
	ld b, a
.row
	push hl
	ldh a, [hConnectedMapWidth]
	ld c, a
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ldh a, [hConnectionStripLength]
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

FillMapConnections::
; North
	ld a, [wNorthConnectedMapGroup]
	cp $ff
	jr z, .South
	ld b, a
	ld a, [wNorthConnectedMapNumber]
	ld c, a
	call GetAnyMapBlocksBank

	ld a, [wNorthConnectionStripPointer]
	ld l, a
	ld a, [wNorthConnectionStripPointer + 1]
	ld h, a
	ld a, [wNorthConnectionStripLocation]
	ld e, a
	ld a, [wNorthConnectionStripLocation + 1]
	ld d, a
	ld a, [wNorthConnectionStripLength]
	ldh [hConnectionStripLength], a
	ld a, [wNorthConnectedMapWidth]
	ldh [hConnectedMapWidth], a
	call FillNorthConnectionStrip

.South:
	ld a, [wSouthConnectedMapGroup]
	cp $ff
	jr z, .West
	ld b, a
	ld a, [wSouthConnectedMapNumber]
	ld c, a
	call GetAnyMapBlocksBank

	ld a, [wSouthConnectionStripPointer]
	ld l, a
	ld a, [wSouthConnectionStripPointer + 1]
	ld h, a
	ld a, [wSouthConnectionStripLocation]
	ld e, a
	ld a, [wSouthConnectionStripLocation + 1]
	ld d, a
	ld a, [wSouthConnectionStripLength]
	ldh [hConnectionStripLength], a
	ld a, [wSouthConnectedMapWidth]
	ldh [hConnectedMapWidth], a
	call FillSouthConnectionStrip

.West:
	ld a, [wWestConnectedMapGroup]
	cp $ff
	jr z, .East
	ld b, a
	ld a, [wWestConnectedMapNumber]
	ld c, a
	call GetAnyMapBlocksBank

	ld a, [wWestConnectionStripPointer]
	ld l, a
	ld a, [wWestConnectionStripPointer + 1]
	ld h, a
	ld a, [wWestConnectionStripLocation]
	ld e, a
	ld a, [wWestConnectionStripLocation + 1]
	ld d, a
	ld a, [wWestConnectionStripLength]
	ld b, a
	ld a, [wWestConnectedMapWidth]
	ldh [hConnectionStripLength], a
	call FillWestConnectionStrip

.East:
	ld a, [wEastConnectedMapGroup]
	cp $ff
	jr z, .Done
	ld b, a
	ld a, [wEastConnectedMapNumber]
	ld c, a
	call GetAnyMapBlocksBank

	ld a, [wEastConnectionStripPointer]
	ld l, a
	ld a, [wEastConnectionStripPointer + 1]
	ld h, a
	ld a, [wEastConnectionStripLocation]
	ld e, a
	ld a, [wEastConnectionStripLocation + 1]
	ld d, a
	ld a, [wEastConnectionStripLength]
	ld b, a
	ld a, [wEastConnectedMapWidth]
	ldh [hConnectionStripLength], a
	call FillEastConnectionStrip

.Done:
	ret

FillNorthConnectionStrip::
FillSouthConnectionStrip::
	ld c, 3
.y
	push de

	push hl
	ldh a, [hConnectionStripLength]
	ld b, a
.x
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .x
	pop hl

	ldh a, [hConnectedMapWidth]
	ld e, a
	ld d, 0
	add hl, de
	pop de

	ld a, [wMapWidth]
	add 6
	add e
	ld e, a
	jr nc, .okay
	inc d
.okay
	dec c
	jr nz, .y
	ret

FillWestConnectionStrip::
FillEastConnectionStrip::
.loop
	ld a, [wMapWidth]
	add 6
	ldh [hConnectedMapWidth], a

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

	ldh a, [hConnectionStripLength]
	ld e, a
	ld d, 0
	add hl, de
	pop de

	ldh a, [hConnectedMapWidth]
	add e
	ld e, a
	jr nc, .okay
	inc d
.okay
	dec b
	jr nz, .loop
	ret

LoadMapStatus::
	ld [wMapStatus], a
	ret

CallScript::
; Call a script at a:hl.

	ld [wScriptBank], a
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a

	ld a, PLAYEREVENT_MAPSCRIPT
	ld [wScriptRunning], a

	scf
	ret

CallMapScript::
; Call a script at hl in the current bank if there isn't already a script running
	ld a, [wScriptRunning]
	and a
	ret nz
	call GetMapScriptsBank
	jr CallScript

RunMapCallback::
; Will run the first callback found with execution index equal to a.
	ld b, a
	ldh a, [hROMBank]
	push af
	call SwitchToMapScriptsBank
	call .FindCallback
	jr nc, .done

	call GetMapScriptsBank
	ld b, a
	ld d, h
	ld e, l
	call ExecuteCallbackScript

.done
	pop af
	rst Bankswitch
	ret

.FindCallback:
	ld a, [wCurMapCallbackCount]
	ld c, a
	and a
	ret z
	ld hl, wCurMapCallbacksPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld de, CALLBACK_SIZE
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

ExecuteCallbackScript::
; Do map callback de and return to script bank b.
	farcall CallCallback
	ld a, [wScriptMode]
	push af
	ld hl, wScriptFlags
	ld a, [hl]
	push af
	set 1, [hl]
	farcall EnableScriptMode
	farcall ScriptEvents
	pop af
	ld [wScriptFlags], a
	pop af
	ld [wScriptMode], a
	ret

MapTextbox::
	ldh a, [hROMBank]
	push af

	ld a, b
	rst Bankswitch

	push hl
	call SpeechTextbox
	call SafeUpdateSprites
	ld a, 1
	ldh [hOAMUpdate], a
	call ApplyTilemap
	pop hl
	call PrintTextboxText
	xor a
	ldh [hOAMUpdate], a

	pop af
	rst Bankswitch
	ret

Call_a_de::
; Call a:de.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call .de

	pop af
	rst Bankswitch
	ret

.de
	push de
	ret

GetMovementData::
; Initialize the movement data for object c at b:hl
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, c
	call LoadMovementDataPointer

	pop hl
	ld a, h
	rst Bankswitch
	ret

GetScriptByte::
; Return byte at wScriptBank:wScriptPos in a.

	push hl
	push bc
	ldh a, [hROMBank]
	push af
	ld a, [wScriptBank]
	rst Bankswitch

	ld hl, wScriptPos
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

ObjectEvent::
	jumptextfaceplayer ObjectEventText

ObjectEventText::
	text_far _ObjectEventText
	text_end

BGEvent:: ; unreferenced
	jumptext BGEventText

BGEventText::
	text_far _BGEventText
	text_end

CoordinatesEvent:: ; unreferenced
	jumptext CoordinatesEventText

CoordinatesEventText::
	text_far _CoordinatesEventText
	text_end

CheckObjectMask::
	ldh a, [hMapObjectIndex]
	ld e, a
	ld d, 0
	ld hl, wObjectMasks
	add hl, de
	ld a, [hl]
	ret

MaskObject::
	ldh a, [hMapObjectIndex]
	ld e, a
	ld d, 0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], -1 ; masked
	ret

UnmaskObject::
	ldh a, [hMapObjectIndex]
	ld e, a
	ld d, 0
	ld hl, wObjectMasks
	add hl, de
	ld [hl], 0 ; unmasked
	ret

if DEF(_DEBUG)
ComputeROMXChecksum::
	ldh a, [hROMBank]
	push af
	ld a, c
	rst Bankswitch
	ld hl, $4000 ; ROMX start
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, h
	cp $80 ; HIGH(ROMX end)
	jr c, .loop
	pop af
	rst Bankswitch
	ret
endc

ScrollMapUp::
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call ScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapDown::
	hlcoord 0, SCREEN_HEIGHT - 2
	ld de, wBGMapBuffer
	call BackupBGMapRow
	ld c, 2 * SCREEN_WIDTH
	call ScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld bc, BG_MAP_WIDTH tiles
	add hl, bc
; cap d at HIGH(vBGMap0)
	ld a, h
	and %00000011
	or HIGH(vBGMap0)
	ld e, l
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapLeft::
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call ScrollBGMapPalettes
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ldh [hBGMapUpdate], a
	ret

ScrollMapRight::
	hlcoord SCREEN_WIDTH - 2, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	ld c, 2 * SCREEN_HEIGHT
	call ScrollBGMapPalettes
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
	ldh [hBGMapUpdate], a
	ret

BackupBGMapRow::
	ld c, 2 * SCREEN_WIDTH
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

BackupBGMapColumn::
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

UpdateBGMapRow::
	ld hl, wBGMapBufferPointers
	push de
	call .iteration
	pop de
	ld a, BG_MAP_WIDTH
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
	ldh [hBGMapTileCount], a
	ret

UpdateBGMapColumn::
	ld hl, wBGMapBufferPointers
	ld c, SCREEN_HEIGHT
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, BG_MAP_WIDTH
	add e
	ld e, a
	jr nc, .skip
	inc d
; cap d at HIGH(vBGMap0)
	ld a, d
	and %11
	or HIGH(vBGMap0)
	ld d, a

.skip
	dec c
	jr nz, .loop
	ld a, SCREEN_HEIGHT
	ldh [hBGMapTileCount], a
	ret

ClearBGMapBuffer:: ; unreferenced
	ld hl, wBGMapBuffer
	ld bc, wBGMapBufferEnd - wBGMapBuffer
	xor a
	call ByteFill
	ret

LoadTilesetGFX::
	ld hl, wTilesetAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTilesetBank]
	ld e, a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld a, e
	ld de, wDecompressScratch
	call FarDecompress

	ld hl, wDecompressScratch
	ld de, vTiles2
	ld bc, $60 tiles
	call CopyBytes

	ldh a, [rVBK]
	push af
	ld a, BANK(vTiles5)
	ldh [rVBK], a

	ld hl, wDecompressScratch + $60 tiles
	ld de, vTiles5
	ld bc, $60 tiles
	call CopyBytes

	pop af
	ldh [rVBK], a

	pop af
	ldh [rSVBK], a

; These tilesets support dynamic per-mapgroup roof tiles.
	ld a, [wMapTileset]
	cp TILESET_JOHTO
	jr z, .load_roof
	cp TILESET_JOHTO_MODERN
	jr z, .load_roof
	cp TILESET_BATTLE_TOWER_OUTSIDE
	jr z, .load_roof
	jr .skip_roof

.load_roof
	farcall LoadMapGroupRoof

.skip_roof
	xor a
	ldh [hTileAnimFrame], a
	ret

BufferScreen::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wScreenSave
	ld c, SCREEN_META_HEIGHT
	ld b, SCREEN_META_WIDTH
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
	ld a, [wMapWidth]
	add 6
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .row
	ret

SaveScreen::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wScreenSave
	ld a, [wMapWidth]
	add 6
	ldh [hMapObjectIndex], a
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
	ld de, wScreenSave + SCREEN_META_WIDTH
	ldh a, [hMapObjectIndex]
	ld c, a
	ld b, 0
	add hl, bc
	jr .vertical

.down
	ld de, wScreenSave
.vertical
	ld b, SCREEN_META_WIDTH
	ld c, SCREEN_META_HEIGHT - 1
	jr SaveScreen_LoadConnection

.left
	ld de, wScreenSave + 1
	inc hl
	jr .horizontal

.right
	ld de, wScreenSave
.horizontal
	ld b, SCREEN_META_WIDTH - 1
	ld c, SCREEN_META_HEIGHT
	jr SaveScreen_LoadConnection

LoadConnectionBlockData::
	ld hl, wOverworldMapAnchor
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapWidth]
	add 6
	ldh [hConnectionStripLength], a
	ld de, wScreenSave
	ld b, SCREEN_META_WIDTH
	ld c, SCREEN_META_HEIGHT

SaveScreen_LoadConnection::
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
	ldh a, [hConnectionStripLength]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .row
	ret

GetMovementPermissions::
	xor a
	ld [wTilePermissions], a
	call .LeftRight
	call .UpDown
; get coords of current tile
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	call GetCoordTile
	ld [wPlayerTile], a
	call .CheckHiNybble
	ret nz

	ld a, [wPlayerTile]
	and 7
	ld hl, .MovementPermissionsData
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld hl, wTilePermissions
	or [hl]
	ld [hl], a
	ret

.MovementPermissionsData:
	db DOWN_MASK
	db UP_MASK
	db LEFT_MASK
	db RIGHT_MASK
	db DOWN_MASK | RIGHT_MASK
	db UP_MASK | RIGHT_MASK
	db DOWN_MASK | LEFT_MASK
	db UP_MASK | LEFT_MASK

.UpDown:
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a

	push de
	inc e
	call GetCoordTile
	ld [wTileDown], a
	call .Down

	pop de
	dec e
	call GetCoordTile
	ld [wTileUp], a
	call .Up
	ret

.LeftRight:
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a

	push de
	dec d
	call GetCoordTile
	ld [wTileLeft], a
	call .Left

	pop de
	inc d
	call GetCoordTile
	ld [wTileRight], a
	call .Right
	ret

.Down:
	call .CheckHiNybble
	ret nz
	ld a, [wTileDown]
	and %111
	cp COLL_UP_WALL & %111 ; COLL_UP_BUOY & %111
	jr z, .ok_down
	cp COLL_UP_RIGHT_WALL & %111 ; COLL_UP_RIGHT_BUOY & %111
	jr z, .ok_down
	cp COLL_UP_LEFT_WALL & %111 ; COLL_UP_LEFT_BUOY & %111
	ret nz

.ok_down
	ld a, [wTilePermissions]
	or FACE_DOWN
	ld [wTilePermissions], a
	ret

.Up:
	call .CheckHiNybble
	ret nz
	ld a, [wTileUp]
	and %111
	cp COLL_DOWN_WALL & %111 ; COLL_DOWN_BUOY & %111
	jr z, .ok_up
	cp COLL_DOWN_RIGHT_WALL & %111 ; COLL_DOWN_RIGHT_BUOY & %111
	jr z, .ok_up
	cp COLL_DOWN_LEFT_WALL & %111 ; COLL_DOWN_LEFT_BUOY & %111
	ret nz

.ok_up
	ld a, [wTilePermissions]
	or FACE_UP
	ld [wTilePermissions], a
	ret

.Right:
	call .CheckHiNybble
	ret nz
	ld a, [wTileRight]
	and %111
	cp COLL_LEFT_WALL & %111 ; COLL_LEFT_BUOY & %111
	jr z, .ok_right
	cp COLL_DOWN_LEFT_WALL & %111 ; COLL_DOWN_LEFT_BUOY & %111
	jr z, .ok_right
	cp COLL_UP_LEFT_WALL & %111 ; COLL_UP_LEFT_BUOY & %111
	ret nz

.ok_right
	ld a, [wTilePermissions]
	or FACE_RIGHT
	ld [wTilePermissions], a
	ret

.Left:
	call .CheckHiNybble
	ret nz
	ld a, [wTileLeft]
	and %111
	cp COLL_RIGHT_WALL & %111 ; COLL_RIGHT_BUOY & %111
	jr z, .ok_left
	cp COLL_DOWN_RIGHT_WALL & %111 ; COLL_DOWN_RIGHT_BUOY & %111
	jr z, .ok_left
	cp COLL_UP_RIGHT_WALL & %111 ; COLL_UP_RIGHT_BUOY & %111
	ret nz

.ok_left
	ld a, [wTilePermissions]
	or FACE_LEFT
	ld [wTilePermissions], a
	ret

.CheckHiNybble:
	and $f0
	cp HI_NYBBLE_SIDE_WALLS
	ret z
	cp HI_NYBBLE_SIDE_BUOYS
	ret

GetFacingTileCoord::
; Return map coordinates in (d, e) and tile id in a
; of the tile the player is facing.

	ld a, [wPlayerDirection]
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

	ld a, [wPlayerMapX]
	add d
	ld d, a
	ld a, [wPlayerMapY]
	add e
	ld e, a
	ld a, [hl]
	ret

.Directions:
	;   x,  y
	db  0,  1
	dw wTileDown
	db  0, -1
	dw wTileUp
	db -1,  0
	dw wTileLeft
	db  1,  0
	dw wTileRight

GetCoordTile::
; Get the collision byte for tile d, e
	call GetBlockLocation
	ld a, [hl]
	and a
	jr z, .nope
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld a, [wTilesetCollisionAddress]
	ld c, a
	ld a, [wTilesetCollisionAddress + 1]
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
	ld a, [wTilesetCollisionBank]
	call GetFarByte
	ret

.nope
	ld a, -1
	ret

GetBlockLocation::
	ld a, [wMapWidth]
	add 6
	ld c, a
	ld b, 0
	ld hl, wOverworldMapBlocks + 1
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

CheckFacingBGEvent::
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
	ld a, [wCurMapBGEventCount]
	and a
	ret z

	ld c, a
	ldh a, [hROMBank]
	push af
	call SwitchToMapScriptsBank
	call CheckIfFacingTileCoordIsBGEvent
	pop hl
	ld a, h
	rst Bankswitch
	ret

CheckIfFacingTileCoordIsBGEvent::
; Checks to see if you are facing a BG event.  If so, copies it into wCurBGEvent and sets carry.
	ld hl, wCurMapBGEventsPointer
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
	ld a, BG_EVENT_SIZE
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
	ld de, wCurBGEvent
	ld bc, BG_EVENT_SIZE
	call CopyBytes
	scf
	ret

CheckCurrentMapCoordEvents::
; If there are no coord events, we don't need to be here.
	ld a, [wCurMapCoordEventCount]
	and a
	ret z
; Copy the coord event count into c.
	ld c, a
	ldh a, [hROMBank]
	push af
	call SwitchToMapScriptsBank
	call .CoordEventCheck
	pop hl
	ld a, h
	rst Bankswitch
	ret

.CoordEventCheck:
; Checks to see if you are standing on a coord event.  If yes, copies the event to wCurCoordEvent and sets carry.
	ld hl, wCurMapCoordEventsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Load the active scene ID into b
	call CheckScenes
	ld b, a
; Load your current coordinates into de.  This will be used to check if your position is in the coord event table for the current map.
	ld a, [wPlayerMapX]
	sub 4
	ld d, a
	ld a, [wPlayerMapY]
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
	ld a, COORD_EVENT_SIZE
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
	ld de, wCurCoordEvent
	ld bc, COORD_EVENT_SIZE
	call CopyBytes
	scf
	ret

FadeToMenu::
	xor a
	ldh [hBGMapMode], a
	call LoadStandardMenuHeader
	farcall FadeOutPalettes
	call ClearSprites
	call DisableSpriteUpdates
	ret

CloseSubmenu::
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call Call_ExitMenu
	call GSReloadPalettes
	jr FinishExitMenu

ExitAllMenus::
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call UpdateSprites
	call GSReloadPalettes
FinishExitMenu::
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call WaitBGMap2
	farcall FadeInPalettes
	call EnableSpriteUpdates
	ret

ReturnToMapWithSpeechTextbox::
	push af
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call ClearBGPalettes
	call ClearSprites
	call ReloadTilesetAndPalettes
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	ld hl, wVramState
	set 0, [hl]
	call UpdateSprites
	call WaitBGMap2
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call UpdateTimePals
	call DelayFrame
	ld a, $1
	ldh [hMapAnims], a
	pop af
	ret

ReloadTilesetAndPalettes::
	call DisableLCD
	call ClearSprites
	farcall RefreshSprites
	call LoadStandardFont
	call LoadFontsExtra
	ldh a, [hROMBank]
	push af
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call SwitchToAnyMapAttributesBank
	farcall UpdateTimeOfDayPal
	call OverworldTextModeSwitch
	call LoadTilesetGFX
	ld a, 9
	call SkipMusic
	pop af
	rst Bankswitch

	call EnableLCD
	ret

GetMapPointer::
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapPointer::
; Prior to calling this function, you must have switched banks so that
; MapGroupPointers is visible.

; inputs:
; b = map group, c = map number

; outputs:
; hl points to the map within its group
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

	; find the cth map within the group
	dec c
	ld b, 0
	ld a, MAP_LENGTH
	call AddNTimes
	ret

GetMapField::
; Extract data from the current map's group entry.

; inputs:
; de = offset of desired data within the map (a MAP_* constant)

; outputs:
; bc = data from the current map's field
; (e.g., de = MAP_TILESET would return a pointer to the tileset id)

	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapField::
	; bankswitch
	ldh a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch

	call GetAnyMapPointer
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]

	; bankswitch back
	pop af
	rst Bankswitch
	ret

SwitchToMapAttributesBank::
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
SwitchToAnyMapAttributesBank::
	call GetAnyMapAttributesBank
	rst Bankswitch
	ret

GetMapAttributesBank:: ; unreferenced
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
GetAnyMapAttributesBank::
	push hl
	push de
	ld de, MAP_MAPATTRIBUTES_BANK
	call GetAnyMapField
	ld a, c
	pop de
	pop hl
	ret

CopyMapPartial::
; Copy map data bank, tileset, environment, and map data address
; from the current map's entry within its group.
	ldh a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch

	call GetMapPointer
	ld de, wMapPartial
	ld bc, wMapPartialEnd - wMapPartial
	call CopyBytes

	pop af
	rst Bankswitch
	ret

SwitchToMapScriptsBank::
	ld a, [wMapScriptsBank]
	rst Bankswitch
	ret

GetMapScriptsBank::
	ld a, [wMapScriptsBank]
	ret

GetAnyMapBlocksBank::
; Return the blockdata bank for group b map c.
	push hl
	push de
	push bc

	push bc
	ld de, MAP_MAPATTRIBUTES
	call GetAnyMapField
	ld l, c
	ld h, b
	pop bc

	push hl
	ld de, MAP_MAPATTRIBUTES_BANK
	call GetAnyMapField
	pop hl

	ld de, MAP_MAPATTRIBUTES ; blockdata bank
	add hl, de
	ld a, c
	call GetFarByte
	rst Bankswitch

	pop bc
	pop de
	pop hl
	ret

GetMapAttributesPointer::
; returns the current map's data pointer in hl.
	push bc
	push de
	ld de, MAP_MAPATTRIBUTES
	call GetMapField
	ld l, c
	ld h, b
	pop de
	pop bc
	ret

GetMapEnvironment::
	push hl
	push de
	push bc
	ld de, MAP_ENVIRONMENT
	call GetMapField
	ld a, c
	pop bc
	pop de
	pop hl
	ret

Map_DummyFunction:: ; unreferenced
	ret

GetAnyMapEnvironment::
	push hl
	push de
	push bc
	ld de, MAP_ENVIRONMENT
	call GetAnyMapField
	ld a, c
	pop bc
	pop de
	pop hl
	ret

GetAnyMapTileset::
	ld de, MAP_TILESET
	call GetAnyMapField
	ld a, c
	ret

GetWorldMapLocation::
; given a map group/id in bc, return its location on the Pokégear map.
	push hl
	push de
	push bc

	ld de, MAP_LOCATION
	call GetAnyMapField
	ld a, c

	pop bc
	pop de
	pop hl
	ret

GetMapMusic::
	push hl
	push bc
	ld de, MAP_MUSIC
	call GetMapField
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
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
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
	bit STATUSFLAGS2_ROCKETS_IN_MAHOGANY_F, a
	jr z, .clearedmahogany
	ld de, MUSIC_ROCKET_HIDEOUT
	jr .done

.clearedmahogany
	ld de, MUSIC_CHERRYGROVE_CITY
	jr .done

GetMapTimeOfDay::
	call GetPhoneServiceTimeOfDayByte
	and $f
	ret

GetMapPhoneService::
	call GetPhoneServiceTimeOfDayByte
	and $f0
	swap a
	ret

GetPhoneServiceTimeOfDayByte::
	push hl
	push bc

	ld de, MAP_PALETTE
	call GetMapField
	ld a, c

	pop bc
	pop hl
	ret

GetFishingGroup::
	push de
	push hl
	push bc

	ld de, MAP_FISHGROUP
	call GetMapField
	ld a, c

	pop bc
	pop hl
	pop de
	ret

LoadMapTileset::
	push hl
	push bc

	ld hl, Tilesets
	ld bc, TILESET_LENGTH
	ld a, [wMapTileset]
	call AddNTimes

	ld de, wTilesetBank
	ld bc, TILESET_LENGTH

	ld a, BANK(Tilesets)
	call FarCopyBytes

	pop bc
	pop hl
	ret

DummyEndPredef::
; Unused function at the end of PredefPointers.
rept 16
	nop
endr
	ret
