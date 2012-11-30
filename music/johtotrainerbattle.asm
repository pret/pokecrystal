_Music_JohtoTrainerBattle: ; 0xf6096
	db $80
	dw _Music_JohtoTrainerBattle_Ch1
	db $01
	dw _Music_JohtoTrainerBattle_Ch2
	db $02
	dw _Music_JohtoTrainerBattle_Ch3
; 0xf609f

_Music_JohtoTrainerBattle_Ch1: ; 0xf609f
	tempo $6600
	volume $77
	dutycycle $03
	tone $0200
	vibrato $12, $15
	notetype $0c, $92
	note $07
	octave3
	note $a0
	note $90
	note $80
	note $90
	intensity $b2
	note $10
	octave2
	note $c0
	note $b0
	note $c0
	octave3
	note $20
	note $10
	octave2
	note $c0
	octave3
	note $10
	note $30
	note $20
	note $10
	note $20
	note $40
	note $30
	note $20
	note $30
	note $50
	note $40
	note $30
	note $40
	note $55
	note $55
	note $53
	note $51
	note $31
	note $51
	note $65
	intensity $b7
	note $33
	intensity $b2
	note $55
	note $35
	note $53
	note $51
	note $31
	note $51
	note $65
	intensity $b7
	note $63
	intensity $b2
	octave4
	note $55
	note $55
	note $53
	note $51
	note $31
	note $51
	note $61
	octave3
	note $a1
	note $b1
	intensity $b7
	note $c3
	intensity $b2
	octave4
	note $55
	note $55
	note $53
	note $51
	note $31
	note $51
	note $65
	intensity $b7
	note $83
	intensity $b4
	callchannel _Music_JohtoTrainerBattle_sub_0xf629f
	intensity $b7
	note $b3
	intensity $b3
	note $80
	note $60
	note $50
	note $80
	intensity $b7
	octave4
	note $13
	intensity $b3
	octave3
	note $a0
	note $80
	note $60
	note $a0
	intensity $b7
	octave4
	note $33
	intensity $b3
	note $10
	octave3
	note $b0
	note $a0
	octave4
	note $10
	intensity $b5
	note $61
	note $51
	note $31
	note $11
	callchannel _Music_JohtoTrainerBattle_sub_0xf629f
	intensity $b7
	note $63
	note $51
	note $61
	octave4
	note $13
	octave3
	note $b1
	octave4
	note $11
	intensity $a0
	octave3
	note $67
	intensity $a7
	note $67
	intensity $b7
	note $a5
	note $55
	note $b3
	octave4
	note $25
	note $63
	note $51
	note $31
	note $61
	note $51
	note $61
	note $51
	note $31
	note $21
	octave3
	note $b1
	note $a1
	note $b1
	intensity $a0
	note $a7
	intensity $a7
	note $a7
	intensity $b7
	note $57
	note $37
	note $57
	note $67
	note $57
	note $37
	note $87
	note $67
	note $37
	note $17
	note $37
	note $47
	note $37
	note $17
	note $37
	note $47
	note $37
	note $47
	note $57
	note $67
	intensity $b4
	note $81
	octave4
	note $11
	octave3
	note $b1
	note $91
	note $81
	note $61
	note $41
	note $61
	note $81
	octave4
	note $21
	note $11
	note $21
	note $41
	note $21
	note $11
	octave3
	note $b1
	intensity $b5
	note $41
	note $31
	intensity $b2
	note $43
	intensity $b7
	note $17
	note $43
	note $23
	note $13
	note $43
	intensity $b5
	note $51
	note $41
	intensity $b2
	note $53
	intensity $b7
	note $27
	note $63
	note $43
	note $23
	note $63
	intensity $b5
	note $71
	note $61
	intensity $b2
	note $73
	intensity $b7
	note $37
	note $73
	note $53
	note $33
	note $73
	note $87
	note $47
	note $b7
	note $87
	intensity $a0
	note $43
	intensity $a7
	note $4b
	note $0f
	intensity $b7
	note $67
	intensity $b4
	note $83
	note $43
	note $63
	note $81
	note $41
	note $63
	octave2
	note $b3
	intensity $b7
	octave3
	note $67
	intensity $b4
	note $83
	note $43
	note $63
	note $81
	note $41
	note $63
	note $63
	loopchannel $02, $61bd
	intensity $b7
	note $67
	intensity $b4
	note $83
	note $43
	note $63
	note $91
	note $81
	intensity $b7
	note $67
	note $67
	intensity $b5
	note $83
	note $43
	note $63
	note $81
	note $41
	intensity $b7
	note $67
	note $67
	intensity $b5
	note $83
	note $43
	note $63
	note $81
	note $41
	intensity $3f
	note $97
	intensity $b7
	note $97
	intensity $a0
	octave4
	note $17
	intensity $a7
	note $17
	intensity $b2
	octave3
	note $45
	note $45
	note $43
	note $45
	note $45
	intensity $b7
	note $63
	intensity $b2
	note $45
	note $45
	note $43
	note $45
	note $45
	intensity $4c
	note $63
	intensity $b7
	note $95
	note $85
	note $63
	note $43
	note $63
	note $83
	note $43
	note $63
	octave4
	note $21
	note $11
	octave3
	note $63
	octave4
	note $21
	note $11
	octave3
	note $61
	note $81
	note $91
	octave4
	note $11
	note $21
	note $11
	octave3
	note $b1
	note $91
	note $85
	note $45
	note $83
	octave4
	note $23
	note $13
	octave3
	note $b3
	note $93
	note $63
	note $21
	note $41
	note $63
	note $21
	note $41
	note $b3
	note $93
	note $83
	note $63
	intensity $90
	octave2
	note $b7
	octave3
	note $47
	octave2
	note $b7
	octave3
	note $87
	intensity $a0
	note $47
	note $b7
	note $87
	octave4
	note $47
	intensity $a0
	octave3
	note $b7
	intensity $a7
	note $b7
	intensity $b7
	note $85
	note $b5
	note $91
	note $81
	intensity $a0
	note $47
	intensity $a7
	note $47
	intensity $b4
	note $b5
	note $83
	note $81
	note $bb
	note $0f
	note $07
	intensity $a0
	octave4
	note $33
	intensity $a7
	note $3b
	intensity $a0
	note $67
	intensity $a7
	note $67
	intensity $b3
	callchannel _Music_JohtoTrainerBattle_sub_0xf629f
	note $63
	note $51
	note $61
	octave4
	note $13
	octave3
	note $b1
	octave4
	note $11
	intensity $a0
	octave3
	note $69
	intensity $a7
	note $65
	loopchannel $00, $6102 ; end
