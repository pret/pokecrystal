Function16c000: ; 16c000
	ld a, [hCGB]
	and a
	ret z
	ld a, [$ffea]
	and a
	ret z
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call Function16c108
	callba Function100063
	callba Function100082
	call Function16c031
	callba Function1000a4
	xor a
	ld [$ffea], a
	pop af
	ld [wcfbe], a
	ret
; 16c031

Function16c031: ; 16c031
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wd002], a
	ld [wd003], a
.asm_16c03e
	call DelayFrame
	callba Function10635c
	ld a, [wd002]
	ld hl, Jumptable_16c05c
	rst JumpTable
	call Function16cb2e
	call Function16cbae
	ld a, [wd002]
	cp $ff
	jr nz, .asm_16c03e
	ret
; 16c05c

Jumptable_16c05c: ; 16c05c
	dw Function16c074
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
	dw Function16c081
; 16c074

Function16c074: ; 16c074
	ld a, [wcf64]
	and a
	ret z
	ld [wd002], a
	xor a
	ld [wd003], a
	ret
; 16c081

Function16c081: ; 16c081
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret
; 16c089

Function16c089: ; 16c089
	ld a, $1
	ld [Buffer2], a
	ld [wd1f1], a
	xor a
	ld [hWY], a
	call Function16c0fa
	ld a, [wd002]
	ld [wcf64], a
	ret
; 16c09e

Function16c09e: ; 16c09e
	ld a, [wcf64]
	cp $4
	ret nz
	call Function16c0fa
	ret
; 16c0a8

Function16c0a8: ; 16c0a8
	xor a
	ld [Buffer2], a
	ld [wd1f1], a
	call ClearSprites
	ld a, $90
	ld [hWY], a
	call Function16c0fa
	ret
; 16c0ba

Function16c0ba: ; 16c0ba
	call Function16c943
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret
; 16c0ca

Function16c0ca: ; 16c0ca
	ld a, [wd003]
	cp $28
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call z, Function16c0fa
	ret
; 16c0dc

Function16c0dc: ; 16c0dc
	call Function16ca11
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret
; 16c0ec

Function16c0ec: ; 16c0ec
	call ClearBGPalettes
	call ClearScreen
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret
; 16c0fa

Function16c0fa: ; 16c0fa
	push af
	ld a, [wd002]
	inc a
	ld [wd002], a
	xor a
	ld [wd003], a
	pop af
	ret
; 16c108

Function16c108: ; 16c108
	call DisableLCD
	ld hl, VTiles2
	ld de, GFX_16c173
	lb bc, BANK(GFX_16c173), $68
	call Get2bpp
	call Function16c130
	call Function16c145
	call Function16c15c
	hlbgcoord 0, 0
	call Function16cc73
	call Function16cc02
	xor a
	ld [hBGMapMode], a
	call EnableLCD
	ret
; 16c130

Function16c130: ; 16c130
	ld de, UnknBGPals
	ld hl, Unknown_16c903
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	callba ApplyPals
	ret
; 16c145

Function16c145: ; 16c145
	hlcoord 0, 0
	ld bc, 20
	xor a
	call ByteFill
	ld hl, Tilemap_16c633
	decoord 0, 1
	ld bc, $0154
	call CopyBytes
	ret
; 16c15c

Function16c15c: ; 16c15c
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH
	xor a
	call ByteFill
	ld hl, Tilemap_16c79b
	decoord 0, 1, AttrMap
	ld bc, 17 * SCREEN_WIDTH
	call CopyBytes
	ret
; 16c173

GFX_16c173:
INCBIN "gfx/unknown/16c173.2bpp"

Tilemap_16c633:
INCBIN "gfx/unknown/16c633.tilemap"

Tilemap_16c79b:
INCBIN "gfx/unknown/16c79b.tilemap"

Unknown_16c903:
	RGB 31, 31, 31
	RGB 04, 10, 20
	RGB 16, 19, 25
	RGB 25, 27, 29

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

; 16c943

