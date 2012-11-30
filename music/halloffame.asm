_Music_HallOfFame: ; 0xf05bf
	db $c0
	dw _Music_HallOfFame_Ch1
	db $01
	dw _Music_HallOfFame_Ch2
	db $02
	dw _Music_HallOfFame_Ch3
	db $03
	dw _Music_HallOfFame_Ch4
; 0xf05cb

_Music_HallOfFame_Ch1: ; 0xf05cb
	tempo $7000
	volume $77
	dutycycle $02
	vibrato $0c, $22
	tone $0100
	stereopanning $f0
	notetype $0c, $93
	note $0f
	note $0f
	note $0f
	note $0b
	octave3
	note $30
	note $50
	note $60
	note $70
	intensity $97
	octave4
	note $17
	intensity $77
	note $17
	intensity $97
	note $57
	intensity $77
	note $57
	intensity $97
	note $77
	intensity $77
	note $77
	intensity $77
	note $67
	intensity $57
	note $67
	loopchannel $03, $45e6
	note $0f
	note $0f
	note $0f
	note $0f
	loopchannel $00, $45e6 ; end
; 0xf060b

_Music_HallOfFame_Ch2: ; 0xf060b
	vibrato $08, $25
	dutycycle $03
	notetype $0c, $c4
	octave3
	note $81
	note $31
	note $81
	note $a9
	note $81
	note $31
	note $81
	octave4
	note $13
	octave3
	note $c3
	note $a1
	note $81
	note $31
	note $81
	note $a9
	note $61
	note $11
	note $61
	note $b3
	note $a3
	note $61
	loopchannel $00, $4610 ; end
; 0xf062e

_Music_HallOfFame_Ch3: ; 0xf062e
	notetype $0c, $28
	octave3
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	octave3
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	octave3
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	note $31
	note $81
	octave3
	note $11
	note $61
	note $11
	note $61
	note $11
	note $61
	note $11
	note $61
	loopchannel $03, $4631
	note $33
	note $83
	note $33
	note $83
	note $53
	note $83
	note $53
	note $83
	note $73
	note $a3
	note $73
	note $a3
	note $53
	note $83
	note $53
	note $83
	loopchannel $00, $462e ; end
; 0xf066d

_Music_HallOfFame_Ch4: ; 0xf066d
	togglenoise $05
	notetype $0c
	note $0f
	note $0f
	note $0f
	note $0f
	notetype $06
	stereopanning $0f
	note $b3
	note $b7
	note $b3
	note $b3
	note $b3
	stereopanning $f0
	note $a1
	note $a1
	note $b1
	note $b1
	note $b3
	note $b3
	note $b7
	note $b3
	note $b3
	stereopanning $0f
	note $b0
	note $b0
	note $a0
	note $a0
	note $b0
	note $b0
	note $b0
	note $b0
	loopchannel $00, $4677 ; end
; 0xf0697