; 0xf629f

_Music_JohtoTrainerBattle_sub_0xf629f: ; 0xf629f
; subroutine
	octave3
	note $51
	note $31
	note $51
	note $a1
	note $c1
	note $a1
	note $81
	note $a1
	octave4
	note $11
	octave3
	note $a1
	note $c1
	note $81
	note $a1
	note $51
	note $61
	note $31
	endchannel ; end
; 0xf62b3

_Music_JohtoTrainerBattle_Ch2: ; 0xf62b3
	dutycycle $03
	vibrato $08, $36
	tone $0100
	notetype $0c, $c2
	octave4
	note $90
	note $80
	note $70
	note $60
	note $90
	note $30
	note $40
	note $50
	note $90
	note $40
	note $30
	note $40
	note $90
	note $30
	note $20
	note $30
	note $90
	note $20
	note $10
	note $20
	note $90
	octave3
	note $b0
	note $c0
	octave4
	note $10
	note $90
	octave3
	note $c0
	note $b0
	note $c0
	octave4
	note $90
	octave3
	note $b0
	note $a0
	note $b0
	intensity $c2
	octave4
	note $a5
	callchannel _Music_JohtoTrainerBattle_sub_0xf649a
	intensity $c2
	note $a5
	callchannel _Music_JohtoTrainerBattle_sub_0xf649a
	intensity $c2
	octave5
	note $15
	note $15
	note $13
	note $15
	note $15
	intensity $c7
	note $23
	intensity $c2
	note $11
	intensity $a4
	octave3
	note $51
	note $a1
	intensity $c2
	octave5
	note $11
	intensity $a4
	octave3
	note $51
	note $a1
	intensity $c2
	octave5
	note $11
	intensity $a4
	octave3
	note $51
	intensity $c2
	octave5
	note $11
	intensity $a4
	octave3
	note $51
	note $c1
	intensity $c2
	octave5
	note $11
	intensity $a4
	octave4
	note $11
	note $51
	intensity $c7
	note $c3
	callchannel _Music_JohtoTrainerBattle_sub_0xf64a3
	intensity $3e
	note $b7
	intensity $c7
	note $b7
	callchannel _Music_JohtoTrainerBattle_sub_0xf64a3
	intensity $c4
	note $33
	octave3
	note $b1
	octave4
	note $31
	note $61
	note $51
	note $31
	note $61
	note $51
	note $31
	note $51
	note $61
	note $b1
	note $a1
	note $b1
	octave5
	note $31
	intensity $b0
	note $27
	intensity $b7
	note $23
	intensity $c7
	octave4
	note $b3
	intensity $b0
	note $af
	intensity $b7
	note $af
	intensity $c3
	octave3
	note $a1
	note $81
	note $a1
	intensity $c7
	note $b3
	intensity $c3
	note $a1
	note $81
	note $b1
	loopchannel $03, $635a
	note $a1
	octave4
	note $31
	note $11
	octave3
	note $b1
	note $a1
	note $81
	note $a1
	note $b1
	note $81
	note $61
	note $81
	intensity $c7
	note $93
	intensity $c3
	note $81
	note $61
	note $91
	loopchannel $03, $6376
	note $61
	octave4
	note $11
	octave3
	note $b1
	note $91
	note $81
	note $61
	note $81
	note $91
	intensity $c7
	note $85
	octave4
	note $35
	note $11
	note $31
	note $63
	note $53
	note $33
	note $13
	intensity $b0
	note $49
	intensity $b7
	note $45
	intensity $90
	note $87
	intensity $97
	note $87
	intensity $c7
	octave3
	note $67
	note $43
	note $63
	note $83
	note $63
	note $43
	note $83
	note $97
	note $63
	note $83
	note $93
	note $83
	note $63
	note $93
	note $a7
	note $73
	note $93
	note $a3
	note $93
	note $73
	note $a3
	intensity $b0
	note $b7
	note $b7
	intensity $b0
	octave4
	note $47
	intensity $b7
	note $47
	intensity $62
	callchannel _Music_JohtoTrainerBattle_sub_0xf64b6
	intensity $82
	callchannel _Music_JohtoTrainerBattle_sub_0xf64b6
	intensity $92
	callchannel _Music_JohtoTrainerBattle_sub_0xf64b6
	intensity $a2
	callchannel _Music_JohtoTrainerBattle_sub_0xf64b6
	octave4
	note $41
	octave3
	note $b1
	octave4
	note $81
	octave3
	note $b1
	octave4
	note $41
	octave3
	note $b1
	octave4
	note $81
	octave3
	note $b1
	loopchannel $08, $63dd
	callchannel _Music_JohtoTrainerBattle_sub_0xf64be
	octave3
	note $b1
	intensity $c7
	octave4
	note $17
	callchannel _Music_JohtoTrainerBattle_sub_0xf64be
	note $81
	intensity $c7
	note $67
	callchannel _Music_JohtoTrainerBattle_sub_0xf64be
	octave3
	note $b1
	intensity $b0
	octave4
	note $17
	intensity $b7
	note $17
	intensity $1f
	note $4b
	intensity $c7
	note $43
	intensity $c2
	octave3
	note $83
	note $41
	note $85
	note $83
	note $81
	note $61
	note $41
	note $85
	intensity $c7
	note $93
	intensity $c2
	note $83
	note $41
	note $85
	note $83
	note $85
	note $85
	intensity $4c
	note $93
	callchannel _Music_JohtoTrainerBattle_sub_0xf64d2
	intensity $b0
	note $67
	intensity $b7
	note $67
	intensity $b0
	note $97
	intensity $b7
	note $97
	callchannel _Music_JohtoTrainerBattle_sub_0xf64d2
	intensity $b0
	note $27
	intensity $b7
	note $27
	intensity $c7
	note $23
	note $13
	octave3
	note $b3
	note $93
	note $85
	note $41
	note $b7
	note $b5
	note $81
	octave4
	note $47
	note $45
	octave3
	note $b1
	octave4
	note $87
	note $85
	note $41
	note $b7
	note $85
	note $b5
	note $91
	note $81
	intensity $b0
	note $47
	intensity $b7
	note $47
	intensity $c7
	note $45
	note $b5
	note $91
	note $81
	intensity $b0
	note $47
	intensity $b7
	note $47
	intensity $c7
	octave3
	note $a5
	octave4
	note $55
	note $31
	note $51
	note $83
	note $73
	note $53
	note $33
	intensity $b0
	note $67
	intensity $b7
	note $67
	intensity $b0
	note $b7
	intensity $b7
	note $b7
	callchannel _Music_JohtoTrainerBattle_sub_0xf64a3
	intensity $c7
	note $33
	octave3
	note $b1
	octave4
	note $31
	note $61
	note $51
	note $31
	note $61
	loopchannel $00, $632a ; end
