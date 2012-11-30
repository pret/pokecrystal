_Music_Credits: ; 0x1f31c
	db $c0
	dw _Music_Credits_Ch1
	db $01
	dw _Music_Credits_Ch2
	db $02
	dw _Music_Credits_Ch3
	db $03
	dw _Music_Credits_Ch4
; 0x1f328

_Music_Credits_Ch1: ; 0x1f328
	tempo $8b00
	volume $77
	stereopanning $0f
	dutycycle $03
	notetype $0c, $2f
	octave2
	note $8f
	notetype $06, $a7
	octave3
	note $cb
	note $b1
	note $a1
	note $c0
	octave4
	note $16
	note $37
	callchannel _Music_Credits_sub_0x1f483
	note $03
	octave3
	note $c1
	note $01
	note $a1
	note $c1
	note $01
	note $a1
	note $c1
	intensity $96
	note $a0
	note $80
	octave3
	note $30
	note $10
	octave2
	note $c0
	note $a0
	intensity $94
	note $80
	note $60
	note $50
	note $30
	note $10
	octave1
	note $c0
	note $a0
	octave3
	note $00
	intensity $a7
	callchannel _Music_Credits_sub_0x1f483
	callchannel _Music_Credits_sub_0x1f4ed
	intensity $97
	callchannel _Music_Credits_sub_0x1f4f8
	octave3
	note $c1
	octave4
	note $81
	note $31
	note $81
	note $61
	note $81
	note $31
	note $81
	octave3
	note $c1
	octave4
	note $81
	note $31
	note $81
	octave3
	note $c1
	octave4
	note $81
	note $31
	note $81
	octave3
	note $81
	octave4
	note $31
	octave3
	note $c1
	octave4
	note $31
	note $51
	note $31
	octave3
	note $c1
	octave4
	note $31
	note $c1
	note $81
	note $31
	note $81
	note $31
	note $81
	note $c1
	note $81
	note $a1
	note $51
	note $11
	note $51
	note $91
	note $51
	note $11
	note $51
	note $81
	note $51
	note $11
	note $51
	note $71
	note $51
	note $11
	octave3
	note $c1
	callchannel _Music_Credits_sub_0x1f4f8
	callchannel _Music_Credits_sub_0x1f559
	note $c0
	octave4
	note $16
	note $37
	intensity $a7
	octave5
	note $51
	note $21
	octave4
	note $a1
	note $51
	octave5
	note $21
	octave4
	note $a1
	note $51
	note $21
	note $20
	note $36
	note $56
	octave3
	note $00
	forceoctave $02
	callchannel _Music_Credits_sub_0x1f483
	callchannel _Music_Credits_sub_0x1f4ed
	callchannel _Music_Credits_sub_0x1f4f8
	callchannel _Music_Credits_sub_0x1f559
	forceoctave $00
	octave3
	note $ab
	notetype $08, $a7
	note $30
	note $30
	note $30
	callchannel _Music_Credits_sub_0x1f582
	octave3
	note $c5
	note $a5
	note $a5
	note $85
	note $b5
	note $b5
	note $a5
	octave4
	note $25
	callchannel _Music_Credits_sub_0x1f582
	tempo $8f00
	octave4
	note $35
	octave3
	note $c5
	note $85
	octave4
	note $35
	tempo $9200
	note $55
	note $75
	note $a5
	octave5
	note $25
	notetype $0c, $a7
	octave3
	note $a0
	octave4
	note $30
	loopchannel $06, $7407
	notetype $08, $a7
	note $80
	note $00
	note $80
	note $00
	note $90
	note $00
	tempo $9900
	notetype $0c, $a7
	octave3
	note $10
	note $50
	note $80
	octave4
	note $10
	octave3
	note $50
	note $80
	octave4
	note $10
	note $50
	octave3
	note $80
	octave4
	note $10
	note $50
	note $80
	notetype $08, $a7
	note $10
	note $00
	note $50
	note $00
	note $80
	note $00
	notetype $0c, $a7
	octave3
	note $30
	note $70
	note $a0
	octave4
	note $30
	octave3
	note $70
	note $a0
	octave4
	note $30
	note $50
	note $70
	note $00
	note $70
	note $00
	notetype $08, $a7
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	tempo $a000
	notetype $0c, $a7
	octave2
	note $80
	note $02
	note $50
	note $02
	notetype $08, $a7
	octave1
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	octave2
	note $10
	note $00
	note $10
	note $00
	note $20
	note $00
	notetype $0c, $a7
	octave2
	note $30
	note $06
	intensity $c7
	octave2
	note $3f
	intensity $b8
	intensity $b7
	note $0f
	note $0f
	note $0f
	endchannel ; end
