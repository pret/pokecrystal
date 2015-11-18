_SlotMachine:
	ld hl, Options
	set 4, [hl]
	call Function926f7
	call DelayFrame
.asm_926d2
	call Function927af
	jr nc, .asm_926d2
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	call ClearBGPalettes
	callba MobileFn_105fd0
	ld hl, Options
	res 4, [hl]
	ld hl, rLCDC ; $ff40
	res 2, [hl]
	ret

Function926f7: ; 926f7 (24:66f7)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	ld hl, VBGMap0 tile $00
	lb bc, 4, 0
	ld a, $7f
	call ByteFill
	ld b, $5
	call GetSGBLayout
	callab Function8cf53
	ld hl, wc6d0
	ld bc, $48
	xor a
	call ByteFill
	ld hl, Slots2LZ
	ld de, VTiles0 tile $00
	call Decompress
	ld hl, Slots3LZ
	ld de, VTiles0 tile $40
	call Decompress
	ld hl, Slots1LZ
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, Slots2LZ
	ld de, VTiles2 tile $25
	call Decompress
	ld hl, SlotsTilemap
	decoord 0, 0
	ld bc, 20 * 12
	call CopyBytes
	ld hl, rLCDC ; $ff40
	set 2, [hl]
	call EnableLCD
	ld hl, wc6d0
	ld bc, $64
	xor a
	call ByteFill
	call Function92a98
	call Function9279b
	ld a, $7
	ld hl, wc300
	ld [hli], a
	ld [hl], $40
	xor a
	ld [wJumptableIndex], a
	ld a, $ff
	ld [wc709], a
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
	xor a
	ld [wd002], a
	call Random
	and $2a
	ret nz
	ld a, $1
	ld [wd002], a
	ret

Function9279b: ; 9279b (24:679b)
	ld a, $e4
	call DmgToCgbBGPals
	lb de, $e4, $e4
	ld a, [hCGB]
	and a
	jr nz, .asm_927ab
	lb de, $c0, $e4
.asm_927ab
	call DmgToCgbObjPals
	ret

Function927af: ; 927af (24:67af)
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_927d1
	call Function92844
	call Function92b0f
	xor a
	ld [wc3b5], a
	callab Function8cfa8
	call Function927f8
	call Function927d3
	call DelayFrame
	and a
	ret
.asm_927d1
	scf
	ret

Function927d3: ; 927d3 (24:67d3)
	ret
; 927d4 (24:67d4)

Function927d4: ; 927d4
	ld a, [wc6d0]
	and a
	ret nz
	ld a, [wc6e0]
	and a
	ret nz
	ld a, [wc70c]
	and a
	jr nz, .asm_927ea
	ld a, $e4
	call DmgToCgbBGPals
	ret

.asm_927ea
	ld a, [TextDelayFrames]
	and $7
	ret nz
	ld a, [rBGP]
	xor %1100
	call DmgToCgbBGPals
	ret
; 927f8

Function927f8: ; 927f8 (24:67f8)
	hlcoord 5, 1
	ld de, Coins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 11, 1
	ld de, wc711
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret
; 92811 (24:6811)

Function92811: ; 92811
	ld a, [wc709]
	add 0
	daa
	ld e, a
	and $f
	add "0"
	hlcoord 1, 0
	ld [hl], a
	ld a, e
	swap a
	and $f
	add "0"
	hlcoord 0, 0
	ld [hl], a
	ret
; 9282c

Function9282c: ; 9282c
	ld hl, wcf66
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld hl, Sprites + $42
	ld c, $18
.asm_92839
	ld a, [hl]
	xor $20
	ld [hli], a
rept 3
	inc hl
endr
	dec c
	jr nz, .asm_92839
	ret
; 92844

Function92844: ; 92844 (24:6844)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_92853
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 92853 (24:6853)


Jumptable_92853: ; 92853 (24:6853)
	dw Function9287e
	dw Function9288e
	dw Function928c6
	dw Function928d6
	dw Function928e6
	dw Function92900
	dw Function92910
	dw Function9292a
	dw Function9293a
	dw Function92879
	dw Function92879
	dw Function92879
	dw Function92955
	dw Function9296b
	dw Function92987
	dw Function9299e
	dw Function929a4
	dw Function929d9
	dw Function929f0


Function92879: ; 92879 (24:6879)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function9287e: ; 9287e (24:687e)
	call Function92879
	xor a
	ld [wc70b], a
	ld [wc70c], a
	ld a, $ff
	ld [wc70d], a
	ret

Function9288e: ; 9288e (24:688e)
	call Function9307c
	jr nc, .asm_92899
	ld a, $12
	ld [wJumptableIndex], a
	ret
