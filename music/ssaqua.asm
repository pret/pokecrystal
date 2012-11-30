_Music_SSAqua: ; 0xead99
	db $c0
	dw _Music_SSAqua_Ch1
	db $01
	dw _Music_SSAqua_Ch2
	db $02
	dw _Music_SSAqua_Ch3
	db $03
	dw _Music_SSAqua_Ch4
; 0xeada5

_Music_SSAqua_Ch1: ; 0xeada5
	tempo $7500
	volume $77
	stereopanning $0f
	tone $0100
	vibrato $12, $33
	dutycycle $02
	notetype $06, $97
	octave2
	note $80
	note $00
	note $80
	note $00
	octave2
	note $8f
	note $07
	note $81
	note $01
	notetype $0c, $97
	note $81
	note $89
	note $03
	notetype $06, $97
	note $80
	note $00
	note $80
	note $00
	note $8f
	note $07
	note $81
	note $01
	notetype $0c, $97
	note $81
	note $87
	note $07
	dutycycle $01
	intensity $61
	callchannel _Music_SSAqua_sub_0xeaff5
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	callchannel _Music_SSAqua_sub_0xeaff5
	callchannel _Music_SSAqua_sub_0xeb03e
	note $0f
	note $0f
	note $0f
	intensity $97
	note $0d
	notetype $06, $97
	note $30
	note $00
	octave3
	note $b0
	note $00
	notetype $0c, $97
	note $0f
	note $0f
	intensity $95
	note $01
	octave4
	note $10
	note $50
	note $80
	note $00
	note $50
	note $10
	octave3
	note $50
	note $10
	note $50
	note $80
	octave4
	note $10
	note $50
	note $80
	octave5
	note $10
	octave4
	note $55
	note $31
	note $10
	note $30
	note $70
	note $a0
	octave5
	note $10
	note $30
	octave4
	note $80
	note $70
	dutycycle $02
	intensity $97
	note $87
	note $77
	note $57
	note $37
	octave3
	note $c7
	note $b1
	note $01
	note $c0
	note $00
	octave4
	note $71
	intensity $75
	octave5
	note $a3
	note $73
	note $33
	octave4
	note $b1
	notetype $06, $97
	note $30
	note $00
	octave3
	note $b0
	note $00
	intensity $97
	note $8f
	note $af
	note $c3
	note $03
	note $c3
	note $03
	octave4
	note $57
	note $87
	note $70
	vibrato $00, $00
	intensity $88
	note $89
	vibrato $02, $23
	intensity $87
	note $88
	vibrato $08, $33
	note $13
	note $53
	note $13
	note $3b
	note $7b
	note $07
	octave2
	note $c1
	octave3
	note $31
	note $71
	note $a1
	note $31
	note $71
	note $a1
	octave4
	note $31
	note $71
	notetype $0c, $97
	note $06
	note $0f
	note $0f
	note $87
	note $70
	note $30
	octave3
	note $a0
	octave4
	note $30
	octave3
	note $a0
	note $70
	note $30
	octave2
	note $a0
	note $c0
	octave3
	note $30
	note $70
	note $a0
	note $30
	note $70
	note $a0
	octave4
	note $30
	note $70
	note $06
	note $0f
	note $01
	note $51
	note $80
	note $00
	note $50
	notetype $06, $97
	note $00
	note $10
	note $23
	octave3
	note $c1
	note $01
	note $a2
	note $00
	note $81
	note $01
	note $71
	note $31
	octave2
	note $a1
	octave3
	note $31
	note $a1
	note $71
	note $31
	note $a1
	octave4
	note $31
	octave3
	note $a1
	note $71
	note $a1
	octave4
	note $11
	note $31
	note $71
	note $a1
	loopchannel $00, $6dbc ; end
; 0xeaeca

