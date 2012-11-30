_Music_AzaleaTown: ; 0xf57e8
	db $c0
	dw _Music_AzaleaTown_Ch1
	db $01
	dw _Music_AzaleaTown_Ch2
	db $02
	dw _Music_AzaleaTown_Ch3
	db $03
	dw _Music_AzaleaTown_Ch4
; 0xf57f4

_Music_AzaleaTown_Ch1: ; 0xf57f4
	tempo $a000
	volume $77
	dutycycle $02
	stereopanning $0f
	notetype $0c, $a1
	note $01
	intensity $a1
	octave3
	note $61
	intensity $61
	note $61
	note $61
	intensity $a1
	note $61
	intensity $61
	note $61
	note $61
	note $61
	note $61
	loopchannel $02, $5801
	callchannel _Music_AzaleaTown_sub_0xf588c
	stereopanning $f0
	intensity $a4
	note $91
	note $b0
	note $02
	octave4
	note $13
	notetype $06, $a4
	note $80
	note $92
	note $73
	note $41
	note $01
	stereopanning $0f
	callchannel _Music_AzaleaTown_sub_0xf588c
	stereopanning $f0
	notetype $06, $a4
	note $43
	note $13
	note $02
	note $c0
	octave4
	note $1b
	octave3
	note $b3
	note $73
	stereopanning $0f
	callchannel _Music_AzaleaTown_sub_0xf5912
	intensity $a3
	note $b3
	octave4
	note $21
	note $01
	note $11
	note $01
	intensity $a1
	octave3
	note $23
	note $a1
	note $0d
	callchannel _Music_AzaleaTown_sub_0xf5912
	intensity $a3
	octave4
	note $10
	note $22
	note $61
	note $01
	note $21
	note $01
	intensity $a1
	octave3
	note $83
	note $b3
	note $87
	intensity $a2
	note $b3
	octave4
	note $23
	octave3
	note $b3
	note $73
	note $27
	note $73
	note $03
	note $b3
	octave4
	note $23
	octave3
	note $b3
	note $83
	note $23
	note $03
	note $83
	note $03
	octave4
	note $23
	note $43
	note $23
	octave3
	note $93
	note $43
	note $23
	octave2
	note $93
	note $07
	notetype $0c, $2f
	octave3
	note $9d
	note $01
	loopchannel $00, $5816 ; end
; 0xf588c

_Music_AzaleaTown_sub_0xf588c: ; 0xf588c
; subroutine
	notetype $0c, $a1
	octave4
	note $61
	intensity $61
	note $61
	note $61
	intensity $a1
	note $41
	intensity $61
	note $41
	note $41
	intensity $a1
	note $61
	intensity $61
	note $61
	intensity $a1
	note $b1
	intensity $61
	note $b1
	note $b1
	intensity $a1
	note $91
	intensity $61
	note $91
	note $91
	intensity $a1
	note $a1
	intensity $61
	note $a1
	intensity $a1
	note $11
	intensity $61
	note $11
	note $11
	intensity $a1
	note $21
	intensity $61
	note $21
	note $21
	note $21
	note $21
	intensity $a1
	note $41
	intensity $61
	note $41
	note $41
	intensity $a1
	note $21
	intensity $61
	note $21
	note $21
	note $21
	note $01
	intensity $a1
	octave3
	note $61
	intensity $61
	note $61
	note $61
	intensity $a1
	note $71
	intensity $61
	note $71
	note $71
	note $71
	note $71
	intensity $a1
	note $61
	intensity $61
	note $61
	note $61
	intensity $a1
	note $41
	intensity $61
	note $41
	note $41
	intensity $a1
	note $21
	intensity $61
	note $21
	intensity $a1
	note $11
	intensity $61
	note $11
	note $11
	intensity $a1
	octave2
	note $b1
	intensity $61
	note $b1
	note $b1
	intensity $a1
	octave3
	note $21
	intensity $61
	note $21
	endchannel ; end
; 0xf5912

_Music_AzaleaTown_sub_0xf5912: ; 0xf5912
; subroutine
	intensity $61
	note $97
	note $97
	intensity $81
	note $a7
	intensity $a1
	note $a7
	endchannel ; end
; 0xf591d

_Music_AzaleaTown_Ch2: ; 0xf591d
	vibrato $12, $23
	dutycycle $02
	stereopanning $f0
	notetype $0c, $62
	note $00
	octave4
	note $30
	intensity $b1
	note $41
	intensity $71
	note $41
	note $41
	intensity $b1
	note $21
	intensity $71
	note $21
	note $21
	intensity $51
	note $21
	note $21
	intensity $b1
	note $11
	intensity $71
	note $11
	note $11
	intensity $b1
	note $21
	intensity $71
	note $21
	note $21
	notetype $06, $b4
	note $66
	dutycycle $01
	octave5
	note $10
	callchannel _Music_AzaleaTown_sub_0xf59c7
	note $23
	note $11
	note $20
	note $02
	notetype $06, $b4
	note $4a
	note $07
	dutycycle $01
	octave5
	note $10
	callchannel _Music_AzaleaTown_sub_0xf59c7
	note $01
	note $21
	note $11
	octave3
	note $91
	notetype $06, $b4
	note $02
	octave4
	note $80
	note $9b
	note $73
	note $63
	dutycycle $00
	note $30
	note $42
	note $23
	note $11
	note $01
	note $93
	note $03
	note $73
	note $03
	note $63
	note $43
	note $61
	note $01
	note $41
	note $01
	note $27
	note $0b
	note $30
	note $42
	note $23
	note $11
	note $01
	note $93
	note $03
	note $a3
	note $03
	octave5
	note $13
	octave4
	note $c0
	octave5
	note $12
	note $21
	note $01
	note $11
	note $01
	octave4
	note $63
	note $03
	note $43
	note $03
	note $23
	dutycycle $02
	note $63
	note $43
	note $23
	note $63
	note $03
	note $43
	note $03
	note $23
	note $63
	note $43
	note $23
	note $63
	note $03
	note $b3
	note $03
	octave5
	note $13
	notetype $0c, $b7
	octave4
	note $9b
	note $43
	intensity $1f
	note $1d
	notetype $06, $b4
	dutycycle $01
	note $91
	octave5
	note $11
	loopchannel $00, $5952 ; end
