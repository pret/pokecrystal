Function_0x38591: ; 38591
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_38599
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]
	ld c, a

	push hl
	push de
	push bc
	ld a, $b
	ld hl, $441a
	rst FarCall
	pop bc
	pop de
	pop hl
	jr nz, .asm_385d6

	ld a, [EnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, .table_385db
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_38599

	ld a, [BattleMonStatus]
	and a
	jr nz, .asm_385d6

	ld a, [PlayerScreens]
	bit 2, a
	jr z, .asm_38599

.asm_385d6
	call $5503

	jr .asm_38599
; 385db

.table_385db
	db EFFECT_SLEEP
	db EFFECT_TOXIC
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db $ff
; 385e0



Function_0x385e0: ; 385e0
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.next
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]

	cp EFFECT_ATTACK_UP
	jr c, .next
	cp EFFECT_EVASION_UP + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN - 1
	jr z, .next
	cp EFFECT_EVASION_DOWN + 1
	jr c, .statdown

	cp EFFECT_ATTACK_UP_2
	jr c, .next
	cp EFFECT_EVASION_UP_2 + 1
	jr c, .statup

;	cp EFFECT_ATTACK_DOWN_2 - 1
	jr z, .next
	cp EFFECT_EVASION_DOWN_2 + 1
	jr c, .statdown

	jr .next

.statup
	ld a, [EnemyTurnsTaken]
	and a
	jr nz, .asm_3862a

	jr .asm_38621

.statdown
	ld a, [PlayerTurnsTaken]
	and a
	jr nz, .asm_3862a

.asm_38621
	call $5527

	jr c, .next

	dec [hl]
	dec [hl]
	jr .next

.asm_3862a
	call RNG

	cp $1e
	jr c, .next

	inc [hl]
	inc [hl]
	jr .next
; 38635



Function_0x38635: ; 38635
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3863d
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	push hl
	push bc
	push de
	ld a, 1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop de
	pop bc
	pop hl
	ld a, [$d265]
	and a
	jr z, .asm_3869d

	cp $a
	jr z, .asm_3863d

	jr c, .asm_3866c

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_3863d

	dec [hl]
	jr .asm_3863d

.asm_3866c
	push hl
	push de
	push bc
	ld a, [EnemyMoveType]
	ld d, a
	ld hl, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
	ld c, 0
.asm_3867a
	dec b
	jr z, .asm_38693

	ld a, [hli]
	and a
	jr z, .asm_38693

	call $5508

	ld a, [EnemyMoveType]
	cp d
	jr z, .asm_3867a

	ld a, [EnemyMovePower]
	and a
	jr nz, .asm_38692

	jr .asm_3867a

.asm_38692
	ld c, a
.asm_38693
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .asm_3863d

	inc [hl]
	jr .asm_3863d

.asm_3869d
	call $5503

	jr .asm_3863d
; 386a2



Function_0x386a2: ; 386a2
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_386aa
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr nz, .asm_386aa

	inc [hl]
	inc [hl]
	jr .asm_386aa
; 386be



Function_0x386be: ; 386be
	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_386c6
	dec b
	ret z

	ld a, [de]
	inc de
	and a
	ret z

	push de
	push bc
	push hl
	call $5508

	ld a, [EnemyMoveEffect]
	ld hl, .table_386f2
	ld de, 3
	call IsInArray

	inc hl
	jr nc, .asm_386ec

	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	push hl
	ld bc, .asm_386ec
	push bc
	push de
	ret

.asm_386ec
	pop hl
	pop bc
	pop de
	inc hl
	jr .asm_386c6
; 386f2

.table_386f2 ; 386f2
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
	dbw EFFECT_SP_DEFENSE_UP_2,  AIScoring_SpDefenseUp2
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
	ld b, $8
	call $52ca

	jr c, .asm_387f0

	ld b, $6b
	call $52ca

	ret nc

.asm_387f0
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 387f7


