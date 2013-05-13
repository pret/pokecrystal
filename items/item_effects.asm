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
	call RNG

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
	call InitString

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
	ld a, $2
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
	call InitString

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


INCBIN "baserom.gbc", $ec38, $ec50 - $ec38


Function_0xec50: ; ec50
	ld a, [EnemyMonSpecies]
	ld hl, $4378
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, $11
	call GetFarHalfword

.asm_ec61
	call $6c38

	call GetFarByte

	inc hl
	cp $50
	jr nz, .asm_ec61
	call $6c38

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
	call $6c99

	srl b
	rr c
	call $6c99

	ld a, h
	pop bc
	jr .asm_eca4

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

	ld hl, $6cc4

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
	sub $14
	ld b, a
	ret nc
	ld b, $1
	ret
; ecc4


INCBIN "baserom.gbc", $ecc4, $eccc - $ecc4


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

	ld d, $0
	jr nz, .asm_ed39
	inc d

.asm_ed39
	push de
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, $4
	ld [MonType], a
	ld a, $14
	ld hl, $4bdd
	rst FarCall

	jr c, .asm_ed65

	ld d, $0
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


INCBIN "baserom.gbc", $efda, $f0a9 - $efda


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
	call FarBattleTextBox

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


INCBIN "baserom.gbc", $f1a9, $f44f - $f1a9


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
	ld a, $14
	ld hl, $4730
	rst FarCall
	ret
; f745


CardKey: ; f745
	ld a, $14
	ld hl, $4779
	rst FarCall
	ret
; f74c


BasementKey: ; f74c
	ld a, $14
	ld hl, $47b4
	rst FarCall
	ret
; f753


SacredAsh: ; f753
	ld a, $14
	ld hl, $47e6
	rst FarCall

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