_Music_SSAqua_Ch2: ; 0xeaeca
	stereopanning $f0
	dutycycle $02
	vibrato $08, $33
	notetype $0c, $b7
	note $01
	notetype $0c, $b7
	dutycycle $01
	intensity $61
	callchannel _Music_SSAqua_sub_0xeaff5
	callchannel _Music_SSAqua_sub_0xeb03e
	dutycycle $02
	intensity $d7
	callchannel _Music_SSAqua_sub_0xeafe0
	note $c0
	note $00
	note $80
	note $02
	octave3
	note $85
	note $80
	note $c0
	octave4
	note $20
	note $50
	forceoctave $0c
	callchannel _Music_SSAqua_sub_0xeafe0
	forceoctave $00
	octave3
	note $c0
	note $00
	note $80
	note $02
	octave4
	note $85
	note $01
	dutycycle $03
	intensity $b7
	octave3
	note $c0
	octave4
	note $10
	callchannel _Music_SSAqua_sub_0xeaf88
	note $83
	note $03
	note $87
	note $a7
	note $c7
	notetype $0c, $b7
	octave5
	note $19
	note $31
	note $11
	octave4
	note $81
	note $c5
	note $a5
	note $01
	octave3
	note $c0
	octave4
	note $10
	callchannel _Music_SSAqua_sub_0xeaf88
	note $83
	note $03
	note $87
	note $a7
	note $c7
	octave5
	note $40
	vibrato $00, $00
	intensity $98
	note $59
	vibrato $04, $23
	intensity $97
	note $58
	vibrato $08, $23
	note $33
	note $13
	octave4
	note $83
	note $cb
	note $ab
	note $03
	dutycycle $00
	note $c1
	note $a1
	callchannel _Music_SSAqua_sub_0xeafd5
	notetype $06, $b7
	note $90
	note $aa
	note $81
	note $71
	note $8b
	note $03
	note $03
	note $51
	note $01
	note $51
	note $01
	note $81
	note $01
	note $a1
	note $01
	note $51
	note $01
	note $71
	note $01
	note $81
	note $01
	note $af
	note $bb
	note $c1
	note $a1
	callchannel _Music_SSAqua_sub_0xeafd5
	notetype $06, $b7
	note $90
	note $aa
	note $c3
	note $8b
	note $03
	note $03
	octave5
	note $13
	note $31
	note $01
	note $11
	note $00
	octave4
	note $b0
	note $c3
	note $a1
	note $01
	note $83
	note $51
	note $01
	note $77
	note $87
	note $a7
	note $07
	loopchannel $00, $6ed5 ; end
; 0xeaf88

_Music_SSAqua_sub_0xeaf88: ; 0xeaf88
; subroutine
	note $35
	octave3
	note $c0
	octave4
	note $10
	note $31
	octave3
	note $c0
	octave4
	note $10
	note $31
	octave3
	note $c0
	octave4
	note $10
	note $31
	note $01
	note $81
	note $01
	note $a1
	note $01
	note $b1
	note $01
	note $c5
	note $75
	note $03
	dutycycle $01
	notetype $06, $b7
	octave3
	note $a0
	note $00
	octave4
	note $30
	note $00
	note $70
	note $00
	note $a0
	note $00
	note $30
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
	note $30
	note $00
	octave4
	note $b0
	note $00
	note $70
	note $00
	note $b0
	note $00
	note $70
	note $00
	dutycycle $03
	note $51
	note $71
	note $8b
	note $51
	note $71
	note $83
	note $51
	note $71
	note $83
	note $51
	note $71
	endchannel ; end
; 0xeafd5

_Music_SSAqua_sub_0xeafd5: ; 0xeafd5
; subroutine
	notetype $0c, $b7
	note $c9
	note $70
	note $00
	note $c0
	note $00
	note $70
	note $00
	endchannel ; end
; 0xeafe0

_Music_SSAqua_sub_0xeafe0: ; 0xeafe0
; subroutine
	octave3
	note $39
	note $50
	note $02
	note $30
	note $00
	note $2b
	octave2
	note $a0
	note $00
	note $c0
	note $00
	octave3
	note $17
	note $01
	octave2
	note $c0
	note $02
	note $a0
	note $00
	endchannel ; end
