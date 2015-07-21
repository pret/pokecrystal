
Pokedex: ; 40000

	ld a, [hWX]
	ld l, a
	ld a, [hWY]
	ld h, a
	push hl
	ld a, [hSCX]
	push af
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a

	xor a
	ld [$ffde], a
	call InitPokedex
	call DelayFrame

.main
	call Functiona57
	ld a, [wcf63]
	bit 7, a
	jr nz, .exit
	call Function4010b
	call DelayFrame
	jr .main

.exit
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	call ClearSprites
	ld a, [wc7d4]
	ld [wd959], a

	pop af
	ld [$ffaa], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	pop af
	ld [hSCX], a
	pop hl
	ld a, l
	ld [hWX], a
	ld a, h
	ld [hWY], a
	ret
; 40063

InitPokedex: ; 40063
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call Function414b7

	ld hl, wc6d0
IF DEF(CRYSTAL11)
	ld bc, $0116
ELSE
	ld bc, $0115
ENDC
	xor a
	call ByteFill

	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a

	call Function400a2

	ld a, [wd959]
	ld [wc7d4], a

	call Function40bdc
	call Function400b4
	call Function400ed
	callba Function1de247
	call Function41af7
	ret
; 400a2

Function400a2: ; 400a2
	ld a, [StatusFlags]
	bit 1, a
	jr nz, .asm_400ae

	xor a
	ld [wc7dc], a
	ret

.asm_400ae
	ld a, 1
	ld [wc7dc], a
	ret
; 400b4

Function400b4: ; 400b4
	ld hl, wc6d0
	ld a, [wc2d6]
	and a
	jr z, .asm_400ec
	cp $fc
	jr nc, .asm_400ec

	ld b, a
	ld a, [wc7d2]
	cp $8
	jr c, .asm_400db

	sub $7
	ld c, a
.asm_400cc
	ld a, b
	cp [hl]
	jr z, .asm_400ec
	inc hl
	ld a, [wc7d0]
	inc a
	ld [wc7d0], a
	dec c
	jr nz, .asm_400cc

.asm_400db
	ld c, $7
.asm_400dd
	ld a, b
	cp [hl]
	jr z, .asm_400ec
	inc hl
	ld a, [wc7d1]
	inc a
	ld [wc7d1], a
	dec c
	jr nz, .asm_400dd

.asm_400ec
	ret
; 400ed

Function400ed: ; 400ed
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp SPECIAL_MAP
	jr nz, .asm_40107

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.asm_40107
	ld [wc7e4], a
	ret
; 4010b

Function4010b: ; 4010b
	ld a, [wcf63]
	ld hl, Jumptable_40115
	call Function41432
	jp [hl]
; 40115


Jumptable_40115: ; 40115 (10:4115)
	dw Function4013c
	dw Function401ae
	dw Function40217
	dw Function40258
	dw Function402aa
	dw Function40443
	dw Function40471
	dw Function4039d
	dw Function403be
	dw Function4050a
	dw Function40562
	dw Function405bd
	dw Function405df
	dw Function40136


Function40131: ; 40131 (10:4131)
	ld hl, wcf63
	inc [hl]
	ret

Function40136: ; 40136 (10:4136)
	ld hl, wcf63
	set 7, [hl]
	ret

Function4013c: ; 4013c (10:413c)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call ClearSprites
	xor a
	ld hl, AttrMap
	ld bc, $168
	call ByteFill
	callba Function1de171
	hlcoord 0, 17
	ld de, Unknown_407f2
	call Function40acd
	ld a, $7
	ld [wc7d3], a
	call Function40b0f
	call Function41aeb
	call Function41af7
	call Function4074c
	ld a, $5
	ld [hSCX], a ; $ff00+$cf
	ld a, [wc7d4]
	cp $1
	ld a, $4a
	jr z, .asm_4017b
	ld a, $47

.asm_4017b
	ld [hWX], a ; $ff00+$d1
	xor a
	ld [hWY], a ; $ff00+$d2
	call WaitBGMap
	call Function41af7
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, $4
	call Function41423
	call Function41148
	callba Function1de171
	hlcoord 0, 17
	ld de, Unknown_407f2
	call Function40acd
	ld a, $7
	ld [wc7d3], a
	call Function40b0f
	call Function40131
	ret

Function401ae: ; 401ae (10:41ae)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and SELECT
	jr nz, .select
	ld a, [hl]
	and START
	jr nz, .start
	call Function406c5
	ret nc
	call Function41148
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function40b0f
	call Function41ad7
	call Function41af7
	ret

.a
	call Function40bb1
	call Function40bd0
	ret z
	ld a, $2
	ld [wcf63], a
	ld a, $0
	ld [wcf64], a
	ret

.select
	call Function41401
	ld a, $7
	ld [wcf63], a
	xor a
	ld [hSCX], a ; $ff00+$cf
	ld a, $a7
	ld [hWX], a ; $ff00+$d1
	call DelayFrame
	ret

.start
	call Function41401
	ld a, $5
	ld [wcf63], a
	xor a
	ld [hSCX], a ; $ff00+$cf
	ld a, $a7
	ld [hWX], a ; $ff00+$d1
	call DelayFrame
	ret

.b
	ld a, $d
	ld [wcf63], a
	ret

Function40217: ; 40217 (10:4217)
	call LowVolume
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call ClearSprites
	call Function41478
	call Function407fd
	call Function4134f
	call Function40bb1
	ld [wc2d6], a
	callba Function4424d
	call Function40ba0
	call WaitBGMap
	ld a, $a7
	ld [hWX], a ; $ff00+$d1
	call Function40bb1
	ld [CurPartySpecies], a
	ld a, $4
	call Function41423
	ld a, [CurPartySpecies]
	call PlayCry
	call Function40131
	ret

Function40258: ; 40258 (10:4258)
	ld de, Unknown_402e8
	call Function4135a
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	call Function4066c
	ret nc
	call Function40131
	ret

.a
	ld a, [wc7d8]
	ld hl, Jumptable_402f2
	call Function41432
	jp [hl]

.b
	ld a, [LastVolume]
	and a
	jr z, .asm_40288
	ld a, $77
	ld [LastVolume], a

.asm_40288
	call MaxVolume
	ld a, [wcf64]
	ld [wcf63], a
	ret
; 40292 (10:4292)

