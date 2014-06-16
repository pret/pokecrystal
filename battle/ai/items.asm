Function38000: ; 38000
	and a
	ld a, [IsInBattle]
	dec a
	ret z
	ld a, [InLinkBattle]
	and a
	ret nz
	callba Function3e8d1
	ret nz
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, Function38041
	ld a, [$c731]
	and a
	jr nz, Function38041
	ld hl, TrainerClassAttributes + 5
	ld a, [$cfc0]
	and a
	jr nz, .asm_38032
	ld a, [TrainerClass]
	dec a
	ld bc, 7
	call AddNTimes

.asm_38032
	bit 0, [hl]
	jp nz, Function38045
	bit 1, [hl]
	jp nz, Function38083
	bit 2, [hl]
	jp nz, Function380c1
	; fallthrough
; 38041

Function38041: ; 38041
	call Function38105
	ret
; 38045

Function38045: ; 38045
	callab Function34941
	ld a, [$c717]
	and $f0
	jp z, Function38041
	cp $10
	jr nz, .asm_38061
	call Random
	cp $80
	jr c, .asm_38077
	jp Function38041

.asm_38061
	cp $20
	jr nz, .asm_3806f
	call Random
	cp $c8
	jr c, .asm_38077
	jp Function38041

.asm_3806f
	call Random
	cp $a
	jp c, Function38041

.asm_38077
	ld a, [$c717]
	and $f
	inc a
	ld [$c718], a
	jp Function3844b
; 38083

Function38083: ; 38083
	callab Function34941
	ld a, [$c717]
	and $f0
	jp z, Function38041
	cp $10
	jr nz, .asm_3809f
	call Random
	cp $14
	jr c, .asm_380b5
	jp Function38041

.asm_3809f
	cp $20
	jr nz, .asm_380ad
	call Random
	cp $1e
	jr c, .asm_380b5
	jp Function38041

.asm_380ad
	call Random
	cp $c8
	jp c, Function38041

.asm_380b5
	ld a, [$c717]
	and $f
	inc a
	ld [$c718], a
	jp Function3844b
; 380c1

Function380c1: ; 380c1
	callab Function34941
	ld a, [$c717]
	and $f0
	jp z, Function38041
	cp $10
	jr nz, .asm_380dd
	call Random
	cp $32
	jr c, .asm_380f3
	jp Function38041

.asm_380dd
	cp $20
	jr nz, .asm_380eb
	call Random
	cp $80
	jr c, .asm_380f3
	jp Function38041

.asm_380eb
	call Random
	cp $32
	jp c, Function38041

.asm_380f3
	ld a, [$c717]
	and $f
	inc a
	ld [$c718], a
	jp Function3844b
; 380ff


Function380ff: ; 380ff
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret
; 38105


Function38105: ; 38105
	ld a, [$cfc0]
	and a
	ret nz
	ld a, [$c650]
	ld b, a
	ld a, [$c651]
	or b
	ret z
	call Function38170
	ret nc
	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes + 5
	ld bc, 7
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, Unknown_38196
	ld de, $c650
.asm_3812c
	ld a, [hl]
	and a
	inc a
	ret z
	ld a, [de]
	cp [hl]
	jr z, .asm_3813f
	inc de
	ld a, [de]
	cp [hl]
	jr z, .asm_3813f
	dec de
	inc hl
	inc hl
	inc hl
	jr .asm_3812c

.asm_3813f
	inc hl
	push hl
	push de
	ld de, .asm_3814a
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.asm_3814a
	pop de
	pop hl
	inc hl
	inc hl
	jr c, .asm_3812c
	xor a
	ld [de], a
	inc a
	ld [$c70f], a
	ld hl, EnemySubStatus3 ; $c66f
	res SUBSTATUS_BIDE, [hl]
	xor a
	ld [EnemyFuryCutterCount], a ; $c680
	ld [$c681], a
	ld [$c72c], a
	ld hl, EnemySubStatus4 ; $c670
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [LastPlayerCounterMove], a ; $c6f9
	scf
	ret


Function38170: ; 38170
	ld a, [OTPartyCount]
	ld d, a
	ld e, 0
	ld hl, OTPartyMon1Level
	ld bc, OTPartyMon2 - OTPartyMon1
.asm_3817c
	ld a, [hl]
	cp e
	jr c, .asm_38181
	ld e, a
