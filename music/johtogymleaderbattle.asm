_Music_JohtoGymLeaderBattle: ; 0xea50d
	db $80
	dw _Music_JohtoGymLeaderBattle_Ch1
	db $01
	dw _Music_JohtoGymLeaderBattle_Ch2
	db $02
	dw _Music_JohtoGymLeaderBattle_Ch3
; 0xea516

_Music_JohtoGymLeaderBattle_Ch1: ; 0xea516
	tempo $6500
	volume $77
	dutycycle $03
	tone $0200
	vibrato $12, $15
	notetype $0c, $b2
	octave3
	note $b0
	note $a0
	note $90
	note $a0
	loopchannel $04, $6526
	note $20
	note $10
	octave2
	note $b0
	octave3
	note $10
	loopchannel $03, $652f
	intensity $4b
	note $23
	intensity $b2
	note $35
	note $45
	note $13
	note $65
	note $35
	note $43
	note $35
	note $45
	note $13
	note $65
	note $85
	intensity $b7
	note $13
	intensity $b2
	note $85
	note $95
	note $63
	note $95
	note $65
	note $93
	note $85
	note $95
	note $63
	note $95
	octave4
	note $15
	octave3
	note $91
	note $61
	intensity $b5
	note $35
	note $85
	note $61
	note $81
	note $93
	note $83
	note $63
	note $83
	intensity $b7
	note $9b
	intensity $b2
	note $83
	intensity $b7
	octave4
	note $2b
	intensity $b2
	note $13
	intensity $b5
	octave3
	note $35
	note $85
	note $61
	note $81
	note $93
	note $83
	note $63
	note $83
	intensity $b7
	note $97
	note $87
	note $67
	note $47
	intensity $70
	note $17
	intensity $77
	note $17
	intensity $b4
	note $41
	note $51
	note $65
	note $81
	note $43
	intensity $77
	octave2
	note $b7
	note $b7
	intensity $c5
	octave3
	note $81
	note $91
	note $b5
	note $b1
	note $93
	intensity $c7
	note $87
	note $63
	note $51
	note $21
	intensity $a0
	note $17
	intensity $a7
	note $17
	intensity $b2
	note $65
	note $63
	note $51
	note $63
	note $65
	note $65
	note $61
	note $91
	note $55
	note $53
	note $61
	note $51
	note $21
	note $15
	note $15
	note $13
	note $65
	note $61
	note $91
	note $51
	note $61
	note $91
	note $61
	note $13
	note $65
	note $51
	note $91
	note $51
	note $83
	note $53
	note $61
	note $51
	note $61
	note $85
	note $83
	octave4
	note $11
	octave3
	note $81
	note $11
	note $15
	note $15
	note $13
	note $25
	note $25
	note $23
	note $35
	note $35
	note $33
	note $45
	note $45
	note $43
	intensity $80
	note $8f
	intensity $90
	note $9f
	intensity $a0
	note $a7
	note $b1
	note $a1
	note $91
	note $a1
	intensity $b0
	note $b7
	note $c1
	note $b1
	note $a1
	octave4
	note $21
	intensity $b7
	note $17
	note $23
	note $13
	octave3
	note $91
	octave4
	note $11
	octave3
	note $91
	octave4
	note $41
	octave3
	note $91
	octave4
	note $21
	octave3
	note $91
	octave4
	note $11
	note $93
	note $43
	note $93
	note $43
	note $43
	octave3
	note $93
	octave4
	note $43
	octave3
	note $93
	note $97
	note $a3
	note $93
	note $41
	note $91
	note $41
	octave4
	note $21
	octave3
	note $41
	note $a1
	note $41
	note $81
	octave4
	note $23
	octave3
	note $93
	octave4
	note $23
	octave3
	note $93
	note $93
	note $23
	note $93
	note $23
	note $c7
	note $a7
	note $97
	note $77
	intensity $b4
	note $a3
	octave4
	note $23
	octave3
	note $c3
	octave4
	note $53
	intensity $92
	note $41
	note $41
	note $41
	note $41
	intensity $b2
	note $41
	note $41
	note $41
	note $41
	intensity $c2
	note $4f
	intensity $50
	octave3
	note $1f
	note $6f
	note $5f
	intensity $97
	note $49
	intensity $b4
	octave2
	note $b1
	octave3
	note $41
	note $71
	loopchannel $00, $655d ; end
