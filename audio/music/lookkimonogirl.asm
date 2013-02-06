_Music_LookKimonoGirl: ; 0xf79b8
	db $80
	dw _Music_LookKimonoGirl_Ch1
	db $01
	dw _Music_LookKimonoGirl_Ch2
	db $02
	dw _Music_LookKimonoGirl_Ch3
; 0xf79c1

; 0xf79c1
	db $03
; 0xf79c2

_Music_LookKimonoGirl_Ch1: ; 0xf79c2
	tempo $a000
	volume $77
	stereopanning $0f
	dutycycle $01
	notetype $06, $87
	tone $0100
	callchannel _Music_LookKimonoGirl_sub_0xf7aa8
	tone $0000
	notetype $0c, $b2
	callchannel _Music_LookKimonoGirl_sub_0xf7a13
	callchannel _Music_LookKimonoGirl_sub_0xf7a13
	callchannel _Music_LookKimonoGirl_sub_0xf7a34
	callchannel _Music_LookKimonoGirl_sub_0xf7a34
	callchannel _Music_LookKimonoGirl_sub_0xf7a13
	callchannel _Music_LookKimonoGirl_sub_0xf7a13
	callchannel _Music_LookKimonoGirl_sub_0xf7a34
	intensity $b4
	octave3
	note $50
	intensity $54
	octave4
	note $50
	intensity $b4
	octave3
	note $30
	intensity $54
	octave4
	note $30
	intensity $b4
	octave2
	note $c0
	intensity $54
	octave3
	note $c0
	intensity $b4
	octave2
	note $a0
	intensity $54
	octave3
	note $a0
	loopchannel $00, $79d7 ; end
; 0xf7a13

_Music_LookKimonoGirl_sub_0xf7a13: ; 0xf7a13
; subroutine
	intensity $b4
	octave2
	note $60
	intensity $74
	octave3
	note $60
	intensity $b4
	octave2
	note $a0
	intensity $74
	octave3
	note $a0
	intensity $b4
	octave2
	note $c0
	intensity $74
	octave3
	note $c0
	intensity $b4
	octave3
	note $30
	intensity $74
	octave4
	note $30
	endchannel ; end
; 0xf7a34

_Music_LookKimonoGirl_sub_0xf7a34: ; 0xf7a34
; subroutine
	intensity $b4
	octave2
	note $50
	intensity $74
	octave3
	note $50
	intensity $b4
	octave2
	note $a0
	intensity $74
	octave3
	note $a0
	intensity $b4
	octave2
	note $c0
	intensity $74
	octave3
	note $c0
	intensity $b4
	octave3
	note $30
	intensity $74
	octave4
	note $30
	endchannel ; end
; 0xf7a55

_Music_LookKimonoGirl_Ch2: ; 0xf7a55
	dutycycle $00
	notetype $06, $a7
	stereopanning $f0
	callchannel _Music_LookKimonoGirl_sub_0xf7aa8
	dutycycle $03
	notetype $0c, $91
	octave5
	note $50
	note $30
	octave4
	note $c0
	note $a0
	note $c0
	note $a0
	note $50
	note $30
	note $50
	note $30
	octave3
	note $c0
	note $a0
	note $c0
	note $a0
	note $50
	note $30
	callchannel _Music_LookKimonoGirl_sub_0xf7a94
	octave5
	note $60
	note $30
	octave4
	note $c0
	note $a0
	note $c0
	note $a0
	note $60
	note $30
	note $60
	note $30
	octave3
	note $c0
	note $a0
	note $c0
	note $a0
	note $50
	note $30
	callchannel _Music_LookKimonoGirl_sub_0xf7a94
	loopchannel $00, $7a5f ; end
; 0xf7a94

_Music_LookKimonoGirl_sub_0xf7a94: ; 0xf7a94
; subroutine
	octave5
	note $c0
	note $a0
	note $50
	note $30
	note $50
	note $30
	octave4
	note $c0
	note $a0
	note $c0
	note $a0
	note $50
	note $30
	note $50
	note $30
	octave3
	note $c0
	note $50
	endchannel ; end
; 0xf7aa8

_Music_LookKimonoGirl_sub_0xf7aa8: ; 0xf7aa8
; subroutine
	octave4
	note $50
	octave5
	note $5f
	note $00
	note $51
	note $02
	intensity $b7
	note $51
	note $01
	intensity $b7
	note $51
	note $00
	intensity $a7
	note $51
	note $00
	notetype $06, $65
	note $51
	note $00
	intensity $54
	note $51
	note $00
	intensity $63
	note $51
	note $51
	intensity $91
	note $51
	intensity $a1
	note $50
	notetype $08, $b1
	note $50
	note $50
	endchannel ; end
; 0xf7ad4

_Music_LookKimonoGirl_Ch3: ; 0xf7ad4
	stereopanning $ff
	vibrato $12, $24
	notetype $06, $13
	note $00
	note $0f
	octave5
	note $50
	note $60
	note $51
	notetype $0c, $13
	note $5b
	notetype $06, $13
	octave5
	note $31
	note $51
	octave5
	note $33
	note $53
	note $63
	note $a3
	note $c3
	note $a3
	note $c3
	octave6
	note $33
	note $57
	note $60
	note $70
	note $61
	note $33
	note $57
	note $33
	note $53
	note $67
	note $a7
	note $c0
	octave7
	note $10
	octave6
	note $c1
	note $a3
	note $63
	note $33
	note $50
	note $60
	note $59
	note $61
	note $51
	note $37
	note $57
	loopchannel $00, $7aec ; end
; 0xf7b13
