PokeGear: ; 90b8d (24:4b8d)
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [VramState]
	push af
	xor a
	ld [VramState], a

	call Function90bea
	call DelayFrame

.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call Function90f04
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [Options], a
	call ClearBGPalettes
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, $90
	ld [hWY], a
	call Function91492
	ret

Function90bea: ; 90bea (24:4bea)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	call Function90c4e
	callba Function8cf53
	call Function90d32
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call Function90d70
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wc6d2], a
	ld [wc6d1], a
	ld [wc6d3], a
	ld [wc6d9], a
	ld [wc6da], a
	ld [wc6db], a
	call Function90d9e
	call Function90da8
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	ret z
	ld a, $e4
	call Functioncf8
	ret

Function90c4e: ; 90c4e
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, VTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress

	ld hl, PokegearGFX
	ld de, VTiles2 + $30 tiles
	ld a, BANK(PokegearGFX)
	call FarDecompress

	ld hl, PokegearSpritesGFX
	ld de, VTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .ssaqua

	callba GetPlayerIcon

	push de
	ld h, d
	ld l, e
	ld a, b

	push af
	ld de, VTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af

	pop hl

	ld de, $c0
	add hl, de
	ld de, VTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
	ret

.ssaqua
	ld hl, FastShipGFX
	ld de, VTiles0 tile $10
	ld bc, 8 tiles
	call CopyBytes
	ret
; 90cb2

FastShipGFX: ; 90cb2
INCBIN "gfx/misc/fast_ship.2bpp"
; 90d32

Function90d32: ; 90d32 (24:4d32)
	depixel 4, 2, 4, 0
	ld a, SPRITE_ANIM_INDEX_0D
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

Function90d41: ; 90d41 (24:4d41)
	ld hl, wcf64
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_90d52
	add hl, de
	ld a, [hl]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret
; 90d52 (24:4d52)

Unknown_90d52: ; 90d52
	db $00, $10, $20, $30
; 90d56

Function90d56: ; 90d56
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	ret
; 90d70


Function90d70: ; 90d70 (24:4d70)
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp FAST_SHIP
	jr z, .asm_90d95

	cp SPECIAL_MAP
	jr nz, .asm_90d8e

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.asm_90d8e
	ld [wc6d8], a
	ld [wc6d7], a
	ret

.asm_90d95
	ld [wc6d8], a
	ld a, NEW_BARK_TOWN
	ld [wc6d7], a
	ret

Function90d9e: ; 90d9e (24:4d9e)
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wcf64], a
	ret

Function90da8: ; 90da8 (24:4da8)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, TileMapEnd - TileMap
	ld a, $4f
	call ByteFill
	ld a, [wcf64]
	and $3
	add a
	ld e, a
	ld d, 0
	ld hl, Jumptable_90e12
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_90dcb
	push de
	jp [hl]

.asm_90dcb
	call Function90eb0
	callba TownMapPals
	ld a, [wcf65]
	and a
	jr nz, .asm_90de8

	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call Function90e00
	ld a, $90
	jr .asm_90df3

.asm_90de8
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call Function90e00
	xor a

.asm_90df3
	ld [hWY], a
	ld a, [wcf65]
	and 1
	xor 1
	ld [wcf65], a
	ret

Function90e00: ; 90e00 (24:4e00)
	ld a, [hCGB]
	and a
	jr z, .asm_90e0e
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
.asm_90e0e
	call WaitBGMap
	ret
; 90e12 (24:4e12)

Jumptable_90e12: ; 90e12
	dw Function90e1a
	dw Function90e3f
	dw Function90e82
	dw Function90e72
; 90e1a

Function90e1a: ; 90e1a
	ld de, ClockTilemapRLE
	call Function914bb
	hlcoord 12, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call Function90f86
	ret
; 90e36 (24:4e36)

.switch
	db " SWITCH▶@"
; 90e3f

Function90e3f: ; 90e3f

	ld a, [wc6d8]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld e, 0
	jr .ok
.kanto
	ld e, 1
.ok
	callba PokegearMap
	ld a, $7
	ld bc, $12
	hlcoord 1, 2
	call ByteFill
	hlcoord 0, 2
	ld [hl], $6
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wc6d7]
	call Function910b4
	ret
; 90e72

Function90e72: ; 90e72
	ld de, RadioTilemapRLE
	call Function914bb
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret
; 90e82

Function90e82: ; 90e82
	ld de, PhoneTilemapRLE
	call Function914bb
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call Function90e98
	call Function912d8
	ret
; 90e98

Function90e98: ; 90e98 (24:4e98)
	hlcoord 17, 1
	ld a, $3c
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapHeaderPhoneServiceNybble
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $3f
	ret

Function90eb0: ; 90eb0 (24:4eb0)
	hlcoord 0, 0
	ld bc, $8
	ld a, $4f
	call ByteFill
	hlcoord 0, 1
	ld bc, $8
	ld a, $4f
	call ByteFill
	ld de, wPokegearFlags
	ld a, [de]
	bit 0, a
	call nz, Function90ee4
	ld a, [de]
	bit 2, a
	call nz, Function90eeb
	ld a, [de]
	bit 1, a
	call nz, Function90ef2
	hlcoord 0, 0
	ld a, $46
	call Function90ef7
	ret

