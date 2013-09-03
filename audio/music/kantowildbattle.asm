_Music_KantoWildPokemonBattle: ; 0xed06d
	db $80
	dw _Music_KantoWildPokemonBattle_Ch1
	db $01
	dw _Music_KantoWildPokemonBattle_Ch2
	db $02
	dw _Music_KantoWildPokemonBattle_Ch3
; 0xed076

; 0xed076
	db $03
; 0xed077

_Music_KantoWildPokemonBattle_Ch1: ; 0xed077
	tempo $7000
	volume $77
	vibrato $12, $23
	dutycycle $02
	notetype $0c, $b7
	note $0f
	octave4
	note $b5
	note $a0
	note $90
	note $a0
	note $90
	note $80
	note $70
	note $90
	note $80
	note $70
	note $60
	notetype $0c, $b7
	callchannel _Music_KantoWildPokemonBattle_sub_0xed18a
	octave4
	note $63
	note $23
	octave3
	note $c7
	callchannel _Music_KantoWildPokemonBattle_sub_0xed18a
	note $07
	note $80
	note $c0
	octave4
	note $20
	octave3
	note $c0
	note $80
	note $c0
	octave4
	note $30
	note $40
	intensity $b1
	note $55
	note $15
	octave3
	note $83
	octave4
	note $55
	note $15
	note $53
	intensity $b7
	note $60
	note $20
	octave3
	note $90
	octave4
	note $10
	note $20
	octave3
	note $90
	note $60
	note $80
	note $93
	note $70
	note $80
	note $90
	octave4
	note $10
	note $23
	octave3
	note $60
	note $90
	octave4
	note $20
	note $50
	note $62
	note $80
	note $93
	intensity $b1
	octave3
	note $85
	note $65
	note $53
	note $95
	note $85
	note $63
	octave4
	note $15
	octave3
	note $b5
	note $83
	notetype $08, $b7
	octave2
	note $81
	octave3
	note $11
	note $51
	note $11
	note $51
	note $81
	note $51
	note $81
	octave4
	note $11
	octave3
	note $81
	octave4
	note $11
	note $51
	note $61
	note $21
	octave3
	note $91
	octave4
	note $21
	octave3
	note $91
	note $61
	note $91
	note $61
	note $21
	note $61
	note $21
	octave2
	note $91
	notetype $0c, $b7
	octave3
	note $93
	octave4
	note $23
	intensity $71
	note $60
	note $60
	intensity $91
	note $60
	note $60
	intensity $b1
	note $90
	note $90
	intensity $d1
	note $90
	note $90
	intensity $c7
	note $50
	note $30
	note $20
	note $30
	note $5b
	note $57
	intensity $b1
	note $50
	note $30
	note $10
	octave3
	note $b0
	note $a0
	note $80
	note $60
	note $50
	intensity $b7
	note $37
	note $67
	note $b7
	octave4
	note $37
	octave3
	note $87
	octave4
	note $17
	note $57
	note $87
	note $07
	octave3
	note $47
	note $97
	octave4
	note $17
	octave3
	note $b7
	note $07
	octave4
	note $37
	octave3
	note $91
	note $61
	note $31
	note $61
	octave4
	note $13
	note $05
	note $10
	note $04
	note $21
	note $10
	note $0c
	note $23
	note $05
	note $20
	note $04
	note $61
	note $40
	note $04
	note $27
	intensity $b1
	octave3
	note $10
	note $40
	note $30
	note $20
	loopchannel $08, $515b
	note $20
	note $60
	note $50
	note $40
	loopchannel $08, $5166
	note $10
	note $40
	note $30
	note $20
	loopchannel $10, $516e
	note $20
	note $50
	note $40
	note $30
	loopchannel $08, $5176
	note $10
	note $40
	note $30
	note $20
	loopchannel $08, $517e
	loopchannel $00, $5091 ; end
; 0xed18a

_Music_KantoWildPokemonBattle_sub_0xed18a: ; 0xed18a
; subroutine
	octave4
	note $10
	note $04
	octave3
	note $c0
	note $04
	note $b0
	note $02
	note $09
	octave4
	note $11
	note $01
	note $41
	note $20
	note $04
	note $10
	note $04
	octave3
	note $c0
	note $02
	endchannel ; end
