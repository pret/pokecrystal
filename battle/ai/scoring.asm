AIScoring_RedStatus: ; 38591
; Don't use status-only moves if the player can't be statused.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld c, a

	push hl
	push de
	push bc
	callba Function2c41a
	pop bc
	pop de
	pop hl
	jr nz, .discourage

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	push hl
	push de
	push bc
	ld hl, .statusonlyeffects
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	ld a, [BattleMonStatus]
	and a
	jr nz, .discourage

	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	jr z, .checkmove

.discourage
	call AIDiscourageMove
	jr .checkmove
; 385db

.statusonlyeffects
	db EFFECT_SLEEP
	db EFFECT_TOXIC
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db $ff
; 385e0



AIScoring_RedStatMods: ; 385e0
; Use stat-modifying moves on turn 1.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]

	cp EFFECT_ATTACK_UP
	jr c, .checkmove
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .checkmove
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .checkmove
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .checkmove

.statup
	ld a, [EnemyTurnsTaken]
	and a
	jr nz, .discourage

	jr .encourage

.statdown
	ld a, [PlayerTurnsTaken]
	and a
	jr nz, .discourage

.encourage
	call Function39527
	jr c, .checkmove

	dec [hl]
	dec [hl]
	jr .checkmove

.discourage
	call Random
	cp 30
	jr c, .checkmove
	inc [hl]
	inc [hl]
	jr .checkmove
; 38635



AIScoring_RedSuperEffective: ; 38635
; Use super-effective moves.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	push hl
	push bc
	push de
	ld a, 1
	ld [hBattleTurn], a
	callab Function347c8
	pop de
	pop bc
	pop hl

	ld a, [$d265]
	and a
	jr z, .immune
	cp 10 ; 1.0
	jr z, .checkmove
	jr c, .noteffective

; effective
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove
	dec [hl]
	jr .checkmove

.noteffective
; Discourage this move if there are any moves
; that do damage of a different type.
	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	ld d, a
	ld hl, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
	ld c, 0
.checkmove2
	dec b
	jr z, .asm_38693

	ld a, [hli]
	and a
	jr z, .asm_38693

	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp d
	jr z, .checkmove2
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .asm_38692
	jr .checkmove2

.asm_38692
	ld c, a
.asm_38693
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .checkmove
	inc [hl]
	jr .checkmove

.immune
	call AIDiscourageMove
	jr .checkmove
; 386a2



AIScoring_Offensive: ; 386a2
; Discourage non-damaging moves.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr nz, .checkmove

	inc [hl]
	inc [hl]
	jr .checkmove
; 386be



AIScoring_Smart: ; 386be
; Context-specific scoring.

	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, .table_386f2
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .nextmove

	ld a, [hli]
	ld e, a
	ld d, [hl]

	pop hl
	push hl

	ld bc, .nextmove
	push bc

	push de
	ret

.nextmove
	pop hl
	pop bc
	pop de
	inc hl
	jr .checkmove

.table_386f2
	dbw EFFECT_SLEEP,            AIScoring_Sleep
	dbw EFFECT_LEECH_HIT,        AIScoring_LeechHit
	dbw EFFECT_EXPLOSION,        AIScoring_Explosion
	dbw EFFECT_DREAM_EATER,      AIScoring_DreamEater
	dbw EFFECT_MIRROR_MOVE,      AIScoring_MirrorMove
	dbw EFFECT_EVASION_UP,       AIScoring_EvasionUp
	dbw EFFECT_ALWAYS_HIT,       AIScoring_AlwaysHit
	dbw EFFECT_ACCURACY_DOWN,    AIScoring_AccuracyDown
	dbw EFFECT_HAZE,             AIScoring_Haze
	dbw EFFECT_BIDE,             AIScoring_Bide
	dbw EFFECT_WHIRLWIND,        AIScoring_Whirlwind
	dbw EFFECT_HEAL,             AIScoring_Heal
	dbw EFFECT_TOXIC,            AIScoring_Toxic
	dbw EFFECT_LIGHT_SCREEN,     AIScoring_LightScreen
	dbw EFFECT_OHKO,             AIScoring_Ohko
	dbw EFFECT_RAZOR_WIND,       AIScoring_RazorWind
	dbw EFFECT_SUPER_FANG,       AIScoring_SuperFang
	dbw EFFECT_BIND,             AIScoring_Bind
	dbw EFFECT_UNUSED_2B,        AIScoring_Unused2B
	dbw EFFECT_CONFUSE,          AIScoring_Confuse
	dbw EFFECT_SP_DEF_UP_2,      AIScoring_SpDefenseUp2
	dbw EFFECT_REFLECT,          AIScoring_Reflect
	dbw EFFECT_PARALYZE,         AIScoring_Paralyze
	dbw EFFECT_SPEED_DOWN_HIT,   AIScoring_SpeedDownHit
	dbw EFFECT_SUBSTITUTE,       AIScoring_Substitute
	dbw EFFECT_HYPER_BEAM,       AIScoring_HyperBeam
	dbw EFFECT_RAGE,             AIScoring_Rage
	dbw EFFECT_MIMIC,            AIScoring_Mimic
	dbw EFFECT_LEECH_SEED,       AIScoring_LeechSeed
	dbw EFFECT_DISABLE,          AIScoring_Disable
	dbw EFFECT_COUNTER,          AIScoring_Counter
	dbw EFFECT_ENCORE,           AIScoring_Encore
	dbw EFFECT_PAIN_SPLIT,       AIScoring_PainSplit
	dbw EFFECT_SNORE,            AIScoring_Snore
	dbw EFFECT_CONVERSION2,      AIScoring_Conversion2
	dbw EFFECT_LOCK_ON,          AIScoring_LockOn
	dbw EFFECT_DEFROST_OPPONENT, AIScoring_DefrostOpponent
	dbw EFFECT_SLEEP_TALK,       AIScoring_SleepTalk
	dbw EFFECT_DESTINY_BOND,     AIScoring_DestinyBond
	dbw EFFECT_REVERSAL,         AIScoring_Reversal
	dbw EFFECT_SPITE,            AIScoring_Spite
	dbw EFFECT_HEAL_BELL,        AIScoring_HealBell
	dbw EFFECT_PRIORITY_HIT,     AIScoring_PriorityHit
	dbw EFFECT_THIEF,            AIScoring_Thief
	dbw EFFECT_MEAN_LOOK,        AIScoring_MeanLook
	dbw EFFECT_NIGHTMARE,        AIScoring_Nightmare
	dbw EFFECT_FLAME_WHEEL,      AIScoring_FlameWheel
	dbw EFFECT_CURSE,            AIScoring_Curse
	dbw EFFECT_PROTECT,          AIScoring_Protect
	dbw EFFECT_FORESIGHT,        AIScoring_Foresight
	dbw EFFECT_PERISH_SONG,      AIScoring_PerishSong
	dbw EFFECT_SANDSTORM,        AIScoring_Sandstorm
	dbw EFFECT_ENDURE,           AIScoring_Endure
	dbw EFFECT_ROLLOUT,          AIScoring_Rollout
	dbw EFFECT_SWAGGER,          AIScoring_Swagger
	dbw EFFECT_FURY_CUTTER,      AIScoring_FuryCutter
	dbw EFFECT_ATTRACT,          AIScoring_Attract
	dbw EFFECT_SAFEGUARD,        AIScoring_Safeguard
	dbw EFFECT_MAGNITUDE,        AIScoring_Magnitude
	dbw EFFECT_BATON_PASS,       AIScoring_BatonPass
	dbw EFFECT_PURSUIT,          AIScoring_Pursuit
	dbw EFFECT_RAPID_SPIN,       AIScoring_RapidSpin
	dbw EFFECT_MORNING_SUN,      AIScoring_MorningSun
	dbw EFFECT_SYNTHESIS,        AIScoring_Synthesis
	dbw EFFECT_MOONLIGHT,        AIScoring_Moonlight
	dbw EFFECT_HIDDEN_POWER,     AIScoring_HiddenPower
	dbw EFFECT_RAIN_DANCE,       AIScoring_RainDance
	dbw EFFECT_SUNNY_DAY,        AIScoring_SunnyDay
	dbw EFFECT_BELLY_DRUM,       AIScoring_BellyDrum
	dbw EFFECT_PSYCH_UP,         AIScoring_PsychUp
	dbw EFFECT_MIRROR_COAT,      AIScoring_MirrorCoat
	dbw EFFECT_SKULL_BASH,       AIScoring_SkullBash
	dbw EFFECT_TWISTER,          AIScoring_Twister
	dbw EFFECT_EARTHQUAKE,       AIScoring_Earthquake
	dbw EFFECT_FUTURE_SIGHT,     AIScoring_FutureSight
	dbw EFFECT_GUST,             AIScoring_Gust
	dbw EFFECT_STOMP,            AIScoring_Stomp
	dbw EFFECT_SOLARBEAM,        AIScoring_Solarbeam
	dbw EFFECT_THUNDER,          AIScoring_Thunder
	dbw EFFECT_FLY,              AIScoring_Fly
	db $ff
