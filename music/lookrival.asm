_Music_LookRival: ; 0xf4f79
	db $c0
	dw _Music_LookRival_Ch1
	db $01
	dw _Music_LookRival_Ch2
	db $02
	dw _Music_LookRival_Ch3
	db $03
	dw _Music_LookRival_Ch4
; 0xf4f85

_Music_LookRival_Ch1: ; 0xf4f85
	tempo $7000
	volume $77
	dutycycle $01
	tone $0100
	vibrato $12, $15
	stereopanning $0f
	notetype $0c, $b2
	octave4
	note $10
	octave3
	note $b0
	note $91
	note $b0
	note $90
	note $71
	note $65
	intensity $b7
	note $95
	intensity $b2
	note $b3
	note $61
	note $93
	intensity $a0
	note $99
	intensity $a5
	note $97
	intensity $a6
	note $77
	intensity $b5
	note $63
	note $41
	note $65
	note $61
	note $81
	note $93
	note $b3
	note $91
	note $83
	intensity $a0
	note $61
	intensity $a7
	note $6f
	intensity $66
	note $01
	note $61
	note $83
	intensity $b6
	note $93
	octave4
	note $13
	octave3
	note $b3
	note $91
	note $b5
	intensity $b4
	note $b1
	octave4
	note $11
	note $21
	note $21
	note $41
	note $41
	note $21
	note $15
	intensity $b7
	octave3
	note $bb
	note $91
	note $81
	note $91
	note $b9
	note $c3
	octave4
	note $15
	octave3
	note $b5
	octave4
	note $31
	note $11
	octave3
	note $b5
	note $89
	note $b5
	note $95
	octave4
	note $11
	octave3
	note $b1
	note $97
	note $65
	note $11
	intensity $b2
	note $65
	intensity $b7
	note $93
	note $71
	note $61
	note $41
	loopchannel $03, $4ff7
	intensity $b2
	note $61
	note $93
	intensity $b7
	note $95
	note $73
	loopchannel $00, $4fb1 ; end
; 0xf5010

_Music_LookRival_Ch2: ; 0xf5010
	dutycycle $03
	vibrato $08, $36
	stereopanning $f0
	notetype $0c, $c2
	octave4
	note $71
	note $61
	note $41
	note $21
	note $15
	intensity $c7
	note $45
	intensity $c2
	note $63
	note $11
	note $43
	intensity $b0
	note $49
	intensity $b7
	note $4f
	intensity $c7
	note $1b
	intensity $c4
	note $11
	note $31
	note $43
	note $33
	note $11
	note $33
	intensity $b0
	note $15
	intensity $b7
	note $17
	intensity $b4
	octave3
	note $a1
	note $81
	note $a1
	intensity $c6
	octave4
	note $15
	intensity $c7
	note $47
	note $6b
	intensity $c4
	note $61
	note $81
	note $91
	note $91
	note $81
	note $81
	note $61
	intensity $c4
	note $85
	intensity $b0
	note $6f
	intensity $b7
	note $6f
	intensity $b0
	note $8b
	note $63
	note $5f
	note $6b
	note $43
	intensity $c7
	note $37
	intensity $c4
	note $11
	note $31
	note $40
	note $30
	note $41
	intensity $c2
	note $15
	intensity $c7
	note $45
	intensity $c2
	note $63
	loopchannel $03, $5070
	note $11
	note $43
	intensity $c7
	note $49
	loopchannel $00, $502e ; end
; 0xf5086

_Music_LookRival_Ch3: ; 0xf5086
	notetype $0c, $28
	note $01
	octave4
	note $11
	octave3
	note $91
	note $71
	note $63
	note $91
	note $43
	note $11
	note $31
	note $41
	note $91
	note $71
	note $61
	note $49
	note $49
	note $11
	note $41
	note $71
	callchannel _Music_LookRival_sub_0xf50ef
	loopchannel $03, $509d
	note $63
	note $11
	note $43
	note $91
	note $81
	note $71
	callchannel _Music_LookRival_sub_0xf50f7
	note $b1
	note $61
	note $81
	note $93
	note $61
	note $81
	note $90
	note $a0
	callchannel _Music_LookRival_sub_0xf50ff
	note $b1
	note $61
	note $81
	note $93
	note $61
	note $b1
	note $c1
	octave4
	note $13
	octave3
	note $81
	note $b3
	note $81
	note $a1
	note $b1
	octave4
	note $13
	octave3
	note $81
	note $b3
	note $81
	note $a1
	note $b0
	note $a0
	callchannel _Music_LookRival_sub_0xf50f7
	callchannel _Music_LookRival_sub_0xf50ff
	callchannel _Music_LookRival_sub_0xf50ef
	callchannel _Music_LookRival_sub_0xf50ef
	note $61
	note $11
	note $31
	note $43
	note $11
	note $31
	note $40
	note $50
	note $61
	note $11
	note $31
	note $43
	note $11
	note $71
	note $51
	loopchannel $00, $509d ; end
; 0xf50ef

_Music_LookRival_sub_0xf50ef: ; 0xf50ef
; subroutine
	note $61
	note $11
	note $31
	note $43
	note $11
	note $31
	note $41
	endchannel ; end
; 0xf50f7

_Music_LookRival_sub_0xf50f7: ; 0xf50f7
; subroutine
	note $b1
	note $61
	note $81
	note $93
	note $61
	note $81
	note $91
	endchannel ; end
; 0xf50ff

_Music_LookRival_sub_0xf50ff: ; 0xf50ff
; subroutine
	note $b3
	note $61
	note $93
	note $61
	note $81
	note $91
	endchannel ; end
; 0xf5106

_Music_LookRival_Ch4: ; 0xf5106
	stereopanning $f0
	togglenoise $03
	notetype $0c
	note $07
	note $0f
	note $41
	note $33
	note $35
	note $33
	note $43
	note $43
	note $31
	note $31
	note $31
	note $31
	note $43
	note $31
	note $43
	note $41
	note $33
	note $43
	note $31
	note $43
	note $41
	note $31
	note $31
	loopchannel $00, $5118 ; end
; 0xf5127