; 0xeaff5

_Music_SSAqua_sub_0xeaff5: ; 0xeaff5
; subroutine
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $80
	note $20
	octave4
	note $b0
	note $80
	octave5
	note $80
	note $20
	octave4
	note $b0
	note $80
	octave5
	note $80
	note $20
	octave4
	note $b0
	note $80
	octave5
	note $80
	note $20
	octave4
	note $b0
	note $80
	octave5
	note $80
	note $10
	octave4
	note $a0
	note $80
	octave5
	note $80
	note $10
	octave4
	note $a0
	note $80
	octave5
	note $80
	note $10
	octave4
	note $a0
	note $80
	octave5
	note $80
	note $10
	octave4
	note $a0
	note $80
	endchannel ; end
; 0xeb03e

_Music_SSAqua_sub_0xeb03e: ; 0xeb03e
; subroutine
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	octave5
	note $80
	octave4
	note $c0
	note $a0
	note $80
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	note $c0
	note $80
	note $20
	octave3
	note $80
	endchannel ; end
; 0xeb056

_Music_SSAqua_Ch3: ; 0xeb056
	stereopanning $ff
	vibrato $08, $34
	notetype $06, $15
	octave2
	note $80
	note $00
	note $80
	note $00
	note $8f
	note $07
	note $81
	note $01
	notetype $0c, $15
	note $81
	note $89
	note $03
	notetype $06, $15
	note $80
	note $00
	note $80
	note $00
	note $8f
	note $07
	note $81
	note $01
	notetype $0c, $15
	note $81
	note $87
	note $c0
	octave3
	note $20
	note $30
	note $80
	note $30
	note $80
	note $c0
	octave4
	note $50
	callchannel _Music_SSAqua_sub_0xeb14d
	callchannel _Music_SSAqua_sub_0xeb14d
	note $81
	note $01
	octave3
	note $80
	note $02
	octave2
	note $81
	note $01
	octave3
	note $80
	note $02
	octave2
	note $81
	note $01
	octave3
	note $80
	note $02
	octave2
	note $81
	note $01
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	loopchannel $04, $708d
	callchannel _Music_SSAqua_sub_0xeb172
	callchannel _Music_SSAqua_sub_0xeb172
	callchannel _Music_SSAqua_sub_0xeb230
	octave3
	note $51
	note $01
	octave4
	note $50
	note $02
	octave3
	note $41
	note $01
	octave4
	note $40
	note $02
	octave3
	note $31
	note $01
	octave4
	note $30
	note $02
	octave3
	note $41
	note $01
	octave4
	note $40
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $10
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $10
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $20
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $20
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $70
	note $02
	octave3
	note $31
	note $01
	octave4
	note $70
	note $02
	callchannel _Music_SSAqua_sub_0xeb230
	octave3
	note $51
	note $01
	octave4
	note $50
	note $02
	octave3
	note $51
	note $01
	octave4
	note $40
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $20
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $20
	note $02
	octave3
	note $11
	note $01
	octave4
	note $80
	note $02
	octave3
	note $11
	note $01
	octave4
	note $80
	note $02
	octave3
	note $21
	note $01
	octave4
	note $80
	note $02
	octave3
	note $21
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $70
	note $02
	octave3
	note $31
	note $01
	octave2
	note $80
	note $00
	note $80
	note $00
	loopchannel $00, $7063 ; end
; 0xeb14d

_Music_SSAqua_sub_0xeb14d: ; 0xeb14d
; subroutine
	notetype $06, $15
	octave2
	note $81
	note $05
	note $81
	note $05
	note $81
	note $01
	octave3
	note $81
	note $01
	octave2
	note $81
	note $03
	note $80
	note $00
	note $81
	note $05
	note $81
	note $01
	octave3
	note $80
	note $02
	octave2
	note $81
	note $01
	octave3
	note $80
	note $02
	octave2
	note $81
	note $03
	note $80
	note $00
	endchannel ; end
