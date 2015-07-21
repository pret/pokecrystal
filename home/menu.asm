; Functions used in displaying and handling menus.


LoadMenuDataHeader:: ; 0x1d35
	call CopyMenuDataHeader
	call Function1c00
	ret

CopyMenuDataHeader:: ; 0x1d3c
	ld de, wcf81
	ld bc, $0010
	call CopyBytes
	ld a, [hROMBank]
	ld [wcf8a], a
	ret
; 0x1d4b

Function1d4b:: ; 1d4b
	ld [wcf88], a
	ret
; 1d4f


MenuTextBox:: ; 1d4f
	push hl
	call LoadMenuTextBox
	pop hl
	jp PrintText
; 1d57

Function1d57:: ; 1d57
	ret
; 1d58

LoadMenuTextBox:: ; 1d58
	ld hl, MenuDataHeader_0x1d5f
	call LoadMenuDataHeader
	ret
; 1d5f

MenuDataHeader_0x1d5f:: ; 1d5f
	db $40 ; tile backup
	db 12, 0 ; start coords
	db 17, 19 ; end coords
	dw VTiles0
	db 0 ; default option
; 1d67

MenuTextBoxBackup:: ; 1d67
	call MenuTextBox
	call WriteBackup
	ret
; 1d6e

Function1d6e:: ; 1d6e
	ld hl, MenuDataHeader_0x1d75
	call LoadMenuDataHeader
	ret
; 1d75

MenuDataHeader_0x1d75:: ; 1d75
	db $40 ; tile backup
	db 0, 0 ; start coords
	db 17, 19 ; end coords
	dw $0000
	db 1 ; default option
; 1d7d

Function1d7d:: ; 1d7d
	call ExitMenu
	ret
; 1d81

InterpretMenu2:: ; 0x1d81
	xor a
	ld [hBGMapMode], a
	call Function1cbb
	call DrawOnMap
	call Function1c89
	call Function321c
	call Function1c66
	ld a, [wcf91]
	bit 7, a
	jr z, .asm_1da7 ; 0x1d98 $d
	call Function1c10
	call Function1bc9
	call Function1ff8
	bit 1, a
	jr z, .asm_1da9 ; 0x1da5 $2
.asm_1da7
	scf
	ret
.asm_1da9
	and a
	ret
; 0x1dab

GetMenu2:: ; 1dab
	call LoadMenuDataHeader
	call InterpretMenu2
	call WriteBackup
	ld a, [wcfa9]
	ret
; 1db8

Function1db8:: ; 0x1db8
	push hl
	push bc
	push af
	ld hl, wcf86
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 2
	inc hl
endr
	pop af
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	pop bc
	pop hl
	ret
; 0x1dcf


YesNoBox:: ; 1dcf
	lb bc, 14, 7

PlaceYesNoBox:: ; 1dd2
	jr _YesNoBox

Function1dd4:: ; 1dd4
	call LoadMenuDataHeader
	jr Function1dfe

_YesNoBox:: ; 1dd9
; Return nc (yes) or c (no).
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	cp $e
	jr nz, .asm_1de9
	ld a, $e
	ld b, a

.asm_1de9
	ld a, b
	ld [wcf83], a
	add $5
	ld [wcf85], a
	ld a, c
	ld [wcf82], a
	add $4
	ld [wcf84], a
	call Function1c00

Function1dfe:: ; 1dfe
	call InterpretMenu2
	push af
	ld c, $f
	call DelayFrames
	call WriteBackup
	pop af
	jr c, .asm_1e16
	ld a, [wcfa9]
	cp 2 ; no
	jr z, .asm_1e16
	and a
	ret

.asm_1e16
	ld a, $2
	ld [wcfa9], a
	scf
	ret
; 1e1d

YesNoMenuDataHeader:: ; 1e1d
	db $40 ; tile backup
	db 5, 10 ; start coords
	db 9, 15 ; end coords
	dw YesNoMenuData2
	db 1 ; default option
; 1e25

YesNoMenuData2:: ; 1e25
	db $c0 ; flags
	db 2
	db "YES@"
	db "NO@"
; 1e2e

Function1e2e:: ; 1e2e
	call Function1e35
	call Function1c00
	ret
; 1e35

Function1e35:: ; 1e35
	push de
	call CopyMenuDataHeader
	pop de
	ld a, [wcf83]
	ld h, a
	ld a, [wcf85]
	sub h
	ld h, a
	ld a, d
	ld [wcf83], a
	add h
	ld [wcf85], a
	ld a, [wcf82]
	ld l, a
	ld a, [wcf84]
	sub l
	ld l, a
	ld a, e
	ld [wcf82], a
	add l
	ld [wcf84], a
	ret
; 1e5d

Function1e5d:: ; 1e5d
	call MenuFunc_1e7f
	call MenuWriteText
	call Function1eff
	call Function1f23
	call Function1bdd
	call Function1ff8
	ret
; 1e70

SetUpMenu:: ; 1e70
	call MenuFunc_1e7f ; ???
	call MenuWriteText
	call Function1eff ; set up selection pointer
	ld hl, wcfa5
	set 7, [hl]
	ret

MenuFunc_1e7f:: ; 0x1e7f
	call Function1c66
	call Function1ebd
	call Function1ea6
	call Function1cbb
	ret

MenuWriteText:: ; 0x1e8c
	xor a
	ld [hBGMapMode], a
	call Function1ebd ; sort out the text
	call Function1eda ; actually write it
	call Function2e31
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call Function321c
	pop af
	ld [hOAMUpdate], a
	ret
