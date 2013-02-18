_Music_Surf: ; 0xf518a
	db $80
	dw _Music_Surf_Ch1
	db $01
	dw _Music_Surf_Ch2
	db $02
	dw _Music_Surf_Ch3
; 0xf5193

; 0xf5193
	db $03
; 0xf5194

_Music_Surf_Ch1: ; 0xf5194
	tempo $6c00
	volume $77
	notetype $0c, $a7
	stereopanning $0f
	dutycycle $02
	vibrato $10, $24
	intensity $73
	octave3
	note $60
	note $00
	note $40
	note $00
	intensity $73
	note $60
	note $00
	note $40
	note $00
	note $90
	note $00
	note $40
	note $00
	intensity $73
	note $60
	note $00
	note $40
	note $00
	note $60
	note $00
	note $40
	intensity $93
	note $00
	note $90
	note $00
	note $40
	note $00
	intensity $a7
	note $60
	note $00
	note $40
	note $00
	note $60
	note $00
	note $40
	intensity $b7
	note $00
	note $b1
	note $91
	note $61
	note $31
	notetype $08, $c7
	octave2
	note $b1
	octave3
	note $31
	note $61
	intensity $f7
	note $91
	note $b1
	octave4
	note $31
	dutycycle $00
	callchannel _Music_Surf_sub_0xf5233
	dutycycle $01
	notetype $08, $a7
	callchannel _Music_Surf_sub_0xf5233
	callchannel _Music_Surf_sub_0xf5293
	octave4
	note $11
	octave3
	note $81
	note $41
	note $11
	note $41
	note $81
	octave4
	note $11
	note $41
	note $81
	dutycycle $01
	notetype $06, $97
	callchannel _Music_Surf_sub_0xf5293
	intensity $a8
	note $95
	note $a5
	note $b2
	octave4
	note $32
	intensity $a8
	dutycycle $01
	callchannel _Music_Surf_sub_0xf52d9
	octave3
	note $47
	note $97
	note $47
	dutycycle $03
	notetype $08, $98
	callchannel _Music_Surf_sub_0xf52d9
	notetype $0c, $a7
	octave3
	note $4b
	octave2
	note $63
	note $43
	note $63
	note $93
	note $41
	note $91
	note $c1
	octave3
	note $41
	loopchannel $00, $519e ; end
; 0xf5233

_Music_Surf_sub_0xf5233: ; 0xf5233
; subroutine
	notetype $0c, $a7
	octave3
	note $43
	note $b0
	note $00
	octave4
	note $40
	note $00
	octave3
	note $b0
	note $00
	octave4
	note $40
	note $00
	octave3
	note $43
	note $b0
	note $00
	octave4
	note $40
	note $00
	octave3
	note $b0
	note $00
	octave4
	note $40
	note $00
	octave3
	note $23
	note $b0
	note $00
	octave4
	note $20
	note $00
	octave3
	note $b0
	note $00
	octave4
	note $20
	note $00
	octave3
	note $23
	note $b0
	note $00
	octave4
	note $20
	note $00
	octave3
	note $b0
	note $00
	octave4
	note $20
	note $00
	octave3
	note $13
	note $90
	note $00
	octave4
	note $10
	note $00
	octave3
	note $90
	note $00
	octave4
	note $10
	note $00
	octave3
	note $13
	note $90
	note $00
	octave4
	note $10
	note $00
	octave3
	note $90
	note $00
	octave4
	note $10
	note $00
	notetype $06, $a7
	octave3
	note $b0
	note $ce
	octave4
	note $43
	octave3
	note $c3
	note $97
	note $67
	note $23
	note $33
	endchannel ; end
; 0xf5293

