_Music_PokemonLullaby: ; 0xf6d79
	db $80
	dw _Music_PokemonLullaby_Ch1
	db $01
	dw _Music_PokemonLullaby_Ch2
	db $02
	dw _Music_PokemonLullaby_Ch3
; 0xf6d82

_Music_PokemonLullaby_Ch1: ; 0xf6d82
	tempo $e000
	volume $77
	dutycycle $03
	tone $0100
	notetype $0c, $a7
	octave3
	note $8f
	octave4
	note $1f
	stereopanning $f0
	octave3
	note $8f
	stereopanning $0f
	octave4
	note $17
	stereopanning $f0
	octave3
	note $c7
	stereopanning $0f
	note $8f
	stereopanning $f0
	octave4
	note $17
	stereopanning $0f
	octave3
	note $c7
	stereopanning $f0
	note $87
	stereopanning $ff
	note $01
	note $81
	note $81
	note $c1
	octave4
	note $13
	octave3
	note $c3
	octave4
	note $13
	octave3
	note $c3
	note $8f
	octave4
	note $17
	octave3
	note $c7
	loopchannel $00, $6d8c ; end
; 0xf6dc4

_Music_PokemonLullaby_Ch2: ; 0xf6dc4
	vibrato $10, $14
	dutycycle $00
	notetype $0c, $b4
	note $0f
	note $09
	octave4
	note $81
	note $71
	note $81
	intensity $b7
	note $5b
	note $31
	note $51
	note $63
	note $83
	note $61
	note $51
	note $31
	note $61
	note $59
	intensity $b5
	note $31
	note $31
	intensity $c7
	note $51
	note $63
	note $53
	note $63
	intensity $b5
	note $81
	note $81
	note $41
	intensity $b7
	note $5d
	intensity $87
	octave3
	note $67
	note $83
	intensity $b5
	octave4
	note $81
	note $81
	intensity $b7
	note $41
	note $5f
	note $0d
	loopchannel $00, $6dcc ; end
; 0xf6e03

_Music_PokemonLullaby_Ch3: ; 0xf6e03
	notetype $0c, $11
	stereopanning $f0
	octave4
	note $11
	note $51
	note $81
	note $c1
	octave5
	note $11
	octave4
	note $c1
	note $a1
	note $81
	stereopanning $0f
	note $31
	note $61
	note $a1
	octave5
	note $11
	note $31
	note $11
	octave4
	note $c1
	note $a1
	loopchannel $00, $6e06 ; end
; 0xf6e23
