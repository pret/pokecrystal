_Music_CrystalOpening: ; 0x1786e8
	db $c0
	dw _Music_CrystalOpening_Ch1
	db $01
	dw _Music_CrystalOpening_Ch2
	db $02
	dw _Music_CrystalOpening_Ch3
	db $03
	dw _Music_CrystalOpening_Ch4
; 0x1786f4

_Music_CrystalOpening_Ch1: ; 0x1786f4
	tempo $8800
	volume $77
	tone $0200
	vibrato $10, $34
	dutycycle $03
	stereopanning $f0
	notetype $0c, $92
	octave2
	note $71
	note $73
	note $71
	note $71
	note $73
	note $71
	note $71
	note $73
	note $71
	note $71
	note $75
	notetype $0c, $b4
	octave2
	note $c1
	note $71
	note $51
	note $c1
	octave3
	note $21
	octave2
	note $91
	note $71
	octave3
	note $21
	octave2
	note $71
	note $21
	octave1
	note $c1
	octave2
	note $71
	octave3
	note $71
	octave2
	note $71
	note $c1
	octave3
	note $51
	note $71
	note $51
	octave2
	note $c1
	note $71
	note $c1
	octave3
	note $51
	note $71
	note $51
	octave2
	note $c1
	note $71
	note $c1
	octave3
	note $51
	octave2
	note $37
	octave3
	note $31
	octave2
	note $a1
	note $81
	octave3
	note $31
	note $51
	octave2
	note $c1
	note $a1
	octave3
	note $51
	octave2
	note $a1
	note $51
	note $31
	note $a1
	octave3
	note $a1
	octave2
	note $a1
	octave3
	note $31
	note $51
	note $a1
	note $51
	note $31
	octave2
	note $a1
	octave3
	note $31
	note $51
	note $a1
	note $51
	octave4
	note $11
	octave3
	note $81
	note $71
	octave4
	note $11
	notetype $0c, $a0
	note $37
	note $37
	notetype $0c, $a7
	note $37
	notetype $0c, $b2
	octave2
	note $3f
	endchannel ; end
; 0x17877a

_Music_CrystalOpening_Ch2: ; 0x17877a
	notetype $0c, $a2
	dutycycle $03
	vibrato $08, $44
	octave2
	note $c1
	note $c3
	note $c1
	note $c1
	note $c3
	note $c1
	note $c1
	note $c3
	note $c1
	note $c1
	note $c1
	notetype $0c, $a2
	octave2
	note $50
	note $c0
	octave3
	note $50
	note $70
	notetype $0c, $c7
	note $57
	note $77
	octave2
	note $c7
	notetype $0c, $b0
	octave3
	note $c7
	notetype $0c, $c7
	note $cf
	note $0f
	note $87
	note $a7
	note $37
	notetype $0c, $c7
	octave4
	note $37
	notetype $0c, $7c
	note $37
	notetype $0c, $c7
	note $37
	note $87
	notetype $0c, $b0
	note $77
	note $77
	notetype $0c, $c7
	note $77
	notetype $0c, $c2
	octave3
	note $3f
	endchannel ; end
; 0x1787c8

_Music_CrystalOpening_Ch3: ; 0x1787c8
	notetype $0c, $16
	octave1
	note $c3
	notetype $06, $16
	note $c0
	note $b0
	note $a0
	note $90
	note $80
	note $70
	note $60
	note $50
	notetype $0c, $16
	note $c3
	note $c3
	note $c3
	notetype $06, $16
	note $c0
	note $b0
	note $a0
	note $90
	note $80
	note $70
	note $60
	note $50
	notetype $0c, $16
	note $c3
	note $c3
	octave2
	note $c7
	note $77
	note $47
	note $c3
	note $73
	note $c3
	octave3
	note $53
	note $73
	note $53
	note $33
	note $23
	octave2
	note $a7
	octave3
	note $37
	octave2
	note $a7
	note $77
	octave3
	note $33
	note $53
	note $73
	note $53
	note $33
	note $23
	note $17
	note $37
	note $3f
	octave2
	note $30
	note $0e
	endchannel ; end
; 0x178810

_Music_CrystalOpening_Ch4: ; 0x178810
	stereopanning $0f
	togglenoise $03
	notetype $0c
	note $0f
	note $0b
	octave2
	note $20
	note $20
	note $20
	note $20
	note $33
	notetype $08
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $35
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $32
	notetype $0c
	note $20
	note $20
	note $80
	note $80
	note $20
	note $20
	note $21
	note $20
	note $20
	note $81
	note $30
	note $20
	note $a0
	note $80
	note $30
	note $30
	note $80
	note $00
	note $20
	note $20
	note $a0
	note $80
	note $20
	note $30
	note $80
	note $80
	note $30
	note $30
	note $a1
	note $21
	note $21
	note $21
	note $a1
	note $31
	note $20
	note $20
	note $20
	note $20
	note $33
	note $20
	note $20
	note $20
	note $20
	note $33
	note $20
	note $20
	note $20
	note $20
	note $a0
	note $80
	note $30
	note $20
	note $80
	note $80
	note $20
	note $20
	note $a0
	note $80
	note $30
	note $20
	note $80
	note $80
	note $30
	note $20
	note $a0
	note $80
	note $20
	note $20
	note $30
	note $20
	note $20
	note $30
	note $a0
	note $80
	note $30
	note $20
	note $20
	note $80
	note $30
	note $20
	note $21
	note $31
	note $01
	note $31
	note $31
	note $05
	note $0f
	note $0f
	endchannel ; end
; 0x178889