_Music_Surf_sub_0xf5293: ; 0xf5293
; subroutine
	octave4
	note $9f
	note $43
	note $13
	octave3
	note $93
	octave4
	note $13
	note $33
	note $43
	note $83
	note $93
	notetype $08, $92
	note $b1
	note $61
	note $31
	note $61
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $b1
	note $61
	note $b1
	note $61
	note $31
	octave2
	note $b1
	octave3
	note $31
	note $61
	note $91
	note $b1
	octave4
	note $31
	notetype $06, $97
	note $20
	note $3e
	note $83
	note $33
	octave3
	note $b3
	octave4
	note $33
	note $63
	note $83
	note $a3
	note $b3
	notetype $08, $92
	octave5
	note $11
	octave4
	note $81
	note $41
	note $81
	note $41
	note $11
	note $41
	note $11
	octave3
	note $81
	endchannel ; end
; 0xf52d9

_Music_Surf_sub_0xf52d9: ; 0xf52d9
; subroutine
	octave3
	note $b2
	note $82
	note $b2
	octave4
	note $48
	notetype $06, $58
	note $30
	note $20
	note $10
	octave3
	note $c0
	note $b0
	note $a0
	note $90
	note $80
	intensity $a8
	note $43
	note $33
	note $43
	note $83
	note $a3
	note $93
	note $83
	note $73
	note $63
	note $53
	note $87
	note $27
	note $b7
	note $a0
	note $b2
	note $93
	octave4
	note $13
	note $6b
	intensity $58
	note $40
	note $30
	note $20
	note $10
	octave3
	note $c0
	note $b0
	note $a0
	note $80
	intensity $a8
	note $97
	octave4
	note $43
	octave3
	note $c3
	note $97
	note $47
	octave2
	note $c7
	endchannel ; end
; 0xf5317

_Music_Surf_Ch2: ; 0xf5317
	notetype $0c, $c2
	stereopanning $f0
	dutycycle $02
	vibrato $14, $23
	octave1
	note $b3
	octave2
	note $b0
	note $02
	note $b0
	note $02
	loopchannel $03, $5321
	octave1
	note $b3
	octave2
	note $60
	note $02
	note $b0
	note $02
	note $43
	note $81
	note $91
	note $b3
	note $43
	note $81
	note $91
	note $b3
	note $23
	note $81
	note $91
	note $b3
	note $23
	note $81
	note $91
	note $b3
	note $13
	note $61
	note $81
	note $93
	note $13
	note $61
	note $81
	note $93
	octave1
	note $c3
	octave2
	note $61
	note $81
	note $91
	note $b1
	note $c3
	note $b3
	note $93
	loopchannel $02, $5333
	intensity $c7
	callchannel _Music_Surf_sub_0xf53b2
	note $43
	note $33
	note $23
	callchannel _Music_Surf_sub_0xf53b2
	note $33
	note $43
	octave1
	note $b3
	notetype $06, $b8
	callchannel _Music_Surf_sub_0xf53d6
	dutycycle $01
	intensity $b8
	callchannel _Music_Surf_sub_0xf53e8
	dutycycle $02
	callchannel _Music_Surf_sub_0xf53f3
	dutycycle $01
	intensity $b8
	callchannel _Music_Surf_sub_0xf5404
	octave3
	note $cf
	octave4
	note $27
	forceoctave $0c
	dutycycle $03
	callchannel _Music_Surf_sub_0xf53d6
	intensity $b8
	dutycycle $01
	callchannel _Music_Surf_sub_0xf53e8
	dutycycle $03
	callchannel _Music_Surf_sub_0xf53f3
	intensity $b8
	dutycycle $01
	callchannel _Music_Surf_sub_0xf5404
	forceoctave $00
	notetype $0c, $b8
	octave4
	note $cb
	dutycycle $02
	note $b3
	note $93
	note $43
	note $93
	note $b3
	note $c3
	loopchannel $00, $5317 ; end
; 0xf53b2

_Music_Surf_sub_0xf53b2: ; 0xf53b2
; subroutine
	octave1
	note $93
	octave3
	note $63
	note $43
	octave1
	note $93
	octave3
	note $43
	note $33
	octave1
	note $b3
	octave3
	note $13
	octave2
	note $b3
	octave1
	note $b3
	octave2
	note $93
	note $b3
	octave1
	note $83
	octave3
	note $33
	note $13
	octave1
	note $83
	octave2
	note $b3
	note $83
	note $13
	octave3
	note $63
	note $83
	endchannel ; end
