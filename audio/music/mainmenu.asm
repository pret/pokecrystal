_Music_MainMenu: ; 0xf78fd
	db $c0
	dw _Music_MainMenu_Ch1
	db $01
	dw _Music_MainMenu_Ch2
	db $02
	dw _Music_MainMenu_Ch3
	db $03
	dw _Music_MainMenu_Ch4
; 0xf7909

_Music_MainMenu_Ch1: ; 0xf7909
	tempo $a000
	volume $77
	dutycycle $03
	tone $0100
	vibrato $10, $15
	stereopanning $f0
	notetype $0c, $0f
	octave3
	note $37
	notetype $0c, $92
	octave3
	note $25
	note $20
	note $20
	note $21
	note $21
	note $23
	loopchannel $02, $791d
	note $45
	note $40
	note $40
	note $41
	note $41
	note $43
	octave2
	note $c5
	note $c0
	note $c0
	note $c1
	note $c1
	notetype $0c, $94
	octave3
	note $13
	loopchannel $00, $791d ; end
; 0xf7940

_Music_MainMenu_Ch2: ; 0xf7940
	dutycycle $03
	stereopanning $0f
	notetype $0c, $0f
	octave3
	note $87
	notetype $0c, $a2
	note $75
	note $70
	note $70
	note $71
	note $71
	note $73
	loopchannel $02, $7949
	note $95
	note $90
	note $90
	note $91
	note $91
	note $93
	note $55
	note $50
	note $50
	note $51
	note $51
	notetype $0c, $a4
	note $63
	loopchannel $00, $7949 ; end
; 0xf7969

_Music_MainMenu_Ch3: ; 0xf7969
	stereopanning $f0
	notetype $0c, $25
	note $07
	octave2
	note $70
	note $04
	note $70
	note $70
	note $70
	note $00
	note $70
	note $00
	note $70
	note $02
	loopchannel $02, $796f
	note $90
	note $04
	note $90
	note $90
	note $90
	note $00
	note $90
	note $00
	note $90
	note $02
	note $50
	note $04
	note $50
	note $50
	note $50
	note $00
	note $50
	note $00
	note $60
	note $02
	loopchannel $00, $796f ; end
; 0xf7996

_Music_MainMenu_Ch4: ; 0xf7996
	stereopanning $0f
	togglenoise $03
	notetype $0c
	note $07
	note $0f
	note $0f
	note $0f
	note $0b
	note $30
	note $30
	note $30
	note $30
	note $35
	note $30
	note $30
	note $31
	note $31
	note $33
	note $35
	note $30
	note $30
	note $31
	note $31
	note $40
	note $40
	note $30
	note $30
	loopchannel $00, $79a5 ; end
; 0xf79b8
