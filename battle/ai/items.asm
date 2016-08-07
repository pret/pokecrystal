AI_SwitchOrTryItem: ; 38000
	and a

	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

	callba CheckEnemyLockedIn
	ret nz

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	jr nz, DontSwitch

	ld a, [wEnemyWrapCount]
	and a
	jr nz, DontSwitch

	ld hl, TrainerClassAttributes + TRNATTR_AI_ITEM_SWITCH
	ld a, [InBattleTowerBattle] ; Load always the first TrainerClass for BattleTower-Trainers
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
	callab CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp 1 + 50 percent
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp -1 + 79 percent
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp 4 percent
	jp c, DontSwitch

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	; In register 'a' is the number (1-6) of the Pkmn to switch to
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch
; 38083

SwitchRarely: ; 38083
	callab CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp 8 percent
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 12 percent
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp -1 + 79 percent
	jp c, DontSwitch

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch
; 380c1

SwitchSometimes: ; 380c1
	callab CheckAbleToSwitch
	ld a, [wEnemySwitchMonParam]
	and $f0
	jp z, DontSwitch

	cp $10
	jr nz, .not_10
	call Random
	cp -1 + 20 percent
	jr c, .switch
	jp DontSwitch
.not_10

	cp $20
	jr nz, .not_20
	call Random
	cp 1 + 50 percent
	jr c, .switch
	jp DontSwitch
.not_20

	; $30
	call Random
	cp -1 + 20 percent
	jp c, DontSwitch

.switch
	ld a, [wEnemySwitchMonParam]
	and $f
	inc a
	ld [wEnemySwitchMonIndex], a
	jp AI_TrySwitch
; 380ff


CheckSubstatusCantRun: ; 380ff
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret
; 38105


AI_TryItem: ; 38105
	; items are not allowed in the BattleTower
	ld a, [InBattleTowerBattle]
	and a
	ret nz

	ld a, [wEnemyTrainerItem1]
	ld b, a
	ld a, [wEnemyTrainerItem2]
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
	ld de, wEnemyTrainerItem1
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
	inc hl
	inc hl
	inc hl
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

	inc hl
	inc hl
	jr c, .loop

.used_item
	xor a
	ld [de], a
	inc a
	ld [wEnemyGoesFirst], a

	ld hl, EnemySubStatus3
	res SUBSTATUS_BIDE, [hl]

	xor a
	ld [EnemyFuryCutterCount], a
	ld [EnemyProtectCount], a
	ld [wEnemyRageCounter], a

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
	ld bc, PARTYMON_STRUCT_LENGTH
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
	call EnemyUsedFullHeal
	jp .Use
; 381ca

.Status: ; 381ca (e:41ca)
	ld a, [EnemyMonStatus]
	and a
	jp z, .DontUse

	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .StatusCheckContext
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	call Random
	cp -1 + 20 percent
	jp c, .Use
	jp .DontUse

.StatusCheckContext:
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr z, .FailToxicCheck
	ld a, [EnemyToxicCount]
	cp 4
	jr c, .FailToxicCheck
	call Random
	cp 1 + 50 percent
	jp c, .Use
.FailToxicCheck:
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	jp z, .DontUse
	jp .Use
; 38208

.FullRestore: ; 38208
	call .HealItem
	jp nc, .UseFullRestore
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp z, .DontUse
	call .Status
	jp c, .DontUse

.UseFullRestore:
	call EnemyUsedFullRestore
	jp .Use
; 38220

.MaxPotion: ; 38220
	call .HealItem
	jp c, .DontUse
	call EnemyUsedMaxPotion
	jp .Use

.HealItem: ; 3822c (e:422c)
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jr nz, .CheckHalfOrQuarterHP
	callab AICheckEnemyHalfHP
	jp c, .DontUse
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp nz, .CheckQuarterHP
	callab AICheckEnemyQuarterHP
	jp nc, .UseHealItem
	call Random
	cp 1 + 50 percent
	jp c, .UseHealItem
	jp .DontUse

.CheckQuarterHP: ; 38254 (e:4254)
	callab AICheckEnemyQuarterHP
	jp c, .DontUse
	call Random
	cp -1 + 20 percent
	jp c, .DontUse
	jr .UseHealItem

.CheckHalfOrQuarterHP: ; 38267 (e:4267)
	callab AICheckEnemyHalfHP
	jp c, .DontUse
	callab AICheckEnemyQuarterHP
	jp nc, .UseHealItem
	call Random
	cp -1 + 20 percent
	jp nc, .DontUse

.UseHealItem: ; 38281 (e:4281)
	jp .Use
; 38284

.HyperPotion: ; 38284
	call .HealItem
	jp c, .DontUse
	ld b, 200
	call EnemyUsedHyperPotion
	jp .Use
; 38292 (e:4292)

.SuperPotion: ; 38292
	call .HealItem
	jp c, .DontUse
	ld b, 50
	call EnemyUsedSuperPotion
	jp .Use
