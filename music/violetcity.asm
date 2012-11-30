_Music_VioletCity: ; 0xf0000
	db $c0
	dw _Music_VioletCity_Ch1
	db $01
	dw _Music_VioletCity_Ch2
	db $02
	dw _Music_VioletCity_Ch3
	db $03
	dw _Music_VioletCity_Ch4
; 0xf000c

_Music_VioletCity_Ch1: ; 0xf000c
	tempo $a400
	volume $77
	vibrato $12, $25
	dutycycle $02
	notetype $0c, $95
	note $0f
	stereopanning $f0
	octave2
	note $50
	note $90
	note $c0
	stereopanning $ff
	octave3
	note $40
	note $90
	note $00
	note $b3
	note $91
	note $71
	note $21
	stereopanning $0f
	octave2
	note $40
	note $70
	note $b0
	stereopanning $ff
	octave3
	note $20
	note $70
	note $00
	note $43
	note $91
	note $41
	octave2
	note $91
	note $20
	note $50
	note $90
	note $c0
	octave3
	note $90
	note $00
	octave2
	note $c3
	notetype $06, $91
	octave3
	note $21
	note $61
	note $21
	note $61
	note $91
	note $c1
	intensity $a4
	octave2
	note $c7
	note $03
	octave3
	note $2b
	note $07
	notetype $06, $95
	note $03
	octave2
	note $c1
	octave3
	note $21
	note $43
	note $41
	note $51
	note $41
	note $01
	note $71
	note $01
	note $91
	note $01
	note $c1
	note $01
	stereopanning $f0
	octave4
	note $21
	octave3
	note $91
	note $51
	octave4
	note $21
	stereopanning $ff
	note $11
	octave3
	note $91
	note $51
	octave4
	note $11
	stereopanning $0f
	octave3
	note $c1
	note $01
	note $c1
	note $01
	note $b7
	stereopanning $ff
	note $03
	note $21
	note $51
	note $b3
	note $b1
	octave4
	note $21
	octave3
	note $b1
	note $01
	note $71
	note $01
	note $51
	note $01
	note $21
	note $01
	stereopanning $0f
	note $47
	stereopanning $ff
	note $57
	stereopanning $f0
	note $61
	note $01
	note $61
	note $01
	note $71
	note $01
	note $83
	stereopanning $ff
	note $91
	note $40
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $40
	note $00
	note $c3
	note $91
	note $91
	note $b1
	note $01
	note $b1
	note $01
	note $43
	note $71
	note $01
	notetype $0c, $95
	note $07
	octave4
	note $62
	dutycycle $01
	notetype $06, $75
	note $90
	note $c0
	octave5
	note $47
	notetype $0c, $93
	dutycycle $02
	note $0f
	notetype $06, $91
	stereopanning $f0
	octave3
	note $51
	octave2
	note $c1
	note $91
	octave3
	note $51
	stereopanning $0f
	octave2
	note $c1
	note $91
	note $c1
	octave3
	note $51
	intensity $a4
	stereopanning $ff
	note $47
	note $07
	dutycycle $03
	intensity $84
	note $03
	note $81
	note $a1
	note $c3
	octave4
	note $33
	note $23
	notetype $08, $84
	octave3
	note $c0
	octave4
	note $20
	octave3
	note $c0
	note $a2
	notetype $0c, $84
	note $70
	note $00
	note $71
	note $20
	note $00
	note $71
	note $33
	note $53
	note $71
	note $c0
	note $00
	note $c0
	octave4
	note $20
	note $31
	note $71
	note $51
	notetype $08, $84
	note $30
	note $50
	note $30
	note $22
	notetype $0c, $84
	octave3
	note $c0
	note $00
	note $a1
	note $70
	note $00
	note $a1
	octave4
	note $53
	note $33
	note $21
	note $90
	note $50
	octave3
	note $c0
	octave4
	note $50
	note $90
	note $00
	note $90
	note $b0
	note $c3
	note $03
	note $90
	note $60
	octave3
	note $c0
	octave4
	note $60
	note $90
	note $00
	note $90
	note $b0
	note $c3
	note $03
	note $20
	octave3
	note $c0
	note $70
	octave4
	note $20
	octave3
	note $c0
	note $70
	octave4
	note $20
	octave3
	note $c0
	note $70
	note $20
	note $70
	note $b0
	octave4
	note $20
	note $70
	note $b0
	octave5
	note $20
	dutycycle $02
	octave4
	note $25
	note $10
	octave3
	note $c0
	octave4
	note $23
	note $03
	loopchannel $00, $4056 ; end
; 0xf0162

_Music_VioletCity_Ch2: ; 0xf0162
	vibrato $12, $24
	dutycycle $02
	notetype $0c, $c7
	note $0f
	octave3
	note $90
	note $00
	note $b0
	note $00
	note $c0
	note $00
	octave4
	note $43
	note $21
	octave3
	note $b1
	note $91
	note $70
	note $00
	note $90
	note $00
	note $b0
	note $00
	octave4
	note $23
	octave3
	note $c1
	note $b1
	note $c1
	note $90
	note $00
	note $b0
	note $00
	note $c0
	note $00
	note $93
	note $b1
	note $c1
	octave4
	note $21
	note $41
	octave3
	note $71
	octave4
	note $40
	note $00
	note $25
	note $01
	note $40
	note $50
	intensity $b7
	note $73
	note $01
	note $70
	note $90
	note $70
	note $00
	note $50
	note $00
	note $40
	note $00
	note $70
	note $00
	note $5d
	note $20
	note $40
	note $53
	note $01
	note $50
	note $70
	note $50
	note $00
	note $40
	note $00
	note $20
	note $00
	note $50
	note $00
	note $4b
	note $01
	octave3
	note $c0
	octave4
	note $20
	note $43
	note $01
	note $40
	note $50
	note $40
	note $00
	note $20
	note $00
	octave3
	note $c1
	octave4
	note $20
	note $00
	note $43
	note $93
	note $c2
	note $02
	note $20
	note $40
	note $51
	octave3
	note $91
	note $c1
	octave4
	note $51
	note $40
	octave3
	note $70
	note $c0
	octave4
	note $40
	note $20
	octave3
	note $50
	note $b0
	octave4
	note $20
	octave3
	note $cb
	note $03
	intensity $a7
	dutycycle $03
	note $01
	note $c0
	octave4
	note $20
	note $31
	note $71
	note $51
	notetype $08, $a7
	note $30
	note $50
	note $30
	note $22
	notetype $0c, $a7
	octave3
	note $c0
	note $00
	note $a1
	note $70
	note $00
	note $a1
	octave4
	note $53
	note $33
	note $21
	note $01
	note $80
	note $a0
	note $c1
	octave5
	note $31
	note $21
	notetype $08, $a7
	octave4
	note $c0
	octave5
	note $20
	octave4
	note $c0
	note $a2
	notetype $0c, $a7
	note $80
	note $00
	note $71
	note $20
	note $00
	note $71
	vibrato $00, $00
	intensity $87
	octave5
	note $53
	note $73
	note $30
	note $50
	note $7b
	note $01
	note $30
	note $50
	note $7b
	note $01
	octave4
	note $b0
	note $c0
	octave5
	note $2a
	note $04
	vibrato $12, $24
	intensity $a7
	dutycycle $02
	octave4
	note $b5
	note $a0
	note $90
	note $73
	note $01
	note $40
	note $50
	loopchannel $00, $4199 ; end
; 0xf0247