Function40292: ; 40292
	ld a, [wPokedexStatus]
	xor $1
	ld [wPokedexStatus], a
	call Function40bb1
	ld [wc2d6], a
	callba Function4424d
	call WaitBGMap
	ret
; 402aa

Function402aa: ; 402aa (10:42aa)
	call Function41401
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function407fd
	call Function4134f
	call Function41478
	call Function40bb1
	ld [wc2d6], a
	callba Function4424d
	call Function40ba0
	call Function4143b
	call WaitBGMap
	call Function40bb1
	ld [CurPartySpecies], a
	ld a, $4
	call Function41423
	ld a, [CurPartySpecies]
	call PlayCry
	ld hl, wcf63
	dec [hl]
	ret
; 402e8 (10:42e8)

Unknown_402e8: ; 402e8
	dw $0430
	dwcoord 1, 17
	dwcoord 6, 17
	dwcoord 11, 17
	dwcoord 15, 17
; 402f2

Jumptable_402f2: ; 402f2
	dw Function40292
	dw Function402fa
	dw Function40340
	dw Function4034f
; 402fa

Function402fa: ; 402fa
	call Function41401
	xor a
	ld [hSCX], a
	call DelayFrame
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Function40bb1
	ld a, [wc7e4]
	ld e, a
	predef Function91d11
	call Function41401
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld a, $5
	ld [hSCX], a
	call DelayFrame
	call Function4038d
	call Function4143b
	call WaitBGMap
	call Function40bb1
	ld [CurPartySpecies], a
	ld a, $4
	call Function41423
	ret
; 40340

Function40340: ; 40340
	call Function40bb1
	ld a, [wd265]
	call GetCryIndex
	ld e, c
	ld d, b
	call PlayCryHeader
	ret
; 4034f

Function4034f: ; 4034f
	call Function41415
	xor a
	ld [hSCX], a
	ld a, [wcf65]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf63]
	push af
	callba Function8442c
	pop af
	ld [wcf63], a
	pop af
	ld [wcf64], a
	pop af
	ld [wcf65], a
	call WhiteBGMap
	call DisableLCD
	call Function414fb
	call Function4038d
	call EnableLCD
	call WaitBGMap
	ld a, $5
	ld [hSCX], a
	call Function41427
	ret
; 4038d

Function4038d: ; 4038d
	call Function407fd
	call Function40bb1
	callba Function4424d
	call Function40ba0
	ret
; 4039d

Function4039d: ; 4039d (10:439d)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call ClearSprites
	call Function4087c
	call Function4134f
	ld a, [wc7d4]
	ld [wc7d8], a
	call Function40e5b
	call WaitBGMap
	ld a, $10
	call Function41423
	call Function40131
	ret

Function403be: ; 403be (10:43be)
	ld a, [wc7dc]
	and a
	jr nz, .asm_403c9
	ld de, Unknown_403f3
	jr .asm_403cc

.asm_403c9
	ld de, Unknown_403fb
.asm_403cc
	call Function4135a
	call c, Function40e5b
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $6
	jr nz, .asm_403ea
	ld a, [hl]
	and $1
	jr nz, .asm_403e0
	ret

.asm_403e0
	ld a, [wc7d8]
	ld hl, Jumptable_40405
	call Function41432
	jp [hl]

.asm_403ea
	call Function41401
	ld a, $0
	ld [wcf63], a
	ret
; 403f3 (10:43f3)

Unknown_403f3: ; 403f3
	dw $03c0
	dwcoord 2, 4
	dwcoord 2, 6
	dwcoord 2, 8
; 403fb

Unknown_403fb: ; 403fb
	dw $04c0
	dwcoord 2, 4
	dwcoord 2, 6
	dwcoord 2, 8
	dwcoord 2, 10
; 40405

Jumptable_40405: ; 40405 (10:4405)
	dw Function4040d
	dw Function40411
	dw Function40415
	dw Function4043a
; 4040d

Function4040d: ; 4040d (10:440d)
	ld b, $0
	jr Function40417

Function40411: ; 40411 (10:4411)
	ld b, $1
	jr Function40417

Function40415: ; 40415 (10:4415)
	ld b, $2
Function40417: ; 40417 (10:4417)
	ld a, [wc7d4]
	cp b
	jr z, .asm_40431
	ld a, b
	ld [wc7d4], a
	call Function40bdc
	call Function40f08
	xor a
	ld [wc7d0], a
	ld [wc7d1], a
	call Function400b4

.asm_40431
	call Function41401
	ld a, $0
	ld [wcf63], a
	ret

Function4043a: ; 4043a (10:443a)
	call Function41401
	ld a, $b
	ld [wcf63], a
	ret

Function40443: ; 40443 (10:4443)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call ClearSprites
	call Function408f0
	call Function4134f
	ld a, $1
	ld [wc7d5], a
	xor a
	ld [wc7d6], a
	call Function40fa8
	xor a
	ld [wc7db], a
	callba Function44207
	call WaitBGMap
	ld a, $10
	call Function41423
	call Function40131
	ret

Function40471: ; 40471 (10:4471)
	ld de, Unknown_4049e
	call Function4135a
	call Function40f4f
	call c, Function40fa8
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and START | B_BUTTON
	jr nz, .asm_40495
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_4048b
	ret

.asm_4048b
	ld a, [wc7d8]
	ld hl, Jumptable_404a8
	call Function41432
	jp [hl]

.asm_40495
	call Function41401
	ld a, $0
	ld [wcf63], a
	ret
; 4049e (10:449e)

Unknown_4049e: ; 4049e
	dw $04c0
	dwcoord 2, 4
	dwcoord 2, 6
	dwcoord 2, 13
	dwcoord 2, 15
; 404a8

Jumptable_404a8: ; 404a8
	dw Function404b0
	dw Function404b0
	dw Function404b7
	dw Function40501
; 404b0

Function404b0: ; 404b0
	call Function40f84
	call Function40fa8
	ret
; 404b7

Function404b7: ; 404b7
	call Function41086
	callba Function441cf
	ld a, [wc7d7]
	and a
	jr nz, .asm_404dc
	call Function40bdc
	call Function41107
	xor a
	ld [hBGMapMode], a
	call Function408f0
	call Function4134f
	call Function40fa8
	call WaitBGMap
	ret