AIScoring_LeechHit: ; 387f7
	push hl
	ld a, $1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop hl
	ld a, [$d265]
	cp $a
	jr c, .asm_38815

	ret z
	call $5251

	ret c
	call $5521

	ret c
	dec [hl]
	ret

.asm_38815
	call RNG

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
	call $5298

	jr nc, .asm_38877

	call $5281

	jr c, .asm_38834

	call $5233

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

	ld hl, EnemyMonMove1
	ld c, $5

.asm_3884f
	dec c
	jr z, .asm_38877

	ld a, [hli]
	and a
	jr z, .asm_38877

	call $5508

	ld a, [EnemyMoveAccuracy]
	cp $b4
	jr nc, .asm_3884f

	ld a, $1
	ld [hBattleTurn], a
	push hl
	push bc
	ld a, $d
	ld hl, $47c8
	rst FarCall

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
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38882
	push hl
	ld hl, $d1e9
	ld de, EnemyMonMove1
	ld c, $5

.asm_3888b
	inc hl
	dec c
	jr z, .asm_388a2

	ld a, [de]
	and a
	jr z, .asm_388a2

	inc de
	call $5508

	ld a, [EnemyMoveAccuracy]
	cp $b4
	jr nc, .asm_3888b

	dec [hl]
	dec [hl]
	jr .asm_3888b


.asm_388a2
	pop hl
	jp $5503

; 388a6


AIScoring_Explosion: ; 388a6
	push hl
	ld a, $d
	ld hl, $49f4
	rst FarCall

	pop hl
	jr nc, .asm_388b7

	push hl
	call $4e2e

	pop hl
	jr nz, .asm_388c6


.asm_388b7
	call $5281

	jr c, .asm_388c6

	call $5298

	ret nc
	call RNG

	cp $14
	ret c

.asm_388c6
	inc [hl]
	inc [hl]
	inc [hl]
	ret
; 388ca


AIScoring_DreamEater: ; 388ca
	call RNG

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
	jp nc, $5503

	call $5251

	jr nc, .asm_388f2

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_388ef

	call RNG

	cp $b2
	jr nc, .asm_38911


.asm_388ef
	dec [hl]
	dec [hl]
	ret

.asm_388f2
	call $5298

	jr nc, .asm_3890f

	call RNG

	cp $a
	jr c, .asm_388ef

	call $5281

	jr nc, .asm_3890a

	call $5521

	jr c, .asm_388ef

	jr .asm_38911


.asm_3890a
	call $5527

	jr c, .asm_38911


.asm_3890f
	inc [hl]
	inc [hl]

.asm_38911
	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38938

	ld a, [PlayerSubStatus4]
	bit 7, a
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
	bit 6, a
	jr nz, .asm_388ef


.asm_38936
	inc [hl]
	ret

.asm_38938
	call RNG

	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38941
	call $5527

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
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3895b


AIScoring_MirrorMove: ; 3895b
	ld a, [LastEnemyCounterMove]
	and a
	jr nz, .asm_38968

	call $5233

	ret nc
	jp $5503


.asm_38968
	push hl
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	ret nc
	call $5527

	ret c
	dec [hl]
	call $5233

	ret nc
	call RNG

	cp $19
	ret c
	dec [hl]
	ret
; 38985


AIScoring_AccuracyDown: ; 38985
	call $5246

	jr nc, .asm_389a0

	call $5281

	jr nc, .asm_389a0

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_3899d

	call RNG

	cp $b2
	jr nc, .asm_389bf


.asm_3899d
	dec [hl]
	dec [hl]
	ret

.asm_389a0
	call $52b3

	jr nc, .asm_389bd

	call RNG

	cp $a
	jr c, .asm_3899d

	call $526e

	jr nc, .asm_389b8

	call $5521

	jr c, .asm_3899d

	jr .asm_389bf


.asm_389b8
	call $5527

	jr c, .asm_389bf


.asm_389bd
	inc [hl]
	inc [hl]

