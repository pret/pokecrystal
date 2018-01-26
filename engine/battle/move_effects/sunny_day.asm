BattleCommand_StartSun: ; 37c07
; startsun
	ld a, WEATHER_SUN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextBox

; 37c1a
