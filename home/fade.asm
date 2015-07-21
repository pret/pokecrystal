; Functions to fade the screen in and out.


Function48c:: ; 48c
	ld a, [TimeOfDayPal]
	ld b, a
	ld hl, IncGradGBPalTable_11
	ld a, l
	sub b
	ld l, a
	jr nc, .asm_499
	dec h

.asm_499
	ld a, [hli]
	ld [rBGP], a
	ld a, [hli]
	ld [rOBP0], a
	ld a, [hli]
	ld [rOBP1], a
	ret
; 4a3


Function4a3:: ; 4a3
	ld a, [hCGB]
	and a
	jr z, .asm_4af
	ld hl, IncGradGBPalTable_00
	ld b, 4
	jr FadeOut

.asm_4af
	ld hl, IncGradGBPalTable_08
	ld b, 4
	jr FadeOut
; 4b6

FadeToWhite:: ; 4b6
	ld a, [hCGB]
	and a
	jr z, .asm_4c2
	ld hl, IncGradGBPalTable_05
	ld b, 3
	jr FadeOut

.asm_4c2
	ld hl, IncGradGBPalTable_13
	ld b, 3
; 4c7

FadeOut:: ; 4c7
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	ld c, 8
	call DelayFrames
	pop de
	dec b
	jr nz, FadeOut
	ret
; 4dd

Function4dd:: ; 4dd
	ld a, [hCGB]
	and a
	jr z, .asm_4e9
	ld hl, IncGradGBPalTable_04 - 1
	ld b, 4
	jr FadeIn

.asm_4e9
	ld hl, IncGradGBPalTable_12 - 1
	ld b, 4
	jr FadeIn
; 4f0

Function4f0:: ; 4f0
	ld a, [hCGB]
	and a
	jr z, .asm_4fc
	ld hl, IncGradGBPalTable_07 - 1
	ld b, 3
	jr FadeIn

.asm_4fc
	ld hl, IncGradGBPalTable_15 - 1
	ld b, 3
	; fallthrough
; 501

FadeIn:: ; 501
	push de
	ld a, [hld]
	ld d, a
	ld a, [hld]
	ld e, a
	call DmgToCgbObjPals
	ld a, [hld]
	call DmgToCgbBGPals
	ld c, 8
	call DelayFrames
	pop de
	dec b
	jr nz, FadeIn
	ret
; 517


; 517
IncGradGBPalTable_00:: db %11111111, %11111111, %11111111
IncGradGBPalTable_01:: db %11111110, %11111110, %11111110
IncGradGBPalTable_02:: db %11111001, %11111001, %11111001
IncGradGBPalTable_03:: db %11100100, %11100100, %11100100
IncGradGBPalTable_04:: db %11100100, %11100100, %11100100
IncGradGBPalTable_05:: db %10010000, %10010000, %10010000
IncGradGBPalTable_06:: db %01000000, %01000000, %01000000
IncGradGBPalTable_07:: db %00000000, %00000000, %00000000
;                           bgp       obp1       obp2
IncGradGBPalTable_08:: db %11111111, %11111111, %11111111
IncGradGBPalTable_09:: db %11111110, %11111110, %11111000
IncGradGBPalTable_10:: db %11111001, %11100100, %11100100
IncGradGBPalTable_11:: db %11100100, %11010000, %11100000
IncGradGBPalTable_12:: db %11100100, %11010000, %11100000
IncGradGBPalTable_13:: db %10010000, %10000000, %10010000
IncGradGBPalTable_14:: db %01000000, %01000000, %01000000
IncGradGBPalTable_15:: db %00000000, %00000000, %00000000
; 547
