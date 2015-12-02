_DummyGame: ; e1e5b (38:5e5b)
	call Functione1e67
	call DelayFrame
.asm_e1e61
	call Functione1ebb
	jr nc, .asm_e1e61
	ret

Functione1e67: ; e1e67 (38:5e67)
	call DisableLCD
	ld b, SCGB_08
	call GetSGBLayout
	callab ClearSpriteAnims
	ld hl, LZ_e2221
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, Unknown_e00ed
	ld de, VTiles0 tile $00
	ld bc, $40
	ld a, BANK(Unknown_e00ed)
	call FarCopyBytes
	ld a, $8
	ld hl, wc300
	ld [hli], a
	ld [hl], $0
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld [rWY], a
	ld [wJumptableIndex], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $e3
	ld [rLCDC], a
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call Functioncf8
	ret

Functione1ebb: ; e1ebb (38:5ebb)
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e1ed0
	call Functione1ed2
	callab PlaySpriteAnimations
	call DelayFrame
	and a
	ret
.asm_e1ed0
	scf
	ret

Functione1ed2: ; e1ed2 (38:5ed2)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_e1ee1
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e1ee1 (38:5ee1)

Jumptable_e1ee1: ; e1ee1
	dw Functione1ef3
	dw Functione1efb
	dw Functione1f1c
	dw Functione1f42
	dw Functione1f61
	dw Functione1f8b
	dw Functione1fba
	dw Functione1fcc
	dw Functione2000
; e1ef3

Functione1ef3: ; e1ef3
	call Functione2152
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e1efb

Functione1efb: ; e1efb
	call ret_e00ed
	jr nc, .asm_e1f06
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.asm_e1f06
	call Functione209d
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wc708], a
	ld hl, wc703
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [wc709], a

Functione1f1c: ; e1f1c
	ld hl, wc708
	ld a, [hl]
	cp $2d
	jr nc, .asm_e1f30
	inc [hl]
	call Functione2183
	xor a
	ld [wc6fd], a
	call Functione2128
	ret

.asm_e1f30
	ld de, $341c
	ld a, $c
	call _InitSpriteAnimStruct
	ld a, $5
	ld [wc702], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e1f42

Functione1f42: ; e1f42
	ld a, [wc702]
	hlcoord 17, 0
	add $f6
	ld [hl], a
	ld hl, wc702
	ld a, [hl]
	and a
	jr nz, .asm_e1f58
	ld a, $7
	ld [wJumptableIndex], a
	ret

.asm_e1f58
	dec [hl]
	xor a
	ld [wcf64], a
	ld hl, wJumptableIndex
	inc [hl]

Functione1f61: ; e1f61
	ld a, [wcf64]
	and a
	ret z
	dec a
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld [wc6fd], a
	ld [wPlayerMinimized], a
	ld a, e
	ld [EnemyScreens], a
	call Functione2183
	call Functione2128
	xor a
	ld [wcf64], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e1f8b

Functione1f8b: ; e1f8b
	ld a, [wcf64]
	and a
	ret z
	dec a
	ld hl, EnemyScreens
	cp [hl]
	ret z
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld [wc6fd], a
	ld [PlayerScreens], a
	ld a, e
	ld [wc701], a
	call Functione2183
	call Functione2128
	ld a, $40
	ld [wc708], a
	ld hl, wJumptableIndex
	inc [hl]

Functione1fba: ; e1fba
	ld hl, wc708
	ld a, [hl]
	and a
	jr z, .asm_e1fc3
	dec [hl]
	ret

.asm_e1fc3
	call Functione2010
	ld a, $3
	ld [wJumptableIndex], a
	ret
; e1fcc

Functione1fcc: ; e1fcc
	ld a, [hJoypadPressed]
	and A_BUTTON
	ret z
	xor a
	ld [wc708], a
.asm_e1fd5
	ld hl, wc708
	ld a, [hl]
	cp $2d
	jr nc, .asm_e1ff9
	inc [hl]
	push af
	call Functione2183
	pop af
	push hl
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	pop hl
	cp $ff
	jr z, .asm_e1fd5
	ld [wc6fd], a
	call Functione2128
	jr .asm_e1fd5

.asm_e1ff9
	call WaitPressAorB_BlinkCursor
	ld hl, wJumptableIndex
	inc [hl]

Functione2000: ; e2000
	call ret_e00ed
	jr nc, .asm_e200b
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.asm_e200b
	xor a
	ld [wJumptableIndex], a
	ret
; e2010

Functione2010: ; e2010
	ld hl, wPlayerMinimized
	ld a, [hli]
	cp [hl]
	jr nz, .asm_e2066
	ld a, [EnemyScreens]
	call Functione2183
	call Functione2142
	ld a, [wc701]
	call Functione2183
	call Functione2142
	ld a, [EnemyScreens]
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld [hl], $ff
	ld a, [wc701]
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld [hl], $ff
	ld hl, wc703
.asm_e2044
	ld a, [hli]
	and a
	jr nz, .asm_e2044
	dec hl
	ld a, [wPlayerMinimized]
	ld [hl], a
	ld [wc6fd], a
	ld hl, wc709
	ld e, [hl]
rept 2
	inc [hl]
