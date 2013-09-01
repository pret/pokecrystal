_Music_JohtoWildPokemonBattle: ; 0xf5dc5
	db $80
	dw _Music_JohtoWildPokemonBattle_Ch1
	db $01
	dw _Music_JohtoWildPokemonBattle_Ch2
	db $02
	dw _Music_JohtoWildPokemonBattle_Ch3
; 0xf5dce

_Music_JohtoWildPokemonBattle_Ch1: ; 0xf5dce
	tempo $6800
	volume $77
	dutycycle $03
	tone $0200
	vibrato $12, $15
	notetype $0c, $b2
	octave4
	note $10
	octave3
	note $c0
	note $b0
	note $a0
	note $b0
	note $a0
	note $90
	note $80
	note $90
	note $80
	note $70
	note $60
	note $70
	note $60
	note $50
	note $40
	note $50
	note $40
	note $30
	note $20
	note $30
	note $20
	note $10
	octave2
	note $c0
	octave3
	note $10
	octave2
	note $c0
	note $b0
	note $a0
	note $b0
	note $c0
	octave3
	note $10
	note $20
	intensity $b2
	note $85
	octave2
	note $b5
	octave3
	note $33
	note $13
	note $23
	note $37
	note $45
	octave2
	note $b5
	octave3
	note $43
	note $13
	note $33
	intensity $b5
	note $47
	intensity $b2
	octave4
	note $35
	octave3
	note $b5
	octave4
	note $33
	note $13
	note $23
	note $37
	note $45
	octave3
	note $b5
	octave4
	note $43
	note $13
	note $33
	intensity $6f
	note $47
	intensity $b6
	octave3
	note $35
	octave2
	note $c5
	note $c3
	octave3
	note $65
	note $55
	note $13
	note $97
	note $b0
	note $a0
	note $80
	note $70
	note $80
	note $90
	note $a0
	note $b0
	octave4
	note $17
	octave3
	note $c0
	note $b0
	note $90
	note $80
	note $90
	note $a0
	note $b0
	note $c0
	note $35
	octave2
	note $c5
	note $c3
	octave3
	note $65
	note $55
	note $33
	note $57
	note $37
	note $17
	note $67
	note $45
	note $15
	note $13
	note $75
	note $65
	note $23
	note $a7
	note $c0
	note $b0
	note $90
	note $80
	note $90
	note $a0
	note $b0
	note $c0
	octave4
	note $27
	note $10
	octave3
	note $c0
	note $a0
	note $90
	note $a0
	note $b0
	note $c0
	octave4
	note $10
	octave3
	note $45
	note $15
	note $13
	note $75
	note $65
	note $23
	note $67
	note $47
	note $27
	note $77
	intensity $b7
	note $55
	note $35
	note $53
	note $65
	note $55
	note $13
	note $67
	note $17
	note $55
	note $35
	note $63
	note $8f
	octave4
	note $37
	note $87
	note $8f
	note $3f
	octave3
	note $13
	note $33
	note $13
	octave2
	note $c3
	octave3
	note $1f
	note $33
	note $53
	note $33
	note $73
	note $8f
	loopchannel $00, $5e2d ; end
; 0xf5ea2