.asm_404dc
	ld [wc7d2], a
	ld a, [wc7d0]
	ld [wc7e0], a
	ld a, [wc7d1]
	ld [wc7e1], a
	ld a, [wc2d6]
	ld [wcf65], a
	xor a
	ld [wc7d0], a
	ld [wc7d1], a
	call Function41401
	ld a, $9
	ld [wcf63], a
	ret
; 40501

Function40501: ; 40501
	call Function41401
	ld a, $0
	ld [wcf63], a
	ret
; 4050a

Function4050a: ; 4050a (10:450a)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	xor a
	ld hl, AttrMap
	ld bc, $168
	call ByteFill
	call Function41ae1
	call Function41af7
	callba Function1de1d1
	call Function409cf
	ld a, $4
	ld [wc7d3], a
	call Function40b0f
	call Function41ad7
	call Function41af7
	call Function40962
	ld a, $5
	ld [hSCX], a ; $ff00+$cf
	ld a, $4a
	ld [hWX], a ; $ff00+$d1
	xor a
	ld [hWY], a ; $ff00+$d2
	call WaitBGMap
	call Function41af7
	callba Function1de1d1
	call Function409cf
	call Function41281
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, $4
	call Function41423
	call Function40131
	ret

Function40562: ; 40562 (10:4562)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_40595
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_40583
	call Function406c5
	ret nc
	call Function41281
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function40b0f
	call Function41ad7
	call Function41af7
	ret

.asm_40583
	call Function40bb1
	call Function40bd0
	ret z
	ld a, $2
	ld [wcf63], a
	ld a, $9
	ld [wcf64], a
	ret

.asm_40595
	ld a, [wc7e0]
	ld [wc7d0], a
	ld a, [wc7e1]
	ld [wc7d1], a
	ld a, [wcf65]
	ld [wc2d6], a
	call Function41401
	call ClearSprites
	call Function40bdc
	ld a, $5
	ld [wcf63], a
	xor a
	ld [hSCX], a ; $ff00+$cf
	ld a, $a7
	ld [hWX], a ; $ff00+$d1
	ret

Function405bd: ; 405bd (10:45bd)
	call Function41a2c
	call Function409f1
	xor a
	ld [wc7dd], a
	call Function41a58
	call Function40658
	callba Functionfba2e
	call WaitBGMap
	ld a, $16
	call Function41423
	call Function40131
	ret

Function405df: ; 405df (10:45df)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_405eb
	call Function40610
	ret

.asm_405eb
	call Function41401
	ld a, $7
	ld [wcf63], a
	call DelayFrame
	call Function41a24
	jr nz, .asm_40603
	callba Function1ddf26
	jr .asm_4060f

.asm_40603
	ld hl, PokedexLZ
	ld de, $9310
	lb bc, BANK(PokedexLZ), $3a
	call Functione73

.asm_4060f
	ret

Function40610: ; 40610 (10:4610)
	ld hl, $ffa9
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ret

.right
	ld a, [wc7de]
	ld e, a
	ld hl, wc7dd
	ld a, [hl]
	inc a
	cp e
	ret nc
	ld a, [hl]
	inc [hl]
	jr .asm_40635

.left
	ld hl, wc7dd
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	dec [hl]

.asm_40635
	push af
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	pop af
	call Function40654
	call Function41a58
	call Function40658
	callba Functionfba2e
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	call DelayFrame
	call DelayFrame
	ret

Function40654: ; 40654 (10:4654)
	ld c, $7f
	jr asm_4065d

Function40658: ; 40658 (10:4658)
	ld a, [wc7dd]
	ld c, $5a
asm_4065d: ; 4065d (10:465d)
	ld e, a
	ld d, 0
	ld hl, Unknown_40a3e + 2
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], c
	ret

Function4066c: ; 4066c (10:466c)
	ld a, [wc7d1]
	ld [wc7e2], a
	ld a, [wc7d0]
	ld [wc7e3], a
	ld hl, $ffa9
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	and a
	ret

.up
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	call Function406ea
	jr nc, .asm_406b7
	call Function40bb1
	call Function40bd0
	jr nz, .asm_406b5
	jr .up

.down
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	call Function406fe
	jr nc, .asm_406b7
	call Function40bb1
	call Function40bd0
	jr nz, .asm_406b5
	jr .down

.asm_406b5
	scf
	ret

.asm_406b7
	ld a, [wc7e2]
	ld [wc7d1], a
	ld a, [wc7e3]
	ld [wc7d0], a
	and a
	ret

Function406c5: ; 406c5 (10:46c5)
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	ld hl, $ffa9
	ld a, [hl]
	and D_UP
	jr nz, Function406ea
	ld a, [hl]
	and D_DOWN
	jr nz, Function406fe
	ld a, d
	cp e
	jr nc, asm_4073d
	ld a, [hl]
	and $20
	jr nz, asm_40716
	ld a, [hl]
	and $10
	jr nz, asm_40728
	jr asm_4073d

Function406ea: ; 406ea (10:46ea)
	ld hl, wc7d1
	ld a, [hl]
	and a
	jr z, .asm_406f4
	dec [hl]
	jr asm_4073f
.asm_406f4
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, asm_4073d
	dec [hl]
	jr asm_4073f

Function406fe: ; 406fe (10:46fe)
	ld hl, wc7d1
	ld a, [hl]
	inc a
	cp e
	jr nc, asm_4073d
	cp d
	jr nc, .asm_4070c
	inc [hl]
	jr asm_4073f
.asm_4070c
	ld hl, wc7d0
	add [hl]
	cp e
	jr nc, asm_4073d
	inc [hl]
	jr asm_4073f
asm_40716: ; 40716 (10:4716)
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, asm_4073d
	cp d
	jr nc, .asm_40724
	xor a
	ld [hl], a
	jr asm_4073f
.asm_40724
	sub d
	ld [hl], a
	jr asm_4073f
asm_40728: ; 40728 (10:4728)
	ld hl, wc7d0
	ld a, d
	add a
	add [hl]
	jr c, .asm_40733
	cp e
	jr c, .asm_40738
.asm_40733
	ld a, e
	sub d
	ld [hl], a
	jr asm_4073f
.asm_40738
	ld a, [hl]
	add d
	ld [hl], a
	jr asm_4073f
asm_4073d: ; 4073d (10:473d)
	and a
	ret
asm_4073f: ; 4073f (10:473f)
	scf
	ret

Function40741: ; 40741
	push de
	ld de, $0014