; 0xeb172

_Music_SSAqua_sub_0xeb172: ; 0xeb172
; subroutine
	octave2
	note $81
	note $01
	octave4
	note $30
	note $02
	octave2
	note $81
	note $01
	octave4
	note $30
	note $02
	octave2
	note $81
	note $01
	octave4
	note $50
	note $02
	octave2
	note $81
	note $01
	octave4
	note $50
	note $00
	octave2
	note $80
	note $00
	note $81
	note $01
	octave4
	note $70
	note $02
	octave2
	note $81
	note $01
	octave4
	note $70
	note $02
	octave2
	note $81
	note $01
	octave4
	note $83
	note $73
	note $51
	note $01
	octave2
	note $c1
	note $01
	octave4
	note $70
	note $02
	octave2
	note $c1
	note $01
	octave4
	note $70
	note $02
	octave2
	note $b1
	note $01
	octave3
	note $b0
	note $02
	octave2
	note $b1
	note $01
	octave3
	note $b0
	note $02
	octave2
	note $a1
	note $01
	octave3
	note $a0
	note $02
	octave2
	note $a1
	note $01
	octave3
	note $a0
	note $02
	octave2
	note $b1
	note $01
	octave3
	note $b0
	note $02
	octave2
	note $b1
	note $01
	octave3
	note $b0
	note $00
	note $40
	note $00
	note $51
	note $01
	octave4
	note $50
	note $02
	octave3
	note $51
	note $01
	octave4
	note $50
	note $02
	octave3
	note $41
	note $01
	octave4
	note $40
	note $02
	octave3
	note $41
	note $01
	octave4
	note $40
	note $00
	octave3
	note $20
	note $00
	note $31
	note $01
	octave4
	note $30
	note $02
	octave3
	note $31
	note $01
	octave4
	note $30
	note $02
	octave3
	note $21
	note $01
	octave4
	note $c3
	note $83
	note $51
	note $01
	octave3
	note $11
	note $01
	octave4
	note $80
	note $02
	octave3
	note $11
	note $01
	octave4
	note $80
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $50
	note $02
	octave2
	note $a1
	note $01
	octave4
	note $50
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $80
	note $02
	octave3
	note $31
	note $01
	octave4
	note $70
	note $02
	octave3
	note $31
	note $01
	octave4
	note $70
	note $02
	endchannel ; end
; 0xeb230

_Music_SSAqua_sub_0xeb230: ; 0xeb230
; subroutine
	octave2
	note $c1
	note $01
	octave4
	note $70
	note $02
	octave2
	note $c1
	note $01
	octave4
	note $70
	note $02
	octave2
	note $c1
	note $01
	octave4
	note $40
	note $02
	octave2
	note $c1
	note $01
	octave4
	note $40
	note $02
	endchannel ; end
; 0xeb249

_Music_SSAqua_Ch4: ; 0xeb249
	togglenoise $03
	notetype $0c
	note $01
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
	note $90
	note $80
	loopchannel $0c, $724e
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2bb
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2bb
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2bb
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2c7
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2bb
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2ae
	callchannel _Music_SSAqua_sub_0xeb2c7
	loopchannel $00, $724e ; end
; 0xeb2ae

_Music_SSAqua_sub_0xeb2ae: ; 0xeb2ae
; subroutine
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
	note $80
	note $80
	endchannel ; end
; 0xeb2bb

_Music_SSAqua_sub_0xeb2bb: ; 0xeb2bb
; subroutine
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
	endchannel ; end
; 0xeb2c7

_Music_SSAqua_sub_0xeb2c7: ; 0xeb2c7
; subroutine
	note $b1
	note $80
	note $80
	note $31
	note $80
	note $80
	note $30
	note $30
	note $31
	note $31
	note $11
	endchannel ; end
; 0xeb2d3
