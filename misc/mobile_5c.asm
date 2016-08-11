Function170000: ; 170000
	ld a, [$c62b]
	ld [wPlayerTrademonSpecies], a
	ld hl, $c62e
	ld de, wPlayerTrademonSenderName
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c663
	ld de, wPlayerTrademonOTName
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c648
	ld a, [hli]
	ld [wPlayerTrademonDVs], a
	ld a, [hl]
	ld [wPlayerTrademonDVs + 1], a
	ld hl, $c639
	ld a, [hli]
	ld [wPlayerTrademonID], a
	ld a, [hl]
	ld [wPlayerTrademonID + 1], a
	ld bc, $c633
	callba GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c608
	ld de, $d800
	ld bc, $008f
	call CopyBytes
	ret

; 17005a

Function17005a: ; 17005a
	ld a, $5
	call GetSRAMBank
	ld a, [$a824]
	ld [wOTTrademonSpecies], a
	ld hl, $a827
	ld de, wOTTrademonSenderName
	ld bc, 5 ; Japanese Name Length
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld hl, $a85c
	ld de, wOTTrademonOTName
	ld bc, 5 ; Japanese Name Length
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld hl, $a841
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld hl, $a832
	ld a, [hli]
	ld [wOTTrademonID], a
	ld a, [hl]
	ld [wOTTrademonID + 1], a
	ld bc, $a82c
	callba GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	ld a, [wcd81]
	ld [wc74e], a
	call CloseSRAM
	ret

; 1700b0

INCLUDE "misc/battle_tower_5c.asm"

Function170be4: ; 170be4
	ld a, $5
	call GetSRAMBank
	xor a
	ld hl, $a894
	ld bc, $0008
	call ByteFill
	call CloseSRAM
	ret

; 170bf7

Clears5_a89a: ; 170bf7
	ld a, $5
	call GetSRAMBank
	ld hl, $a89a
	xor a
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	ret

; 170c06

Function170c06: ; 170c06
	ld a, $5
	call GetSRAMBank
	ld hl, $a894
	ld a, [wBattleResult]
	and a
	jr nz, .asm_170c15
	inc [hl]

.asm_170c15
	inc hl
	inc hl
	ld a, [$a89b]
	add [hl]
	ld [hld], a
	ld a, [$a89a]
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c27
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c27
	inc hl
	push hl
	ld de, 0
	xor a
	ld [wd265], a
.asm_170c30
	ld hl, PartyMon1HP
	ld a, [wd265]
	call GetPartyLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
	inc hl
	inc hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	jr c, .asm_170c58
	ld a, [wd265]
	inc a
	ld [wd265], a
	cp $3
	jr c, .asm_170c30
	jr .asm_170c5b

.asm_170c58
	ld de, -1

.asm_170c5b
	pop hl
	inc hl
	ld a, e
	add [hl]
	ld [hld], a
	ld a, d
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c69
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c69
	inc hl
	push hl
	ld b, $0
	ld c, $0
.asm_170c6f
	ld hl, PartyMon1HP
	ld a, b
	push bc
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_170c7d
	inc c

.asm_170c7d
	inc b
	ld a, b
	cp $3
	jr c, .asm_170c6f
	pop hl
	ld a, [hl]
	add c
	ld [hl], a
	call CloseSRAM
	ret

; 170c8b

Function170c8b: ; 170c8b
	ld hl, LastPlayerCounterMove
	ld b, $5
.asm_170c90
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec b
	jr nz, .asm_170c90
	ret

; 170c98

CheckBTMonMovesForErrors: ; 170c98
	ld c, BATTLETOWER_NROFPKMNS
	ld hl, wBT_OTTempPkmn1Moves
.loop
	push hl
	ld a, [hl]
	cp NUM_ATTACKS + 1
	jr c, .okay
	ld a, POUND
	ld [hl], a

.okay
	inc hl
	ld b, NUM_MOVES - 1
.loop2
	ld a, [hl]
	and a
	jr z, .loop3
	cp NUM_ATTACKS + 1
	jr c, .next

.loop3
	xor a
	ld [hl], a
	inc hl
	dec b
	jr nz, .loop3
	jr .done

