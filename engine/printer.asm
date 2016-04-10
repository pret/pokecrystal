Function84000: ; 84000
	ld hl, OverworldMap
	lb bc, 4, 12
	xor a
	call Function842ab
	xor a
	ld [rSB], a
	ld [rSC], a
	ld [wc2d5], a
	ld hl, wc2d4
	set 0, [hl]
	ld a, [GBPrinter]
	ld [wcbfb], a
	xor a
	ld [wJumptableIndex], a
	ret
; 84022

Function84022: ; 84022
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 84031


.Jumptable: ; 84031 (21:4031)

	dw Function84077
	dw Function84143
	dw Function84120
	dw Function84099
	dw Function84180
	dw Function8412e
	dw Function840c5
	dw Function84180
	dw Function84120
	dw Function840de
	dw Function84180
	dw Function84120
	dw Function841a1
	dw Function84063
	dw Function8406d
	dw Function84120
	dw Function84103
	dw Function84071
	dw Function841b0
	dw Function841b3


Function84059: ; 84059 (21:4059)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function8405e: ; 8405e (21:405e)
	ld hl, wJumptableIndex
	dec [hl]
	ret

Function84063: ; 84063 (21:4063)
	xor a
	ld [wca89], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function8406d: ; 8406d (21:406d)
	call Function84059
	ret

Function84071: ; 84071 (21:4071)
	ld a, $1
	ld [wJumptableIndex], a
	ret

Function84077: ; 84077 (21:4077)
	call Function841fb
	ld hl, Unknown_842b7
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld a, [wcf65]
	ld [wca81], a
	call Function84059
	call Function841c3
	ld a, $1
	ld [wcbf8], a
	ret

Function84099: ; 84099 (21:4099)
	call Function841fb
	ld hl, wca81
	ld a, [hl]
	and a
	jr z, Function840c5
	ld hl, Unknown_842c3
	call Function841e2
	call Function84260
	ld a, $80
	ld [wca8e], a
	ld a, $2
	ld [wca8f], a
	call Function84219
	call Function84059
	call Function841c3
	ld a, $2
	ld [wcbf8], a
	ret

Function840c5: ; 840c5 (21:40c5)
	ld a, $6
	ld [wJumptableIndex], a
	ld hl, Unknown_842c9
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	call Function84059
	call Function841c3
	ret

Function840de: ; 840de (21:40de)
	call Function841fb
	ld hl, Unknown_842bd
	call Function841e2
	call Function84249
	ld a, $4
	ld [wca8e], a
	ld a, $0
	ld [wca8f], a
	call Function84219
	call Function84059
	call Function841c3
	ld a, $3
	ld [wcbf8], a
	ret

Function84103: ; 84103 (21:4103)
	call Function841fb
	ld hl, Unknown_842b7
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld a, [wcf65]
	ld [wca81], a
	call Function84059
	call Function841c3
	ret

Function84120: ; 84120 (21:4120)
	ld hl, wca8b
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	call Function84059
	ret

Function8412e: ; 8412e (21:412e)
	ld hl, wca8b
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	ld hl, wca81
	dec [hl]
	call Function8405e
	call Function8405e
	ret

Function84143: ; 84143 (21:4143)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca88]
	cp $ff
	jr nz, .printer_connected
	ld a, [wca89]
	cp $ff
	jr z, .printer_error

.printer_connected
	ld a, [wca88]
	cp $81
	jr nz, .printer_error
	ld a, [wca89]
	cp $0
	jr nz, .printer_error
	ld hl, wc2d4
	set 1, [hl]
	ld a, $5
	ld [wca8a], a
	call Function84059
	ret

.printer_error
	ld a, $ff
	ld [wca88], a
	ld [wca89], a
	ld a, $e
	ld [wJumptableIndex], a
	ret

Function84180: ; 84180 (21:4180)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f0
	jr nz, .asm_8419b
	ld a, [wca89]
	and $1
	jr nz, .asm_84197
	call Function84059
	ret