.asm_92899
	call Function92879
	call Function9303f
	call Function93002
	ld a, $20
	ld [wcf64], a
	ld a, $4
	ld [wc6d0], a
	ld [wc6e0], a
	ld [wc6f0], a
	ld a, $4
	ld [wc6d9], a
	ld [wc6e9], a
	ld [wc6f9], a
	call WaitSFX
	ld a, SFX_SLOT_MACHINE_START
	call Function9331e
	ret

Function928c6: ; 928c6 (24:68c6)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_928cf
	dec [hl]
	ret
.asm_928cf
	call Function92879
	xor a
	ld [hJoypadSum], a
	ret

Function928d6: ; 928d6 (24:68d6)
	ld hl, hJoypadSum ; $ffa5
	ld a, [hl]
	and A_BUTTON
	ret z
	call Function92879
	call Function92a2b
	ld [wc6d0], a

Function928e6: ; 928e6 (24:68e6)
	ld a, [wc6d0]
	cp $0
	ret nz
	ld a, SFX_STOP_SLOT
	call Function9331e
	ld bc, wc6d0
	ld de, wc700
	call Function929f6
	call Function92879
	xor a
	ld [hJoypadSum], a

Function92900: ; 92900 (24:6900)
	ld hl, hJoypadSum ; $ffa5
	ld a, [hl]
	and A_BUTTON
	ret z
	call Function92879
	call Function92a2e
	ld [wc6e0], a

Function92910: ; 92910 (24:6910)
	ld a, [wc6e0]
	cp $0
	ret nz
	ld a, SFX_STOP_SLOT
	call Function9331e
	ld bc, wc6e0
	ld de, wc703
	call Function929f6
	call Function92879
	xor a
	ld [hJoypadSum], a

Function9292a: ; 9292a (24:692a)
	ld hl, hJoypadSum ; $ffa5
	ld a, [hl]
	and A_BUTTON
	ret z
	call Function92879
	call Function92a60
	ld [wc6f0], a

Function9293a: ; 9293a (24:693a)
	ld a, [wc6f0]
	cp $0
	ret nz
	ld a, SFX_STOP_SLOT
	call Function9331e
	ld bc, wc6f0
	ld de, wc706
	call Function929f6
	call Function92879
	xor a
	ld [hJoypadSum], a
	ret

Function92955: ; 92955 (24:6955)
	ld a, [wc70d]
	cp $ff
	jr nz, .asm_92963
	call Function92879
	call Function92879
	ret
.asm_92963
	call Function92879
	ld a, $10
	ld [wcf64], a

Function9296b: ; 9296b (24:696b)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_92980
	dec [hl]
	srl a
	ret z
	ld a, [rOBP0]
	xor $ff
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret
.asm_92980
	call Function9279b
	call Function92879
	ret

Function92987: ; 92987 (24:6987)
	xor a
	ld [wc70b], a
	ld [wc70c], a
	ld a, $e4
	call DmgToCgbBGPals
	call Function93124
	xor a
	ld [wcf64], a
	call Function92879
	ret

Function9299e: ; 9299e (24:699e)
	call Function93158
	call Function92879

Function929a4: ; 929a4 (24:69a4)
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	and $1
	ret z
	ld hl, wc711
	ld a, [hli]
	ld d, a
	or [hl]
	jr z, .asm_929d5
	ld e, [hl]
	dec de
	ld [hl], e
	dec hl
	ld [hl], d
	ld hl, Coins
	ld d, [hl]
	inc hl
	ld e, [hl]
	call Function92a04
	jr c, .asm_929c5
	inc de
.asm_929c5
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wcf64]
	and $7
	ret z
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
	ret
.asm_929d5
	call Function92879
	ret

Function929d9: ; 929d9 (24:69d9)
	call Function9304c
	call WaitPressAorB_BlinkCursor
	call Function930e9
	jr c, .asm_929ea
	ld a, $0
	ld [wJumptableIndex], a
	ret
.asm_929ea
	ld a, $12
	ld [wJumptableIndex], a
	ret

Function929f0: ; 929f0 (24:69f0)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function929f6: ; 929f6 (24:69f6)
	push de
	call Function92a12
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Function92a04: ; 92a04 (24:6a04)
	ld a, d
	cp 9999 / $100
	jr c, .asm_92a10
	ld a, e
	cp 9999 % $100
	jr c, .asm_92a10
	scf
	ret
.asm_92a10
	and a
	ret

Function92a12: ; 92a12 (24:6a12)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_92a1c
	ld a, $f
.asm_92a1c
	dec a
	and $f
	ld e, a
	ld d, $0
	ld hl, $1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ret

Function92a2b: ; 92a2b (24:6a2b)
	ld a, $7
	ret

Function92a2e: ; 92a2e (24:6a2e)
	ld a, [wc70a]
	cp $2
	jr c, .asm_92a4e
	ld a, [wc709]
	and a
	jr z, .asm_92a3f
	cp $ff
	jr nz, .asm_92a4e