Function16c943: ; 16c943
	ld a, [wd003]
	and a
	jr nz, .asm_16c95e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, $ff
	ld bc, $0008
	ld hl, UnknBGPals
	call ByteFill
	pop af
	ld [rSVBK], a

.asm_16c95e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16c969
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cabb
	ld d, a
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cadc

.asm_16c991
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cad8
	ld d, a
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cb08

.asm_16c9b9
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cac4
	ld d, a
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cae8

.asm_16c9e1
rept 2
	inc e
endr
	ld a, e
	cp $8
	jr nz, .asm_16c969
	callba ApplyPals
	call SetPalettes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16ca09
	pop af
	ld [rSVBK], a
	ld e, $0
	pop af
	ld [rSVBK], a
	and a
	ret

.asm_16ca09
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 16ca11

Function16ca11: ; 16ca11
	ld a, [wd003]
	and a
	jr nz, .asm_16ca1d
	callba ApplyPals

.asm_16ca1d
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16ca28
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cadc

.asm_16ca48
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cb08

.asm_16ca68
	ld hl, UnknBGPals
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
	ld hl, UnknBGPals
	call Function16cab6
	call Function16cae8

.asm_16ca88
rept 2
	inc e
endr
	ld a, e
	cp $8
	jr nz, .asm_16ca28
	callba ApplyPals
	call SetPalettes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16caae
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	and a
	ret

.asm_16caae
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 16cab6

Function16cab6: ; 16cab6
	ld b, $0
	ld c, e
	add hl, bc
	ret
; 16cabb

Function16cabb: ; 16cabb
	inc hl
	ld a, [hl]
	srl a
	srl a
	and $1f
	ret
; 16cac4

Function16cac4: ; 16cac4
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
; 16cad8

Function16cad8: ; 16cad8
	ld a, [hl]
	and $1f
	ret
; 16cadc

Function16cadc: ; 16cadc
	sla a
	sla a
	ld b, a
	inc hl
	ld a, [hl]
	and $83
	or b
	ld [hl], a
	ret
; 16cae8

Function16cae8: ; 16cae8
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
; 16cb08

Function16cb08: ; 16cb08
	ld b, a
	ld a, [hl]
	and $e0
	or b
	ld [hl], a
	ret
; 16cb0f

Function16cb0f: ; 16cb0f
	xor a
	ld [Buffer1], a
	ld [Buffer2], a
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
; 16cb2e

Function16cb2e: ; 16cb2e
	ld a, [Buffer2]
	and a
	ret z
	call Function16cb40
	ld hl, Unknown_16cb86
	ld de, Sprites
	call Function16cb5d
	ret
; 16cb40

Function16cb40: ; 16cb40
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
; 16cb5d

Function16cb5d: ; 16cb5d
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
; 16cb86

Unknown_16cb86:
	db 7
	db  0,  0, 0, 1
	db  8,  0, 1, 1
	db  8,  8, 2, 0
	db  8, 16, 3, 0
	db 16,  0, 4, 1
	db 16,  8, 5, 0
	db 16, 16, 6, 0
; 16cba3

Function16cba3: ; 16cba3
	xor a
	ld [wd1f1], a
	ld [wd1f2], a
	ld [wd1f3], a
	ret
; 16cbae

Function16cbae: ; 16cbae
	ld a, [wd1f1]
	and a
	ret z
	call Function16cbba
	call Function16cbd1
	ret
; 16cbba

Function16cbba: ; 16cbba
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
; 16cbd1

Function16cbd1: ; 16cbd1
	ld a, [wd1f3]
	ld c, a
	ld b, 0
	ld hl, Unknown_16cbfb
	add hl, bc
	ld a, [hl]
	ld bc, 2
	ld hl, Unknown_16cfa3
	call AddNTimes
	ld de, UnknBGPals + 1 palettes + 4
	ld bc, 2
	ld a, $5
	call FarCopyWRAM
	callba ApplyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 16cbfb

Unknown_16cbfb:
	db 0, 1, 2, 1, 0, 1, 2
