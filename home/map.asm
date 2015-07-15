; Functions dealing with rendering and interacting with maps.

Function210f:: ; 210f
	ld hl, wc7e8
	ld bc, $0018
	ld a, $0
	call ByteFill
	ret
; 211b

CheckTriggers:: ; 211b
	push hl
	ld hl, BikeFlags + 2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ld a, [hl]
	jr nz, .asm_2128
	ld a, -1

.asm_2128
	pop hl
	ret
; 212a

GetCurrentMapTrigger:: ; 212a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	xor a
	ld [BikeFlags + 2], a
	ld [BikeFlags + 3], a
	call GetMapTrigger
	ret c
	ld a, e
	ld [BikeFlags + 2], a
	ld a, d
	ld [BikeFlags + 3], a
	xor a
	ret
; 2147

GetMapTrigger:: ; 2147
	push bc
	ld a, [hROMBank]
	push af
	ld a, BANK(MapTriggers)
	rst Bankswitch

	ld hl, MapTriggers
.asm_2151
	push hl
	ld a, [hli]
	cp $ff
	jr z, .asm_2167
	cp b
	jr nz, .asm_2160
	ld a, [hli]
	cp c
	jr nz, .asm_2160
	jr .asm_216a

.asm_2160
	pop hl
	ld de, $0004
	add hl, de
	jr .asm_2151

.asm_2167
	scf
	jr .asm_216d

.asm_216a
	ld e, [hl]
	inc hl
	ld d, [hl]

.asm_216d
	pop hl
	pop bc
	ld a, b
	rst Bankswitch

	pop bc
	ret
; 2173

Function2173:: ; 2173
	call Function217a
	call Functiondb1
	ret
; 217a

Function217a:: ; 217a
	ld a, [hROMBank]
	push af

	ld a, [TilesetBlocksBank]
	rst Bankswitch

	call Function2198
	ld a, $60
	ld hl, TileMap
	ld bc, TileMapEnd - TileMap
	call ByteFill

	ld a, BANK(Function4d15b)
	rst Bankswitch
	call Function4d15b

	pop af
	rst Bankswitch
	ret
; 2198

Function2198:: ; 2198
	ld a, [wd194]
	ld e, a
	ld a, [wd195]
	ld d, a
	ld hl, wEnemyMoveStruct
	ld b, $5

.asm_21a5
	push de
	push hl
	ld c, $6

.asm_21a9
	push de
	push hl
	ld a, [de]
	and a
	jr nz, .asm_21b2
	ld a, [MapBorderBlock]

.asm_21b2
	ld e, l
	ld d, h
	add a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [TilesetBlocksAddress]
	add l
	ld l, a
	ld a, [TilesetBlocksAddress + 1]
	adc h
	ld h, a

rept 3
rept 4
	ld a, [hli]
	ld [de], a
	inc de
endr

	ld a, e
	add 20
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

	pop hl
	ld de, $0004
	add hl, de
	pop de
	inc de
	dec c
	jp nz, .asm_21a9
	pop hl
	ld de, $0060
	add hl, de
	pop de
	ld a, [MapWidth]
	add $6
	add e
	ld e, a
	jr nc, .asm_2225
	inc d

.asm_2225
	dec b
	jp nz, .asm_21a5
	ret
; 222a

Function222a:: ; 222a
	ld a, $fa
	ld [$ff9f], a
	callba RunMapSetupScript
	xor a
	ld [$ff9f], a
	ret
; 2238

Function2238:: ; 2238
	call Function2252
	ret nc
	push bc
	callba Function149af
	pop bc
	ret nc
	call Function22a7
	scf
	ret
; 224a



Function224a:: ; 224a
	call Function2252
	ret nc
	call Function22a7
	ret
; 2252

Function2252:: ; 2252
	callba Function1499a
	ret nc

	ld a, [hROMBank]
	push af

	call Function2c52
	call Function2266

	pop de
	ld a, d
	rst Bankswitch
	ret
