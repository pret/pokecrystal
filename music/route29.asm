_Music_Route29: ; 0xf0386
	db $c0
	dw _Music_Route29_Ch1
	db $01
	dw _Music_Route29_Ch2
	db $02
	dw _Music_Route29_Ch3
	db $03
	dw _Music_Route29_Ch4
; 0xf0392

_Music_Route29_Ch1: ; 0xf0392
	tempo $9200
	volume $77
	dutycycle $03
	tone $0100
	vibrato $10, $15
	stereopanning $0f
	notetype $0c, $b2
	note $01
	note $01
	octave4
	note $11
	note $51
	note $13
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $83
	note $a1
	note $71
	note $13
	octave4
	note $31
	octave3
	note $c1
	note $33
	octave4
	note $11
	note $51
	note $13
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $a3
	note $a1
	note $11
	note $31
	note $81
	note $11
	note $13
	note $81
	octave4
	note $11
	note $51
	note $11
	octave3
	note $51
	note $a1
	octave4
	note $11
	octave3
	note $81
	note $60
	note $80
	note $a1
	note $11
	note $71
	note $31
	octave4
	note $31
	octave3
	note $c3
	note $51
	octave4
	note $11
	note $51
	note $51
	octave3
	note $51
	note $81
	octave4
	note $11
	octave3
	note $81
	note $30
	note $80
	octave4
	note $11
	octave3
	note $c1
	note $81
	note $50
	note $60
	note $81
	note $81
	note $67
	intensity $b4
	note $a3
	octave4
	note $11
	octave3
	note $a9
	note $53
	note $81
	note $51
	intensity $b2
	note $85
	intensity $b4
	note $63
	note $a1
	note $81
	note $61
	intensity $b2
	note $a3
	intensity $b4
	note $23
	note $51
	note $83
	intensity $b3
	note $57
	intensity $b4
	note $a1
	note $81
	note $a1
	octave4
	note $13
	intensity $b2
	octave3
	note $a5
	intensity $b4
	note $81
	note $51
	note $81
	octave4
	note $13
	octave3
	note $81
	octave4
	note $31
	note $11
	octave3
	note $c1
	note $a1
	intensity $b2
	note $83
	note $c3
	intensity $b4
	note $81
	note $51
	octave4
	note $11
	octave3
	note $53
	note $51
	octave4
	note $11
	octave3
	note $51
	note $83
	octave4
	note $11
	octave3
	note $51
	intensity $b2
	note $11
	note $81
	note $83
	loopchannel $00, $43a5 ; end
; 0xf044d

_Music_Route29_Ch2: ; 0xf044d
	dutycycle $03
	vibrato $12, $36
	notetype $0c, $c2
	octave4
	note $10
	note $30
	callchannel _Music_Route29_sub_0xf04de
	note $60
	note $50
	note $31
	note $31
	octave3
	note $c1
	octave4
	note $11
	octave3
	note $51
	note $51
	octave4
	note $10
	note $30
	callchannel _Music_Route29_sub_0xf04de
	note $60
	note $50
	note $31
	note $31
	octave3
	note $c1
	intensity $c4
	octave4
	note $17
	octave3
	note $a1
	note $a1
	octave4
	note $11
	note $11
	note $61
	note $a1
	note $81
	note $61
	octave3
	note $81
	note $81
	octave4
	note $11
	note $11
	note $51
	note $81
	note $61
	note $51
	octave3
	note $61
	note $61
	note $a1
	note $a1
	octave4
	note $31
	note $61
	note $51
	note $31
	note $51
	note $31
	note $21
	note $31
	note $21
	octave3
	note $b1
	note $a1
	note $81
	note $a1
	note $a1
	octave4
	note $11
	note $11
	note $61
	note $a1
	note $81
	note $61
	octave3
	note $81
	note $81
	octave4
	note $11
	note $11
	note $51
	note $81
	note $61
	note $51
	note $61
	note $51
	note $31
	note $61
	intensity $c2
	note $53
	note $33
	intensity $c4
	note $11
	octave3
	note $81
	octave4
	note $51
	octave3
	note $81
	octave4
	note $11
	octave3
	note $81
	octave4
	note $51
	octave3
	note $81
	octave4
	note $11
	octave3
	note $81
	octave4
	note $51
	octave3
	note $81
	intensity $c2
	octave4
	note $11
	note $11
	note $11
	octave4
	note $10
	note $30
	loopchannel $00, $4458 ; end
; 0xf04de

_Music_Route29_sub_0xf04de: ; 0xf04de
; subroutine
	note $51
	note $51
	note $81
	note $81
	note $11
	note $31
	note $51
	note $11
	note $60
	note $50
	note $31
	octave3
	note $c1
	note $a1
	note $81
	octave4
	note $a1
	note $81
	note $10
	note $30
	note $51
	note $51
	note $81
	note $81
	note $11
	note $31
	note $51
	note $11
	endchannel ; end
; 0xf04fb

_Music_Route29_Ch3: ; 0xf04fb
	stereopanning $f0
	notetype $0c, $25
	vibrato $09, $27
	note $01
	note $01
	octave3
	note $80
	note $00
	octave4
	note $10
	note $00
	note $50
	note $02
	note $50
	note $00
	octave3
	note $a0
	note $00
	octave4
	note $50
	note $00
	octave3
	note $60
	note $00
	octave4
	note $10
	note $02
	octave3
	note $a0
	note $00
	note $80
	note $00
	octave4
	note $10
	note $00
	octave3
	note $c0
	note $00
	note $80
	note $00
	octave4
	note $10
	note $00
	octave3
	note $80
	note $00
	octave4
	note $10
	note $00
	note $50
	note $02
	note $10
	note $00
	note $50
	note $00
	note $50
	note $00
	octave3
	note $60
	note $00
	octave4
	note $10
	note $00
	octave3
	note $80
	note $00
	note $c0
	note $00
	octave4
	note $50
	note $00
	octave3
	note $80
	note $00
	note $80
	note $02
	note $53
	note $83
	octave4
	note $13
	octave3
	note $83
	note $63
	note $73
	octave4
	note $13
	octave3
	note $c3
	note $53
	note $83
	octave4
	note $13
	octave3
	note $81
	note $51
	note $81
	octave4
	note $11
	octave3
	note $c1
	note $81
	octave4
	note $11
	octave3
	note $c1
	octave4
	note $11
	note $31
	note $15
	octave3
	note $65
	note $a3
	octave4
	note $15
	octave3
	note $85
	note $a1
	note $b1
	note $c5
	note $85
	octave4
	note $31
	note $61
	octave3
	note $a5
	note $51
	octave4
	note $51
	note $21
	octave3
	note $a1
	note $81
	note $a5
	octave4
	note $15
	octave3
	note $a3
	note $85
	octave4
	note $15
	note $61
	note $51
	note $65
	note $61
	note $51
	note $01
	note $31
	octave3
	note $c1
	octave4
	note $15
	octave3
	note $85
	octave4
	note $13
	note $53
	note $13
	octave3
	note $80
	note $00
	octave4
	note $10
	note $00
	note $10
	note $02
	loopchannel $00, $4504 ; end
; 0xf05a9

_Music_Route29_Ch4: ; 0xf05a9
	stereopanning $0f
	togglenoise $00
	notetype $0c
	note $01
	note $01
	note $61
	note $65
	note $61
	note $61
	note $61
	note $01
	note $63
	note $63
	note $61
	note $63
	loopchannel $00, $45b0 ; end
; 0xf05bf
