_Music_PokemonChannel: ; 0xee45f
	db $c0
	dw _Music_PokemonChannel_Ch1
	db $01
	dw _Music_PokemonChannel_Ch2
	db $02
	dw _Music_PokemonChannel_Ch3
	db $03
	dw _Music_PokemonChannel_Ch4
; 0xee46b

_Music_PokemonChannel_Ch1: ; 0xee46b
	tempo $8000
	volume $77
	vibrato $08, $38
	dutycycle $01
	stereopanning $0f
	notetype $0c, $b3
	octave2
	note $c0
	note $01
	note $70
	note $c0
	note $00
	octave3
	note $73
	dutycycle $00
	octave2
	note $c0
	note $00
	note $c0
	note $00
	notetype $06, $b3
	note $80
	note $00
	note $c0
	note $00
	dutycycle $01
	octave3
	note $11
	note $03
	note $81
	note $11
	note $01
	note $c7
	dutycycle $00
	note $13
	note $13
	octave2
	note $81
	note $01
	dutycycle $03
	octave4
	note $31
	note $01
	note $31
	note $01
	octave3
	note $81
	note $c1
	octave4
	note $31
	note $71
	note $81
	note $01
	note $41
	note $01
	note $11
	note $01
	note $41
	note $01
	note $07
	octave3
	note $81
	note $05
	note $c1
	note $05
	note $31
	note $05
	endchannel ; end
; 0xee4be

_Music_PokemonChannel_Ch2: ; 0xee4be
	dutycycle $01
	vibrato $08, $38
	stereopanning $ff
	notetype $0c, $b3
	octave3
	note $82
	note $a0
	note $c0
	note $00
	octave4
	note $33
	dutycycle $00
	octave3
	note $80
	note $00
	note $80
	note $00
	notetype $06, $b3
	note $30
	note $00
	note $80
	note $00
	dutycycle $01
	octave4
	note $15
	note $31
	note $51
	note $01
	note $87
	dutycycle $00
	octave3
	note $83
	note $73
	note $51
	note $01
	dutycycle $03
	octave4
	note $c1
	note $01
	note $b1
	note $01
	note $c7
	octave5
	note $11
	note $01
	note $11
	note $01
	octave4
	note $b1
	note $01
	note $91
	note $01
	note $07
	note $31
	octave3
	note $c0
	note $00
	note $80
	note $00
	note $30
	note $00
	octave4
	note $81
	note $05
	octave3
	note $81
	note $05
	endchannel ; end
; 0xee50e

_Music_PokemonChannel_Ch3: ; 0xee50e
	vibrato $08, $38
	notetype $0c, $25
	stereopanning $f0
	octave2
	note $80
	note $01
	note $c0
	octave3
	note $30
	note $00
	note $85
	note $03
	note $10
	note $01
	octave2
	note $80
	octave3
	note $10
	note $00
	note $55
	note $03
	octave4
	note $80
	note $00
	note $30
	note $00
	octave3
	note $83
	note $90
	note $00
	octave4
	note $10
	note $00
	note $40
	note $00
	note $90
	note $00
	note $30
	octave3
	note $c0
	note $80
	note $c0
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $80
	note $02
	note $80
	note $02
	endchannel ; end
; 0xee549

_Music_PokemonChannel_Ch4: ; 0xee549
	togglenoise $03
	notetype $0c
	note $b2
	note $b0
	note $31
	note $13
	note $31
	note $31
	note $b0
	note $30
	loopchannel $02, $654d
	note $91
	note $b1
	note $90
	note $90
	note $90
	note $90
	note $13
	note $90
	note $90
	note $90
	note $90
	note $c3
	note $33
	note $b3
	note $b3
	endchannel ; end
; 0xee569
