BattleCommand59: ; 376f8
; startsandstorm

	ld a, [Weather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call Function0x37e01
	ld hl, SandstormBrewedText
	jp StdBattleTextBox

.failed
	call Function0x37e77
	jp PrintButItFailed
; 37718