; 387e3


AIScoring_Sleep: ; 387e3
	ld b, EFFECT_DREAM_EATER
	call AIHasMove
	jr c, .asm_387f0

	ld b, EFFECT_NIGHTMARE
	call AIHasMove
	ret nc

.asm_387f0
	call Function39527
	ret c
	dec [hl]
	dec [hl]
	ret
; 387f7


AIScoring_LeechHit: ; 387f7
	push hl
	ld a, 1
	ld [hBattleTurn], a
	callab Function347c8
	pop hl

	ld a, [$d265]
	cp 10 ; 1.0
	jr c, .asm_38815

	ret z
	call AICheckEnemyMaxHP

	ret c
	call Function39521

	ret c
	dec [hl]
	ret

.asm_38815
	call Random

	cp $64
	ret c
	inc [hl]
	ret
; 3881d


AIScoring_LockOn: ; 3881d
	ld a, [PlayerSubStatus5]
	bit 5, a
	jr nz, .asm_38882

	push hl
	call AICheckEnemyQuarterHP

	jr nc, .asm_38877

	call AICheckEnemyHalfHP

	jr c, .asm_38834

	call AICompareSpeed

	jr nc, .asm_38877


.asm_38834
	ld a, [PlayerEvaLevel]
	cp $a
	jr nc, .asm_3887a

	cp $8
	jr nc, .asm_38875

	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_3887a

	cp $7
	jr c, .asm_38875

	ld hl, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1

.asm_3884f
	dec c
	jr z, .asm_38877

	ld a, [hli]
	and a
	jr z, .asm_38877

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 180
	jr nc, .asm_3884f

	ld a, $1
	ld [hBattleTurn], a
	push hl
	push bc

	callba Function347c8

	ld a, [$d265]
	cp $a
	pop bc
	pop hl
	jr c, .asm_3884f


.asm_38875
	pop hl
	ret

.asm_38877
	pop hl
	inc [hl]
	ret

.asm_3887a
	pop hl
	call Function39527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38882
	push hl
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1

.asm_3888b
	inc hl
	dec c
	jr z, .asm_388a2

	ld a, [de]
	and a
	jr z, .asm_388a2

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_ACC]
	cp 180
	jr nc, .asm_3888b

	dec [hl]
	dec [hl]
	jr .asm_3888b


.asm_388a2
	pop hl
	jp AIDiscourageMove

; 388a6


AIScoring_Explosion: ; 388a6
	push hl
	callba Function349f4
	pop hl
	jr nc, .asm_388b7

	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .asm_388c6

.asm_388b7
	call AICheckEnemyHalfHP
	jr c, .asm_388c6

	call AICheckEnemyQuarterHP
	ret nc

	call Random
	cp 20
	ret c

.asm_388c6
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 388ca


AIScoring_DreamEater: ; 388ca
	call Random

	cp $19
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 388d4


AIScoring_EvasionUp: ; 388d4
	ld a, [EnemyEvaLevel]
	cp $d
	jp nc, AIDiscourageMove

	call AICheckEnemyMaxHP
	jr nc, .asm_388f2

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_388ef

	call Random
	cp $b2
	jr nc, .asm_38911

.asm_388ef
	dec [hl]
	dec [hl]
	ret

.asm_388f2
	call AICheckEnemyQuarterHP
	jr nc, .asm_3890f

	call Random
	cp $a
	jr c, .asm_388ef

	call AICheckEnemyHalfHP
	jr nc, .asm_3890a

	call Function39521
	jr c, .asm_388ef
	jr .asm_38911


.asm_3890a
	call Function39527
	jr c, .asm_38911

.asm_3890f
	inc [hl]
	inc [hl]

.asm_38911
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38938

	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_38941

	ld a, [EnemyEvaLevel]
	ld b, a
	ld a, [PlayerAccLevel]
	cp b
	jr c, .asm_38936

	ld a, [PlayerFuryCutterCount]
	and a
	jr nz, .asm_388ef

	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_ENCORED, a
	jr nz, .asm_388ef


.asm_38936
	inc [hl]
	ret

.asm_38938
	call Random
	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38941
	call Function39527

	ret c
	dec [hl]
	ret
; 38947


AIScoring_AlwaysHit: ; 38947
	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_38954

	ld a, [PlayerEvaLevel]
	cp $a
	ret c

.asm_38954
	call Function39521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3895b


AIScoring_MirrorMove: ; 3895b
	ld a, [LastEnemyCounterMove]
	and a
	jr nz, .asm_38968

	call AICompareSpeed
	ret nc

	jp AIDiscourageMove