_Music_JohtoWildPokemonBattle_Ch2: ; 0xf5ea2
	dutycycle $03
	vibrato $08, $36
	tone $0100
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf5f5d
	notetype $0c, $c2
	octave4
	note $85
	octave3
	note $35
	note $83
	note $63
	note $73
	note $87
	note $95
	note $35
	note $93
	note $63
	note $83
	intensity $c7
	note $97
	intensity $c2
	octave4
	note $85
	note $35
	note $83
	note $63
	note $73
	note $87
	note $95
	note $35
	note $93
	note $63
	note $83
	intensity $6f
	note $97
	intensity $c4
	octave3
	note $85
	note $35
	note $31
	note $81
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $81
	note $61
	note $81
	note $a1
	octave4
	note $21
	intensity $b0
	note $4f
	intensity $b7
	note $4f
	intensity $c4
	octave3
	note $85
	note $35
	note $31
	note $81
	octave4
	note $13
	octave3
	note $c3
	note $a3
	note $c3
	intensity $b0
	note $af
	intensity $b6
	note $af
	intensity $c4
	note $95
	note $45
	note $41
	note $91
	octave4
	note $21
	note $11
	octave3
	note $b1
	note $91
	note $71
	note $91
	note $b1
	octave4
	note $31
	intensity $b0
	note $5f
	intensity $b7
	note $5f
	intensity $c4
	octave3
	note $95
	note $45
	note $41
	note $91
	octave4
	note $23
	note $13
	octave3
	note $b3
	note $93
	intensity $b0
	note $bf
	intensity $b5
	note $bf
	intensity $c6
	octave4
	note $cb
	note $81
	note $c1
	octave5
	note $31
	note $11
	octave4
	note $c1
	note $a1
	note $81
	note $a1
	note $c1
	note $81
	note $ab
	octave3
	note $61
	note $a1
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $81
	note $61
	note $81
	note $a1
	octave4
	note $11
	intensity $c7
	note $3f
	note $87
	octave5
	note $17
	octave4
	note $cf
	note $8f
	octave3
	note $53
	note $73
	note $53
	note $33
	note $5f
	note $83
	note $a3
	note $83
	note $b3
	note $cf
	loopchannel $00, $5ed1 ; end
; 0xf5f5d

_Music_JohtoWildPokemonBattle_sub_0xf5f5d: ; 0xf5f5d
; subroutine
	notetype $0c, $c2
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	octave4
	note $60
	note $70
	note $80
	octave5
	note $80
	endchannel ; end
; 0xf5f91

_Music_JohtoWildPokemonBattle_Ch3: ; 0xf5f91
	notetype $0c, $14
	octave4
	note $81
	octave5
	note $31
	octave4
	note $81
	octave5
	note $21
	octave4
	note $71
	octave5
	note $11
	octave4
	note $71
	note $c1
	note $61
	note $b1
	note $61
	note $a1
	note $61
	note $31
	note $81
	note $61
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $51
	note $61
	note $81
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	note $41
	note $91
	note $41
	note $91
	note $41
	note $41
	note $81
	note $61
	note $31
	note $81
	loopchannel $06, $5fc6
	note $31
	note $51
	note $61
	note $81
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	note $61
	note $61
	note $81
	note $81
	note $91
	note $81
	note $61
	note $41
	note $31
	note $81
	loopchannel $07, $5fdb
	note $73
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	note $31
	note $81
	loopchannel $07, $5fe8
	note $31
	note $a1
	note $11
	note $61
	loopchannel $05, $5ff0
	note $51
	note $31
	note $11
	note $31
	note $51
	note $61
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	note $41
	note $91
	note $41
	note $91
	note $41
	note $91
	note $83
	note $51
	note $a1
	loopchannel $08, $6006
	callchannel _Music_JohtoWildPokemonBattle_sub_0xf6055
	note $41
	note $91
	note $41
	note $91
	note $41
	note $91
	note $41
	note $b1
	note $21
	note $71
	note $21
	note $71
	note $21
	note $71
	note $21
	note $71
	note $21
	note $71
	note $61
	note $71
	note $91
	note $71
	note $61
	note $41
	note $31
	note $81
	loopchannel $08, $6027
	note $11
	note $61
	loopchannel $07, $602d
	note $51
	note $11
	note $33
	note $83
	note $33
	note $83
	note $31
	note $81
	loopchannel $0c, $6039
	note $11
	note $51
	loopchannel $07, $603f
	note $61
	note $71
	note $31
	note $81
	loopchannel $06, $6047
	note $a1
	note $81
	note $71
	note $51
	loopchannel $00, $5fdb ; end
; 0xf6055

_Music_JohtoWildPokemonBattle_sub_0xf6055: ; 0xf6055
; subroutine
	note $41
	note $91
	loopchannel $04, $6055
	endchannel ; end
; 0xf605c