; 0xf649a

_Music_JohtoTrainerBattle_sub_0xf649a: ; 0xf649a
; subroutine
	octave3
	note $a5
	note $a3
	note $a5
	note $a5
	intensity $c7
	note $b3
	endchannel ; end
; 0xf64a3

_Music_JohtoTrainerBattle_sub_0xf64a3: ; 0xf64a3
; subroutine
	intensity $c7
	octave3
	note $a5
	octave4
	note $55
	note $31
	note $51
	note $83
	note $73
	note $53
	note $33
	intensity $b0
	note $67
	intensity $b7
	note $67
	endchannel ; end
; 0xf64b6

_Music_JohtoTrainerBattle_sub_0xf64b6: ; 0xf64b6
; subroutine
	octave3
	note $b1
	note $41
	octave4
	note $41
	octave3
	note $41
	endchannel ; end
; 0xf64be

_Music_JohtoTrainerBattle_sub_0xf64be: ; 0xf64be
; subroutine
	intensity $c7
	octave4
	note $63
	intensity $c4
	octave3
	note $b1
	octave4
	note $61
	note $91
	note $81
	note $61
	note $41
	note $30
	note $40
	note $30
	note $40
	note $61
	endchannel ; end
; 0xf64d2

_Music_JohtoTrainerBattle_sub_0xf64d2: ; 0xf64d2
; subroutine
	intensity $c7
	octave4
	note $45
	note $b5
	note $91
	note $81
	note $93
	note $83
	note $63
	note $43
	endchannel ; end
