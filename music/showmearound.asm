_Music_ShowMeAround: ; 0xedbd8
	db $c0
	dw _Music_ShowMeAround_Ch1
	db $01
	dw _Music_ShowMeAround_Ch2
	db $02
	dw _Music_ShowMeAround_Ch3
	db $03
	dw _Music_ShowMeAround_Ch4
; 0xedbe4

_Music_ShowMeAround_Ch1: ; 0xedbe4
	tempo $9000
	volume $77
	stereopanning $0f
	dutycycle $02
	notetype $0c, $b1
	octave4
	note $c1
	note $a1
	note $91
	note $a1
	note $91
	note $71
	note $51
	note $31
	octave3
	note $c3
	note $90
	note $c0
	octave4
	note $30
	note $50
	note $97
	note $0f
	note $0f
	note $0f
	note $0f
	callchannel _Music_ShowMeAround_sub_0xedc98
	callchannel _Music_ShowMeAround_sub_0xedc15
	callchannel _Music_ShowMeAround_sub_0xedc98
	callchannel _Music_ShowMeAround_sub_0xedc15
	loopchannel $00, $5c01 ; end
; 0xedc15

_Music_ShowMeAround_sub_0xedc15: ; 0xedc15
; subroutine
	note $03
	octave3
	note $20
	note $04
	note $33
	note $10
	note $00
	note $03
	octave2
	note $50
	note $00
	note $90
	note $00
	octave4
	note $50
	note $00
	note $50
	note $00
	note $50
	note $02
	endchannel ; end
; 0xedc2a

_Music_ShowMeAround_Ch2: ; 0xedc2a
	stereopanning $ff
	dutycycle $02
	notetype $0c, $b1
	octave5
	note $51
	note $31
	note $21
	note $31
	note $21
	octave4
	note $c1
	note $a1
	note $91
	note $53
	note $50
	note $90
	note $c0
	octave5
	note $30
	note $57
	dutycycle $01
	callchannel _Music_ShowMeAround_sub_0xedc98
	callchannel _Music_ShowMeAround_sub_0xedc98
	callchannel _Music_ShowMeAround_sub_0xedc86
	note $a3
	octave3
	note $a1
	octave4
	note $21
	note $53
	note $31
	note $21
	octave3
	note $c3
	callchannel _Music_ShowMeAround_sub_0xedc86
	note $a1
	note $a1
	note $91
	note $51
	note $71
	note $91
	note $a1
	note $a1
	note $a3
	callchannel _Music_ShowMeAround_sub_0xedc8e
	note $a3
	octave5
	note $21
	octave4
	note $a1
	note $a3
	note $90
	note $80
	note $70
	note $60
	note $50
	note $00
	note $40
	note $50
	callchannel _Music_ShowMeAround_sub_0xedc8e
	note $a1
	octave5
	note $51
	note $31
	octave4
	note $c1
	note $a1
	note $91
	note $a1
	note $a1
	note $a3
	loopchannel $00, $5c44 ; end
; 0xedc86

_Music_ShowMeAround_sub_0xedc86: ; 0xedc86
; subroutine
	octave3
	note $a1
	octave4
	note $21
	note $53
	note $31
	note $71
	endchannel ; end
; 0xedc8e

_Music_ShowMeAround_sub_0xedc8e: ; 0xedc8e
; subroutine
	octave5
	note $21
	octave4
	note $a1
	note $a3
	octave5
	note $71
	octave4
	note $a1
	endchannel ; end
; 0xedc98

_Music_ShowMeAround_sub_0xedc98: ; 0xedc98
; subroutine
	note $03
	octave3
	note $20
	note $04
	note $33
	note $10
	note $00
	note $01
	note $20
	note $04
	octave2
	note $50
	note $02
	note $b1
	note $c0
	note $00
	endchannel ; end
; 0xedca9

_Music_ShowMeAround_Ch3: ; 0xedca9
	stereopanning $f0
	vibrato $10, $22
	notetype $06, $25
	octave2
	note $c0
	note $02
	octave3
	note $30
	note $02
	note $50
	note $02
	note $90
	note $02
	note $c0
	note $02
	octave4
	note $30
	note $02
	note $50
	note $02
	note $90
	note $02
	note $31
	note $05
	note $31
	octave3
	note $c1
	note $91
	note $c1
	note $51
	note $05
	intensity $14
	octave2
	note $c0
	note $b0
	note $a0
	note $90
	note $80
	note $60
	note $51
	intensity $14
	callchannel _Music_ShowMeAround_sub_0xedcef
	callchannel _Music_ShowMeAround_sub_0xedcef
	callchannel _Music_ShowMeAround_sub_0xedcef
	callchannel _Music_ShowMeAround_sub_0xedd0f
	callchannel _Music_ShowMeAround_sub_0xedcef
	callchannel _Music_ShowMeAround_sub_0xedd0f
	loopchannel $00, $5cd9 ; end
; 0xedcef

_Music_ShowMeAround_sub_0xedcef: ; 0xedcef
; subroutine
	octave2
	note $a1
	note $05
	octave4
	note $51
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave4
	note $77
	note $41
	note $01
	octave2
	note $a1
	note $01
	octave4
	note $51
	note $05
	octave2
	note $a1
	note $01
	octave4
	note $31
	note $05
	note $23
	note $31
	note $01
	endchannel ; end
; 0xedd0f

_Music_ShowMeAround_sub_0xedd0f: ; 0xedd0f
; subroutine
	octave2
	note $a1
	note $05
	octave4
	note $51
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave4
	note $77
	note $41
	note $01
	octave2
	note $91
	note $05
	octave4
	note $31
	note $01
	octave3
	note $c1
	note $01
	note $21
	note $01
	note $51
	note $01
	octave2
	note $a1
	note $05
	endchannel ; end
; 0xedd30

_Music_ShowMeAround_Ch4: ; 0xedd30
	togglenoise $03
	notetype $0c
	note $0f
	note $07
	note $31
	note $41
	note $73
	callchannel _Music_ShowMeAround_sub_0xedd4f
	callchannel _Music_ShowMeAround_sub_0xedd4f
	callchannel _Music_ShowMeAround_sub_0xedd4f
	callchannel _Music_ShowMeAround_sub_0xedd5e
	callchannel _Music_ShowMeAround_sub_0xedd4f
	callchannel _Music_ShowMeAround_sub_0xedd5e
	loopchannel $00, $5d39 ; end
; 0xedd4f

_Music_ShowMeAround_sub_0xedd4f: ; 0xedd4f
; subroutine
	note $41
	note $71
	note $31
	note $81
	note $81
	note $73
	note $31
	note $41
	note $73
	note $31
	note $81
	note $81
	note $31
	note $41
	endchannel ; end
; 0xedd5e

_Music_ShowMeAround_sub_0xedd5e: ; 0xedd5e
; subroutine
	note $41
	note $71
	note $31
	note $81
	note $81
	note $73
	note $31
	note $41
	note $73
	note $31
	note $31
	note $31
	note $31
	note $71
	endchannel ; end
; 0xedd6d
