_Music_PokemonMarch: ; 0xf6e23
	db $c0
	dw _Music_PokemonMarch_Ch1
	db $01
	dw _Music_PokemonMarch_Ch2
	db $02
	dw _Music_PokemonMarch_Ch3
	db $03
	dw _Music_PokemonMarch_Ch4
; 0xf6e2f

_Music_PokemonMarch_Ch1: ; 0xf6e2f
	tempo $9000
	volume $77
	stereopanning $f0
	dutycycle $03
	tone $0100
	notetype $0c, $42
	octave3
	note $33
	intensity $62
	note $33
	intensity $82
	note $33
	intensity $a2
	note $33
	notetype $08, $a2
	callchannel _Music_PokemonMarch_sub_0xf6eae
	note $41
	note $11
	note $41
	note $11
	callchannel _Music_PokemonMarch_sub_0xf6eae
	note $41
	note $11
	note $41
	note $81
	callchannel _Music_PokemonMarch_sub_0xf6eae
	note $11
	note $11
	note $41
	note $11
	callchannel _Music_PokemonMarch_sub_0xf6eae
	note $41
	note $11
	note $21
	note $41
	callchannel _Music_PokemonMarch_sub_0xf6eb8
	note $61
	note $31
	note $61
	note $31
	callchannel _Music_PokemonMarch_sub_0xf6eb8
	note $61
	note $31
	note $61
	note $a1
	callchannel _Music_PokemonMarch_sub_0xf6eb8
	note $31
	note $31
	note $61
	note $31
	callchannel _Music_PokemonMarch_sub_0xf6eb8
	note $61
	note $31
	note $61
	note $81
	callchannel _Music_PokemonMarch_sub_0xf6eb8
	note $61
	note $31
	note $61
	note $31
	callchannel _Music_PokemonMarch_sub_0xf6eae
	note $41
	note $11
	note $41
	note $11
	octave2
	note $b1
	note $b1
	octave3
	note $11
	note $31
	note $21
	note $11
	octave2
	note $b1
	note $03
	note $41
	note $03
	octave3
	note $41
	note $41
	note $61
	note $81
	note $71
	note $61
	note $43
	note $61
	note $83
	note $b1
	loopchannel $00, $6e4c ; end
; 0xf6eae

_Music_PokemonMarch_sub_0xf6eae: ; 0xf6eae
; subroutine
	note $03
	octave3
	note $40
	note $30
	note $41
	note $01
	note $41
	note $41
	note $01
	endchannel ; end
; 0xf6eb8

_Music_PokemonMarch_sub_0xf6eb8: ; 0xf6eb8
; subroutine
	note $03
	note $60
	note $50
	note $61
	note $01
	note $61
	note $61
	note $01
	endchannel ; end
; 0xf6ec1

_Music_PokemonMarch_Ch2: ; 0xf6ec1
	dutycycle $02
	vibrato $10, $22
	notetype $0c, $b2
	octave3
	note $83
	note $83
	note $83
	note $83
	notetype $0c, $b7
	octave3
	note $9b
	notetype $08, $b3
	note $41
	note $91
	note $b1
	octave4
	note $11
	note $0f
	note $05
	notetype $08, $b7
	octave3
	note $9f
	notetype $08, $b3
	note $41
	note $93
	note $b1
	octave4
	note $13
	note $21
	note $13
	note $21
	note $13
	note $21
	note $11
	octave3
	note $b1
	note $91
	notetype $08, $b7
	note $bf
	notetype $08, $b3
	note $b1
	note $61
	note $b1
	octave4
	note $11
	note $31
	note $0f
	note $05
	notetype $08, $b7
	octave3
	note $bf
	notetype $08, $b3
	note $61
	note $b3
	octave4
	note $11
	note $33
	note $41
	note $33
	note $41
	note $33
	note $41
	note $31
	note $11
	octave3
	note $c1
	notetype $08, $b7
	note $bf
	notetype $08, $b3
	note $a1
	note $b3
	octave4
	note $11
	notetype $08, $b7
	octave3
	note $9f
	notetype $08, $b3
	note $b1
	note $93
	note $61
	note $41
	note $41
	note $61
	note $81
	note $71
	note $61
	note $41
	note $01
	octave4
	note $40
	note $30
	note $40
	note $04
	octave3
	note $81
	note $81
	note $91
	note $b1
	note $a1
	note $91
	note $81
	note $01
	octave4
	note $80
	note $70
	note $80
	note $04
	loopchannel $00, $6ece ; end