.asm_92a3f
	call Function92a51
	jr nz, .asm_92a4e
	call Random
	cp $50
	jr nc, .asm_92a4e
	ld a, $a
	ret
.asm_92a4e
	ld a, $8
	ret

Function92a51: ; 92a51 (24:6a51)
	ld a, [wc700]
	and a
	ret z
	ld a, [wc701]
	and a
	ret z
	ld a, [wc702]
	and a
	ret

Function92a60: ; 92a60 (24:6a60)
	ld a, [wc70b]
	and a
	jr z, .asm_92a95
	ld a, [wc70c]
	and a
	jr z, .asm_92a95
	ld a, [wc709]
	and a
	jr nz, .asm_92a84
	call Random
	cp 180
	jr nc, .asm_92a95
	cp 120
	jr nc, .asm_92a92
	cp 60
	jr nc, .asm_92a8f
	ld a, $15
	ret
.asm_92a84
	call Random
	cp $a0
	jr nc, .asm_92a95
	cp $50
	jr nc, .asm_92a92
.asm_92a8f
	ld a, $12
	ret
.asm_92a92
	ld a, $10
	ret
.asm_92a95
	ld a, $9
	ret

Function92a98: ; 92a98 (24:6a98)
	ld bc, wc6d0
	ld hl, $6
	add hl, bc
	ld de, Sprites + $40
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $1
	add hl, bc
	ld de, Unknown_93327
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $8
	add hl, bc
	ld [hl], $30
	call Function92af9
	ld bc, wc6e0
	ld hl, $6
	add hl, bc
	ld de, Sprites + $60
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $1
	add hl, bc
	ld de, Unknown_93339
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $8
	add hl, bc
	ld [hl], $50
	call Function92af9
	ld bc, wc6f0
	ld hl, $6
	add hl, bc
	ld de, Sprites + $80
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $1
	add hl, bc
	ld de, Unknown_9334b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $8
	add hl, bc
	ld [hl], $70
	call Function92af9
	ret

Function92af9: ; 92af9 (24:6af9)
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ld hl, $3
	add hl, bc
	ld [hl], $e
	ld hl, $4
	add hl, bc
	ld [hl], $0
	call Function92b53
	ret

Function92b0f: ; 92b0f (24:6b0f)
	ld bc, wc6d0
	call Function92b22
	ld bc, wc6e0
	call Function92b22
	ld bc, wc6f0
	call Function92b22
	ret

Function92b22: ; 92b22 (24:6b22)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	and $f
	jr nz, .asm_92b2e
	call Function92bd4
.asm_92b2e
	ld hl, $5
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, $4
	add hl, bc
	add [hl]
	ld [hl], a
	and $f
	jr z, Function92b53
	ld hl, $6
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, $8
.asm_92b49
	ld a, [hl]
	add d
	ld [hli], a
rept 3
	inc hl
endr
	dec e
	jr nz, .asm_92b49
	ret

Function92b53: ; 92b53 (24:6b53)
	ld hl, $8
	add hl, bc
	ld a, [hl]
	ld [wc712 + 1], a
	ld a, $50
	ld [wc712 + 2], a
	ld hl, $3
	add hl, bc
	ld e, [hl]
	ld d, $0
	ld hl, $1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call Function92b83
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	cp $f
	jr nz, .asm_92b81
	xor a
.asm_92b81
	ld [hl], a
	ret

Function92b83: ; 92b83 (24:6b83)
	ld hl, $6
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_92b8a
	ld a, [wc712 + 2]
	ld [hli], a
	ld a, [wc712 + 1]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	srl a
	srl a
	set 7, a
	ld [hli], a
	ld a, [wc712 + 2]
	ld [hli], a
	ld a, [wc712 + 1]
	add $8
	ld [hli], a
	ld a, [de]
rept 2
	inc a
endr
	ld [hli], a
	srl a
	srl a
	set 7, a
	ld [hli], a
	inc de
	ld a, [wc712 + 2]
	sub $10
	ld [wc712 + 2], a
	cp $10
	jr nz, .asm_92b8a
	ret
; 92bbe (24:6bbe)

Function92bbe: ; 92bbe
	push hl
	srl a
	srl a
	add Unknown_92bce % $100
	ld l, a
	ld a, 0
	adc Unknown_92bce / $100
	ld h, a
	ld a, [hl]
	pop hl
	ret
; 92bce

Unknown_92bce: ; 92bce
	db 0, 1, 2, 3, 4, 5
; 92bd4

Function92bd4: ; 92bd4 (24:6bd4)
	ld hl, 0
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Jumptable_92be4
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 92be4 (24:6be4)