Function90ee4: ; 90ee4 (24:4ee4)
	hlcoord 2, 0
	ld a, $40
	jr Function90ef7

Function90eeb: ; 90eeb (24:4eeb)
	hlcoord 4, 0
	ld a, $44
	jr Function90ef7

Function90ef2: ; 90ef2 (24:4ef2)
	hlcoord 6, 0
	ld a, $42

Function90ef7: ; 90ef7 (24:4ef7)
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	add $f
	ld [hli], a
	inc a
	ld [hld], a
	ret

Function90f04: ; 90f04 (24:4f04)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_90f13
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_90f13: ; 90f13 (24:4f13)
	dw Function90f2d
	dw Function90f3e
	dw Function90fb4
	dw Function90fcd
	dw Function90fee
	dw Function90fcd
	dw Function90fe9
	dw Function91156
	dw Function91171
	dw Function911eb
	dw Function91256
	dw Function910f9
	dw Function91112


Function90f2d: ; 90f2d (24:4f2d)
	call Function90da8
	ld hl, UnknownText_0x914d3
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	call Function91492
	ret

Function90f3e: ; 90f3e (24:4f3e)
	call Function90f7b
	ld hl, hJoyLast

	ld a, [hl]
	and A_BUTTON + B_BUTTON + START + SELECT
	jr nz, .asm_90f75

	ld a, [hl]
	and D_RIGHT
	ret z

	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .asm_90f5a
	ld c, $2
	ld b, $1
	jr .asm_90f71
.asm_90f5a

	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .asm_90f67
	ld c, $7
	ld b, $2
	jr .asm_90f71
.asm_90f67

	ld a, [wPokegearFlags]
	bit 1, a
	ret z

	ld c, $b
	ld b, $3

.asm_90f71
	call Function91480
	ret

.asm_90f75
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function90f7b: ; 90f7b (24:4f7b)
	xor a
	ld [hBGMapMode], a
	call Function90f86
	ld a, $1
	ld [hBGMapMode], a
	ret

Function90f86: ; 90f86 (24:4f86)
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 6, 8
	callba PrintHoursMins
	ld hl, UnknownText_0x90faf
	bccoord 6, 6
	call PlaceWholeStringInBoxAtOnce
	ret
; 90fa8 (24:4fa8)

String_90fa8: db "ごぜん@"
String_90fac: db "ごご@"

UnknownText_0x90faf: ; 0x90faf
	text_jump UnknownText_0x1c5821
	db "@"
; 0x90fb4

Function90fb4: ; 90fb4 (24:4fb4)
	ld a, [wc6d8]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, 3
	jr .done

	ret

.kanto
	ld a, 5
.done
	ld [wJumptableIndex], a
	call Function91492
	ret

Function90fcd: ; 90fcd (24:4fcd)
	call Function90da8
	ld a, [wc6d8]
	call Function9106a
	ld a, [wc6d7]
	call Function91098
	ld a, c
	ld [wc6d5], a
	ld a, b
	ld [wc6d6], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function90fe9: ; 90fe9 (24:4fe9)
	call Function910e8
	jr Function90ff2

Function90fee: ; 90fee (24:4fee)
	ld d, $2e
	ld e, $1
Function90ff2: ; 90ff2 (24:4ff2)
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	call Function9102f
	ret

.right
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .asm_91015
	ld c, $7
	ld b, $2
	jr .done

.asm_91015
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	ld c, $b
	ld b, $3
	jr .done

.left
	ld c, $0
	ld b, $0
.done
	call Function91480
	ret
.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function9102f: ; 9102f (24:502f)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret
.up
	ld hl, wc6d7
	ld a, [hl]
	cp d
	jr c, .asm_91047
	ld a, e
	dec a
	ld [hl], a
.asm_91047
	inc [hl]
	jr .done

.down
	ld hl, wc6d7
	ld a, [hl]
	cp e
	jr nz, .asm_91054
	ld a, d
	inc a
	ld [hl], a
.asm_91054
	dec [hl]

.done
	ld a, [wc6d7]
	call Function910b4
	ld a, [wc6d5]
	ld c, a
	ld a, [wc6d6]
	ld b, a
	ld a, [wc6d7]
	call Function910d4
	ret

Function9106a: ; 9106a
	push af
	ld de, 0
	ld b, SPRITE_ANIM_INDEX_0A
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91079
	ld b, SPRITE_ANIM_INDEX_1E

.asm_91079
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	callba GetLandmarkCoords
	pop bc
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret
; 91098

Function91098: ; 91098
	push af
	ld de, 0
	ld a, SPRITE_ANIM_INDEX_0D
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $4
	ld hl, $2
	add hl, bc
	ld [hl], $0
	pop af
	push bc
	call Function910d4
	pop bc
	ret
; 910b4

Function910b4: ; 910b4
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	callba GetLandmarkName
	pop de
	callba Function1de2c5
	hlcoord 8, 0
	ld [hl], $34
	ret
; 910d4

Function910d4: ; 910d4
	push bc
	ld e, a
	callba GetLandmarkCoords
	pop bc
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret
; 910e8

Function910e8: ; 910e8
	ld a, [StatusFlags]
	bit 6, a
	jr z, .asm_910f4
	ld d, $5e
	ld e, $2f
	ret

.asm_910f4
	ld d, $5e
	ld e, $58
	ret
; 910f9