.asm_40745
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_40745
	pop de
	ret
; 4074c


Function4074c: ; 4074c (10:474c)
	hlcoord 0, 17
	ld de, Unknown_407f2
	call Function40acd
	ld a, $32
	ld hl, TileMap
	ld bc, $168
	call ByteFill
	ld hl, TileMap
	lb bc, 7, 7
	call Function40ad5
	hlcoord 0, 9
	ld bc, $607
	call Function40ad5
	hlcoord 1, 11
	ld de, Unknown_407e1
	call Function40acd
	ld hl, PokedexSeen ; wdeb9 (aliases: EndPokedexSeen)
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld de, wd265
	hlcoord 5, 12
	ld bc, $103
	call PrintNum
	hlcoord 1, 14
	ld de, Unknown_407e6
	call Function40acd
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld de, wd265
	hlcoord 5, 15
	ld bc, $103
	call PrintNum
	hlcoord 1, 17
	ld de, Unknown_407ea
	call Function40acd
	hlcoord 8, 1
	ld b, $7
	ld a, $5a
	call Function40741
	hlcoord 8, 10
	ld b, $6
	ld a, $5a
	call Function40741
	hlcoord 8, 0
	ld [hl], $59
	hlcoord 8, 8
	ld [hl], $53
	hlcoord 8, 9
	ld [hl], $54
	hlcoord 8, 16
	ld [hl], $5b
	call Function40ab2
	ret
; 407e1 (10:47e1)

Unknown_407e1: ; 407e1
	db "SEEN", $ff
Unknown_407e6: ; 407e6
	db "OWN", $ff
Unknown_407ea: ; 407ea
	db $3b, $48, $49, $4a, $44, $45, $46, $47 ; SELECT > OPTION
Unknown_407f2: ; 407f2
	db $3c, $3b, $41, $42, $43, $4b, $4c, $4d, $4e, $3c, $ff ; START > SEARCH
; 407fd

Function407fd: ; 407fd
	call Function40aa6
	ld hl, TileMap
	ld bc, $0f12
	call Function40ad5
	hlcoord 19, 0
	ld [hl], $34
	hlcoord 19, 1
	ld a, $7f
	ld b, $f
	call Function40741
	ld [hl], $39
	hlcoord 1, 10
	ld bc, $0013
	ld a, $61
	call ByteFill
	hlcoord 1, 17
	ld bc, $0012
	ld a, $7f
	call ByteFill
	hlcoord 9, 7
	ld de, Unknown_40852
	call Function40acd
	hlcoord 9, 9
	ld de, Unknown_4085c
	call Function40acd
	hlcoord 0, 17
	ld de, Unknown_40867
	call Function40acd
	call Function40ab2
	ret
; 4084f

Unknown_4084f: ; 4084f
	db $5c, $5d, $ff ; No.
Unknown_40852: ; 40852
	db "HT  ?", $5e, "??", $5f, $ff ; HT  ?'??"
Unknown_4085c: ; 4085c
	db "WT   ???lb", $ff ; WT   ???lb
Unknown_40867: ; 40867
	db $3b, " PAGE AREA CRY PRNT", $ff
; 4087c

Function4087c: ; 4087c (10:487c)
	call Function40aa6
	hlcoord 0, 2
	lb bc, 8, 18
	call Function40ad5
	hlcoord 0, 12
	lb bc, 4, 18
	call Function40ad5
	hlcoord 0, 1
	ld de, Unknown_408b2
	call Function40acd
	hlcoord 3, 4
	ld de, String_408bd
	call PlaceString
	ld a, [wc7dc]
	and a
	ret z
	hlcoord 3, 10
	ld de, String_408e5
	call PlaceString
	ret
; 408b2 (10:48b2)

Unknown_408b2: ; 408b2
	db $3b, " OPTION ", $3c, $ff
; 408bd

String_408bd: ; 408bd
	db   "NEW #DEX MODE"
	next "OLD #DEX MODE"
	next "A to Z MODE"
	db "@"
; 408e5

String_408e5: ; 408e5
	db "UNOWN MODE@"
; 408f0

Function408f0: ; 408f0 (10:48f0)
	call Function40aa6
	hlcoord 0, 2
	lb bc, 14, 18
	call Function40ad5
	hlcoord 0, 1
	ld de, Unknown_4092a
	call Function40acd
	hlcoord 8, 4
	ld de, Unknown_40935
	call Function40acd
	hlcoord 8, 6
	ld de, Unknown_40935
	call Function40acd
	hlcoord 3, 4
	ld de, String_40940
	call PlaceString
	hlcoord 3, 13
	ld de, String_4094c
	call PlaceString
	ret
; 4092a (10:492a)

Unknown_4092a: ; 4092a
	db $3b, " SEARCH ", $3c, $ff
; 40925

Unknown_40935: ; 40935
	db $3d, "        ", $3e, $ff
; 40940

String_40940: ; 40940
	db   "TYPE1"
	next "TYPE2"
	db   "@"
; 4094c

String_4094c: ; 4094c
	db   "BEGIN SEARCH!!"
	next "CANCEL"
	db   "@"
; 40962

Function40962: ; 40962 (10:4962)
	call Function40aa6
	ld hl, TileMap
	lb bc, 7, 7
	call Function40ad5
	hlcoord 0, 11
	lb bc, 5, 18
	call Function40ad5
	hlcoord 1, 12
	ld de, String_409ae
	call PlaceString
	ld de, wc7d7
	hlcoord 1, 16
	ld bc, $103
	call PrintNum
	hlcoord 8, 0
	ld [hl], $59
	hlcoord 8, 1
	ld b, $7
	ld a, $5a
	call Function40741
	hlcoord 8, 8
	ld [hl], $53
	hlcoord 8, 9
	ld [hl], $69
	hlcoord 8, 10
	ld [hl], $6a
	call Function40ab2
	ret
; 409ae (10:49ae)

String_409ae: ; 409ae
	db   "SEARCH RESULTS"
	next "  TYPE"
	next "    FOUND!"
	db   "@"
; 409cf

Function409cf: ; 409cf (10:49cf)
	ld a, [wc7d5]
	hlcoord 0, 14
	call Function40fcd
	ld a, [wc7d5]
	ld b, a
	ld a, [wc7d6]
	and a
	jr z, .asm_409f0
	cp b
	jr z, .asm_409f0
	hlcoord 2, 15
	call Function40fcd
	hlcoord 1, 15
	ld [hl], $f3
