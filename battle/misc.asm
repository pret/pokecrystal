Functionfbd54: ; fbd54
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .asm_fbd61
	call Functionfbd96
	jr .asm_fbd64
.asm_fbd61
	call Functionfbd9d
.asm_fbd64
	call ClearBox
	jr Functionfbd91

Functionfbd69: ; fbd69 (3e:7d69)
	callba BattleCommanda6
	jr Functionfbd77

Functionfbd71: ; fbd71 (3e:7d71)
	callba BattleCommanda7

Functionfbd77: ; fbd77 (3e:7d77)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .asm_fbd85
	call Functionfbd96
	xor a
	jr .asm_fbd8a
.asm_fbd85
	call Functionfbd9d
	ld a, $31
.asm_fbd8a
	ld [$ffad], a
	predef FillBox
Functionfbd91: ; fbd91 (3e:7d91)
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret

Functionfbd96: ; fbd96 (3e:7d96)
	hlcoord 12, 0
	lb bc, 7, 7
	ret

Functionfbd9d: ; fbd9d (3e:7d9d)
	hlcoord 2, 6
	lb bc, 6, 6
	ret


DoWeatherModifiers: ; fbda4

	ld de, .WeatherTypeModifiers
	ld a, [Weather]
	ld b, a
	ld a, [wd265] ; move type
	ld c, a

.CheckWeatherType
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_fbdc0

	cp b
	jr nz, .NextWeatherType

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherType
rept 2
	inc de
endr
	jr .CheckWeatherType


.asm_fbdc0
	ld de, .WeatherMoveModifiers

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a

.CheckWeatherMove
	ld a, [de]
	inc de
	cp $ff
	jr z, .done

	cp b
	jr nz, .NextWeatherMove

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherMove
rept 2
	inc de
endr
	jr .CheckWeatherMove

.ApplyModifier
	xor a
	ld [hMultiplicand + 0], a
	ld hl, CurDamage
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a

	inc de
	ld a, [de]
	ld [hMultiplier], a

	call Multiply

	ld a, 10
	ld [hDivisor], a
	ld b, $4
	call Divide

	ld a, [hQuotient + 0]
	and a
	ld bc, -1
	jr nz, .Update

	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	ld c, a
	or b
	jr nz, .Update

	ld bc, 1

.Update
	ld a, b
	ld [CurDamage], a
	ld a, c
	ld [CurDamage + 1], a

.done
	ret

.WeatherTypeModifiers
	db WEATHER_RAIN, WATER, 15
	db WEATHER_RAIN, FIRE,  05
	db WEATHER_SUN,  FIRE,  15
	db WEATHER_SUN,  WATER, 05
	db $ff

.WeatherMoveModifiers
	db WEATHER_RAIN, EFFECT_SOLARBEAM, 05
	db $ff
; fbe24


DoBadgeTypeBoosts: ; fbe24
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [InBattleTowerBattle]
	and a
	ret nz

	ld a, [hBattleTurn]
	and a
	ret nz

	push de
	push bc

	ld hl, .BadgeTypes

	ld a, [KantoBadges]
	ld b, a
	ld a, [JohtoBadges]
	ld c, a

.CheckBadge
	ld a, [hl]
	cp $ff
	jr z, .done

	srl b
	rr c
	jr nc, .NextBadge

	ld a, [wd265] ; move type
	cp [hl]
	jr z, .ApplyBoost

.NextBadge
	inc hl
	jr .CheckBadge

.ApplyBoost
	ld a, [CurDamage]
	ld h, a
	ld d, a
	ld a, [CurDamage + 1]
	ld l, a
	ld e, a

	srl d
	rr e
	srl d
	rr e
	srl d
	rr e

	ld a, e
	or d
	jr nz, .asm_fbe6f
	ld e, 1

.asm_fbe6f
	add hl, de
	jr nc, .Update

	ld hl, $ffff

.Update
	ld a, h
	ld [CurDamage], a
	ld a, l
	ld [CurDamage + 1], a

.done
	pop bc
	pop de
	ret

.BadgeTypes
	db FLYING   ; zephyrbadge
	db BUG      ; hivebadge
	db NORMAL   ; plainbadge
	db GHOST    ; fogbadge
	db STEEL    ; mineralbadge
	db FIGHTING ; stormbadge
	db ICE      ; glacierbadge
	db DRAGON   ; risingbadge

	db ROCK     ; boulderbadge
	db WATER    ; cascadebadge
	db ELECTRIC ; thunderbadge
	db GRASS    ; rainbowbadge
	db POISON   ; soulbadge
	db PSYCHIC  ; marshbadge
	db FIRE     ; volcanobadge
	db GROUND   ; earthbadge
	db $ff
; fbe91
