ColorTest: ; 818ac
; A debug menu to test monster and trainer palettes at runtime.

	ld a, [hCGB]
	and a
	jr nz, .asm_818b5
	ld a, [hSGB]
	and a
	ret z

.asm_818b5
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call DisableLCD
	call Function81948
	call Function8197c
	call Function819a7
	call Function818f4
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wJumptableIndex], a
	ld [wcf66], a
	ld [wd003], a
.asm_818de
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_818f0
	call Function81a74
	call Function81f5e
	call DelayFrame
	jr .asm_818de

.asm_818f0
	pop af
	ld [hInMenu], a
	ret
; 818f4

Function818f4: ; 818f4
	ld a, [wd002]
	and a
	jr nz, Function81911
	ld hl, PokemonPalettes

Function818fd: ; 818fd
	ld de, OverworldMap
	ld c, NUM_POKEMON + 1
.asm_81902
	push bc
	push hl
	call Function81928
	pop hl
	ld bc, 8
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_81902
	ret

Function81911: ; 81911
	ld hl, TrainerPalettes
	ld de, OverworldMap
	ld c, NUM_TRAINER_CLASSES
.asm_81919
	push bc
	push hl
	call Function81928
	pop hl
	ld bc, 4
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_81919
	ret
; 81928

Function81928: ; 81928
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	ret
; 81948

Function81948: ; 81948
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	call ClearSprites
	ret
; 8197c

Function8197c: ; 8197c
	ld hl, DebugColorTestGFX + $10
	ld de, VTiles2 tile $6a
	ld bc, $160
	call CopyBytes
	ld hl, DebugColorTestGFX
	ld de, VTiles0
	ld bc, $10
	call CopyBytes
	call LoadStandardFont
	ld hl, VTiles1
	lb bc, 8, 0
.asm_8199d
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_8199d
	ret
; 819a7

Function819a7: ; 819a7
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_819f4
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	ld a, $80
	ld [rBGPI], a
	ld hl, Palette_819f4
	ld c, $40
	xor a
.asm_819c8
	ld [rBGPD], a
	dec c
	jr nz, .asm_819c8
	ld a, $80
	ld [rOBPI], a
	ld hl, Palette_81a34
	ld c, $40
.asm_819d6
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .asm_819d6
	ld a, $94
	ld [wc608], a
	ld a, $52
	ld [wc608 + 1], a
	ld a, $4a
	ld [wc608 + 2], a
	ld a, $29
	ld [wc608 + 3], a
	pop af
	ld [rSVBK], a
	ret
; 819f4

Palette_819f4: ; 819f4
	; white
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	; red
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 00, 00, 00

	; green
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 00, 00

	; blue
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

Palette_81a34: ; 81a34
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	; red
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 00, 00, 00

	; green
	RGB 31, 31, 31
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 00, 00

	; blue
	RGB 31, 31, 31
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 00
; 81a74

Function81a74: ; 81a74
	call JoyTextDelay
	ld a, [wJumptableIndex]
	cp $4
	jr nc, .asm_81a8b
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .asm_81a9a
	ld a, [hl]
	and START
	jr nz, .asm_81aab

.asm_81a8b
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_81acf
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_81a9a
	call Function81eca
	call Function81ac3
	ld e, a
	ld a, [wcf66]
	inc a
	cp e
	jr c, .asm_81aba
	xor a
	jr .asm_81aba

.asm_81aab
	call Function81eca
	ld a, [wcf66]
	dec a
	cp $ff
	jr nz, .asm_81aba
	call Function81ac3
	dec a

.asm_81aba
	ld [wcf66], a
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81ac3

Function81ac3: ; 81ac3
; Looping back around the pic set.
	ld a, [wd002]
	and a
	jr nz, .asm_81acc
	ld a, NUM_POKEMON ; CELEBI
	ret

.asm_81acc
	ld a, NUM_TRAINER_CLASSES - 1 ; MYSTICALMAN
	ret
; 81acf

Jumptable_81acf: ; 81acf
	dw Function81adb
	dw Function81c18
	dw Function81c33
	dw Function81cc2
	dw Function81d8e
	dw Function81daf
; 81adb