Jumptable_92be4: ; 92be4
	dw Function92c16
	dw Function92c4c
	dw Function92c17
	dw Function92c1e
	dw Function92c25
	dw Function92c2c
	dw Function92c33
	dw Function92c5e
	dw Function92c86
	dw Function92ca9
	dw Function92cd2
	dw Function92cf8
	dw Function92d13
	dw Function92df7
	dw Function92e10
	dw Function92e31
	dw Function92e47
	dw Function92e64
	dw Function92d20
	dw Function92d4f
	dw Function92d6e
	dw Function92d7e
	dw Function92da4
	dw Function92db3
	dw Function92dca
; 92c16

Function92c16: ; 92c16
	ret
; 92c17

Function92c17: ; 92c17
	ld hl, $5
	add hl, bc
	ld [hl], $10
	ret
; 92c1e

Function92c1e: ; 92c1e
	ld hl, $5
	add hl, bc
	ld [hl], $8
	ret
; 92c25

Function92c25: ; 92c25
	ld hl, $5
	add hl, bc
	ld [hl], $4
	ret
; 92c2c

Function92c2c: ; 92c2c
	ld hl, $5
	add hl, bc
	ld [hl], $2
	ret
; 92c33

Function92c33: ; 92c33
	ld hl, $5
	add hl, bc
	ld [hl], $1
	ret
; 92c3a

Function92c3a: ; 92c3a
	ld hl, $5
	add hl, bc
	ld [hl], $0
	ld hl, 0
	add hl, bc
	ld [hl], $1
	ld hl, $f
	add hl, bc
	ld [hl], $3

Function92c4c: ; 92c4c
	ld hl, $f
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92c56
	dec [hl]
	ret

.asm_92c56
	ld hl, 0
	add hl, bc
	ld a, $0
	ld [hl], a
	ret
; 92c5e

Function92c5e: ; 92c5e
	ld a, [wc709]
	cp $ff
	jr z, .asm_92c72
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92c72
	dec [hl]
	call Function92c76
	ret nz

.asm_92c72
	call Function92c3a
	ret
; 92c76

Function92c76: ; 92c76
	call Function92a12
	ld a, [wc709]
	ld e, a
	ld a, [hli]
	cp e
	ret z
	ld a, [hli]
	cp e
	ret z
	ld a, [hl]
	cp e
	ret
; 92c86

Function92c86: ; 92c86
	call Function92e94
	jr nc, .asm_92c94
	ld a, [wc717]
	ld hl, wc709
	cp [hl]
	jr z, .asm_92ca5

.asm_92c94
	ld a, [wc709]
	cp $ff
	jr z, .asm_92ca5
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92ca5
	dec [hl]
	ret

.asm_92ca5
	call Function92c3a
	ret
; 92ca9

Function92ca9: ; 92ca9
	call Function92f1d
	jr nc, .asm_92cbd
	ld hl, wc709
	cp [hl]
	jr z, .asm_92cce
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.asm_92cbd
	ld a, [wc709]
	cp $ff
	jr z, .asm_92cce
	ld hl, $9
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92cce
	dec [hl]
	ret

.asm_92cce
	call Function92c3a
	ret
; 92cd2

Function92cd2: ; 92cd2
	call Function92e94
	jr nc, .asm_92ce1
	ld a, [wc70c]
	and a
	jr z, .asm_92ce1
	call Function92c3a
	ret

.asm_92ce1
	ld a, SFX_STOP_SLOT
	call Function9331e
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $a
	add hl, bc
	ld [hl], $20
	ld hl, $5
	add hl, bc
	ld [hl], $0
	ret
; 92cf8

Function92cf8: ; 92cf8
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92d02
	dec [hl]
	ret

.asm_92d02
	ld a, SFX_THROW_BALL
	call Function9331e
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $8
	ret
; 92d13

Function92d13: ; 92d13
	call Function92e94
	ret nc
	ld a, [wc70c]
	and a
	ret z
	call Function92c3a
	ret
; 92d20

Function92d20: ; 92d20
	call Function92f1d
	ret c
	ld a, SFX_STOP_SLOT
	call Function9331e
	call Function93316
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $0
	call Function92fc0
	push bc
	push af
	depixel 12, 13
	ld a, SPRITE_ANIM_INDEX_06
	call _InitSpriteAnimStruct
	ld hl, $e
	add hl, bc
	pop af
	ld [hl], a
	pop bc
	xor a
	ld [wcf64], a

Function92d4f: ; 92d4f
	ld a, [wcf64]
	cp $2
	jr z, .asm_92d5b
	cp $1
	jr z, .asm_92d62
	ret

.asm_92d5b
	call Function92f1d
	call Function92c3a
	ret

.asm_92d62
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $8
	ret
; 92d6e