Function910f9: ; 910f9 (24:50f9)
	call Function90da8
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_14
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $8
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function91112: ; 91112 (24:5112)
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [wc6da]
	ld l, a
	ld a, [wc6db]
	ld h, a
	ld a, [wc6d9]
	and a
	ret z
	rst FarCall
	ret

.left
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .asm_9113b
	ld c, $7
	ld b, $2
	jr .asm_9114c

.asm_9113b
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .asm_91148
	ld c, $2
	ld b, $1
	jr .asm_9114c

.asm_91148
	ld c, $0
	ld b, $0
.asm_9114c
	call Function91480
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function91156: ; 91156 (24:5156)
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wc6d2], a
	ld [wc6d1], a
	ld [wc6d3], a
	call Function90da8
	call Function91492
	ld hl, UnknownText_0x914ce
	call PrintText
	ret

Function91171: ; 91171 (24:5171)
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	call Function9126d
	ret

.left
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .asm_9119c
	ld c, $2
	ld b, $1
	jr .asm_911ac
.asm_9119c
	ld c, $0
	ld b, $0
	jr .asm_911ac

.right
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	ld c, $b
	ld b, $3
.asm_911ac
	call Function91480
	ret

.b
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.a
	ld hl, wPhoneList
	ld a, [wc6d2]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc6d1]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	ret z

	ld [wc6d3], a
	hlcoord 1, 4
	ld a, [wc6d1]
	ld bc, 20 * 2
	call AddNTimes
	ld [hl], "▷"
	call Function91342
	jr c, .asm_911e5

	ld hl, wJumptableIndex
	inc [hl]
	ret

.asm_911e5
	ld a, $8
	ld [wJumptableIndex], a
	ret

Function911eb: ; 911eb (24:51eb)
	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .asm_91234
	ld hl, Options
	res NO_TEXT_SCROLL, [hl]
	xor a
	ld [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, UnknownText_0x9124c
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, UnknownText_0x9124c
	call PrintText
	call WaitSFX
	ld a, [wc6d3]
	ld b, a
	call Function90199
	ld c, 10
	call DelayFrames
	ld hl, Options
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ld [hInMenu], a
	call Function912b7
	ld hl, wJumptableIndex
	inc [hl]
	ret
.asm_91234
	callba Phone_NoSignal
	ld hl, OutOfServiceAreaText
	call PrintText
	ld a, $8
	ld [wJumptableIndex], a
	ld hl, UnknownText_0x914ce
	call PrintText
	ret
; 9124c (24:524c)

UnknownText_0x9124c: ; 0x9124c
	;
	text_jump UnknownText_0x1c5824
	db "@"
; 0x91251

OutOfServiceAreaText: ; 0x91251
	; You're out of the service area.
	text_jump UnknownText_0x1c5827
	db "@"
; 0x91256

Function91256: ; 91256 (24:5256)
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	callba HangUp
	ld a, $8
	ld [wJumptableIndex], a
	ld hl, UnknownText_0x914ce
	call PrintText
	ret

Function9126d: ; 9126d (24:526d)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wc6d1
	ld a, [hl]
	and a
	jr z, .asm_91285
	dec [hl]
	jr .asm_912a3

.asm_91285
	ld hl, wc6d2
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .asm_912ad

.down
	ld hl, wc6d1
	ld a, [hl]
	cp $3
	jr nc, .asm_91299
	inc [hl]
	jr .asm_912a3

.asm_91299
	ld hl, wc6d2
	ld a, [hl]
	cp $6
	ret nc
	inc [hl]
	jr .asm_912ad

.asm_912a3
	xor a
	ld [hBGMapMode], a
	call Function912b7
	call WaitBGMap
	ret

.asm_912ad
	xor a
	ld [hBGMapMode], a
	call Function912d8
	call WaitBGMap
	ret

Function912b7: ; 912b7 (24:52b7)
	ld a, " "
	hlcoord 1, 4
	ld [hl], a
	hlcoord 1, 6
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	hlcoord 1, 10
	ld [hl], a
	hlcoord 1, 4
	ld a, [wc6d1]
	ld bc, $28
	call AddNTimes
	ld [hl], "▶"
	ret

Function912d8: ; 912d8 (24:52d8)
	hlcoord 1, 3
	ld b, $9
	ld a, $7f
.asm_912df
	ld c, $12
.asm_912e1
	ld [hli], a
	dec c
	jr nz, .asm_912e1
rept 2
	inc hl
endr
	dec b
	jr nz, .asm_912df
	ld a, [wc6d2]
	ld e, a
	ld d, $0
	ld hl, wPhoneList
	add hl, de
	xor a
	ld [wc6d0], a
.asm_912f8
	ld a, [hli]
	push hl
	push af
	hlcoord 2, 4
	ld a, [wc6d0]
	ld bc, $28
	call AddNTimes
	ld d, h
	ld e, l
	pop af
	ld b, a
	call Function90380
	pop hl
	ld a, [wc6d0]
	inc a
	ld [wc6d0], a
	cp $4
	jr c, .asm_912f8
	call Function912b7
	ret
; 9131e (24:531e)

Function9131e: ; 9131e
	ld hl, wPhoneList
	ld a, [wc6d2]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc6d1]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	ld hl, wPhoneList
	ld c, $a
.asm_91336
	ld a, [hli]
	and a
	jr nz, .asm_9133e
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
.asm_9133e
	dec c
	jr nz, .asm_91336
	ret
