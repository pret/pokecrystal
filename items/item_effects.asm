MasterBall:
UltraBall:
GreatBall:
PokeBall:
HeavyBall:
LevelBall:
LureBall:
FastBall:
FriendBall:
MoonBall:
LoveBall:
ParkBall: ; e8a2
	ld a, [IsInBattle]
	dec a
	jp nz, $77a0
	ld a, [PartyCount]
	cp $6
	jr nz, .asm_e8c0
	ld a, $1
	call GetSRAMBank

	ld a, [$ad10]
	cp $14
	call CloseSRAM

	jp z, $77dc

.asm_e8c0
	xor a
	ld [$c64e], a
	ld a, [CurItem]
	cp $b1
	call nz, $6dfa

	ld hl, Options
	res 4, [hl]
	ld hl, $783d
	call $1057

	ld a, [EnemyMonCatchRate]
	ld b, a
	ld a, [BattleType]
	cp $3
	jp z, .asm_e99c
	ld a, [CurItem]
	cp $1
	jp z, .asm_e99c
	ld a, [CurItem]
	ld c, a
	ld hl, Table_0xec0a

.asm_e8f2
	ld a, [hli]
	cp $ff
	jr z, .asm_e906
	cp c
	jr z, .asm_e8fe
	inc hl
	inc hl
	jr .asm_e8f2

.asm_e8fe
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $6906
	push de
	jp [hl]

.asm_e906
	ld a, [CurItem]
	cp $9f
	ld a, b
	jp z, $698e
	ld a, b
	ld [$ffb6], a
	ld hl, EnemyMonHPHi
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	sla c
	rl b
	ld h, d
	ld l, e
	add hl, de
	add hl, de
	ld d, h
	ld e, l
	ld a, d
	and a
	jr z, .asm_e940
	srl d
	rr e
	srl d
	rr e
	srl b
	rr c
	srl b
	rr c
	ld a, c
	and a
	jr nz, .asm_e940
	ld c, $1

.asm_e940
	ld b, e
	push bc
	ld a, b
	sub c
	ld [hMultiplier], a
	xor a
	ld [hProduct], a
	ld [hMultiplicand], a
	ld [$ffb5], a
	call Multiply

	pop bc
	ld a, b
	ld [hMultiplier], a
	ld b, $4
	call Divide

	ld a, [$ffb6]
	and a
	jr nz, .asm_e960
	ld a, $1

.asm_e960
	ld b, a
	ld a, [EnemyMonStatus]
	and $27
	ld c, $a
	jr nz, .asm_e971
	and a
	ld c, $5
	jr nz, .asm_e971
	ld c, $0

.asm_e971
	ld a, b
	add c
	jr nc, .asm_e977
	ld a, $ff

.asm_e977
	ld d, a
	push de
	ld a, [BattleMonItem]
	ld a, $d
	ld hl, $7dd0
	rst FarCall

	ld a, b
	cp $46
	pop de
	ld a, d
	jr nz, .asm_e98e
	add c
	jr nc, .asm_e98e
	ld a, $ff

.asm_e98e
	ld b, a
	ld [MagikarpLength], a
	call Random

	cp b
	ld a, $0
	jr z, .asm_e99c
	jr nc, .asm_e99f

.asm_e99c
	ld a, [EnemyMonSpecies]

.asm_e99f
	ld [$c64e], a
	ld c, $14
	call DelayFrames

	ld a, [CurItem]
	cp $6
	jr c, .asm_e9b0

	ld a, $5

.asm_e9b0
	ld [$c689], a
	ld de, $0100
	ld a, e
	ld [FXAnimIDLo], a
	ld a, d
	ld [FXAnimIDHi], a
	xor a
	ld [hBattleTurn], a
	ld [Buffer2], a
	ld [$cfca], a
	ld a, $37
	call Predef

	ld a, [$c64e]
	and a
	jr nz, .asm_e9f5
	ld a, [Buffer2]
	cp $1
	ld hl, $6db5
	jp z, $6bdc
	cp $2
	ld hl, $6dba
	jp z, $6bdc
	cp $3
	ld hl, $6dbf
	jp z, $6bdc
	cp $4
	ld hl, $6dc4
	jp z, $6bdc

.asm_e9f5
	ld hl, EnemyMonStatus
	ld a, [hli]
	push af
	inc hl
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	push hl
	ld hl, EnemyMonItem
	ld a, [hl]
	push af
	push hl
	ld hl, EnemySubStatus5
	ld a, [hl]
	push af
	set 3, [hl]
	bit 3, a
	jr nz, .asm_ea13
	jr .asm_ea1a

.asm_ea13
	ld a, $84
	ld [TempEnemyMonSpecies], a
	jr .asm_ea27

.asm_ea1a
	set 3, [hl]
	ld hl, $c6f2
	ld a, [EnemyMonAtkDefDV]
	ld [hli], a
	ld a, [EnemyMonSpdSpclDV]
	ld [hl], a

.asm_ea27
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, [EnemyMonLevel]
	ld [CurPartyLevel], a
	ld a, $f
	ld hl, $68eb
	rst FarCall

	pop af
	ld [EnemySubStatus5], a
	pop hl
	pop af
	ld [hl], a
	pop hl
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	dec hl
	pop af
	ld [hl], a
	ld hl, EnemySubStatus5
	bit 3, [hl]
	jr nz, .asm_ea67
	ld hl, $c735
	ld de, EnemyMonMove1
	ld bc, $0004
	call CopyBytes

	ld hl, $c739
	ld de, EnemyMonPPMove1
	ld bc, $0004
	call CopyBytes

