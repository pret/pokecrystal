_Music_Route37: ; 0xee94b
	db $c0
	dw _Music_Route37_Ch1
	db $01
	dw _Music_Route37_Ch2
	db $02
	dw _Music_Route37_Ch3
	db $03
	dw _Music_Route37_Ch4
; 0xee957

_Music_Route37_Ch1: ; 0xee957
	tempo $9000
	volume $77
	dutycycle $03
	tone $0200
	vibrato $10, $22
	notetype $0c, $b3
	note $0f
	note $0f
	intensity $b3
	note $01
	octave2
	note $71
	note $c1
	octave3
	note $51
	intensity $b7
	note $49
	intensity $b3
	note $53
	note $43
	note $23
	octave2
	note $c1
	octave3
	note $42
	octave2
	note $c0
	intensity $b7
	note $77
	note $c7
	octave3
	note $cb
	intensity $b3
	note $01
	octave2
	note $71
	note $c1
	octave3
	note $51
	intensity $b7
	note $49
	octave2
	note $a3
	octave3
	note $23
	note $53
	note $a1
	note $72
	note $a0
	note $c5
	octave2
	note $c1
	octave3
	note $41
	note $71
	note $c1
	note $a3
	note $73
	note $51
	note $43
	stereopanning $0f
	callchannel _Music_Route37_sub_0xee9da
	octave3
	note $23
	loopchannel $02, $69a5
	callchannel _Music_Route37_sub_0xee9e9
	octave3
	note $73
	callchannel _Music_Route37_sub_0xee9e9
	octave3
	note $73
	callchannel _Music_Route37_sub_0xee9da
	octave3
	note $53
	callchannel _Music_Route37_sub_0xee9da
	octave3
	note $93
	callchannel _Music_Route37_sub_0xee9e9
	octave4
	note $43
	callchannel _Music_Route37_sub_0xee9e9
	octave3
	note $63
	stereopanning $ff
	callchannel _Music_Route37_sub_0xee9e9
	note $03
	callchannel _Music_Route37_sub_0xee9e9
	note $03
	loopchannel $00, $6969 ; end
; 0xee9da

_Music_Route37_sub_0xee9da: ; 0xee9da
; subroutine
	intensity $c2
	octave2
	note $a1
	note $a0
	note $a0
	note $a1
	note $a0
	note $a0
	note $a0
	note $a0
	note $a1
	intensity $b7
	endchannel ; end
; 0xee9e9

_Music_Route37_sub_0xee9e9: ; 0xee9e9
; subroutine
	intensity $c2
	octave2
	note $c1
	note $c0
	note $c0
	note $c1
	note $c0
	note $c0
	note $c0
	note $c0
	note $c1
	intensity $b7
	endchannel ; end
; 0xee9f8

_Music_Route37_Ch2: ; 0xee9f8
	dutycycle $03
	vibrato $1c, $12
	notetype $0c, $c2
	octave2
	note $c1
	notetype $0c, $c1
	note $c0
	note $c0
	intensity $c2
	note $c1
	intensity $c1
	note $c0
	note $c0
	note $c0
	note $c0
	intensity $c2
	note $c5
	note $c1
	intensity $c1
	note $c0
	note $c0
	intensity $c2
	note $c1
	intensity $c1
	note $c0
	note $c0
	note $c0
	note $c0
	intensity $c2
	note $c1
	callchannel _Music_Route37_sub_0xeeab7
	intensity $c6
	octave4
	note $23
	octave3
	note $c3
	note $a3
	note $53
	intensity $b0
	note $77
	intensity $b7
	note $77
	intensity $c7
	note $4b
	callchannel _Music_Route37_sub_0xeeab7
	intensity $c7
	octave4
	note $23
	octave3
	note $c3
	octave4
	note $23
	note $53
	intensity $b0
	note $4f
	intensity $b0
	note $47
	intensity $b7
	note $47
	intensity $c4
	note $03
	octave3
	note $a2
	octave4
	note $50
	note $a3
	note $93
	intensity $a0
	note $25
	note $45
	note $53
	intensity $c3
	note $72
	note $50
	intensity $b0
	note $45
	intensity $b7
	note $45
	intensity $c3
	octave3
	note $c2
	note $70
	intensity $b0
	octave4
	note $45
	intensity $b7
	octave4
	note $45
	intensity $c4
	note $03
	octave3
	note $a2
	octave4
	note $50
	note $a3
	note $93
	intensity $b0
	note $25
	note $45
	note $53
	intensity $c3
	note $72
	note $40
	intensity $b0
	note $c5
	intensity $b7
	note $c5
	intensity $c3
	note $c2
	note $70
	intensity $b0
	octave5
	note $45
	intensity $b7
	octave5
	note $45
	intensity $c2
	octave3
	note $71
	note $70
	note $70
	note $71
	intensity $c1
	note $70
	note $70
	note $70
	note $70
	intensity $c2
	note $75
	note $71
	note $70
	note $70
	note $71
	intensity $c1
	note $70
	note $70
	note $70
	note $70
	intensity $c2
	note $71
	loopchannel $00, $6a24 ; end
