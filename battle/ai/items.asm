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
	jr nz, DontSwitch

	ld a, [wc731]
	and a
	jr nz, DontSwitch

	ld hl, TrainerClassAttributes + 5
	ld a, [wcfc0]
	and a
	jr nz, .ok
	ld a, [TrainerClass]
	dec a
	ld bc, 7
	call AddNTimes
.ok
	bit SWITCH_OFTEN_F, [hl]
	jp nz, SwitchOften
	bit SWITCH_RARELY_F, [hl]
	jp nz, SwitchRarely
	bit SWITCH_SOMETIMES_F, [hl]
	jp nz, SwitchSometimes
	; fallthrough

DontSwitch: ; 38041
	call AI_TryItem
	ret
; 38045

SwitchOften: ; 38045
	callab Function34941
	ld a, [wc717]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp $80
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 200
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp 10
	jp c, DontSwitch

.switch
	ld a, [wc717]
	and $f
	inc a
	ld [wc718], a
	jp AI_TrySwitch
; 38083

SwitchRarely: ; 38083
	callab Function34941
	ld a, [wc717]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp 20
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 30
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp 200
	jp c, DontSwitch

.switch
	ld a, [wc717]
	and $f
	inc a
	ld [wc718], a
	jp AI_TrySwitch
; 380c1

SwitchSometimes: ; 380c1
	callab Function34941
	ld a, [wc717]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp 50
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp $80
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp 50
	jp c, DontSwitch

.switch
	ld a, [wc717]
	and $f
	inc a
	ld [wc718], a
	jp AI_TrySwitch
; 380ff


Function380ff: ; 380ff
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret
; 38105


AI_TryItem: ; 38105
	ld a, [wcfc0]
	and a
	ret nz

	ld a, [wc650]
	ld b, a
	ld a, [wc651]
	or b
	ret z

	call .IsHighestLevel
	ret nc

	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes + 5
	ld bc, 7
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, AI_Items
	ld de, wc650
.loop
	ld a, [hl]
	and a
	inc a
	ret z

	ld a, [de]
	cp [hl]
	jr z, .has_item
	inc de
	ld a, [de]
	cp [hl]
	jr z, .has_item

	dec de
rept 3
	inc hl
endr
	jr .loop

.has_item
	inc hl

	push hl
	push de
	ld de, .callback
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
.callback
	pop de
	pop hl

rept 2
	inc hl
endr
	jr c, .loop

.used_item
	xor a
	ld [de], a
	inc a
	ld [wc70f], a

	ld hl, EnemySubStatus3
	res SUBSTATUS_BIDE, [hl]

	xor a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wc72c], a

	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]

	xor a
	ld [LastPlayerCounterMove], a

	scf
	ret


.IsHighestLevel: ; 38170
	ld a, [OTPartyCount]
	ld d, a
	ld e, 0
	ld hl, OTPartyMon1Level
	ld bc, OTPartyMon2 - OTPartyMon1
.next
	ld a, [hl]
	cp e
	jr c, .ok
	ld e, a
.ok
	add hl, bc
	dec d
	jr nz, .next

	ld a, [CurOTMon]
	ld hl, OTPartyMon1Level
	call AddNTimes
	ld a, [hl]
	cp e
	jr nc, .yes

.no
	and a
	ret

.yes
	scf
	ret
; 38196


AI_Items: ; 39196
	dbw FULL_RESTORE, .FullRestore
	dbw MAX_POTION,   .MaxPotion
	dbw HYPER_POTION, .HyperPotion
	dbw SUPER_POTION, .SuperPotion
	dbw POTION,       .Potion
	dbw X_ACCURACY,   .XAccuracy
	dbw FULL_HEAL,    .FullHeal
	dbw GUARD_SPEC,   .GuardSpec
	dbw DIRE_HIT,     .DireHit
	dbw X_ATTACK,     .XAttack
	dbw X_DEFEND,     .XDefend
	dbw X_SPEED,      .XSpeed
	dbw X_SPECIAL,    .XSpecial
	db $ff
; 381be

