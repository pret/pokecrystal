BattleCommand_StartRain: ; 37bf4
; startrain
	ld a, WEATHER_RAIN
	ld [Weather], a
	ld a, 5
	ld [WeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextBox

; 37c07