.asm_ea67
	ld a, [EnemyMonSpecies]
	ld [$c64e], a
	ld [CurPartySpecies], a
	ld [$d265], a
	ld a, [BattleType]
	cp $3
	jp z, $6bd9
	ld a, $41
	ld hl, $607f
	rst FarCall

	ld hl, $6dc9
	call $1057

	call ClearSprites

	ld a, [$d265]
	dec a
	call $3393

	ld a, c
	push af
	ld a, [$d265]
	dec a
	call $3380

	pop af
	and a
	jr nz, .asm_eab7
	call $2ead

	jr z, .asm_eab7
	ld hl, $6df0
	call $1057

	call ClearSprites

	ld a, [EnemyMonSpecies]
	ld [$d265], a
	ld a, $43
	call Predef

.asm_eab7
	ld a, [BattleType]
	cp $6
	jp z, $6bd1
	cp $b
	jr nz, .asm_eac8
	ld hl, $d0ee
	set 6, [hl]

.asm_eac8
	ld a, [PartyCount]
	cp $6
	jr z, .asm_eb3c
	xor a
	ld [MonType], a
	call ClearSprites

	ld a, $6
	call Predef

	ld a, $13
	ld hl, $5b49
	rst FarCall

	ld a, [CurItem]
	cp $a4
	jr nz, .asm_eaf8
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Happiness
	ld bc, $0030
	call AddNTimes

	ld a, $c8
	ld [hl], a

.asm_eaf8
	ld hl, $6df5
	call $1057

	ld a, [CurPartySpecies]
	ld [$d265], a
	call $343b

	call $1dcf

	jp c, $6be2

	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	ld hl, PartyMon1Nickname
	ld bc, $000b
	call AddNTimes

	ld d, h
	ld e, l
	push de
	xor a
	ld [MonType], a
	ld b, $0
	ld a, $4
	ld hl, $56c1
	rst FarCall

	call $04b6

	call $0e51

	pop hl
	ld de, StringBuffer1
	call InitName

	jp $6be2

.asm_eb3c
	call ClearSprites

	ld a, $9
	call Predef

	ld a, $13
	ld hl, $5b83
	rst FarCall

	ld a, $1
	call GetSRAMBank

	ld a, [$ad10]
	cp $14
	jr nz, .asm_eb5b
	ld hl, $d0ee
	set 7, [hl]

.asm_eb5b
	ld a, [CurItem]
	cp $a4
	jr nz, .asm_eb67
	ld a, $c8
	ld [$ad41], a

.asm_eb67
	call CloseSRAM

	ld hl, $6df5
	call $1057

	ld a, [CurPartySpecies]
	ld [$d265], a
	call $343b

	call $1dcf

	jr c, .asm_ebaf

	xor a
	ld [CurPartyMon], a
	ld a, BOXMON
	ld [MonType], a
	ld de, $d050
	ld b, $0
	ld a, $4
	ld hl, $56c1
	rst FarCall

	ld a, $1
	call GetSRAMBank

	ld hl, $d050
	ld de, $b082
	ld bc, $000b
	call CopyBytes

	ld hl, $b082
	ld de, StringBuffer1
	call InitName

	call CloseSRAM

.asm_ebaf
	ld a, $1
	call GetSRAMBank

	ld hl, $b082
	ld de, $d050
	ld bc, $000b
	call CopyBytes

	call CloseSRAM

	ld hl, $6deb
	call $1057

	call $04b6

	call $0e51

	jr .asm_ebe2

	ld a, $3
	ld hl, $66ce
	rst FarCall

	jr .asm_ebe2

	ld hl, $6dc9
	call $1057

	call ClearSprites

.asm_ebe2
	ld a, [BattleType]
	cp $3
	ret z
	cp $2
	ret z
	cp $6
	jr z, .asm_ec05
	ld a, [$c64e]
	and a
	jr z, .asm_ebfb
	call WhiteBGMap

	call ClearTileMap

.asm_ebfb
	ld hl, NumItems
	inc a
	ld [$d10c], a
	jp $2f53

.asm_ec05
	ld hl, $dc79
	dec [hl]
	ret
; ec0a


Table_0xec0a: ; ec0a
	dbw ULTRA_BALL, Function_0xec29
	dbw GREAT_BALL, Function_0xec2f
	dbw MOON_STONE, Function_0xec2f
	dbw HEAVY_BALL, Function_0xec50
	dbw LEVEL_BALL, Function_0xed8c
	dbw LURE_BALL,  Function_0xeccc
	dbw FAST_BALL,  Function_0xed68
	dbw MOON_BALL,  Function_0xecdd
	dbw LOVE_BALL,  Function_0xed12
	dbw PARK_BALL,  Function_0xec2f
	db $ff
; ec29


Function_0xec29: ; ec29
	sla b
	ret nc
	ld b, $ff
	ret
; ec2f


Function_0xec2f: ; ec2f
	ld a, b
	srl a
	add b
	ld b, a
	ret nc
	ld b, $ff
	ret
; ec38


GetPokedexEntryBank: ; ec38
	push hl
	push de
	ld a, [EnemyMonSpecies]
	rlca
	rlca
	and 3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; ec50

Function_0xec50: ; ec50
	ld a, [EnemyMonSpecies]
	ld hl, PokedexDataPointerTable
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword

.SkipText
	call GetPokedexEntryBank
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .SkipText

	call GetPokedexEntryBank
	push bc
	inc hl
	inc hl
	call GetFarHalfword

	srl h
	rr l
	ld b, h
	ld c, l
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	call .asm_ec99

	srl b
	rr c
	call .asm_ec99

	ld a, h
	pop bc
	jr .asm_eca4

.asm_ec99
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	pop bc
	ret