Function81adb: ; 81adb
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $6f
	call ByteFill
	hlcoord 1, 3
	lb bc, 7, 18
	ld a, $6c
	call Bank20_FillBoxWithByte
	hlcoord 11, 0
	lb bc, 2, 3
	ld a, $6d
	call Bank20_FillBoxWithByte
	hlcoord 16, 0
	lb bc, 2, 3
	ld a, $6e
	call Bank20_FillBoxWithByte
	call Function81bc0
	call Function81bf4
	ld a, [wcf66]
	inc a
	ld [CurPartySpecies], a
	ld [wd265], a
	hlcoord 0, 1
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wd002]
	and a
	jr nz, .asm_81b7a
	ld a, $1
	ld [UnownLetter], a
	call GetPokemonName
	hlcoord 4, 1
	call PlaceString
	xor a
	ld [wBoxAlignment], a
	hlcoord 12, 3
	call _PrepMonFrontpic
	ld de, VTiles2 tile $31
	predef GetBackpic
	ld a, $31
	ld [hGraphicStartTile], a
	hlcoord 2, 4
	lb bc, 6, 6
	predef PlaceGraphic
	ld a, [wd003]
	and a
	jr z, .asm_81b66
	ld de, String_81baf
	jr .asm_81b69

.asm_81b66
	ld de, String_81bb4

.asm_81b69
	hlcoord 7, 17
	call PlaceString
	hlcoord 0, 17
	ld de, String_81bb9
	call PlaceString
	jr .asm_81ba9

.asm_81b7a
	ld a, [wd265]
	ld [TrainerClass], a
	callab GetTrainerAttributes
	ld de, StringBuffer1
	hlcoord 4, 1
	call PlaceString
	ld de, VTiles2
	callab GetTrainerPic
	xor a
	ld [TempEnemyMonSpecies], a
	ld [hGraphicStartTile], a
	hlcoord 2, 3
	lb bc, 7, 7
	predef PlaceGraphic

.asm_81ba9
	ld a, $1
	ld [wJumptableIndex], a
	ret
; 81baf

String_81baf: db "レア", $6f, $6f, "@" ; rare (shiny)
String_81bb4: db "ノーマル@" ; normal
String_81bb9: db $7a, "きりかえ▶@" ; (A) switches
; 81bc0

Function81bc0: ; 81bc0
	decoord 0, 11, AttrMap
	hlcoord 2, 11
	ld a, $1
	call Function81bde
	decoord 0, 13, AttrMap
	hlcoord 2, 13
	ld a, $2
	call Function81bde
	decoord 0, 15, AttrMap
	hlcoord 2, 15
	ld a, $3

Function81bde: ; 81bde
	push af
	ld a, $6a
	ld [hli], a
	ld bc, $f
	ld a, $6b
	call ByteFill
	ld l, e
	ld h, d
	pop af
	ld bc, $28
	call ByteFill
	ret
; 81bf4

Function81bf4: ; 81bf4
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, OverworldMap
	add hl, de
	ld de, wc608
	ld bc, 4
	call CopyBytes
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ld de, wc608
	call Function81ea5
	ret
; 81c18

Function81c18: ; 81c18
	ld a, [hCGB]
	and a
	jr z, .asm_81c2a
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.asm_81c2a
	call WaitBGMap
	ld a, $2
	ld [wJumptableIndex], a
	ret
; 81c33

Function81c33: ; 81c33
	ld a, [hCGB]
	and a
	jr z, .asm_81c69
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld de, wc608
	ld c, $1
	call Function81ee3
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7
	ld a, $1
	ld [hCGBPalUpdate], a
	ld a, $3
	ld [wJumptableIndex], a
	pop af
	ld [rSVBK], a
	ret

.asm_81c69
	ld hl, wSGBPals
	ld a, $1
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	ld a, [wc608]
	ld [hli], a
	ld a, [wc608 + 1]
	ld [hli], a
	ld a, [wc608 + 2]
	ld [hli], a
	ld a, [wc608 + 3]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wSGBPals
	call Function81f0c
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7
	ld a, $3
	ld [wJumptableIndex], a
	ret
; 81ca7

