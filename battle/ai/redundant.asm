AI_Redundant: ; 2c41a
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves: ; 2c42c
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_FOCUS_ENERGY, .FocusEnergy
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_SUBSTITUTE,   .Substitute
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SNORE,        .Snore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_NIGHTMARE,    .Nightmare
	dbw EFFECT_SPIKES,       .Spikes
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_TELEPORT,     .Teleport
	dbw EFFECT_MORNING_SUN,  .MorningSun
	dbw EFFECT_SYNTHESIS,    .Synthesis
	dbw EFFECT_MOONLIGHT,    .Moonlight
	dbw EFFECT_SWAGGER,      .Swagger
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	db -1

.LightScreen: ; 2c487
	ld a, [EnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist: ; 2c48d
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.FocusEnergy: ; 2c493
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Confuse: ; 2c499
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Transform: ; 2c4a5
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect: ; 2c4ab
	ld a, [EnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Substitute: ; 2c4b1
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LeechSeed: ; 2c4b7
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.Disable: ; 2c4bd
	ld a, [PlayerDisableCount]
	and a
	ret

.Encore: ; 2c4c2
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.Snore:
.SleepTalk: ; 2c4c8
	ld a, [EnemyMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.MeanLook: ; 2c4d1
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret

.Nightmare: ; 2c4d7
	ld a, [BattleMonStatus]
	and a
	jr z, .Redundant
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_NIGHTMARE, a
	ret

.Spikes: ; 2c4e3
	ld a, [PlayerScreens]
	bit SCREENS_SPIKES, a
	ret

.Foresight: ; 2c4e9
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong: ; 2c4ef
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Sandstorm: ; 2c4f5
	ld a, [Weather]
	cp WEATHER_SANDSTORM
	jr z, .Redundant
	jr .NotRedundant

.Attract: ; 2c4fe
	callba CheckOppositeGender
	jr c, .Redundant
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.Safeguard: ; 2c50c
	ld a, [EnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.RainDance: ; 2c512
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, .Redundant
	jr .NotRedundant

.SunnyDay: ; 2c51b
	ld a, [Weather]
	cp WEATHER_SUN
	jr z, .Redundant
	jr .NotRedundant

.DreamEater: ; 2c524
	ld a, [BattleMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Swagger: ; 2c52d
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.FutureSight: ; 2c533
	ld a, [EnemyScreens]
	bit 5, a
	ret

.Heal:
.MorningSun:
.Synthesis:
.Moonlight: ; 2c539
	callba AICheckEnemyMaxHP
	jr nc, .NotRedundant

.Teleport:
.Redundant: ; 2c541
	ld a, 1
	and a
	ret

.NotRedundant: ; 2c545
	xor a
	ret