; 2266

Function2266:: ; 2266
	ld a, [MapY]
	sub $4
	ld e, a
	ld a, [MapX]
	sub $4
	ld d, a
	ld a, [wdbfb]
	and a
	ret z
	ld c, a
	ld hl, wdbfc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_227e
	push hl
	ld a, [hli]
	cp e
	jr nz, .asm_2289
	ld a, [hli]
	cp d
	jr nz, .asm_2289
	jr .asm_2296

.asm_2289
	pop hl
	ld a, $5
	add l
	ld l, a
	jr nc, .asm_2291
	inc h

.asm_2291
	dec c
	jr nz, .asm_227e
	xor a
	ret

.asm_2296
	pop hl
	call Function22a3
	ret nc
	ld a, [wdbfb]
	inc a
	sub c
	ld c, a
	scf
	ret
; 22a3

Function22a3:: ; 22a3
	inc hl
	inc hl
	scf
	ret
; 22a7

Function22a7:: ; 22a7
	ld a, [hROMBank]
	push af

	call Function2c52
	call Function22b4

	pop af
	rst Bankswitch
	scf
	ret
; 22b4

Function22b4:: ; 22b4
	push bc
	ld hl, wdbfc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	dec a
	ld bc, $0005
	call AddNTimes
	ld bc, $0002
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .asm_22d0
	ld hl, wdcac
	ld a, [hli]

.asm_22d0
	pop bc
	ld [wd146], a
	ld a, [hli]
	ld [wd147], a
	ld a, [hli]
	ld [wd148], a
	ld a, c
	ld [wd149], a
	ld a, [MapGroup]
	ld [wd14a], a
	ld a, [MapNumber]
	ld [wd14b], a
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

Function2300:: ; 2300
	cp INDOOR
	ret z
	cp GATE
	ret z
	cp $5
	ret
; 2309


Function2309:: ; 2309
	call Function2326
	call Function2c52
	call Function234f
	xor a
	call Function2336
	ret
; 2317

Function2317:: ; 2317
	call Function2326
	call Function2c52
	call Function234f
	ld a, $1
	call Function2336
	ret
; 2326

Function2326:: ; 2326
	call Function2c3d
	call SwitchToMapBank
	call GetSecondaryMapHeaderPointer
	call Function235c
	call Function2368
	ret
; 2336

Function2336:: ; 2336
	push af
	ld hl, MapEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	call Function23da
	call Function23f1
	call Function2408
	pop af
	and a
	ret nz
	call Function241f
	ret
; 234f

Function234f:: ; 234f
	ld hl, MapScriptHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function23ac
	call Function23c3
	ret
; 235c

Function235c:: ; 235c
	ld de, MapHeader
	ld c, $c
.asm_2361
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2361
	ret
; 2368

Function2368:: ; 2368
	ld a, $ff
	ld [NorthConnectedMapGroup], a
	ld [SouthConnectedMapGroup], a
	ld [WestConnectedMapGroup], a
	ld [EastConnectedMapGroup], a

	ld a, [MapConnections]
	ld b, a

	bit 3, b
	jr z, .asm_2384
	ld de, NorthMapConnection
	call GetMapConnection
.asm_2384

	bit 2, b
	jr z, .asm_238e
	ld de, SouthMapConnection
	call GetMapConnection
.asm_238e

	bit 1, b
	jr z, .asm_2398
	ld de, WestMapConnection
	call GetMapConnection
.asm_2398

	bit 0, b
	jr z, .asm_23a2
	ld de, EastMapConnection
	call GetMapConnection
.asm_23a2

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


Function23ac:: ; 23ac
	ld a, [hli]
	ld c, a
	ld [wdc07], a
	ld a, l
	ld [wdc07 + 1], a
	ld a, h
	ld [wdc09], a
	ld a, c
	and a
	ret z
	ld bc, $0004
	call AddNTimes
	ret
