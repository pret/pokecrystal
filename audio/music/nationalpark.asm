_Music_NationalPark: ; 0xf54e8
	db $c0
	dw _Music_NationalPark_Ch1
	db $01
	dw _Music_NationalPark_Ch2
	db $02
	dw _Music_NationalPark_Ch3
	db $03
	dw _Music_NationalPark_Ch4
; 0xf54f4

_Music_NationalPark_Ch1: ; 0xf54f4
	tempo $c000
	volume $77
	stereopanning $0f
	vibrato $18, $24
	dutycycle $01
	notetype $0c, $77
	note $01
	callchannel _Music_NationalPark_sub_0xf554a
	callchannel _Music_NationalPark_sub_0xf554a
	notetype $06, $67
	callchannel _Music_NationalPark_sub_0xf563a
	notetype $0c, $77
	note $0f
	octave2
	note $b0
	octave3
	note $30
	note $60
	note $90
	note $30
	note $60
	note $b0
	notetype $06, $67
	octave4
	note $30
	note $20
	note $30
	note $00
	note $30
	note $00
	note $20
	note $00
	note $30
	note $02
	note $30
	note $02
	note $30
	note $00
	callchannel _Music_NationalPark_sub_0xf563a
	intensity $77
	octave3
	note $50
	note $64
	note $43
	note $01
	note $1b
	note $67
	note $20
	intensity $98
	note $3f
	intensity $77
	note $36
	notetype $0c, $77
	note $03
	loopchannel $00, $5504 ; end
; 0xf554a

_Music_NationalPark_sub_0xf554a: ; 0xf554a
; subroutine
	octave2
	note $95
	octave3
	note $61
	intensity $47
	note $60
	note $90
	intensity $57
	note $60
	note $90
	intensity $77
	note $60
	note $90
	intensity $97
	note $60
	note $90
	intensity $77
	octave2
	note $a5
	octave3
	note $71
	intensity $47
	note $70
	note $a0
	intensity $57
	note $70
	note $a0
	intensity $77
	note $70
	note $a0
	intensity $97
	note $70
	note $a0
	intensity $77
	octave2
	note $95
	octave3
	note $61
	intensity $47
	octave4
	note $10
	note $20
	intensity $57
	note $10
	note $20
	intensity $77
	note $10
	note $20
	intensity $97
	note $10
	note $20
	intensity $77
	octave2
	note $a5
	octave3
	note $21
	intensity $47
	octave4
	note $20
	note $40
	intensity $57
	note $20
	note $40
	intensity $77
	note $20
	note $40
	intensity $97
	note $20
	note $40
	intensity $77
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $a1
	octave4
	note $21
	octave3
	note $a1
	intensity $47
	octave4
	note $20
	note $40
	intensity $57
	note $20
	note $40
	intensity $77
	note $20
	note $40
	intensity $97
	note $20
	note $40
	intensity $77
	note $11
	octave3
	note $91
	octave4
	note $11
	octave3
	note $91
	octave4
	note $41
	note $11
	note $41
	note $11
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $b1
	intensity $57
	octave4
	note $60
	note $40
	intensity $67
	note $30
	note $40
	intensity $77
	note $60
	note $70
	intensity $97
	note $90
	note $b0
	intensity $77
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $a1
	octave4
	note $21
	octave3
	note $a1
	intensity $47
	octave4
	note $20
	note $40
	intensity $57
	note $20
	note $40
	intensity $77
	note $20
	note $40
	intensity $97
	note $20
	note $40
	intensity $77
	note $11
	octave3
	note $91
	octave4
	note $11
	octave3
	note $91
	octave4
	note $41
	note $11
	note $41
	note $11
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $b1
	octave4
	note $31
	octave3
	note $b1
	endchannel ; end
; 0xf563a

_Music_NationalPark_sub_0xf563a: ; 0xf563a
; subroutine
	note $0f
	note $02
	octave4
	note $b0
	note $b0
	note $00
	note $b0
	note $00
	note $b0
	note $00
	note $b1
	note $03
	note $0f
	note $02
	note $a0
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $a1
	note $03
	endchannel ; end
; 0xf5652

_Music_NationalPark_Ch2: ; 0xf5652
	vibrato $14, $24
	dutycycle $01
	notetype $0c, $a7
	note $01
	stereopanning $f0
	notetype $0c, $a7
	callchannel _Music_NationalPark_sub_0xf56b8
	octave3
	note $37
	callchannel _Music_NationalPark_sub_0xf56b8
	note $01
	intensity $a7
	octave4
	note $91
	note $71
	note $61
	notetype $06, $a7
	callchannel _Music_NationalPark_sub_0xf56f5
	octave3
	note $c0
	octave4
	note $14
	octave3
	note $93
	note $01
	octave4
	note $b7
	note $91
	note $01
	note $71
	note $01
	note $93
	note $50
	note $6d
	intensity $87
	note $80
	note $90
	note $00
	note $90
	note $00
	note $80
	note $00
	note $90
	note $02
	note $90
	note $02
	note $90
	note $00
	intensity $a7
	callchannel _Music_NationalPark_sub_0xf56f5
	octave3
	note $c0
	octave4
	note $14
	octave3
	note $93
	note $01
	note $bb
	octave4
	note $17
	octave3
	note $a0
	vibrato $00, $00
	intensity $b8
	note $bf
	vibrato $14, $24
	intensity $b7
	note $ba
	octave2
	note $41
	note $31
	loopchannel $00, $565d ; end