Function81ca7: ; 81ca7
	inc hl
	inc hl
	inc hl
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a
	call Function81cbc
	inc de
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a

Function81cbc: ; 81cbc
	and $f
	add $70
	ld [hld], a
	ret
; 81cc2

Function81cc2: ; 81cc2
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_81cdf
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .asm_81ce5
	ld a, [wcf64]
	and $3
	ld e, a
	ld d, 0
	ld hl, Jumptable_81d02
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_81cdf
	ld a, $4
	ld [wJumptableIndex], a
	ret

.asm_81ce5
	ld a, [wd002]
	and a
	ret nz
	ld a, [wd003]
	xor $4
	ld [wd003], a
	ld c, a
	ld b, 0
	ld hl, PokemonPalettes
	add hl, bc
	call Function818fd
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81d02

Jumptable_81d02: ; 81d02
	dw Function81d0a
	dw Function81d34
	dw Function81d46
	dw Function81d58
; 81d0a

Function81d0a: ; 81d0a
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_81d1d
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_81d28
	ret

.asm_81d1d
	xor a
	ld [wcf65], a
	ld de, wc608
	call Function81ea5
	ret

.asm_81d28
	ld a, $1
	ld [wcf65], a
	ld de, wc608 + 2
	call Function81ea5
	ret

Function81d34: ; 81d34
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 10
	jr Function81d63

Function81d46: ; 81d46
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 11
	jr Function81d63

Function81d58: ; 81d58
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 12

Function81d63: ; 81d63
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, Function81d70
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, Function81d77
	ret

Function81d70: ; 81d70
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr Function81d7b

Function81d77: ; 81d77
	ld a, [hl]
	and a
	ret z
	dec [hl]

Function81d7b: ; 81d7b
	call Function81e67
	ld a, $2
	ld [wJumptableIndex], a
	ret

Function81d84: ; 81d84
	ld hl, wcf64
	dec [hl]
	ret

Function81d89: ; 81d89
	ld hl, wcf64
	inc [hl]
	ret
; 81d8e

Function81d8e: ; 81d8e
	hlcoord 0, 10
	ld bc, $a0
	ld a, $6f
	call ByteFill
	hlcoord 2, 12
	ld de, String_81fcd
	call PlaceString
	xor a
	ld [wd004], a
	call Function81df4
	ld a, $5
	ld [wJumptableIndex], a
	ret
; 81daf

Function81daf: ; 81daf
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_81dbb
	call Function81dc7
	ret

.asm_81dbb
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81dc1

Function81dc1: ; 81dc1
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 81dc7

Function81dc7: ; 81dc7
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_81dd5
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_81de2
	ret

.asm_81dd5
	ld a, [wd004]
	cp $3b
	jr z, .asm_81ddf
	inc a
	jr .asm_81ded

.asm_81ddf
	xor a
	jr .asm_81ded

.asm_81de2
	ld a, [wd004]
	and a
	jr z, .asm_81deb
	dec a
	jr .asm_81ded

.asm_81deb
	ld a, $3b

.asm_81ded
	ld [wd004], a
	call Function81df4
	ret
; 81df4

Function81df4: ; 81df4
	hlcoord 10, 11
	call Function81e5e
	hlcoord 10, 12
	call Function81e5e
	hlcoord 10, 13
	call Function81e5e
	hlcoord 10, 14
	call Function81e5e
	ld a, [wd004]
	inc a
	ld [wd265], a
	predef GetTMHMMove
	ld a, [wd265]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	hlcoord 10, 12
	call PlaceString
	ld a, [wd004]
	call Function81e55
	ld [CurItem], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	ld de, String_81e46
	jr nz, .asm_81e3f
	ld de, String_81e4d

.asm_81e3f
	hlcoord 10, 14
	call PlaceString
	ret
; 81e46

String_81e46: db "おぼえられる@" ; can be taught
String_81e4d: db "おぼえられない@" ; cannot be taught
; 81e55

Function81e55: ; 81e55
	cp $32
	jr c, .asm_81e5b
	inc a
	inc a

.asm_81e5b
	add $bf
	ret
; 81e5e

Function81e5e: ; 81e5e
	ld bc, $a
	ld a, $6f
	call ByteFill
	ret