; 0xed19f

_Music_KantoWildPokemonBattle_Ch2: ; 0xed19f
	dutycycle $01
	vibrato $12, $23
	notetype $0c, $b1
	octave4
	note $80
	note $70
	note $60
	note $50
	note $80
	note $70
	note $60
	note $50
	note $80
	note $70
	note $60
	note $50
	note $80
	note $70
	note $60
	note $50
	note $80
	note $70
	note $60
	note $50
	note $70
	note $60
	note $50
	note $40
	note $60
	note $50
	note $40
	note $30
	note $50
	note $40
	note $30
	note $20
	notetype $0c, $b7
	callchannel _Music_KantoWildPokemonBattle_sub_0xed2c6
	octave2
	note $61
	octave1
	note $c0
	note $00
	octave2
	note $81
	callchannel _Music_KantoWildPokemonBattle_sub_0xed2c6
	octave2
	note $80
	note $00
	octave1
	note $c0
	note $00
	octave2
	note $60
	note $70
	notetype $06, $b7
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	forceoctave $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	forceoctave $00
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	forceoctave $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	forceoctave $00
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	callchannel _Music_KantoWildPokemonBattle_sub_0xed307
	note $0f
	octave3
	note $bf
	octave4
	note $3f
	note $6f
	notetype $0c, $b7
	note $5f
	note $87
	octave5
	note $17
	note $07
	octave3
	note $97
	octave4
	note $17
	note $47
	note $67
	note $60
	octave3
	note $b0
	note $90
	note $b0
	octave4
	note $60
	octave3
	note $b0
	note $90
	note $b0
	octave4
	note $97
	note $90
	note $60
	note $30
	octave3
	note $c0
	octave4
	note $60
	note $30
	octave3
	note $c0
	note $90
	notetype $06, $b7
	callchannel _Music_KantoWildPokemonBattle_sub_0xed31b
	forceoctave $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed31b
	forceoctave $00
	callchannel _Music_KantoWildPokemonBattle_sub_0xed340
	octave2
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	note $11
	note $01
	octave4
	note $13
	octave2
	note $11
	note $01
	octave4
	note $43
	octave2
	note $11
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	note $21
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	note $21
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	note $21
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	note $21
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	octave4
	note $63
	octave2
	note $21
	note $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed340
	callchannel _Music_KantoWildPokemonBattle_sub_0xed354
	callchannel _Music_KantoWildPokemonBattle_sub_0xed340
	callchannel _Music_KantoWildPokemonBattle_sub_0xed354
	forceoctave $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed340
	forceoctave $00
	note $21
	note $01
	octave3
	note $93
	octave2
	note $21
	note $01
	note $21
	note $01
	octave4
	note $23
	octave2
	note $21
	note $01
	octave3
	note $b3
	octave2
	note $21
	note $01
	callchannel _Music_KantoWildPokemonBattle_sub_0xed340
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	note $11
	note $01
	octave4
	note $13
	octave2
	note $11
	note $01
	octave3
	note $b3
	octave2
	note $11
	note $01
	loopchannel $00, $51c8 ; end
; 0xed2c6

_Music_KantoWildPokemonBattle_sub_0xed2c6: ; 0xed2c6
; subroutine
	octave2
	note $10
	note $01
	note $10
	octave1
	note $80
	note $00
	octave2
	note $10
	note $00
	octave3
	note $11
	octave2
	note $10
	note $00
	octave1
	note $80
	note $01
	note $80
	octave2
	note $12
	note $10
	octave1
	note $81
	octave2
	note $11
	octave1
	note $81
	octave2
	note $71
	octave1
	note $81
	octave2
	note $81
	note $20
	note $01
	note $20
	octave1
	note $90
	note $00
	octave2
	note $20
	note $00
	octave3
	note $20
	note $00
	octave2
	note $21
	octave1
	note $90
	note $01
	note $90
	octave2
	note $20
	note $01
	note $20
	octave1
	note $90
	note $00
	octave2
	note $20
	note $00
	octave1
	note $81
	endchannel ; end