.asm_409f0
	ret

Function409f1: ; 409f1 (10:49f1)
	call Function40aa6
	hlcoord 2, 1
	lb bc, 10, 13
	call Function40ad5
	hlcoord 2, 14
	lb bc, 1, 13
	call Function40ad5
	hlcoord 2, 15
	ld [hl], $3d
	hlcoord 16, 15
	ld [hl], $3e
	hlcoord 6, 5
	call Function40ab5
	ld de, 0
	ld b, 0
	ld c, 26
.asm_40a1d
	ld hl, UnownDex
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_40a39
	push af
	ld hl, Unknown_40a3e
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	add $3f
	ld [hl], a
	inc de
	inc b
	dec c
	jr nz, .asm_40a1d
.asm_40a39
	ld a, b
	ld [wc7de], a
	ret
; 40a3e (10:4a3e)

Unknown_40a3e: ; 40a3e
	dwcoord   4,11,   3,11
	dwcoord   4,10,   3,10
	dwcoord   4, 9,   3, 9
	dwcoord   4, 8,   3, 8
	dwcoord   4, 7,   3, 7
	dwcoord   4, 6,   3, 6
	dwcoord   4, 5,   3, 5
	dwcoord   4, 4,   3, 4
	dwcoord   4, 3,   3, 2
	dwcoord   5, 3,   5, 2
	dwcoord   6, 3,   6, 2
	dwcoord   7, 3,   7, 2
	dwcoord   8, 3,   8, 2
	dwcoord   9, 3,   9, 2
	dwcoord  10, 3,  10, 2
	dwcoord  11, 3,  11, 2
	dwcoord  12, 3,  12, 2
	dwcoord  13, 3,  13, 2
	dwcoord  14, 3,  15, 2
	dwcoord  14, 4,  15, 4
	dwcoord  14, 5,  15, 5
	dwcoord  14, 6,  15, 6
	dwcoord  14, 7,  15, 7
	dwcoord  14, 8,  15, 8
	dwcoord  14, 9,  15, 9
	dwcoord  14,10,  15,10
; 40aa6

Function40aa6: ; 40aa6
	ld hl, TileMap
	ld a, $32
	ld bc, $0168
	call ByteFill
	ret
; 40ab2

Function40ab2: ; 40ab2
	hlcoord 1, 1
Function40ab5: ; 40ab5
	xor a
	ld b, $7
.asm_40ab8
	ld c, $7
	push af
	push hl
.asm_40abc
	ld [hli], a
	add $7
	dec c
	jr nz, .asm_40abc
	pop hl
	ld de, $0014
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .asm_40ab8
	ret
; 40acd

Function40acd: ; 40acd
.asm_40acd
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .asm_40acd
; 40ad5


Function40ad5: ; 40ad5
	push hl
	ld a, $33
	ld [hli], a
	ld d, $34
	call Function40b06
	ld a, $35
	ld [hl], a
	pop hl
	ld de, $0014
	add hl, de
.asm_40ae6
	push hl
	ld a, $36
	ld [hli], a
	ld d, $7f
	call Function40b06
	ld a, $37
	ld [hl], a
	pop hl
	ld de, $0014
	add hl, de
	dec b
	jr nz, .asm_40ae6
	ld a, $38
	ld [hli], a
	ld d, $39
	call Function40b06
	ld a, $3a
	ld [hl], a
	ret
; 40b06

Function40b06: ; 40b06
	ld e, c
.asm_40b07
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .asm_40b07
; 40b0f


Function40b0f: ; 40b0f (10:4b0f)
	ld a, [wc7d4]
	cp $1
	jr z, .asm_40b1a
	ld c, $b
	jr .asm_40b1c
.asm_40b1a
	ld c, $b
.asm_40b1c
	hlcoord 0, 1
	ld a, [wc7d3]
	add a
	inc a
	ld b, a
	ld a, $7f
	call Function413fe
	ld a, [wc7d0]
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld e, l
	ld d, h
	hlcoord 0, 2
	ld a, [wc7d3]
.asm_40b3c
	push af
	ld a, [de]
	ld [wd265], a
	push de
	push hl
	call Function40b55
	pop hl
	ld de, $28
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .asm_40b3c
	call Function4143b
	ret

Function40b55: ; 40b55 (10:4b55)
	and a
	ret z
	call Function40b6a
	call Function40b8d
	ret c
	call Function40b82
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret

Function40b6a: ; 40b6a (10:4b6a)
	ld a, [wc7d4]
	cp $1
	jr z, .asm_40b72
	ret
.asm_40b72
	push hl
	ld de, -20
	add hl, de
	ld de, wd265
	ld bc, $8103
	call PrintNum
	pop hl
	ret

Function40b82: ; 40b82 (10:4b82)
	call Function40bc4
	jr nz, .asm_40b89
	inc hl
	ret
.asm_40b89
	ld a, $4f
	ld [hli], a
	ret

Function40b8d: ; 40b8d (10:4b8d)
	call Function40bd0
	ret nz
	inc hl
	ld de, String_40b9a
	call PlaceString
	scf
	ret
; 40b9a (10:4b9a)

String_40b9a: ; 40b9a
	db "-----@"
; 40ba0

Function40ba0: ; 40ba0
	hlcoord 18, 1
	ld a, $62
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 18, 2
	ld a, $64
	ld [hli], a
	inc a
	ld [hl], a
	ret
; 40bb1


Function40bb1: ; 40bb1
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret
; 40bc4


Function40bc4: ; 40bc4 (10:4bc4)
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret


Function40bd0: ; 40bd0
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret
; 40bdc



Function40bdc: ; 40bdc
	ld hl, wc6d0
	ld bc, $100
	xor a
	call ByteFill
	ld a, [wc7d4]
	ld hl, Jumptable_40bf0
	call Function41432
	jp [hl]
; 40bf0


Jumptable_40bf0: ; 40bf0 (10:4bf0)
	dw Function40bf6
	dw Function40c08
	dw Function40c30


Function40bf6: ; 40bf6 (10:4bf6)
	ld de, NewPokedexOrder
	ld hl, wc6d0
	ld c, NUM_POKEMON
.asm_40bfe
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_40bfe
	call Function40c18
	ret