; 23c3

Function23c3:: ; 23c3
	ld a, [hli]
	ld c, a
	ld [wdc0a], a
	ld a, l
	ld [wdc0b], a
	ld a, h
	ld [wdc0b + 1], a
	ld a, c
	and a
	ret z
	ld bc, $0003
	call AddNTimes
	ret
; 23da

Function23da:: ; 23da
	ld a, [hli]
	ld c, a
	ld [wdbfb], a
	ld a, l
	ld [wdbfc], a
	ld a, h
	ld [wdbfd], a
	ld a, c
	and a
	ret z
	ld bc, $0005
	call AddNTimes
	ret
; 23f1

Function23f1:: ; 23f1
	ld a, [hli]
	ld c, a
	ld [wdbfe], a
	ld a, l
	ld [wdbff], a
	ld a, h
	ld [wdc00], a
	ld a, c
	and a
	ret z
	ld bc, $0008
	call AddNTimes
	ret
; 2408

Function2408:: ; 2408
	ld a, [hli]
	ld c, a
	ld [wdc01], a
	ld a, l
	ld [wdc02], a
	ld a, h
	ld [wdc03], a
	ld a, c
	and a
	ret z
	ld bc, $0005
	call AddNTimes
	ret
; 241f

Function241f:: ; 241f
	push hl
	call Function2471
	pop de
	ld hl, MapObjects + OBJECT_LENGTH
	ld a, [de]
	inc de
	ld [wdc04], a
	ld a, e
	ld [wdc05], a
	ld a, d
	ld [wdc06], a
	ld a, [wdc04]
	call Function2457
	ld a, [wdc04]
	ld c, a
	ld a, $10
	sub c
	jr z, .asm_2454
	ld bc, $0001
	add hl, bc
	ld bc, $0010
.asm_244a
	ld [hl], $0
	inc hl
	ld [hl], $ff
	dec hl
	add hl, bc
	dec a
	jr nz, .asm_244a

.asm_2454
	ld h, d
	ld l, e
	ret
; 2457

Function2457:: ; 2457
	and a
	ret z
	ld c, a
.asm_245a
	push bc
	push hl
	ld a, $ff
	ld [hli], a
	ld b, $d
.asm_2461
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_2461
	pop hl
	ld bc, $0010
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_245a
	ret
; 2471

Function2471:: ; 2471
	ld hl, ObjectStruct1
	ld bc, 40 * 12
	xor a
	call ByteFill
	ld hl, ObjectStruct1
	ld de, 40
	ld c, $c
	xor a
.asm_2484
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_2484
	ret
; 248a

Function248a:: ; 248a
	call GetMapScriptHeaderBank
	rst Bankswitch

	ld hl, MapEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	ld a, [WarpNumber]
	dec a
	ld c, a
	ld b, $0
	ld a, $5
	call AddNTimes
	ld a, [hli]
	ld [YCoord], a
	ld a, [hli]
	ld [XCoord], a
	ld a, [hli]
	cp $ff
	jr nz, .asm_24b3
	call Function24ba

.asm_24b3
	callba Function10486d
	ret
; 24ba

Function24ba:: ; 24ba
	ld a, [wd149]
	ld [wdcac], a
	ld a, [wd14a]
	ld [BackupMapGroup], a
	ld a, [wd14b]
	ld [BackupMapNumber], a
	ret
; 24cd

Function24cd:: ; 24cd
	ld hl, OverworldMap
	ld bc, OverworldMapEnd - OverworldMap
	ld a, 0
	call ByteFill
	call ChangeMap
	call FillMapConnections
	ld a, $1
	call Function263b
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
.asm_250c
	push hl
	ld a, [hConnectedMapWidth]
	ld c, a
.asm_2510
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_2510
	pop hl
	ld a, [hConnectionStripLength]
	add l
	ld l, a
	jr nc, .asm_251e
	inc h