; 0xf64de

_Music_JohtoTrainerBattle_Ch3: ; 0xf64de
	notetype $0c, $19
	octave4
	note $50
	note $40
	note $30
	note $20
	note $30
	note $20
	note $10
	octave3
	note $c0
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
	note $51
	note $b1
	note $a1
	note $91
	note $a1
	note $51
	note $71
	note $81
	note $51
	note $71
	note $81
	note $51
	loopchannel $03, $6501
	note $a1
	note $51
	note $71
	note $81
	note $51
	note $71
	note $81
	note $91
	callchannel _Music_JohtoTrainerBattle_sub_0xf6676
	octave4
	note $11
	octave3
	note $81
	note $a1
	note $b1
	octave4
	note $11
	note $21
	note $11
	octave3
	note $b1
	callchannel _Music_JohtoTrainerBattle_sub_0xf6676
	octave4
	note $11
	octave3
	note $81
	note $a1
	note $b1
	note $81
	note $a1
	note $b1
	note $81
	callchannel _Music_JohtoTrainerBattle_sub_0xf6681
	note $51
	callchannel _Music_JohtoTrainerBattle_sub_0xf6692
	callchannel _Music_JohtoTrainerBattle_sub_0xf6692
	callchannel _Music_JohtoTrainerBattle_sub_0xf6681
	note $a1
	callchannel _Music_JohtoTrainerBattle_sub_0xf6692
	callchannel _Music_JohtoTrainerBattle_sub_0xf6692
	callchannel _Music_JohtoTrainerBattle_sub_0xf669d
	note $51
	note $a1
	note $51
	note $a1
	note $51
	note $31
	note $51
	note $61
	callchannel _Music_JohtoTrainerBattle_sub_0xf669d
	note $51
	octave4
	note $61
	note $51
	note $31
	octave3
	note $a1
	note $91
	note $a1
	note $b1
	callchannel _Music_JohtoTrainerBattle_sub_0xf66a5
	note $31
	note $a1
	note $31
	note $a1
	note $31
	note $a1
	note $81
	note $a1
	callchannel _Music_JohtoTrainerBattle_sub_0xf66a5
	note $31
	octave4
	note $31
	note $11
	octave3
	note $b1
	note $a1
	note $81
	note $a1
	note $b1
	callchannel _Music_JohtoTrainerBattle_sub_0xf66ac
	note $11
	note $81
	note $11
	note $81
	note $11
	note $81
	note $61
	note $81
	callchannel _Music_JohtoTrainerBattle_sub_0xf66ac
	note $11
	octave4
	note $11
	octave3
	note $b1
	note $91
	note $81
	note $61
	note $41
	note $31
	note $87
	note $67
	note $57
	note $47
	octave3
	note $41
	note $b1
	note $41
	note $b1
	note $41
	note $b1
	note $a1
	octave4
	note $11
	loopchannel $02, $6591
	callchannel _Music_JohtoTrainerBattle_sub_0xf66ac
	note $11
	octave4
	note $11
	octave3
	note $b1
	note $91
	note $81
	note $61
	note $41
	note $81
	note $21
	note $91
	loopchannel $07, $65ac
	note $c1
	note $a1
	note $31
	note $a1
	loopchannel $05, $65b4
	note $c1
	note $a1
	note $91
	note $71
	note $91
	note $a1
	note $b3
	note $43
	loopchannel $04, $65c0
	octave4
	note $83
	octave3
	note $b3
	loopchannel $04, $65c6
	callchannel _Music_JohtoTrainerBattle_sub_0xf66b4
	note $41
	note $67
	callchannel _Music_JohtoTrainerBattle_sub_0xf66b4
	octave4
	note $11
	octave3
	note $b7
	loopchannel $02, $65ce
	octave4
	note $27
	note $17
	octave3
	note $b7
	note $97
	note $67
	note $87
	note $97
	note $b7
	note $67
	note $87
	note $93
	note $41
	note $91
	octave4
	note $17
	note $17
	note $47
	octave3
	note $b1
	note $91
	note $81
	note $61
	note $41
	note $b1
	note $41
	note $b1
	note $41
	note $b1
	octave4
	note $21
	octave3
	note $b1
	note $41
	note $b1
	octave4
	note $21
	note $11
	octave3
	note $b1
	note $91
	note $81
	note $91
	note $41
	note $b1
	note $41
	note $b1
	note $41
	note $b1
	octave4
	note $21
	octave3
	note $b1
	note $41
	note $b1
	octave4
	note $11
	note $21
	note $41
	note $21
	note $11
	octave3
	note $b1
	note $41
	note $b1
	loopchannel $08, $661e
	note $21
	note $91
	loopchannel $06, $6624
	note $21
	octave4
	note $11
	octave3
	note $b1
	note $91
	note $41
	note $b1
	loopchannel $08, $6630
	note $21
	note $91
	loopchannel $04, $6636
	note $21
	octave4
	note $21
	note $11
	octave3
	note $b1
	note $81
	note $91
	note $b1
	octave4
	note $11
	octave3
	note $47
	note $27
	note $17
	octave2
	note $b7
	octave3
	note $b7
	note $97
	note $87
	note $67
	octave4
	note $47
	note $47
	octave3
	note $b7
	note $b7
	note $87
	note $87
	note $47
	note $43
	note $b3
	note $af
	octave4
	note $1f
	octave3
	note $bf
	octave4
	note $3f
	octave3
	note $af
	octave4
	note $1f
	octave3
	note $bf
	octave4
	note $37
	note $01
	octave3
	note $a1
	note $b1
	octave4
	note $31
	loopchannel $00, $6531 ; end
