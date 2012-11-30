_Music_GameCorner: ; 0xedd6d
	db $c0
	dw _Music_GameCorner_Ch1
	db $01
	dw _Music_GameCorner_Ch2
	db $02
	dw _Music_GameCorner_Ch3
	db $03
	dw _Music_GameCorner_Ch4
; 0xedd79

_Music_GameCorner_Ch1: ; 0xedd79
	tempo $9300
	volume $77
	stereopanning $0f
	notetype $0c, $91
	note $07
	intensity $91
	note $0f
	note $0f
	note $0f
	note $0f
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede13
	note $0f
	note $0f
	note $0f
	note $0f
	note $0f
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede03
	callchannel _Music_GameCorner_sub_0xede13
	octave3
	note $01
	note $92
	note $92
	note $b1
	note $b1
	note $91
	note $81
	intensity $71
	octave4
	note $90
	octave5
	note $10
	note $60
	note $10
	loopchannel $04, $5db1
	octave4
	note $b0
	octave5
	note $30
	note $80
	note $30
	loopchannel $04, $5dbb
	octave4
	note $40
	note $80
	octave5
	note $10
	octave4
	note $80
	loopchannel $04, $5dc5
	octave4
	note $60
	note $a0
	octave5
	note $10
	octave4
	note $a0
	loopchannel $04, $5dd0
	octave4
	note $90
	octave5
	note $10
	note $60
	note $10
	loopchannel $04, $5ddb
	octave4
	note $b0
	octave5
	note $30
	note $80
	note $30
	loopchannel $04, $5de5
	octave4
	note $c0
	octave5
	note $30
	note $80
	note $30
	loopchannel $04, $5def
	octave3
	note $30
	note $30
	note $32
	note $61
	note $68
	loopchannel $00, $5d84 ; end
; 0xede03

_Music_GameCorner_sub_0xede03: ; 0xede03
; subroutine
	note $01
	octave4
	note $b2
	note $82
	note $42
	octave3
	note $62
	note $61
	note $01
	note $92
	note $92
	note $b1
	note $b1
	note $90
	note $b2
	endchannel ; end
; 0xede13

_Music_GameCorner_sub_0xede13: ; 0xede13
; subroutine
	note $01
	octave4
	note $b2
	note $82
	note $42
	octave3
	note $62
	note $61
	endchannel ; end
; 0xede1c

_Music_GameCorner_Ch2: ; 0xede1c
	stereopanning $ff
	vibrato $08, $24
	notetype $0c, $a1
	note $07
	intensity $92
	dutycycle $01
	callchannel _Music_GameCorner_sub_0xede75
	octave1
	note $61
	octave3
	note $91
	octave1
	note $60
	octave3
	note $91
	intensity $a4
	note $92
	intensity $92
	note $81
	note $b0
	octave4
	note $12
	callchannel _Music_GameCorner_sub_0xede75
	octave4
	note $61
	note $41
	note $60
	note $41
	intensity $a4
	note $82
	note $63
	dutycycle $02
	intensity $c7
	octave3
	note $40
	note $60
	note $85
	note $65
	note $13
	note $35
	note $45
	note $63
	note $35
	note $15
	octave2
	note $b3
	note $a3
	note $09
	octave3
	note $40
	note $60
	note $85
	note $65
	note $13
	note $35
	note $45
	note $61
	note $40
	note $60
	note $8f
	intensity $92
	note $80
	note $80
	note $82
	note $b1
	note $b8
	intensity $a4
	loopchannel $00, $5e25 ; end
; 0xede75

_Music_GameCorner_sub_0xede75: ; 0xede75
; subroutine
	octave1
	note $11
	octave3
	note $42
	note $42
	note $42
	note $62
	note $61
	octave1
	note $11
	octave3
	note $42
	note $42
	note $61
	note $61
	note $40
	note $62
	octave1
	note $11
	octave3
	note $42
	note $42
	note $42
	note $62
	note $61
	octave1
	note $11
	octave3
	note $42
	note $42
	note $61
	note $11
	note $40
	note $62
	octave1
	note $11
	octave5
	note $32
	octave4
	note $b2
	note $81
	note $11
	note $31
	note $41
	note $61
	note $41
	note $60
	note $41
	intensity $a4
	note $62
	note $83
	intensity $92
	note $70
	note $60
	octave1
	note $11
	octave5
	note $32
	octave4
	note $b2
	note $81
	note $11
	note $31
	note $41
	octave1
	note $60
	octave4
	note $60
	note $41
	note $80
	note $41
	intensity $a4
	note $b2
	note $a1
	intensity $92
	note $b0
	octave5
	note $12
	octave1
	note $11
	octave5
	note $32
	octave4
	note $b2
	note $81
	note $11
	note $31
	note $41
	note $61
	note $41
	note $60
	note $41
	intensity $a4
	note $62
	note $83
	intensity $92
	note $70
	note $60
	octave1
	note $11
	octave5
	note $32
	octave4
	note $b2
	note $81
	note $11
	note $31
	note $41
	endchannel ; end
; 0xedee8

