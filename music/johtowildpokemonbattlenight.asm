_Music_JohtoWildPokemonBattleNight: ; 0xf605c
	db $80
	dw _Music_JohtoWildPokemonBattleNight_Ch1
	db $01
	dw _Music_JohtoWildPokemonBattleNight_Ch2
	db $02
	dw _Music_JohtoWildPokemonBattleNight_Ch3
; 0xf6065

_Music_JohtoWildPokemonBattleNight_Ch1: ; 0xf6065
	tempo $6b00
	volume $77
	dutycycle $03
	tone $0200
	vibrato $10, $25
	loopchannel $00, $5ddb ; end
; 0xf6076

_Music_JohtoWildPokemonBattleNight_Ch2: ; 0xf6076
	dutycycle $03
	vibrato $20, $36
	tone $0100
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf5f5d
	notetype $0c, $c2
	octave4
	note $85
	tone $0100
	dutycycle $02
	loopchannel $00, $5eb2 ; end
; 0xf608f

_Music_JohtoWildPokemonBattleNight_Ch3: ; 0xf608f
	notetype $0c, $11
	loopchannel $00, $5f94 ; end
; 0xf6096
