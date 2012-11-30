_Music_TitleScreen: ; 0xeb808
	db $c0
	dw _Music_TitleScreen_Ch1
	db $01
	dw _Music_TitleScreen_Ch2
	db $02
	dw _Music_TitleScreen_Ch3
	db $03
	dw _Music_TitleScreen_Ch4
; 0xeb814

_Music_TitleScreen_Ch1: ; 0xeb814
	tempo $8600
	volume $77
	dutycycle $03
	tone $0200
	vibrato $10, $12
	stereopanning $f0
	notetype $0c, $a7
	intensity $a0
	octave3
	note $03
	intensity $a7
	octave2
	note $80
	note $01
	note $a0
	note $c7
	note $83
	octave3
	note $10
	note $01
	note $30
	note $57
	note $13
	octave2
	note $c0
	note $01
	octave3
	note $10
	octave2
	note $c7
	note $a3
	note $a0
	note $01
	note $c0
	octave3
	note $15
	note $53
	note $71
	stereopanning $ff
	octave4
	note $80
	stereopanning $f0
	octave3
	note $34
	octave2
	note $c1
	octave3
	note $33
	octave2
	note $c3
	octave3
	note $15
	note $65
	note $13
	note $35
	intensity $b7
	note $40
	note $50
	note $65
	note $50
	note $40
	note $37
	notetype $08, $a7
	note $13
	octave2
	note $c3
	octave3
	note $13
	note $38
	octave2
	note $c2
	octave3
	note $35
	octave2
	note $c5
	octave3
	note $12
	note $35
	note $52
	note $53
	note $53
	note $13
	notetype $08, $a0
	octave2
	note $c5
	notetype $08, $a7
	note $c5
	notetype $08, $a7
	octave3
	note $63
	note $53
	note $13
	notetype $08, $a0
	note $35
	notetype $08, $a7
	note $35
	notetype $08, $a7
	note $02
	octave2
	note $c2
	octave3
	note $12
	note $32
	note $38
	octave2
	note $c2
	octave3
	note $35
	octave2
	note $c5
	octave3
	note $18
	note $68
	note $15
	note $38
	notetype $0c, $b7
	note $40
	note $50
	note $65
	note $50
	note $40
	note $37
	notetype $08, $a7
	note $13
	octave2
	note $c3
	octave3
	note $13
	note $38
	octave2
	note $c2
	octave3
	note $38
	notetype $08, $b7
	note $82
	note $a3
	note $83
	note $63
	note $65
	note $55
	note $38
	note $62
	note $82
	note $35
	note $82
	notetype $08, $54
	octave2
	note $82
	note $c2
	notetype $08, $94
	octave3
	note $32
	note $82
	tempo $8800
	notetype $08, $b4
	note $62
	note $a2
	notetype $08, $d4
	octave4
	note $12
	note $62
	tempo $8a00
	notetype $08, $b4
	note $38
	note $18
	octave3
	note $b5
	notetype $0c, $b7
	note $60
	note $50
	note $30
	note $50
	note $63
	octave4
	note $33
	note $63
	note $55
	octave3
	note $81
	notetype $08, $b7
	note $a3
	note $83
	note $63
	note $8b
	octave4
	note $15
	tempo $8800
	note $25
	tempo $8600
	callchannel _Music_TitleScreen_sub_0xeb96d
	octave4
	note $13
	note $13
	note $23
	callchannel _Music_TitleScreen_sub_0xeb96d
	octave4
	note $13
	note $13
	note $23
	callchannel _Music_TitleScreen_sub_0xeb96d
	octave3
	note $53
	note $53
	note $13
	notetype $0c, $a0
	note $35
	notetype $0c, $a7
	note $39
	intensity $a0
	note $17
	intensity $a7
	note $17
	intensity $a0
	octave2
	note $c7
	intensity $a7
	note $c7
	octave3
	note $17
	octave2
	note $c7
	octave3
	note $37
	octave2
	note $c7
	octave3
	note $17
	note $67
	note $a7
	note $85
	note $80
	note $70
	note $67
	note $57
	intensity $a0
	note $3f
	intensity $a7
	note $3f
	intensity $a3
	octave2
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $02
	note $80
	note $02
	note $80
	note $02
	notetype $08, $b2
	note $a1
	note $a1
	note $a1
	note $a1
	note $a1
	note $71
	notetype $0c, $b7
	note $80
	note $02
	octave1
	note $80
	note $0a
	endchannel ; end
; 0xeb96d

_Music_TitleScreen_sub_0xeb96d: ; 0xeb96d
; subroutine
	notetype $0c, $c3
	note $30
	note $00
	octave2
	note $30
	octave1
	note $a0
	octave2
	note $30
	loopchannel $05, $7971
	note $00
	note $30
	octave1
	note $a0
	notetype $08, $b7
	endchannel ; end
