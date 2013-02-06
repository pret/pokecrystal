_Music_LookLass: ; 0xed79b
	db $c0
	dw _Music_LookLass_Ch1
	db $01
	dw _Music_LookLass_Ch2
	db $02
	dw _Music_LookLass_Ch3
	db $03
	dw _Music_LookLass_Ch4
; 0xed7a7

_Music_LookLass_Ch1: ; 0xed7a7
	tempo $8400
	volume $77
	tone $0100
	dutycycle $02
	notetype $0c, $c7
	octave3
	note $c0
	note $00
	octave4
	note $cd
	stereopanning $0f
	dutycycle $00
	intensity $a2
	octave3
	note $53
	intensity $a1
	note $53
	note $53
	note $51
	intensity $a3
	note $c1
	loopchannel $00, $57bd ; end
; 0xed7cd

_Music_LookLass_Ch2: ; 0xed7cd
	stereopanning $f0
	dutycycle $00
	notetype $0c, $83
	note $0f
	intensity $92
	octave2
	note $c3
	intensity $91
	note $c3
	note $c3
	note $c1
	intensity $93
	octave3
	note $91
	loopchannel $00, $57d5 ; end
; 0xed7e6

_Music_LookLass_Ch3: ; 0xed7e6
	notetype $0c, $10
	note $07
	octave6
	note $51
	note $41
	note $21
	note $11
	octave5
	note $c1
	note $01
	octave6
	note $41
	note $01
	note $51
	note $01
	note $41
	note $01
	note $21
	note $11
	octave5
	note $c1
	note $a1
	note $91
	note $a1
	note $b1
	octave6
	note $21
	octave5
	note $c1
	note $01
	octave6
	note $21
	note $01
	octave5
	note $c1
	note $01
	note $a1
	note $01
	note $91
	note $71
	note $51
	note $41
	note $51
	note $71
	note $91
	note $a1
	loopchannel $00, $57ef ; end
; 0xed81a

_Music_LookLass_Ch4: ; 0xed81a
	togglenoise $04
	notetype $0c
	note $1f
	notetype $06
	note $37
	note $27
	note $27
	note $23
	note $30
	note $20
	note $20
	note $20
	loopchannel $00, $581f ; end
; 0xed82d