; 0x1f483

_Music_Credits_sub_0x1f483: ; 0x1f483
; subroutine
	note $1f
	note $70
	note $82
	note $53
	note $33
	note $53
	note $33
	octave3
	note $c1
	note $01
	note $b1
	note $c1
	note $01
	note $b1
	note $c3
	note $83
	note $03
	octave4
	note $33
	note $03
	note $53
	octave3
	note $b3
	note $83
	note $53
	note $83
	octave4
	note $83
	note $13
	note $33
	note $11
	note $01
	octave3
	note $c1
	octave4
	note $11
	note $01
	octave3
	note $c1
	octave4
	note $13
	octave3
	note $a3
	note $03
	octave4
	note $13
	octave3
	note $97
	note $63
	note $16
	note $90
	note $a0
	note $b6
	note $93
	note $03
	octave4
	note $13
	octave3
	note $83
	note $53
	note $13
	note $53
	note $83
	octave4
	note $13
	octave5
	note $30
	note $00
	octave4
	note $a0
	note $00
	note $70
	note $00
	note $a0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $a0
	note $00
	note $70
	note $00
	note $a0
	note $00
	octave5
	note $30
	note $00
	octave4
	note $a0
	note $00
	note $70
	note $00
	note $a0
	note $00
	octave5
	note $30
	note $00
	note $70
	note $00
	note $a0
	note $00
	octave6
	note $10
	note $00
	endchannel ; end
; 0x1f4ed

_Music_Credits_sub_0x1f4ed: ; 0x1f4ed
; subroutine
	octave4
	note $13
	octave3
	note $33
	note $83
	note $c7
	octave4
	note $33
	note $13
	note $43
	endchannel ; end
; 0x1f4f8

_Music_Credits_sub_0x1f4f8: ; 0x1f4f8
; subroutine
	octave3
	note $a1
	octave4
	note $51
	note $11
	note $51
	note $31
	note $51
	note $11
	note $51
	octave3
	note $a1
	octave4
	note $51
	note $31
	note $51
	note $a3
	note $c1
	octave5
	note $11
	octave4
	note $c1
	note $81
	note $61
	note $31
	note $81
	note $61
	note $31
	octave3
	note $c1
	octave4
	note $61
	note $31
	octave3
	note $c1
	note $81
	note $c1
	octave4
	note $31
	note $61
	note $71
	octave3
	note $81
	octave4
	note $31
	octave3
	note $c1
	octave4
	note $31
	note $11
	note $31
	octave3
	note $c1
	octave4
	note $31
	octave3
	note $81
	octave4
	note $31
	octave3
	note $c1
	octave4
	note $31
	note $83
	note $a1
	note $c1
	octave3
	note $a3
	octave4
	note $13
	note $53
	octave3
	note $97
	octave4
	note $17
	note $53
	octave3
	note $a1
	octave4
	note $61
	note $11
	note $61
	note $31
	note $61
	note $11
	note $61
	octave3
	note $a1
	octave4
	note $61
	note $11
	note $61
	note $51
	note $61
	note $11
	note $61
	endchannel ; end
; 0x1f559

_Music_Credits_sub_0x1f559: ; 0x1f559
; subroutine
	octave3
	note $a1
	octave4
	note $71
	note $11
	note $71
	note $31
	note $71
	note $11
	note $71
	note $51
	note $71
	note $11
	note $71
	octave3
	note $a1
	octave4
	note $71
	note $11
	note $71
	note $11
	note $81
	note $31
	note $81
	note $61
	note $81
	note $31
	note $81
	note $61
	note $81
	note $31
	note $81
	note $11
	note $81
	note $31
	note $81
	octave3
	note $cb
	note $b1
	note $a1
	endchannel ; end
; 0x1f582