.asm_38181
	add hl, bc
	dec d
	jr nz, .asm_3817c

	ld a, [CurOTMon]
	ld hl, OTPartyMon1Level
	call AddNTimes
	ld a, [hl]
	cp e
	jr nc, .asm_38194
	and a
	ret

.asm_38194
	scf
	ret
; 38196

Unknown_38196: ; 39196
	dbw FULL_RESTORE, Function38208
	dbw MAX_POTION,   Function38220
	dbw HYPER_POTION, Function38284
	dbw SUPER_POTION, Function38292
	dbw POTION,       Function382a0
	dbw X_ACCURACY,   Function382f9
	dbw FULL_HEAL,    Function381be
	dbw GUARD_SPEC,   Function38305
	dbw DIRE_HIT,     Function38311
	dbw X_ATTACK,     Function3831d
	dbw X_DEFEND,     Function38329
	dbw X_SPEED,      Function38335
	dbw X_SPECIAL,    Function38341
	db $ff
; 381be

Function381be: ; 381be
	call Function381ca
	jp c, Function38383
	call Function383a3
	jp Function38385
; 381ca

; known jump sources: 381be (e:41be), 38214 (e:4214)
Function381ca: ; 381ca (e:41ca)
	ld a, [EnemyMonStatus] ; $d214
	and a
	jp z, Function38383

	ld a, [bc]
	bit 6, a
	jr nz, .asm_381e7
	ld a, [bc]
	bit 4, a
	jp nz, Function38385
	call Random
	cp $32
	jp c, Function38385
	jp Function38383

.asm_381e7
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .asm_381fd
	ld a, [$c67c]
	cp $4
	jr c, .asm_381fd
	call Random
	cp $80
	jp c, Function38385
.asm_381fd
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	jp z, Function38383
	jp Function38385
; 38208

Function38208: ; 38208
	call Function3822c
	jp nc, Function3821a
	ld a, [bc]
	bit 6, a
	jp z, Function38383
	call Function381ca
	jp c, Function38383

; known jump sources: 3820b (e:420b)
Function3821a: ; 3821a (e:421a)
	call Function383b5
	jp Function38385
; 38220

Function38220: ; 38220
	call Function3822c
	jp c, Function38383
	call Function383ae
	jp Function38385

; known jump sources: 38208 (e:4208), 38220 (e:4220), 38284 (e:4284)
Function3822c: ; 3822c (e:422c)
	ld a, [bc]
	bit 6, a
	jr nz, Function38267
	callab AICheckEnemyHalfHP
	jp c, Function38383
	ld a, [bc]
	bit 5, a
	jp nz, Function38254
	callab AICheckEnemyQuarterHP
	jp nc, Function38281
	call Random
	cp $80
	jp c, Function38281
	jp Function38383

Function38254: ; 38254 (e:4254)
	callab AICheckEnemyQuarterHP
	jp c, Function38383
	call Random
	cp $32
	jp c, Function38383
	jr Function38281

Function38267: ; 38267 (e:4267)
	callab AICheckEnemyHalfHP
	jp c, Function38383
	callab AICheckEnemyQuarterHP
	jp nc, Function38281
	call Random
	cp $32
	jp nc, Function38383

Function38281: ; 38281 (e:4281)
	jp Function38385
; 38284

Function38284: ; 38284
	call Function3822c
	jp c, Function38383
	ld b, 200
	call Function383f4
	jp Function38385
; 38292 (e:4292)

Function38292: ; 38292
	call Function3822c
	jp c, Function38383

Function38298: ; 38298
	ld b, 50
	call Function383ee
	jp Function38385
; 382a0

Function382a0: ; 382a0
	call Function3822c
	jp c, Function38383
	ld b, 20
	call Function383e8
	jp Function38385
; 382ae

Function382ae: ; 382ae
	callab AICheckEnemyMaxHP
	jr c, .asm_382e4
	push bc
	ld de, EnemyMonMaxHP + 1
	ld hl, EnemyMonHP + 1
	ld a, [de]
	sub [hl]
	jr z, .asm_382e7
	dec hl
	dec de
	ld c, a
	sbc [hl]
	and a
	jr nz, .asm_382e7
	ld a, c
	cp b
	jp c, .asm_382d5
	callab AICheckEnemyQuarterHP
	jr c, .asm_382e7

.asm_382d5
	pop bc
	ld a, [bc]
	bit 5, a
	jp z, Function38385
	call Random
	cp $80
	jp c, Function38385

