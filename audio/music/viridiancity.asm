_Music_ViridianCity: ; 0xf4000
	db $c0
	dw _Music_ViridianCity_Ch1
	db $01
	dw _Music_ViridianCity_Ch2
	db $02
	dw _Music_ViridianCity_Ch3
	db $03
	dw _Music_ViridianCity_Ch4
; 0xf400c

_Music_ViridianCity_Ch1: ; 0xf400c
	tempo $9d00
	volume $77
	stereopanning $0f
	dutycycle $02
	vibrato $12, $34
	notetype $0c, $a7
	octave3
	note $70
	note $02
	note $71
	note $03
	note $71
	note $01
	note $70
	note $00
	note $73
	note $01
	octave4
	note $31
	note $01
	octave3
	note $a1
	note $01
	note $70
	note $00
	note $70
	note $02
	note $71
	note $03
	note $71
	note $01
	note $80
	note $00
	note $03
	note $87
	note $03
	callchannel _Music_ViridianCity_sub_0xf40c5
	note $03
	callchannel _Music_ViridianCity_sub_0xf40c5
	octave4
	note $13
	callchannel _Music_ViridianCity_sub_0xf410f
	octave4
	note $c1
	note $81
	note $31
	octave3
	note $c1
	note $71
	note $51
	note $70
	note $00
	note $a0
	note $02
	note $71
	note $a0
	note $00
	octave4
	note $20
	note $00
	note $01
	octave3
	note $a0
	note $00
	octave4
	note $20
	note $00
	note $70
	note $00
	intensity $87
	octave5
	note $73
	note $63
	intensity $a7
	octave3
	note $85
	note $c7
	octave4
	note $51
	note $01
	note $51
	octave3
	note $c3
	note $81
	note $71
	note $53
	note $31
	octave2
	note $a1
	octave3
	note $30
	note $00
	note $70
	note $02
	note $31
	note $70
	note $00
	note $a0
	note $00
	note $01
	note $71
	note $a0
	note $00
	octave4
	note $10
	note $00
	note $41
	note $11
	octave3
	note $c1
	note $a1
	callchannel _Music_ViridianCity_sub_0xf410f
	octave4
	note $a1
	note $81
	note $31
	note $81
	octave3
	note $71
	note $51
	note $70
	note $00
	note $a0
	note $02
	note $71
	note $a0
	note $00
	octave4
	note $10
	note $00
	note $01
	note $51
	note $01
	note $11
	note $01
	octave3
	note $a1
	note $01
	note $71
	note $85
	note $c0
	note $00
	octave4
	note $53
	note $71
	note $85
	note $51
	note $01
	octave3
	note $81
	octave4
	note $51
	note $01
	note $75
	note $33
	octave3
	note $a3
	note $73
	note $80
	note $02
	note $87
	note $b3
	loopchannel $00, $4039 ; end
; 0xf40c5

_Music_ViridianCity_sub_0xf40c5: ; 0xf40c5
; subroutine
	octave3
	note $a0
	note $02
	note $a1
	note $03
	note $a1
	note $01
	note $a0
	note $00
	octave4
	note $13
	note $01
	octave3
	note $a1
	note $01
	octave4
	note $11
	octave3
	note $a0
	note $00
	octave4
	note $10
	note $00
	octave3
	note $c0
	note $02
	note $81
	note $03
	note $81
	note $01
	octave4
	note $31
	note $01
	octave3
	note $c1
	note $01
	note $80
	note $00
	note $83
	note $01
	note $c0
	note $00
	octave4
	note $30
	note $02
	note $31
	note $03
	note $31
	note $01
	note $30
	note $00
	octave3
	note $83
	note $01
	octave4
	note $20
	note $00
	note $50
	note $00
	note $33
	note $20
	note $00
	octave3
	note $a0
	note $02
	note $71
	note $03
	note $71
	note $01
	note $80
	note $00
	note $03
	note $87
	endchannel ; end
; 0xf410f

_Music_ViridianCity_sub_0xf410f: ; 0xf410f
; subroutine
	octave3
	note $c1
	note $31
	note $80
	note $00
	note $c0
	note $02
	note $81
	note $c0
	note $00
	octave4
	note $30
	note $00
	note $01
	octave3
	note $c1
	octave4
	note $30
	note $00
	note $80
	note $00
	endchannel ; end