; 0xeb984

_Music_TitleScreen_Ch2: ; 0xeb984
	dutycycle $03
	vibrato $14, $12
	notetype $0c, $c7
	intensity $a4
	octave1
	note $80
	octave2
	note $30
	note $80
	octave3
	note $10
	intensity $c2
	octave3
	note $c0
	note $01
	note $a0
	intensity $b0
	note $85
	intensity $b7
	note $85
	note $0f
	note $0f
	intensity $c7
	octave4
	note $10
	note $01
	note $30
	note $57
	note $71
	note $50
	note $70
	octave3
	note $85
	note $c1
	octave4
	note $37
	stereopanning $f0
	intensity $97
	octave2
	note $a3
	note $63
	stereopanning $ff
	intensity $c7
	octave4
	note $65
	note $50
	note $40
	note $37
	stereopanning $f0
	intensity $97
	octave2
	note $a5
	octave3
	note $11
	stereopanning $0f
	intensity $a3
	octave4
	note $33
	note $31
	note $13
	note $11
	octave3
	note $c3
	stereopanning $ff
	intensity $c7
	octave3
	note $85
	note $c1
	octave4
	note $37
	stereopanning $f0
	intensity $97
	octave2
	note $a1
	note $63
	note $a1
	stereopanning $ff
	notetype $08, $c7
	octave4
	note $13
	octave3
	note $c3
	octave4
	note $13
	note $3b
	stereopanning $f0
	notetype $08, $b7
	octave2
	note $a8
	stereopanning $0f
	notetype $0c, $c7
	note $80
	note $a0
	note $c5
	note $50
	note $70
	note $83
	notetype $0c, $4b
	note $a3
	stereopanning $ff
	notetype $0c, $c7
	octave3
	note $85
	note $c1
	octave4
	note $37
	stereopanning $f0
	intensity $97
	octave2
	note $a1
	note $65
	stereopanning $ff
	intensity $c7
	octave4
	note $65
	note $50
	note $40
	note $37
	stereopanning $f0
	intensity $97
	octave3
	note $11
	octave2
	note $a5
	note $c5
	note $81
	notetype $08, $c7
	note $63
	note $83
	note $63
	stereopanning $ff
	octave3
	note $88
	note $c2
	octave4
	note $3b
	stereopanning $f0
	notetype $08, $a7
	octave3
	note $33
	note $13
	note $33
	stereopanning $ff
	notetype $08, $c7
	octave4
	note $63
	note $53
	note $63
	note $88
	note $b2
	notetype $0c, $b0
	note $87
	notetype $0c, $b7
	note $87
	intensity $c6
	note $a3
	intensity $5d
	note $a3
	intensity $c7
	note $b5
	intensity $c3
	note $61
	intensity $c7
	note $67
	intensity $a7
	octave3
	note $b7
	intensity $c7
	octave4
	note $b3
	note $c3
	octave5
	note $15
	intensity $c3
	octave4
	note $81
	intensity $c7
	note $87
	intensity $a7
	octave3
	note $57
	intensity $c7
	octave5
	note $13
	note $23
	tone $0100
	stereopanning $0f
	callchannel _Music_TitleScreen_sub_0xebae7
	note $23
	callchannel _Music_TitleScreen_sub_0xebae7
	note $23
	callchannel _Music_TitleScreen_sub_0xebae7
	octave4
	note $a3
	stereopanning $ff
	tone $0000
	notetype $0c, $b0
	octave3
	note $c5
	notetype $0c, $b7
	note $c9
	intensity $c7
	note $a7
	note $65
	note $50
	note $40
	note $37
	note $87
	note $67
	note $a7
	intensity $b0
	note $87
	intensity $b7
	note $87
	intensity $c7
	note $67
	octave4
	note $65
	note $50
	note $40
	note $37
	octave2
	note $c7
	octave3
	note $17
	note $a5
	note $60
	note $a0
	intensity $b0
	note $8f
	intensity $b7
	note $8f
	intensity $c2
	octave4
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $02
	note $80
	note $02
	intensity $90
	note $83
	notetype $08, $c2
	octave3
	note $61
	note $61
	note $61
	note $61
	note $61
	note $71
	notetype $0c, $c7
	note $80
	note $02
	octave2
	note $80
	note $0a
	endchannel ; end
; 0xebae7