Function40c08: ; 40c08 (10:4c08)
	ld hl, wc6d0
	ld a, $1
	ld c, NUM_POKEMON
.asm_40c0f
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_40c0f
	call Function40c18
	ret

Function40c18: ; 40c18 (10:4c18)
	ld hl, wc7ca
	ld d, NUM_POKEMON
	ld e, d
.asm_40c1e
	ld a, [hld]
	ld [wd265], a
	call Function40bd0
	jr nz, .asm_40c2b
	dec d
	dec e
	jr nz, .asm_40c1e
.asm_40c2b
	ld a, d
	ld [wc7d2], a
	ret

Function40c30: ; 40c30
	xor a
	ld [wc7d2], a
	ld hl, wc6d0
	ld de, AlphabeticalPokedexOrder
	ld c, NUM_POKEMON
.asm_40c3c
	push bc
	ld a, [de]
	ld [wd265], a
	call Function40bd0
	jr z, .asm_40c51
	ld a, [wd265]
	ld [hli], a
	ld a, [wc7d2]
	inc a
	ld [wc7d2], a

.asm_40c51
	inc de
	pop bc
	dec c
	jr nz, .asm_40c3c
	ld a, [wc7d2]
	ld c, 0
.asm_40c5b
	cp NUM_POKEMON
	jr z, .asm_40c64
	ld [hl], c
	inc hl
	inc a
	jr .asm_40c5b

.asm_40c64
	ret
; 40c65

AlphabeticalPokedexOrder: ; 0x40c65
INCLUDE "data/pokedex/order_alpha.asm"

NewPokedexOrder: ; 0x40d60
INCLUDE "data/pokedex/order_new.asm"

Function40e5b: ; 40e5b
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	ld bc, $0412
	call Function40ad5
	ld a, [wc7d8]
	ld hl, Unknown_40e7d
	call Function41432
	ld e, l
	ld d, h
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret
; 40e7d

Unknown_40e7d: ; 40e7d
	dw String_40e85
	dw String_40ea6
	dw String_40ec6
	dw String_40ee4
; 40e85

String_40e85: ; 40e85
	db   $e1, $e2, " are listed by"
	next "evolution type.@"
; 40ea6

String_40ea6: ; 40ea6
	db   $e1, $e2, " are listed by"
	next "official type.@"
; 40ec6

String_40ec6: ; 40ec6
	db   $e1, $e2, " are listed"
	next "alphabetically.@"
; 40ee4

String_40ee4: ; 40ee4
	db   "UNOWN are listed"
	next "in catching order.@"
; 40f08

Function40f08: ; 40f08 (10:4f08)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	hlcoord 0, 12
	ld bc, $412
	call Function40ad5
	ld de, String_40f32
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ld c, $40
	call DelayFrames
	ld de, SFX_CHANGE_DEX_MODE
	call PlaySFX
	ld c, $40
	call DelayFrames
	ret
; 40f32 (10:4f32)

String_40f32: ; 40f32
	db "Changing modes.", $4e, "Please wait.@"
; 40f4f

Function40f4f: ; 40f4f (10:4f4f)
	ld a, [wc7d8]
	cp $2
	jr nc, .asm_40f63
	ld hl, $ffa9
	ld a, [hl]
	and $20
	jr nz, .asm_40f65
	ld a, [hl]
	and $10
	jr nz, Function40f84
.asm_40f63
	and a
	ret
.asm_40f65
	ld a, [wc7d8]
	and a
	jr nz, .asm_40f76
	ld hl, wc7d5
	ld a, [hl]
	cp $1
	jr z, .asm_40f80
	dec [hl]
	jr .asm_40f82
.asm_40f76
	ld hl, wc7d6
	ld a, [hl]
	and a
	jr z, .asm_40f80
	dec [hl]
	jr .asm_40f82
.asm_40f80
	ld [hl], $11
.asm_40f82
	scf
	ret
; 40f84

Function40f84: ; 40f84
	ld a, [wc7d8]
	and a
	jr nz, .asm_40f99
	ld hl, wc7d5
	ld a, [hl]
	cp $11
	jr nc, .asm_40f95
	inc [hl]
	jr .asm_40fa6
.asm_40f95
	ld [hl], $1
	jr .asm_40fa6
.asm_40f99
	ld hl, wc7d6
	ld a, [hl]
	cp $11
	jr nc, .asm_40fa4
	inc [hl]
	jr .asm_40fa6
.asm_40fa4
	ld [hl], $0
.asm_40fa6
	scf
	ret

Function40fa8: ; 40fa8 (10:4fa8)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	hlcoord 9, 3
	ld bc, $408
	ld a, $7f
	call Function413fe
	ld a, [wc7d5]
	hlcoord 9, 4
	call Function40fcd
	ld a, [wc7d6]
	hlcoord 9, 6
	call Function40fcd
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret

Function40fcd: ; 40fcd (10:4fcd)
	push hl
	ld e, a
	ld d, 0
	ld hl, Strings_40fe4
rept 9
	add hl, de
endr
	ld e, l
	ld d, h
	pop hl
	call PlaceString
	ret
; 40fe4 (10:4fe4)

Strings_40fe4: ; 40fe4
	db "  ----  @"
	db " NORMAL @"
	db "  FIRE  @"
	db " WATER  @"
	db " GRASS  @"
	db "ELECTRIC@"
	db "  ICE   @"
	db "FIGHTING@"
	db " POISON @"
	db " GROUND @"
	db " FLYING @"
	db "PSYCHIC @"
	db "  BUG   @"
	db "  ROCK  @"
	db " GHOST  @"
	db " DRAGON @"
	db "  DARK  @"
	db " STEEL  @"
; 41086

Function41086: ; 41086
	ld a, [wc7d6]
	and a
	call nz, Function41095
	ld a, [wc7d5]
	and a
	call nz, Function41095
	ret
; 41095

Function41095: ; 41095
	dec a
	ld e, a
	ld d, 0
	ld hl, Unknown_410f6
	add hl, de
	ld a, [hl]
	ld [wc7df], a
	ld hl, wc6d0
	ld de, wc6d0
	ld c, NUM_POKEMON
	xor a
	ld [wc7d7], a