endr
	ld d, $0
	hlcoord 5, 0
	add hl, de
	call Functione2128
	ld hl, UnknownText_0xe2083
	call PrintText
	ret

.asm_e2066
	xor a
	ld [wc6fd], a
	ld a, [EnemyScreens]
	call Functione2183
	call Functione2128
	ld a, [wc701]
	call Functione2183
	call Functione2128
	ld hl, UnknownText_0xe2098
	call PrintText
	ret
; e2083

UnknownText_0xe2083: ; 0xe2083
	start_asm
; 0xe2084

Functione2084: ; e2084
	push bc
	hlcoord 2, 13
	call Functione2128
	ld hl, UnknownText_0xe2093
	pop bc
rept 3
	inc bc
endr
	ret
; e2093

UnknownText_0xe2093: ; 0xe2093
	; , yeah!
	text_jump UnknownText_0x1c1a5b
	db "@"
; 0xe2098

UnknownText_0xe2098: ; 0xe2098
	; Darn…
	text_jump UnknownText_0x1c1a65
	db "@"
; 0xe209d

Functione209d: ; e209d
	ld hl, wc6d0
	ld bc, $2d
	xor a
	call ByteFill
	call Functione2101
	ld c, $2
	ld b, [hl]
	call Functione20e5
	ld c, $8
	ld b, [hl]
	call Functione20e5
	ld c, $4
	ld b, [hl]
	call Functione20e5
	ld c, $7
	ld b, [hl]
	call Functione20e5
	ld c, $3
	ld b, [hl]
	call Functione20e5
	ld c, $6
	ld b, [hl]
	call Functione20e5
	ld c, $1
	ld b, [hl]
	call Functione20e5
	ld c, $5
	ld hl, wc6d0
	ld b, $2d
.asm_e20db
	ld a, [hl]
	and a
	jr nz, .asm_e20e0
	ld [hl], c

.asm_e20e0
	inc hl
	dec b
	jr nz, .asm_e20db
	ret
; e20e5

Functione20e5: ; e20e5
	push hl
	ld de, wc6d0
.asm_e20e9
	call Random
	and $3f
	cp $2d
	jr nc, .asm_e20e9
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e20e9
	ld [hl], c
	dec b
	jr nz, .asm_e20e9
	pop hl
	inc hl
	ret
; e2101

Functione2101: ; e2101
	ld a, [MenuSelection2]
	dec a
	ld l, a
	ld h, 0
rept 3
	add hl, hl
endr
	ld de, Unknown_e2110
	add hl, de
	ret
; e2110

Unknown_e2110: ; e2110
	db $02, $03, $06, $06, $06, $08, $08, $06
	db $02, $02, $04, $06, $06, $08, $08, $09
	db $02, $02, $02, $04, $07, $08, $08, $0c
; e2128

Functione2128: ; e2128
	ld a, [wc6fd]
	sla a
	sla a
	add $4
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ld c, 3
	call DelayFrames
	ret
; e2142

Functione2142: ; e2142
	ld a, $1
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld c, 3
	call DelayFrames
	ret
; e2152

Functione2152: ; e2152
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $1
	call ByteFill
	hlcoord 0, 0
	ld de, String_e2177
	call PlaceString
	hlcoord 15, 0
	ld de, String_e217d
	call PlaceString
	ld hl, UnknownText_0xe2176
	call PrintText
	ret
; e2176

UnknownText_0xe2176: ; 0xe2176
	db "@"
; 0xe2177

String_e2177: db "とったもの@"
String_e217d: db "あと かい@"
; e2183

Functione2183: ; e2183
	ld d, $0
.asm_e2185
	sub $9
	jr c, .asm_e218c
	inc d
	jr .asm_e2185

.asm_e218c
	add $9
	ld e, a
	hlcoord 1, 2
	ld bc, $28
.asm_e2195
	ld a, d
	and a
	jr z, .asm_e219d
	add hl, bc
	dec d
	jr .asm_e2195

.asm_e219d
	sla e
	add hl, de
	ret
; e21a1

Functione21a1: ; e21a1 (38:61a1)
	ld a, [wJumptableIndex]
	cp $7
	jr nc, .quit
	call JoyTextDelay
	ld hl, hJoypadPressed ; $ffa3
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressed_a
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .pressed_right
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up
	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
	ret

.quit
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ret

.pressed_a
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	ld [wcf64], a
	ret

.pressed_left
	ld hl, $6
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub $10
	ld [hl], a
	ld hl, $c
	add hl, bc
	dec [hl]
	ret

.pressed_right
	ld hl, $6
	add hl, bc
	ld a, [hl]
	cp $80
	ret z
	add $10
	ld [hl], a
	ld hl, $c
	add hl, bc
	inc [hl]
	ret

.pressed_up
	ld hl, $7
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub $10
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld a, [hl]
	sub $9
	ld [hl], a
	ret

.pressed_down
	ld hl, $7
	add hl, bc
	ld a, [hl]
	cp $40
	ret z
	add $10
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld a, [hl]
	add $9
	ld [hl], a
	ret
; e2221 (38:6221)

LZ_e2221: ; e2221
INCBIN "gfx/unknown/0e2221.2bpp.lz"