_Music_TitleScreen_sub_0xebae7: ; 0xebae7
; subroutine
	notetype $0c, $b2
	note $30
	octave3
	note $a0
	octave4
	note $30
	note $a0
	note $30
	loopchannel $05, $7aeb
	octave3
	note $a0
	octave4
	note $30
	note $a0
	notetype $08, $b7
	octave5
	note $13
	note $13
	endchannel ; end
; 0xebb01

_Music_TitleScreen_Ch3: ; 0xebb01
	stereopanning $0f
	vibrato $10, $14
	tone $0100
	notetype $0c, $16
	octave3
	octave3
	note $03
	octave2
	note $81
	note $30
	note $20
	note $30
	note $00
	note $81
	note $30
	note $00
	note $31
	note $81
	note $31
	note $61
	note $10
	octave1
	note $c0
	octave2
	note $10
	note $00
	note $61
	note $10
	note $00
	note $11
	note $61
	note $11
	note $81
	note $30
	note $20
	note $30
	note $00
	note $81
	note $30
	note $00
	note $31
	note $81
	note $31
	note $a1
	note $60
	note $50
	note $60
	note $00
	note $a1
	note $61
	note $a3
	octave3
	note $11
	octave2
	note $83
	note $31
	note $83
	note $31
	note $81
	note $31
	note $a3
	note $61
	note $a3
	note $61
	note $a1
	octave3
	note $11
	octave2
	note $c3
	note $81
	note $c3
	note $81
	note $c1
	note $81
	note $83
	note $c1
	note $a3
	note $c1
	octave3
	note $13
	octave2
	note $83
	note $31
	note $83
	note $31
	note $81
	note $31
	note $a3
	note $61
	note $a3
	note $61
	note $a1
	octave3
	note $11
	octave2
	note $c3
	note $81
	note $c3
	note $81
	note $c1
	octave3
	note $11
	octave2
	note $c3
	note $81
	note $c3
	note $81
	octave3
	note $33
	octave2
	note $83
	note $31
	note $83
	note $31
	note $81
	note $31
	note $a3
	note $61
	note $a3
	note $61
	note $a1
	octave3
	note $11
	octave2
	note $c3
	note $81
	note $c3
	note $81
	note $c1
	note $81
	octave3
	note $33
	octave2
	note $81
	octave3
	note $33
	octave2
	note $81
	octave3
	note $31
	octave2
	note $a1
	note $83
	note $31
	note $83
	note $31
	note $81
	note $31
	note $a3
	note $61
	note $a3
	note $61
	note $a1
	octave3
	note $11
	octave2
	note $c3
	note $81
	note $c3
	note $81
	octave3
	note $31
	octave2
	note $81
	note $81
	note $31
	note $81
	note $a1
	note $a1
	note $61
	note $a1
	octave3
	note $11
	note $35
	octave2
	note $b5
	octave3
	note $63
	note $b5
	note $65
	note $33
	note $55
	note $15
	note $53
	octave4
	note $15
	octave3
	note $85
	note $53
	note $30
	note $00
	stereopanning $ff
	notetype $0c, $16
	tone $0000
	octave4
	note $a1
	octave5
	note $31
	note $a5
	note $81
	note $71
	note $30
	note $01
	note $50
	note $73
	notetype $08, $16
	octave3
	note $13
	note $13
	note $23
	notetype $0c, $16
	note $30
	note $00
	octave4
	note $a1
	octave5
	note $31
	note $a5
	note $81
	note $71
	note $c0
	note $01
	note $a0
	note $a3
	notetype $08, $16
	octave3
	note $13
	note $13
	note $23
	notetype $0c, $16
	note $30
	note $00
	notetype $0c, $16
	octave4
	note $a1
	octave5
	note $31
	note $85
	note $51
	note $81
	note $70
	note $50
	note $35
	tone $0100
	notetype $08, $16
	octave3
	note $13
	note $13
	note $51
	note $71
	stereopanning $0f
	notetype $0c, $16
	note $8f
	note $6f
	note $87
	note $35
	note $30
	note $50
	note $61
	note $6b
	note $50
	note $40
	note $37
	note $87
	note $67
	note $a7
	note $87
	note $35
	note $30
	note $50
	note $6f
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $02
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $02
	octave2
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $02
	note $80
	note $02
	note $80
	note $02
	notetype $08, $16
	note $61
	note $61
	note $61
	note $61
	note $61
	note $a1
	notetype $0c, $16
	note $80
	note $02
	octave1
	note $80
	note $0a
	endchannel ; end
; 0xebc5c

