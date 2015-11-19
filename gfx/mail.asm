ReadPartyMonMail: ; b9229
	ld a, [CurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
ReadAnyMail: ; b9237
	push de
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call LoadFontsExtra
	pop de
	push de
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	callba Function1de5c8
	call CloseSRAM
	ld a, c
	ld de, GFX_1de5e6
	or a
	jr z, .asm_b9268
	ld de, GFX_1de9e6
	sub $3
	jr c, .asm_b9268
	ld de, GFX_1dede6

.asm_b9268
	ld hl, VTiles1
	lb bc, BANK(GFX_1de5e6), $80
	call Get1bpp
	pop de
	call Functionb92b8
	call EnableLCD
	call WaitBGMap
	ld a, [wd1ec]
	ld e, a
	callba Function8cb4
	call SetPalettes
	xor a
	ld [hJoyPressed], a
	call Functionb929a
	call ClearBGPalettes
	call DisableLCD
	call LoadStandardFont
	jp EnableLCD
; b929a

Functionb929a: ; b929a
.asm_b929a
	call GetJoypad
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | START
	jr z, .asm_b929a
	and START
	jr nz, .asm_b92a8
	ret

.asm_b92a8
	ld a, [wJumptableIndex]
	push af
	callab Function845d4
	pop af
	ld [wJumptableIndex], a
	jr .asm_b929a
; b92b8

Functionb92b8: ; b92b8
	ld h, d
	ld l, e
	push hl
	ld a, $0
	call GetSRAMBank
	ld de, $2b
	add hl, de
	ld a, [hli]
	ld [Buffer1], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld b, [hl]
	call CloseSRAM
	ld hl, MailGFXPointers
	ld c, 0
.asm_b92d9
	ld a, [hli]
	cp b
	jr z, .asm_b92ea
	cp $ff
	jr z, .asm_b92e6
	inc c
rept 2
	inc hl
endr
	jr .asm_b92d9

.asm_b92e6
	ld hl, MailGFXPointers
	inc hl

.asm_b92ea
	ld a, c
	ld [wd1ec], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	pop bc
	push de
	jp [hl]
.done
	ret
; b92f8

MailGFXPointers: ; b92f8
	dbw FLOWER_MAIL,  LoadFlowerMailGFX
	dbw SURF_MAIL,    LoadSurfMailGFX
	dbw LITEBLUEMAIL, LoadLiteBlueMailGFX
	dbw PORTRAITMAIL, LoadPortraitMailGFX
	dbw LOVELY_MAIL,  LoadLovelyMailGFX
	dbw EON_MAIL,     LoadEonMailGFX
	dbw MORPH_MAIL,   LoadMorphMailGFX
	dbw BLUESKY_MAIL, LoadBlueSkyMailGFX
	dbw MUSIC_MAIL,   LoadMusicMailGFX
	dbw MIRAGE_MAIL,  LoadMirageMailGFX
	db $ff
; b9317

LoadSurfMailGFX: ; b9317
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9d46
	ld c, $40
	call Functionb9915
	ld de, MailLaprasGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b994e
	ld c, $8
	call Functionb9915
	jr Functionb9351

LoadLiteBlueMailGFX: ; b9335
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9dc6
	ld c, $40
	call Functionb9915
	ld de, MailDratiniGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b995e
	ld c, $8
	call Functionb9915

Functionb9351: ; b9351
	ld de, Unknown_b9976
	ld c, $10
	call Functionb9915
	ld c, $10
	call Functionb990c
	ld de, Unknown_b9c3e
	ld c, $40
	call Functionb990c
	ld c, $40
	call Functionb9915
	call Functionb9858
	hlcoord 2, 15
	ld a, $3f
	call Functionb98d4
	ld a, $39
	hlcoord 15, 14
	call Functionb98fc
	ld a, $44
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 15, 11
	call Functionb98ee
	ld a, $4c
	hlcoord 3, 12
	call Functionb98ee
	hlcoord 15, 2
	call Functionb98ee
	ld a, $50
	hlcoord 6, 3
	call Functionb98ee
	ld a, $40
	hlcoord 13, 2
	ld [hli], a
	hlcoord 6, 14
	ld [hl], a
	ld a, $41
	hlcoord 4, 5
	ld [hli], a
	hlcoord 17, 5
	ld [hli], a
	hlcoord 13, 12
	ld [hl], a
	ld a, $42
	hlcoord 9, 2
	ld [hli], a
	hlcoord 14, 5
	ld [hli], a
	hlcoord 3, 10
	ld [hl], a
	ld a, $43
	hlcoord 6, 11
	ld [hli], a
	pop hl
	jp Functionb9803
; b93d2

LoadEonMailGFX: ; b93d2
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld de, Unknown_b998e
	ld c, $8
	call Functionb990c
	ld de, Unknown_b998e
	ld c, $8
	call Functionb990c
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9d76
	ld c, $8
	call Functionb9915
	ld de, MailPikaGFX
	ld c, $30
	call Functionb991e
	ld hl, VTiles2 tile $3d
	ld de, Unknown_b9c9e
	ld c, $20
	call Functionb990c
	ld de, Unknown_b998e
	ld c, $8
	call Functionb9915
	ld a, $31
	hlcoord 0, 0
	call Functionb98a8
	hlcoord 1, 17
	call Functionb98a8
	ld a, $33
	hlcoord 0, 1
	call Functionb98ba
	hlcoord 19, 0
	call Functionb98ba
	hlcoord 2, 15
	ld a, $35
	call Functionb98d4
	inc a
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b944b

LoadLovelyMailGFX: ; b944b
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e26
	ld c, $28
	call Functionb9915
	ld de, MailPoliwagGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b9966
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9c5e
	ld c, $20
	call Functionb9915
	ld de, Unknown_b996e
	ld c, $8
	call Functionb990c
	call Functionb987b
	hlcoord 2, 15
	ld a, $3c
	call Functionb98d4
	ld a, $36
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b9491

Functionb9491: ; b9491
	ld a, $3d
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 16, 2
	call Functionb98ee
	hlcoord 9, 4
	call Functionb98ee
	hlcoord 2, 11
	call Functionb98ee
	hlcoord 6, 12
	call Functionb98ee
	hlcoord 12, 11
	call Functionb98ee
	ld a, $41
	hlcoord 5, 4
	ld [hl], a
	hlcoord 6, 2
	ld [hl], a
	hlcoord 12, 4
	ld [hl], a
	hlcoord 14, 2
	ld [hl], a
	hlcoord 3, 13
	ld [hl], a
	hlcoord 9, 11
	ld [hl], a
	hlcoord 16, 12
	ld [hl], a
	ret
; b94d6

LoadMorphMailGFX: ; b94d6
	push bc
	ld hl, VTiles2 tile $31
	ld bc, $28
	call Functionb97f8
	ld de, Unknown_b9c96
	ld c, 8
	call Functionb9915
	ld de, Unknown_b9c7e
	ld c, 8
	call Functionb9915
	ld de, Unknown_b993e
	ld c, 8
	call Functionb9915
	ld de, Unknown_b997e
	ld c, 8
	call Functionb990c
	ld de, Unknown_b9926
	ld c, 8
	call Functionb9915
	ld de, MailDittoGFX
	ld c, $30
	call Functionb991e
	call Functionb987b
	ld a, $31
	hlcoord 1, 1
	call Functionb98ee
	hlcoord 17, 15
	call Functionb98ee
	hlcoord 1, 3
	ld [hl], a
	hlcoord 3, 1
	ld [hl], a
	hlcoord 16, 16
	ld [hl], a
	hlcoord 18, 14
	ld [hl], a
	ld a, $36
	hlcoord 1, 4
	ld [hl], a
	hlcoord 2, 3
	ld [hl], a
	hlcoord 3, 2
	ld [hl], a
	hlcoord 4, 1
	ld [hl], a
	inc a
	hlcoord 15, 16
	ld [hl], a
	hlcoord 16, 15
	ld [hl], a
	hlcoord 17, 14
	ld [hl], a
	hlcoord 18, 13
	ld [hl], a
	inc a
	hlcoord 2, 15
	ld b, $e
	call Functionb98de
	inc a
	hlcoord 2, 11
	call Functionb98d4
	hlcoord 2, 5
	call Functionb98d4
	inc a
	hlcoord 6, 1
	call Functionb98d0
	hlcoord 1, 16
	call Functionb98d0
	inc a
	hlcoord 3, 13
	call Functionb98fc
	pop hl
	jp Functionb9803
; b9582

LoadBlueSkyMailGFX: ; b9582
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld a, $ff
	ld bc, $10
	call ByteFill
	ld de, Unknown_b992e
	ld c, $8
	call Functionb991e
	ld de, MailDragoniteGFX
	ld c, $b8
	call Functionb991e
	ld de, MailCloudGFX
	ld c, $30
	call Functionb990c
	ld de, Unknown_b9db6
	ld c, $8
	call Functionb990c
	ld de, MailCloudGFX
	ld c, $8
	call Functionb990c
	ld de, Unknown_b9d26
	ld c, $10
	call Functionb990c
	ld de, Unknown_b9d3e
	ld c, $8
	call Functionb990c
	ld a, $31
	hlcoord 0, 0
	call Functionb98dc
	hlcoord 0, 1
	call Functionb98e3
	hlcoord 19, 1
	call Functionb98e3
	inc a
	hlcoord 0, 17
	call Functionb98dc
	inc a
	hlcoord 0, 16
	call Functionb98dc
	inc a
	hlcoord 2, 2
	call Functionb9636
	hlcoord 3, 3
	call Functionb9636
	hlcoord 4, 4
	call Functionb9636
	dec hl
	ld [hl], $7f
	dec a
	hlcoord 15, 14
	call Functionb98ee
	add $4
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	push af
	hlcoord 12, 1
	call Functionb98fc
	pop af
	hlcoord 15, 4
	call Functionb98fc
	inc a
	hlcoord 2, 11
	call Functionb98d4
	inc a
	hlcoord 10, 3
	call Functionb98ee
	pop hl
	jp Functionb9803
; b9636

Functionb9636: ; b9636
	ld b, $6
.asm_b9638
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_b9638
	ret
; b963e

LoadFlowerMailGFX: ; b963e
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9d86
	ld c, $40
	call Functionb990c
	ld de, MailOddishGFX
	ld c, $20
	call Functionb991e
	ld de, Unknown_b9db6
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9cbe
	ld c, $20
	call Functionb990c
	ld c, $20
	call Functionb9915
	call Functionb9858
	hlcoord 2, 15
	ld a, $3d
	call Functionb98d4
	ld a, $39
	hlcoord 16, 13
	call Functionb98ee
	hlcoord 2, 13
	call Functionb98ee
	ld a, $3e
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 5, 3
	call Functionb98ee
	hlcoord 10, 2
	call Functionb98ee
	hlcoord 16, 3
	call Functionb98ee
	hlcoord 5, 11
	call Functionb98ee
	hlcoord 16, 10
	call Functionb98ee
	ld a, $42
	hlcoord 3, 4
	call Functionb98ee
	hlcoord 12, 3
	call Functionb98ee
	hlcoord 14, 2
	call Functionb98ee
	hlcoord 2, 10
	call Functionb98ee
	hlcoord 14, 11
	call Functionb98ee
	pop hl
	jp Functionb9803
; b96ca

LoadPortraitMailGFX: ; b96ca
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e4e
	ld c, $28
	call Functionb9915
	ld de, Unknown_b995e
	ld c, $8
	call Functionb9915
	ld hl, VTiles2 tile $3d
	ld de, Unknown_b9bfe
	ld c, $20
	call Functionb990c
	ld de, Unknown_b9936
	ld c, $8
	call Functionb9915
	call Functionb987b
	hlcoord 8, 15
	ld a, $36
	ld b, $a
	call Functionb98de
	call Functionb9491
	ld a, $1
	ld [UnownLetter], a
	hlcoord 1, 10
	call PrepMonFrontpic
	pop hl
	jp Functionb9803
; b9710

LoadMusicMailGFX: ; b9710
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e06
	ld c, $20
	call Functionb9915
	ld de, Unknown_b993e
	ld c, $10
	call Functionb9915
	ld de, Unknown_b9996
	ld c, $30
	call Functionb991e
	xor a
	ld bc, $10
	call ByteFill
	ld de, Unknown_b9cfe
	ld c, $18
	call Functionb990c
	ld de, Unknown_b9946
	ld c, $8
	call Functionb990c
	ld a, $31
	hlcoord 0, 0
	call Functionb98a8
	hlcoord 1, 17
	call Functionb98a8
	ld a, $33
	hlcoord 0, 1
	call Functionb98ba
	hlcoord 19, 0
	call Functionb98ba
	ld a, $35
	hlcoord 2, 15
	call Functionb989e
	ld a, $37
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b9776

LoadMirageMailGFX: ; b9776
	push bc
	ld hl, VTiles2 tile $31
	ld bc, $28
	call Functionb97f8
	ld de, Unknown_b992e
	ld c, $8
	call Functionb9915
	ld de, MailMewGFX
	ld c, $90
	call Functionb9915
	ld de, Unknown_b9dce
	ld c, $8
	call Functionb990c
	ld de, Unknown_b9df6
	ld c, $8
	call Functionb990c
	call Functionb987b
	ld a, $36
	hlcoord 1, 16
	call Functionb98d8
	inc a
	hlcoord 15, 14
	call Functionb98fc
	inc a
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $3f
	hlcoord 1, 1
	call Functionb98a8
	ld a, $41
	hlcoord 0, 2
	call Functionb98b5
	ld a, $43
	hlcoord 19, 2
	call Functionb98b5
	ld a, $45
	hlcoord 0, 1
	ld [hl], a
	inc a
	hlcoord 19, 1
	ld [hl], a
	inc a
	hlcoord 0, 16
	ld [hl], a
	inc a
	hlcoord 19, 16
	ld [hl], a
	inc a
	hlcoord 2, 5
	call Functionb98d4
	inc a
	hlcoord 2, 11
	call Functionb98d4
	pop hl
	jp Functionb9803
; b97f8

Functionb97f8: ; b97f8
.asm_b97f8
	xor a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_b97f8
	ret
; b9803

Functionb9803: ; b9803
	ld bc, $2f
	ld de, wd002
	ld a, $0
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ld hl, wd023
	ld de, wd050
	ld bc, $a
	call CopyBytes
	ld a, $50
	ld [wd023], a
	ld [wd05a], a
	ld de, wd002
	hlcoord 2, 7
	call PlaceString
	ld de, wd050
	ld a, [de]
	and a
	ret z
	ld a, [wd1ec]
	hlcoord 8, 14
	cp $3
	jr z, .asm_b984b
	hlcoord 6, 14
	cp $6
	jr z, .asm_b984b
	hlcoord 5, 14

.asm_b984b
	jp PlaceString
; b984e

Functionb984e: ; b984e
.asm_b984e
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_b984e
	ret
; b9858

Functionb9858: ; b9858
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Functionb98d8
	inc a
	ld [hli], a
	inc a
	call Functionb98e3
	ld a, $36
	ld [hli], a
	inc a
	call Functionb98d8
	hlcoord 19, 1
	ld a, $35
	call Functionb98e3
	ld a, $38
	ld [hl], a
	ret
; b987b

Functionb987b: ; b987b
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Functionb98d8
	ld [hl], $31
	inc hl
	inc a
	call Functionb98e3
	ld [hl], $31
	inc hl
	inc a
	call Functionb98d8
	hlcoord 19, 1
	ld a, $35
	call Functionb98e3
	ld [hl], $31
	ret
; b989e

Functionb989e: ; b989e
	push af
	ld b, $7
	jr Functionb98ab

Functionb98a3: ; b98a3
	push af
	ld b, $8
	jr Functionb98ab

Functionb98a8: ; b98a8
	push af
	ld b, $9

Functionb98ab: ; b98ab
	ld [hli], a
	inc a
	ld [hli], a
	dec a
	dec b
	jr nz, Functionb98ab
	ld [hl], a
	pop af
	ret
; b98b5

Functionb98b5: ; b98b5
	push af
	ld b, $7
	jr Functionb98bd

Functionb98ba: ; b98ba
	push af
	ld b, $8

Functionb98bd: ; b98bd
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	inc a
	ld [hl], a
	add hl, de
	dec a
	dec b
	jr nz, Functionb98bd
	ld [hl], a
	pop af
	ret
; b98cc

Functionb98cc: ; b98cc
	ld b, $7
	jr Functionb98de

Functionb98d0: ; b98d0
	ld b, $d
	jr Functionb98de

Functionb98d4: ; b98d4
	ld b, $10
	jr Functionb98de

Functionb98d8: ; b98d8
	ld b, $12
	jr Functionb98de

Functionb98dc: ; b98dc
	ld b, $14

Functionb98de: ; b98de
	ld [hli], a
	dec b
	jr nz, Functionb98de
	ret
; b98e3

Functionb98e3: ; b98e3
	ld b, $10
	ld de, SCREEN_WIDTH
.asm_b98e8
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_b98e8
	ret
; b98ee

Functionb98ee: ; b98ee
	push af
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, $13
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop af
	ret
; b98fc

Functionb98fc: ; b98fc
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_HEIGHT
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret
; b990c

Functionb990c: ; b990c
.asm_b990c
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_b990c
	ret
; b9915

Functionb9915: ; b9915
.asm_b9915
	xor a
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_b9915
	ret
; b991e

Functionb991e: ; b991e
.asm_b991e
	ld a, [de]
	inc de
rept 2
	ld [hli], a
endr
	dec c
	jr nz, .asm_b991e
	ret
; b9926

Unknown_b9926: ; b9926
INCBIN "gfx/unknown/0b9926.1bpp"

Unknown_b992e: ; b992e
INCBIN "gfx/unknown/0b992e.1bpp"

Unknown_b9936: ; b9936
INCBIN "gfx/unknown/0b9936.1bpp"

Unknown_b993e: ; b993e
INCBIN "gfx/unknown/0b993e.1bpp"

Unknown_b9946: ; b9946
INCBIN "gfx/unknown/0b9946.1bpp"

Unknown_b994e: ; b994e
INCBIN "gfx/unknown/0b994e.1bpp"

Unknown_b995e: ; b995e
INCBIN "gfx/unknown/0b995e.1bpp"

Unknown_b9966: ; b9966
INCBIN "gfx/unknown/0b9966.1bpp"

Unknown_b996e: ; b996e
INCBIN "gfx/unknown/0b996e.1bpp"

Unknown_b9976: ; b9976
INCBIN "gfx/unknown/0b9976.1bpp"

Unknown_b997e: ; b997e
INCBIN "gfx/unknown/0b997e.1bpp"

Unknown_b998e: ; b998e
INCBIN "gfx/unknown/0b998e.1bpp"

Unknown_b9996: ; b9996
INCBIN "gfx/unknown/0b9996.1bpp"

MailDratiniGFX: ; b99c6
INCBIN "gfx/unknown/0b99c6.1bpp"

MailPoliwagGFX: ; b99f6
INCBIN "gfx/unknown/0b99f6.1bpp"

MailLaprasGFX: ; b9a26
INCBIN "gfx/unknown/0b9a26.1bpp"

MailPikaGFX: ; b9a56
INCBIN "gfx/unknown/0b9a56.1bpp"

MailDittoGFX: ; b9a86
INCBIN "gfx/unknown/0b9a86.1bpp"

MailMewGFX: ; b9ab6
INCBIN "gfx/unknown/0b9ab6.1bpp"

MailDragoniteGFX: ; b9b46
INCBIN "gfx/unknown/0b9b46.1bpp"

MailSentretGFX: ; b9bce
INCBIN "gfx/unknown/0b9bce.1bpp"

Unknown_b9bee: ; b9bee
INCBIN "gfx/unknown/0b9bee.1bpp"

Unknown_b9bfe: ; b9bfe
INCBIN "gfx/unknown/0b9bfe.1bpp"

MailOddishGFX: ; b9c1e
INCBIN "gfx/unknown/0b9c1e.1bpp"

Unknown_b9c3e: ; b9c3e
INCBIN "gfx/unknown/0b9c3e.1bpp"

Unknown_b9c5e: ; b9c5e
INCBIN "gfx/unknown/0b9c5e.1bpp"

Unknown_b9c7e: ; b9c7e
INCBIN "gfx/unknown/0b9c7e.1bpp"

Unknown_b9c96: ; b9c96
INCBIN "gfx/unknown/0b9c96.1bpp"

Unknown_b9c9e: ; b9c9e
INCBIN "gfx/unknown/0b9c9e.1bpp"

Unknown_b9cbe: ; b9cbe
INCBIN "gfx/unknown/0b9cbe.1bpp"

Unknown_b9cde: ; b9cde
INCBIN "gfx/unknown/0b9cde.1bpp"

Unknown_b9cfe: ; b9cfe
INCBIN "gfx/unknown/0b9cfe.1bpp"

MailCloudGFX: ; b9d16
INCBIN "gfx/unknown/0b9d16.1bpp"

Unknown_b9d26: ; b9d26
INCBIN "gfx/unknown/0b9d26.1bpp"

Unknown_b9d3e: ; b9d3e
INCBIN "gfx/unknown/0b9d3e.1bpp"

Unknown_b9d46: ; b9d46
INCBIN "gfx/unknown/0b9d46.1bpp"

Unknown_b9d76: ; b9d76
INCBIN "gfx/unknown/0b9d76.1bpp"

Unknown_b9d86: ; b9d86
INCBIN "gfx/unknown/0b9d86.1bpp"

Unknown_b9db6: ; b9db6
INCBIN "gfx/unknown/0b9db6.1bpp"

Unknown_b9dc6: ; b9dc6
INCBIN "gfx/unknown/0b9dc6.1bpp"

Unknown_b9dce: ; b9dce
INCBIN "gfx/unknown/0b9dce.1bpp"

Unknown_b9df6: ; b9df6
INCBIN "gfx/unknown/0b9df6.1bpp"

Unknown_b9e06: ; b9e06
INCBIN "gfx/unknown/0b9e06.1bpp"

Unknown_b9e26: ; b9e26
INCBIN "gfx/unknown/0b9e26.1bpp"

Unknown_b9e4e: ; b9e4e
INCBIN "gfx/unknown/0b9e4e.1bpp"


ItemIsMail: ; b9e76
	ld a, d
	ld hl, .items
	ld de, 1
	jp IsInArray
; b9e80

.items
	db FLOWER_MAIL
	db SURF_MAIL
	db LITEBLUEMAIL
	db PORTRAITMAIL
	db LOVELY_MAIL
	db EON_MAIL
	db MORPH_MAIL
	db BLUESKY_MAIL
	db MUSIC_MAIL
	db MIRAGE_MAIL
	db $ff
; b9e8b
