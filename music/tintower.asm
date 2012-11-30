_Music_TinTower: ; 0xf6811
	db $c0
	dw _Music_TinTower_Ch1
	db $01
	dw _Music_TinTower_Ch2
	db $02
	dw _Music_TinTower_Ch3
	db $03
	dw _Music_TinTower_Ch4
; 0xf681d

_Music_TinTower_Ch1: ; 0xf681d
	tempo $d000
	volume $77
	dutycycle $03
	tone $0400
	vibrato $08, $45
	stereopanning $f0
	notetype $0c, $a5
	octave3
	note $83
	note $13
	note $97
	note $83
	note $13
	octave2
	note $b1
	octave3
	note $11
	note $21
	octave2
	note $b1
	octave3
	note $83
	note $13
	note $93
	note $63
	note $83
	octave2
	note $83
	octave3
	note $85
	note $b1
	note $81
	note $61
	note $21
	note $81
	note $97
	note $83
	octave4
	note $13
	octave3
	note $91
	note $81
	note $61
	note $91
	note $81
	note $21
	octave2
	note $b1
	octave3
	note $81
	note $93
	note $63
	note $83
	octave2
	note $83
	octave3
	note $87
	intensity $a2
	octave2
	note $83
	note $8b
	note $83
	note $87
	intensity $a7
	note $83
	intensity $a2
	note $93
	note $97
	intensity $a7
	note $83
	intensity $a2
	note $93
	note $97
	intensity $a7
	note $b3
	intensity $a2
	note $83
	note $8b
	note $83
	note $8b
	note $83
	note $8b
	note $83
	note $87
	intensity $a5
	octave3
	note $b3
	loopchannel $00, $682a ; end
; 0xf688b

_Music_TinTower_Ch2: ; 0xf688b
	dutycycle $03
	tone $0200
	vibrato $18, $44
	stereopanning $ff
	notetype $0c, $b5
	octave4
	note $13
	note $13
	note $21
	note $11
	octave3
	note $b1
	octave4
	note $21
	note $13
	note $63
	note $23
	octave3
	note $b3
	octave4
	note $13
	note $13
	note $21
	note $11
	octave3
	note $b1
	octave4
	note $21
	note $13
	octave3
	note $13
	octave4
	note $17
	stereopanning $0f
	loopchannel $02, $6895
	intensity $b2
	octave3
	note $13
	note $1b
	note $13
	note $17
	intensity $b7
	note $13
	intensity $b2
	note $23
	note $27
	intensity $b7
	note $13
	intensity $b2
	note $23
	note $27
	intensity $b7
	note $43
	intensity $90
	stereopanning $ff
	note $83
	octave4
	note $13
	octave3
	note $b1
	note $91
	note $81
	note $91
	note $83
	note $13
	note $87
	note $83
	octave4
	note $13
	octave3
	note $b1
	octave4
	note $11
	note $21
	octave3
	note $b1
	octave4
	note $13
	octave3
	note $13
	octave4
	note $15
	intensity $95
	note $21
	loopchannel $00, $6893 ; end
; 0xf68f8

_Music_TinTower_Ch3: ; 0xf68f8
	notetype $0c, $14
	note $0f
	note $0f
	note $0f
	note $09
	octave2
	note $81
	note $91
	note $b1
	octave3
	note $17
	note $27
	note $57
	octave2
	note $b1
	octave3
	note $11
	note $21
	note $41
	note $17
	note $27
	note $57
	octave4
	note $17
	octave3
	note $10
	note $02
	note $10
	note $0a
	note $10
	note $02
	note $10
	note $06
	note $13
	note $20
	note $02
	note $20
	note $06
	note $13
	note $20
	note $02
	note $20
	note $06
	note $43
	stereopanning $0f
	note $10
	note $02
	note $10
	note $0a
	note $10
	note $02
	note $10
	note $02
	stereopanning $ff
	octave2
	note $b1
	octave3
	note $11
	note $21
	note $41
	stereopanning $0f
	note $10
	note $02
	note $10
	note $0a
	note $10
	note $02
	note $10
	note $0a
	stereopanning $ff
	loopchannel $00, $68fb ; end
; 0xf6948

_Music_TinTower_Ch4: ; 0xf6948
	togglenoise $00
	notetype $0c
	stereopanning $0f
	note $81
	stereopanning $f0
	note $80
	note $80
	stereopanning $0f
	note $81
	stereopanning $f0
	note $63
	stereopanning $0f
	note $81
	note $81
	note $61
	stereopanning $f0
	note $81
	stereopanning $0f
	note $80
	note $80
	stereopanning $f0
	note $81
	stereopanning $0f
	note $63
	stereopanning $f0
	note $81
	note $81
	note $61
	loopchannel $00, $694c ; end
; 0xf6974