; 0xf53d6

_Music_Surf_sub_0xf53d6: ; 0xf53d6
; subroutine
	octave4
	note $63
	note $43
	note $63
	note $8b
	intensity $58
	note $70
	note $60
	note $50
	note $40
	note $30
	note $20
	note $10
	octave3
	note $c0
	note $a0
	endchannel ; end
; 0xf53e8

_Music_Surf_sub_0xf53e8: ; 0xf53e8
; subroutine
	note $b6
	octave4
	note $17
	note $2f
	note $13
	octave3
	note $c3
	octave4
	note $1f
	note $87
	endchannel ; end
; 0xf53f3

_Music_Surf_sub_0xf53f3: ; 0xf53f3
; subroutine
	note $70
	note $82
	note $63
	note $83
	note $9b
	intensity $58
	note $80
	note $70
	note $60
	note $50
	note $40
	note $30
	note $20
	octave3
	note $c0
	endchannel ; end
; 0xf5404

_Music_Surf_sub_0xf5404: ; 0xf5404
; subroutine
	octave4
	note $17
	note $83
	note $93
	note $b7
	note $97
	note $47
	endchannel ; end
; 0xf540c

_Music_Surf_Ch3: ; 0xf540c
	stereopanning $ff
	notetype $0c, $15
	vibrato $16, $23
	octave4
	note $bb
	octave5
	note $1b
	note $37
	note $43
	note $63
	note $83
	note $93
	intensity $12
	note $bb
	note $03
	note $93
	note $83
	notetype $06, $12
	note $70
	note $8e
	note $93
	note $83
	note $6f
	octave4
	note $b7
	notetype $0c, $12
	octave5
	note $9f
	note $83
	note $63
	notetype $06, $12
	note $50
	note $6e
	note $83
	note $63
	note $4f
	note $67
	notetype $0c, $14
	note $bb
	note $03
	note $93
	note $83
	notetype $06, $14
	note $70
	note $8e
	note $93
	note $83
	note $6f
	octave4
	note $b7
	notetype $0c, $14
	octave5
	note $9f
	note $83
	note $63
	notetype $06, $14
	note $50
	note $6e
	note $83
	note $63
	note $4f
	octave6
	note $47
	notetype $0c, $13
	note $1f
	note $33
	note $43
	notetype $06, $13
	note $30
	note $4e
	note $33
	note $13
	octave5
	note $3f
	octave6
	note $37
	notetype $0c, $13
	octave5
	note $bb
	notetype $06, $13
	note $a0
	note $b6
	octave6
	note $17
	note $37
	note $6f
	note $43
	note $33
	note $4f
	note $37
	notetype $0c, $14
	note $1b
	note $13
	note $33
	note $43
	notetype $06, $14
	note $30
	note $4e
	note $33
	note $13
	octave5
	note $3f
	octave6
	note $37
	notetype $0c, $14
	octave5
	note $bb
	notetype $06, $14
	note $a0
	note $b6
	octave6
	note $17
	note $37
	notetype $0c, $14
	note $6b
	note $87
	octave5
	note $b3
	intensity $15
	callchannel _Music_Surf_sub_0xf54c8
	octave2
	note $c3
	octave3
	note $43
	note $63
	note $93
	note $b3
	note $c3
	callchannel _Music_Surf_sub_0xf54c8
	octave2
	note $c3
	octave3
	note $43
	note $93
	note $cb
	octave2
	note $cb
	octave3
	note $47
	octave2
	note $c3
	loopchannel $00, $540c ; end
; 0xf54c8

_Music_Surf_sub_0xf54c8: ; 0xf54c8
; subroutine
	octave3
	note $43
	note $80
	note $02
	note $b0
	note $02
	note $43
	note $80
	note $02
	note $b0
	note $02
	note $23
	note $80
	note $02
	note $b0
	note $02
	note $23
	note $80
	note $02
	note $b0
	note $02
	note $13
	note $60
	note $02
	note $90
	note $02
	note $13
	note $60
	note $02
	note $90
	note $02
	endchannel ; end
; 0xf54e8