.asm_eca4
	ld c, a
	cp $4
	jr c, .asm_ecbc

	ld hl, .table_ecc4
.asm_ecac
	ld a, c
	cp [hl]
	jr c, .asm_ecb4
	inc hl
	inc hl
	jr .asm_ecac

.asm_ecb4
	inc hl
	ld a, b
	add [hl]
	ld b, a
	ret nc
	ld b, $ff
	ret

.asm_ecbc
	ld a, b
	sub 20
	ld b, a
	ret nc
	ld b, $1
	ret

.table_ecc4
	db 8, 0
	db 12, 20
	db 16, 30
	db 255, 40
; eccc


Function_0xeccc: ; eccc
	ld a, [BattleType]
	cp $4
	ret nz
	ld a, b
	add a
	jr c, .asm_ecd9

	add b
	jr nc, .asm_ecdb

.asm_ecd9
	ld a, $ff

.asm_ecdb
	ld b, a
	ret
; ecdd


Function_0xecdd: ; ecdd
	push bc
	ld a, [TempEnemyMonSpecies]
	dec a
	ld c, a
	ld b, $0
	ld hl, $65b1
	add hl, bc
	add hl, bc
	ld a, $10
	call GetFarHalfword

	pop bc
	push bc
	ld a, $10
	call GetFarByte

	cp $2
	pop bc
	ret nz
	inc hl
	inc hl
	inc hl
	push bc
	ld a, $10
	call GetFarByte

	cp $a
	pop bc
	ret nz
	sla b
	jr c, .asm_ed0f

	sla b
	jr nc, .asm_ed11

.asm_ed0f
	ld b, $ff

.asm_ed11
	ret
; ed12


Function_0xed12: ; ed12
	ld a, [TempEnemyMonSpecies]
	ld c, a
	ld a, [TempBattleMonSpecies]
	cp c
	ret nz

	push bc
	ld a, [TempBattleMonSpecies]
	ld [CurPartySpecies], a
	xor a
	ld [MonType], a
	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld a, $14
	ld hl, $4bdd
	rst FarCall
	jr c, .asm_ed66

	ld d, 0
	jr nz, .asm_ed39
	inc d
.asm_ed39

	push de
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, WILDMON
	ld [MonType], a
	ld a, $14
	ld hl, $4bdd
	rst FarCall
	jr c, .asm_ed65

	ld d, 0
	jr nz, .asm_ed52
	inc d
.asm_ed52

	ld a, d
	pop de
	cp d
	pop bc
	ret nz

	sla b
	jr c, .asm_ed62
	sla b
	jr c, .asm_ed62
	sla b
	ret nc
.asm_ed62
	ld b, $ff
	ret

.asm_ed65
	pop de

.asm_ed66
	pop bc
	ret
; ed68


Function_0xed68: ; ed68
	ld a, [TempEnemyMonSpecies]
	ld c, a
	ld hl, $459a
	ld d, $3

.asm_ed71
	ld a, $f
	call GetFarByte

	inc hl
	cp $ff
	jr z, .asm_ed88
	cp c
	jr nz, .asm_ed88
	sla b
	jr c, .asm_ed85

	sla b
	ret nc

.asm_ed85
	ld b, $ff
	ret

.asm_ed88
	dec d
	jr nz, .asm_ed71
	ret
; ed8c


Function_0xed8c: ; ed8c
	ld a, [BattleMonLevel]
	ld c, a
	ld a, [EnemyMonLevel]
	cp c
	ret nc
	sla b
	jr c, .asm_eda8

	srl c
	cp c
	ret nc
	sla b
	jr c, .asm_eda8

	srl c
	cp c
	ret nc
	sla b
	ret nc

.asm_eda8
	ld b, $ff
	ret
; edab


INCBIN "baserom.gbc", $edab, $ee01 - $edab


Item06: ; ee01
	ld a, $24
	ld hl, $5ae1
	rst FarCall
	ret
; ee08


Bicycle: ; ee08
	ld a, $3
	ld hl, $50b3
	rst FarCall
	ret
; ee0f


MoonStone:
FireStone:
Thunderstone:
WaterStone:
LeafStone:
SunStone: ; ee0f
	ld b, $5
	call $71f9

	jp c, $6e38

	ld a, $1
	call GetPartyParamLocation

	ld a, [hl]
	cp $70
	jr z, .asm_ee35
	ld a, $1
	ld [$d1e9], a
	ld a, $10
	ld hl, $61d8
	rst FarCall

	ld a, [$d268]
	and a
	jr z, .asm_ee35
	jp $7795

.asm_ee35
	call $77f2

	xor a
	ld [$d0ec], a
	ret
; ee3d


HpUp:
Protein:
Iron:
Carbos:
Calcium: ; ee3d
	ld b, $1
	call $71f9

	jp c, $6e9f

	call $6ef5

	call $6ed9

	ld a, $b
	call GetPartyParamLocation

	add hl, bc
	ld a, [hl]
	cp $64
	jr nc, .asm_ee83
	add $a
	ld [hl], a
	call $6e8c

	call $6ed9

	ld hl, $6eab
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer2
	ld bc, $000d
	call CopyBytes

	call $7780

	ld hl, $6ea6
	call $1057

	ld c, $2
	ld a, $1
	ld hl, $71c2
	rst FarCall

	jp $7795

.asm_ee83
	ld hl, $781f
	call $1057

	jp ClearPalettes
; ee8c


INCBIN "baserom.gbc", $ee8c, $ef14 - $ee8c