.asm_389bf
	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_389e6

	ld a, [PlayerSubStatus4]
	bit 7, a
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
	bit 6, a
	jr nz, .asm_3899d


.asm_389e4
	inc [hl]
	ret

.asm_389e6
	call RNG

	cp $50
	ret c
	dec [hl]
	dec [hl]
	ret

.asm_389ef
	call $5527

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
	call RNG

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
	call $5251

	ret c
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 38a2a


AIScoring_Whirlwind: ; 38a2a
	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

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
	call $5298

	jr nc, .asm_38a45

	call $5281

	ret nc
	inc [hl]
	ret

.asm_38a45
	call RNG

	cp $19
	ret c
	dec [hl]
	dec [hl]
	ret
; 38a4e


AIScoring_Toxic:
AIScoring_LeechSeed: ; 38a4e
	call $526e

	ret c
	inc [hl]
	ret
; 38a54


AIScoring_LightScreen:
AIScoring_Reflect: ; 38a54
	call $5251

	ret c
	call RNG

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
	jp c, $5503

	call $526e

	ret c
	inc [hl]
	ret
; 38a71


AIScoring_Bind: ; 38a71
	ld a, [$c730]
	and a
	jr nz, .asm_38a8b

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38a91

	ld a, [PlayerSubStatus1]
	and $c9
	jr nz, .asm_38a91

	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_38a91


.asm_38a8b
	call $5527

	ret c
	inc [hl]
	ret

.asm_38a91
	call $5298

	ret nc
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret
; 38a9c


AIScoring_RazorWind:
AIScoring_Unused2B: ; 38a9c
	ld a, [EnemySubStatus1]
	bit 4, a
	jr z, .asm_38aaa

	ld a, [EnemyPerishCount]
	cp $3
	jr c, .asm_38ad3


.asm_38aaa
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4

.asm_38ab0
	ld a, [hli]
	and a
	jr z, .asm_38ac1

	call $5508

	ld a, [EnemyMoveEffect]
	cp $6f
	jr z, .asm_38ad5

	dec c
	jr nz, .asm_38ab0


.asm_38ac1
	pop hl
	ld a, [EnemySubStatus3]
	bit 7, a
	jr nz, .asm_38acd

	call $5281

	ret c

.asm_38acd
	call RNG

	cp $c8
	ret c

.asm_38ad3
	inc [hl]
	ret

.asm_38ad5
	pop hl
	ld a, [hl]
	add $6
	ld [hl], a
	ret
; 38adb


AIScoring_Confuse: ; 38adb
	call $526e

	ret c
	call RNG

	cp $19
	jr c, .asm_38ae7

	inc [hl]

.asm_38ae7
	call $52b3

	ret c
	inc [hl]
	ret
; 38aed


AIScoring_SpDefenseUp2: ; 38aed
	call $5281

	jr nc, .asm_38b10

	ld a, [EnemySDefLevel]
	cp $b
	jr nc, .asm_38b10

	cp $9
	ret nc
	ld a, [BattleMonType1]
	cp $14
	jr nc, .asm_38b09

	ld a, [BattleMonType2]
	cp $14
	ret c

.asm_38b09
	call $5521

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
	and $60
	ret z
	call $5233

	ret nc
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38b20


AIScoring_SuperFang: ; 38b20
	call $52b3

	ret c
	inc [hl]
	ret
; 38b26


AIScoring_Paralyze: ; 38b26
	call $52b3

	jr nc, .asm_38b3a

	call $5233

	ret c
	call $5298

	ret nc
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38b3a
	call $5527

	ret c
	inc [hl]
	ret
; 38b40


AIScoring_SpeedDownHit: ; 38b40
	ld a, [EnemyMoveAnimation]
	cp $c4
	ret nz
	call $5298

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	ret nz
	call $5233

	ret c
	call RNG

	cp $1e
	ret c
	dec [hl]
	dec [hl]
	ret
; 38b5c


AIScoring_Substitute: ; 38b5c
	call $5281

	ret c
	jp $5503

; 38b63


