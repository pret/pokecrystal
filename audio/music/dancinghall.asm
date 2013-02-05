_Music_DancingHall: ; 0xef9bc
	db $80
	dw _Music_DancingHall_Ch1
	db $01
	dw _Music_DancingHall_Ch2
	db $02
	dw _Music_DancingHall_Ch3
; 0xef9c5

; 0xef9c5
	db $03
; 0xef9c6

_Music_DancingHall_Ch1: ; 0xef9c6
	tempo $d000
	volume $77
	stereopanning $0f
	notetype $06, $b7
	note $02
	dutycycle $00
	notetype $0c, $b7
	callchannel _Music_DancingHall_sub_0xefa17
	note $0f
	callchannel _Music_DancingHall_sub_0xefa17
	note $0f
	note $0f
	note $0f
	intensity $b1
	octave2
	note $c0
	octave3
	note $30
	note $60
	note $a0
	note $c0
	note $a0
	note $c0
	octave4
	note $30
	note $61
	notetype $08, $b1
	note $30
	note $50
	note $30
	octave3
	note $c2
	note $a2
	notetype $0c, $b1
	note $c0
	note $a0
	note $30
	note $50
	octave4
	note $61
	notetype $08, $b1
	octave3
	note $c0
	octave4
	note $30
	octave3
	note $c0
	notetype $0c, $b5
	note $a0
	note $00
	note $c0
	note $c0
	note $a0
	note $00
	note $61
	loopchannel $00, $79d3 ; end
; 0xefa17

_Music_DancingHall_sub_0xefa17: ; 0xefa17
; subroutine
	octave3
	note $c0
	note $00
	note $a0
	note $00
	note $c0
	note $00
	note $a0
	note $00
	octave4
	note $50
	note $00
	note $30
	note $00
	octave3
	note $c0
	note $00
	octave4
	note $30
	note $00
	endchannel ; end
; 0xefa2c

_Music_DancingHall_Ch2: ; 0xefa2c
	stereopanning $f0
	notetype $06, $a1
	dutycycle $00
	vibrato $10, $24
	note $02
	notetype $06, $a2
	callchannel _Music_DancingHall_sub_0xefa7a
	callchannel _Music_DancingHall_sub_0xefa7a
	intensity $a7
	octave2
	note $3f
	note $6f
	notetype $0c, $a7
	note $5f
	octave3
	note $60
	note $a0
	note $c0
	octave4
	note $30
	note $50
	note $30
	note $50
	note $a0
	note $c1
	notetype $08, $a7
	note $a0
	note $c0
	note $a0
	note $62
	note $32
	notetype $0c, $a7
	note $50
	note $30
	octave3
	note $a0
	note $c0
	octave4
	note $a1
	notetype $08, $a7
	note $60
	note $a0
	note $60
	notetype $0c, $a7
	note $50
	note $00
	note $60
	note $60
	note $50
	note $00
	note $31
	loopchannel $00, $7a37 ; end
; 0xefa7a

_Music_DancingHall_sub_0xefa7a: ; 0xefa7a
; subroutine
	intensity $a1
	octave4
	note $53
	octave2
	note $53
	octave4
	note $53
	octave2
	note $53
	octave4
	note $c3
	note $a3
	note $63
	note $a3
	intensity $33
	note $30
	note $60
	intensity $63
	note $30
	note $60
	intensity $93
	note $30
	note $60
	intensity $c3
	note $30
	note $60
	intensity $e3
	note $30
	note $60
	intensity $a3
	note $30
	note $60
	intensity $83
	note $30
	note $60
	intensity $53
	note $30
	note $60
	intensity $73
	octave3
	note $c0
	octave4
	note $50
	intensity $a3
	octave3
	note $c0
	octave4
	note $50
	intensity $b3
	octave3
	note $a0
	octave4
	note $30
	intensity $c3
	octave3
	note $a0
	octave4
	note $30
	intensity $d3
	octave3
	note $50
	note $c0
	intensity $e3
	note $50
	note $c0
	intensity $f3
	note $a0
	octave4
	note $30
	intensity $f3
	octave3
	note $a0
	octave4
	note $30
	endchannel ; end
; 0xefad6

_Music_DancingHall_Ch3: ; 0xefad6
	stereopanning $ff
	vibrato $16, $24
	notetype $06, $10
	octave5
	note $a0
	note $c0
	octave6
	note $30
	note $5c
	note $30
	note $50
	note $a0
	note $cf
	intensity $14
	octave3
	note $6f
	note $5d
	intensity $10
	octave6
	note $50
	note $60
	note $5c
	note $30
	note $50
	note $a0
	note $cf
	intensity $14
	octave3
	note $6f
	note $5f
	intensity $13
	octave4
	note $61
	note $a1
	note $c1
	octave5
	note $31
	note $51
	note $31
	note $51
	note $a1
	note $b0
	note $c2
	notetype $08, $13
	note $a0
	note $c0
	note $a0
	note $62
	note $32
	notetype $0c, $13
	note $50
	note $30
	octave4
	note $a0
	note $c0
	octave5
	note $a1
	notetype $08, $13
	note $60
	note $a0
	note $60
	notetype $06, $13
	note $40
	note $52
	note $33
	octave4
	note $c3
	octave5
	note $33
	intensity $14
	octave3
	note $3f
	note $6f
	note $5f
	note $5c
	intensity $10
	octave5
	note $a0
	note $c0
	octave6
	note $30
	loopchannel $00, $7ae3 ; end
; 0xefb3e
