_Music_RivalBattle: ; 0xe974f
	db $80
	dw _Music_RivalBattle_Ch1
	db $01
	dw _Music_RivalBattle_Ch2
	db $02
	dw _Music_RivalBattle_Ch3
; 0xe9758

_Music_RivalBattle_Ch1: ; 0xe9758
	tempo $6600
	volume $77
	dutycycle $03
	tone $0200
	vibrato $08, $15
	notetype $0c, $b2
	octave3
	note $71
	note $b3
	intensity $b7
	note $b9
	intensity $b2
	note $71
	octave4
	note $23
	intensity $b7
	note $25
	note $53
	intensity $b2
	octave2
	note $b5
	intensity $b7
	octave3
	note $25
	intensity $b2
	note $43
	loopchannel $03, $5777
	intensity $b2
	octave2
	note $b1
	octave3
	note $23
	intensity $b7
	note $29
	intensity $b2
	octave3
	note $95
	intensity $b7
	note $c5
	intensity $b2
	octave4
	note $23
	loopchannel $03, $578f
	intensity $b2
	octave3
	note $91
	note $c3
	intensity $4d
	note $c9
	intensity $b7
	note $b5
	note $75
	note $43
	note $63
	note $73
	note $91
	note $b5
	intensity $b2
	note $60
	note $40
	note $20
	note $40
	intensity $b7
	note $63
	intensity $b2
	note $90
	note $70
	note $60
	note $70
	intensity $b7
	note $93
	intensity $b6
	note $91
	note $b1
	note $c1
	note $b1
	note $c1
	octave4
	note $21
	octave3
	note $c1
	octave4
	note $51
	intensity $b7
	octave3
	note $b5
	note $75
	note $b3
	octave4
	note $23
	octave3
	note $c3
	note $b1
	note $95
	note $65
	octave4
	note $25
	octave3
	note $93
	intensity $b5
	note $21
	note $61
	note $91
	octave4
	note $11
	note $21
	octave3
	note $91
	note $61
	note $91
	intensity $b7
	note $79
	intensity $b4
	octave2
	note $c1
	octave3
	note $41
	note $71
	intensity $b7
	note $63
	note $43
	note $21
	note $45
	intensity $a0
	note $67
	intensity $a7
	note $67
	intensity $a0
	octave2
	note $b7
	intensity $a7
	note $b7
	intensity $b7
	octave3
	note $79
	intensity $b5
	octave2
	note $c1
	octave3
	note $41
	note $71
	note $61
	note $41
	note $21
	note $41
	note $91
	note $71
	note $61
	note $91
	intensity $a0
	note $bf
	intensity $a7
	note $bf
	intensity $a0
	note $c7
	intensity $a7
	note $c3
	intensity $b7
	note $93
	intensity $b5
	octave4
	note $51
	note $41
	note $21
	octave3
	note $c1
	octave4
	note $71
	note $51
	note $41
	note $21
	octave3
	note $b1
	note $51
	note $b1
	octave4
	note $41
	note $51
	note $41
	octave3
	note $b1
	octave4
	note $41
	octave3
	note $b1
	octave4
	note $41
	note $51
	note $41
	octave3
	note $b1
	note $41
	note $b1
	octave4
	note $41
	loopchannel $02, $5837
	intensity $94
	octave3
	note $47
	octave2
	note $b7
	octave3
	note $87
	note $67
	intensity $96
	octave2
	note $97
	note $b7
	note $c7
	octave3
	note $27
	intensity $b7
	octave4
	note $47
	octave3
	note $b7
	octave4
	note $87
	note $67
	octave3
	note $97
	note $b7
	note $c7
	octave4
	note $27
	intensity $a0
	note $47
	intensity $a7
	note $47
	intensity $a0
	octave3
	note $87
	intensity $a7
	note $87
	intensity $b7
	note $47
	note $27
	note $43
	note $23
	octave2
	note $c3
	octave3
	note $23
	intensity $c7
	octave2
	note $b5
	octave3
	note $25
	note $43
	note $55
	note $45
	note $23
	note $95
	note $55
	note $43
	note $25
	note $45
	note $33
	octave2
	note $95
	note $c5
	octave3
	note $23
	note $35
	note $25
	octave2
	note $c3
	octave3
	note $75
	note $35
	note $23
	octave2
	note $c5
	octave3
	note $29
	loopchannel $00, $57a6 ; end
; 0xe98af