; 0xea65f

_Music_JohtoGymLeaderBattle_Ch2: ; 0xea65f
	dutycycle $03
	vibrato $08, $36
	tone $0100
	notetype $0c, $c2
	octave4
	note $70
	note $60
	note $50
	note $b0
	loopchannel $04, $666a
	note $70
	note $60
	note $70
	note $b0
	loopchannel $04, $6673
	note $a5
	octave3
	note $b5
	note $83
	octave4
	note $35
	octave3
	note $a5
	note $b3
	note $a5
	note $b5
	note $83
	octave4
	note $35
	note $45
	intensity $b0
	octave3
	note $43
	intensity $c2
	octave4
	note $31
	intensity $92
	octave3
	note $31
	note $31
	intensity $c2
	octave4
	note $43
	intensity $92
	octave3
	note $31
	intensity $c2
	octave4
	note $13
	note $81
	notetype $0c, $92
	octave3
	note $31
	note $31
	intensity $c2
	octave4
	note $33
	intensity $92
	octave3
	note $31
	intensity $c2
	octave4
	note $41
	intensity $92
	octave3
	note $41
	intensity $c2
	octave4
	note $31
	intensity $92
	octave3
	note $31
	note $31
	intensity $c2
	octave4
	note $43
	intensity $92
	octave3
	note $31
	intensity $c2
	octave4
	note $11
	intensity $92
	octave3
	note $41
	intensity $c2
	octave4
	note $81
	intensity $92
	octave3
	note $61
	note $61
	intensity $c2
	octave4
	note $91
	intensity $92
	octave3
	note $61
	note $61
	intensity $c2
	octave4
	note $71
	intensity $b2
	octave3
	note $90
	note $a0
	intensity $c7
	note $b7
	intensity $c4
	octave4
	note $31
	note $11
	octave3
	note $b1
	octave4
	note $11
	intensity $c7
	note $27
	intensity $c4
	note $61
	note $41
	note $21
	note $41
	intensity $b0
	note $65
	intensity $b7
	note $65
	intensity $c2
	note $43
	intensity $b0
	note $95
	intensity $b7
	note $95
	intensity $c2
	note $63
	intensity $c7
	octave3
	note $b7
	intensity $c4
	octave4
	note $31
	note $11
	octave3
	note $b1
	octave4
	note $11
	intensity $c7
	note $27
	intensity $c4
	note $61
	note $41
	note $21
	note $41
	intensity $b0
	note $2f
	intensity $b7
	note $2f
	intensity $a4
	octave3
	note $65
	note $45
	note $63
	intensity $c6
	octave4
	note $15
	octave3
	note $b5
	octave4
	note $13
	intensity $a4
	octave3
	note $25
	note $15
	note $23
	intensity $c6
	octave4
	note $25
	note $15
	note $23
	intensity $3c
	note $19
	intensity $b7
	note $15
	intensity $b0
	note $57
	intensity $b7
	note $57
	intensity $b0
	octave3
	note $2f
	octave2
	note $b7
	octave3
	note $25
	note $41
	note $1f
	note $5f
	intensity $a0
	octave5
	note $23
	intensity $a7
	octave5
	note $2b
	intensity $b7
	octave4
	note $b7
	octave5
	note $25
	note $41
	intensity $a0
	note $17
	intensity $a7
	note $17
	intensity $3e
	note $55
	intensity $a6
	note $59
	intensity $c2
	octave3
	note $65
	note $65
	note $63
	note $75
	note $75
	note $73
	note $85
	note $85
	note $83
	note $95
	note $95
	note $93
	intensity $90
	octave4
	note $1f
	intensity $a0
	note $2f
	intensity $b0
	note $3f
	intensity $b7
	note $47
	intensity $4c
	note $45
	intensity $c2
	note $70
	note $80
	intensity $c7
	note $97
	note $a1
	note $91
	note $71
	note $a1
	note $93
	octave5
	note $13
	octave4
	note $a3
	note $93
	octave5
	note $43
	octave4
	note $93
	octave5
	note $43
	octave4
	note $93
	octave5
	note $41
	note $21
	note $11
	note $21
	note $11
	octave4
	note $a1
	note $91
	note $a1
	note $47
	note $51
	note $41
	note $21
	note $51
	note $43
	note $93
	note $53
	note $23
	note $93
	note $23
	note $93
	note $23
	note $a1
	note $91
	note $71
	note $51
	note $41
	note $51
	note $41
	note $21
	note $47
	note $27
	octave3
	note $c7
	note $a7
	octave4
	note $43
	note $93
	note $53
	note $a3
	intensity $c0
	note $97
	intensity $c7
	note $97
	intensity $c2
	note $9f
	intensity $80
	octave3
	note $6f
	octave4
	note $1f
	octave3
	note $cf
	note $8f
	loopchannel $00, $66ee ; end