; 81e67

Function81e67: ; 81e67
	ld a, [wc608 + 10]
	and $1f
	ld e, a
	ld a, [wc608 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf65]
	and a
	jr z, .asm_81e9c
	ld a, e
	ld [wc608 + 2], a
	ld a, d
	ld [wc608 + 3], a
	ret

.asm_81e9c
	ld a, e
	ld [wc608], a
	ld a, d
	ld [wc608 + 1], a
	ret
; 81ea5

Function81ea5: ; 81ea5
	ld a, [de]
	and $1f
	ld [wc608 + 10], a
	ld a, [de]
	and $e0
	swap a
	srl a
	ld b, a
	inc de
	ld a, [de]
	and $3
	swap a
	srl a
	or b
	ld [wc608 + 11], a
	ld a, [de]
	and $7c
	srl a
	srl a
	ld [wc608 + 12], a
	ret
; 81eca

Function81eca: ; 81eca
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, OverworldMap
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 4
	call CopyBytes
	ret
; 81ee3

Function81ee3: ; 81ee3
.asm_81ee3
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_81ee3
	ret
; 81efc

Bank20_FillBoxWithByte: ; 81efc
; For some reason, we have another copy of FillBoxWithByte here
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 81f0c

Function81f0c: ; 81f0c
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call Function81f1d
	pop af
	ld [wcfbe], a
	ret
; 81f1d

Function81f1d: ; 81f1d
	ld a, [hl]
	and $7
	ret z
	ld b, a
.asm_81f22
	push bc
	xor a
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld b, $10
.asm_81f2c
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_81f30
	bit 0, d
	ld a, $10
	jr nz, .asm_81f38
	ld a, $20

.asm_81f38
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	rr d
	dec e
	jr nz, .asm_81f30
	dec b
	jr nz, .asm_81f2c
	ld a, $20
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld de, 7000
.asm_81f51
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_81f51
	pop bc
	dec b
	jr nz, .asm_81f22
	ret
; 81f5e

Function81f5e: ; 81f5e
	ld a, $6f
	hlcoord 10, 0
	ld [hl], a
	hlcoord 15, 0
	ld [hl], a
	hlcoord 1, 11
	ld [hl], a
	hlcoord 1, 13
	ld [hl], a
	hlcoord 1, 15
	ld [hl], a
	ld a, [wJumptableIndex]
	cp $3
	jr nz, .asm_81fc9
	ld a, [wcf64]
	and a
	jr z, .asm_81f8d
	dec a
	hlcoord 1, 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], $ed

.asm_81f8d
	ld a, [wcf65]
	and a
	jr z, .asm_81f98
	hlcoord 15, 0
	jr .asm_81f9b

.asm_81f98
	hlcoord 10, 0

.asm_81f9b
	ld [hl], $ed
	ld b, $70
	ld c, $5
	ld hl, Sprites
	ld de, wc608 + 10
	call .asm_81fb7
	ld de, wc608 + 11
	call .asm_81fb7
	ld de, wc608 + 12
	call .asm_81fb7
	ret

.asm_81fb7
	ld a, b
	ld [hli], a
	ld a, [de]
	add a
	add a
	add $18
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $10
	add b
	ld b, a
	inc c
	ret

.asm_81fc9
	call ClearSprites
	ret
; 81fcd

String_81fcd: ; 81fcd
	db   "おわりますか?" ; Are you finished?
	next "はい", $f2, $f2, $f2, $7a ; YES (A)
	next "いいえ",    $f2, $f2, $7b ; NO  (B)
	db   "@"
; 81fe3

DebugColorTestGFX:
INCBIN "gfx/debug/color_test.2bpp"