; 0xf59c7

_Music_AzaleaTown_sub_0xf59c7: ; 0xf59c7
; subroutine
	note $23
	octave4
	note $91
	note $01
	octave5
	note $11
	note $01
	note $27
	note $47
	note $61
	note $00
	note $80
	note $9b
	note $61
	note $05
	note $47
	note $61
	note $00
	note $10
	notetype $0c, $a8
	vibrato $00, $00
	note $27
	intensity $a7
	vibrato $12, $23
	note $2f
	note $03
	intensity $b4
	dutycycle $02
	octave3
	note $b1
	octave4
	note $20
	note $00
	note $77
	note $01
	note $71
	note $61
	note $40
	note $00
	note $25
	note $11
	note $01
	note $13
	note $20
	notetype $06, $b4
	note $00
	note $30
	notetype $0c, $b7
	note $4b
	intensity $b4
	endchannel ; end
; 0xf5a08

_Music_AzaleaTown_Ch3: ; 0xf5a08
	stereopanning $ff
	vibrato $06, $26
	notetype $0c, $25
	octave2
	note $90
	octave3
	note $10
	note $20
	note $04
	note $20
	note $02
	note $20
	note $00
	octave2
	note $93
	octave3
	note $20
	note $04
	note $20
	note $02
	note $20
	note $00
	note $93
	callchannel _Music_AzaleaTown_sub_0xf5a86
	note $93
	note $41
	callchannel _Music_AzaleaTown_sub_0xf5a86
	note $91
	note $01
	note $71
	callchannel _Music_AzaleaTown_sub_0xf5acf
	note $b0
	note $00
	octave4
	note $20
	note $00
	note $61
	octave3
	note $a3
	octave4
	note $20
	note $02
	note $60
	note $00
	callchannel _Music_AzaleaTown_sub_0xf5acf
	octave2
	note $b1
	octave3
	note $60
	note $00
	note $b0
	note $00
	note $41
	octave2
	note $b1
	octave3
	note $40
	note $02
	note $81
	octave2
	note $70
	note $04
	note $70
	note $70
	note $70
	note $00
	octave3
	note $21
	note $01
	octave2
	note $60
	note $70
	note $80
	note $04
	note $80
	note $80
	note $80
	note $00
	octave3
	note $21
	note $01
	octave2
	note $70
	note $80
	note $90
	note $04
	note $90
	note $90
	note $90
	note $00
	octave3
	note $41
	note $01
	octave2
	note $70
	note $80
	note $90
	note $04
	note $90
	note $90
	note $90
	note $00
	octave3
	note $41
	note $01
	octave2
	note $c0
	octave3
	note $10
	loopchannel $00, $5a24 ; end
; 0xf5a86

_Music_AzaleaTown_sub_0xf5a86: ; 0xf5a86
; subroutine
	note $20
	note $04
	note $20
	note $02
	note $20
	note $00
	octave2
	note $93
	octave3
	note $60
	note $04
	note $60
	note $00
	note $10
	note $00
	note $63
	note $a1
	intensity $15
	note $b0
	note $00
	intensity $25
	octave4
	note $20
	note $00
	note $60
	note $00
	octave3
	note $a3
	octave4
	note $20
	note $00
	note $60
	note $00
	octave3
	note $93
	note $b0
	note $00
	note $90
	note $00
	note $85
	note $03
	note $70
	note $04
	note $70
	note $02
	note $70
	note $00
	note $23
	note $80
	note $04
	note $80
	note $02
	note $23
	note $80
	note $00
	note $90
	note $04
	note $90
	note $00
	note $40
	note $00
	note $23
	note $90
	note $00
	note $90
	note $04
	note $90
	note $00
	note $10
	note $00
	endchannel ; end
; 0xf5acf

_Music_AzaleaTown_sub_0xf5acf: ; 0xf5acf
; subroutine
	intensity $35
	octave3
	note $60
	note $00
	note $60
	note $00
	note $60
	note $00
	note $60
	note $00
	intensity $25
	note $60
	note $00
	note $60
	note $00
	note $60
	note $00
	note $60
	note $00
	endchannel ; end
; 0xf5ae5

_Music_AzaleaTown_Ch4: ; 0xf5ae5
	togglenoise $03
	notetype $0c
	note $61
	note $41
	note $71
	note $31
	note $40
	note $80
	note $80
	note $80
	note $41
	note $31
	note $80
	note $80
	note $41
	note $71
	note $31
	note $40
	note $80
	note $80
	note $80
	note $41
	note $31
	note $71
	loopchannel $00, $5aea ; end
; 0xf5b03