.asm_251e
	dec b
	jr nz, .asm_250c

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

.South
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

.West
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

.East
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

.Done
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
	jr nc, .asm_25f2
	inc d
.asm_25f2
	dec c
	jr nz, .y
	ret
; 25f6


FillWestConnectionStrip::
FillEastConnectionStrip:: ; 25f6

.asm_25f6
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
	jr nc, .asm_2617
	inc d
.asm_2617
	dec b
	jr nz, .asm_25f6
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

	ld a, $ff
	ld [ScriptRunning], a

	scf
	ret
; 2631

Function2631:: ; 2631
	ld a, [ScriptRunning]
	and a
	ret nz
	call GetMapScriptHeaderBank
	jr CallScript
; 263b

Function263b:: ; 263b
	ld b, a
	ld a, [hROMBank]
	push af
	call Function2c52
	call Function2653
	jr nc, .done

	call GetMapScriptHeaderBank
	ld b, a
	ld d, h
	ld e, l
	call Function2674

.done
	pop af
	rst Bankswitch
	ret
; 2653

Function2653:: ; 2653
	ld a, [wdc0a]
	ld c, a
	and a
	ret z
	ld hl, wdc0b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld de, $0003
.asm_2664
	ld a, [hl]
	cp b
	jr z, .asm_266e
	add hl, de
	dec c
	jr nz, .asm_2664
	xor a
	ret

.asm_266e
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret
; 2674

Function2674:: ; 2674
	callba Function974f3
	ld a, [ScriptMode]
	push af
	ld hl, ScriptFlags
	ld a, [hl]
	push af
	set 1, [hl]
	callba EnableScriptMode
	callba ScriptEvents
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
	call Function2e31
	ld a, 1
	ld [hOAMUpdate], a
	call Function321c
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
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, c
	call Function19e9

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
	TX_FAR _ObjectEventText
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


Function2707:: ; 2707
	ld a, [hConnectionStripLength]
	ld e, a
	ld d, $0
	ld hl, wd81e
	add hl, de
	ld a, [hl]
	ret
; 2712

Function2712:: ; 2712
	ld a, [hConnectionStripLength]
	ld e, a
	ld d, $0
	ld hl, wd81e
	add hl, de
	ld [hl], $ff
	ret
; 271e

Function271e:: ; 271e
	ld a, [hConnectionStripLength]
	ld e, a
	ld d, $0
	ld hl, wd81e
	add hl, de
	ld [hl], $0
	ret
; 272a


Function272a:: ; 272a
	ld hl, TileMap
	ld de, BGMapBuffer
	call Function27b7
	ld c, $28
	call Functiondbd
	ld a, [wd152]
	ld e, a
	ld a, [wd153]
	ld d, a
	call Function27d3
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2748

Function2748:: ; 2748
	hlcoord 0, 16
	ld de, BGMapBuffer
	call Function27b7
	ld c, $28
	call Functiondbd
	ld a, [wd152]
	ld l, a
	ld a, [wd153]
	ld h, a
	ld bc, $0200
	add hl, bc
	ld a, h
	and $3
	or $98
	ld e, l
	ld d, a
	call Function27d3
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2771

Function2771:: ; 2771
	ld hl, TileMap
	ld de, BGMapBuffer
	call Function27c0
	ld c, $24
	call Functiondbd
	ld a, [wd152]
	ld e, a
	ld a, [wd153]
	ld d, a
	call Function27f8
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 278f

Function278f:: ; 278f
	hlcoord 18, 0
	ld de, BGMapBuffer
	call Function27c0
	ld c, $24
	call Functiondbd
	ld a, [wd152]
	ld e, a
	and $e0
	ld b, a
	ld a, e
	add $12
	and $1f
	or b
	ld e, a
	ld a, [wd153]
	ld d, a
	call Function27f8
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 27b7