AIScoring_HyperBeam: ; 38b63
	call $5281

	jr c, .asm_38b72

	call $5298

	ret c
	call $5527

	ret c
	dec [hl]
	ret

.asm_38b72
	call RNG

	cp $28
	ret c
	inc [hl]
	call $5527

	ret c
	inc [hl]
	ret
; 38b7f


AIScoring_Rage: ; 38b7f
	ld a, [EnemySubStatus4]
	bit 6, a
	jr z, .asm_38b9b

	call $5527

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
	call $5281

	jr nc, .asm_38ba6

	call $5521

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

	call $5281

	jr nc, .asm_38bef

	push hl
	ld a, [LastEnemyCounterMove]
	call $5508

	ld a, $1
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38bef

	jr z, .asm_38bd4

	call $5527

	jr c, .asm_38bd4

	dec [hl]

.asm_38bd4
	ld a, [LastEnemyCounterMove]
	push hl
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	ret nc
	call $5527

	ret c
	dec [hl]
	ret

.asm_38be9
	call $5233

	jp c, $5503


.asm_38bef
	inc [hl]
	ret
; 38bf1


AIScoring_Counter: ; 38bf1
	push hl
	ld hl, PlayerUsedMoves
	ld c, $4
	ld b, $0

.asm_38bf9
	ld a, [hli]
	and a
	jr z, .asm_38c0e

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c0e

	ld a, [EnemyMoveType]
	cp $14
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

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c38

	ld a, [EnemyMoveType]
	cp $14
	jr nc, .asm_38c38


.asm_38c30
	call RNG

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
	call $5233

	jr nc, .asm_38c81

	ld a, [LastPlayerMove]
	and a
	jp z, $5503

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_38c68

	push hl
	ld a, [EnemyMoveType]
	ld hl, EnemyMonType1
	ld a, $41
	call Predef

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
	ld hl, $4c85
	ld de, $0001
	call IsInArray

	pop hl
	jr nc, .asm_38c81


.asm_38c78
	call RNG

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
; 38c85



INCBIN "baserom.gbc", $38c85, $38ca4 - $38c85



AIScoring_PainSplit: ; 38ca4
	push hl
	ld hl, EnemyMonHPHi
	ld b, [hl]
	inc hl
	ld c, [hl]
	sla c
	rl b
	ld hl, $c63d
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

	call $5233

	jp c, $5503

	call $5527

	ret c
	inc [hl]
	ret

.asm_38ce7
	push hl
	ld b, a
	ld c, $4
	ld hl, BattleMonMove1
	ld de, BattleMonPPMove1

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

	call RNG

	cp $64
	ret nc

.asm_38d0b
	inc [hl]
	ret

.asm_38d0d
	call RNG

	cp $64
	ret c
	dec [hl]
	dec [hl]
	ret
; 38d16



INCBIN "baserom.gbc", $38d16, $38d19 - $38d16



AIScoring_DestinyBond:
AIScoring_Reversal:
AIScoring_SkullBash: ; 38d19
	call $5298

	ret nc
	inc [hl]
	ret
; 38d1f


AIScoring_HealBell: ; 38d1f
	push hl
	ld a, [OTPartyCount]
	ld b, a
	ld c, $0
	ld hl, OTPartyMon1CurHP
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
	call $5527

	ret c
	dec [hl]
	dec [hl]
	ret

.asm_38d52
	ld a, [EnemyMonStatus]
	and a
	ret nz
	jp $5503

; 38d5a