_Music_Credits_sub_0x1f582: ; 0x1f582
; subroutine
	note $05
	octave3
	note $35
	note $55
	note $65
	note $75
	note $a5
	octave4
	note $75
	note $25
	endchannel ; end
; 0x1f58d

_Music_Credits_Ch2: ; 0x1f58d
	dutycycle $01
	vibrato $14, $23
	notetype $0c, $2f
	stereopanning $f0
	octave4
	note $8f
	intensity $c7
	octave5
	note $87
	octave3
	note $83
	note $63
	notetype $06, $c7
	callchannel _Music_Credits_sub_0x1f6cb
	octave1
	note $81
	note $01
	octave2
	note $81
	note $01
	note $71
	note $81
	note $01
	octave3
	note $11
	octave2
	note $81
	note $01
	note $81
	note $01
	note $81
	intensity $97
	note $70
	note $60
	note $50
	note $40
	note $30
	note $20
	intensity $c7
	callchannel _Music_Credits_sub_0x1f6cb
	callchannel _Music_Credits_sub_0x1f73f
	callchannel _Music_Credits_sub_0x1f748
	octave4
	note $c0
	octave5
	note $1a
	octave4
	note $c7
	note $a7
	note $c3
	note $70
	note $8e
	notetype $0c, $c7
	octave5
	note $5e
	notetype $06, $c7
	note $80
	note $90
	note $a1
	note $51
	note $11
	octave4
	note $a1
	octave5
	note $51
	note $11
	octave4
	note $a1
	note $51
	callchannel _Music_Credits_sub_0x1f748
	octave4
	note $c0
	octave5
	note $1a
	octave4
	note $c7
	octave5
	note $1b
	notetype $0c, $c7
	note $3f
	note $87
	octave3
	note $83
	note $63
	octave5
	note $a0
	note $50
	note $20
	octave4
	note $a0
	octave5
	note $50
	note $20
	octave4
	note $a0
	note $50
	octave3
	note $a3
	note $83
	notetype $06, $c7
	forceoctave $02
	callchannel _Music_Credits_sub_0x1f6cb
	callchannel _Music_Credits_sub_0x1f73f
	callchannel _Music_Credits_sub_0x1f748
	forceoctave $00
	octave5
	note $20
	note $3a
	note $27
	note $3b
	notetype $0c, $c7
	note $5f
	note $ad
	notetype $08, $c7
	octave2
	note $30
	note $30
	note $30
	note $35
	octave3
	note $75
	note $85
	note $95
	note $a5
	octave4
	note $25
	note $a5
	note $85
	note $85
	note $75
	note $75
	note $55
	note $55
	note $35
	note $25
	note $55
	octave1
	note $32
	note $02
	note $32
	note $02
	note $32
	note $02
	note $32
	note $02
	note $72
	note $02
	note $72
	note $02
	note $72
	notetype $0c, $c7
	octave2
	note $70
	note $00
	octave1
	note $71
	octave2
	note $70
	note $00
	octave1
	note $81
	octave2
	note $80
	note $00
	loopchannel $04, $7657
	octave1
	note $a0
	octave2
	note $a0
	note $50
	note $a0
	octave1
	note $a0
	octave2
	note $a0
	note $50
	note $a0
	octave1
	note $a0
	octave3
	note $20
	note $50
	note $80
	note $50
	note $80
	note $a0
	octave4
	note $20
	octave5
	note $3b
	notetype $08, $c7
	note $10
	note $00
	note $10
	note $00
	note $20
	note $00
	notetype $0c, $c7
	note $3b
	notetype $08, $c7
	note $10
	note $00
	note $10
	note $00
	note $20
	note $00
	note $38
	notetype $0c, $c7
	octave4
	note $70
	note $a0
	octave5
	note $30
	note $00
	note $30
	note $00
	notetype $08, $c7
	note $30
	note $00
	note $30
	note $00
	note $30
	note $00
	notetype $0c, $c7
	note $10
	note $02
	note $10
	note $02
	notetype $08, $c7
	note $10
	note $00
	note $10
	note $00
	note $10
	note $00
	note $10
	note $00
	note $10
	note $00
	note $20
	note $00
	notetype $0c, $c7
	note $30
	note $06
	intensity $c8
	intensity $c7
	octave1
	note $3f
	intensity $c7
	note $0f
	note $0f
	note $0f
	endchannel ; end
