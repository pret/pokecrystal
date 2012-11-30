_Music_VermilionCity: ; 0xeb676
	db $80
	dw _Music_VermilionCity_Ch1
	db $01
	dw _Music_VermilionCity_Ch2
	db $02
	dw _Music_VermilionCity_Ch3
; 0xeb67f

; 0xeb67f
	db $03
; 0xeb680

_Music_VermilionCity_Ch1: ; 0xeb680
	stereopanning $0f
	tempo $b000
	volume $77
	dutycycle $02
	notetype $0c, $65
	octave4
	note $c3
	note $93
	note $73
	note $53
	note $33
	octave3
	note $c3
	note $a1
	note $c0
	octave4
	note $30
	note $50
	note $90
	note $c0
	octave5
	note $30
	vibrato $10, $23
	dutycycle $01
	notetype $0c, $85
	callchannel _Music_VermilionCity_sub_0xeb6f9
	note $63
	octave4
	note $33
	note $23
	note $53
	callchannel _Music_VermilionCity_sub_0xeb6f9
	callchannel _Music_VermilionCity_sub_0xeb701
	dutycycle $02
	notetype $0c, $85
	callchannel _Music_VermilionCity_sub_0xeb6f9
	note $63
	octave4
	note $33
	note $50
	note $20
	octave3
	note $a0
	note $50
	octave4
	note $20
	octave3
	note $a0
	note $50
	note $10
	callchannel _Music_VermilionCity_sub_0xeb6f9
	callchannel _Music_VermilionCity_sub_0xeb701
	intensity $93
	dutycycle $00
	note $01
	note $71
	note $01
	note $71
	note $01
	note $71
	note $01
	note $71
	callchannel _Music_VermilionCity_sub_0xeb70c
	callchannel _Music_VermilionCity_sub_0xeb70c
	intensity $87
	dutycycle $02
	octave4
	note $37
	octave3
	note $97
	note $57
	note $c7
	note $a3
	note $93
	note $73
	note $53
	octave2
	note $c3
	note $93
	note $c3
	octave3
	note $33
	loopchannel $00, $76a0 ; end
; 0xeb6f9

_Music_VermilionCity_sub_0xeb6f9: ; 0xeb6f9
; subroutine
	octave3
	note $23
	note $53
	note $71
	note $a1
	note $51
	note $91
	endchannel ; end
; 0xeb701

_Music_VermilionCity_sub_0xeb701: ; 0xeb701
; subroutine
	note $31
	note $61
	note $a1
	octave4
	note $31
	note $51
	note $21
	octave3
	note $a1
	note $51
	endchannel ; end
; 0xeb70c

_Music_VermilionCity_sub_0xeb70c: ; 0xeb70c
; subroutine
	note $01
	note $71
	note $a1
	note $71
	octave4
	note $31
	octave3
	note $71
	note $a1
	note $71
	note $01
	note $91
	note $c1
	note $91
	octave4
	note $51
	octave3
	note $91
	note $c1
	note $91
	endchannel ; end
; 0xeb721

_Music_VermilionCity_Ch2: ; 0xeb721
	stereopanning $ff
	dutycycle $03
	notetype $0c, $77
	vibrato $10, $23
	octave5
	note $53
	note $33
	octave4
	note $c3
	note $93
	note $73
	note $53
	note $73
	note $93
	notetype $0c, $97
	callchannel _Music_VermilionCity_sub_0xeb768
	note $91
	callchannel _Music_VermilionCity_sub_0xeb768
	note $51
	intensity $b7
	octave3
	note $c3
	octave4
	note $23
	note $33
	note $53
	callchannel _Music_VermilionCity_sub_0xeb77e
	callchannel _Music_VermilionCity_sub_0xeb77e
	note $75
	note $50
	note $70
	note $57
	note $a5
	note $90
	note $a0
	note $97
	note $9d
	notetype $06, $57
	note $00
	octave4
	note $50
	note $90
	note $c0
	notetype $0c, $87
	octave5
	note $5f
	loopchannel $00, $7735 ; end
; 0xeb768

_Music_VermilionCity_sub_0xeb768: ; 0xeb768
; subroutine
	octave1
	note $a7
	octave2
	note $73
	note $53
	note $35
	note $20
	note $30
	note $57
	octave1
	note $a7
	octave2
	note $73
	note $53
	note $35
	note $50
	note $30
	note $21
	note $51
	octave1
	note $a1
	endchannel ; end
; 0xeb77e

_Music_VermilionCity_sub_0xeb77e: ; 0xeb77e
; subroutine
	note $77
	note $c7
	note $a3
	note $93
	note $73
	note $53
	endchannel ; end
; 0xeb785

_Music_VermilionCity_Ch3: ; 0xeb785
	stereopanning $f0
	vibrato $22, $23
	notetype $0c, $25
	octave2
	note $53
	note $c3
	octave3
	note $53
	note $c3
	note $33
	note $53
	note $31
	octave3
	note $c0
	note $90
	note $70
	note $50
	note $30
	octave2
	note $c0
	notetype $0c, $22
	callchannel _Music_VermilionCity_sub_0xeb7de
	octave5
	note $a5
	intensity $24
	note $50
	note $90
	callchannel _Music_VermilionCity_sub_0xeb7de
	note $a7
	intensity $14
	octave3
	note $33
	note $23
	octave2
	note $c3
	note $a3
	octave3
	note $31
	note $03
	note $30
	note $30
	callchannel _Music_VermilionCity_sub_0xeb7f5
	octave4
	note $31
	octave3
	note $31
	note $01
	note $31
	callchannel _Music_VermilionCity_sub_0xeb7f5
	intensity $25
	octave3
	note $57
	octave4
	note $57
	octave3
	note $c7
	octave4
	note $57
	octave2
	note $5f
	octave3
	note $5d
	intensity $22
	octave5
	note $50
	note $90
	loopchannel $00, $779e ; end
; 0xeb7de

_Music_VermilionCity_sub_0xeb7de: ; 0xeb7de
; subroutine
	octave5
	note $a7
	octave6
	note $33
	note $23
	octave5
	note $c5
	note $a0
	note $c0
	octave6
	note $27
	octave5
	note $a7
	octave6
	note $33
	note $23
	octave5
	note $c5
	octave6
	note $20
	octave5
	note $c0
	endchannel ; end
; 0xeb7f5

_Music_VermilionCity_sub_0xeb7f5: ; 0xeb7f5
; subroutine
	note $a0
	note $00
	note $a1
	note $01
	note $71
	note $51
	note $03
	note $50
	note $50
	octave4
	note $50
	note $00
	note $31
	note $01
	octave3
	note $c0
	octave4
	note $20
	endchannel ; end
; 0xeb808