TilesetColorTest:
	ret
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [hMapAnims], a
	call ClearSprites
	call OverworldTextModeSwitch
	call WaitBGMap2
	xor a
	ld [hBGMapMode], a
	ld de, DebugColorTestGFX + $10
	ld hl, VTiles2 tile $6a
	lb bc, BANK(DebugColorTestGFX), $16
	call Request2bpp
	ld de, DebugColorTestGFX
	ld hl, VTiles1
	lb bc, BANK(DebugColorTestGFX), 1
	call Request2bpp
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $6f
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7
	call ByteFill
	ld de, $15
	ld a, $6c
	call Function821d2
	ld de, $1a
	ld a, $6d
	call Function821d2
	ld de, $1f
	ld a, $6e
	call Function821d2
	ld de, $24
	ld a, $6f
	call Function821d2
	call Function821f4
	call Function8220f
	call WaitBGMap2
	ld [wJumptableIndex], a
	ld a, $40
	ld [hWY], a
	ret
; 821d2

Function821d2: ; 821d2
	hlcoord 0, 0
	call Function821de

Function821d8: ; 821d8
	ld a, [wcf64]
	hlcoord 0, 0, AttrMap

Function821de: ; 821de
	add hl, de
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ret
; 821f4

Function821f4: ; 821f4
	hlcoord 2, 4
	call Function82203
	hlcoord 2, 6
	call Function82203
	hlcoord 2, 8

Function82203: ; 82203
	ld a, $6a
	ld [hli], a
	ld bc, $10 - 1
	ld a, $6b
	call ByteFill
	ret
; 8220f

Function8220f: ; 8220f
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf64]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, UnknBGPals
	add hl, de
	ld de, wc608
	ld bc, 8
	call CopyBytes
	ld de, wc608
	call Function81ea5
	pop af
	ld [rSVBK], a
	ret
; 82236


Function82236: ; 82236
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .loop7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_82299
	call Function822f0
	ret

.loop7
	ld hl, wcf64
	ld a, [hl]
	inc a
	and $7
	cp $7
	jr nz, .asm_82253
	xor a

.asm_82253
	ld [hl], a
	ld de, $15
	call Function821d8
	ld de, $1a
	call Function821d8
	ld de, $1f
	call Function821d8
	ld de, $24
	call Function821d8
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld a, [wcf64]
	ld bc, 8
	call AddNTimes
	ld de, wc608
	ld bc, 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	ld a, $1
	ld [hBGMapMode], a
	ret

.asm_82299
	call ClearSprites
	ld a, [hWY]
	xor $d0
	ld [hWY], a
	ret
; 822a3

Function822a3: ; 822a3
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld a, [wcf64]
	ld bc, 8
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 8
	call CopyBytes
	hlcoord 1, 0
	ld de, wc608
	call Function81ca7
	hlcoord 6, 0
	ld de, wc608 + 2
	call Function81ca7
	hlcoord 11, 0
	ld de, wc608 + 4
	call Function81ca7
	hlcoord 16, 0
	ld de, wc608 + 6
	call Function81ca7
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret
; 822f0

Function822f0: ; 822f0
	ld a, [wcf65]
	and 3
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 82301

.dw ; 82301
	dw Function82309
	dw Function82339
	dw Function8234b
	dw Function8235d
; 82309

Function82309: ; 82309
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_8231c
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_82322
	ret

.asm_8231c
	ld a, [wcf66]
	dec a
	jr .asm_82326

.asm_82322
	ld a, [wcf66]
	inc a

.asm_82326
	and $3
	ld [wcf66], a
	ld e, a
	ld d, $0
	ld hl, wc608
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	call Function81ea5
	ret

Function82339: ; 82338
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 10
	jr Function82368

Function8234b: ; 8234b
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 11
	jr Function82368

Function8235d: ; 8235d
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 12

Function82368: ; 82368
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .asm_82375
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .asm_8237c
	ret

.asm_82375
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr .asm_82380

.asm_8237c
	ld a, [hl]
	and a
	ret z
	dec [hl]

.asm_82380
	call Function82391
	call Function822a3
	ret

Function82387: ; 82387
	ld hl, wcf65
	dec [hl]
	ret

Function8238c: ; 8238c
	ld hl, wcf65
	inc [hl]
	ret
; 82391

Function82391: ; 82391
	ld a, [wc608 + 10]
	and $1f
	ld e, a
	ld a, [wc608 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf66]
	ld c, a
	ld b, $0
	ld hl, wc608
	add hl, bc
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
; 823c6

Function823c6: ; 823c6
	ret

Function823c7: ; 823c7
	ret
; 823c8