.next
	inc hl
	dec b
	jr nz, .loop2

.done
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret

; 170cc6

Function170cc6: ; 170cc6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, LZ_170d16
	ld de, wDecompressScratch
	call Decompress
	ld a, $1
	ld [rVBK], a
	ld de, wd000
	ld hl, VTiles0
	lb bc, $6, $c1
	call Get2bpp
	xor a
	ld [rVBK], a
	ld hl, LZ_1715a4
	ld de, wd000
	call Decompress
	ld de, UnknBGPals
	ld hl, VTiles0
	lb bc, $6, $53
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret

; 170d02

Function170d02: ; 170d02
	ld a, $1
	ld [rVBK], a
	ld de, GFX_171848
	ld hl, VTiles1 tile $41
	lb bc, BANK(GFX_171848), $18
	call Get2bpp
	xor a
	ld [rVBK], a
	ret

; 170d16

LZ_170d16:
INCBIN "gfx/unknown/170d16.2bpp.lz"

LZ_1715a4:
INCBIN "gfx/unknown/1715a4.2bpp.lz"

GFX_171848:
INCBIN "gfx/unknown/171848.2bpp"

Function1719c8: ; 1719c8 (5c:59c8)
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function1719d6
	pop af
	ld [hInMenu], a
	ret

Function1719d6: ; 1719d6 (5c:59d6)
	callba Function1183cb
	call Function1719ed
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call Function171a11
	pop af
	ld [rSVBK], a
	ret

Function1719ed: ; 1719ed (5c:59ed)
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	dec a
	ld [wcd4b], a
	call ClearBGPalettes
	call ClearSprites
	callba Function171d2b
	callba ReloadMapPart
	callba ClearSpriteAnims
	ret

Function171a11: ; 171a11 (5c:5a11)
.loop
	call JoyTextDelay
	ld a, [wcd49]
	bit 7, a
	jr nz, .done
	call Function171a36
	callba PlaySpriteAnimations
	callba ReloadMapPart
	jr .loop
.done
	callba ClearSpriteAnims
	call ClearSprites
	ret

Function171a36: ; 171a36 (5c:5a36)
	ld a, [wcd49]
	ld e, a
	ld d, 0
	ld hl, Jumptable_171a45
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_171a45: ; 171a45 (5c:5a45)
	dw Function171a95
	dw Function171ac9
	dw Function171a5d
	dw Function171ad7
	dw Function171a5d
	dw Function171aec
	dw Function171b4b
	dw Function171b85
	dw Function171bcc
	dw Function171c2c
	dw Function171c39
	dw Function171c41


Function171a5d: ; 171a5d (5c:5a5d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_171a6a
	bit 0, a
	ret nz
	jp Function171c66

.asm_171a6a
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function118452
	pop af
	ld [rSVBK], a
	ld a, $a
	ld [wcd49], a
	ret

Function171a95: ; 171a95 (5c:5a95)
	callba Function171ccd
	hlcoord 2, 8
	ld de, String_171aa7
	call PlaceString
	jp Function171c66

; 171aa7 (5c:5aa7)

String_171aa7: ; 171aa7
	db   "モバイルアダプタに"
	next "せつぞく しています"
	next "しばらく おまちください"
	db   "@"
; 171ac9

Function171ac9: ; 171ac9 (5c:5ac9)
	ld de, wcd81
	ld hl, $5c
	ld a, $2
	call Function3e32
	jp Function171c66

Function171ad7: ; 171ad7 (5c:5ad7)
	xor a
	ld hl, $c608
	ld bc, $66
	call ByteFill
	ld de, $c608
	ld a, $c
	call Function3e32
	jp Function171c66

Function171aec: ; 171aec (5c:5aec)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function118452
	pop af
	ld [rSVBK], a
	hlcoord 2, 6
	ld a, $8
.asm_171b01
	push af
	push hl
	xor a
	ld bc, $10
	call ByteFill
	pop hl
	ld de, $14
	add hl, de
	pop af
	dec a
	jr nz, .asm_171b01
	hlcoord 2, 7
	ld a, $3
	ld de, $c608
.asm_171b1b
	push af
	push hl
	ld a, [de]
	and a
	jr z, .asm_171b34
	ld a, [wcd4b]
	inc a
	ld [wcd4b], a
	push hl
	call Function171b42
	pop hl
	ld bc, $ffec
	add hl, bc
	call Function171b42
.asm_171b34
	pop hl
	ld bc, $14
	add hl, bc
	add hl, bc
	add hl, bc
	pop af
	dec a
	jr nz, .asm_171b1b
	jp Function171c66

Function171b42: ; 171b42 (5c:5b42)
	ld a, [de]
	inc de
	and a
	ret z
	sub $20
	ld [hli], a
	jr Function171b42

Function171b4b: ; 171b4b (5c:5b4b)
	depixel 8, 2
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, $8
	ld [hl], a

	depixel 8, 19
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, $9
	ld [hl], a

	depixel 17, 14, 2, 0
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, $a
	ld [hl], a

	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	jp Function171c66

Function171b85: ; 171b85 (5c:5b85)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171b9f
	ld a, [hl]
	and $1
	jp nz, Function171bbd
	ld a, [hl]
	and $40
	jr nz, asm_171ba5
	ld a, [hl]
	and $80
	jr nz, asm_171baf
	ret

Function171b9f: ; 171b9f (5c:5b9f)
	ld a, $80
	ld [wcd49], a
	ret

asm_171ba5: ; 171ba5 (5c:5ba5)
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ret

asm_171baf: ; 171baf (5c:5baf)
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4a]
	cp c
	ret z
	inc a
	ld [wcd4a], a
	ret

