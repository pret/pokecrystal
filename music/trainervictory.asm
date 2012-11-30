_Music_TrainerVictory: ; 0xebeab
	db $80
	dw _Music_TrainerVictory_Ch1
	db $01
	dw _Music_TrainerVictory_Ch2
	db $02
	dw _Music_TrainerVictory_Ch3
; 0xebeb4

_Music_TrainerVictory_Ch1: ; 0xebeb4
	tempo $7800
	volume $77
	dutycycle $02
	tone $0100
	notetype $08, $b1
	octave4
	note $51
	note $51
	note $51
	note $51
	note $71
	note $81
	intensity $b6
	note $ab
	stereopanning $0f
	intensity $72
	callchannel _Music_TrainerVictory_sub_0xebf11
	intensity $51
	note $21
	note $51
	note $71
	note $a1
	note $c1
	octave4
	note $21
	intensity $72
	octave3
	note $a1
	note $01
	octave4
	note $21
	note $55
	loopchannel $02, $7ecd
	callchannel _Music_TrainerVictory_sub_0xebf11
	note $a1
	note $01
	note $61
	note $a5
	note $b1
	note $01
	note $81
	note $b5
	intensity $72
	octave4
	note $31
	note $21
	octave3
	note $a1
	loopchannel $03, $7ef2
	note $71
	note $a1
	octave4
	note $31
	octave4
	note $21
	octave3
	note $c1
	note $a1
	loopchannel $03, $7f01
	note $51
	note $71
	note $81
	loopchannel $00, $7ecd ; end
; 0xebf11

_Music_TrainerVictory_sub_0xebf11: ; 0xebf11
; subroutine
	octave3
	note $71
	note $01
	note $31
	note $75
	note $81
	note $01
	note $51
	note $85
	endchannel ; end
; 0xebf1b

_Music_TrainerVictory_Ch2: ; 0xebf1b
	vibrato $12, $34
	dutycycle $03
	notetype $08, $d1
	octave4
	note $a1
	note $a1
	note $a1
	note $a1
	note $c1
	octave5
	note $21
	intensity $d6
	note $3b
	stereopanning $f0
	notetype $08, $82
	callchannel _Music_TrainerVictory_sub_0xebf56
	note $71
	note $01
	note $81
	note $a5
	note $51
	note $01
	note $71
	note $85
	loopchannel $02, $7f30
	callchannel _Music_TrainerVictory_sub_0xebf56
	note $61
	note $01
	note $11
	note $65
	note $81
	note $01
	note $31
	note $85
	notetype $0c, $88
	note $7f
	note $5f
	loopchannel $00, $7f30 ; end
; 0xebf56

_Music_TrainerVictory_sub_0xebf56: ; 0xebf56
; subroutine
	octave4
	note $31
	note $01
	octave3
	note $a1
	octave4
	note $35
	note $51
	note $01
	octave3
	note $c1
	octave4
	note $55
	endchannel ; end
; 0xebf64

_Music_TrainerVictory_Ch3: ; 0xebf64
	notetype $08, $25
	octave3
	note $85
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $75
	note $31
	note $21
	octave2
	note $c1
	callchannel _Music_TrainerVictory_sub_0xebfb1
	octave3
	note $21
	note $01
	note $21
	note $a1
	note $71
	note $21
	octave2
	note $a1
	note $01
	octave3
	note $a0
	note $00
	note $a5
	loopchannel $02, $7f74
	callchannel _Music_TrainerVictory_sub_0xebfb1
	octave3
	note $11
	note $01
	note $11
	note $a1
	note $61
	note $11
	note $31
	note $01
	note $31
	octave4
	note $31
	octave3
	note $b1
	note $81
	note $31
	note $71
	note $a1
	octave4
	note $3b
	octave3
	note $a1
	note $71
	note $31
	octave2
	note $a1
	octave3
	note $31
	note $51
	note $ab
	note $81
	note $51
	note $21
	loopchannel $00, $7f74 ; end
; 0xebfb1

_Music_TrainerVictory_sub_0xebfb1: ; 0xebfb1
; subroutine
	octave2
	note $a1
	note $01
	note $a1
	octave3
	note $71
	note $31
	octave2
	note $a1
	note $c1
	note $01
	note $c1
	octave3
	note $81
	note $51
	octave2
	note $c1
	endchannel ; end
; 0xebfc3