AIScoring_PriorityHit: ; 38d5a
	call $5233

	ret c
	ld a, [PlayerSubStatus3]
	and $60
	jp nz, $5503

	ld a, $1
	ld [hBattleTurn], a
	push hl
	ld hl, $53f6
	ld a, $d
	rst FarCall

	ld hl, $5612
	ld a, $d
	rst FarCall

	ld hl, $46d2
	ld a, $d
	rst FarCall

	pop hl
	ld a, [$d257]
	ld c, a
	ld a, [CurDamage]
	ld b, a
	ld a, [$c63d]
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
	ld hl, $5afe
	ld bc, $0007
	call AddNTimes

	ld a, $10
	call GetFarByte

	ld [PlayerMoveType], a
	xor a
	ld [hBattleTurn], a
	ld hl, $47c8
	ld a, $d
	rst FarCall

	ld a, [$d265]
	cp $a
	pop hl
	jr c, .asm_38dc9

	ret z
	call $5527

	ret c
	dec [hl]
	ret

.asm_38dc9
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 38dd1


AIScoring_Disable: ; 38dd1
	call $5233

	jr nc, .asm_38df3

	push hl
	ld a, [LastEnemyCounterMove]
	ld hl, $5301
	ld de, $0001
	call IsInArray

	pop hl
	jr nc, .asm_38dee

	call RNG

	cp $64
	ret c
	dec [hl]
	ret

.asm_38dee
	ld a, [EnemyMovePower]
	and a
	ret nz

.asm_38df3
	call RNG

	cp $14
	ret c
	inc [hl]
	ret
; 38dfb


AIScoring_MeanLook: ; 38dfb
	call $5281

	jr nc, .asm_38e24

	push hl
	call $4e2e

	pop hl
	jp z, $5503

	ld a, [EnemySubStatus5]
	bit 0, a
	jr nz, .asm_38e26

	ld a, [PlayerSubStatus1]
	and $c9
	jr nz, .asm_38e26

	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $b
	pop hl
	ret nc

.asm_38e24
	inc [hl]
	ret

.asm_38e26
	call $5521

	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret
; 38e2e



INCBIN "baserom.gbc", $38e2e, $38e4a - $38e2e



AIScoring_Nightmare: ; 38e4a
	call $5527

	ret c
	dec [hl]
	ret
; 38e50


AIScoring_FlameWheel: ; 38e50
	ld a, [EnemyMonStatus]
	bit 5, a
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
	cp $8
	jr z, .asm_38e95

	ld a, [EnemyMonType2]
	cp $8
	jr z, .asm_38e95

	call $5281

	jr nc, .asm_38e93

	ld a, [EnemyAtkLevel]
	cp $b
	jr nc, .asm_38e93

	cp $9
	ret nc
	ld a, [BattleMonType1]
	cp $8
	jr z, .asm_38e92

	cp $14
	ret nc
	ld a, [BattleMonType2]
	cp $14
	ret nc
	call $5521

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

.asm_38e95
	ld a, [PlayerSubStatus1]
	bit 1, a
	jp nz, $5503

	push hl
	ld a, $d
	ld hl, $49f4
	rst FarCall

	pop hl
	jr nc, .asm_38eb0

	push hl
	call $4e2e

	pop hl
	jr nz, .asm_38e90

	jr .asm_38eb7


.asm_38eb0
	push hl
	call $4e2e

	pop hl
	jr z, .asm_38ecb


.asm_38eb7
	call $5298

	jp nc, $4e90

	call $5281

	jr nc, .asm_38e92

	call $5251

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	ret nz

.asm_38ecb
	call $5527

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
	bit 5, a
	jr nz, .asm_38f14

	ld a, [PlayerFuryCutterCount]
	cp $3
	jr nc, .asm_38f0d

	ld a, [PlayerSubStatus3]
	bit 4, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus5]
	bit 0, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus4]
	bit 7, a
	jr nz, .asm_38f0d

	ld a, [PlayerSubStatus1]
	bit 1, a
	jr nz, .asm_38f0d

	bit 6, a
	jr z, .asm_38f14

	ld a, [PlayerRolloutCount]
	cp $3
	jr c, .asm_38f14


.asm_38f0d
	call $5521

	ret c
	dec [hl]
	ret

.asm_38f13
	inc [hl]

.asm_38f14
	call RNG

	cp $14
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
	cp $8
	jr z, .asm_38f41

	ld a, [BattleMonType2]
	cp $8
	jr z, .asm_38f41

	call RNG

	cp $14
	ret c
	inc [hl]
	ret

