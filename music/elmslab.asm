_Music_ElmsLab: ; 0xea040
	db $c0
	dw _Music_ElmsLab_Ch1
	db $01
	dw _Music_ElmsLab_Ch2
	db $02
	dw _Music_ElmsLab_Ch3
	db $03
	dw _Music_ElmsLab_Ch4
; 0xea04c

_Music_ElmsLab_Ch1: ; 0xea04c
	tempo $9000
	volume $77
	dutycycle $03
	tone $0100
	vibrato $10, $15
	stereopanning $f0
	notetype $0c, $b2
	octave2
	note $61
	note $81
	note $a1
	note $c1
	intensity $b6
	octave3
	note $17
	intensity $b2
	octave2
	note $b1
	note $a1
	note $81
	octave3
	note $17
	note $63
	note $63
	note $67
	note $a3
	note $a3
	note $a1
	note $01
	note $a1
	note $91
	note $a1
	intensity $b7
	octave4
	note $13
	intensity $b5
	octave3
	note $c1
	octave4
	note $11
	intensity $b4
	note $67
	intensity $b5
	octave3
	note $a1
	note $91
	note $a1
	note $61
	intensity $b7
	note $67
	intensity $b5
	note $a1
	note $81
	note $61
	intensity $b2
	note $83
	intensity $b5
	note $a1
	note $91
	note $a1
	intensity $b7
	note $63
	intensity $b5
	note $13
	intensity $b7
	note $37
	intensity $b4
	note $61
	note $51
	note $31
	note $61
	intensity $b7
	note $57
	intensity $b4
	note $81
	note $61
	note $51
	note $81
	intensity $b7
	note $67
	intensity $b4
	note $81
	note $a1
	note $b1
	note $a1
	intensity $b2
	note $83
	intensity $b4
	note $61
	note $a1
	note $81
	note $61
	note $51
	intensity $b2
	note $85
	intensity $b7
	note $63
	octave4
	note $11
	octave3
	note $63
	note $31
	note $b3
	note $a3
	intensity $b4
	note $81
	note $61
	note $81
	intensity $b2
	note $a5
	intensity $b7
	note $53
	note $b1
	note $55
	intensity $b3
	note $61
	note $51
	note $61
	note $81
	note $a1
	note $a1
	note $81
	intensity $b2
	note $55
	intensity $b4
	note $63
	octave4
	note $13
	octave3
	note $61
	octave4
	note $11
	note $31
	note $11
	octave3
	note $b1
	note $a1
	intensity $b7
	note $b7
	octave4
	note $53
	note $33
	note $13
	octave3
	note $b3
	octave4
	note $13
	note $33
	note $43
	note $53
	intensity $b4
	octave3
	note $a1
	note $61
	octave4
	note $11
	octave3
	note $61
	note $a1
	note $61
	octave4
	note $11
	octave3
	note $61
	note $a1
	note $61
	octave4
	note $11
	octave3
	note $61
	note $a1
	intensity $b2
	note $61
	note $63
	loopchannel $00, $6075 ; end
; 0xea128

_Music_ElmsLab_Ch2: ; 0xea128
	dutycycle $03
	vibrato $10, $26
	stereopanning $0f
	notetype $0c, $c3
	octave4
	note $61
	note $51
	note $31
	octave3
	note $c1
	intensity $c5
	octave4
	note $17
	intensity $c3
	octave3
	note $b1
	note $a1
	note $81
	note $51
	intensity $c2
	note $65
	octave4
	note $13
	note $13
	note $17
	note $13
	note $13
	note $11
	stereopanning $ff
	intensity $c6
	octave4
	note $65
	intensity $c2
	note $51
	note $61
	note $51
	note $61
	note $81
	intensity $c7
	note $a5
	intensity $c2
	note $61
	intensity $c7
	note $17
	intensity $c7
	note $35
	intensity $c3
	note $21
	note $31
	note $21
	note $31
	note $51
	intensity $c7
	note $65
	intensity $c3
	note $11
	intensity $c7
	octave3
	note $a9
	intensity $c3
	note $b1
	note $b1
	octave4
	note $31
	intensity $c5
	note $13
	octave3
	note $b5
	intensity $c3
	octave4
	note $11
	note $11
	note $51
	intensity $c4
	note $33
	note $15
	intensity $c2
	note $31
	note $31
	note $61
	note $81
	note $61
	note $51
	note $61
	intensity $c2
	note $83
	intensity $c6
	note $13
	note $33
	intensity $c4
	note $55
	intensity $c3
	note $61
	note $61
	note $81
	intensity $c7
	note $a3
	intensity $c3
	note $81
	note $71
	note $81
	note $71
	note $80
	note $61
	intensity $c7
	note $3a
	intensity $c3
	note $51
	note $51
	note $61
	intensity $c7
	note $83
	intensity $c3
	note $61
	note $51
	note $61
	note $81
	note $60
	note $31
	intensity $c7
	note $1a
	intensity $c4
	note $61
	note $61
	note $81
	intensity $c7
	note $a3
	intensity $c4
	note $81
	note $61
	note $b1
	note $a1
	note $b0
	octave5
	note $11
	note $34
	intensity $c3
	note $51
	note $31
	intensity $c7
	note $13
	octave4
	note $b3
	note $a3
	note $83
	octave5
	note $13
	octave4
	note $b3
	note $a3
	note $83
	intensity $b0
	note $67
	intensity $a0
	note $67
	intensity $a7
	note $69
	intensity $c2
	note $11
	note $61
	intensity $c4
	octave3
	note $51
	loopchannel $00, $614f ; end
; 0xea1fd

_Music_ElmsLab_Ch3: ; 0xea1fd
	stereopanning $0f
	notetype $0c, $25
	note $07
	note $0d
	octave3
	note $11
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $11
	note $31
	note $51
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $51
	octave4
	note $11
	octave3
	note $31
	note $a1
	octave2
	note $a1
	octave3
	note $a1
	note $31
	note $a1
	note $31
	note $51
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $11
	note $31
	note $51
	note $61
	note $b1
	note $31
	note $b1
	note $61
	note $b1
	note $31
	note $b1
	note $81
	octave4
	note $11
	octave3
	note $51
	octave4
	note $11
	octave3
	note $81
	octave4
	note $11
	octave3
	note $51
	note $a1
	note $b1
	octave4
	note $31
	octave3
	note $61
	octave4
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $61
	note $c1
	octave4
	note $11
	note $01
	note $13
	octave3
	note $b3
	note $83
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $81
	note $b1
	note $31
	note $b1
	note $81
	note $b1
	note $31
	note $a1
	note $51
	note $81
	note $11
	note $81
	note $51
	note $81
	note $11
	note $81
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $81
	note $51
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $81
	note $b1
	note $31
	note $b1
	note $81
	note $b1
	note $a1
	note $81
	note $13
	note $33
	note $53
	note $83
	note $53
	note $63
	note $73
	note $83
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $a1
	note $11
	note $a1
	note $61
	note $11
	note $61
	note $a1
	loopchannel $00, $6216 ; end
; 0xea2b1

_Music_ElmsLab_Ch4: ; 0xea2b1
	stereopanning $f0
	togglenoise $00
	notetype $0c
	note $0f
	note $01
	note $83
	loopchannel $00, $62b9 ; end
; 0xea2be
