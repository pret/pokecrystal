_Music_NewBarkTown: ; 0xeb2d3
	db $80
	dw _Music_NewBarkTown_Ch1
	db $01
	dw _Music_NewBarkTown_Ch2
	db $02
	dw _Music_NewBarkTown_Ch3
; 0xeb2dc

; 0xeb2dc
	db $03
; 0xeb2dd

_Music_NewBarkTown_Ch1: ; 0xeb2dd
	tempo $bb00
	volume $77
	stereopanning $0f
	vibrato $12, $23
	notetype $0c, $87
	note $03
	dutycycle $00
	callchannel _Music_NewBarkTown_sub_0xeb349
	octave3
	note $20
	note $00
	octave2
	note $a0
	note $00
	octave3
	note $81
	note $71
	dutycycle $02
	intensity $82
	note $50
	note $70
	note $50
	note $30
	note $20
	octave2
	note $c0
	note $a0
	note $80
	dutycycle $00
	intensity $87
	callchannel _Music_NewBarkTown_sub_0xeb349
	octave3
	note $20
	note $00
	octave2
	note $a0
	note $00
	octave3
	note $51
	dutycycle $02
	intensity $82
	note $20
	note $00
	octave2
	note $a0
	octave3
	note $20
	note $50
	note $80
	note $a0
	octave4
	note $20
	note $50
	note $a0
	dutycycle $01
	intensity $5e
	callchannel _Music_NewBarkTown_sub_0xeb37c
	callchannel _Music_NewBarkTown_sub_0xeb37c
	callchannel _Music_NewBarkTown_sub_0xeb37c
	octave2
	note $81
	note $c1
	octave3
	note $31
	note $73
	note $83
	note $31
	octave2
	note $a1
	octave3
	note $21
	note $51
	note $83
	note $a3
	note $c1
	intensity $87
	loopchannel $00, $72eb ; end
; 0xeb349

_Music_NewBarkTown_sub_0xeb349: ; 0xeb349
; subroutine
	octave3
	note $70
	note $00
	note $30
	note $00
	note $a1
	note $30
	note $00
	note $70
	note $00
	note $30
	note $00
	note $b1
	note $30
	note $00
	note $70
	note $00
	note $30
	note $00
	note $c1
	note $70
	note $00
	note $70
	note $00
	note $30
	note $00
	octave4
	note $11
	octave3
	note $30
	note $00
	octave2
	note $c0
	note $00
	note $80
	note $00
	octave3
	note $81
	octave2
	note $c0
	note $00
	note $c0
	note $00
	note $90
	note $00
	octave3
	note $51
	octave2
	note $c0
	note $00
	endchannel ; end
; 0xeb37c

_Music_NewBarkTown_sub_0xeb37c: ; 0xeb37c
; subroutine
	octave2
	note $81
	note $c1
	octave3
	note $31
	note $73
	note $83
	note $31
	octave2
	note $a1
	octave3
	note $21
	note $51
	note $83
	note $a3
	note $51
	endchannel ; end
; 0xeb38d

_Music_NewBarkTown_Ch2: ; 0xeb38d
	stereopanning $ff
	vibrato $12, $23
	notetype $06, $a7
	note $07
	dutycycle $02
	notetype $06, $a7
	callchannel _Music_NewBarkTown_sub_0xeb3bf
	callchannel _Music_NewBarkTown_sub_0xeb3bf
	callchannel _Music_NewBarkTown_sub_0xeb3f2
	intensity $87
	octave5
	note $c5
	note $a5
	intensity $77
	octave6
	note $33
	note $2f
	callchannel _Music_NewBarkTown_sub_0xeb3f2
	intensity $87
	octave5
	note $c5
	note $a5
	intensity $77
	octave6
	note $33
	note $5f
	loopchannel $00, $7396 ; end
; 0xeb3bf

_Music_NewBarkTown_sub_0xeb3bf: ; 0xeb3bf
; subroutine
	octave2
	note $33
	note $07
	note $30
	note $00
	note $30
	note $00
	note $31
	note $01
	note $37
	note $b1
	note $01
	note $33
	note $07
	note $30
	note $00
	note $30
	note $00
	note $31
	note $01
	note $37
	octave3
	note $11
	note $01
	octave2
	note $83
	note $07
	note $80
	note $00
	note $80
	note $00
	octave1
	note $91
	note $01
	note $97
	octave2
	note $31
	note $01
	note $a3
	note $07
	note $a0
	note $00
	note $a0
	note $00
	octave1
	note $a1
	note $01
	note $a7
	octave2
	note $23
	endchannel ; end
; 0xeb3f2

_Music_NewBarkTown_sub_0xeb3f2: ; 0xeb3f2
; subroutine
	notetype $06, $97
	dutycycle $02
	octave4
	note $cb
	note $ab
	note $87
	notetype $0c, $97
	note $5f
	endchannel ; end
; 0xeb400

_Music_NewBarkTown_Ch3: ; 0xeb400
	stereopanning $f0
	notetype $0c, $10
	octave5
	note $31
	note $51
	vibrato $16, $23
	note $73
	note $a3
	note $81
	note $71
	note $51
	note $81
	note $75
	note $31
	octave4
	note $a5
	note $80
	note $a0
	note $c3
	octave5
	note $33
	note $51
	note $31
	note $21
	note $31
	note $55
	note $71
	note $53
	note $01
	note $30
	note $50
	note $73
	note $a3
	note $b1
	note $a1
	note $81
	note $b1
	note $a5
	octave6
	note $21
	note $35
	octave5
	note $50
	note $70
	note $85
	note $a1
	note $c7
	note $a5
	note $80
	note $70
	note $53
	note $03
	intensity $25
	vibrato $12, $53
	octave2
	note $8f
	note $af
	note $8f
	note $af
	note $8f
	note $af
	note $8f
	note $ad
	intensity $10
	vibrato $16, $23
	octave5
	note $30
	note $50
	loopchannel $00, $7408 ; end
; 0xeb453