; 382a0

.Potion: ; 382a0
	call .HealItem
	jp c, .DontUse
	ld b, 20
	call EnemyUsedPotion
	jp .Use
; 382ae

.asm_382ae ; This appears to be unused
	callab AICheckEnemyMaxHP
	jr c, .dont_use
	push bc
	ld de, EnemyMonMaxHP + 1
	ld hl, EnemyMonHP + 1
	ld a, [de]
	sub [hl]
	jr z, .check_40_percent
	dec hl
	dec de
	ld c, a
	sbc [hl]
	and a
	jr nz, .check_40_percent
	ld a, c
	cp b
	jp c, .check_50_percent
	callab AICheckEnemyQuarterHP
	jr c, .check_40_percent

.check_50_percent
	pop bc
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp z, .Use
	call Random
	cp 1 + 50 percent
	jp c, .Use

.dont_use
	jp .DontUse

.check_40_percent
	pop bc
	ld a, [bc]
	bit UNKNOWN_USE_F, a
	jp z, .DontUse
	call Random
	cp 1 + 39 percent
	jp c, .Use
	jp .DontUse
; 382f9

.XAccuracy: ; 382f9
	call .XItem
	jp c, .DontUse
	call EnemyUsedXAccuracy
	jp .Use
; 38305

.GuardSpec: ; 38305
	call .XItem
	jp c, .DontUse
	call EnemyUsedGuardSpec
	jp .Use
; 38311

.DireHit: ; 38311
	call .XItem
	jp c, .DontUse
	call EnemyUsedDireHit
	jp .Use
; 3831d (e:431d)

.XAttack: ; 3831d
	call .XItem
	jp c, .DontUse
	call EnemyUsedXAttack
	jp .Use
; 38329

.XDefend: ; 38329
	call .XItem
	jp c, .DontUse
	call EnemyUsedXDefend
	jp .Use
; 38335

.XSpeed: ; 38335
	call .XItem
	jp c, .DontUse
	call EnemyUsedXSpeed
	jp .Use
; 38341

.XSpecial: ; 38341
	call .XItem
	jp c, .DontUse
	call EnemyUsedXSpecial
	jp .Use
; 3834d

.XItem: ; 3834d (e:434d)
	ld a, [EnemyTurnsTaken]
	and a
	jr nz, .notfirstturnout
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp nz, .Use
	call Random
	cp 1 + 50 percent
	jp c, .DontUse
	ld a, [bc]
	bit CONTEXT_USE_F, a
	jp nz, .Use
	call Random
	cp 1 + 50 percent
	jp c, .DontUse
	jp .Use
.notfirstturnout
	ld a, [bc]
	bit ALWAYS_USE_F, a
	jp z, .DontUse
	call Random
	cp -1 + 20 percent
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
	ld hl, wEnemyItemState
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


EnemyUsedFullHeal: ; 383a3 (e:43a3)
	call AIUsedItemSound
	call AI_HealStatus
	ld a, FULL_HEAL
	jp PrintText_UsedItemOn_AND_AIUpdateHUD

EnemyUsedMaxPotion: ; 383ae (e:43ae)
	ld a, MAX_POTION
	ld [CurEnemyItem], a
	jr FullRestoreContinue

EnemyUsedFullRestore: ; 383b5 (e:43b5)
	call AI_HealStatus
	ld a, FULL_RESTORE
	ld [CurEnemyItem], a
	ld hl, EnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	xor a
	ld [EnemyConfuseCount], a

FullRestoreContinue: ; 383c6
	ld de, wCurHPAnimOldHP
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
	ld [wCurHPAnimMaxHP], a
	ld [EnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wCurHPAnimMaxHP + 1], a
	ld [EnemyMonHP], a
	jr EnemyPotionFinish
; 383e8 (e:43e8)

EnemyUsedPotion: ; 383e8
	ld a, POTION
	ld b, 20
	jr EnemyPotionContinue

EnemyUsedSuperPotion: ; 383ee
	ld a, SUPER_POTION
	ld b, 50
	jr EnemyPotionContinue

EnemyUsedHyperPotion: ; 383f4 (e:43f4)
	ld a, HYPER_POTION
	ld b, 200

EnemyPotionContinue: ; 383f8
	ld [CurEnemyItem], a
	ld hl, EnemyMonHP + 1
	ld a, [hl]
	ld [wCurHPAnimOldHP], a
	add b
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [hl]
	ld [wCurHPAnimOldHP + 1], a
	ld [wCurHPAnimNewHP + 1], a
	jr nc, .ok
	inc a
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a
.ok
	inc hl
	ld a, [hld]
	ld b, a
	ld de, EnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wCurHPAnimMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wCurHPAnimMaxHP + 1], a
	sbc b
	jr nc, EnemyPotionFinish
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wCurHPAnimNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wCurHPAnimNewHP + 1], a