.asm_84197
	call Function8405e
	ret
.asm_8419b
	ld a, $12
	ld [wJumptableIndex], a
	ret

Function841a1: ; 841a1 (21:41a1)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f3
	ret nz
	call Function84059
	ret

Function841b0: ; 841b0 (21:41b0)
	call Function84059

Function841b3: ; 841b3 (21:41b3)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f0
	ret nz
	xor a
	ld [wJumptableIndex], a
	ret

Function841c3: ; 841c3 (21:41c3)
	ld a, [wc2d5]
	and a
	jr nz, Function841c3
	xor a
	ld [wca8c], a
	ld [wca8d], a
	ld a, $1
	ld [wc2d5], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Function841e2: ; 841e2 (21:41e2)
	ld a, [hli]
	ld [wca82], a
	ld a, [hli]
	ld [wca83], a
	ld a, [hli]
	ld [wca84], a
	ld a, [hli]
	ld [wca85], a
	ld a, [hli]
	ld [wca86], a
	ld a, [hl]
	ld [wca87], a
	ret

Function841fb: ; 841fb (21:41fb)
	xor a
	ld hl, wca82
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld hl, wca86
	ld [hli], a
	ld [hl], a
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld hl, OverworldMap
	ld bc, $280
	call Function842ab
	ret

Function84219: ; 84219 (21:4219)
	ld hl, 0
	ld bc, $4
	ld de, wca82
	call Function8423c
	ld a, [wca8e]
	ld c, a
	ld a, [wca8f]
	ld b, a
	ld de, OverworldMap
	call Function8423c
	ld a, l
	ld [wca86], a
	ld a, h
	ld [wca87], a
	ret

Function8423c: ; 8423c (21:423c)
	ld a, [de]
	inc de
	add l
	jr nc, .asm_84242
	inc h
.asm_84242
	ld l, a
	dec bc
	ld a, c
	or b
	jr nz, Function8423c
	ret

Function84249: ; 84249 (21:4249)
	ld a, $1
	ld [OverworldMap], a
	ld a, [wcbfa]
	ld [wc801], a
	ld a, $e4
	ld [wc802], a
	ld a, [wcbfb]
	ld [wc803], a
	ret

Function84260: ; 84260 (21:4260)
	ld a, [wca81]
	xor $ff
	ld d, a
	ld a, [wcf65]
	inc a
	add d
	ld hl, wca90
	ld de, $28
.asm_84271
	and a
	jr z, .asm_84278
	add hl, de
	dec a
	jr .asm_84271
.asm_84278
	ld e, l
	ld d, h
	ld hl, OverworldMap
	ld c, $28
.asm_8427f
	ld a, [de]
	inc de
	push bc
	push de
	push hl
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $f
	ld d, a
	and $8
	ld a, d
	jr nz, .asm_84297
	or $90
	jr .asm_84299
.asm_84297
	or $80
.asm_84299
	ld d, a
	lb bc, $21, 1
	call Request2bpp
	pop hl
	ld de, $10
	add hl, de
	pop de
	pop bc
	dec c
	jr nz, .asm_8427f
	ret

Function842ab: ; 842ab
	push de
	ld e, a
.asm_842ad
	ld [hl], e
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_842ad
	ld a, e
	pop de
	ret
; 842b7

Unknown_842b7: db  1, 0, $00, 0,  1, 0
Unknown_842bd: db  2, 0, $04, 0,  0, 0
Unknown_842c3: db  4, 0, $80, 2,  0, 0
Unknown_842c9: db  4, 0, $00, 0,  4, 0
Unknown_842cf: db  8, 0, $00, 0,  8, 0 ; unused
Unknown_842d5: db 15, 0, $00, 0, 15, 0 ; unused
; 842db


_PrinterReceive:: ; 842db
	ld a, [wc2d5]
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 842ea