; 91342

Function91342: ; 91342 (24:5342)
	ld hl, wPhoneList
	ld a, [wc6d2]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wc6d1]
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	callba Function9038a
	ld a, c
	and a
	jr z, .asm_91366

	ld hl, Jumptable_91455
	ld de, Unknown_9143f
	jr .asm_9136c

.asm_91366
	ld hl, Jumptable_9146a
	ld de, Unknown_9145b

.asm_9136c
	xor a
	ld [hBGMapMode], a
	push hl
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call TextBox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wc6d4], a
	call Function9141d
	call WaitBGMap

.asm_91398
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .asm_913b4
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_913c1
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_913d4
	call DelayFrame
	jr .asm_91398

.asm_913b4
	ld hl, wc6d4
	ld a, [hl]
	and a
	jr z, .asm_91398
	dec [hl]
	call Function9141d
	jr .asm_91398

.asm_913c1
	ld hl, 2
	add hl, de
	ld a, [wc6d4]
	inc a
	cp [hl]
	jr nc, .asm_91398
	ld [wc6d4], a
	call Function9141d
	jr .asm_91398

.asm_913d4
	xor a
	ld [hBGMapMode], a
	call Function912d8
	ld a, $1
	ld [hBGMapMode], a
	pop hl
	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, Function913f1

	ld a, [wc6d4]
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Function913f1: ; 913f1
	ld hl, UnknownText_0x914ce
	call PrintText
	scf
	ret
; 913f9 (24:53f9)

Function913f9: ; 913f9
	ld hl, UnknownText_0x914d8
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .asm_91419
	call Function9131e
	xor a
	ld [hBGMapMode], a
	call Function912d8
	ld hl, UnknownText_0x914ce
	call PrintText
	call WaitBGMap
.asm_91419
	scf
	ret
; 9141b

Function9141b: ; 9141b
	and a
	ret
; 9141d

Function9141d: ; 9141d (24:541d)
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, 20 * 2
.asm_9142c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_9142c
	pop hl
	ld a, [wc6d4]
	ld bc, 20 * 2
	call AddNTimes
	ld [hl], "▶"
	pop de
	ret
; 9143f (24:543f)

Unknown_9143f: ; 9143f
	dwcoord 10, 6
	db 3
	db   "CALL"
	next "DELETE"
	next "CANCEL"
	db   "@"
; 91455

Jumptable_91455: ; 91455
	dw Function9141b
	dw Function913f9
	dw Function913f1
; 9145b

Unknown_9145b: ; 9145b
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"
; 9146a

Jumptable_9146a: ; 9146a
	dw Function9141b
	dw Function913f1
; 9146e


Function9146e: ; 9146e
	ld a, [hHours]
	cp 12
	jr c, .asm_9147b
	sub 12
	ld [wd265], a
	scf
	ret

.asm_9147b
	ld [wd265], a
	and a
	ret
; 91480


Function91480: ; 91480 (24:5480)
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wcf64], a
	call DeleteSpriteAnimStruct2ToEnd
	ret

Function91492: ; 91492
	ld a, [wc6dc]
	cp $fe
	jr z, .asm_914a3
	cp $ff
	call z, EnterMapMusic
	xor a
	ld [wc6dc], a
	ret

.asm_914a3
	call RestartMapMusic
	xor a
	ld [wc6dc], a
	ret
; 914ab


DeleteSpriteAnimStruct2ToEnd: ; 914ab (24:54ab)
	ld hl, SpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - SpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Function914bb: ; 914bb (24:54bb)
	hlcoord 0, 0
.asm_914be
	ld a, [de]
	cp $ff
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.asm_914c8
	ld [hli], a
	dec c
	jr nz, .asm_914c8
	jr .asm_914be
; 914ce (24:54ce)

UnknownText_0x914ce: ; 0x914ce
	; Whom do you want to call?
	text_jump UnknownText_0x1c5847
	db "@"
; 0x914d3

UnknownText_0x914d3: ; 0x914d3
	; Press any button to exit.
	text_jump UnknownText_0x1c5862
	db "@"
; 0x914d8

UnknownText_0x914d8: ; 0x914d8
	; Delete this stored phone number?
	text_jump UnknownText_0x1c587d
	db "@"
; 0x914dd


PokegearSpritesGFX: ; 914dd
INCBIN "gfx/misc/pokegear_sprites.2bpp.lz"
; 9150d

RadioTilemapRLE: ; 9150d
INCBIN "gfx/unknown/09150d.tilemap.rle"

PhoneTilemapRLE: ; 9158a
INCBIN "gfx/unknown/09158a.tilemap.rle"

ClockTilemapRLE: ; 915db
INCBIN "gfx/unknown/0915db.tilemap.rle"
; 9163e
_UpdateRadioStation: ; 9163e (24:563e)
	jr UpdateRadioStation

Function91640: ; 91640 (24:5640)
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.TuningKnob: ; 9164e (24:564e)
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_UP
	jr nz, .up
	ret

.down
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
rept 2
	dec [hl]
endr
	jr .update

.up
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp 80
	ret nc
rept 2
	inc [hl]
endr

.update

UpdateRadioStation: ; 9166f (24:566f)
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, RadioChannels
.loop
	ld a, [hli]
	cp -1
	jr z, .nostation
	cp d
	jr z, .foundstation
