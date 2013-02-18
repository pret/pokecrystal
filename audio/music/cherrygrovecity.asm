_Music_CherrygroveCity: ; 0xf5b03
	db $c0
	dw _Music_CherrygroveCity_Ch1
	db $01
	dw _Music_CherrygroveCity_Ch2
	db $02
	dw _Music_CherrygroveCity_Ch3
	db $03
	dw _Music_CherrygroveCity_Ch4
; 0xf5b0f

_Music_CherrygroveCity_Ch1: ; 0xf5b0f
	tempo $9800
	volume $77
	dutycycle $03
	tone $0100
	vibrato $08, $15
	stereopanning $f0
	notetype $0c, $b5
	note $09
	octave3
	note $11
	note $31
	note $51
	note $a3
	note $91
	note $a1
	note $b1
	note $a1
	note $81
	note $61
	note $a5
	note $61
	note $11
	octave2
	note $b1
	octave3
	note $11
	note $51
	note $83
	note $71
	note $81
	note $a1
	note $81
	note $61
	note $51
	note $85
	note $51
	note $11
	octave2
	note $b1
	note $a1
	octave3
	note $11
	intensity $b7
	octave2
	note $b5
	octave3
	note $35
	note $b3
	note $a5
	note $61
	note $17
	octave2
	note $b5
	octave3
	note $35
	intensity $b5
	note $a3
	note $83
	note $53
	note $33
	note $53
	octave2
	note $b5
	octave3
	note $35
	note $b3
	note $a5
	note $61
	note $13
	octave2
	note $c3
	note $b5
	octave3
	note $21
	octave2
	note $b3
	note $83
	note $a3
	octave3
	note $13
	octave2
	note $a3
	octave3
	note $13
	loopchannel $00, $5b26 ; end
; 0xf5b74

_Music_CherrygroveCity_Ch2: ; 0xf5b74
	dutycycle $03
	vibrato $10, $36
	stereopanning $0f
	notetype $0c, $c3
	octave3
	note $11
	note $31
	note $51
	note $31
	note $51
	note $81
	note $a1
	note $b1
	intensity $c6
	octave4
	note $15
	note $33
	intensity $b3
	note $31
	note $11
	octave3
	note $b1
	intensity $c7
	octave4
	note $15
	octave3
	note $a1
	note $67
	intensity $c6
	note $b5
	octave4
	note $13
	intensity $b3
	note $11
	octave3
	note $b1
	note $a1
	intensity $c7
	note $b5
	note $81
	note $57
	intensity $a0
	note $35
	note $65
	octave4
	note $33
	note $15
	intensity $a5
	octave3
	note $a1
	intensity $c7
	note $67
	intensity $a0
	note $35
	note $65
	octave4
	note $33
	intensity $c7
	note $1f
	intensity $b5
	octave3
	note $35
	note $65
	octave4
	note $33
	note $15
	octave3
	note $a1
	note $67
	note $25
	note $65
	note $83
	intensity $a0
	note $67
	intensity $a7
	note $67
	loopchannel $00, $5b87 ; end
; 0xf5bd8

_Music_CherrygroveCity_Ch3: ; 0xf5bd8
	notetype $0c, $16
	note $03
	octave4
	note $11
	octave3
	note $b1
	note $a1
	note $81
	note $61
	note $51
	note $a1
	note $61
	note $a1
	octave4
	note $13
	octave3
	note $61
	note $81
	note $a1
	note $a1
	note $61
	note $a1
	octave4
	note $13
	octave3
	note $61
	note $81
	note $a1
	note $b1
	note $81
	note $b1
	octave4
	note $13
	octave3
	note $61
	note $81
	note $a1
	note $b3
	octave4
	note $11
	octave3
	note $b1
	note $a1
	note $81
	note $61
	note $51
	note $31
	note $63
	note $b1
	note $61
	note $b1
	note $a1
	note $81
	note $61
	note $a3
	note $61
	note $a1
	note $61
	note $51
	note $41
	note $31
	note $63
	note $b1
	note $61
	note $b1
	note $a1
	note $81
	note $51
	note $81
	note $b1
	octave4
	note $11
	octave3
	note $b1
	note $a1
	note $81
	note $61
	note $31
	note $63
	note $b1
	note $61
	note $b1
	note $a1
	note $81
	note $61
	note $a3
	note $61
	note $a1
	note $61
	note $51
	note $41
	note $21
	note $63
	note $b1
	note $61
	note $b1
	note $a1
	note $81
	note $61
	note $a1
	note $61
	note $a1
	note $61
	note $a1
	note $61
	note $a1
	loopchannel $00, $5be4 ; end
; 0xf5c48

_Music_CherrygroveCity_Ch4: ; 0xf5c48
	togglenoise $03
	notetype $0c
	note $0f
	note $21
	note $01
	note $81
	note $21
	note $21
	note $71
	note $23
	note $21
	note $01
	note $81
	note $20
	note $20
	note $73
	note $21
	note $81
	loopchannel $00, $5c4d ; end
; 0xf5c60
