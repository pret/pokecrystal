_Music_ProfOak: ; 0xf4dea
	db $80
	dw _Music_ProfOak_Ch1
	db $01
	dw _Music_ProfOak_Ch2
	db $02
	dw _Music_ProfOak_Ch3
; 0xf4df3

_Music_ProfOak_Ch1: ; 0xf4df3
	tempo $7600
	volume $77
	vibrato $12, $34
	tone $0100
	stereopanning $f0
	dutycycle $03
	notetype $0c, $98
	octave2
	note $70
	note $c0
	octave3
	note $40
	note $70
	note $af
	note $97
	intensity $97
	note $97
	intensity $91
	callchannel _Music_ProfOak_sub_0xf4e42
	callchannel _Music_ProfOak_sub_0xf4e42
	callchannel _Music_ProfOak_sub_0xf4e4d
	callchannel _Music_ProfOak_sub_0xf4e4d
	loopchannel $02, $4e10
	callchannel _Music_ProfOak_sub_0xf4e58
	callchannel _Music_ProfOak_sub_0xf4e58
	callchannel _Music_ProfOak_sub_0xf4e6c
	callchannel _Music_ProfOak_sub_0xf4e6c
	forceoctave $02
	callchannel _Music_ProfOak_sub_0xf4e58
	callchannel _Music_ProfOak_sub_0xf4e58
	forceoctave $00
	callchannel _Music_ProfOak_sub_0xf4e6c
	callchannel _Music_ProfOak_sub_0xf4e6c
	loopchannel $00, $4e22 ; end
; 0xf4e42

_Music_ProfOak_sub_0xf4e42: ; 0xf4e42
; subroutine
	octave2
	note $c1
	octave3
	note $51
	note $91
	note $51
	note $c1
	note $51
	note $91
	note $51
	endchannel ; end
; 0xf4e4d

_Music_ProfOak_sub_0xf4e4d: ; 0xf4e4d
; subroutine
	octave2
	note $c1
	octave3
	note $41
	note $71
	note $41
	note $c1
	note $41
	note $71
	note $41
	endchannel ; end
; 0xf4e58

_Music_ProfOak_sub_0xf4e58: ; 0xf4e58
; subroutine
	octave2
	note $a1
	octave3
	note $21
	note $51
	note $20
	note $50
	note $21
	intensity $92
	note $a1
	intensity $91
	note $21
	intensity $92
	note $51
	intensity $91
	endchannel ; end
; 0xf4e6c

_Music_ProfOak_sub_0xf4e6c: ; 0xf4e6c
; subroutine
	octave2
	note $c0
	octave3
	note $50
	intensity $92
	note $93
	note $53
	intensity $91
	note $50
	note $90
	intensity $92
	note $c3
	intensity $91
	endchannel ; end
; 0xf4e7e

_Music_ProfOak_Ch2: ; 0xf4e7e
	vibrato $12, $34
	dutycycle $03
	notetype $0c, $a8
	octave3
	note $c0
	octave4
	note $40
	note $70
	note $b0
	note $cf
	intensity $a7
	note $c9
	dutycycle $02
	intensity $b2
	octave3
	note $c1
	octave4
	note $21
	note $41
	note $53
	note $41
	note $23
	intensity $91
	note $c1
	octave5
	note $21
	note $41
	note $53
	note $41
	note $23
	intensity $b2
	octave3
	note $c1
	note $a1
	note $91
	note $a3
	note $c0
	note $00
	note $c3
	intensity $91
	octave4
	note $c1
	note $a1
	note $91
	note $a3
	note $c1
	note $c3
	loopchannel $02, $4e92
	note $05
	intensity $b4
	note $25
	octave3
	note $a0
	octave4
	note $20
	note $55
	note $20
	note $50
	note $73
	note $53
	note $43
	note $23
	octave3
	note $c5
	note $90
	note $c0
	octave4
	note $57
	intensity $82
	note $c5
	note $90
	note $c0
	intensity $83
	octave5
	note $57
	intensity $b4
	octave3
	note $a5
	note $70
	note $a0
	octave4
	note $47
	note $53
	note $43
	note $23
	note $13
	octave3
	note $c5
	note $90
	note $c0
	octave4
	note $55
	octave3
	note $c0
	octave4
	note $50
	note $9f
	loopchannel $00, $4ebf ; end
; 0xf4ef5

_Music_ProfOak_Ch3: ; 0xf4ef5
	stereopanning $0f
	notetype $0c, $14
	note $03
	octave3
	note $51
	note $01
	octave4
	note $50
	note $00
	octave3
	note $a1
	note $01
	octave2
	note $c1
	octave3
	note $c0
	note $00
	note $51
	callchannel _Music_ProfOak_sub_0xf4f3d
	callchannel _Music_ProfOak_sub_0xf4f3d
	callchannel _Music_ProfOak_sub_0xf4f3d
	callchannel _Music_ProfOak_sub_0xf4f4c
	callchannel _Music_ProfOak_sub_0xf4f4c
	loopchannel $02, $4f0d
	callchannel _Music_ProfOak_sub_0xf4f5a
	callchannel _Music_ProfOak_sub_0xf4f5a
	callchannel _Music_ProfOak_sub_0xf4f69
	callchannel _Music_ProfOak_sub_0xf4f69
	forceoctave $02
	callchannel _Music_ProfOak_sub_0xf4f5a
	callchannel _Music_ProfOak_sub_0xf4f5a
	forceoctave $00
	callchannel _Music_ProfOak_sub_0xf4f69
	callchannel _Music_ProfOak_sub_0xf4f69
	loopchannel $00, $4f1d ; end
; 0xf4f3d

_Music_ProfOak_sub_0xf4f3d: ; 0xf4f3d
; subroutine
	note $51
	note $01
	octave4
	note $50
	note $00
	octave3
	note $91
	note $01
	octave2
	note $c1
	octave3
	note $c0
	note $00
	note $51
	endchannel ; end
; 0xf4f4c

_Music_ProfOak_sub_0xf4f4c: ; 0xf4f4c
; subroutine
	octave2
	note $c1
	note $01
	octave4
	note $40
	note $00
	octave3
	note $41
	note $01
	note $71
	note $c0
	note $00
	note $41
	endchannel ; end
; 0xf4f5a

_Music_ProfOak_sub_0xf4f5a: ; 0xf4f5a
; subroutine
	octave2
	note $a1
	note $01
	octave3
	note $a0
	note $00
	octave2
	note $a1
	note $01
	octave3
	note $51
	note $a0
	note $00
	note $21
	endchannel ; end
; 0xf4f69

_Music_ProfOak_sub_0xf4f69: ; 0xf4f69
; subroutine
	octave2
	note $91
	note $01
	octave3
	note $90
	note $00
	octave2
	note $91
	note $01
	octave3
	note $51
	note $90
	note $00
	octave2
	note $c1
	endchannel ; end
; 0xf4f79
