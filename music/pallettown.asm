_Music_PalletTown: ; 0xf4b0c
	db $80
	dw _Music_PalletTown_Ch1
	db $01
	dw _Music_PalletTown_Ch2
	db $02
	dw _Music_PalletTown_Ch3
; 0xf4b15

_Music_PalletTown_Ch1: ; 0xf4b15
	tempo $bc00
	volume $77
	vibrato $12, $24
	tone $0100
	stereopanning $0f
	dutycycle $02
	notetype $0c, $78
	octave3
	note $cb
	note $a0
	note $30
	note $70
	note $a0
	note $cb
	note $40
	note $80
	note $c0
	octave4
	note $40
	note $53
	note $33
	note $13
	octave3
	note $a3
	intensity $77
	note $87
	intensity $78
	note $73
	note $a3
	note $cb
	note $a0
	note $30
	note $70
	note $a0
	note $81
	note $c1
	octave4
	note $51
	note $83
	note $71
	note $81
	note $a1
	note $51
	note $31
	note $11
	note $51
	note $71
	note $51
	note $31
	note $11
	octave3
	note $c7
	intensity $77
	note $c7
	dutycycle $03
	intensity $92
	note $81
	note $51
	note $81
	note $51
	note $81
	note $41
	note $81
	note $41
	intensity $5f
	note $80
	note $a0
	note $c0
	octave4
	note $10
	note $31
	note $83
	note $31
	note $11
	octave3
	note $c1
	loopchannel $02, $4b59
	intensity $3f
	octave4
	note $13
	octave3
	note $c3
	note $a3
	note $83
	note $73
	note $33
	note $53
	intensity $72
	note $10
	note $50
	note $80
	octave4
	note $10
	note $30
	note $a0
	octave5
	note $31
	intensity $62
	note $31
	intensity $22
	note $31
	intensity $2f
	octave3
	note $33
	note $53
	note $85
	note $a0
	note $80
	intensity $1f
	note $77
	loopchannel $00, $4b22 ; end
; 0xf4ba1

_Music_PalletTown_Ch2: ; 0xf4ba1
	vibrato $12, $44
	dutycycle $02
	stereopanning $f0
	notetype $0c, $88
	octave1
	note $81
	note $c1
	octave2
	note $31
	note $85
	note $73
	octave1
	note $81
	note $c1
	octave2
	note $31
	note $85
	octave1
	note $c3
	octave2
	note $11
	octave1
	note $81
	note $c1
	octave2
	note $13
	note $31
	note $51
	note $71
	note $81
	note $31
	note $03
	note $33
	note $73
	octave1
	note $81
	note $c1
	octave2
	note $31
	note $85
	note $73
	note $51
	note $31
	note $51
	octave1
	note $c3
	octave2
	note $31
	note $51
	note $71
	note $87
	note $a7
	note $81
	note $31
	note $81
	octave3
	note $33
	octave2
	note $c1
	octave3
	note $11
	note $31
	intensity $a2
	octave3
	note $51
	octave2
	note $11
	octave3
	note $51
	octave2
	note $11
	octave3
	note $41
	octave2
	note $11
	octave3
	note $41
	octave2
	note $11
	intensity $93
	note $85
	note $80
	note $82
	note $31
	note $83
	loopchannel $02, $4be5
	note $11
	octave3
	note $53
	octave2
	note $10
	octave3
	note $12
	octave2
	note $11
	note $51
	note $11
	note $31
	octave3
	note $33
	octave2
	note $30
	note $82
	note $51
	note $81
	note $51
	intensity $1f
	note $73
	intensity $88
	note $73
	note $c3
	note $83
	note $a1
	note $31
	note $81
	note $33
	note $11
	octave1
	note $c1
	note $a1
	loopchannel $00, $4ba8 ; end
; 0xf4c2a

_Music_PalletTown_Ch3: ; 0xf4c2a
	vibrato $14, $24
	notetype $0c, $10
	octave6
	note $31
	note $11
	octave5
	note $c1
	note $a1
	octave6
	note $81
	note $51
	note $71
	note $51
	note $35
	octave5
	note $c1
	note $80
	note $00
	note $80
	note $00
	note $a0
	note $00
	note $c0
	note $00
	octave6
	note $17
	note $01
	octave5
	note $71
	note $81
	note $a1
	note $c5
	octave6
	note $10
	octave5
	note $c0
	note $a7
	octave6
	note $31
	note $11
	octave5
	note $c1
	octave6
	note $31
	note $80
	note $00
	note $70
	note $00
	note $70
	note $00
	note $80
	note $00
	note $55
	note $30
	note $00
	note $37
	note $11
	octave5
	note $c1
	note $a1
	note $81
	octave6
	note $31
	note $11
	octave5
	note $c1
	note $a1
	note $87
	note $01
	note $81
	note $a1
	note $c1
	octave6
	note $17
	note $35
	note $11
	octave5
	note $c7
	note $01
	note $81
	note $a1
	note $c1
	octave6
	note $11
	note $01
	note $13
	note $35
	note $10
	note $30
	octave5
	note $c7
	note $01
	note $c1
	note $a1
	note $81
	note $a7
	note $53
	note $c3
	note $a7
	note $83
	note $53
	note $76
	note $00
	note $82
	note $00
	note $c2
	note $00
	note $c7
	note $a7
	loopchannel $00, $4c2d ; end
; 0xf4c9f