; 0xed307

_Music_KantoWildPokemonBattle_sub_0xed307: ; 0xed307
; subroutine
	octave2
	note $11
	note $03
	note $10
	note $00
	note $11
	octave3
	note $11
	octave2
	note $13
	note $01
	note $11
	note $01
	note $11
	octave3
	note $11
	note $01
	octave2
	note $13
	endchannel ; end
; 0xed31b

_Music_KantoWildPokemonBattle_sub_0xed31b: ; 0xed31b
; subroutine
	octave2
	note $11
	note $03
	note $11
	note $03
	octave1
	note $80
	note $00
	note $80
	note $00
	octave2
	note $51
	note $01
	note $51
	note $01
	note $51
	note $15
	note $11
	note $03
	note $11
	octave1
	note $81
	octave2
	note $51
	note $11
	octave1
	note $81
	octave2
	note $11
	note $03
	note $11
	note $51
	note $81
	note $c1
	octave3
	note $11
	endchannel ; end
; 0xed340

_Music_KantoWildPokemonBattle_sub_0xed340: ; 0xed340
; subroutine
	octave3
	note $83
	octave2
	note $11
	note $01
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	endchannel ; end
; 0xed354

_Music_KantoWildPokemonBattle_sub_0xed354: ; 0xed354
; subroutine
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	octave3
	note $83
	octave2
	note $11
	note $01
	endchannel ; end
; 0xed368