; 0xf6f4d

_Music_PokemonMarch_Ch3: ; 0xf6f4d
	stereopanning $0f
	notetype $0c, $16
	note $0f
	notetype $08, $16
	callchannel _Music_PokemonMarch_sub_0xf6fe8
	note $01
	octave4
	note $41
	callchannel _Music_PokemonMarch_sub_0xf6fe8
	octave4
	note $91
	note $41
	callchannel _Music_PokemonMarch_sub_0xf6fe8
	note $01
	octave4
	note $41
	octave3
	note $91
	note $01
	octave4
	note $41
	octave3
	note $41
	note $01
	octave4
	note $41
	octave3
	note $91
	note $01
	octave4
	note $41
	octave3
	note $41
	note $81
	note $91
	octave3
	note $b1
	note $01
	octave4
	note $61
	octave3
	note $61
	note $01
	octave4
	note $61
	octave3
	note $81
	note $01
	octave4
	note $61
	octave3
	note $a1
	note $00
	octave4
	note $61
	note $00
	loopchannel $03, $6f7b
	octave3
	note $b1
	note $01
	octave4
	note $61
	octave3
	note $61
	note $01
	octave4
	note $61
	octave3
	note $b1
	note $01
	octave4
	note $61
	note $31
	note $11
	octave3
	note $c1
	note $b1
	note $01
	octave4
	note $61
	octave3
	note $61
	note $01
	octave4
	note $61
	octave3
	note $81
	note $01
	octave4
	note $61
	octave3
	note $61
	note $81
	note $b1
	note $91
	note $01
	octave4
	note $41
	octave3
	note $41
	note $01
	octave4
	note $41
	octave3
	note $61
	note $01
	octave4
	note $41
	octave3
	note $91
	note $01
	octave4
	note $11
	note $41
	note $41
	note $61
	note $81
	note $71
	note $61
	note $41
	note $03
	octave3
	note $41
	note $03
	octave4
	note $81
	note $81
	note $91
	note $b1
	note $a1
	note $91
	note $81
	note $01
	note $41
	note $61
	note $01
	note $91
	loopchannel $00, $6f56 ; end
; 0xf6fe8

_Music_PokemonMarch_sub_0xf6fe8: ; 0xf6fe8
; subroutine
	octave3
	note $91
	note $01
	octave4
	note $41
	octave3
	note $41
	note $01
	octave4
	note $41
	octave3
	note $61
	note $01
	octave4
	note $41
	octave3
	note $81
	endchannel ; end
; 0xf6ffa

_Music_PokemonMarch_Ch4: ; 0xf6ffa
	stereopanning $f0
	togglenoise $05
	notetype $08
	callchannel _Music_PokemonMarch_sub_0xf704c
	callchannel _Music_PokemonMarch_sub_0xf7042
	note $13
	note $11
	note $13
	note $11
	note $13
	note $14
	notetype $06
	note $30
	note $30
	note $20
	note $20
	notetype $08
	callchannel _Music_PokemonMarch_sub_0xf7042
	callchannel _Music_PokemonMarch_sub_0xf704c
	callchannel _Music_PokemonMarch_sub_0xf7042
	callchannel _Music_PokemonMarch_sub_0xf704c
	callchannel _Music_PokemonMarch_sub_0xf7042
	callchannel _Music_PokemonMarch_sub_0xf704c
	callchannel _Music_PokemonMarch_sub_0xf7042
	callchannel _Music_PokemonMarch_sub_0xf704c
	note $23
	note $21
	note $23
	note $21
	note $25
	note $11
	notetype $04
	note $04
	notetype $06
	note $30
	note $30
	notetype $08
	callchannel _Music_PokemonMarch_sub_0xf704c
	loopchannel $00, $7003 ; end
; 0xf7042

_Music_PokemonMarch_sub_0xf7042: ; 0xf7042
; subroutine
	note $13
	note $11
	note $13
	note $11
	note $13
	note $31
	note $31
	note $21
	note $21
	endchannel ; end
; 0xf704c

_Music_PokemonMarch_sub_0xf704c: ; 0xf704c
; subroutine
	note $13
	note $11
	note $13
	note $13
	note $13
	note $21
	note $31
	note $21
	endchannel ; end
; 0xf7055