.asm_38968
	push hl
	ld hl, Table_0x39301
	ld de, 1
	call IsInArray
	pop hl
	ret nc

	call Function39527
	ret c

	dec [hl]
	call AICompareSpeed
	ret nc

	call Random
	cp $19
	ret c

	dec [hl]
	ret
; 38985


AIScoring_AccuracyDown: ; 38985
	call AICheckPlayerMaxHP
	jr nc, .asm_389a0

	call AICheckEnemyHalfHP
	jr nc, .asm_389a0

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_3899d

	call Random
	cp $b2
	jr nc, .asm_389bf

.asm_3899d
	dec [hl]
	dec [hl]
	ret

.asm_389a0
	call AICheckPlayerQuarterHP
	jr nc, .asm_389bd

	call Random
	cp $a
	jr c, .asm_3899d

	call AICheckPlayerHalfHP
	jr nc, .asm_389b8

	call Function39521
	jr c, .asm_3899d
	jr .asm_389bf

.asm_389b8
	call Function39527
	jr c, .asm_389bf

.asm_389bd
	inc [hl]
	inc [hl]

.asm_389bf
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_389e6

	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_389ef

	ld a, [EnemyEvaLevel]
	ld b, a
	ld a, [PlayerAccLevel]
	cp b
	jr c, .asm_389e4

	ld a, [PlayerFuryCutterCount]
	and a
	jr nz, .asm_3899d

	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_ENCORED, a
	jr nz, .asm_3899d

.asm_389e4
	inc [hl]
	ret

.asm_389e6
	call Random
	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_389ef
	call Function39527
	ret c

	dec [hl]
	ret
; 389f5


AIScoring_Haze: ; 389f5
	push hl
	ld hl, EnemyAtkLevel
	ld c, $8
.asm_389fb
	dec c
	jr z, .asm_38a05
	ld a, [hli]
	cp $5
	jr c, .asm_38a12
	jr .asm_389fb

.asm_38a05
	ld hl, PlayerAtkLevel
	ld c, $8
.asm_38a0a
	dec c
	jr z, .asm_38a1b
	ld a, [hli]
	cp $a
	jr c, .asm_38a0a

.asm_38a12
	pop hl
	call Random
	cp $28
	ret c
	dec [hl]
	ret

.asm_38a1b
	pop hl
	inc [hl]
	ret
; 38a1e


AIScoring_Bide: ; 38a1e
	call AICheckEnemyMaxHP
	ret c
	call Random
	cp $19
	ret c
	inc [hl]
	ret
; 38a2a


AIScoring_Whirlwind: ; 38a2a
	push hl
	callab Function3484e
	ld a, [$c716]
	cp $a
	pop hl
	ret c
	inc [hl]
	ret
; 38a3a


AIScoring_Heal:
AIScoring_MorningSun:
AIScoring_Synthesis:
AIScoring_Moonlight: ; 38a3a
	call AICheckEnemyQuarterHP
	jr nc, .asm_38a45
	call AICheckEnemyHalfHP
	ret nc
	inc [hl]
	ret

.asm_38a45
	call Random
	cp $19
	ret c
	dec [hl]
	dec [hl]
	ret
; 38a4e


AIScoring_Toxic:
AIScoring_LeechSeed: ; 38a4e
	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret
; 38a54


AIScoring_LightScreen:
AIScoring_Reflect: ; 38a54
	call AICheckEnemyMaxHP
	ret c
	call Random
	cp $14
	ret c
	inc [hl]
	ret
; 38a60


AIScoring_Ohko: ; 38a60
	ld a, [BattleMonLevel]
	ld b, a
	ld a, [EnemyMonLevel]
	cp b
	jp c, AIDiscourageMove
	call AICheckPlayerHalfHP
	ret c
	inc [hl]
	ret
; 38a71


AIScoring_Bind: ; 38a71
	ld a, [$c730]
	and a
	jr nz, .asm_38a8b

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38a91

	ld a, [PlayerSubStatus1]
	and 1<<SUBSTATUS_IN_LOVE | 1<<SUBSTATUS_ENCORED | 1<<SUBSTATUS_IDENTIFIED | 1<<SUBSTATUS_NIGHTMARE
	jr nz, .asm_38a91

	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_38a91

.asm_38a8b
	call Function39527
	ret c
	inc [hl]
	ret

.asm_38a91
	call AICheckEnemyQuarterHP
	ret nc
	call Function39527
	ret c
	dec [hl]
	dec [hl]
	ret
; 38a9c


AIScoring_RazorWind:
AIScoring_Unused2B: ; 38a9c
	ld a, [EnemySubStatus1]
	bit SUBSTATUS_PERISH, a
	jr z, .asm_38aaa

	ld a, [EnemyPerishCount]
	cp 3
	jr c, .asm_38ad3

.asm_38aaa
	push hl
	ld hl, PlayerUsedMoves
	ld c, 4

.asm_38ab0
	ld a, [hli]
	and a
	jr z, .asm_38ac1

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_PROTECT
	jr z, .asm_38ad5
	dec c
	jr nz, .asm_38ab0

