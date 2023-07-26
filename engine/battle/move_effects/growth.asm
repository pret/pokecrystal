BattleCommand_Growth:
	ld bc, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld bc, wEnemyStatLevels

.go

; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Attack
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise
; check for sun
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .sun

; Raise Attack and Special Attack

	call AnimateCurrentMove
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	jp BattleCommand_StatUpMessage

.sun
; Raise Attack x2 and Special Attack x2

	call AnimateCurrentMove
	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
	jp BattleCommand_StatUpMessage

.cantraise

; Can't raise either stat.

	ld b, ABILITY + 1
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox
