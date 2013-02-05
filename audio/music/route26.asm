_Music_Route26: ; 0xeefb2
	db $c0
	dw _Music_Route26_Ch1
	db $01
	dw _Music_Route26_Ch2
	db $02
	dw _Music_Route26_Ch3
	db $03
	dw _Music_Route26_Ch4
; 0xeefbe

_Music_Route26_Ch1: ; 0xeefbe
	stereopanning $0f
	vibrato $12, $23
	tempo $9700
	volume $77
	vibrato $14, $23
	dutycycle $00
	notetype $0c, $a7
	octave3
	note $33
	note $03
	note $43
	note $03
	note $73
	note $03
	note $9b
	notetype $08, $a7
	octave4
	note $11
	octave3
	note $91
	note $71
	dutycycle $00
	notetype $0c, $a7
	octave3
	note $60
	note $01
	note $20
	note $62
	note $80
	note $90
	note $01
	note $60
	octave4
	note $23
	note $43
	octave3
	note $c3
	note $a3
	note $73
	note $60
	note $00
	note $20
	note $60
	note $92
	note $80
	note $90
	note $00
	note $60
	note $90
	octave4
	note $23
	note $53
	note $43
	octave3
	note $a3
	note $c3
	note $b0
	note $00
	note $60
	note $b0
	octave4
	note $20
	note $00
	octave3
	note $b0
	octave4
	note $20
	note $63
	note $20
	note $00
	octave3
	note $a0
	note $00
	note $b3
	note $01
	notetype $06, $a7
	note $b0
	note $00
	note $b0
	note $00
	note $b1
	note $01
	note $b1
	note $01
	note $81
	note $01
	note $81
	note $01
	notetype $08, $a5
	note $91
	octave4
	note $21
	note $41
	note $95
	note $75
	note $45
	note $25
	octave3
	note $b5
	octave4
	note $15
	octave3
	note $95
	dutycycle $02
	notetype $0c, $a5
	note $a2
	note $92
	note $73
	note $21
	note $41
	note $51
	note $71
	note $c3
	note $a1
	note $91
	note $71
	note $91
	note $a1
	note $93
	note $73
	note $53
	note $43
	octave4
	note $21
	octave3
	note $c1
	note $91
	note $63
	note $71
	notetype $06, $a5
	note $96
	octave4
	note $10
	note $27
	notetype $08, $a5
	octave3
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	note $25
	notetype $06, $a5
	note $06
	octave4
	note $40
	note $57
	notetype $08, $a5
	octave3
	note $50
	note $00
	note $50
	note $00
	note $50
	note $00
	note $55
	note $05
	notetype $0c, $a5
	octave2
	note $c0
	note $70
	note $c0
	octave3
	note $50
	note $70
	note $50
	note $70
	note $c0
	octave4
	note $50
	octave3
	note $c0
	octave4
	note $50
	note $70
	note $c0
	note $70
	note $50
	octave3
	note $c0
	note $73
	note $43
	octave2
	note $c3
	note $03
	loopchannel $00, $6fe0 ; end
; 0xef09d

_Music_Route26_Ch2: ; 0xef09d
	stereopanning $f0
	vibrato $14, $23
	dutycycle $02
	notetype $0c, $c7
	octave1
	note $b3
	note $01
	notetype $06, $c7
	note $b0
	note $00
	octave2
	note $b0
	note $00
	octave1
	note $97
	note $03
	note $90
	note $00
	octave2
	note $90
	note $00
	octave1
	note $77
	note $03
	note $70
	note $00
	octave2
	note $70
	note $00
	notetype $0c, $c7
	octave1
	note $9b
	notetype $08, $c7
	note $91
	octave2
	note $11
	note $41
	dutycycle $02
	notetype $0c, $c2
	octave2
	note $25
	note $20
	note $90
	note $21
	note $21
	note $91
	note $21
	octave1
	note $c5
	note $c0
	octave2
	note $a0
	octave1
	note $c1
	note $c1
	note $c1
	note $c1
	callchannel _Music_Route26_sub_0xef14e
	note $a5
	note $a0
	octave2
	note $c0
	notetype $08, $c2
	octave1
	note $c1
	note $c1
	note $c1
	octave2
	note $c1
	note $c1
	note $c1
	notetype $0c, $c2
	callchannel _Music_Route26_sub_0xef14e
	intensity $c7
	octave2
	note $73
	note $01
	notetype $06, $c2
	note $71
	note $71
	note $73
	note $73
	note $43
	note $43
	notetype $08, $c2
	octave2
	note $91
	note $91
	note $91
	octave1
	note $95
	loopchannel $03, $710e
	octave2
	note $91
	note $91
	note $91
	notetype $0c, $c7
	note $70
	note $40
	note $10
	octave1
	note $90
	dutycycle $03
	octave4
	note $25
	note $45
	note $53
	note $75
	note $c3
	note $a1
	note $91
	note $a1
	note $95
	note $41
	note $01
	note $41
	note $91
	note $41
	note $61
	note $01
	note $61
	note $75
	note $93
	note $a7
	note $01
	note $a1
	note $91
	note $71
	note $a7
	note $03
	note $91
	note $a1
	note $cb
	note $03
	note $4b
	note $40
	note $20
	note $10
	note $40
	loopchannel $00, $70ce ; end