; 0xea7f4

_Music_JohtoGymLeaderBattle_Ch3: ; 0xea7f4
	notetype $0c, $19
	octave4
	note $60
	note $00
	octave3
	note $a1
	octave4
	note $60
	note $00
	octave3
	note $91
	octave4
	note $60
	note $00
	octave3
	note $81
	octave4
	note $60
	note $00
	octave3
	note $71
	octave4
	note $90
	note $00
	octave3
	note $61
	octave4
	note $90
	note $00
	octave3
	note $51
	note $61
	note $81
	note $93
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea952
	note $81
	note $31
	note $61
	note $81
	note $91
	note $91
	note $81
	note $61
	note $81
	note $31
	note $61
	note $81
	note $91
	note $41
	note $73
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea952
	note $81
	note $31
	note $61
	note $81
	note $91
	note $91
	note $81
	note $61
	note $81
	note $31
	note $61
	note $81
	note $91
	octave4
	note $11
	octave3
	note $b1
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea963
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea963
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	note $21
	note $91
	note $21
	note $91
	note $21
	note $b1
	note $a1
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea963
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $91
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	note $11
	note $81
	note $b1
	note $11
	note $41
	note $61
	note $81
	note $b1
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea971
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea978
	octave3
	note $81
	note $91
	note $61
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea971
	note $11
	note $81
	note $11
	note $81
	note $11
	note $51
	note $61
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea978
	octave3
	note $11
	note $21
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea971
	note $11
	note $81
	note $11
	note $81
	note $61
	note $51
	note $61
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea96a
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea978
	octave3
	note $61
	octave2
	note $b1
	octave3
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea971
	note $11
	note $81
	note $11
	octave4
	note $11
	octave3
	note $b1
	note $81
	note $61
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea983
	note $01
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea990
	octave4
	note $21
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea99c
	note $01
	note $41
	note $b1
	octave4
	note $41
	octave3
	note $41
	note $b1
	octave4
	note $41
	octave3
	note $41
	octave4
	note $41
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea983
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea990
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea99c
	note $a1
	octave4
	note $41
	octave3
	note $b1
	note $41
	octave4
	note $41
	octave3
	note $41
	octave4
	note $41
	note $33
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9a9
	note $41
	note $91
	note $41
	octave4
	note $21
	octave3
	note $41
	note $a1
	note $41
	note $91
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9a9
	note $41
	note $91
	note $41
	note $91
	note $41
	note $a1
	note $91
	note $71
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9b1
	note $21
	note $71
	note $21
	octave4
	note $21
	octave3
	note $21
	note $a1
	note $21
	note $81
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9b1
	note $21
	note $71
	note $21
	note $71
	note $21
	note $41
	note $51
	note $a1
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9a9
	note $41
	note $91
	note $41
	note $91
	note $41
	note $91
	note $a1
	octave4
	note $21
	octave3
	note $41
	note $91
	note $41
	note $a1
	note $41
	note $c1
	note $41
	octave4
	note $21
	octave3
	note $91
	note $41
	note $71
	note $91
	note $a1
	note $a1
	note $91
	note $71
	note $91
	note $41
	note $71
	note $91
	note $71
	note $71
	note $51
	note $71
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9b8
	note $61
	note $11
	note $41
	note $61
	note $41
	note $41
	note $21
	note $41
	callchannel _Music_JohtoGymLeaderBattle_sub_0xea9b8
	note $61
	note $11
	note $41
	note $61
	note $41
	note $71
	note $61
	note $41
	loopchannel $00, $683f ; end