_Music_RivalBattle_Ch2: ; 0xe98af
	dutycycle $03
	vibrato $08, $36
	tone $0100
	notetype $0c, $c2
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
	note $50
	note $40
	note $30
	note $20
	note $30
	note $20
	note $10
	octave2
	note $c0
	intensity $c2
	octave4
	note $45
	intensity $c7
	octave3
	note $75
	intensity $c2
	note $93
	intensity $c2
	note $45
	intensity $c7
	note $75
	intensity $c2
	note $93
	loopchannel $02, $58ea
	intensity $c2
	note $41
	note $73
	intensity $c7
	note $77
	intensity $a2
	note $c0
	octave4
	note $10
	intensity $c2
	note $25
	intensity $c7
	note $55
	intensity $c2
	note $73
	loopchannel $03, $5903
	intensity $c2
	note $21
	note $53
	intensity $b0
	note $53
	intensity $b7
	note $55
	callchannel _Music_RivalBattle_sub_0xe99e0
	intensity $b0
	note $97
	intensity $b7
	note $97
	callchannel _Music_RivalBattle_sub_0xe99e0
	intensity $4e
	note $97
	intensity $b7
	note $97
	intensity $b0
	octave3
	note $c9
	intensity $b7
	note $c5
	intensity $b0
	octave4
	note $27
	octave3
	note $c7
	intensity $b0
	note $b9
	intensity $b7
	note $b5
	intensity $2f
	note $49
	intensity $b7
	note $45
	intensity $b0
	note $c9
	intensity $b7
	note $c5
	intensity $c7
	octave4
	note $27
	octave3
	note $c7
	intensity $b0
	octave4
	note $4f
	intensity $b7
	note $4f
	intensity $b0
	note $53
	intensity $b7
	note $55
	intensity $c7
	note $51
	note $91
	note $c1
	octave5
	note $27
	octave4
	note $c7
	intensity $b0
	note $b9
	intensity $b7
	note $b5
	intensity $b0
	note $a9
	intensity $b7
	note $a5
	intensity $b0
	note $99
	intensity $b7
	note $95
	intensity $b0
	note $89
	intensity $b7
	note $85
	intensity $a4
	octave3
	note $87
	note $47
	note $b7
	note $97
	intensity $a6
	octave2
	note $c7
	octave3
	note $27
	note $47
	note $67
	intensity $c7
	octave4
	note $87
	note $47
	note $b7
	note $97
	octave3
	note $c7
	octave4
	note $27
	note $47
	note $67
	intensity $b0
	note $8f
	note $4f
	octave3
	note $c7
	note $b7
	note $97
	intensity $c7
	note $67
	intensity $c2
	octave3
	note $b5
	intensity $c7
	octave4
	note $25
	intensity $c2
	note $43
	loopchannel $03, $59a6
	intensity $c2
	octave3
	note $b1
	octave4
	note $23
	intensity $b7
	note $25
	intensity $9a
	note $23
	intensity $c2
	octave3
	note $95
	intensity $c7
	note $c5
	intensity $c2
	octave4
	note $23
	loopchannel $03, $59c1
	intensity $c2
	octave3
	note $91
	note $c3
	intensity $c7
	note $c5
	intensity $6a
	octave4
	note $33
	loopchannel $00, $591a ; end
; 0xe99e0

_Music_RivalBattle_sub_0xe99e0: ; 0xe99e0
; subroutine
	intensity $c7
	note $49
	intensity $c4
	octave3
	note $b1
	octave4
	note $41
	note $71
	intensity $c5
	note $63
	note $43
	intensity $c2
	note $21
	intensity $c7
	note $45
	intensity $b0
	note $67
	intensity $b7
	note $67
	endchannel ; end
; 0xe99fb

