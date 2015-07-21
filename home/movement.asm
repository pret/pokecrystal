Function1b1e:: ; 1b1e
	ld [wd003], a
	xor a
	ld [DefaultFlypoint], a
	ld a, $0
	ld [wd004], a
	ld a, $7
	ld [StartFlypoint], a
	ld a, $d0
	ld [EndFlypoint], a
	ret
; 1b35

Function1b35:: ; 1b35
	ld a, [DefaultFlypoint]
	and a
	ret z
	dec a
	ld [DefaultFlypoint], a
	ret
; 1b3f

Function1b3f:: ; 1b3f
	push hl
	push de
	ld hl, DefaultFlypoint
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, MovementBuffer
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret
; 1b50

Function1b50:: ; 1b50
	push af
	ld a, c
	and a
	jr nz, .asm_1b57
	pop af
	ret

.asm_1b57
	pop af
.asm_1b58
	call Function1b3f
	dec c
	jr nz, .asm_1b58
	ret
; 1b5f

Function1b5f:: ; 1b5f
	push af
	ld a, b
	sub d
	ld h, $2
	jr nc, .asm_1b6a
	dec a
	cpl
	ld h, $3

.asm_1b6a
	ld d, a
	ld a, c
	sub e
	ld l, $1
	jr nc, .asm_1b75
	dec a
	cpl
	ld l, $0

.asm_1b75
	ld e, a
	cp d
	jr nc, .asm_1b7f
	ld a, h
	ld h, l
	ld l, a
	ld a, d
	ld d, e
	ld e, a

.asm_1b7f
	pop af
	ld b, a
	ld a, h
	call Function1b92
	ld c, d
	call Function1b50
	ld a, l
	call Function1b92
	ld c, e
	call Function1b50
	ret
; 1b92

Function1b92:: ; 1b92
	push de
	push hl
	ld l, b
	ld h, 0
rept 2
	add hl, hl
endr
	ld e, a
	ld d, 0
	add hl, de
	ld de, .data_1ba5
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	ret
; 1ba5

.data_1ba5
	db 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
; 1bb1

Function1bb1:: ; 1bb1
	push hl
	push bc
	ld hl, wcfa1
	ld b, $8
.asm_1bb8
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_1bb8
	ld a, $1
rept 2
	ld [hli], a
endr
	xor a
rept 3
	ld [hli], a
endr
	pop bc
	pop hl
	ret
; 1bc9

Function1bc9:: ; 1bc9
	callab Function241a8
	call Function1bdd
	ret
; 1bd3

Function1bd3:: ; 1bd3
	callab Function241ab
	call Function1bdd
	ret
; 1bdd

Function1bdd:: ; 1bdd
	push bc
	push af
	ld a, [$ffa9]
	and $f0
	ld b, a
	ld a, [hJoyPressed]
	and $f
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ret
; 1bee

Function1bee:: ; 1bee
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], $ec
	ret
; 1bf7

Function1bf7:: ; 1bf7
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], $7f
	ret
; 1c00

Function1c00:: ; 1c00
	callab Function24374
	ret
; 1c07

ExitMenu:: ; 0x1c07
	push af
	callab Function243e8
	pop af
	ret

Function1c10:: ; 0x1c10
	callab Function2446d
	ret

WriteBackup:: ; 0x1c17
	push af
	call ExitMenu
	call Function321c
	call DrawOnMap
	pop af
	ret

Function1c23:: ; 0x1c23
	call Function1cfd
	call Function1c30
	call Function1d19
	call Function1c30
	ret
; 0x1c30
