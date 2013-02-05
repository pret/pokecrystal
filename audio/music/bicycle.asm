_Music_Bicycle: ; 0xee119
	db $c0
	dw _Music_Bicycle_Ch1
	db $01
	dw _Music_Bicycle_Ch2
	db $02
	dw _Music_Bicycle_Ch3
	db $03
	dw _Music_Bicycle_Ch4
; 0xee125

_Music_Bicycle_Ch1: ; 0xee125
	tempo $8c00
	volume $77
	dutycycle $03
	tone $0100
	stereopanning $0f
	vibrato $08, $15
	notetype $0c, $b4
	octave3
	note $c5
	note $a5
	note $83
	intensity $b0
	note $a5
	intensity $b6
	note $a7
	intensity $b2
	note $71
	stereopanning $0f
	intensity $b2
	note $81
	note $81
	note $51
	note $51
	note $70
	note $50
	note $41
	note $31
	note $31
	note $51
	note $51
	note $11
	note $11
	octave2
	note $c1
	note $81
	note $a1
	note $c1
	octave3
	note $11
	note $11
	note $51
	note $51
	note $21
	note $51
	note $71
	note $51
	note $31
	note $51
	note $31
	note $21
	note $31
	note $31
	note $21
	note $31
	note $81
	note $81
	note $51
	note $51
	note $70
	note $50
	note $41
	note $31
	note $31
	note $51
	note $51
	note $11
	note $11
	octave2
	note $c1
	note $c1
	note $b1
	note $c1
	octave3
	note $11
	octave2
	note $c1
	octave3
	note $11
	note $51
	note $11
	note $51
	note $71
	note $81
	note $71
	intensity $82
	note $71
	intensity $b2
	note $a1
	note $81
	note $71
	note $81
	note $91
	note $a1
	stereopanning $f0
	intensity $b6
	note $c3
	note $83
	octave4
	note $33
	octave3
	note $83
	note $a3
	note $73
	octave4
	note $33
	octave3
	note $73
	note $83
	note $53
	octave4
	note $13
	octave3
	note $53
	note $73
	note $31
	note $71
	note $81
	note $91
	note $a3
	octave4
	note $31
	octave3
	note $c1
	note $81
	note $c1
	octave4
	note $31
	note $81
	note $31
	octave3
	note $c1
	octave4
	note $11
	octave3
	note $a1
	note $71
	note $a1
	octave4
	note $11
	note $71
	note $11
	octave3
	note $a1
	note $81
	note $51
	note $11
	note $51
	note $81
	note $91
	note $a1
	note $c1
	octave4
	note $11
	note $11
	octave3
	note $a1
	note $81
	note $71
	note $81
	note $91
	note $a1
	loopchannel $00, $6144 ; end
; 0xee1de

_Music_Bicycle_Ch2: ; 0xee1de
	dutycycle $02
	vibrato $10, $24
	stereopanning $f0
	notetype $0c, $c6
	octave4
	note $35
	note $15
	octave3
	note $c3
	intensity $c2
	octave4
	note $31
	note $30
	note $50
	note $31
	note $30
	note $50
	note $31
	intensity $c3
	note $11
	octave3
	note $c1
	note $a1
	stereopanning $ff
	dutycycle $02
	intensity $c3
	octave3
	note $c3
	note $83
	note $a3
	note $73
	intensity $c2
	note $81
	note $71
	note $51
	note $71
	intensity $c5
	note $37
	intensity $c4
	note $53
	note $83
	intensity $c2
	note $51
	note $c1
	note $a1
	note $81
	note $71
	note $81
	note $a1
	note $81
	intensity $c5
	note $77
	intensity $c3
	note $c3
	note $83
	note $a3
	note $73
	intensity $c2
	note $81
	note $71
	note $51
	note $71
	intensity $c5
	note $37
	intensity $c4
	note $53
	note $83
	intensity $c2
	note $51
	octave4
	note $51
	note $31
	note $11
	octave3
	note $c1
	octave4
	note $11
	note $31
	note $51
	intensity $c7
	note $77
	stereopanning $0f
	callchannel _Music_Bicycle_sub_0xee263
	note $73
	intensity $c3
	note $a1
	note $31
	note $51
	note $61
	note $73
	intensity $c7
	callchannel _Music_Bicycle_sub_0xee263
	note $73
	intensity $c3
	note $a1
	note $c1
	note $a1
	note $81
	note $73
	loopchannel $00, $61fd ; end
; 0xee263

_Music_Bicycle_sub_0xee263: ; 0xee263
; subroutine
	note $85
	note $c5
	note $83
	note $75
	note $a5
	note $73
	note $55
	note $85
	note $53
	endchannel ; end
; 0xee26d

_Music_Bicycle_Ch3: ; 0xee26d
	notetype $0c, $14
	note $0f
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $c1
	octave4
	note $31
	note $11
	note $51
	note $31
	octave3
	note $a0
	note $00
	callchannel _Music_Bicycle_sub_0xee333
	note $50
	note $00
	note $80
	note $00
	note $50
	note $00
	note $80
	note $00
	note $30
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $10
	note $00
	note $30
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $70
	note $00
	note $30
	note $00
	note $50
	note $00
	note $70
	note $00
	callchannel _Music_Bicycle_sub_0xee333
	note $50
	note $00
	note $80
	note $00
	note $50
	note $00
	note $80
	note $00
	note $30
	note $00
	note $80
	note $00
	note $70
	note $00
	note $60
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	octave4
	note $30
	note $00
	note $10
	note $00
	octave3
	note $c0
	note $00
	note $a0
	note $00
	note $80
	note $00
	note $c0
	note $00
	note $30
	note $00
	note $c0
	note $00
	note $80
	note $00
	note $c0
	note $00
	note $30
	note $00
	note $c0
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $50
	note $00
	note $80
	note $00
	note $10
	note $00
	note $80
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $70
	note $00
	octave4
	note $10
	note $00
	octave3
	note $c0
	note $00
	note $a0
	note $00
	loopchannel $02, $62e9
	loopchannel $00, $627f ; end
; 0xee333

_Music_Bicycle_sub_0xee333: ; 0xee333
; subroutine
	octave3
	note $80
	note $00
	note $c0
	note $00
	note $30
	note $00
	note $c0
	note $00
	note $80
	note $00
	note $c0
	note $00
	note $30
	note $00
	note $c0
	note $00
	endchannel ; end
; 0xee345

_Music_Bicycle_Ch4: ; 0xee345
	togglenoise $00
	notetype $0c
	note $0f
	note $0f
	note $01
	stereopanning $f0
	note $63
	loopchannel $0c, $634c
	note $63
	note $63
	stereopanning $ff
	note $61
	note $61
	note $61
	loopchannel $00, $634b ; end
; 0xee35e