.FullHeal: ; 381be
	call .Status
	jp c, .DontUse
	call Function383a3
	jp .Use
; 381ca

.Status: ; 381ca (e:41ca)
	ld a, [EnemyMonStatus]
	and a
	jp z, .DontUse

	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .asm_381e7
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	call Random
	cp 50
	jp c, .Use
	jp .DontUse

.asm_381e7
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .asm_381fd
	ld a, [EnemyToxicCount]
	cp 4
	jr c, .asm_381fd
	call Random
	cp $80
	jp c, .Use
.asm_381fd
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	jp z, .DontUse
	jp .Use
; 38208

.FullRestore: ; 38208
	call .HealItem
	jp nc, .asm_3821a
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp z, .DontUse
	call .Status
	jp c, .DontUse

.asm_3821a
	call Function383b5
	jp .Use
; 38220

.MaxPotion: ; 38220
	call .HealItem
	jp c, .DontUse
	call Function383ae
	jp .Use

.HealItem: ; 3822c (e:422c)
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .asm_38267
	callab AICheckEnemyHalfHP
	jp c, .DontUse
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp nz, .asm_38254
	callab AICheckEnemyQuarterHP
	jp nc, .asm_38281
	call Random
	cp $80
	jp c, .asm_38281
	jp .DontUse

.asm_38254: ; 38254 (e:4254)
	callab AICheckEnemyQuarterHP
	jp c, .DontUse
	call Random
	cp 50
	jp c, .DontUse
	jr .asm_38281

.asm_38267: ; 38267 (e:4267)
	callab AICheckEnemyHalfHP
	jp c, .DontUse
	callab AICheckEnemyQuarterHP
	jp nc, .asm_38281
	call Random
	cp 50
	jp nc, .DontUse

.asm_38281: ; 38281 (e:4281)
	jp .Use
; 38284

.HyperPotion: ; 38284
	call .HealItem
	jp c, .DontUse
	ld b, 200
	call Function383f4
	jp .Use
; 38292 (e:4292)

.SuperPotion: ; 38292
	call .HealItem
	jp c, .DontUse
	ld b, 50
	call Function383ee
	jp .Use
; 382a0

.Potion: ; 382a0
	call .HealItem
	jp c, .DontUse
	ld b, 20
	call Function383e8
	jp .Use
; 382ae

.asm_382ae: ; 382ae
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
	bit UNKNOWN_USE_F, a
	jp z, .Use
	call Random
	cp $80
	jp c, .Use

.asm_382e4
	jp .DontUse

.asm_382e7
	pop bc
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp z, .DontUse
	call Random
	cp 100
	jp c, .Use
	jp .DontUse
; 382f9

.XAccuracy: ; 382f9
	call .XItem
	jp c, .DontUse
	call Function384f7
	jp .Use
; 38305

.GuardSpec: ; 38305
	call .XItem
	jp c, .DontUse
	call Function38504
	jp .Use
; 38311

.DireHit: ; 38311
	call .XItem
	jp c, .DontUse
	call Function38511
	jp .Use
; 3831d (e:431d)

.XAttack: ; 3831d
	call .XItem
	jp c, .DontUse
	call Function38541
	jp .Use
; 38329

.XDefend: ; 38329
	call .XItem
	jp c, .DontUse
	call Function38547
	jp .Use
; 38335

.XSpeed: ; 38335
	call .XItem
	jp c, .DontUse
	call Function3854d
	jp .Use
; 38341

.XSpecial: ; 38341
	call .XItem
	jp c, .DontUse
	call Function38553
	jp .Use
; 3834d

.XItem: ; 3834d (e:434d)
	ld a, [EnemyTurnsTaken]
	and a
	jr nz, .asm_38372
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	call Random
	cp $80
	jp c, .DontUse
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp nz, .Use
	call Random
	cp $80
	jp c, .DontUse
	jp .Use
.asm_38372
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp z, .DontUse
	call Random
	cp 50
	jp nc, .DontUse
	jp .Use

.DontUse:
	scf
	ret

.Use:
	and a
	ret