.asm_38f41
	call RNG

	cp $64
	ret c
	dec [hl]
	dec [hl]
	ret
; 38f4a


AIScoring_PerishSong: ; 38f4a
	push hl
	ld hl, $49f4
	ld a, $d
	rst FarCall

	pop hl
	jr c, .asm_38f75

	ld a, [PlayerSubStatus5]
	bit 7, a
	jr nz, .asm_38f6f

	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $a
	pop hl
	ret c
	call $5527

	ret c
	inc [hl]
	ret

.asm_38f6f
	call $5527

	ret c
	dec [hl]
	ret

.asm_38f75
	ld a, [hl]
	add $5
	ld [hl], a
	ret
; 38f7a


AIScoring_Sandstorm: ; 38f7a
	ld a, [BattleMonType1]
	push hl
	ld hl, $4fa8
	ld de, $0001
	call IsInArray

	pop hl
	jr c, .asm_38fa5

	ld a, [BattleMonType2]
	push hl
	ld hl, $4fa8
	ld de, $0001
	call IsInArray

	pop hl
	jr c, .asm_38fa5

	call $526e

	jr nc, .asm_38fa6

	call $5527

	ret c
	dec [hl]
	ret

.asm_38fa5
	inc [hl]

.asm_38fa6
	inc [hl]
	ret
; 38fa8



INCBIN "baserom.gbc", $38fa8, $38fac - $38fa8



AIScoring_Endure: ; 38fac
	ld a, [$c681]
	and a
	jr nz, .asm_38fd8

	call $5251

	jr c, .asm_38fd8

	call $5298

	jr c, .asm_38fd9

	ld b, $63
	call $52ca

	jr nc, .asm_38fcb

	call $5521

	ret c
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_38fcb
	ld a, [EnemySubStatus5]
	bit 5, a
	ret z
	call $5527

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
	jr z, AIScoring_Rollout

	dec [hl]
	cp $2
	jr c, AIScoring_Rollout

	dec [hl]
	dec [hl]
	cp $3
	jr c, AIScoring_Rollout

	dec [hl]
	dec [hl]
	dec [hl]

	; fallthrough
; 38fef


AIScoring_Rollout: ; 38fef
	ld a, [EnemySubStatus1]
	bit 7, a
	jr nz, .asm_39020

	ld a, [EnemySubStatus3]
	bit 7, a
	jr nz, .asm_39020

	ld a, [EnemyMonStatus]
	bit 6, a
	jr nz, .asm_39020

	call $5298

	jr nc, .asm_39020

	ld a, [EnemyAccLevel]
	cp $7
	jr c, .asm_39020

	ld a, [PlayerEvaLevel]
	cp $8
	jr nc, .asm_39020

	call RNG

	cp $c8
	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39020
	call $5521

	ret c
	inc [hl]
	ret
; 39026


AIScoring_Swagger:
AIScoring_Attract: ; 39026
	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_39032

	call $5521

	ret c
	inc [hl]
	ret

.asm_39032
	call RNG

	cp $c8
	ret nc
	dec [hl]
	ret
; 3903a


AIScoring_Safeguard: ; 3903a
	call $526e

	ret c
	call $5521

	ret c
	inc [hl]
	ret
; 39044


AIScoring_Magnitude:
AIScoring_Earthquake: ; 39044
	ld a, [LastEnemyCounterMove]
	cp $5b
	ret nz
	ld a, [PlayerSubStatus3]
	bit 5, a
	jr z, .asm_39058

	call $5233

	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_39058
	call $5233

	ret c
	call $5527

	ret c
	dec [hl]
	ret
; 39062


AIScoring_BatonPass: ; 39062
	push hl
	ld hl, $484e
	ld a, $d
	rst FarCall

	ld a, [$c716]
	cp $a
	pop hl
	ret c
	inc [hl]
	ret
; 39072


