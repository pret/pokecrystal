_Music_GoldenrodCity: ; 0xeb453
	db $c0
	dw _Music_GoldenrodCity_Ch1
	db $01
	dw _Music_GoldenrodCity_Ch2
	db $02
	dw _Music_GoldenrodCity_Ch3
	db $03
	dw _Music_GoldenrodCity_Ch4
; 0xeb45f

_Music_GoldenrodCity_Ch1: ; 0xeb45f
	stereopanning $0f
	tempo $b000
	volume $77
	notetype $0c, $97
	note $0f
	note $0f
	note $0f
	note $0f
	dutycycle $00
	callchannel _Music_GoldenrodCity_sub_0xeb4a9
	octave3
	note $90
	octave4
	note $10
	note $40
	note $70
	note $40
	note $70
	note $90
	octave5
	note $10
	intensity $71
	dutycycle $00
	callchannel _Music_GoldenrodCity_sub_0xeb4d1
	intensity $77
	note $41
	note $61
	note $71
	note $93
	intensity $71
	callchannel _Music_GoldenrodCity_sub_0xeb4d1
	note $40
	note $70
	intensity $77
	octave5
	note $11
	octave4
	note $91
	note $71
	note $41
	dutycycle $02
	intensity $97
	callchannel _Music_GoldenrodCity_sub_0xeb4a9
	note $13
	octave3
	note $91
	octave4
	note $11
	loopchannel $00, $746d ; end
; 0xeb4a9

_Music_GoldenrodCity_sub_0xeb4a9: ; 0xeb4a9
; subroutine
	octave4
	note $21
	octave3
	note $90
	note $02
	note $90
	note $00
	octave4
	note $11
	octave3
	note $90
	note $02
	note $90
	note $00
	note $b1
	note $60
	note $00
	note $21
	note $60
	note $00
	note $41
	note $11
	note $21
	note $41
	note $71
	note $20
	note $02
	note $20
	note $00
	note $71
	note $20
	note $00
	note $71
	note $b1
	note $21
	note $41
	note $91
	octave4
	note $21
	endchannel ; end
; 0xeb4d1

_Music_GoldenrodCity_sub_0xeb4d1: ; 0xeb4d1
; subroutine
	octave4
	note $60
	note $20
	octave3
	note $90
	octave4
	note $20
	note $60
	note $90
	note $60
	note $90
	note $20
	octave3
	note $90
	note $60
	note $90
	octave4
	note $20
	note $60
	note $20
	note $60
	note $40
	note $10
	octave3
	note $90
	octave4
	note $10
	note $40
	note $70
	note $40
	note $70
	note $10
	octave3
	note $90
	note $70
	note $90
	octave4
	note $10
	note $40
	note $10
	note $40
	note $20
	octave3
	note $b0
	note $70
	note $b0
	octave4
	note $20
	note $60
	note $20
	note $60
	octave3
	note $b0
	note $70
	note $20
	note $70
	note $b0
	octave4
	note $20
	octave3
	note $b0
	octave4
	note $20
	note $40
	note $10
	octave3
	note $90
	octave4
	note $10
	note $40
	note $70
	endchannel ; end
; 0xeb519

_Music_GoldenrodCity_Ch2: ; 0xeb519
	stereopanning $f0
	vibrato $12, $23
	dutycycle $02
	notetype $0c, $97
	intensity $97
	callchannel _Music_GoldenrodCity_sub_0xeb555
	octave4
	note $61
	note $71
	note $91
	note $61
	note $47
	callchannel _Music_GoldenrodCity_sub_0xeb555
	note $91
	note $b1
	octave5
	note $11
	note $21
	note $47
	dutycycle $02
	intensity $77
	callchannel _Music_GoldenrodCity_sub_0xeb572
	octave4
	note $91
	note $b1
	note $c1
	octave5
	note $13
	dutycycle $03
	intensity $77
	callchannel _Music_GoldenrodCity_sub_0xeb572
	note $61
	note $41
	note $21
	note $11
	octave4
	note $91
	loopchannel $00, $7523 ; end
; 0xeb555