RareCandy: ; ef14
	ld b, $1
	call $71f9

	jp c, $6e9f

	call $6ef5

	ld a, $1f
	call GetPartyParamLocation

	ld a, [hl]
	cp $64
	jp nc, $6e83
	inc a
	ld [hl], a
	ld [CurPartyLevel], a
	push de
	ld d, a
	ld a, $14
	ld hl, $4e47
	rst FarCall

	pop de
	ld a, $8
	call GetPartyParamLocation

	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	ld a, $24
	call GetPartyParamLocation

	ld a, [hli]
	ld b, a
	ld c, [hl]
	push bc
	call $6e8c

	ld a, $25
	call GetPartyParamLocation

	pop bc
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	dec hl
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld a, $9
	ld hl, $709e
	rst FarCall

	ld a, $f8
	call $724a

	xor a
	ld [MonType], a
	ld a, $1f
	call Predef

	ld hl, $c4a9
	ld b, $a
	ld c, $9
	call $0fe8

	ld hl, $c4bf
	ld bc, $0004
	ld a, $28
	call Predef

	call $0a80

	xor a
	ld [MonType], a
	ld a, [CurPartySpecies]
	ld [$d265], a
	ld a, $1a
	call Predef

	xor a
	ld [$d1e9], a
	ld a, $10
	ld hl, $61d8
	rst FarCall

	jp $7795
; efad


HealPowder: ; efad
	ld b, $1
	call $71f9

	jp c, $729e

	call $6fda

	cp $0
	jr nz, .asm_efc9
	ld c, $f
	ld a, $1
	ld hl, $71c2
	rst FarCall

	call $77d6

	ld a, $0

.asm_efc9
	jp $709e
; efcc


Antidote:
BurnHeal:
IceHeal:
Awakening:
ParlyzHeal:
FullHeal:
Psncureberry:
Przcureberry:
BurntBerry:
IceBerry:
MintBerry:
Miracleberry: ; efcc
	ld b, $1
	call $71f9

	jp c, $729e

	call $6fda

	jp $709e
; efda


; known jump sources: efb5 (3:6fb5), efd4 (3:6fd4)
Functionefda: ; efda (3:6fda)
	call Functionf30d
	ld a, $1
	ret z
	call Functionf058
	ld a, $20
	call GetPartyParamLocation
	ld a, [hl]
	and c
	jr nz, .asm_eff4
	call Functionf009
	ld a, $1
	ret nc
	ld b, $f9
.asm_eff4
	xor a
	ld [hl], a
	ld a, b
	ld [PartyMenuActionText], a ; $d141
	call Functionf030
	call Functionf780
	call Functionf279
	call Functionf795
	ld a, $0
	ret

; known jump sources: efec (3:6fec)
Functionf009: ; f009 (3:7009)
	call Functionf2a6
	jr nc, .asm_f01c
	ld a, [PlayerSubStatus3] ; $c66a
	bit 7, a
	jr z, .asm_f01c
	ld a, c
	cp $ff
	jr nz, .asm_f01c
	scf
	ret
.asm_f01c
	and a
	ret

; known jump sources: f156 (3:7156), f1c7 (3:71c7)
Functionf01e: ; f01e (3:701e)
	call Functionf2a6
	ret nc
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [BattleMonHP], a ; $c63c
	ld a, [hld]
	ld [$c63d], a
	ret

; known jump sources: effa (3:6ffa), f153 (3:7153)
Functionf030: ; f030 (3:7030)
	call Functionf2a6
	ret nc
	xor a
	ld [BattleMonStatus], a ; $c63a
	ld hl, PlayerSubStatus5 ; $c66c
	res 0, [hl]
	ld hl, PlayerSubStatus1 ; $c668
	res 0, [hl]
	call Functionf058
	ld a, c
	cp $ff
	jr nz, .asm_f04f
	ld hl, PlayerSubStatus3 ; $c66a
	res 7, [hl]
.asm_f04f
	push bc
	ld a, BANK(Function0x365d7)
	ld hl, Function0x365d7
	rst $8 ;  ; indirect jump to Function0x365d7 (365d7 (d:65d7))
	pop bc
	ret

; known jump sources: efe0 (3:6fe0), f042 (3:7042)
Functionf058: ; f058 (3:7058)
	push hl
	ld a, [CurItem] ; $d106
	ld hl, $7071
	ld bc, $3
.asm_f062
	cp [hl]
	jr z, .asm_f068
	add hl, bc
	jr .asm_f062
.asm_f068
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hl]
	ld c, a
	cp $ff
	pop hl
	ret
; f071 (3:7071)

INCBIN "baserom.gbc",$f071,$f09e - $f071

; known jump sources: efc9 (3:6fc9), efd7 (3:6fd7), f0c5 (3:70c5), f0d3 (3:70d3), f141 (3:7141), f183 (3:7183), f189 (3:7189), f1a6 (3:71a6)
Functionf09e: ; f09e (3:709e)
	ld hl, $70a3
	rst $28
	ret

; no known jump sources
Jumptable_f0a3: ; f0a3 (3:70a3)
	dw Functionf2a2
	dw Functionf299
	dw Functionf29e


RevivalHerb: ; f0a9
	ld b, $1
	call $71f9

	jp c, $729e

	call $70d6

	cp $0
	jr nz, .asm_f0c5
	ld c, $11
	ld a, $1
	ld hl, $71c2
	rst FarCall

	call $77d6

	ld a, $0

.asm_f0c5
	jp $709e
; f0c8


Revive:
MaxRevive: ; f0c8
	ld b, $1
	call $71f9

	jp c, $729e

	call $70d6

	jp $709e
; f0d6


INCBIN "baserom.gbc", $f0d6, $f128 - $f0d6


FullRestore: ; f128
	ld b, $1
	call $71f9

	jp c, $729e

	call $730d

	jp z, $7299
	call $731b

	jr c, .asm_f13e

	jp $6fd4