_Music_KantoWildPokemonBattle_Ch3: ; 0xed368
	vibrato $14, $23
	notetype $0c, $14
	octave3
	note $10
	note $00
	note $10
	octave4
	note $10
	octave3
	note $20
	note $00
	note $20
	octave4
	note $20
	octave3
	note $30
	note $00
	note $30
	octave4
	note $30
	octave3
	note $40
	note $00
	note $40
	octave4
	note $40
	octave3
	note $50
	note $00
	note $50
	octave4
	note $50
	octave3
	note $60
	note $00
	note $60
	octave4
	note $60
	octave3
	note $70
	note $00
	note $70
	octave4
	note $70
	octave3
	note $80
	note $00
	note $80
	octave4
	note $80
	notetype $0c, $14
	octave5
	note $80
	note $01
	octave4
	note $80
	note $01
	octave5
	note $80
	note $02
	octave4
	note $80
	note $00
	octave5
	note $80
	note $01
	octave4
	note $80
	octave3
	note $80
	note $c0
	octave4
	note $10
	note $30
	note $45
	octave5
	note $41
	note $01
	note $81
	note $90
	note $01
	octave4
	note $90
	note $01
	octave5
	note $90
	note $02
	octave4
	note $90
	note $00
	octave5
	note $90
	note $01
	octave4
	note $90
	octave6
	note $25
	octave5
	note $90
	note $60
	note $c0
	note $80
	note $60
	note $30
	note $80
	note $60
	note $30
	octave4
	note $c0
	octave5
	note $80
	note $01
	octave4
	note $80
	note $01
	octave5
	note $80
	note $02
	octave4
	note $80
	note $00
	octave5
	note $80
	note $01
	octave4
	note $80
	note $10
	note $30
	note $40
	note $60
	note $85
	octave5
	note $41
	note $01
	note $81
	note $90
	note $01
	octave4
	note $80
	note $01
	octave5
	note $90
	note $02
	octave4
	note $80
	note $00
	octave5
	note $90
	note $01
	octave4
	note $80
	note $23
	note $93
	octave5
	note $66
	note $70
	note $81
	intensity $24
	note $10
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	intensity $14
	octave5
	note $71
	intensity $24
	note $10
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	intensity $14
	octave5
	note $51
	intensity $24
	note $10
	octave4
	note $80
	intensity $14
	octave5
	note $81
	intensity $24
	note $10
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	intensity $14
	octave5
	note $a1
	intensity $24
	note $10
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	intensity $14
	octave5
	note $81
	intensity $24
	note $10
	octave4
	note $90
	intensity $14
	octave5
	note $9b
	note $81
	note $61
	note $91
	note $81
	note $20
	note $60
	note $90
	octave6
	note $10
	note $27
	octave5
	note $11
	intensity $24
	octave4
	note $50
	note $80
	note $50
	note $80
	intensity $14
	note $b1
	intensity $24
	note $50
	note $80
	note $50
	note $80
	intensity $14
	note $91
	intensity $24
	note $50
	note $80
	intensity $14
	octave5
	note $21
	intensity $24
	octave4
	note $50
	note $80
	note $50
	note $80
	intensity $14
	octave5
	note $11
	intensity $24
	octave4
	note $50
	note $80
	note $50
	note $80
	intensity $14
	note $b1
	intensity $24
	note $50
	note $80
	intensity $14
	octave5
	note $61
	intensity $24
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	octave5
	note $10
	intensity $14
	note $51
	intensity $24
	octave4
	note $80
	octave5
	note $10
	octave4
	note $80
	octave5
	note $10
	intensity $14
	note $31
	intensity $24
	octave4
	note $80
	octave5
	note $10
	intensity $14
	octave4
	note $b3
	octave5
	note $13
	note $33
	note $63
	note $9f
	notetype $06, $14
	note $90
	note $00
	intensity $24
	note $90
	note $00
	intensity $34
	note $90
	note $00
	note $90
	note $00
	note $90
	note $00
	note $90
	note $00
	intensity $24
	note $90
	note $00
	note $90
	note $00
	note $90
	note $00
	note $90
	note $00
	intensity $14
	note $90
	note $00
	note $90
	note $00
	octave6
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	octave5
	note $81
	note $61
	note $51
	note $61
	notetype $0c, $15
	note $8b
	note $87
	notetype $06, $15
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	intensity $24
	note $80
	note $00
	note $80
	note $00
	intensity $14
	note $80
	note $00
	note $80
	note $00
	notetype $0c, $14
	octave2
	note $bf
	note $b0
	note $01
	note $b0
	note $01
	note $b0
	note $00
	octave3
	note $b0
	note $01
	note $b0
	note $01
	note $b0
	note $00
	note $10
	note $01
	notetype $06, $15
	note $10
	note $00
	note $11
	octave4
	note $11
	octave3
	note $13
	note $01
	note $11
	note $01
	note $11
	octave4
	note $11
	note $01
	octave3
	note $13
	note $11
	note $03
	note $10
	note $00
	note $11
	octave4
	note $11
	octave3
	note $13
	note $01
	note $11
	note $01
	note $11
	octave2
	note $b1
	note $01
	note $b1
	note $01
	notetype $0c, $14
	note $9f
	note $9f
	note $b1
	note $01
	note $b0
	note $02
	note $b0
	note $00
	octave3
	note $b0
	note $00
	octave2
	note $b0
	note $00
	octave3
	note $b0
	note $00
	note $31
	note $01
	note $30
	note $02
	note $30
	note $00
	octave4
	note $30
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $c0
	note $00
	octave5
	note $53
	octave4
	note $10
	note $50
	note $80
	note $c0
	octave5
	note $10
	note $00
	note $50
	note $04
	note $61
	note $50
	note $00
	octave4
	note $10
	octave3
	note $80
	octave4
	note $10
	note $50
	note $80
	note $50
	note $10
	note $50
	note $80
	octave5
	note $10
	note $50
	note $80
	note $63
	octave4
	note $20
	note $60
	note $90
	octave5
	note $10
	note $20
	note $00
	note $60
	note $04
	note $91
	note $80
	note $04
	note $67
	intensity $13
	note $85
	note $75
	note $51
	note $01
	note $85
	note $a5
	note $81
	note $01
	note $9b
	note $81
	note $61
	note $91
	note $81
	note $03
	octave6
	note $27
	octave5
	note $15
	octave4
	note $b5
	note $91
	note $01
	octave5
	note $25
	note $15
	octave4
	note $b1
	note $01
	octave5
	note $65
	note $55
	note $31
	note $01
	octave4
	note $b3
	octave5
	note $13
	note $33
	note $63
	note $9f
	note $9f
	note $8f
	note $8f
	loopchannel $00, $539e ; end
; 0xed5c6