_Music_RivalBattle_Ch3: ; 0xe99fb
	notetype $0c, $19
	octave3
	note $71
	note $b1
	note $01
	note $b9
	octave3
	note $71
	octave4
	note $21
	note $01
	note $25
	octave3
	note $21
	note $31
	note $41
	note $21
	note $41
	note $73
	note $51
	note $41
	note $21
	loopchannel $04, $5a0c
	octave3
	note $21
	octave2
	note $c1
	octave3
	note $21
	note $53
	note $31
	note $21
	octave2
	note $c1
	loopchannel $03, $5a17
	octave3
	note $21
	note $51
	note $21
	octave2
	note $c3
	octave3
	note $11
	note $21
	note $31
	callchannel _Music_RivalBattle_sub_0xe9b47
	octave2
	note $b1
	octave4
	note $21
	octave2
	note $b1
	octave3
	note $c1
	octave2
	note $b1
	octave3
	note $b1
	octave2
	note $b1
	octave3
	note $91
	callchannel _Music_RivalBattle_sub_0xe9b50
	note $21
	note $91
	octave4
	note $21
	octave3
	note $93
	note $21
	note $11
	octave2
	note $c1
	callchannel _Music_RivalBattle_sub_0xe9b47
	octave2
	note $b1
	octave3
	note $b1
	octave2
	note $b1
	octave3
	note $91
	octave2
	note $b1
	octave3
	note $71
	octave2
	note $b1
	octave3
	note $61
	callchannel _Music_RivalBattle_sub_0xe9b50
	note $21
	note $91
	loopchannel $04, $5a66
	callchannel _Music_RivalBattle_sub_0xe9b5c
	note $91
	note $71
	octave2
	note $b1
	octave3
	note $61
	loopchannel $04, $5a71
	octave2
	note $b1
	octave3
	note $71
	octave2
	note $b1
	octave3
	note $71
	octave2
	note $b1
	octave3
	note $71
	note $61
	note $41
	callchannel _Music_RivalBattle_sub_0xe9b5c
	octave2
	note $c1
	octave3
	note $31
	callchannel _Music_RivalBattle_sub_0xe9b65
	octave3
	note $41
	octave4
	note $41
	callchannel _Music_RivalBattle_sub_0xe9b65
	octave3
	note $41
	note $b1
	note $51
	note $c1
	octave4
	note $51
	octave3
	note $51
	note $c1
	octave4
	note $51
	octave3
	note $51
	octave4
	note $51
	octave3
	note $51
	note $c1
	octave4
	note $51
	octave3
	note $51
	note $51
	note $71
	note $81
	note $91
	note $41
	note $b1
	loopchannel $04, $5ab3
	note $41
	note $a1
	loopchannel $04, $5ab9
	note $41
	note $91
	loopchannel $04, $5abf
	note $41
	note $81
	loopchannel $0c, $5ac5
	octave2
	note $c1
	octave3
	note $41
	loopchannel $04, $5acb
	octave2
	note $c1
	octave3
	note $71
	loopchannel $04, $5ad3
	note $41
	note $81
	note $b1
	note $41
	note $81
	note $b1
	note $41
	note $b1
	note $41
	note $81
	note $b1
	note $41
	note $81
	note $b1
	note $41
	note $b1
	octave2
	note $c1
	octave3
	note $81
	note $c1
	octave2
	note $c1
	octave3
	note $81
	note $c1
	octave2
	note $c1
	octave3
	note $c1
	octave2
	note $c1
	octave3
	note $91
	note $c1
	octave2
	note $c1
	octave4
	note $41
	note $21
	octave3
	note $c1
	note $91
	note $87
	note $47
	note $b7
	note $87
	octave2
	note $c7
	octave3
	note $27
	note $47
	note $67
	octave2
	note $b1
	octave3
	note $41
	loopchannel $07, $5b10
	note $51
	note $41
	octave2
	note $b1
	octave3
	note $41
	loopchannel $06, $5b1a
	octave2
	note $b1
	octave3
	note $71
	note $61
	note $51
	octave2
	note $91
	octave3
	note $21
	loopchannel $07, $5b28
	note $31
	note $21
	octave2
	note $91
	octave3
	note $21
	loopchannel $04, $5b32
	octave2
	note $c1
	note $91
	note $c1
	octave3
	note $63
	note $51
	note $41
	note $31
	loopchannel $00, $5a30 ; end
; 0xe9b47

_Music_RivalBattle_sub_0xe9b47: ; 0xe9b47
; subroutine
	octave2
	note $b1
	octave3
	note $41
	loopchannel $04, $5b47
	endchannel ; end
; 0xe9b50

_Music_RivalBattle_sub_0xe9b50: ; 0xe9b50
; subroutine
	note $21
	note $91
	octave4
	note $21
	octave3
	note $93
	octave4
	note $21
	octave3
	note $21
	note $91
	endchannel ; end
; 0xe9b5c

_Music_RivalBattle_sub_0xe9b5c: ; 0xe9b5c
; subroutine
	octave2
	note $c1
	octave3
	note $71
	loopchannel $07, $5b5c
	endchannel ; end
; 0xe9b65

_Music_RivalBattle_sub_0xe9b65: ; 0xe9b65
; subroutine
	octave3
	note $41
	note $b1
	octave4
	note $41
	loopchannel $02, $5b65
	endchannel ; end
; 0xe9b6f