.asm_f13e
	call $7144

	jp $709e
; f144


INCBIN "baserom.gbc", $f144, $f16a - $f144


BitterBerry: ; f16a
	ld hl, PlayerSubStatus3
	bit 7, [hl]
	ld a, $1
	jr z, .asm_f183
	res 7, [hl]
	xor a
	ld [hBattleTurn], a
	call $7789

	ld hl, $4d81
	call StdBattleTextBox

	ld a, $0

.asm_f183
	jp $709e
; f186


MaxPotion:
HyperPotion:
SuperPotion:
Potion:
FreshWater:
SodaPop:
Lemonade:
MoomooMilk:
Ragecandybar:
BerryJuice:
Berry:
GoldBerry: ; f186
	call $71a9
	jp $709e
; f18c


Energypowder: ; f18c
	ld c, $f
	jr Function_0xf192
; f190

EnergyRoot: ; f190
	ld c, $10
; f192

Function_0xf192: ; f192
	push bc
	call $71a9

	pop bc
	cp $0
	jr nz, .asm_f1a6
	ld a, $1
	ld hl, $71c2
	rst FarCall

	call $77d6

	ld a, $0

.asm_f1a6
	jp $709e
; f1a9


; known jump sources: f186 (3:7186), f193 (3:7193)
Functionf1a9: ; f1a9 (3:71a9)
	ld b, $1
	call Functionf1f9
	ld a, $2
	ret c
	call Functionf30d
	ld a, $1
	ret z
	call Functionf31b
	ld a, $1
	ret nc
	xor a
	ld [Danger], a ; $c2a6
	call Functionf395
	call Functionf2d1
	call Functionf01e
	call Functionf1db
	ld a, $f5
	ld [PartyMenuActionText], a ; $d141
	call Functionf279
	call Functionf795
	ld a, $0
	ret

; known jump sources: f117 (3:7117), f159 (3:7159), f1ca (3:71ca), f3f7 (3:73f7), f408 (3:7408)
Functionf1db: ; f1db (3:71db)
	push de
	ld de, $4
	call WaitPlaySFX
	pop de
	ld a, [CurPartyMon] ; $d109
	ld hl, $c4ab
	ld bc, $28
	call AddNTimes
	ld a, $2
	ld [$d10a], a
	ld a, $b
	jp Predef

; known jump sources: ee11 (3:6e11), ee3f (3:6e3f), ef16 (3:6f16), efaf (3:6faf), efce (3:6fce), f0ab (3:70ab), f0ca (3:70ca), f12a (3:712a), f1ab (3:71ab), f5c7 (3:75c7)
Functionf1f9: ; f1f9 (3:71f9)
	call Functionf20b
	ret c
	ld a, [CurPartySpecies] ; $d108
	cp $fd
	jr nz, .asm_f209
	call Functionf7e8
	scf
	ret
.asm_f209
	and a
	ret

; known jump sources: f1f9 (3:71f9)
Functionf20b: ; f20b (3:720b)
	ld a, b
	ld [PartyMenuActionText], a ; $d141
	push hl
	push de
	push bc
	call WhiteBGMap
	call Functionf21c
	pop bc
	pop de
	pop hl
	ret

; known jump sources: f215 (3:7215), f41f (3:741f)
Functionf21c: ; f21c (3:721c)
	ld a, BANK(Function5004f)
	ld hl, Function5004f
	rst $8 ;  ; indirect jump to Function5004f (5004f (14:404f))
	ld a, BANK(Function50405)
	ld hl, Function50405
	rst $8 ;  ; indirect jump to Function50405 (50405 (14:4405))
	ld a, BANK(Function503e0)
	ld hl, Function503e0
	rst $8 ;  ; indirect jump to Function503e0 (503e0 (14:43e0))
	ld a, BANK(WritePartyMenuTilemap)
	ld hl, WritePartyMenuTilemap
	rst $8 ;  ; indirect jump to WritePartyMenuTilemap (5005f (14:405f))
	ld a, BANK(PrintPartyMenuText)
	ld hl, PrintPartyMenuText
	rst $8 ;  ; indirect jump to PrintPartyMenuText (5049a (14:449a))
	call WaitBGMap
	call Function32f9
	call DelayFrame
	ld a, BANK(PartyMenuSelect)
	ld hl, PartyMenuSelect
	rst $8 ;  ; indirect jump to PartyMenuSelect (50457 (14:4457))
	ret

; known jump sources: ef6d (3:6f6d), f28a (3:728a), f40d (3:740d)
Functionf24a: ; f24a (3:724a)
	ld [PartyMenuActionText], a ; $d141
	ld a, [CurPartySpecies] ; $d108
	push af
	ld a, [CurPartyMon] ; $d109
	push af
	push hl
	push de
	push bc
	ld a, BANK(WritePartyMenuTilemap)
	ld hl, WritePartyMenuTilemap
	rst $8 ;  ; indirect jump to WritePartyMenuTilemap (5005f (14:405f))
	ld a, BANK(Function50566)
	ld hl, Function50566
	rst $8 ;  ; indirect jump to Function50566 (50566 (14:4566))
	call WaitBGMap
	call Function32f9
	call DelayFrame
	pop bc
	pop de
	pop hl
	pop af
	ld [CurPartyMon], a ; $d109
	pop af
	ld [CurPartySpecies], a ; $d108
	ret

; known jump sources: f000 (3:7000), f11f (3:711f), f161 (3:7161), f1d2 (3:71d2)
Functionf279: ; f279 (3:7279)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, TileMap ; $c4a0 (aliases: SpritesEnd)
	ld bc, $168
	ld a, $7f
	call ByteFill
	ld a, [PartyMenuActionText] ; $d141
	call Functionf24a
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ld c, $32
	call DelayFrames
	jp Functiona80