; 0xea952

_Music_JohtoGymLeaderBattle_sub_0xea952: ; 0xea952
; subroutine
	note $81
	note $31
	note $61
	note $81
	note $91
	note $91
	note $81
	note $61
	note $81
	note $31
	note $61
	note $81
	note $61
	note $61
	note $41
	note $61
	endchannel ; end
; 0xea963

_Music_JohtoGymLeaderBattle_sub_0xea963: ; 0xea963
; subroutine
	note $31
	note $81
	loopchannel $04, $6963
	endchannel ; end
; 0xea96a

_Music_JohtoGymLeaderBattle_sub_0xea96a: ; 0xea96a
; subroutine
	note $21
	note $91
	loopchannel $04, $696a
	endchannel ; end
; 0xea971

_Music_JohtoGymLeaderBattle_sub_0xea971: ; 0xea971
; subroutine
	note $11
	note $81
	loopchannel $04, $6971
	endchannel ; end
; 0xea978

_Music_JohtoGymLeaderBattle_sub_0xea978: ; 0xea978
; subroutine
	octave2
	note $b1
	octave3
	note $61
	octave2
	note $b1
	octave3
	note $61
	octave2
	note $b1
	endchannel ; end
; 0xea983

_Music_JohtoGymLeaderBattle_sub_0xea983: ; 0xea983
; subroutine
	octave3
	note $11
	note $81
	octave4
	note $11
	octave3
	note $11
	note $81
	octave4
	note $11
	octave3
	note $11
	endchannel ; end
; 0xea990

_Music_JohtoGymLeaderBattle_sub_0xea990: ; 0xea990
; subroutine
	note $21
	note $91
	octave4
	note $21
	octave3
	note $21
	note $91
	octave4
	note $21
	octave3
	note $21
	endchannel ; end
; 0xea99c

_Music_JohtoGymLeaderBattle_sub_0xea99c: ; 0xea99c
; subroutine
	octave3
	note $31
	note $a1
	octave4
	note $31
	octave3
	note $31
	note $a1
	octave4
	note $31
	octave3
	note $31
	endchannel ; end
; 0xea9a9

_Music_JohtoGymLeaderBattle_sub_0xea9a9: ; 0xea9a9
; subroutine
	octave3
	note $41
	note $91
	loopchannel $04, $69a9
	endchannel ; end
; 0xea9b1

_Music_JohtoGymLeaderBattle_sub_0xea9b1: ; 0xea9b1
; subroutine
	note $21
	note $71
	loopchannel $04, $69b1
	endchannel ; end
; 0xea9b8

_Music_JohtoGymLeaderBattle_sub_0xea9b8: ; 0xea9b8
; subroutine
	note $61
	note $11
	note $41
	note $61
	note $71
	note $71
	note $61
	note $41
	endchannel ; end
; 0xea9c1