Function171bbd: ; 171bbd (5c:5bbd)
	call PlayClickSFX
	ld a, $8
	ld [wcd23], a
	xor a
	ld [wcd24], a
	jp Function171c66

Function171bcc: ; 171bcc (5c:5bcc)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171bdc
	ld a, [hl]
	and $1
	jp nz, Function171beb
	ret

Function171bdc: ; 171bdc (5c:5bdc)
	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	ld hl, wcd49
	dec [hl]
	ret

Function171beb: ; 171beb (5c:5beb)
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4a]
	ld [$aa4a], a
	call CloseSRAM
	ld hl, MenuDataHeader_171c6b
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	callba ReloadMapPart
	hlcoord 1, 14
	ld de, String_171c73
	call PlaceString
	ld a, [wcd4a]
	cp $2
	jr z, .asm_171c1f
	ld a, $8
	jr .asm_171c21
.asm_171c1f
	ld a, $c
.asm_171c21
	ld [wcd24], a
	ld a, $1e
	ld [wcd4c], a
	call Function171c66

Function171c2c: ; 171c2c (5c:5c2c)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call ExitMenu
	call ClearBGPalettes
	jr asm_171c60

Function171c39: ; 171c39 (5c:5c39)
	ld a, $28
	ld [wcd4c], a
	call Function171c66

Function171c41: ; 171c41 (5c:5c41)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call ClearBGPalettes
	callba MobileFunc_106462
	callba Function106464
	ld a, $2
	ld [wc303], a
	callba Function17f555
asm_171c60: ; 171c60 (5c:5c60)
	ld a, $80
	ld [wcd49], a
	ret

Function171c66: ; 171c66 (5c:5c66)
	ld hl, wcd49
	inc [hl]
	ret

; 171c6b (5c:5c6b)

MenuDataHeader_171c6b: ; 171c6b
	db $40 ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 171c73

String_171c73: ; 171c73
	db   "モバイルセンターを けってい"
	next "しました@"
; 171c87

Function171c87: ; 171c87 (5c:5c87)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, VTiles2 tile $00
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, VTiles0 tile $00
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172491
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_1727ed
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 3, 2
	ld de, String_172e31
	call PlaceString
	hlcoord 3, 16
	ld de, String_172e3f
	call PlaceString
	ret

Function171ccd: ; 171ccd (5c:5ccd)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_171d71
	ld de, UnknBGPals
	ld bc, $40
	call CopyBytes
	ld hl, EngineBuffer5
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hl], a
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret

