_Music_WildPokemonVictory: ; 0xf4518
	db $80
	dw _Music_WildPokemonVictory_Ch1
	db $01
	dw _Music_WildPokemonVictory_Ch2
	db $02
	dw _Music_WildPokemonVictory_Ch3
; 0xf4521

_Music_WildPokemonVictory_Ch1: ; 0xf4521
	tempo $7e00
	volume $77
	dutycycle $03
	tone $0100
	notetype $0c, $b1
	octave3
	note $c0
	note $a0
	note $90
	note $70
	intensity $b6
	note $5b
	stereopanning $0f
	callchannel _Music_WildPokemonVictory_sub_0xf455c
	note $71
	note $71
	note $73
	callchannel _Music_WildPokemonVictory_sub_0xf455c
	note $93
	intensity $78
	octave3
	note $83
	forceoctave $01
	callchannel _Music_WildPokemonVictory_sub_0xf455c
	note $71
	note $71
	note $73
	callchannel _Music_WildPokemonVictory_sub_0xf455c
	note $93
	forceoctave $00
	intensity $78
	octave3
	note $73
	loopchannel $00, $4538 ; end
; 0xf455c

_Music_WildPokemonVictory_sub_0xf455c: ; 0xf455c
; subroutine
	intensity $71
	octave3
	note $90
	note $c0
	octave4
	note $51
	octave3
	note $c1
	octave4
	note $51
	octave3
	note $90
	note $70
	note $50
	note $70
	note $91
	note $51
	note $a0
	octave4
	note $20
	note $51
	note $51
	note $a1
	endchannel ; end
; 0xf4575

_Music_WildPokemonVictory_Ch2: ; 0xf4575
	vibrato $12, $24
	dutycycle $02
	notetype $0c, $d1
	octave4
	note $50
	note $70
	note $90
	note $a0
	intensity $d6
	note $cb
	stereopanning $f0
	callchannel _Music_WildPokemonVictory_sub_0xf45b5
	octave4
	note $c1
	note $c1
	note $c3
	callchannel _Music_WildPokemonVictory_sub_0xf45b5
	octave4
	note $c3
	intensity $81
	note $10
	note $50
	note $80
	note $b0
	forceoctave $01
	callchannel _Music_WildPokemonVictory_sub_0xf45b5
	octave4
	note $c1
	note $c1
	note $c3
	callchannel _Music_WildPokemonVictory_sub_0xf45b5
	octave4
	note $c3
	forceoctave $00
	intensity $81
	octave3
	note $c0
	octave4
	note $40
	note $70
	note $a0
	loopchannel $00, $4587 ; end
; 0xf45b5

_Music_WildPokemonVictory_sub_0xf45b5: ; 0xf45b5
; subroutine
	intensity $81
	octave4
	note $c1
	note $a1
	note $91
	note $a1
	note $c1
	note $c1
	note $c3
	octave5
	note $21
	note $21
	note $23
	endchannel ; end
; 0xf45c4

_Music_WildPokemonVictory_Ch3: ; 0xf45c4
	notetype $0c, $20
	note $05
	octave6
	note $40
	note $00
	note $50
	note $02
	note $50
	note $02
	callchannel _Music_WildPokemonVictory_sub_0xf45f4
	note $41
	note $21
	octave2
	note $c1
	note $01
	callchannel _Music_WildPokemonVictory_sub_0xf45f4
	note $51
	note $01
	note $13
	forceoctave $01
	callchannel _Music_WildPokemonVictory_sub_0xf45f4
	note $41
	note $21
	octave2
	note $c1
	note $01
	callchannel _Music_WildPokemonVictory_sub_0xf45f4
	note $51
	note $01
	forceoctave $00
	octave2
	note $c3
	loopchannel $00, $45cf ; end
; 0xf45f4

_Music_WildPokemonVictory_sub_0xf45f4: ; 0xf45f4
; subroutine
	intensity $25
	octave3
	note $51
	note $03
	note $51
	note $01
	note $31
	note $01
	note $31
	note $21
	note $03
	note $21
	endchannel ; end
; 0xf4602