EnemyPotionFinish: ; 38436
	call PrintText_UsedItemOn
	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	call AIUsedItemSound
	predef AnimateHPBar
	jp AIUpdateHUD


AI_TrySwitch: ; 3844b
; Determine whether the AI can switch based on how many Pokemon are still alive.
; If it can switch, it will.
	ld a, [OTPartyCount]
	ld c, a
	ld hl, OTPartyMon1HP
	ld d, 0
.SwitchLoop:
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .fainted
	inc d
.fainted
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec c
	jr nz, .SwitchLoop

	ld a, d
	cp 2
	jp nc, AI_Switch
	and a
	ret
; 3846c

AI_Switch: ; 3846c
	ld a, $1
	ld [wEnemyIsSwitching], a
	ld [wEnemyGoesFirst], a
	ld hl, EnemySubStatus4
	res SUBSTATUS_RAGE, [hl]
	xor a
	ld [hBattleTurn], a
	callab PursuitSwitch

	push af
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, EnemyMonStatus
	ld bc, MON_MAXHP - MON_STATUS
	call CopyBytes
	pop af

	jr c, .skiptext
	ld hl, TextJump_EnemyWithdrew
	call PrintText

.skiptext
	ld a, 1
	ld [wBattleHasJustStarted], a
	callab NewEnemyMonStatus
	callab ResetEnemyStatLevels
	ld hl, PlayerSubStatus1
	res SUBSTATUS_IN_LOVE, [hl]
	callba EnemySwitch
	callba ResetBattleParticipants
	xor a
	ld [wBattleHasJustStarted], a
	ld a, [wLinkMode]
	and a
	ret nz
	scf
	ret
; 384d0

TextJump_EnemyWithdrew: ; 384d0
	text_jump Text_EnemyWithdrew
	db "@"
; 384d5

Function384d5: ; This appears to be unused
	call AIUsedItemSound
	call AI_HealStatus
	ld a, X_SPEED
	jp PrintText_UsedItemOn_AND_AIUpdateHUD
; 384e0

AI_HealStatus: ; 384e0
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a
	ld [EnemyMonStatus], a
	ld hl, EnemySubStatus5
	res SUBSTATUS_TOXIC, [hl]
	ret
; 384f7

EnemyUsedXAccuracy: ; 384f7
	call AIUsedItemSound
	ld hl, EnemySubStatus4
	set SUBSTATUS_X_ACCURACY, [hl]
	ld a, X_ACCURACY
	jp PrintText_UsedItemOn_AND_AIUpdateHUD
; 38504

EnemyUsedGuardSpec: ; 38504
	call AIUsedItemSound
	ld hl, EnemySubStatus4
	set SUBSTATUS_MIST, [hl]
	ld a, GUARD_SPEC
	jp PrintText_UsedItemOn_AND_AIUpdateHUD
; 38511

EnemyUsedDireHit: ; 38511
	call AIUsedItemSound
	ld hl, EnemySubStatus4
	set SUBSTATUS_FOCUS_ENERGY, [hl]
	ld a, DIRE_HIT
	jp PrintText_UsedItemOn_AND_AIUpdateHUD
; 3851e

Function3851e: ; This appears to be unused
	ld [hDivisor], a
	ld hl, EnemyMonMaxHP
	ld a, [hli]
	ld [hDividend], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 2]
	ld c, a
	ld a, [hQuotient + 1]
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

EnemyUsedXAttack: ; 38541
	ld b, ATTACK
	ld a, X_ATTACK
	jr EnemyUsedXItem
; 38547

EnemyUsedXDefend: ; 38547
	ld b, DEFENSE
	ld a, X_DEFEND
	jr EnemyUsedXItem
; 3854d

EnemyUsedXSpeed: ; 3854d
	ld b, SPEED
	ld a, X_SPEED
	jr EnemyUsedXItem
; 38553

EnemyUsedXSpecial: ; 38553
	ld b, SP_ATTACK
	ld a, X_SPECIAL


; Parameter
; a = ITEM_CONSTANT
; b = BATTLE_CONSTANT (ATTACK, DEFENSE, SPEED, SP_ATTACK, SP_DEFENSE, ACCURACY, EVASION)
EnemyUsedXItem:
	ld [CurEnemyItem], a
	push bc
	call PrintText_UsedItemOn
	pop bc
	callba CheckIfStatCanBeRaised
	jp AIUpdateHUD
; 38568


; Parameter
; a = ITEM_CONSTANT
PrintText_UsedItemOn_AND_AIUpdateHUD: ; 38568
	ld [CurEnemyItem], a
	call PrintText_UsedItemOn
	jp AIUpdateHUD
; 38571

PrintText_UsedItemOn: ; 38571
	ld a, [CurEnemyItem]
	ld [wd265], a
	call GetItemName
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, TextJump_EnemyUsedOn
	jp PrintText
; 3858c

TextJump_EnemyUsedOn: ; 3858c
	text_jump Text_EnemyUsedOn
	db "@"
; 38591