; 0xeeab7

_Music_Route37_sub_0xeeab7: ; 0xeeab7
; subroutine
	intensity $c7
	octave3
	note $73
	intensity $b0
	note $c4
	intensity $b7
	note $c4
	intensity $c3
	note $71
	note $71
	note $c1
	endchannel ; end
; 0xeeac7

_Music_Route37_Ch3: ; 0xeeac7
	stereopanning $f0
	notetype $0c, $14
	octave2
	note $71
	note $05
	loopchannel $04, $6acc
	callchannel _Music_Route37_sub_0xeeb32
	note $a1
	octave3
	note $21
	octave2
	note $91
	note $c1
	note $71
	note $a1
	note $71
	note $51
	note $41
	note $71
	loopchannel $04, $6ae0
	callchannel _Music_Route37_sub_0xeeb32
	callchannel _Music_Route37_sub_0xeeb32
	note $a1
	octave3
	note $21
	octave2
	note $91
	note $c1
	note $71
	note $a1
	octave3
	note $21
	octave2
	note $a1
	callchannel _Music_Route37_sub_0xeeb32
	octave2
	note $c1
	octave3
	note $41
	loopchannel $04, $6afb
	octave2
	note $a1
	octave3
	note $21
	loopchannel $07, $6b03
	note $51
	note $21
	callchannel _Music_Route37_sub_0xeeb3c
	octave2
	note $c1
	octave3
	note $71
	loopchannel $04, $6b10
	octave2
	note $a1
	octave3
	note $21
	loopchannel $07, $6b18
	note $51
	note $21
	callchannel _Music_Route37_sub_0xeeb3c
	callchannel _Music_Route37_sub_0xeeb32
	note $71
	note $05
	loopchannel $04, $6b28
	loopchannel $00, $6ad3 ; end
; 0xeeb32

_Music_Route37_sub_0xeeb32: ; 0xeeb32
; subroutine
	octave2
	note $71
	note $c1
	note $71
	note $c1
	note $71
	note $c1
	note $71
	note $c1
	endchannel ; end
; 0xeeb3c

_Music_Route37_sub_0xeeb3c: ; 0xeeb3c
; subroutine
	octave2
	note $c1
	octave3
	note $41
	octave2
	note $c1
	octave3
	note $41
	octave2
	note $c1
	octave3
	note $41
	octave2
	note $c1
	octave3
	note $41
	endchannel ; end
; 0xeeb4d

_Music_Route37_Ch4: ; 0xeeb4d
	stereopanning $0f
	togglenoise $00
	notetype $0c
	callchannel _Music_Route37_sub_0xeeb6b
	note $30
	note $40
	note $40
	note $30
	callchannel _Music_Route37_sub_0xeeb6b
	notetype $06
	note $40
	note $40
	note $40
	note $40
	note $40
	note $30
	note $30
	note $30
	loopchannel $00, $6b51 ; end
; 0xeeb6b

_Music_Route37_sub_0xeeb6b: ; 0xeeb6b
; subroutine
	note $31
	note $40
	note $40
	note $31
	note $40
	note $40
	note $31
	note $40
	note $40
	endchannel ; end
; 0xeeb75
