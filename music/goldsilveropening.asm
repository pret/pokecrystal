_Music_GoldSilverOpening: ; 0xf7055
	db $80
	dw _Music_GoldSilverOpening_Ch1
	db $01
	dw _Music_GoldSilverOpening_Ch2
	db $02
	dw _Music_GoldSilverOpening_Ch3
; 0xf705e

_Music_GoldSilverOpening_Ch1: ; 0xf705e
	tempo $0001
	volume $77
	tone $0100
	dutycycle $02
	stereopanning $f0
	notetype $0c, $b7
	octave1
	note $9f
	note $9f
	tempo $a800
	dutycycle $03
	notetype $06, $c7
	octave3
	note $6b
	note $a3
	octave4
	note $1b
	octave3
	note $c1
	note $b1
	note $8b
	note $b3
	octave4
	note $4b
	note $31
	note $21
	notetype $06, $b5
	note $17
	octave3
	note $67
	note $a7
	note $c3
	octave4
	note $13
	notetype $06, $b3
	octave3
	note $b7
	note $27
	octave2
	note $77
	octave1
	note $c7
	notetype $06, $b2
	note $03
	octave3
	note $b3
	note $b7
	note $93
	note $97
	note $83
	note $87
	note $73
	note $77
	octave2
	note $a3
	note $a7
	note $93
	note $97
	note $83
	note $87
	note $73
	note $a7
	note $a3
	note $a7
	note $95
	note $95
	note $73
	note $83
	note $63
	notetype $08, $b3
	octave4
	note $60
	note $80
	note $a0
	note $b0
	note $c0
	octave5
	note $10
	dutycycle $02
	notetype $0c, $b3
	note $30
	note $20
	note $33
	note $a0
	note $90
	note $a3
	octave4
	note $b1
	octave5
	note $31
	note $61
	note $85
	note $41
	note $31
	note $11
	note $43
	note $71
	dutycycle $03
	notetype $08, $92
	note $a0
	note $60
	note $40
	note $10
	octave4
	note $a0
	note $80
	note $60
	note $40
	note $10
	octave3
	note $a2
	notetype $0c, $b2
	note $b1
	note $c1
	octave4
	note $11
	note $31
	note $41
	intensity $c2
	note $61
	note $81
	note $af
	endchannel ; end
; 0xf70f8

_Music_GoldSilverOpening_Ch2: ; 0xf70f8
	tone $0100
	stereopanning $0f
	notetype $0c, $b7
	dutycycle $02
	octave2
	note $1f
	note $1f
	dutycycle $03
	notetype $0c, $b2
	note $01
	notetype $06, $62
	octave1
	note $61
	note $a1
	octave2
	note $11
	note $51
	note $61
	note $a1
	octave3
	note $11
	note $51
	note $61
	note $a1
	octave4
	note $11
	note $51
	note $61
	note $a1
	octave5
	note $11
	note $51
	octave1
	note $41
	note $81
	note $b1
	octave2
	note $31
	note $41
	note $81
	note $b1
	octave3
	note $31
	note $41
	note $81
	note $b1
	octave4
	note $31
	note $41
	note $81
	notetype $0c, $b7
	octave1
	note $6f
	intensity $83
	octave4
	note $61
	intensity $81
	note $31
	intensity $93
	note $91
	intensity $91
	note $61
	intensity $a3
	octave5
	note $21
	intensity $a1
	octave4
	note $b1
	intensity $b3
	octave5
	note $71
	intensity $c1
	note $41
	intensity $b3
	octave1
	note $b1
	notetype $06, $b2
	octave4
	note $33
	note $33
	octave1
	note $63
	octave4
	note $33
	note $33
	octave2
	note $13
	octave4
	note $43
	note $43
	octave1
	note $63
	octave4
	note $43
	note $43
	octave1
	note $b3
	octave3
	note $33
	note $33
	octave1
	note $c3
	octave3
	note $33
	note $33
	octave2
	note $13
	octave3
	note $43
	note $43
	octave1
	note $c3
	octave3
	note $43
	note $73
	octave1
	note $b3
	octave3
	note $33
	note $33
	octave1
	note $c3
	octave3
	note $35
	note $31
	octave2
	note $13
	octave3
	note $43
	note $4f
	octave2
	note $41
	octave3
	note $83
	note $83
	note $81
	octave2
	note $43
	octave3
	note $73
	note $73
	octave2
	note $31
	octave3
	note $63
	note $63
	note $61
	octave2
	note $83
	octave3
	note $c3
	note $c3
	octave2
	note $13
	octave3
	note $43
	note $43
	octave2
	note $13
	octave3
	note $43
	note $4f
	notetype $06, $a2
	note $63
	note $83
	note $93
	notetype $06, $c2
	note $a3
	note $b3
	octave4
	note $13
	notetype $06, $d2
	octave3
	note $a3
	octave4
	note $13
	note $4f
	endchannel ; end