Function27b7:: ; 27b7
	ld c, $28
.asm_27b9
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_27b9
	ret
; 27c0

Function27c0:: ; 27c0
	ld c, $12
.asm_27c2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $13
	add l
	ld l, a
	jr nc, .asm_27cf
	inc h

.asm_27cf
	dec c
	jr nz, .asm_27c2
	ret
; 27d3

Function27d3:: ; 27d3
	ld hl, BGMapBufferPtrs
	push de
	call .asm_27df
	pop de
	ld a, $20
	add e
	ld e, a

.asm_27df
	ld c, $a
.asm_27e1
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
	jr nz, .asm_27e1
	ld a, $14
	ld [$ffdc], a
	ret
; 27f8

Function27f8:: ; 27f8
	ld hl, BGMapBufferPtrs
	ld c, $12
.asm_27fd
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .asm_280e
	inc d
	ld a, d
	and $3
	or $98
	ld d, a

.asm_280e
	dec c
	jr nz, .asm_27fd
	ld a, $12
	ld [$ffdc], a
	ret
; 2816

Function2816:: ; 2816
	ld hl, BGMapBuffer
	ld bc, $0078
	xor a
	call ByteFill
	ret
; 2821

Function2821:: ; 2821
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
	ld de, w6_d000
	call FarDecompress
	ld hl, w6_d000
	ld de, VTiles2
	ld bc, $0600
	call CopyBytes
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d600
	ld de, VTiles2
	ld bc, $0600
	call CopyBytes
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	ld a, [wd199]
	cp $1
	jr z, .asm_286f
	cp $2
	jr z, .asm_286f
	cp $4
	jr z, .asm_286f
	jr .asm_2875

.asm_286f
	callba LoadMapGroupRoof

.asm_2875
	xor a
	ld [hTileAnimFrame], a
	ret
; 2879

BufferScreen:: ; 2879
	ld hl, wd194
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, XCoord + 1
	ld c, $5
	ld b, $6
.asm_2886
	push bc
	push hl
.asm_2888
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2888
	pop hl
	ld a, [MapWidth]
	add $6
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_2886
	ret
; 289d

Function289d:: ; 289d
	ld hl, wd194
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, XCoord + 1
	ld a, [MapWidth]
	add $6
	ld [hConnectionStripLength], a
	ld a, [wd151]
	and a
	jr z, .asm_28cb
	cp $1
	jr z, .asm_28c0
	cp $2
	jr z, .asm_28d4
	cp $3
	jr z, .asm_28da
	ret

.asm_28c0
	ld de, wdcbf
	ld a, [hConnectionStripLength]
	ld c, a
	ld b, $0
	add hl, bc
	jr .asm_28ce

.asm_28cb
	ld de, XCoord + 1

.asm_28ce
	ld b, $6
	ld c, $4
	jr Function28f7

.asm_28d4
	ld de, XCoord + 2
	inc hl
	jr .asm_28dd

.asm_28da
	ld de, XCoord + 1

.asm_28dd
	ld b, $5
	ld c, $5
	jr Function28f7


Function28e3:: ; 28e3
	ld hl, wd194
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MapWidth]
	add $6
	ld [hConnectionStripLength], a
	ld de, XCoord + 1
	ld b, $6
	ld c, $5

Function28f7:: ; 28f7
.asm_28f7
	push bc
	push hl
	push de
.asm_28fa
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_28fa
	pop de
	ld a, e
	add $6
	ld e, a
	jr nc, .asm_2908
	inc d

.asm_2908
	pop hl
	ld a, [hConnectionStripLength]
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_28f7
	ret
; 2914

Function2914:: ; 2914
	xor a
	ld [TilePermissions], a
	call Function296c
	call Function294d
	ld a, [MapX]
	ld d, a
	ld a, [MapY]
	ld e, a
	call Function2a3c
	ld [StandingTile], a
	call Function29ff
	ret nz
	ld a, [StandingTile]
	and 7
	ld hl, .data_2945
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