AIUpdateHUD: ; 38387
	call UpdateEnemyMonInParty
	callba UpdateEnemyHUD
	ld a, $1
	ld [hBGMapMode], a
	ld hl, wc6e6
	dec [hl]
	scf
	ret
; 3839a

AIUsedItemSound: ; 3839a
	push de
	ld de, SFX_FULL_HEAL
	call PlaySFX
	pop de
	ret
; 383a3


Function383a3: ; 383a3 (e:43a3)
	call AIUsedItemSound
	call AI_HealStatus
	ld a, FULL_HEAL
	jp Function38568

Function383ae: ; 383ae (e:43ae)
	ld a, MAX_POTION
	ld [wd1f1], a
	jr asm_383c6

Function383b5: ; 383b5 (e:43b5)
	call AI_HealStatus
	ld a, FULL_RESTORE
	ld [wd1f1], a
	ld hl, EnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	xor a
	ld [EnemyConfuseCount], a

asm_383c6: ; 383c6
	ld de, wd1ec
	ld hl, EnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, EnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [Buffer1], a
	ld [EnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [Buffer2], a
	ld [EnemyMonHP], a
	jr Function38436
; 383e8 (e:43e8)

Function383e8: ; 383e8
	ld a, POTION
	ld b, 20
	jr Function383f8

Function383ee: ; 383ee
	ld a, SUPER_POTION
	ld b, 50
	jr Function383f8

Function383f4: ; 383f4 (e:43f4)
	ld a, HYPER_POTION
	ld b, 200

Function383f8: ; 383f8
	ld [wd1f1], a
	ld hl, EnemyMonHP + 1
	ld a, [hl]
	ld [wd1ec], a
	add b
	ld [hld], a
	ld [wd1ee], a
	ld a, [hl]
	ld [wd1ec + 1], a
	ld [wd1ee + 1], a
	jr nc, .asm_38415
	inc a
	ld [hl], a
	ld [wd1ee + 1], a
.asm_38415
	inc hl
	ld a, [hld]
	ld b, a
	ld de, EnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [Buffer1], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [Buffer2], a
	sbc b
	jr nc, .asm_38436
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wd1ee], a
	ld a, [de]
	ld [hl], a
	ld [wd1ef], a
.asm_38436

Function38436: ; 38436
	call Function38571
	hlcoord 2, 2
	xor a
	ld [wd10a], a
	call AIUsedItemSound
	predef Functionc6e0
	jp AIUpdateHUD


AI_TrySwitch: ; 3844b
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
	cp 2
	jp nc, AI_Switch
	and a
	ret
; 3846c

AI_Switch: ; 3846c
	ld a, $1
	ld [wEnemyIsSwitching], a
	ld [wc70f], a
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
	ld [wd264], a
	callab NewEnemyMonStatus
	callab ResetEnemyStatLevels
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	callba Function3d4e1
	callba Function3d57a
	xor a
	ld [wd264], a
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
	call AIUsedItemSound
	call AI_HealStatus
	ld a, FULL_HEAL_RED
	jp Function38568
; 384e0

AI_HealStatus: ; 384e0
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
	call AIUsedItemSound
	ld hl, EnemySubStatus4
	set SUBSTATUS_X_ACCURACY, [hl]
	ld a, X_ACCURACY
	jp Function38568
; 38504

Function38504: ; 38504
	call AIUsedItemSound
	ld hl, EnemySubStatus4
	set SUBSTATUS_MIST, [hl]
	ld a, GUARD_SPEC
	jp Function38568
; 38511

Function38511: ; 38511
	call AIUsedItemSound
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

Function38557:
	ld [wd1f1], a
	push bc
	call Function38571
	pop bc
	callba Function361ef
	jp AIUpdateHUD
; 38568


Function38568: ; 38568
	ld [wd1f1], a
	call Function38571
	jp AIUpdateHUD
; 38571

Function38571: ; 38571
	ld a, [wd1f1]
	ld [wd265], a
	call GetItemName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, UnknownText_0x3858c
	jp PrintText
; 3858c

UnknownText_0x3858c: ; 3858c
	text_jump UnknownText_0x1bcfaf
	db "@"
; 38591