AIScoring_Pursuit: ; 39072
	call $52b3

	jr nc, .asm_3907d

	call $5521

	ret c
	inc [hl]
	ret

.asm_3907d
	call $5527

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
	bit 7, a
	jr nz, .asm_39097

	ld a, [EnemyScreens]
	bit 0, a
	ret z

.asm_39097
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 3909e


AIScoring_HiddenPower: ; 3909e
	push hl
	ld a, $1
	ld [hBattleTurn], a
	ld hl, $7ced
	ld a, $3e
	rst FarCall

	ld hl, $47c8
	ld a, $d
	rst FarCall

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
	cp $15
	jr z, Function_0x3911e

	cp $14
	jr z, Function_0x39122

	ld a, [BattleMonType2]
	cp $15
	jr z, Function_0x3911e

	cp $14
	jr z, Function_0x39122

	push hl
	ld hl, $50e7
	jr Function_0x3910d
; 390e7



INCBIN "baserom.gbc", $390e7, $390f3 - $390e7



AIScoring_SunnyDay: ; 390f3
	ld a, [BattleMonType1]
	cp $14
	jr z, Function_0x3911e

	cp $15
	jr z, Function_0x39122

	ld a, [BattleMonType2]
	cp $14
	jr z, Function_0x3911e

	cp $15
	jr z, Function_0x39122

	push hl
	ld hl, $5134

	; fallthrough
; 3910d


Function_0x3910d: ; 3910d
	call $52e6

	pop hl
	jr nc, Function_0x3911e

	call $526e

	jr nc, Function_0x3911e

	call $5527

	ret c
	dec [hl]
	ret

Function_0x3911e: ; 3911e
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Function_0x39122: ; 39122
	call $526e

	ret nc
	ld a, [PlayerTurnsTaken]
	and a
	jr z, .asm_39131

	ld a, [EnemyTurnsTaken]
	and a
	ret nz

.asm_39131
	dec [hl]
	dec [hl]
	ret
; 39134



INCBIN "baserom.gbc", $39134, $3913d - $39134



AIScoring_BellyDrum: ; 3913d
	ld a, [EnemyAtkLevel]
	cp $a
	jr nc, .asm_3914d

	call $5251

	ret c
	inc [hl]
	call $5281

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
	call $5521

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

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_391a8

	ld a, [EnemyMoveType]
	cp $14
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

	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_391d2

	ld a, [EnemyMoveType]
	cp $14
	jr c, .asm_391d2


.asm_391ca
	call RNG

	cp $64
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
	cp $13
	ret nz
	ld a, [PlayerSubStatus3]
	bit 6, a
	jr z, .asm_391e9

	call $5233

	ret nc
	dec [hl]
	dec [hl]
	ret

.asm_391e9
	call $5233

	ret c
	call $5527

	ret c
	dec [hl]
	ret
; 391f3


AIScoring_FutureSight: ; 391f3
	call $5233

	ret nc
	ld a, [PlayerSubStatus3]
	and $60
	ret z
	dec [hl]
	dec [hl]
	ret
; 39200


AIScoring_Stomp: ; 39200
	ld a, [$c6fe]
	and a
	ret z
	call $5521

	ret c
	dec [hl]
	ret
; 3920b


AIScoring_Solarbeam: ; 3920b
	ld a, [Weather]
	cp $2
	jr z, .asm_3921e

	cp $1
	ret nz
	call RNG

	cp $19
	ret c
	inc [hl]
	inc [hl]
	ret

.asm_3921e
	call $5521

	ret c
	dec [hl]
	dec [hl]
	ret
; 39225


AIScoring_Thunder: ; 39225
	ld a, [Weather]
	cp $2
	ret nz
	call RNG

	cp $19
	ret c
	inc [hl]
	ret
; 39233



INCBIN "baserom.gbc", $39233, $39315 - $39233



Function_0x39315: ; 39315
	call $5281
	ret c

	call $5298
	jr nc, .asm_39322

	call $5527
	ret c