.Jumptable: ; 842ea (21:42ea)

	dw Function8432f
	dw Function84330
	dw Function84339
	dw Function84343
	dw Function8434d
	dw Function84357
	dw Function84361
	dw Function8438b
	dw Function84395
	dw Function8439f
	dw Function843a8
	dw Function843b6
	dw Function84330
	dw Function843c0
	dw Function843c9
	dw Function843c9
	dw Function843c9
	dw Function843c0
	dw Function843c9
	dw Function8439f
	dw Function843a8
	dw Function843e6
	dw Function84330
	dw Function843d2
	dw Function843c9
	dw Function843c9
	dw Function843c9
	dw Function843d2
	dw Function843c9
	dw Function8439f
	dw Function843a8
	dw Function843b6


Function8432a: ; 8432a (21:432a)
	ld hl, wc2d5
	inc [hl]
	ret

Function8432f: ; 8432f (21:432f)
	ret

Function84330: ; 84330 (21:4330)
	ld a, $33
	call Function843db
	call Function8432a
	ret

Function84339: ; 84339 (21:4339)
	ld a, [wca82]
	call Function843db
	call Function8432a
	ret

Function84343: ; 84343 (21:4343)
	ld a, [wca83]
	call Function843db
	call Function8432a
	ret

Function8434d: ; 8434d (21:434d)
	ld a, [wca84]
	call Function843db
	call Function8432a
	ret

Function84357: ; 84357 (21:4357)
	ld a, [wca85]
	call Function843db
	call Function8432a
	ret

Function84361: ; 84361 (21:4361)
	ld hl, wca8e
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .asm_84388
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	ld a, [wca8c]
	ld e, a
	ld a, [wca8d]
	ld d, a
	ld hl, OverworldMap
	add hl, de
	inc de
	ld a, e
	ld [wca8c], a
	ld a, d
	ld [wca8d], a
	ld a, [hl]
	call Function843db
	ret
.asm_84388
	call Function8432a

Function8438b: ; 8438b (21:438b)
	ld a, [wca86]
	call Function843db
	call Function8432a
	ret

Function84395: ; 84395 (21:4395)
	ld a, [wca87]
	call Function843db
	call Function8432a
	ret

Function8439f: ; 8439f (21:439f)
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843a8: ; 843a8 (21:43a8)
	ld a, [rSB]
	ld [wca88], a
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843b6: ; 843b6 (21:43b6)
	ld a, [rSB]
	ld [wca89], a
	xor a
	ld [wc2d5], a
	ret

Function843c0: ; 843c0 (21:43c0)
	ld a, $f
	call Function843db
	call Function8432a
	ret

Function843c9: ; 843c9 (21:43c9)
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843d2: ; 843d2 (21:43d2)
	ld a, $8
	call Function843db
	call Function8432a
	ret

Function843db: ; 843db (21:43db)
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Function843e6: ; 843e6 (21:43e6)
	ld a, [rSB]
	ld [wca89], a
	xor a
	ld [wc2d5], a
	ret

Function843f0: ; 843f0
.asm_843f0
	call JoyTextDelay
	call Function846f6
	jr c, .asm_8440f
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_8440d
	call Function84022
	call Function84757
	call Function84785
	call DelayFrame
	jr .asm_843f0

.asm_8440d
	and a
	ret

.asm_8440f
	scf
	ret
; 84411

Function84411: ; 84411
	xor a
	ld [wc2d4], a
	ld [wc2d5], a
	ret
; 84419

Function84419: ; 84419
	push af
	call Function84000
	pop af
	ld [wcbfa], a
	call Function84728
	ret
; 84425

Function84425: ; 84425
	call ReturnToMapFromSubmenu
	call Function84753
	ret
; 8442c

