_Music_Route3: ; 0xec2ca
	db $c0
	dw _Music_Route3_Ch1
	db $01
	dw _Music_Route3_Ch2
	db $02
	dw _Music_Route3_Ch3
	db $03
	dw _Music_Route3_Ch4
; 0xec2d6

_Music_Route3_Ch1: ; 0xec2d6
	stereopanning $0f
	tempo $a000
	volume $77
	notetype $0c, $91
	note $09
	dutycycle $00
	vibrato $14, $06
	octave3
	note $20
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $20
	note $50
	note $20
	note $50
	note $a0
	note $60
	note $30
	note $60
	note $30
	note $60
	note $30
	note $60
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $70
	note $90
	callchannel _Music_Route3_sub_0xec3a4
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $c0
	octave3
	note $30
	note $a0
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $20
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	note $20
	note $50
	note $20
	note $50
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $c0
	octave3
	note $30
	intensity $6f
	note $80
	note $30
	intensity $77
	octave2
	note $c0
	octave3
	note $30
	note $80
	note $30
	note $50
	note $90
	note $c3
	intensity $6f
	octave3
	note $91
	note $51
	note $a1
	note $91
	note $a1
	note $57
	note $40
	note $50
	note $91
	octave2
	note $c3
	octave3
	note $31
	note $51
	note $91
	note $c1
	note $a0
	note $90
	note $62
	note $52
	note $31
	octave2
	note $a1
	octave3
	note $31
	note $51
	note $61
	intensity $91
	note $70
	note $30
	octave2
	note $a0
	octave3
	note $30
	note $70
	note $a0
	note $70
	note $a0
	note $c0
	note $90
	note $50
	note $90
	note $50
	note $90
	note $c0
	octave4
	note $30
	loopchannel $00, $4307 ; end
; 0xec3a4

_Music_Route3_sub_0xec3a4: ; 0xec3a4
; subroutine
	octave3
	note $a0
	note $50
	note $20
	note $50
	loopchannel $03, $43a4
	note $20
	note $50
	note $20
	note $50
	note $a0
	note $50
	note $20
	note $50
	loopchannel $03, $43b1
	note $20
	note $50
	note $20
	note $50
	note $80
	note $30
	octave2
	note $c0
	octave3
	note $30
	loopchannel $03, $43bd
	octave2
	note $c0
	octave3
	note $30
	octave2
	note $c0
	octave3
	note $30
	endchannel ; end
; 0xec3d0

_Music_Route3_Ch2: ; 0xec3d0
	stereopanning $f0
	notetype $0c, $5e
	dutycycle $02
	vibrato $06, $03
	octave4
	note $50
	note $80
	note $95
	intensity $87
	note $70
	note $90
	note $a0
	note $06
	note $23
	note $53
	note $33
	octave3
	note $c3
	octave4
	note $23
	intensity $a7
	dutycycle $02
	octave3
	note $a0
	octave4
	note $20
	note $50
	note $90
	intensity $7d
	callchannel _Music_Route3_sub_0xec443
	note $80
	note $c9
	intensity $b7
	note $c5
	intensity $7d
	note $03
	dutycycle $03
	note $93
	callchannel _Music_Route3_sub_0xec443
	note $c0
	intensity $7d
	octave5
	note $34
	intensity $b7
	octave5
	note $34
	dutycycle $00
	octave3
	note $30
	note $80
	note $c0
	note $00
	note $80
	note $c0
	octave4
	note $33
	intensity $8f
	dutycycle $02
	octave4
	note $51
	note $31
	note $21
	octave3
	note $c1
	octave4
	note $21
	octave3
	note $a7
	note $90
	note $a0
	note $c1
	note $53
	octave4
	note $57
	note $30
	note $20
	note $32
	note $22
	octave3
	note $a9
	dutycycle $02
	octave4
	note $75
	note $50
	note $70
	note $95
	note $70
	note $90
	loopchannel $00, $43f5 ; end
; 0xec443

_Music_Route3_sub_0xec443: ; 0xec443
; subroutine
	note $a5
	note $50
	note $a0
	octave5
	note $26
	intensity $b7
	octave5
	note $22
	intensity $7d
	octave4
	note $51
	note $a1
	octave5
	note $51
	note $31
	note $21
	octave4
	note $c1
	note $a1
	note $85
	note $30
	endchannel ; end
; 0xec45b

_Music_Route3_Ch3: ; 0xec45b
	stereopanning $ff
	vibrato $06, $03
	notetype $0c, $13
	octave3
	note $c0
	octave4
	note $30
	note $55
	note $30
	octave3
	note $c0
	intensity $14
	octave3
	note $a0
	note $00
	octave2
	note $a1
	note $01
	note $a0
	note $a0
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $91
	callchannel _Music_Route3_sub_0xec4bd
	intensity $14
	callchannel _Music_Route3_sub_0xec4bd
	callchannel _Music_Route3_sub_0xec4bd
	callchannel _Music_Route3_sub_0xec4ce
	callchannel _Music_Route3_sub_0xec4bd
	callchannel _Music_Route3_sub_0xec4bd
	callchannel _Music_Route3_sub_0xec4ce
	note $a1
	octave3
	note $21
	note $51
	note $a5
	note $91
	note $71
	note $51
	note $31
	octave2
	note $c1
	note $91
	note $50
	note $00
	note $51
	note $c1
	octave3
	note $51
	note $65
	note $51
	note $31
	octave2
	note $c1
	octave3
	note $11
	note $21
	note $30
	note $00
	note $31
	note $01
	note $30
	note $30
	note $50
	note $00
	note $51
	note $01
	note $70
	note $90
	loopchannel $00, $447f ; end
; 0xec4bd

_Music_Route3_sub_0xec4bd: ; 0xec4bd
; subroutine
	octave3
	note $a0
	note $00
	octave2
	note $a1
	note $01
	note $a0
	note $a0
	note $a0
	note $00
	note $a0
	note $00
	octave3
	note $a1
	octave2
	note $91
	endchannel ; end
; 0xec4ce

_Music_Route3_sub_0xec4ce: ; 0xec4ce
; subroutine
	octave3
	note $80
	note $00
	octave2
	note $a1
	note $01
	note $a0
	note $a0
	note $a0
	note $00
	note $a0
	note $00
	octave3
	note $31
	note $81
	note $80
	note $00
	octave2
	note $81
	note $01
	note $80
	note $80
	note $50
	note $00
	note $50
	note $00
	note $91
	note $c1
	endchannel ; end
; 0xec4eb

_Music_Route3_Ch4: ; 0xec4eb
	togglenoise $04
	notetype $0c
	note $09
	notetype $0c
	note $31
	note $33
	note $30
	note $30
	note $31
	note $31
	notetype $06
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	loopchannel $00, $44f0 ; end
; 0xec506