_Music_VioletCity_Ch3: ; 0xf0247
	notetype $0c, $25
	note $0f
	note $05
	octave4
	note $53
	note $05
	note $05
	octave3
	note $93
	note $05
	note $05
	note $63
	note $05
	octave2
	note $73
	octave3
	note $20
	note $00
	note $b3
	note $a0
	note $90
	note $71
	octave2
	note $b1
	notetype $0c, $25
	note $c0
	note $04
	note $c0
	note $c0
	note $01
	note $c0
	note $00
	octave3
	note $71
	octave2
	note $70
	note $00
	octave3
	note $20
	note $04
	note $20
	note $20
	note $01
	note $20
	note $00
	note $91
	octave2
	note $90
	note $00
	note $70
	note $04
	note $70
	note $70
	note $70
	note $00
	note $70
	note $00
	octave3
	note $71
	note $20
	note $00
	octave2
	note $c0
	note $04
	note $c0
	note $c0
	note $01
	note $c0
	note $00
	octave3
	note $c3
	note $90
	note $04
	note $90
	note $90
	note $80
	note $00
	note $80
	note $00
	note $71
	note $70
	note $00
	notetype $06, $25
	octave3
	note $21
	note $61
	note $91
	note $c1
	octave4
	note $21
	note $61
	note $91
	note $c1
	octave4
	note $25
	notetype $0c, $25
	note $04
	notetype $06, $25
	octave2
	note $51
	note $09
	note $51
	note $51
	note $71
	note $01
	note $71
	note $01
	octave3
	note $23
	note $13
	octave2
	note $c1
	note $09
	note $c1
	note $c1
	note $03
	note $c1
	note $01
	note $a7
	callchannel _Music_VioletCity_sub_0xf0311
	note $71
	note $09
	note $c1
	note $c1
	note $c1
	note $01
	note $b7
	note $a1
	note $01
	callchannel _Music_VioletCity_sub_0xf0311
	note $71
	note $09
	note $c1
	note $c1
	note $c1
	note $01
	note $b7
	note $a1
	note $01
	octave3
	note $51
	note $09
	note $51
	note $51
	note $03
	note $51
	note $01
	note $c3
	note $91
	note $71
	note $61
	note $09
	note $61
	note $61
	note $03
	note $61
	note $01
	octave4
	note $23
	octave3
	note $b1
	note $91
	note $71
	note $09
	note $71
	note $71
	octave2
	note $71
	note $01
	note $71
	note $01
	octave3
	note $73
	octave2
	note $71
	note $91
	octave3
	note $7b
	note $91
	note $a1
	note $b7
	note $03
	octave2
	note $b3
	loopchannel $00, $4261 ; end
; 0xf0311

_Music_VioletCity_sub_0xf0311: ; 0xf0311
; subroutine
	note $81
	note $09
	note $81
	note $81
	note $a1
	note $01
	note $a1
	note $01
	octave3
	note $53
	octave2
	note $a3
	endchannel ; end
; 0xf031e

_Music_VioletCity_Ch4: ; 0xf031e
	togglenoise $03
	notetype $0c
	note $41
	note $31
	note $40
	note $40
	note $31
	note $33
	note $73
	callchannel _Music_VioletCity_sub_0xf036c
	callchannel _Music_VioletCity_sub_0xf036c
	callchannel _Music_VioletCity_sub_0xf036c
	note $31
	note $40
	note $40
	note $31
	note $17
	note $41
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	callchannel _Music_VioletCity_sub_0xf037a
	loopchannel $00, $4338 ; end
; 0xf036c

_Music_VioletCity_sub_0xf036c: ; 0xf036c
; subroutine
	note $30
	note $30
	note $40
	note $40
	note $31
	note $81
	note $80
	note $80
	note $71
	note $80
	note $80
	note $80
	note $80
	endchannel ; end
; 0xf037a

_Music_VioletCity_sub_0xf037a: ; 0xf037a
; subroutine
	note $41
	note $80
	note $80
	note $80
	note $00
	note $40
	note $40
	note $01
	note $41
	note $31
	note $41
	endchannel ; end
; 0xf0386