PrintDexEntry: ; 8442c
	ld a, [wcf65]
	push af
	ld hl, VTiles1
	ld de, FontInversed
	lb bc, BANK(FontInversed), $80
	call Request1bpp
	xor a
	ld [hPrinter], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	call Function84000
	ld a, $10
	ld [wcbfa], a
	callba PrintPage1
	call ClearTileMap
	ld a, $e4
	call DmgToCgbBGPals
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $8
	ld [wcf65], a
	call Function84742
	call Function843f0
	jr c, .asm_8449d
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function84000
	ld a, $3
	ld [wcbfa], a
	callba PrintPage2
	call Function84742
	ld a, $4
	ld [wcf65], a
	call Function843f0

.asm_8449d
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	ld c, $8
.asm_844ae
	call LowVolume
	call DelayFrame
	dec c
	jr nz, .asm_844ae
	pop af
	ld [wcf65], a
	ret
; 844bc

PrintPCBox: ; 844bc (21:44bc)
	ld a, [wcf65]
	push af
	ld a, $9
	ld [wcf65], a
	ld a, e
	ld [wd004], a
	ld a, d
	ld [wd005], a
	ld a, b
	ld [wd006], a
	ld a, c
	ld [wd007], a
	xor a
	ld [hPrinter], a
	ld [wd003], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	xor a
	ld [hBGMapMode], a
	call Function84817
	ld a, $10
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function8486f
	ld a, $0
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function84893
	ld a, $0
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function848b7
	ld a, $3
	call Function84419
	call Function84559
.asm_84545
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret

Function84559: ; 84559 (21:4559)
	call Function84742
	call Function843f0
	ret

PrintUnownStamp: ; 84560
	ld a, [wcf65]
	push af
	xor a
	ld [hPrinter], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	xor a
	ld [hBGMapMode], a
	call LoadTileMapToTempTileMap
	callba Function16dac
	ld a, $0
	call Function84419
	call Call_LoadTempTileMapToTileMap
	call Function84742
	ld a, $9
	ld [wcf65], a
.asm_84597
	call JoyTextDelay
	call Function846f6
	jr c, .asm_845c0
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_845c0
	call Function84022
	ld a, [wJumptableIndex]
	cp $2
	jr nc, .asm_845b5
	ld a, $3
	ld [wca81], a

.asm_845b5
	call Function84757
	call Function84785
	call DelayFrame
	jr .asm_84597

.asm_845c0
	pop af
	ld [hVBlank], a
	call Function84411
	call Call_LoadTempTileMapToTileMap
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	pop af
	ld [wcf65], a
	ret
; 845d4

PrintMail: ; 845d4
	call Function845db
	call Function84425
	ret
; 845db

Function845db: ; 845db
	ld a, [wcf65]
	push af
	xor a
	ld [hPrinter], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	xor a
	ld [hBGMapMode], a
	ld a, $13
	call Function84419
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $9
	ld [wcf65], a
	call Function843f0
	pop af
	ld [hVBlank], a
	call Function84411
	call Function84735
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	pop af
	ld [wcf65], a
	ret
; 8461a

PrintPartymon: ; 8461a
	ld a, [wcf65]
	push af
	xor a
	ld [hPrinter], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	xor a
	ld [hBGMapMode], a
	callba Function1dc381
	ld a, $10
	call Function84419
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $8
	ld [wcf65], a
	call Function84742
	call Function843f0
	jr c, .asm_84671
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	callba Function1dc47b
	ld a, $3
	call Function84419
	ld a, $9
	ld [wcf65], a
	call Function84742
	call Function843f0

.asm_84671
	pop af
	ld [hVBlank], a
	call Function84411
	call Function84735
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret
; 84688

_PrintDiploma: ; 84688
	ld a, [wcf65]
	push af
	callba Function1dd709
	xor a
	ld [hPrinter], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $10
	call Function84419
	call Function84742
	ld a, $9
	ld [wcf65], a
	call Function843f0
	jr c, .asm_846e2
	call Function84411
	ld c, 12
	call DelayFrames
	call LoadTileMapToTempTileMap
	xor a
	ld [hBGMapMode], a
	callba Function1dd7ae
	ld a, $3
	call Function84419
	call Call_LoadTempTileMapToTileMap
	call Function84742
	ld a, $9
	ld [wcf65], a
	call Function843f0