; 0x1f6cb

_Music_Credits_sub_0x1f6cb: ; 0x1f6cb
; subroutine
	octave2
	note $13
	intensity $b1
	octave5
	note $80
	note $00
	note $80
	note $00
	note $70
	note $00
	note $81
	note $01
	intensity $c7
	octave2
	note $10
	note $00
	note $13
	note $0b
	octave1
	note $c3
	note $09
	note $c0
	note $00
	note $c1
	note $01
	note $c1
	note $01
	octave2
	note $81
	octave1
	note $c5
	note $b3
	intensity $b1
	octave5
	note $50
	note $00
	note $50
	note $00
	note $40
	note $00
	note $51
	note $01
	intensity $c7
	octave1
	note $b0
	note $00
	note $b3
	note $0b
	note $a3
	note $09
	note $a0
	note $00
	note $a1
	note $01
	note $a1
	note $01
	octave2
	note $61
	octave1
	note $a5
	note $93
	intensity $b1
	octave5
	note $10
	note $00
	note $10
	note $00
	octave4
	note $c0
	note $00
	octave5
	note $11
	note $01
	intensity $c7
	octave1
	note $90
	note $00
	note $93
	note $0b
	note $83
	note $09
	note $80
	note $00
	note $81
	note $01
	note $81
	note $01
	octave2
	note $51
	octave1
	note $85
	note $73
	note $01
	note $71
	note $71
	octave2
	note $31
	octave1
	note $73
	note $a1
	octave2
	note $31
	note $71
	note $a1
	note $31
	note $71
	note $a1
	octave3
	note $11
	endchannel ; end
; 0x1f73f

_Music_Credits_sub_0x1f73f: ; 0x1f73f
; subroutine
	octave1
	note $83
	note $03
	note $81
	note $01
	octave2
	note $8b
	note $77
	endchannel ; end
; 0x1f748

_Music_Credits_sub_0x1f748: ; 0x1f748
; subroutine
	octave4
	note $a7
	note $c7
	octave5
	note $17
	note $57
	notetype $0c, $c7
	note $3f
	octave4
	note $83
	note $a3
	note $c3
	octave5
	note $33
	note $19
	notetype $06, $c7
	octave4
	note $c0
	octave5
	note $12
	octave4
	note $c3
	octave5
	note $13
	notetype $0c, $c7
	octave4
	note $a9
	notetype $06, $c7
	note $90
	note $a2
	note $c3
	octave5
	note $13
	endchannel ; end
; 0x1f772