; known jump sources: f133 (3:7133)
Functionf299: ; f299 (3:7299)
	call Functionf7f2
	jr Functionf2a2

; known jump sources: efb2 (3:6fb2), efd1 (3:6fd1), f0ae (3:70ae), f0cd (3:70cd), f12d (3:712d)
Functionf29e: ; f29e (3:729e)
	xor a
	ld [$d0ec], a

; known jump sources: f29c (3:729c)
Functionf2a2: ; f2a2 (3:72a2)
	call ClearPalettes
	ret

; known jump sources: f009 (3:7009), f01e (3:701e), f030 (3:7030)
Functionf2a6: ; f2a6 (3:72a6)
	ld a, [IsInBattle] ; $d22d (aliases: EnemyMonEnd)
	and a
	ret z
	ld a, [CurPartyMon] ; $d109
	push hl
	ld hl, CurBattleMon ; $d0d4
	cp [hl]
	pop hl
	jr nz, .asm_f2b8
	scf
	ret
.asm_f2b8
	xor a
	ret

; known jump sources: f114 (3:7114)
Functionf2ba: ; f2ba (3:72ba)
	call Functionf36f
	srl d
	rr e
	jr asm_f2c6

; known jump sources: f10f (3:710f), f148 (3:7148), f2f5 (3:72f5)
Functionf2c3: ; f2c3 (3:72c3)
	call Functionf36f
asm_f2c6: ; f2c6 (3:72c6)
	ld a, $22
	call GetPartyParamLocation
	ld [hl], d
	inc hl
	ld [hl], e
	jp Functionf328

; known jump sources: f1c4 (3:71c4), f405 (3:7405)
Functionf2d1: ; f2d1 (3:72d1)
	ld a, $23
	call GetPartyParamLocation
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr c, .asm_f2f5
	call Functionf328
	ld a, $23
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, $25
	call GetPartyParamLocation
	ld a, [de]
	sub [hl]
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .asm_f2f8
.asm_f2f5
	call Functionf2c3
.asm_f2f8
	ret

; known jump sources: f3f3 (3:73f3)
Functionf2f9: ; f2f9 (3:72f9)
	ld a, $23
	call GetPartyParamLocation
	ld a, [hl]
	sub e
	ld [hld], a
	ld a, [hl]
	sbc d
	ld [hl], a
	jr nc, .asm_f309
	xor a
	ld [hld], a
	ld [hl], a
.asm_f309
	call Functionf328
	ret

; known jump sources: efda (3:6fda), f0d6 (3:70d6), f130 (3:7130), f1b1 (3:71b1), f3ed (3:73ed), f402 (3:7402), f432 (3:7432)
Functionf30d: ; f30d (3:730d)
	push de
	call Functionf35f
	call Functionf348
	call Functionf356
	ld a, d
	or e
	pop de
	ret

; known jump sources: f136 (3:7136), f1b7 (3:71b7), f437 (3:7437)
Functionf31b: ; f31b (3:731b)
	call Functionf356
	ld h, d
	ld l, e
	call Functionf36f
	ld a, l
	sub e
	ld a, h
	sbc d
	ret

; known jump sources: f2ce (3:72ce), f2de (3:72de), f309 (3:7309)
Functionf328: ; f328 (3:7328)
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [$d1ef], a
	ld a, [hl]
	ld [$d1ee], a
	ret
; f336 (3:7336)

INCBIN "baserom.gbc",$f336,$f348 - $f336

; known jump sources: f311 (3:7311)
Functionf348: ; f348 (3:7348)
	ld a, $22
	call GetPartyParamLocation
	ld a, [hli]
	ld [$d1ed], a
	ld a, [hl]
	ld [$d1ec], a
	ret

; known jump sources: f314 (3:7314), f31b (3:731b)
Functionf356: ; f356 (3:7356)
	ld a, [$d1ed]
	ld d, a
	ld a, [$d1ec]
	ld e, a
	ret

; known jump sources: f30e (3:730e)
Functionf35f: ; f35f (3:735f)
	push hl
	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld [Buffer2], a ; $d1eb (aliases: MovementType)
	ld a, [hl]
	ld [Buffer1], a ; $d1ea (aliases: MagikarpLength)
	pop hl
	ret

; known jump sources: f2ba (3:72ba), f2c3 (3:72c3), f320 (3:7320)
Functionf36f: ; f36f (3:736f)
	ld a, [Buffer2] ; $d1eb (aliases: MovementType)
	ld d, a
	ld a, [Buffer1] ; $d1ea (aliases: MagikarpLength)
	ld e, a
	ret

; known jump sources: f3f0 (3:73f0), f3fb (3:73fb)
Functionf378: ; f378 (3:7378)
	push bc
	ld a, $24
	call GetPartyParamLocation
	ld a, [hli]
	ld [hPastLeadingZeroes], a ; $ff00+$b3 (aliases: hDividend, hProduct)
	ld a, [hl]
	ld [hQuotient], a ; $ff00+$b4 (aliases: hMultiplicand)
	ld a, $5
	ld [hDivisor], a ; $ff00+$b7 (aliases: hMultiplier)
	ld b, $2
	call Divide
	ld a, [$FF00+$b5]
	ld d, a
	ld a, [$FF00+$b6]
	ld e, a
	pop bc
	ret

; known jump sources: f1c1 (3:71c1)
Functionf395: ; f395 (3:7395)
	push hl
	ld a, [CurItem] ; $d106
	ld hl, $73af
	ld d, a
