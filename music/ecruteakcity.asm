_Music_EcruteakCity: ; 0xef2d0
	db $80
	dw _Music_EcruteakCity_Ch1
	db $01
	dw _Music_EcruteakCity_Ch2
	db $02
	dw _Music_EcruteakCity_Ch3
; 0xef2d9

_Music_EcruteakCity_Ch1: ; 0xef2d9
	tempo $c500
	volume $77
	stereopanning $0f
	vibrato $12, $25
	dutycycle $02
	notetype $0c, $57
	note $09
	octave4
	note $15
	note $09
	note $15
	note $0f
	octave3
	note $c3
	octave4
	note $13
	note $33
	intensity $60
	note $03
	note $0f
	note $09
	note $81
	note $a1
	note $b1
	note $07
	note $91
	note $81
	note $61
	octave5
	note $15
	notetype $06, $67
	note $23
	note $39
	note $01
	stereopanning $ff
	octave4
	note $c7
	stereopanning $0f
	octave3
	note $b0
	note $ca
	octave4
	note $13
	note $53
	note $8b
	note $bb
	note $83
	note $03
	note $b3
	octave5
	note $23
	note $51
	note $01
	octave3
	note $a7
	octave4
	note $17
	note $63
	note $0b
	note $50
	note $6a
	note $81
	note $01
	note $a3
	note $83
	note $07
	intensity $52
	callchannel _Music_EcruteakCity_sub_0xef37f
	note $31
	octave4
	note $c1
	note $a1
	note $c1
	note $a1
	note $c1
	octave5
	note $31
	octave4
	note $c1
	octave5
	note $31
	octave4
	note $c1
	note $a1
	note $c1
	note $a1
	note $c1
	note $a1
	note $c1
	callchannel _Music_EcruteakCity_sub_0xef391
	intensity $52
	note $b1
	note $81
	note $51
	note $21
	note $81
	note $51
	note $21
	octave4
	note $b1
	octave5
	note $51
	note $21
	octave4
	note $b1
	note $81
	note $b1
	note $81
	note $51
	note $21
	callchannel _Music_EcruteakCity_sub_0xef37f
	note $31
	note $11
	octave4
	note $91
	octave5
	note $11
	octave4
	note $91
	octave5
	note $11
	note $31
	note $11
	note $31
	note $11
	octave4
	note $91
	octave5
	note $11
	octave4
	note $91
	octave5
	note $11
	octave4
	note $91
	octave5
	note $11
	callchannel _Music_EcruteakCity_sub_0xef391
	loopchannel $00, $72e5 ; end
; 0xef37f

_Music_EcruteakCity_sub_0xef37f: ; 0xef37f
; subroutine
	octave5
	note $51
	note $11
	octave4
	note $a1
	octave5
	note $11
	octave4
	note $a1
	octave5
	note $11
	note $51
	note $11
	loopchannel $02, $737f
	endchannel ; end
; 0xef391

_Music_EcruteakCity_sub_0xef391: ; 0xef391
; subroutine
	octave5
	note $31
	octave4
	note $c1
	note $81
	note $c1
	note $81
	note $c1
	octave5
	note $31
	octave4
	note $c1
	octave5
	note $31
	octave4
	note $c1
	note $81
	note $c1
	note $81
	note $c1
	octave5
	note $31
	note $61
	note $a1
	note $51
	note $11
	octave4
	note $a1
	octave5
	note $51
	note $11
	octave4
	note $a1
	note $51
	octave5
	note $11
	octave4
	note $a1
	note $51
	note $11
	note $a1
	note $51
	note $11
	octave3
	note $a1
	octave4
	note $61
	note $a1
	octave5
	note $11
	octave4
	note $a1
	octave5
	note $11
	octave4
	note $a1
	octave5
	note $11
	note $61
	loopchannel $02, $73be
	octave4
	note $81
	note $c1
	octave5
	note $31
	octave4
	note $c1
	octave5
	note $31
	octave4
	note $c1
	octave5
	note $31
	note $81
	loopchannel $02, $73d0
	intensity $50
	dutycycle $00
	note $5f
	note $8f
	dutycycle $02
	endchannel ; end
; 0xef3eb

