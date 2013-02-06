_Music_LookRocket: ; 0xf74a2
	db $c0
	dw _Music_LookRocket_Ch1
	db $01
	dw _Music_LookRocket_Ch2
	db $02
	dw _Music_LookRocket_Ch3
	db $03
	dw _Music_LookRocket_Ch4
; 0xf74ae

_Music_LookRocket_Ch1: ; 0xf74ae
	tempo $7b00
	volume $77
	forceoctave $02
	stereopanning $0f
	dutycycle $03
	vibrato $05, $64
	notetype $0c, $a8
	octave4
	note $10
	note $30
	callchannel _Music_LookRocket_sub_0xf74e6
	dutycycle $01
	intensity $a8
	callchannel _Music_LookRocket_sub_0xf74f7
	callchannel _Music_LookRocket_sub_0xf758a
	octave4
	note $70
	note $00
	intensity $53
	callchannel _Music_LookRocket_sub_0xf750c
	intensity $c3
	callchannel _Music_LookRocket_sub_0xf750c
	intensity $e3
	callchannel _Music_LookRocket_sub_0xf750c
	note $0f
	loopchannel $00, $74c7 ; end
; 0xf74e6

_Music_LookRocket_sub_0xf74e6: ; 0xf74e6
; subroutine
	note $40
	note $00
	note $30
	note $00
	note $20
	note $00
	note $10
	note $02
	octave2
	note $60
	note $90
	note $c0
	octave3
	note $30
	note $60
	note $90
	endchannel ; end
; 0xf74f7

_Music_LookRocket_sub_0xf74f7: ; 0xf74f7
; subroutine
	note $01
	octave3
	note $40
	note $04
	note $43
	octave2
	note $a1
	octave3
	note $40
	note $60
	note $75
	note $40
	note $02
	note $70
	note $00
	note $40
	note $00
	octave4
	note $70
	note $00
	endchannel ; end
; 0xf750c

_Music_LookRocket_sub_0xf750c: ; 0xf750c
; subroutine
	note $01
	octave2
	note $c0
	note $06
	octave3
	note $10
	note $04
	endchannel ; end
; 0xf7514

_Music_LookRocket_Ch2: ; 0xf7514
	forceoctave $02
	vibrato $04, $64
	dutycycle $03
	notetype $0c, $b7
	stereopanning $ff
	octave5
	note $10
	note $30
	callchannel _Music_LookRocket_sub_0xf7547
	intensity $b7
	callchannel _Music_LookRocket_sub_0xf758a
	octave5
	note $10
	note $00
	callchannel _Music_LookRocket_sub_0xf7554
	intensity $53
	callchannel _Music_LookRocket_sub_0xf7568
	intensity $c3
	callchannel _Music_LookRocket_sub_0xf7568
	intensity $e3
	callchannel _Music_LookRocket_sub_0xf7568
	callchannel _Music_LookRocket_sub_0xf756f
	loopchannel $00, $7526 ; end
; 0xf7547

_Music_LookRocket_sub_0xf7547: ; 0xf7547
; subroutine
	note $40
	note $00
	note $30
	note $00
	note $20
	note $00
	note $10
	note $02
	octave3
	note $c5
	dutycycle $00
	endchannel ; end
; 0xf7554

_Music_LookRocket_sub_0xf7554: ; 0xf7554
; subroutine
	note $01
	octave4
	note $40
	note $04
	note $63
	note $10
	note $30
	note $40
	note $60
	note $75
	note $40
	note $02
	note $70
	note $00
	note $40
	note $00
	octave5
	note $40
	note $00
	endchannel ; end
; 0xf7568

_Music_LookRocket_sub_0xf7568: ; 0xf7568
; subroutine
	note $01
	octave3
	note $60
	note $06
	note $70
	note $04
	endchannel ; end
; 0xf756f