; 16cc02

Function16cc02: ; 16cc02
	call Function16cc18
	call Function16cc49
	call Function16cc62
	call Function16cc25
	call Function16cc6e
	call Function16cb0f
	call Function16cba3
	ret
; 16cc18

Function16cc18: ; 16cc18
	ld hl, VTiles1
	ld de, GFX_16cca3
	lb bc, BANK(GFX_16cca3), $2e
	call Get2bpp
	ret
; 16cc25

Function16cc25: ; 16cc25
	ld hl, Unknown_16cfa9
	ld de, UnknBGPals + 1 palettes
	call .CopyPal
	ld hl, Unknown_16cfb1
	ld de, UnknOBPals
	call .CopyPal
	ld hl, Unknown_16cfb9
	ld de, UnknOBPals + 1 palettes
	call .CopyPal
	ret
; 16cc41

.CopyPal: ; 16cc41
	ld bc, 1 palettes
	ld a, $5
	jp FarCopyWRAM
; 16cc49

Function16cc49: ; 16cc49
	hlcoord 4, 15
	ld a, $80
	call Function16cc5a
	hlcoord 4, 16
	ld a, $90
	call Function16cc5a
	ret
; 16cc5a

Function16cc5a: ; 16cc5a
	ld c, $10
.asm_16cc5c
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_16cc5c
	ret
; 16cc62

Function16cc62: ; 16cc62
	hlcoord 0, 15, AttrMap
	ld bc, $0028
	ld a, $1
	call ByteFill
	ret
; 16cc6e

Function16cc6e: ; 16cc6e
	hlbgcoord 0, 0, VBGMap1
	jr Function16cc73

Function16cc73:
	ld a, [rVBK]
	push af
	ld a, $0
	ld [rVBK], a
	push hl
	decoord 0, 0
	call Function16cc90
	pop hl
	ld a, $1
	ld [rVBK], a
	decoord 0, 0, AttrMap
	call Function16cc90
	pop af
	ld [rVBK], a
	ret
; 16cc90

Function16cc90: ; 16cc90
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
; 16cca3

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

; 16cfc1

GFX_16cfc1:
INCBIN "gfx/unknown/16cfc1.2bpp"

Function16d421: ; 16d421
	ld de, GFX_16cfc1
	ld hl, VTiles2
	lb bc, BANK(GFX_16cfc1), $46
	call Get2bpp
	ret
; 16d42e

Function16d42e: ; 16d42e
	ld hl, Tilemap_16d465
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 16d43b

Function16d43b: ; 16d43b
	call LoadStandardMenuDataHeader
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	callba Function16d421
	callba Function16d42e
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	call JoyWaitAorB
	call Call_ExitMenu
	ret
; 16d465

Tilemap_16d465:
INCBIN "gfx/unknown/16d465.tilemap"

Tilemap_16d5cd:
INCBIN "gfx/unknown/16d5cd.tilemap"

Tilemap_16d5f5:
INCBIN "gfx/unknown/16d5f5.tilemap"

_LinkTextbox: ; 16d61d
	ld h, d
	ld l, e
	push bc
	push hl
	call .draw_border
	pop hl
	pop bc

	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $7
.loop
	push bc
	push hl
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	ret
; 16d640

.draw_border: ; 16d640
	push hl
	ld a, $30
	ld [hli], a
	inc a
	call .fill_row
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop3
	push hl
	ld a, $33
	ld [hli], a
	ld a, " "
	call .fill_row
	ld [hl], $34
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop3

	ld a, $35
	ld [hli], a
	ld a, $36
	call .fill_row
	ld [hl], $37
	ret
; 16d66d

.fill_row: ; 16d66d
	ld d, c
.loop4
	ld [hli], a
	dec d
	jr nz, .loop4
	ret
; 16d673

Function16d673: ; 16d673
	call Function16d696
	call Function16d6ae
	callba Function49856
	callba Functionfb60d
	hlcoord 10, 17
	ld de, String_16d68f
	call PlaceString
	ret
