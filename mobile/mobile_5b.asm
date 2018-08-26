Unreferenced_Function16c000:
	; Only for CGB
	ldh a, [hCGB]
	and a
	ret z
	; Only do this once per boot cycle
	ldh a, [hSystemBooted]
	and a
	ret z
	; Set some flag, preserving the old state
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	; Do stuff
	call MobileSystemSplashScreen_InitGFX ; Load GFX
	farcall SetRAMStateForMobile
	farcall EnableMobile
	call .RunJumptable
	farcall DisableMobile
	; Prevent this routine from running again
	; until the next time the system is turned on
	xor a
	ldh [hSystemBooted], a
	; Restore the flag state
	pop af
	ld [wcfbe], a
	ret

.RunJumptable:
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wd002], a
	ld [wd003], a
.loop
	call DelayFrame
	farcall Function10635c
	ld a, [wd002]
	ld hl, .Jumptable
	rst JumpTable
	call Function16cb2e
	call Function16cbae
	ld a, [wd002]
	cp $ff
	jr nz, .loop
	ret

.Jumptable:
	dw .init
	dw Function16c0ba
	dw Function16c089
	dw Function16c09e
	dw Function16c0a8
	dw Function16c0dc
	dw Function16c0ec
	dw Function16c0ba
	dw Function16c0ca
	dw Function16c0dc
	dw Function16c0ec
	dw .quit

.init
	ld a, [wcf64]
	and a
	ret z
	ld [wd002], a
	xor a
	ld [wd003], a
	ret

.quit
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret

Function16c089:
	ld a, $1
	ld [wBuffer2], a
	ld [wd1f1], a
	xor a
	ldh [hWY], a
	call Function16c0fa
	ld a, [wd002]
	ld [wcf64], a
	ret

Function16c09e:
	ld a, [wcf64]
	cp $4
	ret nz
	call Function16c0fa
	ret

Function16c0a8:
	xor a
	ld [wBuffer2], a
	ld [wd1f1], a
	call ClearSprites
	ld a, $90
	ldh [hWY], a
	call Function16c0fa
	ret

Function16c0ba:
	call Function16c943
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret

Function16c0ca:
	ld a, [wd003]
	cp $28
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call z, Function16c0fa
	ret

Function16c0dc:
	call Function16ca11
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret

Function16c0ec:
	call ClearBGPalettes
	call ClearScreen
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret

Function16c0fa:
	push af
	ld a, [wd002]
	inc a
	ld [wd002], a
	xor a
	ld [wd003], a
	pop af
	ret

MobileSystemSplashScreen_InitGFX:
	call DisableLCD
	ld hl, vTiles2
	ld de, .Tiles
	lb bc, BANK(.Tiles), 104
	call Get2bpp
	call .LoadPals
	call .LoadTileMap
	call .LoadAttrMap
	hlbgcoord 0, 0
	call Function16cc73
	call Function16cc02
	xor a
	ldh [hBGMapMode], a
	call EnableLCD
	ret

.LoadPals:
	ld de, wBGPals1
	ld hl, UnknownMobilePalettes_16c903
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ret

.LoadTileMap:
	hlcoord 0, 0
	ld bc, 20
	xor a
	call ByteFill
	ld hl, .TileMap
	decoord 0, 1
	ld bc, $0154
	call CopyBytes
	ret

.LoadAttrMap:
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH
	xor a
	call ByteFill
	ld hl, .AttrMap
	decoord 0, 1, wAttrMap
	ld bc, 17 * SCREEN_WIDTH
	call CopyBytes
	ret

.Tiles:
INCBIN "gfx/mobile/mobile_splash.2bpp"

.TileMap:
INCBIN "gfx/mobile/mobile_splash.tilemap"

.AttrMap:
INCBIN "gfx/mobile/mobile_splash.attrmap"

UnknownMobilePalettes_16c903:
INCLUDE "gfx/unknown/16c903.pal"

Function16c943:
	ld a, [wd003]
	and a
	jr nz, .asm_16c95e
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, $ff
	ld bc, 1 palettes
	ld hl, wBGPals1
	call ByteFill
	pop af
	ldh [rSVBK], a

.asm_16c95e
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16c969
	ld hl, UnknownMobilePalettes_16c903
	call Function16cab6
	call Function16cabb
	ld d, a
	ld hl, wBGPals1
	call Function16cab6
	call Function16cabb
	cp d
	jr z, .asm_16c991
	ld b, $1
.asm_16c981
	dec a
	cp d
	jr z, .asm_16c988
	dec b
	jr nz, .asm_16c981

.asm_16c988
	ld hl, wBGPals1
	call Function16cab6
	call Function16cadc