.asm_382e4
	jp Function38383

.asm_382e7
	pop bc
	ld a, [bc]
	bit 5, a
	jp z, Function38383
	call Random
	cp $64
	jp c, Function38385
	jp Function38383
; 382f9

Function382f9: ; 382f9
	call Function3834d
	jp c, Function38383
	call Function384f7
	jp Function38385
; 38305

Function38305: ; 38305
	call Function3834d
	jp c, Function38383
	call Function38504
	jp Function38385
; 38311

Function38311: ; 38311
	call Function3834d
	jp c, Function38383
	call Function38511
	jp Function38385
; 3831d (e:431d)

Function3831d: ; 3831d
	call Function3834d
	jp c, Function38383
	call Function38541
	jp Function38385
; 38329

Function38329: ; 38329
	call Function3834d
	jp c, Function38383
	call Function38547
	jp Function38385
; 38335

Function38335: ; 38335
	call Function3834d
	jp c, Function38383
	call Function3854d
	jp Function38385
; 38341

Function38341: ; 38341
	call Function3834d
	jp c, Function38383
	call Function38553
	jp Function38385
; 3834d

; known jump sources: 38311 (e:4311)
Function3834d: ; 3834d (e:434d)
	ld a, [EnemyTurnsTaken] ; $c6dc
	and a
	jr nz, .asm_38372
	ld a, [bc]
	bit 4, a
	jp nz, Function38385
	call Random
	cp $80
	jp c, Function38383
	ld a, [bc]
	bit 6, a
	jp nz, Function38385
	call Random
	cp $80
	jp c, Function38383
	jp Function38385
.asm_38372
	ld a, [bc]
	bit 4, a
	jp z, Function38383
	call Random
	cp $32
	jp nc, Function38383
	jp Function38385

Function38383: ; 38383 (e:4383)
	scf
	ret

Function38385: ; 38385 (e:4385)
	and a
	ret


Function38387: ; 38387
	call UpdateEnemyMonInParty
	callba Function3e036
	ld a, $1
	ld [hBGMapMode], a
	ld hl, $c6e6
	dec [hl]
	scf
	ret
; 3839a

Function3839a: ; 3839a
	push de
	ld de, SFX_FULL_HEAL
	call PlaySFX
	pop de
	ret
; 383a3


; known jump sources: 381c4 (e:41c4)
Function383a3: ; 383a3 (e:43a3)
	call Function3839a
	call Function384e0
	ld a, FULL_HEAL
	jp Function38568

; known jump sources: 38226 (e:4226)
Function383ae: ; 383ae (e:43ae)
	ld a, $f
	ld [$d1f1], a
	jr asm_383c6

; known jump sources: 3821a (e:421a)
Function383b5: ; 383b5 (e:43b5)
	call Function384e0
	ld a, $e
	ld [$d1f1], a
	ld hl, EnemySubStatus3 ; $c66f
	res SUBSTATUS_CONFUSED, [hl]
	xor a
	ld [EnemyConfuseCount], a ; $c67b
asm_383c6: ; 383c6 (e:43c6)
	ld de, $d1ec
	ld hl, EnemyMonHP + 1 ; $d217
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, EnemyMonMaxHP + 1 ; $d219
	ld a, [hld]
	ld [de], a
	inc de
	ld [Buffer1], a ; $d1ea (aliases: MagikarpLength)
	ld [EnemyMonHP + 1], a ; $d217
	ld a, [hl]
	ld [de], a
	ld [Buffer2], a ; $d1eb (aliases: MovementType)
	ld [EnemyMonHP], a ; $d216 (aliases: EnemyMonHP)
	jr asm_38436
; 383e8 (e:43e8)

Function383e8: ; 383e8
	ld a, POTION
	ld b, 20
	jr Function383f8

Function383ee: ; 383ee
	ld a, SUPER_POTION
	ld b, 50
	jr Function383f8

; known jump sources: 3828c (e:428c)
Function383f4: ; 383f4 (e:43f4)
	ld a, HYPER_POTION
	ld b, 200

Function383f8: ; 383f8
	ld [$d1f1], a
	ld hl, EnemyMonHP + 1 ; $d217
	ld a, [hl]
	ld [$d1ec], a
	add b
	ld [hld], a
	ld [$d1ee], a
	ld a, [hl]
	ld [$d1ed], a
	ld [$d1ef], a
	jr nc, .asm_38415
	inc a
	ld [hl], a
	ld [$d1ef], a