; 0xf4125

_Music_ViridianCity_Ch2: ; 0xf4125
	vibrato $10, $46
	dutycycle $01
	notetype $0c, $b7
	stereopanning $f0
	octave2
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $03
	note $33
	note $01
	note $a0
	note $00
	note $a0
	note $00
	octave3
	note $23
	octave2
	note $a0
	note $00
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $01
	note $50
	note $00
	note $03
	note $57
	note $03
	callchannel _Music_ViridianCity_sub_0xf41c0
	note $03
	callchannel _Music_ViridianCity_sub_0xf41c0
	octave2
	note $73
	callchannel _Music_ViridianCity_sub_0xf4201
	note $83
	note $01
	octave3
	note $30
	note $00
	octave2
	note $80
	note $00
	octave3
	note $33
	octave2
	note $c1
	callchannel _Music_ViridianCity_sub_0xf420b
	note $01
	note $71
	note $01
	octave3
	note $20
	note $00
	note $23
	note $13
	callchannel _Music_ViridianCity_sub_0xf4215
	note $53
	note $01
	note $c0
	note $00
	note $51
	note $c1
	note $83
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $11
	note $21
	note $01
	note $41
	note $a0
	note $00
	octave3
	note $10
	note $00
	note $41
	note $11
	octave2
	note $a1
	note $71
	callchannel _Music_ViridianCity_sub_0xf4201
	note $83
	note $01
	note $c0
	note $00
	note $80
	note $00
	note $c3
	note $81
	callchannel _Music_ViridianCity_sub_0xf420b
	note $01
	note $71
	note $01
	note $a1
	note $01
	octave3
	note $11
	note $01
	octave2
	note $41
	callchannel _Music_ViridianCity_sub_0xf4215
	note $53
	note $01
	note $b0
	note $00
	note $b3
	note $01
	note $80
	note $00
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $01
	note $30
	note $00
	note $50
	note $02
	note $57
	octave1
	note $a3
	loopchannel $00, $414c ; end
; 0xf41c0

_Music_ViridianCity_sub_0xf41c0: ; 0xf41c0
; subroutine
	octave2
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $03
	note $43
	note $01
	note $a0
	note $00
	note $a0
	note $00
	octave3
	note $13
	octave2
	note $a0
	note $00
	note $53
	note $01
	note $c0
	note $00
	note $c3
	note $03
	note $53
	note $01
	note $c0
	note $00
	note $c0
	note $00
	octave3
	note $33
	octave2
	note $c0
	note $00
	note $83
	note $01
	octave3
	note $30
	note $00
	note $33
	note $03
	octave2
	note $a3
	note $01
	octave3
	note $50
	note $00
	note $50
	note $00
	note $83
	note $50
	note $00
	octave2
	note $33
	note $01
	note $a0
	note $00
	note $a3
	note $01
	note $50
	note $00
	note $03
	note $57
	endchannel ; end
; 0xf4201

_Music_ViridianCity_sub_0xf4201: ; 0xf4201
; subroutine
	note $83
	note $01
	octave3
	note $30
	note $00
	note $33
	octave2
	note $61
	note $71
	endchannel ; end
; 0xf420b

_Music_ViridianCity_sub_0xf420b: ; 0xf420b
; subroutine
	note $73
	note $01
	octave3
	note $20
	note $00
	note $23
	octave2
	note $51
	note $61
	endchannel ; end
; 0xf4215

_Music_ViridianCity_sub_0xf4215: ; 0xf4215
; subroutine
	octave2
	note $53
	note $01
	note $c0
	note $00
	note $c3
	note $31
	note $41
	endchannel ; end
; 0xf421e

