_Music_CeladonCity: ; 0xf435b
	db $80
	dw _Music_CeladonCity_Ch1
	db $01
	dw _Music_CeladonCity_Ch2
	db $02
	dw _Music_CeladonCity_Ch3
; 0xf4364

_Music_CeladonCity_Ch1: ; 0xf4364
	tempo $9200
	volume $77
	tone $0100
	stereopanning $0f
	notetype $0c, $a6
	octave3
	note $a6
	intensity $a1
	note $90
	note $a0
	note $32
	note $51
	note $71
	callchannel _Music_CeladonCity_sub_0xf43cc
	note $31
	note $70
	note $a0
	note $30
	note $70
	note $a0
	note $70
	loopchannel $03, $437d
	note $31
	note $80
	note $c0
	octave4
	note $30
	note $10
	octave3
	note $c0
	note $80
	callchannel _Music_CeladonCity_sub_0xf43cc
	note $30
	note $20
	note $30
	note $50
	note $70
	note $80
	note $a0
	note $c0
	note $a1
	note $81
	note $71
	note $51
	note $7f
	callchannel _Music_CeladonCity_sub_0xf43e1
	callchannel _Music_CeladonCity_sub_0xf43fe
	octave2
	note $c1
	note $b0
	note $c0
	octave3
	note $30
	note $80
	note $a0
	note $80
	note $70
	note $80
	note $a0
	note $90
	note $a0
	octave4
	note $10
	octave3
	note $c0
	note $a0
	callchannel _Music_CeladonCity_sub_0xf43e1
	callchannel _Music_CeladonCity_sub_0xf43fe
	note $31
	note $20
	note $30
	note $70
	note $80
	note $a0
	note $80
	note $a7
	loopchannel $00, $436c ; end
; 0xf43cc

_Music_CeladonCity_sub_0xf43cc: ; 0xf43cc
; subroutine
	note $31
	note $80
	note $c0
	note $30
	note $80
	note $c0
	note $80
	loopchannel $03, $43cc
	note $31
	note $70
	note $a0
	octave4
	note $30
	note $20
	note $30
	octave3
	note $a0
	endchannel ; end
; 0xf43e1

_Music_CeladonCity_sub_0xf43e1: ; 0xf43e1
; subroutine
	octave2
	note $81
	note $c0
	octave3
	note $30
	loopchannel $04, $43e1
	note $11
	octave2
	note $c0
	octave3
	note $10
	note $30
	note $50
	note $70
	note $a0
	note $80
	note $a0
	note $c0
	octave4
	note $10
	note $30
	note $20
	note $30
	octave3
	note $c0
	endchannel ; end
; 0xf43fe

_Music_CeladonCity_sub_0xf43fe: ; 0xf43fe
; subroutine
	note $31
	note $70
	note $a0
	loopchannel $04, $43fe
	endchannel ; end
; 0xf4406

_Music_CeladonCity_Ch2: ; 0xf4406
	vibrato $12, $34
	dutycycle $02
	stereopanning $f0
	notetype $0c, $b7
	octave4
	note $30
	note $20
	note $30
	note $50
	note $70
	note $50
	note $70
	note $80
	note $a7
	callchannel _Music_CeladonCity_sub_0xf4463
	note $a3
	note $73
	note $a1
	note $75
	note $a0
	note $80
	note $70
	note $80
	note $a1
	note $c1
	note $83
	note $c3
	callchannel _Music_CeladonCity_sub_0xf4463
	intensity $c1
	note $a1
	note $81
	note $71
	note $81
	note $71
	note $51
	note $31
	note $21
	note $33
	note $30
	note $50
	note $70
	note $a0
	intensity $b3
	octave5
	note $35
	intensity $a2
	octave1
	note $71
	callchannel _Music_CeladonCity_sub_0xf4474
	octave1
	note $82
	note $c0
	note $a1
	octave2
	note $31
	octave1
	note $a5
	note $71
	callchannel _Music_CeladonCity_sub_0xf4474
	octave1
	note $a2
	octave2
	note $30
	note $a3
	note $35
	intensity $97
	octave4
	note $70
	note $a0
	octave5
	note $3f
	loopchannel $00, $441a ; end
; 0xf4463

_Music_CeladonCity_sub_0xf4463: ; 0xf4463
; subroutine
	intensity $b2
	octave4
	note $c3
	note $83
	note $c1
	note $85
	note $c0
	note $80
	note $a0
	note $c0
	octave5
	note $11
	octave4
	note $c1
	note $a7
	endchannel ; end
; 0xf4474

_Music_CeladonCity_sub_0xf4474: ; 0xf4474
; subroutine
	note $82
	note $c0
	octave2
	note $33
	octave1
	note $81
	note $c1
	octave2
	note $33
	octave1
	note $82
	octave2
	note $10
	note $33
	octave1
	note $81
	note $c1
	octave2
	note $33
	octave1
	note $a2
	octave2
	note $30
	note $73
	octave1
	note $a1
	octave2
	note $31
	note $73
	endchannel ; end
; 0xf4492

_Music_CeladonCity_Ch3: ; 0xf4492
	vibrato $12, $24
	notetype $0c, $25
	octave3
	note $a1
	note $01
	note $71
	note $01
	note $37
	callchannel _Music_CeladonCity_sub_0xf44fd
	octave2
	note $a1
	note $01
	octave3
	note $33
	loopchannel $03, $44a1
	octave2
	note $80
	note $00
	note $c0
	note $00
	octave3
	note $32
	octave2
	note $70
	callchannel _Music_CeladonCity_sub_0xf44fd
	note $a0
	note $00
	octave3
	note $30
	note $00
	octave3
	note $72
	octave2
	note $90
	note $a0
	note $00
	octave3
	note $20
	note $00
	note $51
	note $21
	note $31
	note $05
	octave2
	note $a1
	note $05
	intensity $10
	callchannel _Music_CeladonCity_sub_0xf4510
	octave5
	note $51
	note $01
	note $71
	note $01
	note $33
	note $03
	note $17
	octave4
	note $a1
	note $c1
	octave5
	note $11
	note $31
	note $51
	note $01
	note $31
	note $51
	note $33
	note $03
	callchannel _Music_CeladonCity_sub_0xf4510
	octave5
	note $51
	note $01
	note $31
	note $51
	note $33
	note $03
	note $17
	note $a1
	note $81
	note $71
	note $51
	note $71
	note $51
	note $31
	note $51
	note $31
	note $05
	loopchannel $00, $4495 ; end
; 0xf44fd

_Music_CeladonCity_sub_0xf44fd: ; 0xf44fd
; subroutine
	octave2
	note $81
	note $01
	octave3
	note $33
	loopchannel $03, $44fd
	octave2
	note $a0
	note $00
	octave3
	note $30
	note $00
	note $72
	octave2
	note $90
	endchannel ; end
; 0xf4510

_Music_CeladonCity_sub_0xf4510: ; 0xf4510
; subroutine
	octave5
	note $37
	note $11
	octave4
	note $c1
	note $a1
	note $c1
	endchannel ; end
; 0xf4518