rept 2
	inc hl
endr
	jr .loop

.nostation
	call NoRadioStation
	ret

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp [hl]
.returnafterstation
	ld a, [wc6d9]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret
; 916a1 (24:56a1)

Function916a1: ; 916a1
	ld [wc6d9], a
	ld a, [hli]
	ld [wc6da], a
	ld a, [hli]
	ld [wc6db], a
	ret
; 916ad


RadioChannels:
; frequencies and the shows that play on them.
; frequency value given here = 4 × ingame_frequency − 2
	dbw 16, .PkmnTalkAndPokedexShow
	dbw 28, .PokemonMusic
	dbw 32, .LuckyChannel
	dbw 40, .BuenasPassword
	dbw 52, .RuinsOfAlphRadio
	dbw 64, .PlacesAndPeople
	dbw 72, .LetsAllSing
	dbw 78, .PokeFluteRadio
	dbw 80, .EvolutionRadio
	db $ff

.PkmnTalkAndPokedexShow
; Pokédex Show in the morning
; Oak's Pokémon Talk in the afternoon and evening
	call .InJohto
	jr nc, .NoSignal
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.PokemonMusic
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_PokemonMusic

.LuckyChannel
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_LuckyChannel

.BuenasPassword
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_BuenasPassword

.RuinsOfAlphRadio
	ld a, [wc6d8]
	cp RUINS_OF_ALPH
	jr nz, .NoSignal
	jp LoadStation_UnownRadio

.PlacesAndPeople
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PlacesAndPeople

.LetsAllSing
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_LetsAllSing

.PokeFluteRadio
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PokeFluteRadio

.EvolutionRadio
; This station airs in the Lake of Rage area when Rocket are still in Mahogany.

	ld a, [StatusFlags]
	bit 4, a
	jr z, .NoSignal

	ld a, [wc6d8]
	cp MAHOGANY_TOWN
	jr z, .ok
	cp ROUTE_43
	jr z, .ok
	cp LAKE_OF_RAGE
	jr nz, .NoSignal
.ok
	jp LoadStation_EvolutionRadio

.NoSignal
	call NoRadioStation
	ret

.InJohto
; if in Johto or on the S.S. Aqua, set carry
; otherwise clear carry
	ld a, [wc6d8]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret
.johto
	scf
	ret



LoadStation_OaksPokemonTalk: ; 91753 (24:5753)
	xor a ; OAKS_POKEMON_TALK
	ld [wd002], a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPkmnTalkName
	ret

LoadStation_PokedexShow: ; 91766 (24:5766)
	ld a, POKEDEX_SHOW
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokedexShowName
	ret

LoadStation_PokemonMusic: ; 9177b (24:577b)
	ld a, POKEMON_MUSIC
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel: ; 91790 (24:5790)
	ld a, LUCKY_CHANNEL
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_BuenasPassword: ; 917a5 (24:57a5)
	ld a, BUENAS_PASSWORD
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, NotBuenasPasswordName
	ld a, [StatusFlags2]
	bit 0, a
	ret z
	ld de, BuenasPasswordName
	ret
; 917c3 (24:57c3)

BuenasPasswordName:    db "BUENA'S PASSWORD@"
NotBuenasPasswordName: db "@"

LoadStation_UnownRadio: ; 917d5 (24:57d5)
	ld a, UNOWN_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret

LoadStation_PlacesAndPeople: ; 917ea (24:57ea)
	ld a, PLACES_AND_PEOPLE
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing: ; 917ff (24:57ff)
	ld a, LETS_ALL_SING
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret
; 91814 (24:5814)

LoadStation_RocketRadio: ; 91814
	ld a, ROCKET_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret
; 91829

LoadStation_PokeFluteRadio: ; 91829 (24:5829)
	ld a, POKE_FLUTE_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

LoadStation_EvolutionRadio: ; 9183e (24:583e)
	ld a, EVOLUTION_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret
; 91853 (24:5853)

LoadStation_Dummy: ; 91853
	ret

RadioMusicRestartDE: ; 91854 (24:5854)
	push de
	ld a, e
	ld [wc6dc], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ret

RadioMusicRestartPokemonChannel: ; 91868 (24:5868)
	push de
	ld a, $fe
	ld [wc6dc], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams: ; 9187c (24:587c)
	ld [wc6d9], a
	ld a, l
	ld [wc6da], a
	ld a, h
	ld [wc6db], a
	ret

NoRadioStation: ; 91888 (24:5888)
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wc6d9], a
	ld [wc6da], a
	ld [wc6db], a
	ld a, $1
	ld [hBGMapMode], a
	ret

NoRadioMusic: ; 9189d (24:589d)
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, $ff
	ld [wc6dc], a
	ret

NoRadioName: ; 918a9 (24:58a9)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	ld bc, $412
	call TextBox
	ret
; 918bf

OaksPkmnTalkName:     db "OAK's <PK><MN> Talk@"
PokedexShowName:      db "#DEX Show@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
UnknownStationName:   db "?????@"
PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"
; 9191c

INCLUDE "engine/town_map.asm"

PlayRadio: ; 91a53
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wc6da]
	ld l, a
	ld a, [wc6db]
	ld h, a
	ld a, [wc6d9]
	and a
	jr z, .zero
	rst FarCall

.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [Options], a
	call Function91492
	ret