Function171cf0: ; 171cf0 (5c:5cf0)
	xor a
	hlcoord 4, 15
	ld [hli], a
	ld [hli], a
	ld a, [wcd4b]
	xor $1
	ld [wcd4b], a
	and a
	jr nz, .asm_171d16
	ld hl, Tilemap_17251d
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e3f
	jp PlaceString

.asm_171d16
	ld hl, Tilemap_1725f9
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e4e
	jp PlaceString

Function171d2b: ; 171d2b (5c:5d2b)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, VTiles2 tile $00
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, VTiles0 tile $00
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172685
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_172955
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 2, 2
	ld de, String_172e5d
	call PlaceString
	hlcoord 14, 16
	ld de, String_172e58
	call PlaceString
	ret

; 171d71 (5c:5d71)

Palette_171d71:
	RGB  0,  0,  0
	RGB  3,  0,  0
	RGB  5,  0,  0
	RGB 31, 31, 29
	RGB  0,  2, 10
	RGB  2, 10, 21
	RGB  0,  0,  0
	RGB 10, 26, 31
	RGB  0,  0,  0
	RGB  0,  7,  8
	RGB 31,  8,  0
	RGB  1, 17, 15
	RGB 31, 16,  0
	RGB 31, 22,  0
	RGB 31, 27,  0
	RGB 31, 31,  0
	RGB 31, 18,  6
	RGB  0,  3,  0
	RGB  0,  9,  0
	RGB  0, 12,  0
	RGB  0, 16,  0
	RGB  0, 22,  0
	RGB  0, 25,  0
	RGB  0, 27,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 29
	RGB 21, 21, 20
	RGB 11, 11, 10
	RGB  0,  0,  0
GFX_171db1:
INCBIN "gfx/unknown/171db1.2bpp"
Tilemap_172491:
INCBIN "gfx/unknown/172491.tilemap"
Tilemap_17251d:
INCBIN "gfx/unknown/17251d.tilemap"
Tilemap_1725f9:
INCBIN "gfx/unknown/1725f9.tilemap"
Tilemap_172685:
INCBIN "gfx/unknown/172685.tilemap"
Attrmap_1727ed:
INCBIN "gfx/unknown/1727ed.attrmap"
Attrmap_172955:
INCBIN "gfx/unknown/172955.attrmap"
LZ_172abd:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

String_172e31: ; 172e31
	db "パスワード", $1f, "いれてください@"
String_172e3f: ; 172e3f
	db "きりかえ やめる  けってい@"
String_172e4e: ; 172e4e
	db "きりかえ やめる  "
String_172e58:
	db "けってい@"
String_172e5d: ; 172e5d
	db "せつぞくする モバイルセンターを"
	next "えらんで ください@"
; 172e78


Function172e78: ; 172e78 (5c:6e78)
	ld a, $7f
	hlcoord 0, 0
	ld bc, $168
	call ByteFill
	ld a, $7
	hlcoord 0, 0, AttrMap
	ld bc, $168
	call ByteFill
	call DisableLCD
	ld hl, GFX_172f1f
	ld de, VTiles2 tile $00
	ld bc, $610
	call CopyBytes
	call EnableLCD
	ld hl, Tilemap_1733af
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_173517
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	ret

; 172eb9 (5c:6eb9)

Function172eb9:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_172edf
	ld de, UnknBGPals
	ld bc, $40
	call CopyBytes
	ld hl, Palette_172edf
	ld de, BGPals
	ld bc, $40
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret

; 172edf (5c:6edf)

Palette_172edf:
	RGB  5, 12, 17
	RGB 31, 31, 31
	RGB 18, 25, 28
	RGB 10, 17, 21
	RGB  6, 13, 18
	RGB 31, 31, 31
	RGB 20, 26, 28
	RGB 12, 19, 23
	RGB  3, 10, 16
	RGB 31, 31, 31
	RGB  6, 13, 18
	RGB 20, 26, 28
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

GFX_172f1f:
INCBIN "gfx/unknown/172f1f.2bpp"

Tilemap_1733af:
IF DEF(CRYSTAL11)
INCBIN "gfx/unknown/1733af_corrupt.tilemap"
ELSE
INCBIN "gfx/unknown/1733af.tilemap"
ENDC

Attrmap_173517:
INCBIN "gfx/unknown/173517.attrmap"