_Music_EcruteakCity_Ch2: ; 0xef3eb
	vibrato $12, $25
	dutycycle $03
	stereopanning $f0
	notetype $06, $67
	note $0f
	note $04
	octave4
	note $80
	octave5
	note $30
	note $58
	note $0f
	note $04
	octave4
	note $a0
	octave5
	note $50
	note $68
	notetype $0c, $77
	note $09
	note $31
	note $11
	octave4
	note $91
	note $83
	note $a3
	note $c3
	notetype $06, $93
	intensity $97
	dutycycle $02
	octave3
	note $86
	octave4
	note $20
	note $3a
	note $00
	note $11
	note $01
	note $1f
	note $67
	note $03
	note $53
	note $03
	note $53
	note $63
	note $83
	note $53
	note $11
	note $01
	note $13
	octave3
	note $a1
	note $60
	note $a0
	octave4
	note $1f
	note $53
	note $81
	note $01
	note $53
	note $39
	note $00
	stereopanning $ff
	note $48
	stereopanning $f0
	dutycycle $00
	octave5
	note $20
	note $3a
	note $11
	note $01
	note $1f
	note $6b
	note $53
	note $03
	note $53
	note $63
	note $81
	octave4
	note $a0
	octave5
	note $10
	note $50
	note $a2
	note $51
	note $01
	note $53
	note $11
	note $01
	note $13
	octave4
	note $a1
	note $01
	note $c3
	octave5
	note $11
	octave4
	note $80
	note $c0
	octave5
	note $40
	note $5a
	note $31
	note $01
	note $37
	dutycycle $01
	octave4
	note $53
	note $82
	note $90
	note $af
	octave3
	note $a3
	octave4
	note $11
	note $01
	note $53
	note $3b
	note $13
	note $03
	octave3
	note $c3
	note $03
	octave4
	note $67
	note $8b
	note $67
	note $03
	note $57
	note $33
	note $11
	note $01
	octave3
	note $c3
	octave4
	note $11
	note $05
	octave3
	note $c3
	note $03
	octave4
	note $13
	octave3
	note $af
	note $03
	octave4
	note $63
	note $53
	note $33
	note $1b
	octave3
	note $c3
	note $03
	octave4
	note $13
	note $33
	note $43
	notetype $0c, $83
	note $5f
	intensity $80
	note $33
	note $23
	note $63
	notetype $06, $80
	note $86
	note $90
	intensity $87
	note $ab
	note $51
	note $01
	note $51
	note $01
	note $52
	note $90
	note $a3
	note $51
	note $01
	note $53
	note $31
	note $01
	note $23
	note $3b
	octave3
	note $c3
	octave4
	note $63
	note $8b
	note $31
	note $01
	note $31
	note $01
	note $33
	note $83
	note $31
	note $00
	note $b0
	note $cb
	octave5
	note $13
	octave4
	note $a7
	octave3
	note $a3
	octave4
	note $13
	notetype $0c, $87
	note $69
	note $81
	note $61
	note $51
	note $37
	note $01
	octave3
	note $c1
	octave4
	note $11
	note $31
	note $5f
	loopchannel $00, $73f2 ; end
; 0xef4e1

_Music_EcruteakCity_Ch3: ; 0xef4e1
	stereopanning $ff
	vibrato $12, $25
	notetype $0c, $25
	octave3
	note $11
	note $81
	octave4
	note $31
	note $59
	octave3
	note $11
	note $a1
	octave4
	note $51
	note $69
	octave3
	note $11
	note $81
	octave4
	note $31
	note $59
	note $83
	note $73
	note $63
	octave3
	note $c1
	note $81
	note $11
	note $81
	octave4
	note $31
	note $59
	octave3
	note $21
	note $81
	note $b1
	octave4
	note $31
	note $01
	note $21
	note $31
	note $51
	octave3
	note $31
	note $a0
	note $00
	octave4
	note $51
	note $60
	note $00
	note $97
	octave3
	note $81
	octave4
	note $31
	note $61
	note $91
	note $c1
	note $80
	note $94
	octave3
	note $11
	note $81
	octave4
	note $31
	note $51
	note $81
	octave5
	note $11
	note $31
	note $51
	octave3
	note $21
	note $b1
	octave4
	note $31
	note $21
	note $51
	note $31
	note $61
	note $80
	note $00
	octave3
	note $67
	octave4
	note $a1
	octave5
	note $10
	note $00
	note $31
	note $50
	note $00
	octave2
	note $81
	octave3
	note $31
	note $81
	note $71
	note $a1
	note $81
	note $c1
	octave4
	note $31
	callchannel _Music_EcruteakCity_sub_0xef569
	octave4
	note $17
	note $57
	note $87
	note $c7
	note $b7
	note $87
	note $57
	note $27
	notetype $0c, $25
	callchannel _Music_EcruteakCity_sub_0xef569
	octave4
	note $17
	octave3
	note $87
	note $57
	note $37
	loopchannel $00, $74e3 ; end
; 0xef569

_Music_EcruteakCity_sub_0xef569: ; 0xef569
; subroutine
	octave3
	note $63
	note $01
	note $60
	note $00
	note $63
	note $01
	note $10
	note $00
	note $63
	note $01
	note $60
	note $00
	note $60
	note $00
	note $61
	note $01
	note $60
	note $00
	note $53
	note $01
	note $c0
	note $00
	note $50
	note $00
	note $51
	note $01
	note $c0
	note $00
	note $a3
	note $01
	note $a0
	note $00
	note $90
	note $00
	note $90
	note $00
	note $80
	note $00
	note $70
	note $00
	note $33
	note $01
	note $a0
	note $00
	note $30
	note $00
	note $30
	note $00
	note $50
	note $00
	note $60
	note $00
	note $83
	note $01
	octave4
	note $30
	note $00
	octave3
	note $80
	note $00
	note $80
	note $00
	note $a0
	note $00
	note $b0
	notetype $06, $25
	note $00
	note $c0
	endchannel ; end
; 0xef5b1