Function92d6e: ; 92d6e
	xor a
	ld [wcf64], a
	ld hl, 0
	add hl, bc
	dec [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $0
	ret
; 92d7e

Function92d7e: ; 92d7e
	call Function92f1d
	ret c
	ld a, SFX_STOP_SLOT
	call Function9331e
	call Function93316
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $0
	push bc
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_07
	call _InitSpriteAnimStruct
	pop bc
	xor a
	ld [wcf64], a
	ret
; 92da4

Function92da4: ; 92da4
	ld a, [wcf64]
	and a
	ret z
	ld hl, 0
	add hl, bc
	inc [hl]
	ld a, $2
	ld [wcf64], a

Function92db3: ; 92db3
	ld a, [wcf64]
	cp $4
	ret c
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $10
	ld hl, $a
	add hl, bc
	ld [hl], $11

Function92dca: ; 92dca
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92dd4
	dec [hl]
	ret

.asm_92dd4
	call Function92f1d
	jr nc, .asm_92de5
	and a
	jr nz, .asm_92de5
	ld a, $5
	ld [wcf64], a
	call Function92c3a
	ret

.asm_92de5
	ld hl, $5
	add hl, bc
	ld [hl], $0
	ld hl, 0
	add hl, bc
rept 2
	dec [hl]
endr
	ld a, $1
	ld [wcf64], a
	ret
; 92df7

Function92df7: ; 92df7
	call Function92f1d
	ret c
	ld a, SFX_STOP_SLOT
	call Function9331e
	call Function93316
	ld hl, 0
	add hl, bc
	inc [hl]
	call Function92fc0
	ld hl, $a
	add hl, bc
	ld [hl], a

Function92e10: ; 92e10
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_92e1f
	call Function92f1d
	call Function92c3a
	ret

.asm_92e1f
	dec [hl]
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $b
	add hl, bc
	ld [hl], $20
	ld hl, $5
	add hl, bc
	ld [hl], $0

Function92e31: ; 92e31
	ld hl, $b
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92e3b
	dec [hl]
	ret

.asm_92e3b
	ld hl, 0
	add hl, bc
	dec [hl]
	ld hl, $5
	add hl, bc
	ld [hl], $8
	ret
; 92e47

Function92e47: ; 92e47
	call Function92f1d
	ret c
	ld a, SFX_STOP_SLOT
	call Function9331e
	call Function93316
	ld hl, $5
	add hl, bc
	ld [hl], $1
	ld hl, 0
	add hl, bc
	inc [hl]
	ld hl, $a
	add hl, bc
	ld [hl], $10

Function92e64: ; 92e64
	ld hl, $a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92e73
	dec [hl]
.asm_92e6d
	ld a, SFX_GOT_SAFARI_BALLS
	call Function9331e
	ret

.asm_92e73
	ld a, [wc709]
	and a
	jr nz, .asm_92e88
	call Function92f1d
	jr nc, .asm_92e6d
	and a
	jr nz, .asm_92e6d
	call Function92c3a
	call WaitSFX
	ret

.asm_92e88
	call Function92f1d
	jr c, .asm_92e6d
	call Function92c3a
	call WaitSFX
	ret
; 92e94

Function92e94: ; 92e94
	xor a
	ld [wc70b], a
	ld [wc70c], a
	call Function92a12
	call Function92fb4
	ld a, [wc70a]
	and 3
	ld e, a
	ld d, 0
	ld hl, Jumptable_92ebd
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_92eb6
	push de
	jp [hl]

.asm_92eb6
	ld a, [wc70b]
	and a
	ret z
	scf
	ret
; 92ebd

Jumptable_92ebd: ; 92ebd
	dw Function92ed4
	dw Function92ed1
	dw Function92ecb
	dw Function92ec5
; 92ec5

Function92ec5: ; 92ec5
	call Function92ee0
	call Function92ef6

Function92ecb: ; 92ecb
	call Function92ed5
	call Function92f01

Function92ed1: ; 92ed1
	call Function92eeb

Function92ed4: ; 92ed4
	ret
; 92ed5

Function92ed5: ; 92ed5
	ld hl, wc70e
	ld a, [EnemyScreens]
	cp [hl]
	call z, Function92f0c
	ret
; 92ee0

Function92ee0: ; 92ee0
	ld hl, wEnemyGoesFirst
	ld a, [wc700]
	cp [hl]
	call z, Function92f0c
	ret
; 92eeb

Function92eeb: ; 92eeb
	ld hl, wEnemyGoesFirst
	ld a, [wc701]
	cp [hl]
	call z, Function92f0c
	ret
; 92ef6

Function92ef6: ; 92ef6
	ld hl, wEnemyGoesFirst
	ld a, [wc702]
	cp [hl]
	call z, Function92f0c
	ret
; 92f01

Function92f01: ; 92f01
	ld hl, wc710
	ld a, [wc702]
	cp [hl]
	call z, Function92f0c
	ret
; 92f0c

Function92f0c: ; 92f0c
	ld [wc717], a
	and a
	jr nz, .asm_92f17
	ld a, $1
	ld [wc70c], a

.asm_92f17
	ld a, $1
	ld [wc70b], a
	ret
; 92f1d

Function92f1d: ; 92f1d
	ld a, $ff
	ld [EffectFailed], a
	call Function92a12
	call Function92fb4
	ld a, [wc70a]
	and 3
	ld e, a
	ld d, 0
	ld hl, Jumptable_92f48
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_92f3d
	push de
	jp [hl]

.asm_92f3d
	ld a, [wc70d]
	cp $ff
	jr nz, .asm_92f46
	and a
	ret

.asm_92f46
	scf
	ret
; 92f48

Jumptable_92f48: ; 92f48
	dw Function92f5f
	dw Function92f5c
	dw Function92f56
	dw Function92f50
; 92f50

Function92f50: ; 92f50
	call Function92f70
	call Function92f90

Function92f56: ; 92f56
	call Function92f60
	call Function92fa0

Function92f5c: ; 92f5c
	call Function92f80

Function92f5f: ; 92f5f
	ret
; 92f60

Function92f60: ; 92f60
	ld hl, wc70e
	ld a, [wc700]
	cp [hl]
	ret nz
	ld hl, wc703
	cp [hl]
	call z, Function92fb0
	ret
; 92f70

Function92f70: ; 92f70
	ld hl, wc710
	ld a, [wc700]
	cp [hl]
	ret nz
	ld hl, wc704
	cp [hl]
	call z, Function92fb0
	ret
; 92f80

Function92f80: ; 92f80
	ld hl, wEnemyGoesFirst
	ld a, [wc701]
	cp [hl]
	ret nz
	ld hl, wc704
	cp [hl]
	call z, Function92fb0
	ret
; 92f90

Function92f90: ; 92f90
	ld hl, wc70e
	ld a, [wc702]
	cp [hl]
	ret nz
	ld hl, wc704
	cp [hl]
	call z, Function92fb0
	ret
; 92fa0

Function92fa0: ; 92fa0
	ld hl, wc710
	ld a, [wc702]
	cp [hl]
	ret nz
	ld hl, wc705
	cp [hl]
	call z, Function92fb0
	ret
; 92fb0

Function92fb0: ; 92fb0
	ld [wc70d], a
	ret
; 92fb4

Function92fb4: ; 92fb4
	ld de, wc70e
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; 92fc0

Function92fc0: ; 92fc0
	ld hl, $3
	add hl, bc
	ld a, [hl]
	push af
	push hl
	call Function92fcf
	pop hl
	pop af
	ld [hl], a
	ld a, e
	ret
; 92fcf

Function92fcf: ; 92fcf
	ld a, [wc709]
	and a
	jr nz, .asm_92fe8
	ld e, $0
.asm_92fd7
	ld hl, $3
	add hl, bc
	inc [hl]
	inc e
	push de
	call Function92f1d
	pop de
	jr nc, .asm_92fd7
	and a
	jr nz, .asm_92fd7
	ret

.asm_92fe8
	call Random
	and $7
	cp $4
	jr c, .asm_92fe8
	ld e, a
.asm_92ff2
	ld a, e
	inc e
	ld hl, $3
	add hl, bc
	add [hl]
	ld [hl], a
	push de
	call Function92f1d
	pop de
	jr c, .asm_92ff2
	ret
; 93002

Function93002: ; 93002 (24:7002)
	ld a, [wc709]
	and a
	ret z
	ld hl, Unknown_93023
	ld a, [ScriptVar]
	and a
	jr z, .asm_93013
	ld hl, Unknown_93031
.asm_93013
	call Random
	ld c, a
.asm_93017
	ld a, [hli]
	cp c
	jr nc, .asm_9301e
	inc hl
	jr .asm_93017
.asm_9301e
	ld a, [hl]
	ld [wc709], a
	ret
; 93023 (24:7023)

Unknown_93023: ; 93023
	db $01, $00
	db $03, $04
	db $0a, $14
	db $14, $10
	db $28, $0c
	db $30, $08
	db $ff, $ff
; 93031

Unknown_93031: ; 93031
	db $02, $00
	db $03, $04
	db $08, $14
	db $10, $10
	db $1e, $0c
	db $50, $08
	db $ff, $ff
; 9303f

Function9303f: ; 9303f (24:703f)
	ld b, $14
	ld a, [wc70a]
	dec a
	jr z, asm_93066
	dec a
	jr z, asm_9305a
	jr asm_9304e

Function9304c: ; 9304c (24:704c)
	ld b, $23
asm_9304e: ; 9304e (24:704e)
	hlcoord 3, 2
	call Function93069
	hlcoord 3, 10
	call Function93069
asm_9305a: ; 9305a (24:705a)
	hlcoord 3, 4
	call Function93069
	hlcoord 3, 8
	call Function93069
asm_93066: ; 93066 (24:7066)
	hlcoord 3, 6

Function93069: ; 93069 (24:7069)
	ld a, b
	ld [hl], a
	ld de, $d
	add hl, de
	ld [hl], a
	ld de, $7
	add hl, de
	inc a
	ld [hl], a
	ld de, $d
	add hl, de
	ld [hl], a
	ret

Function9307c: ; 9307c (24:707c)
	ld hl, UnknownText_0x930c7
	call PrintText
	ld hl, MenuDataHeader_0x930d6
	call LoadMenuDataHeader
	call InterpretMenu2
	call WriteBackup
	ret c
	ld a, [MenuSelection2]
	ld b, a
	ld a, $4
	sub b
	ld [wc70a], a
	ld hl, Coins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .asm_930ad
	ld a, [hl]
	cp c
	jr nc, .asm_930ad
	ld hl, UnknownText_0x930d1
	call PrintText
	jr Function9307c
.asm_930ad
	ld hl, Coins + 1
	ld a, [hl]
	sub c
	ld [hld], a
	jr nc, .asm_930b6
	dec [hl]
.asm_930b6
	call WaitSFX
	ld de, SFX_PAY_DAY
	call PlaySFX
	ld hl, UnknownText_0x930cc
	call PrintText
	and a
	ret
; 930c7 (24:70c7)

UnknownText_0x930c7: ; 0x930c7
	; Bet how many coins?
	text_jump UnknownText_0x1c5049
	db "@"
; 0x930cc

UnknownText_0x930cc: ; 0x930cc
	; Start!
	text_jump UnknownText_0x1c505e
	db "@"
; 0x930d1

UnknownText_0x930d1: ; 0x930d1
	; Not enough coins.
	text_jump UnknownText_0x1c5066
	db "@"
; 0x930d6

MenuDataHeader_0x930d6: ; 0x930d6
	db $40 ; flags
	db 10, 14 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_0x930de
	db 1 ; default option
; 0x930de

MenuData2_0x930de: ; 0x930de
	db $80 ; flags
	db 3 ; items
	db " 3@"
	db " 2@"
	db " 1@"
; 0x930e9

Function930e9: ; 930e9 (24:70e9)
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr nz, .asm_930fd
	ld hl, UnknownText_9311a
	call PrintText
	ld c, 60
	call DelayFrames
	jr .asm_93118
.asm_930fd
	ld hl, UnknownText_9311f
	call PrintText
	call LoadMenuTextBox
	lb bc, 14, 12
	call PlaceYesNoBox
	ld a, [MenuSelection2]
	dec a
	call WriteBackup
	and a
	jr nz, .asm_93118
	and a
	ret
.asm_93118
	scf
	ret
; 9311a (24:711a)

UnknownText_9311a: ; 9311a
	text_jump UnknownText_0x1c5079
	db "@"

UnknownText_9311f: ; 9311f
	text_jump UnknownText_0x1c5092
	db "@"

Function93124: ; 93124 (24:7124)
	ld a, [EffectFailed]
	cp $ff
	jr z, .asm_93151
	srl a
	ld e, a
	ld d, 0
	ld hl, .data_93145
	add hl, de
	ld a, [hli]
	ld [PlayerUsedMoves], a
	ld e, a
	ld a, [hl]
	ld [wc711], a
	ld d, a
	callba MobileFn_105fe3
	ret

.data_93145
	db $2c, $01
	db $32, $00
	db $06, $00
	db $08, $00
	db $0a, $00
	db $0f, $00

.asm_93151
	ld hl, wc711
	xor a
	ld [hli], a
	ld [hl], a
	ret

Function93158: ; 93158 (24:7158)
	ld a, [EffectFailed]
	cp $ff
	jr nz, .asm_9316c
	ld hl, UnknownText_0x931e0
	call PrintText
	callba MobileFn_105fd0
	ret
.asm_9316c
	srl a
	ld e, a
	ld d, 0
	ld hl, Unknown_93195
rept 3
	add hl, de
endr
	ld de, StringBuffer2
	ld bc, $4
	call CopyBytes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .asm_93188
	push de
	jp [hl]
.asm_93188
	ld hl, UnknownText_0x931b9
	call PrintText
	callba MobileFn_105f9f
	ret
; 93195 (24:7195)

Unknown_93195: ; 93195
	db "300@"
	dw Function931e5
	db "50@@"
	dw Function9320b
	db "6@@@"
	dw Function93214
	db "8@@@"
	dw Function93214
	db "10@@"
	dw Function93214
	db "15@@"
	dw Function93214
; 931b9

UnknownText_0x931b9: ; 0x931b9
	start_asm
; 0x931ba

Function931ba: ; 931ba
	ld a, [EffectFailed]
	add $25
	ldcoord_a 2, 13
	inc a
	ldcoord_a 2, 14
	inc a
	ldcoord_a 3, 13
	inc a
	ldcoord_a 3, 14
	hlcoord 18, 17
	ld [hl], $ee
	ld hl, UnknownText_0x931db
rept 4
	inc bc
endr
	ret
; 931db

UnknownText_0x931db: ; 0x931db
	; lined up! Won @  coins!
	text_jump UnknownText_0x1c509f
	db "@"
; 0x931e0

UnknownText_0x931e0: ; 0x931e0
	; Darn!
	text_jump UnknownText_0x1c50bb
	db "@"
; 0x931e5

Function931e5: ; 931e5
	ld a, SFX_2ND_PLACE
	call Function9331e
	call WaitSFX
	ld a, [wd002]
	and a
	jr nz, .asm_931ff
	call Random
	and $14
	ret z
	ld a, $ff
	ld [wc709], a
	ret

.asm_931ff
	call Random
	and $1c
	ret z
	ld a, $ff
	ld [wc709], a
	ret
; 9320b

Function9320b: ; 9320b
	ld a, SFX_3RD_PLACE
	call Function9331e
	call WaitSFX
	ret
; 93214

Function93214: ; 93214
	ld a, SFX_PRESENT
	call Function9331e
	call WaitSFX
	ret
; 9321d

Function9321d: ; 9321d (24:721d)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Jumptable_9322d
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_9322d: ; 9322d (24:722d)
	dw Function93233
	dw Function93259
	dw Function93289


Function93233: ; 93233 (24:7233)
	ld hl, $e
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_93247
	ld a, $2
	ld [wcf64], a
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ret
.asm_93247
	dec [hl]
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $30
	ld hl, $6
	add hl, bc
	ld [hl], $0

Function93259: ; 93259 (24:7259)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_93273
	dec [hl]
	ld e, a
	ld d, $70
	callba Functionce765
	ld a, e
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret
.asm_93273
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld [hl], $2
	ld a, $1
	ld [wcf64], a
	ld a, SFX_PLACE_PUZZLE_PIECE_DOWN
	call Function9331e
	ret

Function93289: ; 93289 (24:7289)
	ld hl, $6
	add hl, bc
	ld a, [hl]
rept 2
	inc [hl]
endr
	cp $48
	jr nc, .asm_932a3
	and $3
	ret nz
	ld hl, $d
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld [hSCY], a
	ret
.asm_932a3
	ld hl, $b
	add hl, bc
	xor a
	ld [hl], a
	ld [hSCY], a
	ret

Function932ac: ; 932ac (24:72ac)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Jumptable_932bc
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_932bc: ; 932bc (24:72bc)
	dw Function932c2
	dw Function932e0
	dw Function932fc


Function932c2: ; 932c2 (24:72c2)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $68
	jr z, .asm_932d6
	and $f
	ret nz
	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ret
.asm_932d6
	ld hl, $b
	add hl, bc
	inc [hl]
	ld a, $1
	ld [wcf64], a

Function932e0: ; 932e0 (24:72e0)
	ld a, [wcf64]
	cp $2
	jr z, .asm_932f1
	cp $5
	ret nz
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ret
.asm_932f1
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $8

Function932fc: ; 932fc (24:72fc)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_93306
	dec [hl]
	ret
.asm_93306
	ld hl, $b
	add hl, bc
	dec [hl]
	push bc
	depixel 12, 13, 0, 4
	ld a, SPRITE_ANIM_INDEX_08
	call _InitSpriteAnimStruct
	pop bc
	ret
; 93316 (24:7316)

Function93316: ; 93316
	push bc
	ld c, 16
	call DelayFrames
	pop bc
	ret
; 9331e

Function9331e: ; 9331e (24:731e)
	push de
	ld e, a
	ld d, 0
	call PlaySFX
	pop de
	ret
; 93327 (24:7327)

Unknown_93327: ; 93327
	db $00, $08, $14, $0c, $10, $00, $08, $14, $0c, $10, $04, $08, $14, $0c, $10, $00, $08, $14
Unknown_93339: ; 93339
	db $00, $0c, $08, $10, $14, $04, $0c, $08, $10, $14, $04, $0c, $08, $10, $14, $00, $0c, $08
Unknown_9334b: ; 9334b
	db $00, $0c, $08, $10, $14, $0c, $08, $10, $14, $0c, $04, $08, $10, $14, $0c, $00, $0c, $08
; 9335d

SlotsTilemap: ; 9335d
INCBIN "gfx/slots.tilemap"
; 9344d

Slots1LZ: ; 9344d
INCBIN "gfx/slots_1.2bpp.lz"
; 935cd

Slots2LZ: ; 935cd
INCBIN "gfx/slots_2.2bpp.lz"
; 9382d

Slots3LZ: ; 9382d
INCBIN "gfx/slots_3.2bpp.lz"
; 93a3d