.asm_16c991
	ld hl, UnknownMobilePalettes_16c903
	call Function16cab6
	call Function16cad8
	ld d, a
	ld hl, wBGPals1
	call Function16cab6
	call Function16cad8
	cp d
	jr z, .asm_16c9b9
	ld b, $1
.asm_16c9a9
	dec a
	cp d
	jr z, .asm_16c9b0
	dec b
	jr nz, .asm_16c9a9

.asm_16c9b0
	ld hl, wBGPals1
	call Function16cab6
	call Function16cb08

.asm_16c9b9
	ld hl, UnknownMobilePalettes_16c903
	call Function16cab6
	call Function16cac4
	ld d, a
	ld hl, wBGPals1
	call Function16cab6
	call Function16cac4
	cp d
	jr z, .asm_16c9e1
	ld b, $1
.asm_16c9d1
	dec a
	cp d
	jr z, .asm_16c9d8
	dec b
	jr nz, .asm_16c9d1

.asm_16c9d8
	ld hl, wBGPals1
	call Function16cab6
	call Function16cae8

.asm_16c9e1
	inc e
	inc e
	ld a, e
	cp $8
	jr nz, .asm_16c969
	farcall ApplyPals
	call SetPalettes
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16ca09
	pop af
	ldh [rSVBK], a
	ld e, $0
	pop af
	ldh [rSVBK], a
	and a
	ret

.asm_16ca09
	pop af
	ldh [rSVBK], a
	pop af
	ldh [rSVBK], a
	scf
	ret

Function16ca11:
	ld a, [wd003]
	and a
	jr nz, .asm_16ca1d
	farcall ApplyPals

.asm_16ca1d
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16ca28
	ld hl, wBGPals1
	call Function16cab6
	call Function16cabb
	cp $1f
	jr z, .asm_16ca48
	ld b, $1
.asm_16ca37
	inc a
	cp $1f
	jr z, .asm_16ca3f
	dec b
	jr nz, .asm_16ca37

.asm_16ca3f
	ld hl, wBGPals1
	call Function16cab6
	call Function16cadc

.asm_16ca48
	ld hl, wBGPals1
	call Function16cab6
	call Function16cad8
	cp $1f
	jr z, .asm_16ca68
	ld b, $1
.asm_16ca57
	inc a
	cp $1f
	jr z, .asm_16ca5f
	dec b
	jr nz, .asm_16ca57

.asm_16ca5f
	ld hl, wBGPals1
	call Function16cab6
	call Function16cb08

.asm_16ca68
	ld hl, wBGPals1
	call Function16cab6
	call Function16cac4
	cp $1f
	jr z, .asm_16ca88
	ld b, $1
.asm_16ca77
	inc a
	cp $1f
	jr z, .asm_16ca7f
	dec b
	jr nz, .asm_16ca77

.asm_16ca7f
	ld hl, wBGPals1
	call Function16cab6
	call Function16cae8

.asm_16ca88
	inc e
	inc e
	ld a, e
	cp $8
	jr nz, .asm_16ca28
	farcall ApplyPals
	call SetPalettes
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16caae
	pop af
	ldh [rSVBK], a
	pop af
	ldh [rSVBK], a
	and a
	ret

.asm_16caae
	pop af
	ldh [rSVBK], a
	pop af
	ldh [rSVBK], a
	scf
	ret

Function16cab6:
	ld b, $0
	ld c, e
	add hl, bc
	ret

Function16cabb:
	inc hl
	ld a, [hl]
	srl a
	srl a
	and $1f
	ret

Function16cac4:
	inc hl
	ld a, [hld]
	and $3
	ld b, a
	ld a, [hl]
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	ld a, b
	ret

Function16cad8:
	ld a, [hl]
	and $1f
	ret

Function16cadc:
	sla a
	sla a
	ld b, a
	inc hl
	ld a, [hl]
	and $83
	or b
	ld [hl], a
	ret

Function16cae8:
	ld c, a
	srl a
	srl a
	srl a
	ld b, a
	inc hl
	ld a, [hl]
	and $fc
	or b
	ld [hld], a
	ld a, c
	sla a
	sla a
	sla a
	sla a
	sla a
	ld b, a
	ld a, [hl]
	and $1f
	or b
	ld [hl], a
	ret

Function16cb08:
	ld b, a
	ld a, [hl]
	and $e0
	or b
	ld [hl], a
	ret

Function16cb0f:
	xor a
	ld [wBuffer1], a
	ld [wBuffer2], a
	xor a
	ld [wd1ec], a
	ld a, $70
	ld [wd1ee], a
	ld a, $4
	ld [wd1ed], a
	ld a, $a0
	ld [wd1ef], a
	xor a
	ld [wd1f0], a
	ret

Function16cb2e:
	ld a, [wBuffer2]
	and a
	ret z
	call Function16cb40
	ld hl, Unknown_16cb86
	ld de, wVirtualOAM
	call Function16cb5d
	ret