; 91a87

.PlayStation: ; 91a87
	ld a, -1
	ld [EnemyTurnsTaken], a
	ld hl, .StationPointers
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp [hl]

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld [hl], $72
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], $73
	call WaitBGMap
	ret
; 91ab9

.StationPointers: ; 91ab9
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokedexShow
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio
; 91acb

.OakOrPnP: ; 91acb
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople
; 91ae1

PokegearMap: ; 91ae1
	ld a, e
	and a
	jr nz, .kanto
	call Function91ff2
	call FillJohtoMap
	ret

.kanto
	call Function91ff2
	call FillKantoMap
	ret
; 91af3

_FlyMap: ; 91af3
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	callba Function8cf53
	call Function91ff2
	ld de, GFX_922e1
	ld hl, VTiles2 tile $30
	lb bc, BANK(GFX_922e1), 6
	call Request1bpp
	call FlyMap
	call Function91c8f
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]

.exit
	ld [wd002], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wd002]
	ld e, a
	ret
; 91b73

FlyMapScroll: ; 91b73
	ld a, [StartFlypoint]
	ld e, a
	ld a, [EndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	ret

.ScrollNext
	ld hl, wd002
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a

.NotAtEndYet
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev
	ld hl, wd002
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a

.NotAtStartYet
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev

.Finally
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 91bb5

TownMapBubble: ; 91bb5
; Draw the bubble containing the location text in the town map HUD

; Top-left corner
	hlcoord 1, 0
	ld a, $30
	ld [hli], a

; Top row
	ld bc, 16
	ld a, " "
	call ByteFill

; Top-right corner
	ld a, $31
	ld [hl], a
	hlcoord 1, 1


; Middle row
	ld bc, 18
	ld a, " "
	call ByteFill


; Bottom-left corner
	hlcoord 1, 2
	ld a, $32
	ld [hli], a

; Bottom row
	ld bc, 16
	ld a, " "
	call ByteFill

; Bottom-right corner
	ld a, $33
	ld [hl], a


; Print "Where?"
	hlcoord 2, 0
	ld de, .Where
	call PlaceString

; Print the name of the default flypoint
	call .Name

; Up/down arrows
	hlcoord 18, 1
	ld [hl], $34	
	ret

.Where
	db "Where?@"

.Name
; We need the map location of the default flypoint
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]

	callba GetLandmarkName

	hlcoord 2, 1
	ld de, StringBuffer1
	call PlaceString
	ret
; 91c17

GetMapCursorCoordinates: ; 91c17
	ld a, [wd002]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	callba GetLandmarkCoords
	ld a, [wd003]
	ld c, a
	ld a, [wd004]
	ld b, a
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret
; 91c3c

CheckIfVisitedFlypoint: ; 91c3c
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret
; 91c50

HasVisitedSpawn: ; 91c50
; Check if spawn point c has been visited.
	ld hl, VisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	ret
; 91c5e

Flypoints: ; 91c5e
; landmark, spawn point

	const_def

flypoint: MACRO
; \1\@FLY   EQUS "FLY_\1"
; \1\@SPAWN EQUS "SPAWN_\1"
	; const \1\@FLY
	; db \2, \1\@SPAWN
	const FLY_\1
	db \2, SPAWN_\1
ENDM

; Johto
	flypoint NEW_BARK,    NEW_BARK_TOWN
	flypoint CHERRYGROVE, CHERRYGROVE_CITY
	flypoint VIOLET,      VIOLET_CITY
	flypoint AZALEA,      AZALEA_TOWN
	flypoint GOLDENROD,   GOLDENROD_CITY
	flypoint ECRUTEAK,    ECRUTEAK_CITY
	flypoint OLIVINE,     OLIVINE_CITY
	flypoint CIANWOOD,    CIANWOOD_CITY
	flypoint MAHOGANY,    MAHOGANY_TOWN
	flypoint LAKE,        LAKE_OF_RAGE
	flypoint BLACKTHORN,  BLACKTHORN_CITY
	flypoint MT_SILVER,   SILVER_CAVE

; Kanto
KANTO_FLYPOINT EQU const_value

	flypoint PALLET,      PALLET_TOWN
	flypoint VIRIDIAN,    VIRIDIAN_CITY
	flypoint PEWTER,      PEWTER_CITY
	flypoint CERULEAN,    CERULEAN_CITY
	flypoint VERMILION,   VERMILION_CITY
	flypoint ROCK_TUNNEL, ROCK_TUNNEL
	flypoint LAVENDER,    LAVENDER_TOWN
	flypoint CELADON,     CELADON_CITY
	flypoint SAFFRON,     SAFFRON_CITY
	flypoint FUCHSIA,     FUCHSIA_CITY
	flypoint CINNABAR,    CINNABAR_ISLAND
	flypoint INDIGO,      INDIGO_PLATEAU

	db -1
; 91c8f

Function91c8f: ; 91c8f
	ret
; 91c90

FlyMap: ; 91c90

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

; If we're not in a valid location, i.e. Pokecenter floor 2F,
; the backup map information is used

	cp SPECIAL_MAP
	jr nz, .CheckRegion

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.CheckRegion
; The first 46 locations are part of Johto. The rest are in Kanto
	cp KANTO_LANDMARK
	jr nc, .KantoFlyMap