.asm_38415
	inc hl
	ld a, [hld]
	ld b, a
	ld de, EnemyMonMaxHP + 1 ; $d219
	ld a, [de]
	dec de
	ld [Buffer1], a ; $d1ea (aliases: MagikarpLength)
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [Buffer2], a ; $d1eb (aliases: MovementType)
	sbc b
	jr nc, asm_38436
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [$d1ee], a
	ld a, [de]
	ld [hl], a
	ld [$d1ef], a
asm_38436: ; 38436 (e:4436)
	call Function38571
	hlcoord 2, 2
	xor a
	ld [$d10a], a
	call Function3839a
	predef Functionc6e0
	jp Function38387


Function3844b: ; 3844b
	ld a, [OTPartyCount]
	ld c, a
	ld hl, OTPartyMon1HP
	ld d, 0
.asm_38454
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .asm_3845b
	inc d

.asm_3845b
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_38454
	ld a, d
	cp $2
	jp nc, Function3846c
	and a
	ret
; 3846c

Function3846c: ; 3846c
	ld a, $1
	ld [$c711], a
	ld [$c70f], a
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [hBattleTurn], a
	callab Function3dc5b
	push af
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, EnemyMonStatus
	ld bc, $0004
	call CopyBytes
	pop af
	jr c, .asm_384a3
	ld hl, UnknownText_0x384d0
	call PrintText

.asm_384a3
	ld a, $1
	ld [$d264], a
	callab NewEnemyMonStatus
	callab ResetEnemyStatLevels
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	callba Function3d4e1
	callba Function3d57a
	xor a
	ld [$d264], a
	ld a, [InLinkBattle]
	and a
	ret nz
	scf
	ret
; 384d0

UnknownText_0x384d0: ; 384d0
	text_jump UnknownText_0x1bcf9c
	db "@"
; 384d5

Function384d5: ; 384d5
	call Function3839a
	call Function384e0
	ld a, X_SPEED
	jp Function38568
; 384e0

Function384e0: ; 384e0
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	xor a
	ld [hl], a
	ld [EnemyMonStatus], a
	ld hl, EnemySubStatus5
	res SUBSTATUS_TOXIC, [hl]
	ret
; 384f7

Function384f7: ; 384f7
	call Function3839a
	ld hl, EnemySubStatus4
	set SUBSTATUS_UNLEASH, [hl]
	ld a, X_ACCURACY
	jp Function38568
; 38504

Function38504: ; 38504
	call Function3839a
	ld hl, EnemySubStatus4
	set SUBSTATUS_MIST, [hl]
	ld a, GUARD_SPEC
	jp Function38568
; 38511

Function38511: ; 38511
	call Function3839a
	ld hl, EnemySubStatus4
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	ld a, DIRE_HIT
	jp Function38568
; 3851e

Function3851e: ; 3851e
	ld [hMultiplier], a
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld [hProduct], a
	ld a, [hl]
	ld [hMultiplicand], a
	ld b, $2
	call Divide
	ld a, [$ffb6]
	ld c, a
	ld a, [$ffb5]
	ld b, a
	ld hl, EnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
	sub b
	ret nz
	ld a, e
	sub c
	ret
; 38541

Function38541: ; 38541
	ld b, ATTACK
	ld a, X_ATTACK
	jr Function38557
; 38547

Function38547: ; 38547
	ld b, DEFENSE
	ld a, X_DEFEND
	jr Function38557
; 3854d

Function3854d: ; 3854d
	ld b, SPEED
	ld a, X_SPEED
	jr Function38557
; 38553

Function38553: ; 38553
	ld b, SP_ATTACK
	ld a, X_SPECIAL

Function38557
	ld [$d1f1], a
	push bc
	call Function38571
	pop bc
	callba Function361ef
	jp Function38387
; 38568


Function38568: ; 38568
	ld [$d1f1], a
	call Function38571
	jp Function38387
; 38571

Function38571: ; 38571
	ld a, [$d1f1]
	ld [$d265], a
	call GetItemName
	ld hl, StringBuffer1
	ld de, $d050
	ld bc, $000d
	call CopyBytes
	ld hl, UnknownText_0x3858c
	jp PrintText
; 3858c

UnknownText_0x3858c: ; 3858c
	text_jump UnknownText_0x1bcfaf
	db "@"
; 38591
