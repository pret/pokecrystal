; Functions handling map objects.


GetSpritePalette:: ; 17ff
	push hl
	push de
	push bc
	ld c, a
	callba _GetSpritePalette
	ld a, c
	pop bc
	pop de
	pop hl
	ret
; 180e


Function180e:: ; 180e
	push hl
	push bc
	ld hl, $d156
	ld c, $1f
	ld b, a
	ld a, [hConnectionStripLength]
	cp $0
	jr z, .asm_182b
	ld a, b
.asm_181d
	cp [hl]
	jr z, .asm_1830
	inc hl
	inc hl
	dec c
	jr nz, .asm_181d
	ld a, [$d155]
	scf
	jr .asm_1833

.asm_182b
	ld a, [$d155]
	jr .asm_1833

.asm_1830
	inc hl
	xor a
	ld a, [hl]

.asm_1833
	pop bc
	pop hl
	ret
; 1836

Function1836:: ; 1836
	push de
	push hl

	ld b, a
	ld a, [hROMBank]
	push af
	ld a, BANK(Function142a7)
	rst Bankswitch

	ld a, b
	call Function142a7
	ld c, a

	pop de
	ld a, d
	rst Bankswitch

	pop hl
	pop de
	ret
; 184a



Function184a:: ; 184a
	ld a, [StandingTile]
	call GetTileCollision
	ld b, a
	ret
; 1852

Function1852:: ; 1852
	ld a, [StandingTile]
	call GetTileCollision
	sub 1
	ret z
	and a
	ret
; 185d


GetTileCollision:: ; 185d
; Get the collision type of tile a.

	push de
	push hl

	ld hl, TileCollisionTable
	ld e, a
	ld d, 0
	add hl, de

	ld a, [hROMBank]
	push af
	ld a, BANK(TileCollisionTable)
	rst Bankswitch
	ld e, [hl]
	pop af
	rst Bankswitch

	ld a, e
	and $f ; lo nybble only

	pop hl
	pop de
	ret
; 1875


Function1875:: ; 1875
	ld d, a
	and $f0
	cp $10
	jr z, .asm_1882
	cp $20
	jr z, .asm_1888
	scf
	ret

.asm_1882
	ld a, d
	and 7
	ret z
	scf
	ret

.asm_1888
	ld a, d
	and 7
	ret z
	scf
	ret
; 188e

Function188e:: ; 188e
	cp $14
	ret z
	cp $1c
	ret
; 1894

CheckCutTreeTile:: ; 1894
	cp $12
	ret z
	cp $1a
	ret
; 189a

CheckHeadbuttTreeTile:: ; 189a
	cp $15
	ret z
	cp $1d
	ret
; 18a0

CheckCounterTile:: ; 18a0
	cp $90
	ret z
	cp $98
	ret
; 18a6

CheckPitTile:: ; 18a6
	cp $60
	ret z
	cp $68
	ret
; 18ac

CheckIceTile:: ; 18ac
	cp $23
	ret z
	cp $2b
	ret z
	scf
	ret
; 18b4

CheckWhirlpoolTile:: ; 18b4
	nop
	cp $24
	ret z
	cp $2c
	ret z
	scf
	ret
; 18bd

CheckWaterfallTile:: ; 18bd
	cp $33
	ret z
	cp $3b
	ret
; 18c3

CheckStandingOnEntrance:: ; 18c3
	ld a, [StandingTile]
	cp $71 ; door
	ret z
	cp $79
	ret z
	cp $7a ; stairs
	ret z
	cp $7b ; cave
	ret
; 18d2


GetMapObject:: ; 18d2
; Return the location of map object a in bc.
	ld hl, MapObjects
	ld bc, $10
	call AddNTimes
	ld b, h
	ld c, l
	ret
; 18de


Function18de:: ; 18de
	ld [hConnectionStripLength], a
	call GetMapObject
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_18f3
	ld [hConnectedMapWidth], a
	call Function1ae5
	and a
	ret

.asm_18f3
	scf
	ret
; 18f5

Function18f5:: ; 18f5
	ld hl, $0006
	add hl, bc
	ld a, [hl]
	cp $ff
	jr nz, .asm_1921
	ld hl, $0007
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .asm_191c
	ld hl, .data_191e
	ld a, [TimeOfDay]
	add l
	ld l, a
	jr nc, .asm_1912
	inc h

.asm_1912
	ld a, [hl]
	ld hl, $0007
	add hl, bc
	and [hl]
	jr nz, .asm_191c
	scf
	ret

.asm_191c
	and a
	ret

.data_191e
	db $1
	db $2
	db $4

.asm_1921
	ld hl, $0006
	add hl, bc
	ld d, [hl]
	ld hl, $0007
	add hl, bc
	ld e, [hl]
	ld hl, hHours
	ld a, d
	cp e
	jr z, .asm_1949
	jr c, .asm_193f
	ld a, [hl]
	cp d
	jr nc, .asm_1949
	cp e
	jr c, .asm_1949
	jr z, .asm_1949
	jr .asm_194b

.asm_193f
	ld a, e
	cp [hl]
	jr c, .asm_194b
	ld a, [hl]
	cp d
	jr nc, .asm_1949
	jr .asm_194b

.asm_1949
	and a
	ret

.asm_194b
	scf
	ret
; 194d