_Music_LookRocket_sub_0xf756f: ; 0xf756f
; subroutine
	intensity $63
	note $90
	note $60
	note $30
	octave2
	note $c0
	intensity $a3
	octave3
	note $a0
	note $70
	note $40
	note $10
	intensity $c3
	note $b0
	note $80
	note $50
	note $20
	intensity $f3
	note $c0
	note $90
	note $60
	note $30
	endchannel ; end
; 0xf758a

_Music_LookRocket_sub_0xf758a: ; 0xf758a
; subroutine
	octave3
	note $01
	note $80
	note $04
	note $a7
	note $b5
	note $a0
	note $02
	note $b0
	note $00
	note $a0
	note $00
	endchannel ; end
; 0xf7597

_Music_LookRocket_Ch3: ; 0xf7597
	forceoctave $02
	vibrato $04, $22
	notetype $0c, $14
	stereopanning $f0
	note $01
	callchannel _Music_LookRocket_sub_0xf75bf
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf75fe
	intensity $24
	callchannel _Music_LookRocket_sub_0xf7623
	intensity $14
	callchannel _Music_LookRocket_sub_0xf75cc
	callchannel _Music_LookRocket_sub_0xf7623
	callchannel _Music_LookRocket_sub_0xf75e1
	loopchannel $00, $75a5 ; end
; 0xf75bf

_Music_LookRocket_sub_0xf75bf: ; 0xf75bf
; subroutine
	octave3
	note $60
	note $00
	note $90
	note $00
	octave4
	note $10
	note $00
	note $30
	note $02
	octave3
	note $35
	endchannel ; end
; 0xf75cc

_Music_LookRocket_sub_0xf75cc: ; 0xf75cc
; subroutine
	octave2
	note $90
	note $00
	octave3
	note $90
	note $00
	octave2
	note $90
	note $00
	note $90
	note $00
	note $a0
	note $00
	octave3
	note $a0
	note $00
	note $10
	note $00
	note $70
	note $00
	endchannel ; end
; 0xf75e1

_Music_LookRocket_sub_0xf75e1: ; 0xf75e1
; subroutine
	intensity $24
	octave2
	note $90
	note $00
	octave3
	note $60
	note $00
	octave2
	note $a0
	note $00
	octave3
	note $70
	note $00
	intensity $14
	octave2
	note $b0
	note $00
	octave3
	note $80
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $90
	note $00
	endchannel ; end
; 0xf75fe

_Music_LookRocket_sub_0xf75fe: ; 0xf75fe
; subroutine
	note $10
	note $00
	octave4
	note $10
	note $00
	octave3
	note $10
	note $00
	note $10
	note $00
	octave4
	note $10
	note $00
	octave3
	note $10
	note $00
	note $40
	note $00
	note $80
	note $00
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
	note $10
	note $00
	note $70
	note $00
	note $a0
	note $00
	endchannel ; end
; 0xf7623

_Music_LookRocket_sub_0xf7623: ; 0xf7623
; subroutine
	octave2
	note $90
	note $00
	octave3
	note $90
	note $00
	octave2
	note $90
	note $00
	note $90
	note $00
	note $a0
	note $00
	octave3
	note $a0
	note $00
	note $90
	note $70
	note $40
	note $10
	endchannel ; end
; 0xf7638

_Music_LookRocket_Ch4: ; 0xf7638
	togglenoise $03
	notetype $0c
	note $01
	callchannel _Music_LookRocket_sub_0xf765c
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf765c
	loopchannel $00, $7640 ; end
; 0xf765c

_Music_LookRocket_sub_0xf765c: ; 0xf765c
; subroutine
	note $17
	note $31
	note $41
	note $20
	note $20
	note $30
	note $30
	endchannel ; end
; 0xf7664

_Music_LookRocket_sub_0xf7664: ; 0xf7664
; subroutine
	note $41
	note $71
	note $31
	note $71
	note $41
	note $71
	note $31
	note $71
	endchannel ; end
; 0xf766d