_Music_GameCorner_Ch3: ; 0xedee8
	vibrato $08, $22
	notetype $0c, $14
	note $07
	stereopanning $ff
	notetype $0c, $14
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xedff8
	octave4
	note $80
	note $a2
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xedff8
	octave4
	note $b0
	octave5
	note $12
	stereopanning $f0
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee00c
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee024
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee00c
	callchannel _Music_GameCorner_sub_0xedfdd
	stereopanning $ff
	octave2
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave2
	note $60
	octave5
	note $10
	octave3
	note $60
	octave5
	note $42
	note $30
	note $00
	note $40
	note $60
	note $01
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xedff8
	octave4
	note $80
	note $a2
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xedff8
	octave4
	note $b0
	octave5
	note $12
	stereopanning $f0
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee00c
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee024
	callchannel _Music_GameCorner_sub_0xedfdd
	callchannel _Music_GameCorner_sub_0xee00c
	callchannel _Music_GameCorner_sub_0xedfdd
	octave2
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $40
	note $00
	note $30
	note $00
	note $10
	note $00
	octave4
	note $b0
	note $00
	intensity $15
	callchannel _Music_GameCorner_sub_0xee03f
	octave2
	note $11
	note $00
	note $10
	octave3
	note $10
	octave2
	note $10
	note $00
	note $10
	note $10
	octave3
	note $10
	octave2
	note $11
	octave3
	note $10
	octave2
	note $10
	note $00
	octave3
	note $10
	octave2
	note $61
	note $00
	note $60
	octave3
	note $60
	octave2
	note $60
	note $00
	note $60
	note $60
	octave3
	note $60
	octave2
	note $61
	octave3
	note $60
	octave2
	note $60
	note $00
	octave3
	note $60
	callchannel _Music_GameCorner_sub_0xee03f
	octave2
	note $81
	note $00
	note $80
	octave3
	note $80
	octave2
	note $80
	note $00
	note $80
	note $80
	octave3
	note $80
	octave2
	note $81
	octave3
	note $80
	octave2
	note $80
	note $00
	octave3
	note $80
	octave2
	note $c0
	note $c0
	note $c0
	note $01
	note $c0
	note $00
	note $c0
	note $03
	notetype $06, $15
	octave3
	note $30
	note $10
	octave2
	note $c0
	note $a0
	note $80
	note $60
	note $50
	note $30
	loopchannel $00, $5eef ; end
; 0xedfdd

_Music_GameCorner_sub_0xedfdd: ; 0xedfdd
; subroutine
	octave2
	note $10
	octave3
	note $10
	octave4
	note $80
	note $10
	octave3
	note $10
	octave4
	note $80
	note $10
	octave3
	note $10
	octave4
	note $80
	note $10
	octave3
	note $10
	octave4
	note $a0
	note $10
	octave3
	note $10
	octave4
	note $a1
	endchannel ; end
; 0xedff8

_Music_GameCorner_sub_0xedff8: ; 0xedff8
; subroutine
	octave2
	note $10
	octave3
	note $10
	octave4
	note $80
	note $10
	octave3
	note $10
	octave4
	note $80
	note $10
	octave3
	note $10
	octave4
	note $b0
	note $00
	note $a0
	note $00
	endchannel ; end
; 0xee00c

_Music_GameCorner_sub_0xee00c: ; 0xee00c
; subroutine
	octave2
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $40
	note $00
	note $30
	note $00
	note $10
	note $32
	endchannel ; end
; 0xee024

_Music_GameCorner_sub_0xee024: ; 0xee024
; subroutine
	octave2
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $10
	octave4
	note $60
	octave3
	note $60
	octave5
	note $40
	note $00
	note $30
	note $00
	note $10
	note $30
	octave3
	note $60
	note $00
	endchannel ; end
; 0xee03f

_Music_GameCorner_sub_0xee03f: ; 0xee03f
; subroutine
	octave2
	note $61
	note $00
	note $60
	octave3
	note $60
	octave2
	note $60
	note $00
	note $60
	note $60
	octave3
	note $60
	octave2
	note $61
	octave3
	note $60
	octave2
	note $60
	note $00
	octave3
	note $60
	octave2
	note $81
	note $00
	note $80
	octave3
	note $80
	octave2
	note $80
	note $00
	note $80
	note $80
	octave3
	note $80
	octave2
	note $60
	octave3
	note $60
	octave2
	note $40
	octave3
	note $40
	octave2
	note $30
	octave3
	note $30
	endchannel ; end
; 0xee06f

_Music_GameCorner_Ch4: ; 0xee06f
	togglenoise $03
	notetype $0c
	notetype $08
	note $30
	note $30
	note $30
	notetype $0c
	note $30
	note $30
	note $31
	note $30
	note $30
	callchannel _Music_GameCorner_sub_0xee106
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	loopchannel $06, $6082
	callchannel _Music_GameCorner_sub_0xee10f
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	loopchannel $03, $6091
	note $0b
	note $30
	note $30
	note $71
	callchannel _Music_GameCorner_sub_0xee106
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	loopchannel $06, $60a4
	callchannel _Music_GameCorner_sub_0xee10f
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	loopchannel $03, $60b3
	note $b1
	note $71
	note $31
	note $71
	note $41
	note $71
	note $30
	note $30
	note $30
	note $30
	note $b1
	note $70
	note $40
	note $30
	note $40
	note $70
	note $40
	note $40
	note $30
	note $70
	note $40
	note $31
	note $71
	loopchannel $03, $60c9
	note $b1
	note $70
	note $40
	note $30
	note $40
	note $70
	note $40
	note $40
	note $30
	note $70
	note $40
	note $31
	note $30
	note $30
	note $b1
	note $70
	note $40
	note $30
	note $40
	note $70
	note $40
	note $40
	note $30
	note $70
	note $40
	note $31
	note $71
	loopchannel $03, $60e8
	note $30
	note $30
	note $31
	note $b0
	note $71
	note $74
	note $30
	note $30
	note $41
	loopchannel $00, $607f ; end
; 0xee106

_Music_GameCorner_sub_0xee106: ; 0xee106
; subroutine
	note $11
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	endchannel ; end
; 0xee10f

_Music_GameCorner_sub_0xee10f: ; 0xee10f
; subroutine
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $30
	note $30
	note $71
	endchannel ; end
; 0xee119