_Music_TitleScreen_Ch4: ; 0xebc5c
	togglenoise $05
	stereopanning $f0
	notetype $0c
	note $03
	note $11
	note $10
	note $10
	note $11
	note $10
	note $10
	note $10
	note $10
	note $15
	note $11
	note $10
	note $10
	note $11
	note $10
	note $10
	note $10
	note $10
	note $12
	note $10
	note $10
	note $10
	note $11
	note $10
	note $10
	note $11
	note $10
	note $10
	note $10
	note $10
	note $13
	note $41
	note $11
	note $10
	note $10
	note $11
	note $10
	note $10
	note $10
	note $10
	note $11
	notetype $06
	note $30
	note $30
	note $20
	note $20
	note $20
	note $20
	note $10
	note $10
	notetype $0c
	callchannel _Music_TitleScreen_sub_0xebd77
	callchannel _Music_TitleScreen_sub_0xebd81
	callchannel _Music_TitleScreen_sub_0xebd81
	note $11
	note $41
	note $11
	note $41
	note $41
	note $10
	note $10
	note $11
	notetype $06
	note $20
	note $20
	note $10
	note $10
	notetype $0c
	callchannel _Music_TitleScreen_sub_0xebd77
	note $11
	note $41
	note $11
	note $61
	note $41
	note $10
	note $10
	note $11
	note $11
	callchannel _Music_TitleScreen_sub_0xebd81
	note $11
	note $41
	note $11
	note $41
	note $41
	note $10
	note $10
	note $11
	note $10
	note $10
	callchannel _Music_TitleScreen_sub_0xebd77
	callchannel _Music_TitleScreen_sub_0xebd81
	callchannel _Music_TitleScreen_sub_0xebd81
	note $11
	note $41
	note $11
	note $41
	note $41
	note $10
	note $10
	note $11
	notetype $06
	note $20
	note $30
	note $30
	note $20
	notetype $0c
	callchannel _Music_TitleScreen_sub_0xebd77
	callchannel _Music_TitleScreen_sub_0xebd81
	note $11
	note $41
	note $11
	note $61
	note $41
	note $10
	note $10
	note $11
	note $10
	note $10
	note $11
	note $41
	note $11
	note $41
	note $41
	note $10
	note $10
	note $11
	notetype $06
	note $30
	note $30
	note $20
	note $20
	notetype $0c
	note $a1
	note $43
	note $a3
	note $41
	note $a3
	note $a1
	note $43
	note $a3
	note $41
	note $a1
	note $a1
	note $a1
	note $43
	note $a3
	note $41
	note $a3
	note $a3
	note $a3
	note $a1
	note $30
	note $30
	note $20
	note $20
	note $10
	note $10
	callchannel _Music_TitleScreen_sub_0xebd8b
	callchannel _Music_TitleScreen_sub_0xebd93
	note $20
	note $30
	note $30
	note $20
	notetype $0c
	callchannel _Music_TitleScreen_sub_0xebd8b
	callchannel _Music_TitleScreen_sub_0xebd93
	note $30
	note $30
	note $20
	note $20
	notetype $0c
	callchannel _Music_TitleScreen_sub_0xebd8b
	callchannel _Music_TitleScreen_sub_0xebd93
	note $20
	note $20
	note $20
	note $20
	notetype $0c
	note $9f
	note $0f
	loopchannel $06, $7d40
	note $0b
	notetype $06
	note $30
	note $20
	note $30
	note $20
	note $30
	note $20
	note $10
	note $10
	notetype $0c
	note $13
	note $15
	note $10
	note $10
	note $13
	note $13
	note $15
	note $10
	note $10
	note $13
	note $13
	note $15
	note $10
	note $10
	note $13
	note $13
	note $13
	notetype $08
	note $11
	note $11
	note $11
	notetype $06
	note $20
	note $20
	note $30
	note $30
	note $20
	note $20
	note $10
	note $10
	notetype $0c
	note $13
	note $c3
	endchannel ; end
; 0xebd77

_Music_TitleScreen_sub_0xebd77: ; 0xebd77
; subroutine
	note $11
	note $41
	note $11
	note $41
	note $61
	note $10
	note $10
	note $11
	note $41
	endchannel ; end
; 0xebd81

_Music_TitleScreen_sub_0xebd81: ; 0xebd81
; subroutine
	note $11
	note $41
	note $11
	note $61
	note $41
	note $10
	note $10
	note $11
	note $41
	endchannel ; end
; 0xebd8b

_Music_TitleScreen_sub_0xebd8b: ; 0xebd8b
; subroutine
	note $11
	note $10
	note $10
	loopchannel $04, $7d8b
	endchannel ; end
; 0xebd93

_Music_TitleScreen_sub_0xebd93: ; 0xebd93
; subroutine
	note $11
	note $10
	note $10
	note $11
	note $10
	note $10
	notetype $08
	note $13
	note $13
	endchannel ; end
; 0xebd9e