.data_2945 ; 2945
	db 1, 2, 4, 8, 9, 10, 5, 6
; 294d

Function294d:: ; 294d
	ld a, [MapX]
	ld d, a
	ld a, [MapY]
	ld e, a
	push de
	inc e
	call Function2a3c
	ld [TileDown], a
	call Function298b
	pop de
	dec e
	call Function2a3c
	ld [TileUp], a
	call Function29a8
	ret
; 296c

Function296c:: ; 296c
	ld a, [MapX]
	ld d, a
	ld a, [MapY]
	ld e, a
	push de
	dec d
	call Function2a3c
	ld [TileLeft], a
	call Function29e2
	pop de
	inc d
	call Function2a3c
	ld [TileRight], a
	call Function29c5
	ret
; 298b

Function298b:: ; 298b
	call Function29ff
	ret nz
	ld a, [TileDown]
	and $7
	cp $2
	jr z, .asm_299f
	cp $6
	jr z, .asm_299f
	cp $7
	ret nz

.asm_299f
	ld a, [TilePermissions]
	or $8
	ld [TilePermissions], a
	ret
; 29a8

Function29a8:: ; 29a8
	call Function29ff
	ret nz
	ld a, [TileUp]
	and $7
	cp $3
	jr z, .asm_29bc
	cp $4
	jr z, .asm_29bc
	cp $5
	ret nz

.asm_29bc
	ld a, [TilePermissions]
	or $4
	ld [TilePermissions], a
	ret
; 29c5

Function29c5:: ; 29c5
	call Function29ff
	ret nz
	ld a, [TileRight]
	and $7
	cp $1
	jr z, .asm_29d9
	cp $5
	jr z, .asm_29d9
	cp $7
	ret nz

.asm_29d9
	ld a, [TilePermissions]
	or $1
	ld [TilePermissions], a
	ret
; 29e2

Function29e2:: ; 29e2
	call Function29ff
	ret nz
	ld a, [TileLeft]
	and $7
	cp $0
	jr z, .asm_29f6
	cp $4
	jr z, .asm_29f6
	cp $6
	ret nz

.asm_29f6
	ld a, [TilePermissions]
	or $2
	ld [TilePermissions], a
	ret
; 29ff

Function29ff:: ; 29ff
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

	ld a, [MapX]
	add d
	ld d, a
	ld a, [MapY]
	add e
	ld e, a
	ld a, [hl]
	ret

.Directions
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


Function2a3c:: ; 2a3c
	call GetBlockLocation
	ld a, [hl]
	and a
	jr z, .asm_2a63
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
	jr nc, .asm_2a56
	inc hl

.asm_2a56
	rr e
	jr nc, .asm_2a5c
	inc hl
	inc hl

.asm_2a5c
	ld a, [TilesetCollisionBank]
	call GetFarByte
	ret

.asm_2a63
	ld a, $ff
	ret
; 2a66

GetBlockLocation:: ; 2a66
	ld a, [MapWidth]
	add $6
	ld c, a
	ld b, $0
	ld hl, wc801
	add hl, bc
	ld a, e
	srl a
	jr z, .asm_2a84
	and a
.asm_2a78
	srl a
	jr nc, .asm_2a7d
	add hl, bc

.asm_2a7d
	sla c
	rl b
	and a
	jr nz, .asm_2a78

.asm_2a84
	ld c, d
	srl c
	ld b, $0
	add hl, bc
	ret
; 2a8b


CheckFacingSign:: ; 2a8b
	call GetFacingTileCoord
	ld b, a
	ld a, d
	sub 4
	ld d, a
	ld a, e
	sub 4
	ld e, a
	ld a, [wdc01]
	and a
	ret z
	ld c, a
	ld a, [hROMBank]
	push af
	call Function2c52
	call Function2aaa
	pop hl
	ld a, h
	rst Bankswitch
	ret