_Music_ViridianCity_Ch3: ; 0xf421e
	vibrato $12, $24
	notetype $0c, $13
	stereopanning $ff
	octave4
	note $a0
	note $02
	note $a1
	note $03
	note $a1
	note $01
	note $a0
	note $00
	note $a3
	note $01
	octave5
	note $71
	note $01
	note $21
	note $01
	octave4
	note $a0
	note $00
	note $a0
	note $02
	note $a1
	note $03
	note $a1
	note $01
	octave5
	note $30
	note $00
	note $03
	note $37
	note $71
	note $81
	intensity $13
	callchannel _Music_ViridianCity_sub_0xf42a2
	octave5
	note $71
	note $81
	callchannel _Music_ViridianCity_sub_0xf42a2
	note $53
	vibrato $18, $25
	intensity $25
	note $cb
	note $83
	octave6
	note $37
	note $51
	note $31
	note $21
	octave5
	note $c1
	note $ab
	note $73
	note $a7
	note $a3
	note $93
	note $59
	note $51
	note $71
	note $81
	note $01
	note $81
	note $73
	note $53
	note $83
	note $7b
	note $33
	note $a3
	note $03
	octave6
	note $17
	octave5
	note $cb
	octave6
	note $21
	note $31
	note $51
	note $01
	note $31
	note $01
	note $21
	note $01
	octave5
	note $c1
	note $01
	note $a9
	note $a1
	note $c1
	octave6
	note $11
	note $01
	octave5
	note $c1
	note $01
	note $a1
	note $01
	note $71
	note $01
	note $8b
	note $81
	note $a1
	note $b5
	note $a1
	note $01
	note $81
	note $b1
	note $01
	note $ad
	note $03
	note $30
	note $02
	note $37
	note $53
	loopchannel $00, $4246 ; end
; 0xf42a2

_Music_ViridianCity_sub_0xf42a2: ; 0xf42a2
; subroutine
	octave5
	note $a1
	note $01
	note $81
	note $01
	note $71
	note $05
	note $01
	note $71
	note $81
	note $a1
	note $01
	note $a1
	note $81
	note $71
	note $81
	note $51
	octave4
	note $c1
	note $03
	note $c1
	note $01
	octave5
	note $81
	note $01
	note $31
	note $01
	octave4
	note $c0
	note $00
	note $c3
	octave5
	note $51
	note $71
	note $81
	note $01
	note $71
	note $01
	note $51
	note $05
	note $01
	note $51
	note $71
	note $81
	note $01
	note $81
	note $71
	note $51
	note $71
	note $31
	octave4
	note $a1
	note $03
	note $a1
	note $01
	octave5
	note $30
	note $00
	note $03
	note $37
	endchannel ; end
; 0xf42df

_Music_ViridianCity_Ch4: ; 0xf42df
	togglenoise $03
	notetype $0c
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf432c
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf432c
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf431d
	callchannel _Music_ViridianCity_sub_0xf432c
	callchannel _Music_ViridianCity_sub_0xf433b
	callchannel _Music_ViridianCity_sub_0xf434b
	callchannel _Music_ViridianCity_sub_0xf433b
	callchannel _Music_ViridianCity_sub_0xf433b
	callchannel _Music_ViridianCity_sub_0xf433b
	callchannel _Music_ViridianCity_sub_0xf434b
	callchannel _Music_ViridianCity_sub_0xf433b
	callchannel _Music_ViridianCity_sub_0xf433b
	loopchannel $00, $42e9 ; end
; 0xf431d

_Music_ViridianCity_sub_0xf431d: ; 0xf431d
; subroutine
	note $51
	note $51
	note $31
	note $53
	note $31
	note $51
	note $71
	note $51
	note $51
	note $33
	note $51
	note $31
	note $51
	note $71
	endchannel ; end
; 0xf432c

_Music_ViridianCity_sub_0xf432c: ; 0xf432c
; subroutine
	note $51
	note $51
	note $31
	note $53
	note $31
	note $51
	note $71
	note $51
	note $51
	note $73
	note $31
	note $31
	note $b1
	note $b1
	endchannel ; end
; 0xf433b

_Music_ViridianCity_sub_0xf433b: ; 0xf433b
; subroutine
	note $41
	note $71
	note $31
	note $41
	note $41
	note $71
	note $33
	note $41
	note $71
	note $31
	note $41
	note $41
	note $71
	note $31
	note $41
	endchannel ; end
; 0xf434b

_Music_ViridianCity_sub_0xf434b: ; 0xf434b
; subroutine
	note $41
	note $71
	note $31
	note $41
	note $41
	note $71
	note $33
	note $41
	note $71
	note $31
	note $41
	note $41
	note $31
	note $31
	note $71
	endchannel ; end
; 0xf435b
