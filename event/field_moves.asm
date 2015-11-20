PlayWhirlpoolSound: ; 8c7d4
	call WaitSFX
	ld de, SFX_SURF
	call PlaySFX
	call WaitSFX
	ret
; 8c7e1

BlindingFlash: ; 8c7e1
	callba RotatePalettesRightPalettes
	ld hl, StatusFlags
	set 2, [hl]
	callba Function8c0e5
	callba Function8c001
	ld b, SCGB_09
	call GetSGBLayout
	callba Function49409
	callba RotatePalettesLeftPalettes
	ret
; 8c80a

ShakeHeadbuttTree: ; 8c80a
	callba Function8cf53
	ld de, CutGrassGFX
	ld hl, VTiles1
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, HeadbuttTreeGFX
	ld hl, VTiles1 tile $04
	lb bc, BANK(HeadbuttTreeGFX), 8
	call Request2bpp
	call Function8cad3
	ld a, SPRITE_ANIM_INDEX_1B
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld a, $90
	ld [wc3b5], a
	callba Function8cf7a
	call GetHeadbuttTreeRelativeLocation
	ld a, $20
	ld [wcf64], a
	call WaitSFX
	ld de, SFX_SANDSTORM
	call PlaySFX
.loop
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld a, $90
	ld [wc3b5], a
	callba Function8cf7a
	call DelayFrame
	jr .loop

.done
	call OverworldTextModeSwitch
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	callba Function8cf53
	ld hl, Sprites + $90
	ld bc, $10
	xor a
	call ByteFill
	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $c
	call Get1bpp
	call ReplaceKrisSprite
	ret
; 8c893

HeadbuttTreeGFX: ; 8c893
INCBIN "gfx/unknown/08c893.2bpp"
; 8c913

GetHeadbuttTreeRelativeLocation: ; 8c913
	xor a
	ld [hBGMapMode], a
	ld a, [PlayerDirection]
	and %00001100
	srl a
	ld e, a
	ld d, 0
	ld hl, TreeRelativeLocationTable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, $5
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hld], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 8c938

TreeRelativeLocationTable: ; 8c938
	dwcoord 8,     8 + 2 ; RIGHT
	dwcoord 8,     8 - 2 ; LEFT
	dwcoord 8 - 2, 8     ; DOWN
	dwcoord 8 + 2, 8     ; UP
; 8c940

OWCutAnimation: ; 8c940
	ld a, e
	and $1
	ld [wJumptableIndex], a
	call .LoadCutGFX
	call WaitSFX
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	ld a, $90
	ld [wc3b5], a
	callab Function8cf7a
	call OWCutJumptable
	call DelayFrame
	jr .loop

.finish
	ret
; 8c96d

.LoadCutGFX: ; 8c96d
	callab Function8cf53 ; pointless to farcall
	ld de, CutGrassGFX
	ld hl, VTiles1
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, CutTreeGFX
	ld hl, VTiles1 tile $4
	lb bc, BANK(CutTreeGFX), 4
	call Request2bpp
	ret
; 8c98c

CutTreeGFX: ; c898c
INCBIN "gfx/misc/cut_tree.2bpp"
; c89cc

CutGrassGFX: ; 8c9cc
INCBIN "gfx/misc/cut_grass.2bpp"
; 8ca0c

OWCutJumptable: ; 8ca0c
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8ca1b


.jumptable: ; 8ca1b (23:4a1b)
	dw Function8ca23
	dw Function8ca3c
	dw Function8ca5c
	dw Function8ca64


Function8ca23: ; 8ca23 (23:4a23)
	call Function8cad3
	ld a, SPRITE_ANIM_INDEX_17 ; leaf
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld a, $20
	ld [wcf64], a
	ld hl, wJumptableIndex
rept 2
	inc [hl]
endr
	ret

Function8ca3c: ; 8ca3c (23:4a3c)
	call Function8ca8e
	xor a
	call Function8ca73
	ld a, $10
	call Function8ca73
	ld a, $20
	call Function8ca73
	ld a, $30
	call Function8ca73
	ld a, $20
	ld [wcf64], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function8ca5c: ; 8ca5c (23:4a5c)
	ld a, $1
	ld [hBGMapMode], a
	ld hl, wJumptableIndex
	inc [hl]

Function8ca64: ; 8ca64 (23:4a64)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_8ca6d
	dec [hl]
	ret
.asm_8ca6d
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function8ca73: ; 8ca73 (23:4a73)
	push de
	push af
	ld a, SPRITE_ANIM_INDEX_16 ; fly takeoff
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $80
	ld hl, $e
	add hl, bc
	ld [hl], $4
	pop af
	ld hl, $c
	add hl, bc
	ld [hl], a
	pop de
	ret

Function8ca8e: ; 8ca8e (23:4a8e)
	ld de, 0
	ld a, [wd197]
	bit 0, a
	jr z, .asm_8ca9a
	set 0, e
.asm_8ca9a
	ld a, [wd196]
	bit 0, a
	jr z, .asm_8caa3
	set 1, e
.asm_8caa3
	ld a, [PlayerDirection]
	and $c
	add e
	ld e, a
	ld hl, Unknown_8cab3
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret
; 8cab3 (23:4ab3)

Unknown_8cab3: ; 8cab3
	db $58, $60
	db $48, $60
	db $58, $70
	db $48, $70
	db $58, $40
	db $48, $40
	db $58, $50
	db $48, $50
	db $38, $60
	db $48, $60
	db $38, $50
	db $48, $50
	db $58, $60
	db $68, $60
	db $58, $50
	db $68, $50
; 8cad3

Function8cad3: ; 8cad3 (23:4ad3)
	ld a, [PlayerDirection]
	and $c
	srl a
	ld e, a
	ld d, 0
	ld hl, Unknown_8cae5
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret
; 8cae5 (23:4ae5)

Unknown_8cae5: ; 8cae5
	db $50, $68
	db $50, $48
	db $40, $58
	db $60, $58
; 8caed