; 0xf6676

_Music_JohtoTrainerBattle_sub_0xf6676: ; 0xf6676
; subroutine
	octave4
	note $11
	octave3
	note $81
	note $a1
	note $b1
	note $81
	note $a1
	note $b1
	note $81
	endchannel ; end
; 0xf6681

_Music_JohtoTrainerBattle_sub_0xf6681: ; 0xf6681
; subroutine
	octave3
	note $51
	note $a1
	note $51
	note $a1
	note $51
	note $71
	note $81
	note $a1
	note $51
	note $a1
	note $51
	note $a1
	note $51
	note $71
	note $81
	endchannel ; end
; 0xf6692

_Music_JohtoTrainerBattle_sub_0xf6692: ; 0xf6692
; subroutine
	octave3
	note $61
	note $b1
	note $61
	note $b1
	note $61
	note $a1
	note $b1
	octave4
	note $31
	endchannel ; end
; 0xf669d

_Music_JohtoTrainerBattle_sub_0xf669d: ; 0xf669d
; subroutine
	octave3
	note $51
	note $a1
	loopchannel $04, $669d
	endchannel ; end
; 0xf66a5

_Music_JohtoTrainerBattle_sub_0xf66a5: ; 0xf66a5
; subroutine
	note $31
	note $a1
	loopchannel $04, $66a5
	endchannel ; end
; 0xf66ac

_Music_JohtoTrainerBattle_sub_0xf66ac: ; 0xf66ac
; subroutine
	octave3
	note $11
	note $81
	loopchannel $04, $66ac
	endchannel ; end
; 0xf66b4

_Music_JohtoTrainerBattle_sub_0xf66b4: ; 0xf66b4
; subroutine
	note $b3
	note $41
	note $b1
	octave4
	note $21
	note $11
	octave3
	note $b1
	note $91
	note $80
	note $90
	note $80
	note $90
	note $b1
	endchannel ; end
; 0xf66c3