; 0xef14e

_Music_Route26_sub_0xef14e: ; 0xef14e
; subroutine
	note $b5
	note $b0
	octave2
	note $b0
	octave1
	note $b1
	note $b1
	octave2
	note $b1
	octave1
	note $b1
	endchannel ; end
; 0xef15a

_Music_Route26_Ch3: ; 0xef15a
	stereopanning $ff
	vibrato $12, $23
	notetype $0c, $14
	vibrato $18, $23
	octave4
	note $b3
	note $01
	notetype $06, $14
	note $60
	note $00
	note $b0
	note $00
	octave5
	note $17
	note $03
	octave4
	note $90
	note $00
	octave5
	note $10
	note $00
	note $27
	note $03
	octave4
	note $b0
	note $00
	octave5
	note $20
	note $00
	notetype $0c, $14
	note $4b
	notetype $08, $14
	note $71
	note $61
	note $41
	vibrato $18, $23
	notetype $0c, $14
	octave5
	note $20
	note $01
	octave4
	note $90
	callchannel _Music_Route26_sub_0xef22f
	vibrato $25, $13
	note $20
	note $00
	octave4
	note $90
	octave5
	note $20
	callchannel _Music_Route26_sub_0xef22f
	note $60
	note $00
	note $20
	note $60
	note $b7
	note $b0
	note $00
	octave6
	note $10
	note $00
	note $2b
	note $43
	note $27
	note $17
	octave5
	note $b7
	octave6
	note $13
	note $90
	note $40
	note $10
	octave5
	note $90
	intensity $15
	octave2
	note $a0
	note $00
	note $a0
	note $02
	notetype $06, $15
	note $a0
	note $00
	note $a0
	note $00
	note $a1
	note $01
	note $a1
	note $01
	octave3
	note $a1
	note $01
	octave2
	note $a3
	note $c1
	note $01
	note $c1
	note $05
	note $c0
	note $00
	note $c0
	note $00
	note $c1
	note $01
	note $c1
	note $01
	octave3
	note $c1
	note $01
	note $a3
	note $91
	note $01
	octave2
	note $91
	note $05
	note $90
	note $00
	note $90
	note $00
	note $91
	note $01
	note $91
	note $01
	octave3
	note $91
	note $01
	octave2
	note $91
	note $01
	octave3
	note $21
	note $09
	note $20
	note $00
	note $20
	note $00
	note $21
	note $01
	note $21
	note $01
	octave4
	note $61
	note $01
	note $23
	octave3
	note $77
	notetype $08, $15
	octave2
	note $70
	note $00
	note $70
	note $00
	note $70
	note $00
	note $75
	note $05
	octave4
	note $15
	octave3
	note $10
	note $00
	note $10
	note $00
	note $10
	note $00
	note $15
	note $05
	notetype $0c, $15
	octave2
	note $cf
	note $c7
	octave3
	note $73
	note $40
	note $00
	octave2
	note $90
	octave3
	note $10
	loopchannel $00, $718a ; end
; 0xef22f

_Music_Route26_sub_0xef22f: ; 0xef22f
; subroutine
	octave5
	note $67
	note $21
	note $61
	note $93
	note $73
	note $23
	note $43
	endchannel ; end
; 0xef238

_Music_Route26_Ch4: ; 0xef238
	togglenoise $04
	notetype $0c
	note $c5
	note $30
	note $30
	loopchannel $03, $723c
	callchannel _Music_Route26_sub_0xef2b0
	notetype $06
	callchannel _Music_Route26_sub_0xef29a
	callchannel _Music_Route26_sub_0xef29a
	callchannel _Music_Route26_sub_0xef2a8
	note $3b
	note $31
	note $31
	notetype $08
	note $31
	note $21
	note $21
	note $31
	note $31
	note $51
	notetype $06
	callchannel _Music_Route26_sub_0xef29a
	callchannel _Music_Route26_sub_0xef29a
	notetype $08
	note $31
	note $31
	note $31
	note $c5
	loopchannel $04, $7266
	notetype $06
	callchannel _Music_Route26_sub_0xef2a8
	callchannel _Music_Route26_sub_0xef2a8
	callchannel _Music_Route26_sub_0xef29a
	callchannel _Music_Route26_sub_0xef2a8
	notetype $06
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	notetype $08
	note $31
	note $31
	note $31
	note $cb
	loopchannel $02, $727c
	notetype $0c
	note $cf
	callchannel _Music_Route26_sub_0xef2b0
	loopchannel $00, $7246 ; end
; 0xef29a

_Music_Route26_sub_0xef29a: ; 0xef29a
; subroutine
	note $5b
	note $31
	note $31
	note $33
	note $33
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	endchannel ; end
; 0xef2a8

_Music_Route26_sub_0xef2a8: ; 0xef2a8
; subroutine
	note $5b
	note $31
	note $31
	note $33
	note $33
	note $53
	note $33
	endchannel ; end
; 0xef2b0

_Music_Route26_sub_0xef2b0: ; 0xef2b0
; subroutine
	notetype $06
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	notetype $08
	note $31
	note $31
	note $51
	endchannel ; end
; 0xef2d0