_Music_Credits_Ch3: ; 0x1f772
	vibrato $16, $23
	notetype $0c, $34
	stereopanning $ff
	octave6
	note $80
	note $30
	note $10
	octave5
	note $80
	octave6
	note $80
	note $30
	note $10
	octave5
	note $80
	intensity $24
	octave6
	note $80
	note $30
	note $10
	octave5
	note $80
	intensity $14
	octave6
	note $80
	note $30
	note $10
	octave5
	note $80
	octave6
	note $80
	note $30
	octave5
	note $c0
	note $80
	octave6
	note $30
	octave5
	note $c0
	note $80
	note $30
	notetype $06, $14
	note $40
	note $56
	note $67
	callchannel _Music_Credits_sub_0x1f8aa
	octave4
	note $80
	note $00
	octave5
	note $80
	note $00
	note $70
	note $80
	note $00
	note $70
	note $80
	notetype $06, $14
	intensity $24
	note $60
	note $50
	intensity $14
	note $53
	note $03
	note $63
	callchannel _Music_Credits_sub_0x1f8aa
	callchannel _Music_Credits_sub_0x1f8db
	callchannel _Music_Credits_sub_0x1f8e7
	callchannel _Music_Credits_sub_0x1f934
	octave2
	note $83
	note $01
	note $80
	note $00
	note $81
	octave3
	note $81
	note $01
	octave2
	note $80
	note $00
	note $81
	octave3
	note $81
	octave2
	note $83
	note $c1
	octave3
	note $31
	note $71
	note $81
	octave2
	note $53
	note $01
	note $50
	note $00
	note $51
	octave3
	note $51
	note $01
	octave2
	note $50
	note $00
	note $51
	octave3
	note $51
	octave2
	note $53
	note $91
	note $c1
	octave3
	note $41
	note $51
	octave2
	note $a3
	octave3
	note $51
	note $01
	octave2
	note $91
	octave3
	note $51
	note $01
	octave2
	note $91
	note $81
	octave3
	note $51
	note $01
	octave2
	note $81
	note $73
	octave3
	note $53
	callchannel _Music_Credits_sub_0x1f8e7
	callchannel _Music_Credits_sub_0x1f934
	callchannel _Music_Credits_sub_0x1f94b
	octave5
	note $40
	note $56
	note $67
	octave2
	note $a1
	note $01
	octave3
	note $51
	note $01
	note $a1
	note $01
	octave4
	note $21
	note $01
	octave5
	note $60
	note $76
	note $87
	forceoctave $02
	callchannel _Music_Credits_sub_0x1f8aa
	callchannel _Music_Credits_sub_0x1f8db
	forceoctave $12
	callchannel _Music_Credits_sub_0x1f8e7
	forceoctave $02
	callchannel _Music_Credits_sub_0x1f934
	callchannel _Music_Credits_sub_0x1f94b
	forceoctave $00
	octave6
	note $21
	octave5
	note $a1
	note $51
	note $21
	note $a1
	note $51
	notetype $08, $14
	octave2
	note $30
	note $30
	note $30
	notetype $0c, $14
	note $3f
	note $7f
	note $8f
	note $87
	note $a7
	note $03
	octave4
	note $73
	note $83
	note $93
	note $a3
	octave5
	note $23
	note $a3
	note $83
	note $83
	note $73
	note $53
	note $83
	note $a3
	note $c3
	octave6
	note $23
	note $53
	intensity $15
	octave4
	note $35
	note $71
	note $a7
	note $55
	note $81
	octave5
	note $15
	octave4
	note $c0
	note $b0
	note $a7
	intensity $14
	octave2
	note $a0
	note $00
	note $a0
	note $00
	notetype $08, $14
	octave3
	note $70
	note $00
	note $70
	note $00
	note $70
	note $00
	notetype $0c, $14
	octave5
	note $80
	note $02
	note $50
	note $02
	notetype $08, $14
	note $50
	note $00
	note $50
	note $00
	note $50
	note $00
	note $80
	note $00
	note $80
	note $00
	note $90
	note $00
	notetype $0c, $14
	note $a0
	note $0f
	note $0f
	note $0f
	endchannel ; end
; 0x1f8aa

_Music_Credits_sub_0x1f8aa: ; 0x1f8aa
; subroutine
	note $8f
	octave6
	note $20
	note $32
	note $13
	octave5
	note $c3
	octave6
	note $13
	notetype $0c, $14
	octave5
	note $89
	note $51
	note $01
	note $61
	note $89
	notetype $06, $14
	note $90
	note $a6
	note $53
	note $8b
	note $67
	note $33
	note $03
	note $53
	notetype $0c, $14
	note $69
	notetype $06, $14
	note $70
	note $86
	note $63
	note $53
	note $43
	note $53
	note $cb
	note $a7
	notetype $0c, $14
	note $3f
	endchannel ; end
; 0x1f8db

_Music_Credits_sub_0x1f8db: ; 0x1f8db
; subroutine
	notetype $06, $14
	note $70
	note $82
	octave4
	note $83
	octave5
	note $33
	note $8b
	note $97
	endchannel ; end
; 0x1f8e7

_Music_Credits_sub_0x1f8e7: ; 0x1f8e7
; subroutine
	octave3
	note $63
	note $01
	note $61
	note $01
	octave4
	note $11
	octave3
	note $a1
	note $61
	octave4
	note $11
	note $01
	note $11
	note $01
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $63
	note $83
	note $01
	note $81
	note $01
	octave4
	note $31
	octave3
	note $c1
	note $81
	octave4
	note $31
	note $01
	note $31
	note $01
	octave3
	note $c1
	octave4
	note $31
	octave3
	note $83
	note $53
	note $01
	note $51
	note $01
	note $c1
	note $81
	note $51
	note $c1
	note $01
	note $c1
	note $01
	note $81
	note $c1
	note $53
	note $a3
	note $01
	note $a1
	note $01
	octave4
	note $51
	note $11
	octave3
	note $91
	octave4
	note $11
	octave3
	note $91
	note $01
	note $91
	octave4
	note $11
	note $51
	note $11
	octave3
	note $91
	endchannel ; end
