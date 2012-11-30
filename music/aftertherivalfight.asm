_Music_AfterTheRivalFight: ; 0xf5127
	db $c0
	dw _Music_AfterTheRivalFight_Ch1
	db $01
	dw _Music_AfterTheRivalFight_Ch2
	db $02
	dw _Music_AfterTheRivalFight_Ch3
	db $03
	dw _Music_AfterTheRivalFight_Ch4
; 0xf5133

_Music_AfterTheRivalFight_Ch1: ; 0xf5133
	tempo $7000
	volume $77
	dutycycle $00
	tone $0100
	vibrato $08, $14
	stereopanning $f0
	notetype $0c, $b2
	octave2
	note $93
	note $93
	intensity $82
	octave3
	note $91
	note $91
	note $91
	note $91
	loopchannel $00, $4fb1 ; end
; 0xf5153

_Music_AfterTheRivalFight_Ch2: ; 0xf5153
	dutycycle $01
	vibrato $06, $35
	stereopanning $0f
	notetype $0c, $c2
	octave4
	note $93
	note $93
	intensity $a2
	note $91
	note $91
	note $91
	note $91
	loopchannel $00, $502e ; end
; 0xf516a

_Music_AfterTheRivalFight_Ch3: ; 0xf516a
	notetype $0c, $28
	octave3
	note $41
	note $01
	note $41
	note $01
	note $91
	note $71
	note $61
	note $41
	loopchannel $00, $509d ; end
; 0xf517a

_Music_AfterTheRivalFight_Ch4: ; 0xf517a
	togglenoise $03
	stereopanning $0f
	notetype $0c
	note $33
	note $33
	note $41
	note $31
	note $31
	note $31
	loopchannel $00, $5118 ; end
; 0xf518a