.asm_f39d
	ld a, [hli]
	cp $ff
	jr z, .asm_f3a9
	cp d
	jr z, .asm_f3aa
	inc hl
	inc hl
	jr .asm_f39d
.asm_f3a9
	scf
.asm_f3aa
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret
; f3af (3:73af)

INCBIN "baserom.gbc",$f3af,$f3df - $f3af

Functionf3df: ; f3df (3:73df)
	ld a, [$d0d8]
	dec a
	ld b, a
	call Functionf419
	jr c, .asm_f413
	ld a, b
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	call Functionf378
	call Functionf2f9
	push bc
	call Functionf1db
	pop bc
	call Functionf378
	ld a, c
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	call Functionf2d1
	call Functionf1db
	ld a, $f5
	call Functionf24a
	call Functiona36
.asm_f413
	ld a, b
	inc a
	ld [$d0d8], a
	ret

; known jump sources: f3e4 (3:73e4), f448 (3:7448)
Functionf419: ; f419 (3:7419)
	push bc
	ld a, $1
	ld [PartyMenuActionText], a ; $d141
	call Functionf21c
	pop bc
	jr c, .asm_f43e
	ld a, [$d0d8]
	dec a
	ld c, a
	ld a, b
	cp c
	jr z, .asm_f440
	ld a, c
	ld [CurPartyMon], a ; $d109
	call Functionf30d
	jr z, .asm_f440
	call Functionf31b
	jr nc, .asm_f440
	xor a
	ret
.asm_f43e
	scf
	ret
.asm_f440
	push bc
	ld hl, $744a
	call Function1d67
	pop bc
	jr Functionf419
; f44a (3:744a)

INCBIN "baserom.gbc",$f44a,$f44f - $f44a

EscapeRope: ; f44f
	xor a
	ld [$d0ec], a
	ld a, $3
	ld hl, $4b95
	rst FarCall

	ld a, [$d0ec]
	cp $1
	call z, $7795
	ret
; f462


SuperRepel: ; f462
	ld b, $c8
	jr Function_0xf46c
; f466

MaxRepel: ; f466
	ld b, $fa
	jr Function_0xf46c
; f466

Repel: ; f46a
	ld b, $64
; f46c

Function_0xf46c: ; f46c
	ld a, [$dca1]
	and a
	ld hl, $747d
	jp nz, $1057
	ld a, b
	ld [$dca1], a
	jp $7789
; f47d


INCBIN "baserom.gbc", $f47d, $f482 - $f47d


XAccuracy: ; f482
	ld hl, PlayerSubStatus4
	bit 0, [hl]
	jp nz, $77ca
	set 0, [hl]
	jp $7789
; f48f


PokeDoll: ; f48f
	ld a, [IsInBattle]
	dec a
	jr nz, .asm_f4a6
	inc a
	ld [$d232], a
	ld a, [$d0ee]
	and $c0
	or $2
	ld [$d0ee], a
	jp $7789

.asm_f4a6
	xor a
	ld [$d0ec], a
	ret
; f4ab


GuardSpec: ; f4ab
	ld hl, PlayerSubStatus4
	bit 1, [hl]
	jp nz, $77ca
	set 1, [hl]
	jp $7789
; f4b8


DireHit: ; f4b8
	ld hl, PlayerSubStatus4
	bit 2, [hl]
	jp nz, $77ca
	set 2, [hl]
	jp $7789
; f4c5


XAttack:
XDefend:
XSpeed:
XSpecial: ; f4c5
	call $7789

	ld a, [CurItem]
	ld hl, $7504

.asm_f4ce
	cp [hl]
	jr z, .asm_f4d5
	inc hl
	inc hl
	jr .asm_f4ce

.asm_f4d5
	inc hl
	ld b, [hl]
	xor a
	ld [hBattleTurn], a
	ld [AttackMissed], a
	ld [$c70d], a
	ld a, $d
	ld hl, $61ef
	rst FarCall

	call WaitSFX

	ld a, $d
	ld hl, $63b8
	rst FarCall

	ld a, $d
	ld hl, $644c
	rst FarCall

	ld a, [CurBattleMon]
	ld [CurPartyMon], a
	ld c, $3
	ld a, $1
	ld hl, $71c2
	rst FarCall
	ret
; f504


INCBIN "baserom.gbc", $f504, $f50c - $f504


Item38: ; f50c
	ld a, [IsInBattle]
	and a
	jr nz, .asm_f512

.asm_f512
	xor a
	ld [DefaultFlypoint], a
	ld b, $f8
	ld hl, PartyMon1Status
	call .asm_f554

	ld a, [IsInBattle]
	cp $1
	jr z, .asm_f52b
	ld hl, OTPartyMon1Status
	call .asm_f554

.asm_f52b
	ld hl, BattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, EnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld a, [DefaultFlypoint]
	and a
	ld hl, UnknownText_0xf56c
	jp z, $1057
	ld hl, UnknownText_0xf576
	call $1057

	ld a, [Danger]
	and $80
	jr nz, .asm_f54e

.asm_f54e
	ld hl, UnknownText_0xf571
	jp $1057


.asm_f554
	ld de, $0030
	ld c, $6

.asm_f559
	ld a, [hl]
	push af
	and $7
	jr z, .asm_f564
	ld a, $1
	ld [DefaultFlypoint], a

.asm_f564
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_f559
	ret
; f56c


UnknownText_0xf56c: ; 0xf56c
	text_jump UnknownText_0x1c5bf9, BANK(UnknownText_0x1c5bf9)
	db "@"
; 0xf571

UnknownText_0xf571: ; 0xf571
	text_jump UnknownText_0x1c5c28, BANK(UnknownText_0x1c5c28)
	db "@"
; 0xf576