.asm_38ac1
	pop hl
	ld a, [EnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .asm_38acd

	call AICheckEnemyHalfHP
	ret c

.asm_38acd
	call Random
	cp $c8
	ret c

.asm_38ad3
	inc [hl]
	ret

.asm_38ad5
	pop hl
	ld a, [hl]
	add 6
	ld [hl], a
	ret
; 38adb


AIScoring_Confuse: ; 38adb
	call AICheckPlayerHalfHP
	ret c
	call Random
	cp $19
	jr c, .asm_38ae7
	inc [hl]
.asm_38ae7
	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret
; 38aed


AIScoring_SpDefenseUp2: ; 38aed
	call AICheckEnemyHalfHP
	jr nc, .asm_38b10

	ld a, [EnemySDefLevel]
	cp $b
	jr nc, .asm_38b10
	cp $9
	ret nc

	ld a, [BattleMonType1]
	cp SPECIAL
	jr nc, .asm_38b09
	ld a, [BattleMonType2]
	cp SPECIAL
	ret c

.asm_38b09
	call Function39521
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b10
	inc [hl]
	ret
; 38b12


AIScoring_Fly: ; 38b12
	ld a, [PlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z
	call AICompareSpeed
	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38b20


AIScoring_SuperFang: ; 38b20
	call AICheckPlayerQuarterHP
	ret c
	inc [hl]
	ret
; 38b26


AIScoring_Paralyze: ; 38b26
	call AICheckPlayerQuarterHP
	jr nc, .asm_38b3a
	call AICompareSpeed
	ret c
	call AICheckEnemyQuarterHP
	ret nc
	call Function39521
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b3a
	call Function39527
	ret c
	inc [hl]
	ret
; 38b40


AIScoring_SpeedDownHit: ; 38b40
	ld a, [wEnemyMoveStruct + MOVE_ANIM]
	cp ICY_WIND
	ret nz
	call AICheckEnemyQuarterHP
	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	ret nz
	call AICompareSpeed
	ret c
	call Random
	cp 30
	ret c
	dec [hl]
	dec [hl]
	ret
; 38b5c


AIScoring_Substitute: ; 38b5c
	call AICheckEnemyHalfHP
	ret c
	jp AIDiscourageMove
; 38b63


AIScoring_HyperBeam: ; 38b63
	call AICheckEnemyHalfHP
	jr c, .asm_38b72
	call AICheckEnemyQuarterHP
	ret c
	call Function39527
	ret c
	dec [hl]
	ret

.asm_38b72
	call Random
	cp 40
	ret c
	inc [hl]
	call Function39527
	ret c
	inc [hl]
	ret
; 38b7f


AIScoring_Rage: ; 38b7f
	ld a, [EnemySubStatus4]
	bit 6, a
	jr z, .asm_38b9b

	call Function39527
	jr c, .asm_38b8c

	dec [hl]

.asm_38b8c
	ld a, [$c72c]
	cp $2
	ret c
	dec [hl]
	ld a, [$c72c]
	cp $3
	ret c
	dec [hl]
	ret

.asm_38b9b
	call AICheckEnemyHalfHP
	jr nc, .asm_38ba6

	call Function39521
	ret nc
	dec [hl]
	ret

.asm_38ba6
	inc [hl]
	ret
; 38ba8


AIScoring_Mimic: ; 38ba8
	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_38be9

	call AICheckEnemyHalfHP
	jr nc, .asm_38bef

	push hl
	ld a, [LastEnemyCounterMove]
	call AIGetEnemyMove

	ld a, $1
	ld [hBattleTurn], a
	callab Function347c8

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38bef
	jr z, .asm_38bd4

	call Function39527
	jr c, .asm_38bd4

	dec [hl]

.asm_38bd4
	ld a, [LastEnemyCounterMove]
	push hl
	ld hl, Table_0x39301
	ld de, 1
	call IsInArray

	pop hl
	ret nc
	call Function39527
	ret c
	dec [hl]
	ret

.asm_38be9
	call AICompareSpeed
	jp c, AIDiscourageMove

.asm_38bef
	inc [hl]
	ret
; 38bf1


AIScoring_Counter: ; 38bf1
	push hl
	ld hl, PlayerUsedMoves
	ld c, 4
	ld b, 0

.asm_38bf9
	ld a, [hli]
	and a
	jr z, .asm_38c0e

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c0e

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr nc, .asm_38c0e

	inc b

.asm_38c0e
	dec c
	jr nz, .asm_38bf9

	pop hl
	ld a, b
	and a
	jr z, .asm_38c39

	cp $3
	jr nc, .asm_38c30

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_38c38

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c38

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr nc, .asm_38c38


.asm_38c30
	call Random
	cp $64
	jr c, .asm_38c38

	dec [hl]

.asm_38c38
	ret

.asm_38c39
	inc [hl]
	ret
; 38c3b


AIScoring_Encore: ; 38c3b
	call AICompareSpeed
	jr nc, .asm_38c81

	ld a, [LastPlayerMove]
	and a
	jp z, AIDiscourageMove

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_38c68

	push hl
	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	ld hl, EnemyMonType1
	predef Function347d3

	pop hl
	ld a, [$d265]
	cp $a
	jr nc, .asm_38c68

	and a
	ret nz
	jr .asm_38c78

.asm_38c68
	push hl
	ld a, [LastEnemyCounterMove]
	ld hl, .table_38c85
	ld de, 1
	call IsInArray
	pop hl
	jr nc, .asm_38c81

.asm_38c78
	call Random
	cp $46
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38c81
	inc [hl]
	inc [hl]
	inc [hl]
	ret

.table_38c85
	db SWORDS_DANCE
	db WHIRLWIND
	db LEER
	db ROAR
	db DISABLE
	db MIST
	db LEECH_SEED
	db GROWTH
	db POISONPOWDER
	db STRING_SHOT
	db MEDITATE
	db AGILITY
	db TELEPORT
	db SCREECH
	db HAZE
	db FOCUS_ENERGY
	db DREAM_EATER
	db POISON_GAS
	db SPLASH
	db SHARPEN
	db CONVERSION
	db SUPER_FANG
	db SUBSTITUTE
	db TRIPLE_KICK
	db SPIDER_WEB
	db MIND_READER
	db FLAME_WHEEL
	db AEROBLAST
	db COTTON_SPORE
	db POWDER_SNOW
	db $ff
; 38ca4


AIScoring_PainSplit: ; 38ca4
	push hl
	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, BattleMonHP + 1
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret nc
	inc [hl]
	ret
; 38cba


AIScoring_Snore:
AIScoring_SleepTalk: ; 38cba
	ld a, [EnemyMonStatus]
	and $7
	cp $1
	jr z, .asm_38cc7

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38cc7
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 38ccb


AIScoring_DefrostOpponent: ; 38ccb
	ld a, [EnemyMonStatus]
	and $20
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38cd5


AIScoring_Spite: ; 38cd5
	ld a, [LastEnemyCounterMove]
	and a
	jr nz, .asm_38ce7

	call AICompareSpeed
	jp c, AIDiscourageMove

	call Function39527
	ret c
	inc [hl]
	ret

.asm_38ce7
	push hl
	ld b, a
	ld c, 4
	ld hl, BattleMonMoves
	ld de, BattleMonPP

.asm_38cf1
	ld a, [hli]
	cp b
	jr z, .asm_38cfb

	inc de
	dec c
	jr nz, .asm_38cf1

	pop hl
	ret

.asm_38cfb
	pop hl
	ld a, [de]
	cp $6
	jr c, .asm_38d0d
	cp $f
	jr nc, .asm_38d0b

	call Random
	cp $64
	ret nc

.asm_38d0b
	inc [hl]
	ret

.asm_38d0d
	call Random
	cp $64
	ret c
	dec [hl]
	dec [hl]
	ret
; 38d16


Function_0x38d16; 38d16
	jp AIDiscourageMove
; 38d19


AIScoring_DestinyBond:
AIScoring_Reversal:
AIScoring_SkullBash: ; 38d19
	call AICheckEnemyQuarterHP
	ret nc
	inc [hl]
	ret
; 38d1f


AIScoring_HealBell: ; 38d1f
	push hl
	ld a, [OTPartyCount]
	ld b, a
	ld c, 0
	ld hl, OTPartyMon1HP
	ld de, $0030

.asm_38d2c
	push hl
	ld a, [hli]
	or [hl]
	jr z, .asm_38d37

	dec hl
	dec hl
	dec hl
	ld a, [hl]
	or c
	ld c, a

.asm_38d37
	pop hl
	add hl, de
	dec b
	jr nz, .asm_38d2c

	pop hl
	ld a, c
	and a
	jr z, .asm_38d52

	ld a, [EnemyMonStatus]
	and a
	jr z, .asm_38d48

	dec [hl]

.asm_38d48
	and $27
	ret z
	call Function39527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38d52
	ld a, [EnemyMonStatus]
	and a
	ret nz
	jp AIDiscourageMove

; 38d5a


AIScoring_PriorityHit: ; 38d5a
	call AICompareSpeed

	ret c
	ld a, [PlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	jp nz, AIDiscourageMove

	ld a, $1
	ld [hBattleTurn], a
	push hl
	callab EnemyAttackDamage
	callab BattleCommand62
	callab BattleCommand07
	pop hl
	ld a, [CurDamage + 1]
	ld c, a
	ld a, [CurDamage]
	ld b, a
	ld a, [BattleMonHP + 1]
	cp c
	ld a, [BattleMonHP]
	sbc b
	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38d93


AIScoring_Thief: ; 38d93
	ld a, [hl]
	add $1e
	ld [hl], a
	ret
; 38d98


AIScoring_Conversion2: ; 38d98
	ld a, [LastPlayerMove]
	and a
	jr nz, .asm_38dc9

	push hl
	dec a
	ld hl, Moves + MOVE_TYPE
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld a, BANK(Moves)
	call GetFarByte
	ld [wPlayerMoveStruct + MOVE_TYPE], a

	xor a
	ld [hBattleTurn], a

	callab Function347c8

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38dc9

	ret z
	call Function39527

	ret c
	dec [hl]
	ret

.asm_38dc9
	call Random

	cp $19
	ret c
	inc [hl]
	ret
; 38dd1


AIScoring_Disable: ; 38dd1
	call AICompareSpeed
	jr nc, .asm_38df3

	push hl
	ld a, [LastEnemyCounterMove]
	ld hl, Table_0x39301
	ld de, 1
	call IsInArray

	pop hl
	jr nc, .asm_38dee

	call Random
	cp 100
	ret c
	dec [hl]
	ret

.asm_38dee
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	ret nz

.asm_38df3
	call Random
	cp 20
	ret c
	inc [hl]
	ret
; 38dfb


AIScoring_MeanLook: ; 38dfb
	call AICheckEnemyHalfHP
	jr nc, .asm_38e24

	push hl
	call AICheckLastPlayerMon
	pop hl
	jp z, AIDiscourageMove

	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38e26

	ld a, [PlayerSubStatus1]
	and 1<<SUBSTATUS_IN_LOVE | 1<<SUBSTATUS_ENCORED | 1<<SUBSTATUS_IDENTIFIED | 1<<SUBSTATUS_NIGHTMARE
	jr nz, .asm_38e26

	push hl
	callab Function3484e
	ld a, [$c716]
	cp $b
	pop hl
	ret nc

.asm_38e24
	inc [hl]
	ret

.asm_38e26
	call Function39521
	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38e2e


AICheckLastPlayerMon: ; 38e2e
	ld a, [PartyCount]
	ld b, a
	ld c, 0
	ld hl, PartyMon1HP
	ld de, PartyMon2 - PartyMon1

.loop
	ld a, [CurBattleMon]
	cp c
	jr z, .asm_38e44

	ld a, [hli]
	or [hl]
	ret nz
	dec hl

.asm_38e44
	add hl, de
	inc c
	dec b
	jr nz, .loop

	ret
; 38e4a


AIScoring_Nightmare: ; 38e4a
	call Function39527
	ret c
	dec [hl]
	ret
; 38e50


AIScoring_FlameWheel: ; 38e50
	ld a, [EnemyMonStatus]
	bit FRZ, a
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38e5c


AIScoring_Curse: ; 38e5c
	ld a, [EnemyMonType1]
	cp GHOST
	jr z, .ghostcurse
	ld a, [EnemyMonType2]
	cp GHOST
	jr z, .ghostcurse

	call AICheckEnemyHalfHP
	jr nc, .asm_38e93

	ld a, [EnemyAtkLevel]
	cp $b
	jr nc, .asm_38e93
	cp $9
	ret nc

	ld a, [BattleMonType1]
	cp GHOST
	jr z, .asm_38e92
	cp SPECIAL
	ret nc
	ld a, [BattleMonType2]
	cp SPECIAL
	ret nc
	call Function39521
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38e90
	inc [hl]
	inc [hl]
.asm_38e92
	inc [hl]
.asm_38e93
	inc [hl]
	ret

.ghostcurse
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jp nz, AIDiscourageMove

	push hl
	callba Function349f4
	pop hl
	jr nc, .asm_38eb0

	push hl
	call AICheckLastPlayerMon
	pop hl
	jr nz, .asm_38e90

	jr .asm_38eb7


.asm_38eb0
	push hl
	call AICheckLastPlayerMon
	pop hl
	jr z, .asm_38ecb


.asm_38eb7
	call AICheckEnemyQuarterHP
	jp nc, .asm_38e90

	call AICheckEnemyHalfHP
	jr nc, .asm_38e92

	call AICheckEnemyMaxHP
	ret nc

	ld a, [PlayerTurnsTaken]
	and a
	ret nz

.asm_38ecb
	call Function39527

	ret c
	dec [hl]
	dec [hl]
	ret
; 38ed2


AIScoring_Protect: ; 38ed2
	ld a, [$c681]
	and a
	jr nz, .asm_38f13

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	jr nz, .asm_38f14

	ld a, [PlayerFuryCutterCount]
	cp 3
	jr nc, .asm_38f0d

	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_CHARGED, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38f0d
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_38f0d
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_CURSE, a
	jr nz, .asm_38f0d

	bit SUBSTATUS_ENCORED, a
	jr z, .asm_38f14

	ld a, [PlayerRolloutCount]
	cp 3
	jr c, .asm_38f14

.asm_38f0d
	call Function39521
	ret c
	dec [hl]
	ret

.asm_38f13
	inc [hl]

.asm_38f14
	call Random
	cp 20
	ret c
	inc [hl]
	inc [hl]
	ret
; 38f1d


AIScoring_Foresight: ; 38f1d
	ld a, [EnemyAccLevel]
	cp $5
	jr c, .asm_38f41
	ld a, [PlayerEvaLevel]
	cp $a
	jr nc, .asm_38f41

	ld a, [BattleMonType1]
	cp GHOST
	jr z, .asm_38f41
	ld a, [BattleMonType2]
	cp GHOST
	jr z, .asm_38f41

	call Random
	cp 20
	ret c
	inc [hl]
	ret

.asm_38f41
	call Random
	cp 100
	ret c
	dec [hl]
	dec [hl]
	ret
; 38f4a


AIScoring_PerishSong: ; 38f4a
	push hl
	callab Function349f4
	pop hl
	jr c, .asm_38f75

	ld a, [PlayerSubStatus5]
	bit 7, a
	jr nz, .asm_38f6f

	push hl
	callab Function3484e
	ld a, [$c716]
	cp 10 ; 1.0
	pop hl
	ret c

	call Function39527
	ret c

	inc [hl]
	ret

.asm_38f6f
	call Function39527

	ret c
	dec [hl]
	ret

.asm_38f75
	ld a, [hl]
	add 5
	ld [hl], a
	ret
; 38f7a


AIScoring_Sandstorm: ; 38f7a
	ld a, [BattleMonType1]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .asm_38fa5

	ld a, [BattleMonType2]
	push hl
	ld hl, .SandstormImmuneTypes
	ld de, 1
	call IsInArray
	pop hl
	jr c, .asm_38fa5

	call AICheckPlayerHalfHP
	jr nc, .asm_38fa6

	call Function39527
	ret c

	dec [hl]
	ret

.asm_38fa5
	inc [hl]

.asm_38fa6
	inc [hl]
	ret

.SandstormImmuneTypes
	db ROCK
	db GROUND
	db STEEL
	db $ff
; 38fac


AIScoring_Endure: ; 38fac
	ld a, [$c681]
	and a
	jr nz, .asm_38fd8

	call AICheckEnemyMaxHP
	jr c, .asm_38fd8

	call AICheckEnemyQuarterHP
	jr c, .asm_38fd9

	ld b, EFFECT_REVERSAL
	call AIHasMove
	jr nc, .asm_38fcb

	call Function39521
	ret c

	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38fcb
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_LOCK_ON, a
	ret z
	call Function39527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38fd8
	inc [hl]

.asm_38fd9
	inc [hl]
	ret
; 38fdb


AIScoring_FuryCutter: ; 38fdb
	ld a, [EnemyFuryCutterCount]
	and a
	jr z, .end
	dec [hl]

	cp 2
	jr c, .end
	dec [hl]
	dec [hl]

	cp 3
	jr c, .end
	dec [hl]
	dec [hl]
	dec [hl]

.end

	; fallthrough
; 38fef


AIScoring_Rollout: ; 38fef
	ld a, [EnemySubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	jr nz, .asm_39020

	ld a, [EnemySubStatus3]
	bit SUBSTATUS_CONFUSED, a
	jr nz, .asm_39020

	ld a, [EnemyMonStatus]
	bit PAR, a
	jr nz, .asm_39020

	call AICheckEnemyQuarterHP
	jr nc, .asm_39020

	ld a, [EnemyAccLevel]
	cp 7
	jr c, .asm_39020
	ld a, [PlayerEvaLevel]
	cp 8
	jr nc, .asm_39020

	call Random
	cp 200
	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39020
	call Function39521
	ret c
	inc [hl]
	ret
; 39026


AIScoring_Swagger:
AIScoring_Attract: ; 39026
	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_39032

	call Function39521
	ret c
	inc [hl]
	ret

.asm_39032
	call Random
	cp 200
	ret nc
	dec [hl]
	ret
; 3903a


AIScoring_Safeguard: ; 3903a
	call AICheckPlayerHalfHP
	ret c
	call Function39521
	ret c
	inc [hl]
	ret
; 39044


AIScoring_Magnitude:
AIScoring_Earthquake: ; 39044
	ld a, [LastEnemyCounterMove]
	cp DIG
	ret nz

	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_UNDERGROUND, a
	jr z, .asm_39058

	call AICompareSpeed
	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39058
	call AICompareSpeed
	ret c
	call Function39527
	ret c
	dec [hl]
	ret
; 39062


AIScoring_BatonPass: ; 39062
	push hl
	callab Function3484e
	ld a, [$c716]
	cp 10 ; 1.0
	pop hl
	ret c
	inc [hl]
	ret
; 39072


AIScoring_Pursuit: ; 39072
	call AICheckPlayerQuarterHP
	jr nc, .asm_3907d
	call Function39521
	ret c
	inc [hl]
	ret

.asm_3907d
	call Function39527
	ret c
	dec [hl]
	dec [hl]
	ret
; 39084


AIScoring_RapidSpin: ; 39084
	ld a, [$c731]
	and a
	jr nz, .asm_39097

	ld a, [EnemySubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	jr nz, .asm_39097

	ld a, [EnemyScreens]
	bit SCREENS_SPIKES, a
	ret z

.asm_39097
	call Function39521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3909e


AIScoring_HiddenPower: ; 3909e
	push hl
	ld a, 1
	ld [hBattleTurn], a
	callab HiddenPowerDamage
	callab Function347c8
	pop hl

	ld a, [$d265]
	cp $a
	jr c, .asm_390c9

	ld a, d
	cp $32
	jr c, .asm_390c9

	ld a, [$d265]
	cp $b
	jr nc, .asm_390c7

	ld a, d
	cp $46
	ret c

.asm_390c7
	dec [hl]
	ret

.asm_390c9
	inc [hl]
	ret
; 390cb


AIScoring_RainDance: ; 390cb
	ld a, [BattleMonType1]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	ld a, [BattleMonType2]
	cp WATER
	jr z, AIBadWeatherType
	cp FIRE
	jr z, AIGoodWeatherType

	push hl
	ld hl, RainDanceMoves
	jr AIScoring_WeatherMove
; 390e7

RainDanceMoves: ; 390e7
	db WATER_GUN
	db HYDRO_PUMP
	db SURF
	db BUBBLEBEAM
	db THUNDER
	db WATERFALL
	db CLAMP
	db BUBBLE
	db CRABHAMMER
	db OCTAZOOKA
	db WHIRLPOOL
	db $ff
; 390f3


AIScoring_SunnyDay: ; 390f3
	ld a, [BattleMonType1]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	ld a, [BattleMonType2]
	cp FIRE
	jr z, AIBadWeatherType
	cp WATER
	jr z, AIGoodWeatherType

	push hl
	ld hl, SunnyDayMoves

	; fallthrough
; 3910d


AIScoring_WeatherMove: ; 3910d
	call AIHasMoveInArray
	pop hl
	jr nc, AIBadWeatherType

	call AICheckPlayerHalfHP
	jr nc, AIBadWeatherType

	call Function39527
	ret c

	dec [hl]
	ret
; 3911e

AIBadWeatherType: ; 3911e
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 39122

AIGoodWeatherType: ; 39122
	call AICheckPlayerHalfHP
	ret nc

	ld a, [PlayerTurnsTaken]
	and a
	jr z, .good

	ld a, [EnemyTurnsTaken]
	and a
	ret nz

.good
	dec [hl]
	dec [hl]
	ret
; 39134


SunnyDayMoves: ; 39134
	db FIRE_PUNCH
	db EMBER
	db FLAMETHROWER
	db FIRE_SPIN
	db FIRE_BLAST
	db SACRED_FIRE
	db MORNING_SUN
	db SYNTHESIS
	db $ff
; 3913d


AIScoring_BellyDrum: ; 3913d
	ld a, [EnemyAtkLevel]
	cp $a
	jr nc, .asm_3914d

	call AICheckEnemyMaxHP

	ret c
	inc [hl]
	call AICheckEnemyHalfHP

	ret c

.asm_3914d
	ld a, [hl]
	add $5
	ld [hl], a
	ret
; 39152


AIScoring_PsychUp: ; 39152
	push hl
	ld hl, EnemyAtkLevel
	ld b, $8
	ld c, $64

.asm_3915a
	ld a, [hli]
	sub $7
	add c
	ld c, a
	dec b
	jr nz, .asm_3915a

	ld hl, PlayerAtkLevel
	ld b, $8
	ld d, $64

.asm_39169
	ld a, [hli]
	sub $7
	add d
	ld d, a
	dec b
	jr nz, .asm_39169

	ld a, c
	sub d
	pop hl
	jr nc, .asm_39188

	ld a, [PlayerAccLevel]
	cp $6
	ret c
	ld a, [EnemyEvaLevel]
	cp $8
	ret nc
	call Function39521

	ret c
	dec [hl]
	ret

.asm_39188
	inc [hl]
	inc [hl]
	ret
; 3918b


AIScoring_MirrorCoat: ; 3918b
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4
	ld b, $0

.asm_39193
	ld a, [hli]
	and a
	jr z, .asm_391a8

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_391a8

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr c, .asm_391a8

	inc b

.asm_391a8
	dec c
	jr nz, .asm_39193

	pop hl
	ld a, b
	and a
	jr z, .asm_391d3

	cp $3
	jr nc, .asm_391ca

	ld a, [LastEnemyCounterMove]
	and a
	jr z, .asm_391d2

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .asm_391d2

	ld a, [wEnemyMoveStruct + MOVE_TYPE]
	cp SPECIAL
	jr c, .asm_391d2


.asm_391ca
	call Random
	cp 100
	jr c, .asm_391d2
	dec [hl]

.asm_391d2
	ret

.asm_391d3
	inc [hl]
	ret
; 391d5


AIScoring_Twister:
AIScoring_Gust: ; 391d5
	ld a, [LastEnemyCounterMove]
	cp FLY
	ret nz

	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_FLYING, a
	jr z, .asm_391e9

	call AICompareSpeed
	ret nc

	dec [hl]
	dec [hl]
	ret

.asm_391e9
	call AICompareSpeed
	ret c
	call Function39527
	ret c
	dec [hl]
	ret
; 391f3


AIScoring_FutureSight: ; 391f3
	call AICompareSpeed
	ret nc

	ld a, [PlayerSubStatus3]
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	dec [hl]
	dec [hl]
	ret
; 39200


AIScoring_Stomp: ; 39200
	ld a, [$c6fe]
	and a
	ret z

	call Function39521
	ret c

	dec [hl]
	ret
; 3920b


AIScoring_Solarbeam: ; 3920b
	ld a, [Weather]
	cp WEATHER_SUN
	jr z, .asm_3921e

	cp WEATHER_RAIN
	ret nz

	call Random
	cp 25 ; 1/10
	ret c

	inc [hl]
	inc [hl]
	ret

.asm_3921e
	call Function39521
	ret c

	dec [hl]
	dec [hl]
	ret
; 39225


AIScoring_Thunder: ; 39225
	ld a, [Weather]
	cp WEATHER_SUN
	ret nz

	call Random
	cp 25 ; 1/10
	ret c

	inc [hl]
	ret
; 39233


AICompareSpeed: ; 39233
	push bc
	ld a, [EnemyMonSpeed + 1]
	ld b, a
	ld a, [BattleMonSpeed + 1]
	cp b
	ld a, [EnemyMonSpeed]
	ld b, a
	ld a, [BattleMonSpeed]
	sbc b
	pop bc
	ret
; 39246


AICheckPlayerMaxHP: ; 39246
	push hl
	push de
	push bc
	ld de, BattleMonHP
	ld hl, BattleMonMaxHP
	jr AICheckMaxHP
; 39251


AICheckEnemyMaxHP: ; 39251
	push hl
	push de
	push bc
	ld de, EnemyMonHP
	ld hl, EnemyMonMaxHP
	; fallthrough
; 3925a


AICheckMaxHP: ; 3925a
; Return carry if hp at de matches max hp at hl.
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_39269

	inc hl
	ld a, [de]
	cp [hl]
	jr nz, .asm_39269

	pop bc
	pop de
	pop hl
	scf
	ret

.asm_39269
	pop bc
	pop de
	pop hl
	and a
	ret
; 3926e


AICheckPlayerHalfHP: ; 3926e
	push hl
	ld hl, BattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret
; 39281


AICheckEnemyHalfHP: ; 39281
	push hl
	push de
	push bc
	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret
; 39298


AICheckEnemyQuarterHP: ; 39298
	push hl
	push de
	push bc
	ld hl, EnemyMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop bc
	pop de
	pop hl
	ret
; 392b3


AICheckPlayerQuarterHP: ; 392b3
	push hl
	ld hl, BattleMonHP
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	sla c
	rl b
	inc hl
	inc hl
	ld a, [hld]
	cp c
	ld a, [hl]
	sbc b
	pop hl
	ret
; 392ca


AIHasMove: ; 392ca
; Return carry if the enemy has move b.
	push hl
	ld hl, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves

.checkmove
	ld a, [hli]
	and a
	jr z, .asm_392e0

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp b
	jr z, .asm_392e3

	dec c
	jr nz, .checkmove

.asm_392e0
	pop hl
	and a
	ret

.asm_392e3
	pop hl
	scf
	ret
; 392e6


AIHasMoveInArray: ; 392e6
; Return carry if the enemy has a move in array hl.

	push hl
	push de
	push bc

.asm_392e9
	ld a, [hli]
	cp $ff
	jr z, .asm_392fd

	ld b, a
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
	ld de, EnemyMonMoves

.asm_392f4
	dec c
	jr z, .asm_392e9

	ld a, [de]
	inc de
	cp b
	jr nz, .asm_392f4

	scf

.asm_392fd
	pop bc
	pop de
	pop hl
	ret
; 39301


Table_0x39301: ; 39301
	db DOUBLE_EDGE
	db SING
	db FLAMETHROWER
	db HYDRO_PUMP
	db SURF
	db ICE_BEAM
	db BLIZZARD
	db HYPER_BEAM
	db SLEEP_POWDER
	db THUNDERBOLT
	db THUNDER
	db EARTHQUAKE
	db TOXIC
	db PSYCHIC_M
	db HYPNOSIS
	db RECOVER
	db FIRE_BLAST
	db SOFTBOILED
	db SUPER_FANG
	db $ff
; 39315


AIScoring_Opportunist: ; 39315
; Don't use stall moves when the player's HP is low.

	call AICheckEnemyHalfHP
	ret c

	call AICheckEnemyQuarterHP
	jr nc, .asm_39322

	call Function39527
	ret c

.asm_39322
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	inc hl
	dec c
	jr z, .asm_39347

	ld a, [de]
	inc de
	and a
	jr z, .asm_39347

	push hl
	push de
	push bc
	ld hl, .stallmoves
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .checkmove

	inc [hl]
	jr .checkmove

.asm_39347
	ret

.stallmoves
	db SWORDS_DANCE
	db TAIL_WHIP
	db LEER
	db GROWL
	db DISABLE
	db MIST
	db COUNTER
	db LEECH_SEED
	db GROWTH
	db STRING_SHOT
	db MEDITATE
	db AGILITY
	db RAGE
	db MIMIC
	db SCREECH
	db HARDEN
	db WITHDRAW
	db DEFENSE_CURL
	db BARRIER
	db LIGHT_SCREEN
	db HAZE
	db REFLECT
	db FOCUS_ENERGY
	db BIDE
	db AMNESIA
	db TRANSFORM
	db SPLASH
	db ACID_ARMOR
	db SHARPEN
	db CONVERSION
	db SUBSTITUTE
	db FLAME_WHEEL
	db $ff
; 39369



AIScoring_Aggressive: ; 39369
; Use whatever does the most damage.

; Figure out which attack does the most damage and put it in c.
	ld hl, EnemyMonMoves
	ld bc, 0
	ld de, 0
.checkmove
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .gotstrongestmove

	ld a, [hli]
	and a
	jr z, .gotstrongestmove

	push hl
	push de
	push bc
	call AIGetEnemyMove
	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nodamage
	call AIDamageCalc
	pop bc
	pop de
	pop hl

	ld a, [CurDamage + 1]
	cp e
	ld a, [CurDamage]
	sbc d
	jr c, .checkmove

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld c, b
	jr .checkmove

.nodamage
	pop bc
	pop de
	pop hl
	jr .checkmove

.gotstrongestmove
; Nothing we can do if no attacks did damage.
	ld a, c
	and a
	jr z, .done

; Discourage moves that do less damage unless they're reckless too.
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, 0
.checkmove2
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .done

	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .checkmove2

	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	cp 2
	jr c, .checkmove2

	push hl
	push de
	push bc
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld hl, .aggressivemoves
	ld de, 1
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .checkmove2

	inc [hl]
	jr .checkmove2

.done
	ret

.aggressivemoves
	db EFFECT_EXPLOSION
	db EFFECT_RAMPAGE
	db EFFECT_MULTI_HIT
	db EFFECT_DOUBLE_HIT
	db $ff
; 393e7


AIDamageCalc: ; 393e7
	ld a, 1
	ld [hBattleTurn], a
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, .ConstantDamageEffects
	call IsInArray
	jr nc, .asm_39400
	callab BattleCommand3f
	ret

.asm_39400
	callab EnemyAttackDamage
	callab BattleCommand62
	callab BattleCommand07
	ret

.ConstantDamageEffects
	db EFFECT_SUPER_FANG
	db EFFECT_STATIC_DAMAGE
	db EFFECT_LEVEL_DAMAGE
	db EFFECT_PSYWAVE
	db $ff
; 39418


AIScoring_Cautious: ; 39418
; Don't use moves with residual effects after turn 1.

	ld a, [EnemyTurnsTaken]
	and a
	ret z

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_39425
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push hl
	push de
	push bc
	ld hl, .residualmoves
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_39425

	call Random
	cp 230
	ret nc

	inc [hl]
	jr .asm_39425

.residualmoves
	db MIST
	db LEECH_SEED
	db POISONPOWDER
	db STUN_SPORE
	db THUNDER_WAVE
	db FOCUS_ENERGY
	db BIDE
	db POISON_GAS
	db TRANSFORM
	db CONVERSION
	db SUBSTITUTE
	db SPIKES
	db $ff
; 39453



AIScoring_StatusImmunity: ; 39453
; Don't use status moves that don't affect the player.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	cp EFFECT_TOXIC
	jr z, .poisonimmunity
	cp EFFECT_POISON
	jr z, .poisonimmunity
	cp EFFECT_SLEEP
	jr z, .typeimmunity
	cp EFFECT_PARALYZE
	jr z, .typeimmunity

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .checkmove

	jr .typeimmunity

.poisonimmunity
	ld a, [BattleMonType1]
	cp POISON
	jr z, .immune
	ld a, [BattleMonType2]
	cp POISON
	jr z, .immune

.typeimmunity
	push hl
	push bc
	push de
	ld a, 1
	ld [hBattleTurn], a
	callab Function347c8
	pop de
	pop bc
	pop hl

	ld a, [$d265]
	and a
	jr nz, .checkmove

.immune
	call AIDiscourageMove
	jr .checkmove
; 394a9



AIScoring_Risky: ; 394a9
; Use any move that will KO the opponent.

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.checkmove
	inc hl
	dec c
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call AIGetEnemyMove

	ld a, [wEnemyMoveStruct + MOVE_POWER]
	and a
	jr z, .nextmove

; Don't use risky moves at max hp.
	ld a, [wEnemyMoveStruct + MOVE_EFFECT]
	ld de, 1
	ld hl, .riskymoves
	call IsInArray
	jr nc, .checkko

	call AICheckEnemyMaxHP
	jr c, .nextmove

	call Random
	cp 200 ; 1/5
	jr c, .nextmove

.checkko
	call AIDamageCalc

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld a, [BattleMonHP + 1]
	cp e
	ld a, [BattleMonHP]
	sbc d
	jr nc, .nextmove

	pop hl
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	push hl

.nextmove
	pop hl
	pop bc
	pop de
	jr .checkmove

.riskymoves
	db EFFECT_EXPLOSION
	db EFFECT_OHKO
	db $ff
; 39502



AIScoring_None: ; 39502
	ret
; 39503


AIDiscourageMove: ; 39503
	ld a, [hl]
	add 10
	ld [hl], a
	ret
; 39508


AIGetEnemyMove: ; 39508
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes

	ld de, wEnemyMoveStruct
	ld a, BANK(Moves)
	call FarCopyBytes

	pop bc
	pop de
	pop hl
	ret
; 39521


Function39521: ; 39521
	call Random
	cp 50 ; 1/5
	ret
; 39527


Function39527: ; 39527
	call Random
	cp $80 ; 1/2
	ret
; 3952d