.asm_410ad
	push bc
	ld a, [hl]
	and a
	jr z, .asm_410e0
	ld [wd265], a
	ld [CurSpecies], a
	call Function40bc4
	jr z, .asm_410e0
	push hl
	push de
	call GetBaseData
	pop de
	pop hl
	ld a, [wc7df]
	ld b, a
	ld a, [BaseType1]
	cp b
	jr z, .asm_410d4
	ld a, [BaseType2]
	cp b
	jr nz, .asm_410e0

.asm_410d4
	ld a, [wd265]
	ld [de], a
	inc de
	ld a, [wc7d7]
	inc a
	ld [wc7d7], a

.asm_410e0
	inc hl
	pop bc
	dec c
	jr nz, .asm_410ad
	ld l, e
	ld h, d
	ld a, [wc7d7]
	ld c, 0
.asm_410ec
	cp NUM_POKEMON
	jr z, .asm_410f5
	ld [hl], c
	inc hl
	inc a
	jr .asm_410ec

.asm_410f5
	ret
; 410f6

Unknown_410f6: ; 410f6
	db NORMAL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db ICE
	db FIGHTING
	db POISON
	db GROUND
	db FLYING
	db PSYCHIC
	db BUG
	db ROCK
	db GHOST
	db DRAGON
	db DARK
	db STEEL
; 41107

Function41107: ; 41107
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	ld bc, $0412
	call Function40ad5
	ld de, String_41126
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ld c, $80
	call DelayFrames
	ret
; 41126

String_41126: ; 41126
	db   "The specified type"
	next "was not found.@"
; 41148

Function41148: ; 41148 (10:5148)
	ld a, [wc7d4]
	cp $1
	jp z, Function41157
	call Function41229
	call Function4130e
	ret

Function41157: ; 41157 (10:5157)
	ld hl, Unknown_41167
	ld a, [wc7d1]
	or a
	jr nz, .asm_41163
	ld hl, Unknown_411c8
.asm_41163
	call Function412f1
	ret
; 41167 (10:5167)

Unknown_41167: ; 41167
; OAM
	db $18, $47, $30, $07
	db $10, $47, $31, $07
	db $10, $4f, $32, $07
	db $10, $57, $32, $07
	db $10, $5f, $32, $07
	db $10, $67, $33, $07
	db $10, $7e, $33, $27
	db $10, $86, $32, $27
	db $10, $8e, $32, $27
	db $10, $96, $32, $27
	db $10, $9e, $31, $27
	db $18, $9e, $30, $27
	db $20, $47, $30, $47
	db $28, $47, $31, $47
	db $28, $4f, $32, $47
	db $28, $57, $32, $47
	db $28, $5f, $32, $47
	db $28, $67, $33, $47
	db $28, $7e, $33, $67
	db $28, $86, $32, $67
	db $28, $8e, $32, $67
	db $28, $96, $32, $67
	db $28, $9e, $31, $67
	db $20, $9e, $30, $67
	db $ff
; 411c8

Unknown_411c8: ; 411c8
; OAM
	db $18, $47, $30, $07
	db $10, $47, $34, $07
	db $10, $4f, $35, $07
	db $10, $57, $35, $07
	db $10, $5f, $35, $07
	db $10, $67, $36, $07
	db $10, $7e, $36, $27
	db $10, $86, $35, $27
	db $10, $8e, $35, $27
	db $10, $96, $35, $27
	db $10, $9e, $34, $27
	db $18, $9e, $30, $27
	db $20, $47, $30, $47
	db $28, $47, $31, $47
	db $28, $4f, $32, $47
	db $28, $57, $32, $47
	db $28, $5f, $32, $47
	db $28, $67, $33, $47
	db $28, $7e, $33, $67
	db $28, $86, $32, $67
	db $28, $8e, $32, $67
	db $28, $96, $32, $67
	db $28, $9e, $31, $67
	db $20, $9e, $30, $67
	db $ff
; 41229

Function41229: ; 41229 (10:5229)
	ld hl, Unknown_41230
	call Function412f1
	ret
; 41230 (10:5230)

Unknown_41230: ; 41230
; OAM
	db $1b, $47, $30, $07
	db $13, $47, $31, $07
	db $13, $4f, $32, $07
	db $13, $57, $32, $07
	db $13, $5f, $33, $07
	db $13, $80, $33, $27
	db $13, $88, $32, $27
	db $13, $90, $32, $27
	db $13, $98, $31, $27
	db $1b, $98, $30, $27
	db $23, $47, $30, $47
	db $2b, $47, $31, $47
	db $2b, $4f, $32, $47
	db $2b, $57, $32, $47
	db $2b, $5f, $33, $47
	db $2b, $80, $33, $67
	db $2b, $88, $32, $67
	db $2b, $90, $32, $67
	db $2b, $98, $31, $67
	db $23, $98, $30, $67
	db $ff
; 41281

Function41281: ; 41281 (10:5281)
	ld a, [wc7d4]
	cp $1
	jp z, Function41157
	ld hl, Unknown_41290
	call Function412f1
	ret
; 41290 (10:5290)

Unknown_41290: ; 41290
; OAM
	db $1b, $47, $30, $07
	db $13, $47, $31, $07
	db $13, $4f, $32, $07
	db $13, $57, $32, $07
	db $13, $5f, $32, $07
	db $13, $67, $33, $07
	db $13, $7e, $33, $27
	db $13, $86, $32, $27
	db $13, $8e, $32, $27
	db $13, $96, $32, $27
	db $13, $9e, $31, $27
	db $1b, $9e, $30, $27
	db $23, $47, $30, $47
	db $2b, $47, $31, $47
	db $2b, $4f, $32, $47
	db $2b, $57, $32, $47
	db $2b, $5f, $32, $47
	db $2b, $67, $33, $47
	db $2b, $7e, $33, $67
	db $2b, $86, $32, $67
	db $2b, $8e, $32, $67
	db $2b, $96, $32, $67
	db $2b, $9e, $31, $67
	db $23, $9e, $30, $67
	db $ff
; 412f1

Function412f1: ; 412f1 (10:52f1)
	ld de, Sprites
.asm_412f4
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wc7d1]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_412f4

Function4130e: ; 4130e (10:530e)
	push de
	ld a, [wc7d2]
	dec a
	ld e, a
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	cp e
	jr z, .asm_4133f
	ld hl, $0
	ld bc, $79
	call AddNTimes
	ld e, l
	ld d, h
	ld b, $0
	ld a, d
	or e
	jr z, .asm_41341
	ld a, [wc7d2]
	ld c, a