; 0x1f934

_Music_Credits_sub_0x1f934: ; 0x1f934
; subroutine
	octave2
	note $63
	note $01
	note $60
	note $00
	note $61
	octave3
	note $61
	note $01
	octave2
	note $60
	note $00
	note $61
	octave3
	note $61
	octave2
	note $63
	note $a1
	octave3
	note $11
	note $51
	note $61
	endchannel ; end
; 0x1f94b

_Music_Credits_sub_0x1f94b: ; 0x1f94b
; subroutine
	octave2
	note $73
	note $01
	note $70
	note $00
	note $71
	octave3
	note $71
	note $01
	octave2
	note $70
	note $00
	note $71
	octave3
	note $71
	octave2
	note $73
	note $a1
	octave3
	note $11
	note $61
	note $71
	note $87
	octave4
	note $17
	note $37
	note $67
	octave6
	note $81
	note $31
	octave5
	note $c1
	note $81
	octave6
	note $31
	octave5
	note $c1
	note $81
	note $31
	endchannel ; end
; 0x1f973

_Music_Credits_Ch4: ; 0x1f973
	togglenoise $03
	notetype $0c
	note $90
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $90
	note $80
	note $c1
	note $90
	note $80
	note $90
	note $80
	note $b3
	note $b3
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa6d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa6d
	note $b1
	note $80
	note $80
	note $31
	note $80
	note $80
	note $b1
	note $80
	note $80
	note $31
	note $71
	loopchannel $07, $79a8
	note $90
	note $80
	note $30
	note $80
	note $80
	note $30
	note $71
	note $30
	note $80
	note $30
	note $80
	note $20
	note $20
	note $30
	note $30
	note $b1
	note $80
	note $80
	note $31
	note $80
	note $80
	note $b1
	note $80
	note $80
	note $31
	note $71
	loopchannel $07, $79c6
	note $90
	note $80
	note $71
	note $80
	note $80
	note $80
	note $80
	note $b3
	note $23
	note $90
	note $80
	note $c1
	note $90
	note $80
	note $c1
	note $b3
	note $b3
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa4d
	callchannel _Music_Credits_sub_0x1fa6d
	note $b1
	note $80
	note $80
	note $31
	note $80
	note $80
	note $b1
	note $80
	note $80
	note $31
	note $71
	loopchannel $07, $79f2
	note $90
	note $80
	note $71
	note $80
	note $80
	note $80
	note $86
	notetype $08
	note $b0
	note $b0
	note $b0
	notetype $0c
	note $cf
	note $0f
	note $ce
	note $00
	note $c7
	note $c7
	note $cf
	note $0f
	note $cf
	note $c7
	note $c5
	note $30
	note $30
	note $cb
	notetype $08
	note $31
	note $31
	note $31
	notetype $0c
	note $cb
	notetype $08
	note $31
	note $31
	note $31
	note $cb
	notetype $0c
	note $30
	note $00
	note $30
	note $00
	notetype $08
	note $21
	note $21
	note $31
	notetype $0c
	note $30
	note $02
	note $30
	note $02
	notetype $08
	note $21
	note $21
	note $21
	note $31
	note $31
	note $31
	notetype $0c
	note $30
	note $06
	note $b7
	note $0f
	note $0f
	note $0f
	endchannel ; end
; 0x1fa4d

_Music_Credits_sub_0x1fa4d: ; 0x1fa4d
; subroutine
	note $90
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $30
	note $80
	note $80
	note $80
	note $90
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $30
	note $80
	note $71
	endchannel ; end
; 0x1fa6d

_Music_Credits_sub_0x1fa6d: ; 0x1fa6d
; subroutine
	note $90
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $30
	note $80
	note $30
	note $80
	note $90
	note $80
	note $30
	note $80
	note $90
	note $30
	note $71
	note $30
	note $80
	note $30
	note $80
	note $30
	note $30
	note $b0
	note $30
	endchannel ; end
; 0x1fa8d
