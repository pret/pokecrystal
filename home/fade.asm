; Functions to fade the screen in and out.

RotateFourPalettesRight::
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_00
	ld b, 4
	jr RotatePalettesRight

.dmg
	ld hl, IncGradGBPalTable_08
	ld b, 4
	jr RotatePalettesRight

RotateThreePalettesRight::
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_05
	ld b, 3
	jr RotatePalettesRight

.dmg
	ld hl, IncGradGBPalTable_13
	ld b, 3
RotatePalettesRight::
; Rotate palettes to the right and fill with loaded colors from the left
; If we're already at the leftmost color, fill with the leftmost color
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
	jr nz, RotatePalettesRight
	ret

RotateFourPalettesLeft::
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_04 - 1
	ld b, 4
	jr RotatePalettesLeft

.dmg
	ld hl, IncGradGBPalTable_12 - 1
	ld b, 4
	jr RotatePalettesLeft

RotateThreePalettesLeft::
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld hl, IncGradGBPalTable_07 - 1
	ld b, 3
	jr RotatePalettesLeft

.dmg
	ld hl, IncGradGBPalTable_15 - 1
	ld b, 3
RotatePalettesLeft::
; Rotate palettes to the left and fill with loaded colors from the right
; If we're already at the rightmost color, fill with the rightmost color
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
	jr nz, RotatePalettesLeft
	ret

IncGradGBPalTable_00:: dc 3,3,3,3, 3,3,3,3, 3,3,3,3
IncGradGBPalTable_01:: dc 3,3,3,2, 3,3,3,2, 3,3,3,2
IncGradGBPalTable_02:: dc 3,3,2,1, 3,3,2,1, 3,3,2,1
IncGradGBPalTable_03:: dc 3,2,1,0, 3,2,1,0, 3,2,1,0

IncGradGBPalTable_04:: dc 3,2,1,0, 3,2,1,0, 3,2,1,0
IncGradGBPalTable_05:: dc 2,1,0,0, 2,1,0,0, 2,1,0,0
IncGradGBPalTable_06:: dc 1,0,0,0, 1,0,0,0, 1,0,0,0

IncGradGBPalTable_07:: dc 0,0,0,0, 0,0,0,0, 0,0,0,0
;                           bgp      obp1     obp2
IncGradGBPalTable_08:: dc 3,3,3,3, 3,3,3,3, 3,3,3,3
IncGradGBPalTable_09:: dc 3,3,3,2, 3,3,3,2, 3,3,2,0
IncGradGBPalTable_10:: dc 3,3,2,1, 3,2,1,0, 3,2,1,0
IncGradGBPalTable_11:: dc 3,2,1,0, 3,1,0,0, 3,2,0,0

IncGradGBPalTable_12:: dc 3,2,1,0, 3,1,0,0, 3,2,0,0
IncGradGBPalTable_13:: dc 2,1,0,0, 2,0,0,0, 2,1,0,0
IncGradGBPalTable_14:: dc 1,0,0,0, 1,0,0,0, 1,0,0,0

IncGradGBPalTable_15:: dc 0,0,0,0, 0,0,0,0, 0,0,0,0