Function194d:: ; 194d
	ld [hConnectionStripLength], a
	call GetMapObject
	call Function80e7
	ret
; 1956



Function1956:: ; 1956
	ld [hConnectionStripLength], a
	call Function271e
	ld a, [hConnectionStripLength]
	call GetMapObject
	callba Function80e7
	ret
; 1967

Function1967:: ; 1967
	ld [hConnectionStripLength], a
	call GetMapObject
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	cp $ff
	ret z
	ld [hl], $ff
	push af
	call Function1985
	pop af
	call Function1ae5
	callba Function4357
	ret
; 1985

Function1985:: ; 1985
	ld hl, $d4cd
	cp [hl]
	jr z, .asm_1990
	ld hl, $d4ce
	cp [hl]
	ret nz

.asm_1990
	callba Function581f
	ld a, $ff
	ld [$d4cd], a
	ld [$d4ce], a
	ret
; 199f

Function199f:: ; 199f
	call Function1967
	call Function2712
	ret
; 19a6

Function19a6:: ; 19a6
	push hl
	call GetMapObject
	ld d, b
	ld e, c
	ld a, $ff
	ld [de], a
	inc de
	pop hl
	ld bc, $000f
	call CopyBytes
	ret
; 19b8

Function19b8:: ; 19b8
	call GetMapObject
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	push af
	ld [hl], $ff
	inc hl
	ld bc, $000f
	xor a
	call ByteFill
	pop af
	cp $ff
	ret z
	cp $d
	ret nc
	ld b, a
	ld a, [$d4cd]
	cp b
	jr nz, .asm_19de
	ld a, $ff
	ld [$d4cd], a

.asm_19de
	ld a, b
	call Function1ae5
	callba Function4357
	ret
; 19e9



Function19e9:: ; 19e9
	ld [$c2e2], a
	ld a, [hROMBank]
	ld [$c2e3], a
	ld a, l
	ld [$c2e4], a
	ld a, h
	ld [$c2e5], a
	ld a, [$c2e2]
	call Function18de
	ret c
	ld hl, $0003
	add hl, bc
	ld [hl], $14
	ld hl, $0009
	add hl, bc
	ld [hl], $0
	ld hl, VramState
	set 7, [hl]
	and a
	ret
; 1a13



Function1a13:: ; 1a13
	push bc
	push de
	ld hl, $d4d6
	ld de, $0028
	ld c, $d
.asm_1a1d
	ld a, [hl]
	and a
	jr z, .asm_1a28
	add hl, de
	dec c
	jr nz, .asm_1a1d
	xor a
	jr .asm_1a2c

.asm_1a28
	ld a, $d
	sub c
	scf

.asm_1a2c
	pop de
	pop bc
	ret
; 1a2f



Function1a2f:: ; 1a2f
	ld hl, $0003
	add hl, bc
	ld a, [hl]
	cp $25
	jr c, .asm_1a39
	xor a

.asm_1a39
	ld hl, Data4273
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	ret
; 1a47

Function1a47:: ; 1a47
	push bc
	push de
	ld e, a
	ld d, 0
	ld hl, Data4273 + 1
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(Data4273)
	call GetFarByte
	add a
	add a
	and $c
	pop de
	pop bc
	ret
; 1a61


Function1a61:: ; 1a61
	ld l, a
	ld a, [hROMBank]
	push af
	ld a, BANK(Data4273)
	rst Bankswitch
	ld a, l
	push bc

	call Function1a71

	pop bc
	pop af
	rst Bankswitch

	ret
; 1a71

Function1a71:: ; 1a71
	ld hl, $0003
	add hl, de
	ld [hl], a
	push de
	ld e, a
	ld d, 0
	ld hl, Data4273 + 1
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld b, h
	ld c, l
	pop de
	ld a, [bc]
	inc bc
	rlca
	rlca
	and $c
	ld hl, $0008
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $000b
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $0004
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $0005
	add hl, de
	ld [hl], a
	ld a, [bc]
	inc bc
	ld hl, $0006
	add hl, de
	ld [hl], a
	ret
; 1aae

Function1aae:: ; 1aae
	ld a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld d, [hl]
	ld hl, $001b
	add hl, bc
	add [hl]
	ld e, a
	ld a, d
	adc $0
	ld d, a
	inc [hl]
	ld a, [de]
	ld h, a
	pop af
	rst Bankswitch

	ld a, h
	ret
; 1ac6

Function1ac6:: ; 1ac6
	ld hl, VramState
	set 0, [hl]
	ret
; 1acc

Function1acc:: ; 1acc
	ld hl, VramState
	res 0, [hl]
	ret
; 1ad2


Function1ad2:: ; 1ad2
	ld a, [VramState]
	bit 0, a
	ret z
	callba Function55e0
	callba Function5920
	ret
; 1ae5


Function1ae5:: ; 1ae5
	ld bc, $0028
	ld hl, $d4d6
	call AddNTimes
	ld b, h
	ld c, l
	ret
; 1af1

Function1af1:: ; 1af1
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	and a
	ret
; 1af8

Function1af8:: ; 1af8
	push af
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	and $f3
	ld e, a
	pop af
	and $c
	or e
	ld [hl], a
	ret
; 1b07


GetSpriteDirection:: ; 1b07
	ld hl, $0008
	add hl, bc
	ld a, [hl]
	and $c
	ret
; 1b0f

