_Music_RocketHideout: ; 0xeeb75
	db $c0
	dw _Music_RocketHideout_Ch1
	db $01
	dw _Music_RocketHideout_Ch2
	db $02
	dw _Music_RocketHideout_Ch3
	db $03
	dw _Music_RocketHideout_Ch4
; 0xeeb81

_Music_RocketHideout_Ch1: ; 0xeeb81
	tempo $9000
	volume $77
	dutycycle $03
	tone $0400
	vibrato $10, $44
	notetype $0c, $b3
	stereopanning $f0
	note $0f
	loopchannel $04, $6b93
	octave2
	note $41
	note $01
	note $b3
	note $a1
	note $05
	note $41
	note $b3
	note $a1
	note $07
	loopchannel $02, $6b98
	octave3
	note $b1
	note $a1
	note $61
	note $71
	octave4
	note $21
	note $11
	note $21
	note $11
	octave3
	note $b1
	note $a1
	note $61
	note $71
	octave4
	note $21
	note $11
	octave3
	note $b1
	note $a1
	note $71
	note $61
	note $41
	note $61
	note $71
	note $b1
	note $71
	note $61
	note $41
	note $61
	note $71
	note $a1
	octave2
	note $b1
	note $c1
	octave3
	note $41
	note $61
	octave4
	note $11
	octave3
	note $c1
	note $81
	note $91
	octave4
	note $41
	note $31
	note $41
	note $31
	note $11
	octave3
	note $c1
	note $81
	note $91
	octave4
	note $41
	note $31
	note $11
	octave3
	note $c1
	note $91
	note $81
	note $61
	note $81
	note $91
	octave4
	note $11
	octave3
	note $91
	note $81
	note $61
	note $81
	note $91
	note $c1
	note $11
	note $21
	note $61
	note $81
	note $0f
	intensity $b7
	octave2
	note $9f
	note $0f
	note $af
	intensity $b3
	note $0f
	loopchannel $04, $6bfe
	loopchannel $00, $6b93 ; end
; 0xeec07

_Music_RocketHideout_Ch2: ; 0xeec07
	dutycycle $03
	tone $0200
	vibrato $00, $f0
	notetype $0c, $c4
	stereopanning $0f
	octave2
	note $41
	note $01
	note $b3
	note $a1
	note $05
	note $41
	note $b3
	note $a1
	note $07
	note $41
	note $01
	note $b3
	note $a1
	note $05
	note $41
	note $b3
	note $a1
	note $07
	octave3
	note $4b
	note $b1
	note $a1
	octave4
	note $27
	note $17
	octave3
	note $bb
	note $a3
	note $77
	note $67
	octave4
	note $4b
	note $b1
	note $a1
	note $77
	note $67
	note $4b
	note $33
	octave3
	note $c7
	note $b7
	octave4
	note $6b
	octave5
	note $11
	octave4
	note $c1
	note $97
	note $87
	note $6b
	note $53
	note $27
	note $17
	octave2
	note $21
	note $01
	note $93
	note $81
	note $05
	intensity $c7
	octave3
	note $2f
	intensity $c4
	octave2
	note $21
	note $01
	note $93
	note $81
	note $05
	intensity $c7
	octave3
	note $2f
	intensity $c4
	octave2
	note $21
	note $01
	note $93
	note $81
	note $05
	note $21
	note $93
	note $81
	note $07
	note $21
	note $01
	note $93
	note $81
	note $05
	note $21
	note $93
	note $81
	note $07
	loopchannel $00, $6c14 ; end
; 0xeec79

_Music_RocketHideout_Ch3: ; 0xeec79
	notetype $0c, $19
	octave2
	note $41
	note $01
	note $b3
	note $a1
	note $05
	note $41
	note $b3
	note $a1
	note $07
	loopchannel $06, $6c7c
	note $61
	note $01
	octave3
	note $13
	octave2
	note $c1
	note $05
	note $61
	octave3
	note $13
	octave2
	note $c1
	note $07
	loopchannel $02, $6c8a
	note $21
	note $01
	note $93
	note $81
	note $05
	octave3
	note $2f
	loopchannel $02, $6c9b
	octave2
	note $21
	note $01
	note $93
	note $81
	note $05
	note $21
	note $93
	note $81
	note $07
	loopchannel $02, $6ca6
	loopchannel $00, $6c7c ; end
; 0xeecb8

_Music_RocketHideout_Ch4: ; 0xeecb8
	togglenoise $00
	notetype $0c
	stereopanning $0f
	note $0f
	note $0f
	note $30
	note $30
	note $40
	note $40
	callchannel _Music_RocketHideout_sub_0xeecdb
	callchannel _Music_RocketHideout_sub_0xeecdb
	note $53
	callchannel _Music_RocketHideout_sub_0xeecdb
	note $63
	callchannel _Music_RocketHideout_sub_0xeecdb
	note $b3
	callchannel _Music_RocketHideout_sub_0xeecdb
	note $73
	loopchannel $00, $6cc7 ; end
; 0xeecdb

_Music_RocketHideout_sub_0xeecdb: ; 0xeecdb
; subroutine
	stereopanning $f0
	note $40
	note $40
	stereopanning $0f
	note $a3
	note $40
	note $40
	stereopanning $f0
	note $a3
	endchannel ; end
; 0xeece8