.JohtoFlyMap
; Note that .NoKanto should be modified in tandem with this branch

	push af

; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wd002], a

; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [EndFlypoint], a

; Fill out the map
	call FillJohtoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.KantoFlyMap

; The event that there are no flypoints enabled in a map is not
; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,
; the flypoint selection has a default starting point that
; can be flown to even if none are enabled

; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is
; visited and its flypoint enabled

	push af
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	jr z, .NoKanto

; Kanto's map is only loaded if we've visited Indigo Plateau

; Flypoints begin at Pallet Town...
	ld a, FLY_PALLET
	ld [StartFlypoint], a
; ...and end at Indigo Plateau
	ld a, FLY_INDIGO
	ld [EndFlypoint], a

; Because Indigo Plateau is the first flypoint the player
; visits, it's made the default flypoint
	ld [wd002], a

; Fill out the map
	call FillKantoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.NoKanto
; If Indigo Plateau hasn't been visited, we use Johto's map instead

; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wd002], a

; Flypoints begin at New Bark Town...
	ld [StartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [EndFlypoint], a

	call FillJohtoMap

	pop af

.MapHud
	call TownMapBubble
	call TownMapPals

	hlbgcoord 0, 0 ; BG Map 0
	call TownMapBGUpdate

	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret
; 91d11

Function91d11: ; 91d11
	ld a, [wd002]
	push af
	ld a, [wd003]
	push af
	ld a, e
	ld [wd002], a
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hInMenu], a

	ld de, GFX_922d1
	ld hl, VTiles0 tile $7f
	lb bc, BANK(GFX_922d1), 1
	call Request2bpp ; actually 1bpp

	call Function91ed0

	ld hl, VTiles0 tile $78
	ld c, $4
	call Request2bpp

	call Function91ff2
	call FillKantoMap
	call Function91de9
	call TownMapPals
	hlbgcoord 0, 0, VBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call Function91de9
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	xor a
	call Function91e1e
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call Function91d9b
	call Function91dcd
	jr .next

.select
	call Function91e5a

.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wd003], a
	pop af
	ld [wd002], a
	ret
; 91d9b

Function91d9b: ; 91d9b
	ld a, [hl]
	and $20
	jr nz, .asm_91da6
	ld a, [hl]
	and $10
	jr nz, .asm_91db7
	ret

.asm_91da6
	ld a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ld [hWY], a
	xor a
	call Function91e1e
	ret

.asm_91db7
	ld a, [StatusFlags]
	bit 6, a ; hall of fame
	ret z
	ld a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ld [hWY], a
	ld a, $1
	call Function91e1e
	ret
; 91dcd

Function91dcd: ; 91dcd
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .asm_91ddc
	call ClearSprites
	ret

.asm_91ddc
	hlcoord 0, 0
	ld de, Sprites
	ld bc, $a0
	call CopyBytes
	ret
; 91de9

Function91de9: ; 91de9
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, $7f
	call ByteFill
	hlcoord 0, 1
	ld a, $6
	ld [hli], a
	ld bc, SCREEN_HEIGHT
	ld a, $7
	call ByteFill
	ld [hl], $17
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, String_91e16
	call PlaceString
	ret
; 91e16

String_91e16:
	db "'S NEST@"
; 91e1e

Function91e1e: ; 91e1e
	ld [wd003], a
	ld e, a
	callba Function2a01f
	decoord 0, 0
	ld hl, Sprites
.asm_91e2e
	ld a, [de]
	and a
	jr z, .asm_91e4d
	push de
	ld e, a
	push hl
	callba GetLandmarkCoords
	pop hl
	ld a, d
	sub $4
	ld [hli], a
	ld a, e
	sub $4
	ld [hli], a
	ld a, $7f
	ld [hli], a
	xor a
	ld [hli], a
	pop de
	inc de
	jr .asm_91e2e

.asm_91e4d
	ld hl, Sprites
	decoord 0, 0
	ld bc, $a0
	call CopyBytes
	ret
; 91e5a

Function91e5a: ; 91e5a
	call Function91ea9
	ret c

	ld a, [wd002]
	ld e, a
	callba GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, Unknown_91e9c
	ld hl, Sprites
.asm_91e70
	ld a, [de]
	cp $80
	jr z, .asm_91e91

	add b
	ld [hli], a
	inc de

	ld a, [de]
	add c
	ld [hli], a
	inc de

	ld a, [de]
	add $78
	ld [hli], a
	inc de

	push bc
	ld c, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91e8c
	inc c
.asm_91e8c
	ld a, c
	ld [hli], a
	pop bc

	jr .asm_91e70

.asm_91e91
	ld hl, Sprites + $10
	ld bc, SpritesEnd - (Sprites + $10)
	xor a
	call ByteFill
	ret
; 91e9c

Unknown_91e9c: ; 91e9c
	db -8, -8,  0
	db -8,  0,  1
	db  0, -8,  2
	db  0,  0,  3
	db $80 ; terminator
; 91ea9

Function91ea9: ; 91ea9
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto

.kanto
	ld a, [wd003]
	and a
	jr z, .clear
	jr .ok

.johto
	ld a, [wd003]
	and a
	jr nz, .clear

.ok
	and a
	ret

.clear
	ld hl, Sprites
	ld bc, SpritesEnd - Sprites
	xor a
	call ByteFill
	scf
	ret
; 91ed0