.asm_39322
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3932a
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
	ld hl, .table_39348
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_3932a

	inc [hl]
	jr .asm_3932a

.asm_39347
	ret

.table_39348
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



Function_0x39369: ; 39369
	ld hl, EnemyMonMoves
	ld bc, 0
	ld de, 0
.asm_39372
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .asm_393a8

	ld a, [hli]
	and a
	jr z, .asm_393a8

	push hl
	push de
	push bc
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_393a3

	call $53e7

	pop bc
	pop de
	pop hl
	ld a, [CurDamage + 1]
	cp e
	ld a, [CurDamage]
	sbc d
	jr c, .asm_39372

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld c, b
	jr .asm_39372

.asm_393a3
	pop bc
	pop de
	pop hl
	jr .asm_39372

.asm_393a8
	ld a, c
	and a
	jr z, .asm_393e1

	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, $0
.asm_393b4
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .asm_393e1

	cp c
	ld a, [de]
	inc de
	inc hl
	jr z, .asm_393b4

	call $5508

	ld a, [EnemyMovePower]
	cp $2
	jr c, .asm_393b4

	push hl
	push de
	push bc
	ld a, [EnemyMoveEffect]
	ld hl, $53e2
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr c, .asm_393b4

	inc [hl]
	jr .asm_393b4

.asm_393e1
	ret

; 393e2


INCBIN "baserom.gbc", $393e2, $39418 - $393e2


Function_0x39418: ; 39418
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
	ld hl, .table_39446
	ld de, 1
	call IsInArray

	pop bc
	pop de
	pop hl
	jr nc, .asm_39425

	call RNG
	cp $e6
	ret nc

	inc [hl]
	jr .asm_39425

.table_39446
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



Function_0x39453: ; 39453
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld b, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_3945b
	dec b
	ret z

	inc hl
	ld a, [de]
	and a
	ret z

	inc de
	call $5508

	ld a, [EnemyMoveEffect]
	cp EFFECT_TOXIC
	jr z, .asm_39480
	cp EFFECT_POISON
	jr z, .asm_39480
	cp EFFECT_SLEEP
	jr z, .asm_3948e
	cp EFFECT_PARALYZE
	jr z, .asm_3948e

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_3945b

	jr .asm_3948e

.asm_39480
	ld a, [BattleMonType1]
	cp POISON
	jr z, .asm_394a4
	ld a, [BattleMonType2]
	cp POISON
	jr z, .asm_394a4

.asm_3948e
	push hl
	push bc
	push de

	ld a, 1
	ld [hBattleTurn], a

	ld hl, $47c8
	ld a, $d
	rst FarCall

	pop de
	pop bc
	pop hl

	ld a, [$d265]
	and a
	jr nz, .asm_3945b

.asm_394a4
	call $5503
	jr .asm_3945b
; 394a9



Function_0x394a9: ; 394a9
	ld hl, Buffer1 - 1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves + 1
.asm_394b1
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
	call $5508

	ld a, [EnemyMovePower]
	and a
	jr z, .asm_394fa

	ld a, [EnemyMoveEffect]
	ld de, 1
	ld hl, .table_394ff
	call IsInArray
	jr nc, .asm_394de

	call $5251
	jr c, .asm_394fa

	call RNG
	cp $c8
	jr c, .asm_394fa

.asm_394de
	call $53e7

	ld a, [CurDamage + 1]
	ld e, a
	ld a, [CurDamage]
	ld d, a
	ld a, [BattleMonHP + 1]
	cp e
	ld a, [BattleMonHP]
	sbc d
	jr nc, .asm_394fa

	pop hl
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	push hl
.asm_394fa
	pop hl
	pop bc
	pop de
	jr .asm_394b1

.table_394ff
	db EFFECT_EXPLOSION
	db EFFECT_OHKO
	db $ff
; 39502



Function_0x39502: ; 39502
	ret
; 39503


INCBIN "baserom.gbc", $39503, $39999 - $39503

