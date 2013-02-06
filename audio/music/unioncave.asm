_Music_UnionCave: ; 0xf5c60
	db $c0
	dw _Music_UnionCave_Ch1
	db $01
	dw _Music_UnionCave_Ch2
	db $02
	dw _Music_UnionCave_Ch3
	db $03
	dw _Music_UnionCave_Ch4
; 0xf5c6c

_Music_UnionCave_Ch1: ; 0xf5c6c
	tempo $a000
	volume $77
	dutycycle $01
	tone $0200
	vibrato $18, $34
	stereopanning $0f
	notetype $0c, $b3
	callchannel _Music_UnionCave_sub_0xf5ccf
	loopchannel $04, $5c7e
	octave2
	note $91
	octave3
	note $21
	note $53
	note $21
	note $51
	note $63
	loopchannel $08, $5c85
	octave2
	note $a1
	octave3
	note $31
	note $63
	note $31
	note $61
	note $73
	loopchannel $04, $5c91
	note $03
	intensity $80
	note $6f
	note $7f
	note $8f
	note $7f
	note $87
	note $77
	note $67
	note $57
	note $87
	note $77
	octave4
	note $17
	octave3
	note $a7
	intensity $95
	tone $0400
	callchannel _Music_UnionCave_sub_0xf5ccf
	tone $0800
	callchannel _Music_UnionCave_sub_0xf5ccf
	tone $0c00
	callchannel _Music_UnionCave_sub_0xf5ccf
	tone $1000
	callchannel _Music_UnionCave_sub_0xf5ccf
	tone $0200
	loopchannel $00, $5c7b ; end
; 0xf5ccf

_Music_UnionCave_sub_0xf5ccf: ; 0xf5ccf
; subroutine
	octave2
	note $91
	octave3
	note $21
	note $5b
	endchannel ; end
; 0xf5cd5

_Music_UnionCave_Ch2: ; 0xf5cd5
	dutycycle $03
	vibrato $08, $24
	notetype $0c, $c4
	callchannel _Music_UnionCave_sub_0xf5d34
	intensity $c5
	callchannel _Music_UnionCave_sub_0xf5d34
	intensity $c7
	callchannel _Music_UnionCave_sub_0xf5d34
	intensity $c4
	note $23
	octave3
	note $c3
	octave4
	note $31
	note $51
	note $21
	octave3
	note $c1
	octave4
	note $23
	octave3
	note $c3
	octave4
	note $37
	octave3
	note $c3
	octave4
	note $33
	note $71
	note $61
	note $21
	octave3
	note $c1
	octave4
	note $27
	note $33
	note $23
	note $03
	intensity $a0
	note $1f
	note $2f
	note $3f
	note $2f
	note $5f
	note $4f
	note $bf
	note $af
	intensity $a5
	vibrato $06, $44
	callchannel _Music_UnionCave_sub_0xf5d52
	vibrato $04, $33
	callchannel _Music_UnionCave_sub_0xf5d52
	vibrato $02, $22
	callchannel _Music_UnionCave_sub_0xf5d52
	vibrato $01, $41
	callchannel _Music_UnionCave_sub_0xf5d52
	vibrato $08, $24
	loopchannel $00, $5cda ; end
; 0xf5d34

_Music_UnionCave_sub_0xf5d34: ; 0xf5d34
; subroutine
	octave4
	note $13
	octave3
	note $b3
	octave4
	note $21
	note $41
	note $11
	octave3
	note $b1
	octave4
	note $13
	octave3
	note $b3
	octave4
	note $27
	octave3
	note $b3
	octave4
	note $23
	note $61
	note $51
	note $11
	octave3
	note $b1
	octave4
	note $17
	note $23
	note $13
	endchannel ; end
; 0xf5d52

_Music_UnionCave_sub_0xf5d52: ; 0xf5d52
; subroutine
	octave2
	note $91
	octave3
	note $21
	note $5b
	endchannel ; end
; 0xf5d58

_Music_UnionCave_Ch3: ; 0xf5d58
	notetype $0c, $16
	stereopanning $f0
	note $0f
	loopchannel $07, $5d5d
	note $0d
	octave4
	note $11
	note $01
	octave3
	note $51
	note $01
	note $51
	note $91
	note $51
	note $01
	octave4
	note $11
	loopchannel $04, $5d65
	note $01
	octave3
	note $61
	note $01
	note $61
	note $a1
	note $61
	note $01
	octave4
	note $21
	loopchannel $04, $5d73
	note $03
	note $17
	octave3
	note $c7
	note $b7
	note $a7
	octave4
	note $27
	note $17
	octave3
	note $c7
	note $b7
	note $a3
	note $83
	note $b1
	octave4
	note $11
	octave3
	note $a1
	note $81
	loopchannel $03, $5d8d
	note $a3
	note $83
	note $b7
	note $0f
	loopchannel $04, $5d9c
	loopchannel $00, $5d5d ; end
; 0xf5da5

_Music_UnionCave_Ch4: ; 0xf5da5
	togglenoise $01
	notetype $0c
	stereopanning $f0
	note $53
	stereopanning $ff
	note $63
	stereopanning $0f
	note $93
	note $07
	stereopanning $0f
	note $53
	stereopanning $ff
	note $63
	stereopanning $f0
	note $93
	note $07
	loopchannel $00, $5da9 ; end
; 0xf5dc1

; 0xf5dc1
	loopchannel $00, $5da9
; 0xf5dc5