Function91ed0: ; 91ed0
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .asm_91ede
	callba GetPlayerIcon
	ret

.asm_91ede
	ld de, FastShipGFX
	ld b, BANK(FastShipGFX)
	ret
; 91ee4

TownMapBGUpdate: ; 91ee4
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a

; Only update palettes on CGB
	ld a, [hCGB]
	and a
	jr z, .tiles

; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a

; The BG Map is updated in thirds, so we wait
; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames

.tiles
; Update BG Map tiles
	call WaitBGMap

; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret
; 91eff

FillJohtoMap: ; 91eff
	ld de, JohtoMap
	jr FillTownMap

FillKantoMap: ; 91f04
	ld de, KantoMap

FillTownMap: ; 91f07
	hlcoord 0, 0
.loop
	ld a, [de]
	cp $ff
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop
; 91f13

TownMapPals: ; 91f13
; Assign palettes based on tile ids

	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld bc, 360
.loop
; Current tile
	ld a, [hli]
	push hl

; HP/borders use palette 0
	cp $60
	jr nc, .pal0

; The palette data is condensed to nybbles,
; least-significant first.
	ld hl, TownMapPalMap
	srl a
	jr c, .odd

; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and %111
	jr .update

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and %111
	jr .update

.pal0
	xor a

.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

TownMapPalMap:
	db $11, $21, $22, $00, $11, $13, $54, $54, $11, $21, $22, $00
	db $11, $10, $01, $00, $11, $21, $22, $00, $00, $00, $00, $00
	db $00, $00, $44, $04, $00, $00, $00, $00, $33, $33, $33, $33
	db $33, $33, $33, $03, $33, $33, $33, $33, $00, $00, $00, $00
; 91f7b

TownMapMon: ; 91f7b
; Draw the FlyMon icon at town map location in

; Get FlyMon species
	ld a, [CurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wd265], a

; Get FlyMon icon
	ld e, 8 ; starting tile in VRAM
	callba GetSpeciesIcon

; Animation/palette
	ld de, 0
	ld a, $0
	call _InitSpriteAnimStruct

	ld hl, 3
	add hl, bc
	ld [hl], 8
	ld hl, 2
	add hl, bc
	ld [hl], 0
	ret
; 91fa6

TownMapPlayerIcon: ; 91fa6
; Draw the player icon at town map location in a
	push af

	callba GetPlayerIcon

; Standing icon
	ld hl, VTiles0 tile $10
	ld c, 4 ; # tiles
	call Request2bpp

; Walking icon
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $14
	ld c, 4 ; # tiles
	ld a, BANK(ChrisSpriteGFX) ; does nothing
	call Request2bpp

; Animation/palette
	ld de, 0
	ld b, $0a ; Male
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_91fd3
	ld b, $1e ; Female
.asm_91fd3
	ld a, b
	call _InitSpriteAnimStruct

	ld hl, $3
	add hl, bc
	ld [hl], $10

	pop af
	ld e, a
	push bc
	callba GetLandmarkCoords
	pop bc

	ld hl, 4
	add hl, bc
	ld [hl], e
	ld hl, 5
	add hl, bc
	ld [hl], d
	ret
; 0x91ff2

Function91ff2: ; 91ff2
	ld hl, TownMapGFX
	ld de, VTiles2
	lb bc, BANK(TownMapGFX), $30
	call DecompressRequest2bpp
	ret
; 91fff


JohtoMap: ; 91fff
INCBIN "gfx/misc/johto.bin"
; 92168

KantoMap: ; 92168
INCBIN "gfx/misc/kanto.bin"
; 922d1


GFX_922d1: ; 922d1
INCBIN "gfx/unknown/0922d1.2bpp"
GFX_922e1: ; 922e1
INCBIN "gfx/unknown/0922e1.2bpp"
GFX_92301: ; 92301
INCBIN "gfx/unknown/092301.2bpp"
Function92311: ; unreferenced
	xor a
	ld [wd002], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	callba Function8cf53
	call Function91ff2
	ld de, GFX_922e1
	ld hl, VTiles2 tile $30
	lb bc, BANK(GFX_922e1), 6
	call Request1bpp
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, VBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call Function923b8
	call GetMapCursorCoordinates
	callba PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .asm_9239f

.pressedA
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]

.asm_9239f
	ld [wd002], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wd002]
	ld e, a
	ret
; 923b8

Function923b8: ; 923b8
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN | D_RIGHT
	jr nz, .asm_923c6
	ld a, [hl]
	and D_UP | D_LEFT
	jr nz, .asm_923d3
	ret

.asm_923c6
	ld hl, wd002
	ld a, [hl]
	cp FLY_INDIGO
	jr c, .asm_923d0
	ld [hl], -1
.asm_923d0
	inc [hl]
	jr .asm_923dd

.asm_923d3
	ld hl, wd002
	ld a, [hl]
	and a
	jr nz, .asm_923dc
	ld [hl], FLY_INDIGO + 1
.asm_923dc
	dec [hl]

.asm_923dd
	ld a, [wd002]
	cp KANTO_FLYPOINT
	jr c, .johto

	call FillKantoMap
	xor a
	ld b, $9c
	jr .asm_923f3

.johto
	call FillJohtoMap
	ld a, $90
	ld b, $98

.asm_923f3
	ld [hWY], a
	ld a, b
	ld [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 92402
