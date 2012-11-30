_Music_HealPokemon: ; 0xf0697
	db $80
	dw _Music_HealPokemon_Ch1
	db $01
	dw _Music_HealPokemon_Ch2
	db $02
	dw _Music_HealPokemon_Ch3
; 0xf06a0

_Music_HealPokemon_Ch1: ; 0xf06a0
	tempo $9000
	volume $77
	dutycycle $02
	tone $0100
	notetype $0c, $81
	note $01
	unknownmusic0xe0 $00, $40
	note $c1
	unknownmusic0xe0 $00, $55
	note $c1
	unknownmusic0xe0 $00, $45
	note $51
	note $03
	unknownmusic0xe0 $00, $30
	note $53
	unknownmusic0xe0 $00, $40
	note $c3
	endchannel ; end
; 0xf06c4

_Music_HealPokemon_Ch2: ; 0xf06c4
	dutycycle $02
	notetype $0c, $c3
	octave4
	note $c3
	note $c3
	note $c1
	note $91
	notetype $0c, $c4
	octave5
	note $57
	endchannel ; end
; 0xf06d4

_Music_HealPokemon_Ch3: ; 0xf06d4
	notetype $0c, $10
	octave4
	note $51
	note $01
	note $51
	note $01
	note $51
	note $91
	note $55
	note $01
	endchannel ; end
; 0xf06e1