; 16d68f

String_16d68f: ; 16d68f
	db "CANCEL@"
; 16d696

Function16d696: ; 16d696
	call Function16d421
	ret
; 16d69a


Function16d69a: ; 16d69a
	ld de, GFX_16cfc1 + $300
	ld hl, VTiles2 tile $76
	lb bc, BANK(GFX_16cfc1), 8
	call Get2bpp
	ret
; 16d6a7

Function16d6a7: ; 16d6a7
	callba Function49811
	ret
; 16d6ae

Function16d6ae: ; 16d6ae
	call Function16d42e
	ld hl, Tilemap_16d5cd
	decoord 0, 0
	ld bc, $0028
	call CopyBytes
	ld hl, Tilemap_16d5f5
	decoord 0, 16
	ld bc, $0028
	call CopyBytes
	ret
; 16d6ca

LinkTextbox: ; 16d6ca
	call _LinkTextbox
	ret
; 16d6ce

Function16d6ce: ; 16d6ce
	call LoadStandardMenuDataHeader
	call Function16d6e1
	callba Function87d
	call Call_ExitMenu
	call WaitBGMap2
	ret
; 16d6e1

Function16d6e1: ; 16d6e1
	hlcoord 4, 10
	ld b, 1
	ld c, 10
	predef Predef_LinkTextbox
	hlcoord 5, 11
	ld de, .Waiting
	call PlaceString
	call WaitBGMap
	call WaitBGMap2
	ld c, $32
	jp DelayFrames
; 16d701

.Waiting: ; 16d701
	db "WAITING..!@"
; 16d70c

Function16d70c: ; 16d70c
	call Function16d725
	call Function16d713
	ret
; 16d713

Function16d713: ; 16d713
	push bc
	push af
	ld a, [hJoyLast]
	and $f0
	ld b, a
	ld a, [hJoyPressed]
	and $f
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret
; 16d725

Function16d725: ; 16d725
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call Function16d734
	pop af
	ld [hBGMapMode], a
	ret
; 16d734

Function16d734: ; 16d734
.asm_16d734
	call Function16d77a
	call Function16d759
	call Function16d76a
	jr nc, .asm_16d758
	callba _2DMenuInterpretJoypad
	jr c, .asm_16d758
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .asm_16d758
	call Function16d713
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .asm_16d734

.asm_16d758
	ret
; 16d759

Function16d759: ; 16d759
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	xor a
	ld [hBGMapMode], a
	ret
; 16d76a

Function16d76a: ; 16d76a
.asm_16d76a
	call RTC
	call Function16d7e7
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .asm_16d76a
	and a
	ret
; 16d77a

Function16d77a: ; 16d77a
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $1f
	jr nz, .asm_16d792
	ld a, [wCursorOffCharacter]
	ld [hl], a
	push hl
	push bc
	ld bc, $000b
	add hl, bc
	ld [hl], a
	pop bc
	pop hl

.asm_16d792
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuFlags3]
	swap a
	and $f
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	dec b
	jr z, .asm_16d7b1
.asm_16d7ad
	add c
	dec b
	jr nz, .asm_16d7ad

.asm_16d7b1
	ld c, $14
	call AddNTimes
	ld a, [w2DMenuFlags3]
	and $f
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .asm_16d7c8
.asm_16d7c4
	add c
	dec b
	jr nz, .asm_16d7c4

.asm_16d7c8
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $1f
	jr z, .asm_16d7de
	ld [wCursorOffCharacter], a
	ld [hl], $1f
	push hl
	push bc
	ld bc, $000b
	add hl, bc
	ld [hl], $1f
	pop bc
	pop hl

.asm_16d7de
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret
; 16d7e7

Function16d7e7: ; 16d7e7
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .asm_16d7f4
	callba PlaySpriteAnimationsAndDelayFrame

.asm_16d7f4
	call JoyTextDelay
	call Function16d713
	and a
	ret z
	scf
	ret
; 16d7fe