Function16cb40:
	ld hl, wd1ec
	inc [hl]
	ld a, [hl]
	cp $18
	ret c
	xor a
	ld [hl], a
	ld a, [wd1ef]
	cp $a0
	jr nz, .asm_16cb57
	ld a, $a7
	ld [wd1ef], a
	ret

.asm_16cb57
	ld a, $a0
	ld [wd1ef], a
	ret

Function16cb5d:
	ld a, [hli]
	and a
	ret z
.asm_16cb60
	push af
	ld a, [wd1ee]
	add [hl]
	add $10
	ld [de], a
	inc hl
	inc de
	ld a, [wd1ed]
	add [hl]
	add $8
	ld [de], a
	inc hl
	inc de
	ld a, [wd1ef]
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wd1f0]
	or [hl]
	ld [de], a
	inc hl
	inc de
	pop af
	dec a
	jr nz, .asm_16cb60
	ret

Unknown_16cb86:
	db 7
	db  0,  0, 0, 1
	db  8,  0, 1, 1
	db  8,  8, 2, 0
	db  8, 16, 3, 0
	db 16,  0, 4, 1
	db 16,  8, 5, 0
	db 16, 16, 6, 0

Function16cba3:
	xor a
	ld [wd1f1], a
	ld [wd1f2], a
	ld [wd1f3], a
	ret

Function16cbae:
	ld a, [wd1f1]
	and a
	ret z
	call Function16cbba
	call Function16cbd1
	ret

Function16cbba:
	ld hl, wd1f2
	inc [hl]
	ld a, [hl]
	cp $c
	ret c
	xor a
	ld [hl], a
	ld a, [wd1f3]
	inc a
	cp $4
	jr c, .asm_16cbcd
	xor a

.asm_16cbcd
	ld [wd1f3], a
	ret

Function16cbd1:
	ld a, [wd1f3]
	ld c, a
	ld b, 0
	ld hl, Unknown_16cbfb
	add hl, bc
	ld a, [hl]
	ld bc, 2
	ld hl, Unknown_16cfa3
	call AddNTimes
	ld de, wBGPals1 palette 1 color 2
	ld bc, PAL_COLOR_SIZE
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Unknown_16cbfb:
	db 0, 1, 2, 1, 0, 1, 2

Function16cc02:
	call Function16cc18
	call Function16cc49
	call Function16cc62
	call Function16cc25
	call Function16cc6e
	call Function16cb0f
	call Function16cba3
	ret

Function16cc18:
	ld hl, vTiles1
	ld de, GFX_16cca3
	lb bc, BANK(GFX_16cca3), 46
	call Get2bpp
	ret

Function16cc25:
	ld hl, Unknown_16cfa9
	ld de, wBGPals1 + 1 palettes
	call .CopyPal
	ld hl, Unknown_16cfb1
	ld de, wOBPals1
	call .CopyPal
	ld hl, Unknown_16cfb9
	ld de, wOBPals1 + 1 palettes
	call .CopyPal
	ret

.CopyPal:
	ld bc, 1 palettes
	ld a, $5
	jp FarCopyWRAM

Function16cc49:
	hlcoord 4, 15
	ld a, $80
	call Function16cc5a
	hlcoord 4, 16
	ld a, $90
	call Function16cc5a
	ret

Function16cc5a:
	ld c, $10
.asm_16cc5c
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_16cc5c
	ret

Function16cc62:
	hlcoord 0, 15, wAttrMap
	ld bc, $0028
	ld a, $1
	call ByteFill
	ret

Function16cc6e:
	hlbgcoord 0, 0, vBGMap1
	jr Function16cc73

Function16cc73:
	ldh a, [rVBK]
	push af
	ld a, $0
	ldh [rVBK], a
	push hl
	decoord 0, 0
	call Function16cc90
	pop hl
	ld a, $1
	ldh [rVBK], a
	decoord 0, 0, wAttrMap
	call Function16cc90
	pop af
	ldh [rVBK], a
	ret

Function16cc90:
	ld bc, $1214
.asm_16cc93
	push bc
.asm_16cc94
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_16cc94
	ld bc, $000c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_16cc93
	ret

GFX_16cca3:
INCBIN "gfx/unknown/16cca3.2bpp"

Unknown_16cfa3:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 16, 19, 25

Unknown_16cfa9:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 31, 31, 31
	RGB 07, 07, 07

Unknown_16cfb1:
	RGB 31, 31, 31
	RGB 13, 09, 18
	RGB 26, 21, 16
	RGB 07, 07, 07

Unknown_16cfb9:
	RGB 31, 31, 31
	RGB 18, 05, 02
	RGB 27, 11, 12
	RGB 07, 07, 07
