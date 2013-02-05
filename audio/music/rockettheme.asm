_Music_RocketTheme: ; 0xf766d
	db $c0
	dw _Music_RocketTheme_Ch1
	db $01
	dw _Music_RocketTheme_Ch2
	db $02
	dw _Music_RocketTheme_Ch3
	db $03
	dw _Music_RocketTheme_Ch4
; 0xf7679

_Music_RocketTheme_Ch1: ; 0xf7679
	tempo $8000
	volume $77
	dutycycle $03
	stereopanning $0f
	vibrato $05, $64
	notetype $0c, $a8
	octave4
	note $10
	note $30
	dutycycle $03
	notetype $0c, $a8
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
	dutycycle $00
	notetype $06, $b3
	vibrato $06, $64
	callchannel _Music_RocketTheme_sub_0xf7727
	octave4
	note $60
	note $72
	note $61
	note $01
	note $41
	note $01
	note $11
	note $31
	note $41
	note $11
	octave3
	note $b1
	note $81
	note $b1
	octave4
	note $11
	note $03
	note $33
	note $03
	note $43
	note $03
	note $41
	note $71
	callchannel _Music_RocketTheme_sub_0xf7727
	octave3
	note $70
	note $82
	note $61
	note $01
	note $41
	note $01
	note $11
	note $31
	note $41
	note $11
	octave2
	note $b1
	note $81
	note $b1
	octave3
	note $11
	note $03
	note $33
	note $03
	note $43
	note $61
	note $51
	note $41
	note $31
	note $03
	note $61
	note $0d
	note $71
	note $09
	loopchannel $03, $76ef
	note $03
	note $61
	note $0d
	note $71
	note $01
	note $71
	note $01
	note $41
	note $11
	note $71
	note $a1
	loopchannel $04, $7701
	note $81
	note $b1
	loopchannel $04, $7707
	note $91
	note $c1
	loopchannel $04, $770d
	octave3
	note $a1
	octave4
	note $11
	loopchannel $04, $7713
	notetype $0c, $b3
	note $0f
	note $0b
	note $61
	note $10
	note $30
	loopchannel $00, $768b ; end
; 0xf7727

_Music_RocketTheme_sub_0xf7727: ; 0xf7727
; subroutine
	note $06
	note $c0
	octave4
	note $11
	note $05
	note $11
	note $01
	octave3
	note $81
	note $05
	octave4
	note $4b
	note $37
	octave3
	note $b1
	note $05
	note $81
	note $01
	note $a1
	note $01
	note $b1
	note $09
	endchannel ; end
; 0xf773e

_Music_RocketTheme_Ch2: ; 0xf773e
	stereopanning $ff
	vibrato $04, $64
	dutycycle $03
	notetype $0c, $b7
	octave5
	note $10
	note $30
	notetype $0c, $b7
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
	vibrato $06, $64
	callchannel _Music_RocketTheme_sub_0xf7800
	octave4
	note $a0
	vibrato $00, $00
	intensity $b8
	note $bd
	vibrato $05, $22
	intensity $b7
	note $b4
	vibrato $06, $64
	notetype $0c, $b7
	note $bb
	note $01
	octave5
	note $10
	note $30
	callchannel _Music_RocketTheme_sub_0xf7800
	note $c0
	vibrato $00, $00
	intensity $b8
	octave4
	note $1d
	vibrato $05, $22
	intensity $b7
	note $14
	vibrato $06, $64
	notetype $0c, $b7
	note $1b
	octave3
	note $b0
	note $a0
	note $90
	note $80
	notetype $06, $b7
	callchannel _Music_RocketTheme_sub_0xf781c
	octave4
	note $30
	note $48
	note $30
	note $20
	note $1b
	note $61
	note $01
	note $71
	note $01
	callchannel _Music_RocketTheme_sub_0xf781c
	octave3
	note $c1
	note $01
	octave4
	note $11
	note $01
	note $31
	note $01
	note $47
	note $03
	note $31
	note $01
	note $11
	octave3
	note $81
	note $c0
	octave4
	note $1e
	note $2f
	note $3f
	note $4f
	note $51
	note $21
	octave3
	note $b1
	note $81
	octave4
	note $61
	note $31
	octave3
	note $c1
	note $91
	octave4
	note $71
	note $41
	note $11
	octave3
	note $a1
	octave4
	note $81
	note $51
	note $21
	octave3
	note $b1
	octave4
	note $91
	note $61
	note $31
	octave3
	note $c1
	octave4
	note $a1
	note $71
	note $41
	note $11
	note $b1
	note $81
	note $51
	note $21
	note $c3
	octave5
	note $11
	note $31
	loopchannel $00, $774b ; end
; 0xf7800

_Music_RocketTheme_sub_0xf7800: ; 0xf7800
; subroutine
	notetype $06, $b7
	note $06
	octave4
	note $30
	note $41
	note $05
	note $41
	note $01
	note $11
	note $05
	note $7b
	note $67
	note $41
	note $05
	note $11
	note $01
	note $31
	note $01
	note $41
	note $01
	octave3
	note $41
	note $01
	note $41
	note $01
	endchannel ; end
; 0xf781c

_Music_RocketTheme_sub_0xf781c: ; 0xf781c
; subroutine
	octave3
	note $c0
	octave4
	note $12
	note $43
	note $13
	note $77
	note $67
	note $13
	endchannel ; end
; 0xf7826

_Music_RocketTheme_Ch3: ; 0xf7826
	stereopanning $f0
	vibrato $04, $22
	notetype $0c, $14
	note $01
	notetype $0c, $14
	callchannel _Music_LookRocket_sub_0xf75bf
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf75fe
	intensity $24
	callchannel _Music_LookRocket_sub_0xf7623
	intensity $14
	callchannel _Music_LookRocket_sub_0xf75cc
	callchannel _Music_LookRocket_sub_0xf7623
	callchannel _Music_LookRocket_sub_0xf75e1
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf75fe
	callchannel _Music_LookRocket_sub_0xf7623
	callchannel _Music_LookRocket_sub_0xf75cc
	callchannel _Music_LookRocket_sub_0xf7623
	callchannel _Music_LookRocket_sub_0xf75cc
	octave3
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
	note $20
	note $00
	octave4
	note $20
	note $00
	octave3
	note $b0
	note $80
	note $50
	note $20
	note $30
	note $00
	octave4
	note $30
	note $00
	octave3
	note $30
	note $00
	note $30
	note $00
	note $40
	note $00
	octave4
	note $40
	note $00
	note $10
	octave3
	note $a0
	note $70
	note $40
	note $50
	note $00
	octave4
	note $20
	note $00
	octave3
	note $60
	note $00
	octave4
	note $30
	note $00
	octave3
	note $70
	note $00
	octave4
	note $40
	note $00
	octave3
	note $80
	note $00
	octave4
	note $50
	note $00
	octave3
	note $90
	note $00
	octave4
	note $60
	note $00
	octave3
	note $a0
	note $00
	octave4
	note $70
	note $00
	octave3
	note $b0
	note $00
	octave4
	note $80
	note $00
	octave3
	note $c1
	octave4
	note $90
	note $00
	loopchannel $00, $782f ; end
; 0xf78be

_Music_RocketTheme_Ch4: ; 0xf78be
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
	note $b1
	note $71
	note $31
	note $71
	note $b1
	note $71
	note $31
	note $71
	loopchannel $0b, $78de
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf7664
	callchannel _Music_LookRocket_sub_0xf765c
	callchannel _Music_LookRocket_sub_0xf765c
	loopchannel $00, $78c3 ; end
; 0xf78fd