; 2aaa

Function2aaa:: ; 2aaa
	ld hl, wdc02
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_2ab0
	push hl
	ld a, [hli]
	cp e
	jr nz, .asm_2abb
	ld a, [hli]
	cp d
	jr nz, .asm_2abb
	jr .asm_2ac8

.asm_2abb
	pop hl
	ld a, 5
	add l
	ld l, a
	jr nc, .asm_2ac3
	inc h

.asm_2ac3
	dec c
	jr nz, .asm_2ab0
	xor a
	ret

.asm_2ac8
	pop hl
	ld de, EngineBuffer1
	ld bc, 5
	call CopyBytes
	scf
	ret
; 2ad4

Function2ad4:: ; 2ad4
	ld a, [wdbfe]
	and a
	ret z
	ld c, a
	ld a, [hROMBank]
	push af
	call Function2c52
	call Function2ae7
	pop hl
	ld a, h
	rst Bankswitch
	ret
; 2ae7

Function2ae7:: ; 2ae7
	ld hl, wdbff
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CheckTriggers
	ld b, a
	ld a, [MapX]
	sub $4
	ld d, a
	ld a, [MapY]
	sub $4
	ld e, a
.asm_2afd
	push hl
	ld a, [hli]
	cp b
	jr z, .asm_2b06
	cp $ff
	jr nz, .asm_2b10

.asm_2b06
	ld a, [hli]
	cp e
	jr nz, .asm_2b10
	ld a, [hli]
	cp d
	jr nz, .asm_2b10
	jr .asm_2b1d

.asm_2b10
	pop hl
	ld a, $8
	add l
	ld l, a
	jr nc, .asm_2b18
	inc h

.asm_2b18
	dec c
	jr nz, .asm_2afd
	xor a
	ret

.asm_2b1d
	pop hl
	ld de, EngineBuffer1
	ld bc, $0008
	call CopyBytes
	scf
	ret
; 2b29


FadeToMenu:: ; 2b29
	xor a
	ld [hBGMapMode], a
	call Function1d6e
	callba Function8c084
	call ClearSprites
	call Function2ed3
	ret
; 2b3c


Function2b3c:: ; 2b3c
	call WhiteBGMap
	call Function2bae
	call DrawOnMap
	call Function1d7d
	call Functiond90
	jr Function2b5c
; 2b4d

Function2b4d:: ; 2b4d
	call WhiteBGMap
	call Function1d7d
	call Function2bae
	call DrawOnMap
	call Functiond90
; 2b5c

Function2b5c:: ; 2b5c
	ld b, $9
	call GetSGBLayout
	callba Function49409
	call Function3200
	callba Function8c079
	call Function2ee4
	ret
; 2b74


Function2b74:: ; 0x2b74
	push af
	ld a, $1
	ld [wc2ce], a
	call WhiteBGMap
	call ClearSprites
	call Function2bae
	hlcoord 0, 12
	ld bc, $0412
	call TextBox
	ld hl, VramState
	set 0, [hl]
	call DrawOnMap
	call Function3200
	ld b, $9
	call GetSGBLayout
	callba Function49409
	call UpdateTimePals
	call DelayFrame
	ld a, $1
	ld [$ffde], a
	pop af
	ret
; 0x2bae

Function2bae:: ; 2bae
	call DisableLCD
	call ClearSprites
	callba Function14168
	call Functione51
	call Functione5f
	ld a, [hROMBank]
	push af
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call SwitchToAnyMapBank
	callba Function8c001
	call Function2173
	call Function2821
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
; 2bed

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
; de = offset of desired data within the mapheader

; outputs:
; bc = data from the current map's header
; (e.g., de = $0003 would return a pointer to the secondary map header)

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	; fallthrough

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
; 2c24

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
; 2c31