.asm_846e2
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret
; 846f6

Function846f6: ; 846f6
	ld a, [hJoyDown]
	and B_BUTTON
	jr nz, .asm_846fe
	and a
	ret

.asm_846fe
	ld a, [wca80]
	cp $c
	jr nz, .asm_84722
.asm_84705
	ld a, [wc2d5]
	and a
	jr nz, .asm_84705
	ld a, $16
	ld [wc2d5], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
.asm_8471c
	ld a, [wc2d5]
	and a
	jr nz, .asm_8471c

.asm_84722
	ld a, $1
	ld [hPrinter], a
	scf
	ret
; 84728

Function84728: ; 84728
	hlcoord 0, 0
	ld de, wca90
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84735

Function84735: ; 84735
	ld hl, wca90
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84742

Function84742: ; 84742
	xor a
	ld [hJoyReleased], a
	ld [hJoyPressed], a
	ld [hJoyDown], a
	ld [hJoyLast], a
	ret
; 8474c

Function8474c: ; 8474c
	ld de, MUSIC_PRINTER
	call PlayMusic2
	ret
; 84753

Function84753: ; 84753
	call RestartMapMusic
	ret
; 84757

Function84757: ; 84757
	ld a, [wca88]
	cp -1
	jr nz, .printer_connected
	ld a, [wca89]
	cp -1
	jr z, .error_2

.printer_connected
	ld a, [wca89]
	and %11100000
	ret z ; no error

	bit 7, a
	jr nz, .error_1
	bit 6, a
	jr nz, .error_4
	ld a, 6 ; error 3
	jr .load_text_index

.error_4
	ld a, 7 ; error 4
	jr .load_text_index

.error_1
	ld a, 4 ; error 1
	jr .load_text_index

.error_2
	ld a, 5 ; error 2

.load_text_index
	ld [wcbf8], a
	ret
; 84785

Function84785: ; 84785
	ld a, [wcbf8]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 5
	lb bc, 10, 18
	call TextBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 1, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 2, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wcbf8], a
	ret
; 847bd

Function847bd: ; 847bd
	ld a, [wcbf8]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 4
	lb bc, 13, 16
	call ClearBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 4, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 4, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wcbf8], a
	ret
; 847f5

String_PressBToCancel:
	db "Press B to Cancel@"
; 84807

PrinterStatusStringPointers: ; 84807
	dw String_1dc275 ; @
	dw String_1dc276 ; CHECKING LINK
	dw String_1dc289 ; TRANSMITTING
	dw String_1dc29c ; PRINTING
	dw String_1dc2ad ; error 1
	dw String_1dc2e2 ; error 2
	dw String_1dc317 ; error 3
	dw String_1dc34c ; error 4
; 84817

Function84817: ; 84817 (21:4817)
	xor a
	ld [wd002], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	hlcoord 0, 0
	ld bc, 9 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceSideBorders
	call Printer_PlaceTopBorder
	hlcoord 4, 3
	ld de, .String_PokemonList
	call PlaceString
	ld a, [wd007]
	ld bc, BOX_NAME_LENGTH
	ld hl, wBoxNames
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 6, 5
	call PlaceString
	ld a, $1
	call Function849c6
	hlcoord 2, 9
	ld c, $3
	call Function848e7
	ret
; 84865 (21:4865)

.String_PokemonList:
	db "#MON LIST@"
; 8486f

Function8486f: ; 8486f (21:486f)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	call Printer_PlaceSideBorders
	ld a, [wd003]
	and a
	ret nz
	ld a, $4
	call Function849c6
	hlcoord 2, 0
	ld c, $6
	call Function848e7
	ret

Function84893: ; 84893 (21:4893)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	call Printer_PlaceSideBorders
	ld a, [wd003]
	and a
	ret nz
	ld a, $a
	call Function849c6
	hlcoord 2, 0
	ld c, $6
	call Function848e7
	ret