.asm_41333
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_41341
	inc b
	jr .asm_41333
.asm_4133f
	ld b, $79
.asm_41341
	ld a, $14
	add b
	pop hl
	ld [hli], a
	ld a, $a1
	ld [hli], a
	ld a, $f
	ld [hli], a
	ld [hl], $0
	ret

Function4134f: ; 4134f (10:534f)
	xor a
	ld [wc7d8], a
	ld [wc7d9], a
	ld [wc7da], a
	ret

Function4135a: ; 4135a (10:535a)
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	dec a
	ld c, a
	inc de
	call Function413e0
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .asm_4138f
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .asm_413a0
	ld a, [hl]
	and SELECT
	and b
	jr nz, .asm_413c1
	call Function413f5
	jr c, .asm_413bf
	ld hl, $ffa9
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .asm_4138f
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .asm_413a0
	jr .asm_413bf
.asm_4138f
	ld a, [wc7d8]
	and a
	jr z, .asm_413bf
	call Function413d4
	ld [hl], $7f
	ld hl, wc7d8
	dec [hl]
	jr .asm_413af
.asm_413a0
	ld a, [wc7d8]
	cp c
	jr nc, .asm_413bf
	call Function413d4
	ld [hl], $7f
	ld hl, wc7d8
	inc [hl]
.asm_413af
	call Function413d4
	ld [hl], $ed
	ld a, $c
	ld [wc7d9], a
	xor a
	ld [wc7da], a
	scf
	ret
.asm_413bf
	and a
	ret
.asm_413c1
	call Function413d4
	ld [hl], $7f
	ld a, [wc7d8]
	cp c
	jr c, .asm_413ce
	ld a, $ff
.asm_413ce
	inc a
	ld [wc7d8], a
	jr .asm_413af

Function413d4: ; 413d4 (10:53d4)
	ld a, [wc7d8]
	add a
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Function413e0: ; 413e0 (10:53e0)
	ld hl, wc7da
	ld a, [hl]
	inc [hl]
	and $8
	jr z, .asm_413ef
	call Function413d4
	ld [hl], $7f
	ret
.asm_413ef
	call Function413d4
	ld [hl], $ed
	ret

Function413f5: ; 413f5 (10:53f5)
	ld hl, wc7d9
	ld a, [hl]
	and a
	ret z
	dec [hl]
	scf
	ret

Function413fe: ; 413fe (10:53fe)
	jp Functionfb8

Function41401: ; 41401 (10:5401)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld hl, Unkn1Pals
	ld bc, $40
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a ; $ff00+$70

Function41415: ; 41415
	ld a, $ff
	call DmgToCgbBGPals
	ld a, $ff
	call Functioncf8
	call DelayFrame
	ret

Function41423: ; 41423
	ld b, a
	call GetSGBLayout

Function41427: ; 41427
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call Functioncf8
	ret
; 41432


Function41432: ; 41432
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 4143b

Function4143b: ; 4143b
	call Function40bb1
	call Function40bd0
	jr z, .asm_4145b
	ld a, [wdef4]
	ld [UnownLetter], a
	ld a, [wd265]
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, VTiles2
	predef GetFrontpic
	ret

.asm_4145b
	ld a, $0
	call GetSRAMBank
	callba Function1de0d7
	ld hl, VTiles2
	ld de, $a000
	ld c, $31
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret
; 41478


Function41478: ; 41478 (10:5478)
	call Function40bb1

Function4147b: ; 4147b
	ld a, [wd265]
	dec a
	and $f8
	srl a
	srl a
	srl a
	ld e, 0
	ld d, a
	ld a, [wd265]
	dec a
	and 7
	swap a ; * $10
	ld l, a
	ld h, 0
	add hl, de
	ld de, Footprints
	add hl, de

	push hl
	ld e, l
	ld d, h
	ld hl, $9620
	lb bc, BANK(Footprints), 2
	call Request1bpp
	pop hl

	; Whoever was editing footprints forgot to fix their
	; tile editor. Now each bottom half is 8 tiles off.
	ld de, $80
	add hl, de

	ld e, l
	ld d, h
	ld hl, $9640
	lb bc, BANK(Footprints), 2
	call Request1bpp

	ret
; 414b7


Function414b7: ; 414b7
	call DisableLCD
	ld hl, VTiles2
	ld bc, $0310
	xor a
	call ByteFill
	call Function414fb
	call Functione5f
	ld hl, $9600
	ld bc, $0200
	call Function41504
	call Function41a24
	jr nz, .asm_414e0
	callba Function1ddf1c
	jr .asm_414e9

.asm_414e0
	ld hl, PokedexLZ
	ld de, $9310
	call Decompress

.asm_414e9
	ld hl, PokedexSlowpokeLZ
	ld de, VTiles0
	call Decompress
	ld a, 6
	call SkipMusic
	call EnableLCD
	ret

Function414fb: ; 414fb
	call Functione51
	ld hl, VTiles1
	ld bc, $0800

Function41504: ; 41504
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, Function41504
	ret
; 4150e

PokedexLZ: ; 4150e
INCBIN "gfx/unknown/04150e.2bpp.lz"
; 416b0

PokedexSlowpokeLZ: ; 416b0
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

Function41a24: ; 41a24
	ld a, [hCGB]
	or a
	ret nz
	ld a, [hSGB]
	dec a
	ret
; 41a2c

Function41a2c: ; 41a2c
	ld a, $0
	call GetSRAMBank
	ld hl, UnownFont
	ld de, $a188
	ld bc, $270
	ld a, BANK(UnownFont)
	call FarCopyBytes
	ld hl, $a188
	ld bc, $1b0
	call Function41504
	ld de, $a188
	ld hl, $9400
	lb bc, BANK(Function41a2c), $1b
	call Request2bpp
	call CloseSRAM
	ret
; 41a58


Function41a58: ; 41a58 (10:5a58)
	ld a, [UnownLetter]
	push af
	ld a, [wc7dd]
	ld e, a
	ld d, $0
	ld hl, EndPokedexSeen ; wded9 (aliases: UnownDex)
	add hl, de
	ld a, [hl]
	ld [UnownLetter], a
	ld a, UNOWN
	ld [CurPartySpecies], a
	call GetBaseData
	ld de, $9000
	predef GetFrontpic
	pop af
	ld [UnownLetter], a
	ret