GetAnyMapBank:: ; 2c31
	push hl
	push de
	ld de, $0000
	call GetAnyMapHeaderMember
	ld a, c
	pop de
	pop hl
	ret
; 2c3d

Function2c3d:: ; 2c3d
	ld a, [hROMBank]
	push af
	ld a, BANK(MapGroupPointers)
	rst Bankswitch
	call GetMapHeaderPointer
	ld de, wd197 + 1
	ld bc, $0005
	call CopyBytes
	pop af
	rst Bankswitch
	ret
; 2c52

Function2c52:: ; 2c52
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
	ld de, 3 ; second map header pointer
	call GetAnyMapHeaderMember
	ld l, c
	ld h, b
	pop bc

	push hl
	ld de, 0 ; second map header bank
	call GetAnyMapHeaderMember
	pop hl

	ld de, 3 ; blockdata bank
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
	ld de, $0003 ; secondary map header pointer (offset within header)
	call GetMapHeaderMember
	ld l, c
	ld h, b
	pop de
	pop bc
	ret
; 2c8a

GetMapPermission:: ; 2c8a
	push hl
	push de
	push bc
	ld de, 2
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 2c98

Function2c98:: ; 2c98
	ret
; 2c99

GetAnyMapPermission:: ; 2c99
	push hl
	push de
	push bc
	ld de, $0002
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 2ca7

GetAnyMapTileset:: ; 2ca7
	ld de, $0001
	call GetAnyMapHeaderMember
	ld a, c
	ret
; 2caf

GetWorldMapLocation:: ; 0x2caf
; given a map group/id in bc, return its location on the Pokégear map.
	push hl
	push de
	push bc
	ld de, 5
	call GetAnyMapHeaderMember
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 0x2cbd

GetMapHeaderMusic:: ; 2cbd
RADIO_TOWER_MUSIC EQU 7

	push hl
	push bc
	ld de, 6 ; music
	call GetMapHeaderMember
	ld a, c
	cp MUSIC_MAHOGANY_MART
	jr z, .mahoganymart
	bit RADIO_TOWER_MUSIC, c
	jr nz, .radiotower
	callba Function8b342
	ld e, c
	ld d, 0
.done
	pop bc
	pop hl
	ret

.radiotower
	ld a, [StatusFlags2]
	bit 0, a
	jr z, .clearedradiotower
	ld de, MUSIC_ROCKET_OVERTURE
	jr .done

.clearedradiotower
	; the rest of the byte
	ld a, c
	and 1 << RADIO_TOWER_MUSIC - 1
	ld e, a
	ld d, 0
	jr .done

.mahoganymart
	ld a, [StatusFlags2]
	bit 7, a
	jr z, .clearedmahogany
	ld de, MUSIC_ROCKET_HIDEOUT
	jr .done

.clearedmahogany
	ld de, MUSIC_CHERRYGROVE_CITY
	jr .done
; 2cff

Function2cff:: ; 2cff
	call Function2d0d
	and $f
	ret
; 2d05

Function2d05:: ; 2d05
	call Function2d0d
	and $f0
	swap a
	ret
; 2d0d

Function2d0d:: ; 2d0d
	push hl
	push bc
	ld de, $0007
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop hl
	ret
; 2d19

Function2d19:: ; 2d19
	push de
	push hl
	push bc
	ld de, $0008
	call GetMapHeaderMember
	ld a, c
	pop bc
	pop hl
	pop de
	ret
; 2d27

LoadTilesetHeader:: ; 2d27
	push hl
	push bc

	ld hl, Tilesets
	ld bc, Tileset01 - Tileset00
	ld a, [wd199]
	call AddNTimes

	ld de, TilesetBank
	ld bc, Tileset01 - Tileset00

	ld a, BANK(Tilesets)
	call FarCopyBytes

	pop bc
	pop hl
	ret
; 2d43