; 0xf56b8

_Music_NationalPark_sub_0xf56b8: ; 0xf56b8
; subroutine
	octave2
	note $25
	note $91
	octave3
	note $27
	octave2
	note $25
	note $a1
	octave3
	note $27
	octave2
	note $25
	note $91
	octave3
	note $27
	octave2
	note $25
	note $a1
	octave3
	note $77
	octave1
	note $75
	octave2
	note $21
	note $b7
	octave1
	note $75
	octave2
	note $21
	note $a7
	octave1
	note $65
	octave2
	note $11
	note $97
	octave1
	note $b5
	octave2
	note $61
	octave3
	note $37
	octave1
	note $75
	octave2
	note $21
	note $b7
	octave1
	note $75
	octave2
	note $21
	note $a7
	octave1
	note $65
	octave2
	note $11
	note $97
	octave1
	note $b5
	octave2
	note $61
	endchannel ; end
; 0xf56f5

_Music_NationalPark_sub_0xf56f5: ; 0xf56f5
; subroutine
	octave4
	note $50
	note $64
	note $73
	note $01
	note $26
	intensity $87
	octave5
	note $50
	note $60
	note $00
	note $60
	note $00
	note $50
	note $00
	note $61
	intensity $a7
	octave3
	note $b1
	octave4
	note $21
	octave4
	note $50
	note $64
	note $73
	note $01
	note $46
	intensity $87
	octave5
	note $30
	note $40
	note $00
	note $40
	note $00
	note $30
	note $00
	note $41
	intensity $a7
	octave4
	note $31
	note $21
	endchannel ; end
; 0xf5723

_Music_NationalPark_Ch3: ; 0xf5723
	vibrato $16, $24
	notetype $0c, $11
	octave4
	note $90
	note $b0
	stereopanning $ff
	callchannel _Music_NationalPark_sub_0xf5756
	octave5
	note $bd
	octave4
	note $90
	note $b0
	callchannel _Music_NationalPark_sub_0xf5756
	octave5
	note $b7
	octave4
	note $37
	intensity $15
	callchannel _Music_NationalPark_sub_0xf578f
	octave4
	note $30
	octave3
	note $62
	callchannel _Music_NationalPark_sub_0xf578f
	octave4
	note $30
	octave3
	note $60
	intensity $11
	octave4
	note $90
	note $b0
	loopchannel $00, $572e ; end
; 0xf5756

_Music_NationalPark_sub_0xf5756: ; 0xf5756
; subroutine
	octave5
	note $1f
	note $2d
	note $90
	note $b0
	octave6
	note $1f
	note $29
	note $11
	note $21
	note $41
	note $61
	note $41
	note $21
	octave5
	note $b9
	octave6
	note $61
	note $41
	note $21
	octave5
	note $a8
	octave6
	note $30
	octave6
	note $41
	note $21
	note $11
	octave5
	note $93
	octave6
	note $93
	note $41
	note $6d
	note $30
	note $40
	note $61
	note $41
	note $21
	octave5
	note $b9
	octave6
	note $61
	note $41
	note $21
	octave5
	note $a9
	octave6
	note $41
	note $21
	note $11
	octave5
	note $93
	note $b3
	octave6
	note $11
	endchannel ; end
; 0xf578f

_Music_NationalPark_sub_0xf578f: ; 0xf578f
; subroutine
	octave2
	note $72
	octave3
	note $21
	note $00
	note $b3
	note $20
	note $00
	note $b0
	note $22
	octave2
	note $72
	octave3
	note $21
	note $00
	note $a3
	note $20
	note $00
	note $a0
	note $22
	octave2
	note $62
	octave3
	note $11
	note $00
	note $93
	note $10
	note $00
	note $90
	note $12
	octave2
	note $b2
	octave3
	note $61
	note $00
	octave4
	note $33
	octave3
	note $60
	note $00
	endchannel ; end
; 0xf57b8

_Music_NationalPark_Ch4: ; 0xf57b8
	togglenoise $03
	notetype $0c
	note $01
	note $0f
	loopchannel $17, $57bd
	note $07
	note $b1
	note $31
	note $b0
	note $30
	note $c1
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
	note $c1
	loopchannel $07, $57c8
	note $b1
	note $80
	note $80
	note $31
	note $80
	note $80
	note $b1
	note $40
	note $40
	note $30
	note $30
	note $b0
	note $40
	loopchannel $00, $57bd ; end
; 0xf57e8