Function848b7: ; 848b7 (21:48b7)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Printer_PlaceEmptyBoxSlotString
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	call Printer_PlaceSideBorders
	call Printer_PlaceBottomBorders
	ld a, [wd003]
	and a
	ret nz
	ld a, $10
	call Function849c6
	hlcoord 2, 0
	ld c, $5
	call Function848e7
	ret

Function848e7: ; 848e7 (21:48e7)
	ld a, [wd006]
	call GetSRAMBank

Function848ed: ; 848ed (21:48ed)
	ld a, c
	and a
	jp z, Function84986
	dec c
	ld a, [de]
	cp $ff
	jp z, Function84981
	ld [wd265], a
	ld [CurPartySpecies], a
	push bc
	push hl
	push de
	push hl
	ld bc, $10
	ld a, " "
	call ByteFill
	pop hl
	push hl
	call GetBasePokemonName
	pop hl
	push hl
	call PlaceString
	ld a, [CurPartySpecies]
	cp EGG
	pop hl
	jr z, .ok2
	ld bc, $b
	add hl, bc
	call Function8498a
	ld bc, $9
	add hl, bc
	ld a, "/"
	ld [hli], a
	push hl
	ld bc, $e
	ld a, " "
	call ByteFill
	pop hl
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [wd005]
	ld h, a
	ld bc, $372
	add hl, bc
	ld bc, $b
	ld a, [wd002]
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	push hl
	call PlaceString
	pop hl
	ld bc, $b
	add hl, bc
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [wd005]
	ld h, a
	ld bc, $35
	add hl, bc
	ld bc, $20
	ld a, [wd002]
	call AddNTimes
	ld a, [hl]
	pop hl
	call Function383d
.ok2
	ld hl, wd002
	inc [hl]
	pop de
	pop hl
	ld bc, $3c
	add hl, bc
	pop bc
	inc de
	jp Function848ed

Function84981: ; 84981 (21:4981)
	ld a, $1
	ld [wd003], a

Function84986: ; 84986 (21:4986)
	call CloseSRAM
	ret

Function8498a: ; 8498a (21:498a)
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [wd005]
	ld h, a
	ld bc, $2b
	add hl, bc
	ld bc, $20
	ld a, [wd002]
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd002]
	ld [CurPartyMon], a
	ld a, $3
	ld [MonType], a
	callba GetGender
	ld a, $7f
	jr c, .asm_849c3
	ld a, $ef
	jr nz, .asm_849c3
	ld a, $f5
.asm_849c3
	pop hl
	ld [hli], a
	ret

Function849c6: ; 849c6 (21:49c6)
	push hl
	ld e, a
	ld d, $0
	ld a, [wd004]
	ld l, a
	ld a, [wd005]
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ret

Printer_PlaceTopBorder: ; 849d7 (21:49d7)
	hlcoord 0, 0
	ld a, "┌"
	ld [hli], a
	ld a, "─"
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, "┐"
	ld [hl], a
	ret

Printer_PlaceSideBorders: ; 849e9 (21:49e9)
	hlcoord 0, 0
	ld de, SCREEN_WIDTH - 1
	ld c, SCREEN_HEIGHT
.loop
	ld a, "│"
	ld [hl], a
	add hl, de
	ld a, "│"
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Printer_PlaceBottomBorders: ; 849fc (21:49fc)
	hlcoord 0, 17
	ld a, "└"
	ld [hli], a
	ld a, "─"
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, "┘"
	ld [hl], a
	ret

Printer_PlaceEmptyBoxSlotString: ; 84a0e (21:4a0e)
	hlcoord 2, 0
	ld c, $6
.loop
	push bc
	push hl
	ld de, String84a25
	call PlaceString
	pop hl
	ld bc, 3 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret
; 84a25 (21:4a25)

String84a25: ; 84a25
	db "  ------@"
; 84a2e