; 0xf71c8

_Music_GoldSilverOpening_Ch3: ; 0xf71c8
	notetype $06, $10
	octave2
	note $33
	notetype $06, $20
	note $33
	notetype $06, $30
	note $33
	note $0b
	note $07
	notetype $06, $10
	octave2
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave3
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave4
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave5
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave6
	note $30
	note $00
	octave2
	note $60
	note $00
	note $a0
	note $00
	octave3
	note $10
	note $00
	note $50
	note $00
	note $60
	note $00
	note $a0
	note $00
	octave4
	note $10
	note $00
	note $50
	note $00
	note $60
	note $00
	note $a0
	note $00
	octave5
	note $10
	note $00
	note $50
	note $00
	note $60
	note $00
	note $a0
	note $00
	octave6
	note $10
	note $00
	note $50
	note $00
	octave2
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave3
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave4
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave5
	note $30
	note $00
	note $40
	note $00
	note $80
	note $00
	note $b0
	note $00
	octave6
	note $30
	note $00
	notetype $08, $10
	note $60
	octave5
	note $c0
	note $a0
	note $c0
	note $a0
	note $60
	note $a0
	note $60
	octave4
	note $c0
	octave5
	note $60
	octave4
	note $c0
	note $a0
	note $c0
	note $a0
	note $60
	note $a0
	note $60
	octave3
	note $c0
	octave4
	note $60
	octave3
	note $c0
	note $a0
	note $c0
	note $a0
	note $60
	octave5
	note $a2
	notetype $0c, $10
	note $80
	note $00
	octave6
	note $11
	octave5
	note $b0
	note $00
	octave6
	note $61
	note $40
	note $00
	note $b1
	note $90
	note $00
	note $0f
	note $03
	notetype $06, $10
	octave2
	note $80
	note $02
	note $a1
	note $01
	octave5
	note $6b
	note $33
	note $35
	note $61
	note $4b
	note $91
	note $01
	note $75
	note $41
	note $6b
	note $31
	note $01
	note $45
	note $61
	note $81
	note $01
	note $71
	note $01
	note $81
	note $01
	note $a3
	note $43
	note $61
	note $01
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $10
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $10
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $10
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $b0
	note $00
	octave5
	note $10
	note $00
	note $30
	note $00
	note $60
	note $00
	note $30
	note $00
	note $60
	note $00
	note $80
	note $00
	note $b0
	note $00
	note $80
	note $00
	note $b0
	note $00
	note $80
	note $00
	note $b0
	note $00
	note $70
	note $00
	note $b0
	note $00
	note $70
	note $00
	note $b0
	note $00
	note $70
	note $00
	note $b0
	note $08
	notetype $0c, $10
	note $0d
	octave3
	note $61
	note $40
	note $00
	note $10
	note $0c
	endchannel ; end
; 0xf7308