_Music_GoldenrodCity_sub_0xeb555: ; 0xeb555
; subroutine
	octave4
	note $63
	note $23
	note $43
	note $13
	note $21
	note $11
	octave3
	note $b1
	octave4
	note $11
	octave3
	note $95
	octave3
	note $90
	octave3
	note $a0
	note $b3
	octave4
	note $23
	octave3
	note $b1
	octave4
	note $b1
	note $91
	note $71
	dutycycle $01
	endchannel ; end
; 0xeb572

_Music_GoldenrodCity_sub_0xeb572: ; 0xeb572
; subroutine
	note $25
	note $65
	note $23
	note $15
	note $45
	note $11
	octave4
	note $90
	note $a0
	note $b5
	octave5
	note $25
	octave4
	note $b3
	octave5
	note $13
	note $41
	endchannel ; end
; 0xeb584

_Music_GoldenrodCity_Ch3: ; 0xeb584
	stereopanning $ff
	vibrato $08, $23
	notetype $0c, $25
	callchannel _Music_GoldenrodCity_sub_0xeb5aa
	callchannel _Music_GoldenrodCity_sub_0xeb5aa
	callchannel _Music_GoldenrodCity_sub_0xeb5d2
	note $02
	octave3
	note $10
	note $40
	note $80
	note $90
	note $41
	callchannel _Music_GoldenrodCity_sub_0xeb5d2
	note $00
	octave3
	note $91
	note $71
	note $41
	octave2
	note $91
	loopchannel $00, $758c ; end
; 0xeb5aa

_Music_GoldenrodCity_sub_0xeb5aa: ; 0xeb5aa
; subroutine
	octave3
	note $23
	note $01
	note $20
	note $00
	note $13
	note $01
	note $10
	note $00
	octave2
	note $b3
	note $01
	note $b0
	note $00
	note $93
	note $01
	note $90
	note $00
	note $73
	note $01
	note $70
	note $00
	octave3
	note $43
	note $01
	note $40
	note $00
	note $93
	note $01
	note $90
	note $00
	octave2
	note $90
	note $00
	note $92
	note $00
	octave3
	note $90
	note $00
	endchannel ; end
; 0xeb5d2

_Music_GoldenrodCity_sub_0xeb5d2: ; 0xeb5d2
; subroutine
	note $20
	note $00
	octave4
	note $20
	octave3
	note $20
	note $01
	note $20
	note $04
	octave4
	note $10
	note $20
	octave3
	note $91
	note $10
	note $00
	octave4
	note $10
	octave3
	note $10
	note $01
	note $10
	note $04
	note $c0
	octave4
	note $10
	octave3
	note $91
	octave2
	note $b0
	note $00
	octave3
	note $b0
	octave2
	note $b0
	note $01
	note $b0
	note $04
	octave3
	note $a0
	note $b0
	note $71
	octave2
	note $90
	note $00
	octave3
	note $90
	octave2
	note $90
	note $01
	note $90
	endchannel ; end
; 0xeb606

_Music_GoldenrodCity_Ch4: ; 0xeb606
	togglenoise $03
	notetype $0c
	note $0f
	note $0f
	note $0f
	note $07
	note $31
	note $71
	note $30
	note $30
	note $71
	note $41
	note $71
	note $31
	note $71
	note $41
	note $71
	note $31
	note $71
	loopchannel $03, $7613
	callchannel _Music_GoldenrodCity_sub_0xeb663
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $80
	note $80
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $31
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $30
	note $30
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $31
	note $30
	note $30
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $80
	note $80
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $31
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $30
	note $30
	note $71
	callchannel _Music_GoldenrodCity_sub_0xeb66d
	note $31
	note $30
	note $30
	note $41
	note $71
	note $31
	note $71
	note $41
	note $71
	note $31
	note $71
	loopchannel $03, $7650
	callchannel _Music_GoldenrodCity_sub_0xeb663
	loopchannel $00, $7613 ; end
; 0xeb663

_Music_GoldenrodCity_sub_0xeb663: ; 0xeb663
; subroutine
	note $41
	note $71
	note $31
	note $71
	note $41
	note $71
	note $30
	note $30
	note $71
	endchannel ; end
; 0xeb66d

_Music_GoldenrodCity_sub_0xeb66d: ; 0xeb66d
; subroutine
	note $41
	note $30
	note $42
	note $41
	note $80
	note $80
	note $80
	note $80
	endchannel ; end
; 0xeb676