UnknownText_0xf576: ; 0xf576
	text_jump UnknownText_0x1c5c44, BANK(UnknownText_0x1c5c44)
	start_asm
; 0xf57b


Function_0xf57b: ; f57b
	ld a, [IsInBattle]
	and a
	jr nz, .asm_f58c

	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de

.asm_f58c
	jp $13e0
; f58f


BlueCard: ; f58f
	ld hl, .bluecardtext
	jp $2012

.bluecardtext
	text_jump UnknownText_0x1c5c5e, BANK(UnknownText_0x1c5c5e)
	db "@"
; f59a


CoinCase: ; f59a
	ld hl, .coincasetext
	jp $2012

.coincasetext
	text_jump UnknownText_0x1c5c7b, BANK(UnknownText_0x1c5c7b)
	db "@"
; f5a5


OldRod: ; f5a5
	ld e, $0
	jr Function_0xf5b1
; f5a9

GoodRod: ; f5a9
	ld e, $1
	jr Function_0xf5b1
; f5ad

SuperRod: ; f5ad
	ld e, $2
	jr Function_0xf5b1
; f5b1

Function_0xf5b1: ; f5b1
	ld a, $3
	ld hl, $4f8e
	rst FarCall
	ret
; f5b8


Itemfinder: ; f5b8
	ld a, $4
	ld hl, $6580
	rst FarCall
	ret
; f5bf


MaxElixer:
PpUp:
Ether:
MaxEther:
Elixer:
Mysteryberry: ; f5bf
	ld a, [CurItem]
	ld [DefaultFlypoint], a

.asm_f5c5
	ld b, $1
	call $71f9

	jp c, $76e0

.asm_f5cd
	ld a, [DefaultFlypoint]
	cp $15
	jp z, $76af
	cp $41
	jp z, $76af
	ld hl, $7725
	ld a, [DefaultFlypoint]
	cp $3e
	jr z, .asm_f5e7
	ld hl, $772a

.asm_f5e7
	call $1057

	ld a, [CurMoveNum]
	push af
	xor a
	ld [CurMoveNum], a
	ld a, $2
	ld [$d235], a
	ld a, $f
	ld hl, $64bc
	rst FarCall

	pop bc
	ld a, b
	ld [CurMoveNum], a
	jr nz, .asm_f5c5
	ld hl, PartyMon1Move1
	ld bc, $0030
	call $7963

	push hl
	ld a, [hl]
	ld [$d265], a
	call $34f8

	call CopyName1

	pop hl
	ld a, [DefaultFlypoint]
	cp $3e
	jp nz, $76a7
	ld a, [hl]
	cp $a6
	jr z, .asm_f62f
	ld bc, $0015
	add hl, bc
	ld a, [hl]
	cp $c0
	jr c, .asm_f637

.asm_f62f
	ld hl, $772f
	call $1057

	jr .asm_f5cd

.asm_f637
	ld a, [hl]
	add $40
	ld [hl], a
	ld a, $1
	ld [$d265], a
	call $784c

	call $7780

	ld hl, $7734
	call $1057

	call ClearPalettes

	jp $7795
; f652


INCBIN "baserom.gbc", $f652, $f73e - $f652


Squirtbottle: ; f73e
	callba _Squirtbottle
	ret
; f745


CardKey: ; f745
	callba _CardKey
	ret
; f74c


BasementKey: ; f74c
	callba _BasementKey
	ret
; f753


SacredAsh: ; f753
	callba _SacredAsh
	ld a, [$d0ec]
	cp $1
	ret nz
	call $7795
	ret
; f763


NormalBox: ; f763
	ld c, $2c
	jr Function_0xf769
; f767

GorgeousBox: ; f767
	ld c, $2b
; f769

Function_0xf769: ; f769
	ld a, $9
	ld hl, $6f02
	rst FarCall

	ld hl, UnknownText_0xf778
	call $1057

	jp $7795
; f778

UnknownText_0xf778: ; 0xf778
	text_jump UnknownText_0x1c5d03, BANK(UnknownText_0x1c5d03)
	db "@"
; 0xf77d



Brightpowder:
Item19:
LuckyPunch:
MetalPowder:
Nugget:
Item2D:
Item32:
ExpShare:
SilverLeaf:
RedScale:
Secretpotion:
SSTicket:
MysteryEgg:
ClearBell:
SilverWing:
QuickClaw:
GoldLeaf:
SoftSand:
SharpBeak:
PoisonBarb:
KingsRock:
RedApricorn:
Tinymushroom:
BigMushroom:
Silverpowder:
BluApricorn:
Item5A:
AmuletCoin:
YlwApricorn:
GrnApricorn:
CleanseTag:
MysticWater:
Twistedspoon:
WhtApricorn:
Blackbelt:
BlkApricorn:
Item64:
PnkApricorn:
Blackglasses:
Slowpoketail:
PinkBow:
Stick:
SmokeBall:
Nevermeltice:
Magnet:
Pearl:
BigPearl:
Everstone:
SpellTag:
GsBall:
MiracleSeed:
ThickClub:
FocusBand:
Item78:
HardStone:
LuckyEgg:
MachinePart:
EggTicket:
LostItem:
Stardust:
StarPiece:
Pass:
Item87:
Item88:
Item89:
Charcoal:
ScopeLens:
Item8D:
Item8E:
MetalCoat:
DragonFang:
Item91:
Leftovers:
Item93:
Item94:
Item95:
DragonScale:
BerserkGene:
Item99:
Item9A:
Item9B:
FlowerMail:
ItemA2:
LightBall:
PolkadotBow:
ItemAB:
UpGrade:
ItemB0:
RainbowWing:
ItemB3: ; f77d
	jp $77ed
; f780