; 0x1ea6

Function1ea6:: ; 1ea6
	ld a, [wcf83]
	ld c, a
	ld a, [wcf85]
	sub c
	ld c, a
	ld a, [wcf92]
	add a
	inc a
	ld b, a
	ld a, [wcf82]
	add b
	ld [wcf84], a
	ret
; 1ebd

Function1ebd:: ; 1ebd
	ld hl, wcf93
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcf76]
	and a
	jr z, .asm_1ed3
	ld b, a
	ld c, $ff
.asm_1ecc
	ld a, [hli]
	cp c
	jr nz, .asm_1ecc
	dec b
	jr nz, .asm_1ecc

.asm_1ed3
	ld d, h
	ld e, l
	ld a, [hl]
	ld [wcf92], a
	ret
; 1eda

Function1eda:: ; 1eda
	call Function1cfd
	ld bc, $002a
	add hl, bc
.asm_1ee1
	inc de
	ld a, [de]
	cp $ff
	ret z
	ld [MenuSelection], a
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, wcf95
	call Function1efb
	pop hl
	ld de, $0028
	add hl, de
	pop de
	jr .asm_1ee1
; 1efb

Function1efb:: ; 1efb
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1eff

Function1eff:: ; 1eff
	call Function1c10
	ld hl, wcfa8
	ld a, [wcf91]
	bit 3, a
	jr z, .asm_1f0e
	set 3, [hl]

.asm_1f0e
	ld a, [wcf91]
	bit 2, a
	jr z, .asm_1f19
	set 5, [hl]
	set 4, [hl]

.asm_1f19
	ret
; 1f1a


Function1f1a:: ; 1f1a
	call Function1bd3
	ld hl, wcfa8
	and [hl]
	jr Function1f2a
; 1f23

Function1f23:: ; 1f23
	xor a
	ld [wcf73], a
	call Function1bc9
; 1f2a

Function1f2a:: ; 1f2a
	bit 0, a
	jr nz, .asm_1f52
	bit 1, a
	jr nz, .asm_1f6d
	bit 3, a
	jr nz, .asm_1f6d
	bit 4, a
	jr nz, .asm_1f44
	bit 5, a
	jr nz, .asm_1f4b
	xor a
	ld [wcf73], a
	jr .asm_1f57

.asm_1f44
	ld a, $10
	ld [wcf73], a
	jr .asm_1f57

.asm_1f4b
	ld a, $20
	ld [wcf73], a
	jr .asm_1f57

.asm_1f52
	ld a, $1
	ld [wcf73], a

.asm_1f57
	call Function1ebd
	ld a, [wcfa9]
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	ld [MenuSelection], a
	ld a, [wcfa9]
	ld [wcf88], a
	and a
	ret

.asm_1f6d
	ld a, $2
	ld [wcf73], a
	ld a, $ff
	ld [MenuSelection], a
	scf
	ret
; 1f79

Function1f79:: ; 1f79
	push de
	ld hl, wcf97
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MenuSelection]
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret
; 1f8d

Function1f8d:: ; 1f8d
	push de
	ld a, [MenuSelection]
	call Function1fb1
rept 2
	inc hl
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret
; 1f9e

Function1f9e:: ; 1f9e
	call Function1fb1
rept 2
	inc hl
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 1fa7

Function1fa7:: ; 1fa7
	ld a, [MenuSelection]
	call Function1fb1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1fb1

Function1fb1:: ; 1fb1
	ld e, a
	ld d, $0
	ld hl, wcf97
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	add hl, de
endr
	ret
; 1fbf

Function1fbf:: ; 1fbf
	ld hl, wcf71
	call Function1ff0
	ld hl, wcf81
	call Function1ff0
	ld hl, wcf91
	call Function1ff0
	ld hl, wcfa1
	call Function1ff0
	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a
	xor a
	ld hl, $dfff
rept 2
	ld [hld], a
endr
	ld a, l
	ld [wcf71], a
	ld a, h
	ld [wcf72], a
	pop af
	ld [rSVBK], a
	ret
; 1ff0

Function1ff0:: ; 1ff0
	ld bc, $0010
	xor a
	call ByteFill
	ret
; 1ff8

Function1ff8:: ; 1ff8
	push af
	and $3
	jr z, .asm_2007
	ld hl, wcf81
	bit 3, [hl]
	jr nz, .asm_2007
	call PlayClickSFX

.asm_2007
	pop af
	ret
; 2009


PlayClickSFX:: ; 2009
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 0x2012

Function2012:: ; 2012
	call MenuTextBox
	call CloseText
	call ExitMenu
	ret
; 201c

Function201c:: ; 201c
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call PlaceString
	pop af
	rst Bankswitch

	ret
; 202a

InterpretMenu:: ; 202a
	ld a, [hROMBank]
	ld [wcf94], a
	callba Function2400e
	ld a, [wcf88]
	ret
; 2039

Function2039:: ; 2039
	ld a, [hROMBank]
	ld [wcf94], a
	callba Function24022
	ld a, [wcf88]
	ret
; 2048

Function2048:: ; 2048
	ld a, [hROMBank]
	ld [wcf94], a
	callba Function2403c
	ld a, [wcf88]
	ret
; 2057

Function2057:: ; 2057
	ld a, [hROMBank]
	push af
	ld a, BANK(Function842db)
	rst Bankswitch

	call Function842db
	pop af
	rst Bankswitch

	ret
; 2063
