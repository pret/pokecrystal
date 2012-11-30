_Music_GymLeaderVictory: ; 0xf462c
	db $c0
	dw _Music_GymLeaderVictory_Ch1
	db $01
	dw _Music_GymLeaderVictory_Ch2
	db $02
	dw _Music_GymLeaderVictory_Ch3
	db $03
	dw _Music_GymLeaderVictory_Ch4
; 0xf4638

_Music_GymLeaderVictory_Ch1: ; 0xf4638
	tempo $7400
	volume $77
	vibrato $12, $34
	dutycycle $03
	tone $0100
	notetype $0c, $b7
	octave4
	note $35
	octave3
	note $a0
	octave4
	note $30
	note $75
	note $30
	note $70
	note $a5
	note $70
	note $a0
	octave5
	note $37
	stereopanning $0f
	dutycycle $01
	callchannel _Music_GymLeaderVictory_sub_0xf4689
	octave4
	note $23
	note $53
	callchannel _Music_GymLeaderVictory_sub_0xf4689
	note $77
	loopchannel $02, $4658
	dutycycle $02
	callchannel _Music_GymLeaderVictory_sub_0xf46a0
	note $a3
	note $83
	note $75
	note $30
	note $50
	note $75
	note $51
	note $37
	note $27
	dutycycle $03
	callchannel _Music_GymLeaderVictory_sub_0xf46a0
	note $23
	note $53
	note $85
	note $a0
	note $80
	note $a5
	note $81
	intensity $87
	note $7f
	loopchannel $00, $4658 ; end
; 0xf4689

_Music_GymLeaderVictory_sub_0xf4689: ; 0xf4689
; subroutine
	intensity $91
	octave3
	note $71
	note $a1
	octave4
	note $31
	octave3
	note $a0
	note $70
	note $51
	note $a1
	octave4
	note $21
	octave3
	note $a0
	note $50
	note $31
	note $81
	note $c1
	note $80
	note $30
	endchannel ; end
; 0xf46a0

_Music_GymLeaderVictory_sub_0xf46a0: ; 0xf46a0
; subroutine
	intensity $87
	octave3
	note $7d
	note $30
	note $70
	note $a7
	note $73
	note $a0
	note $90
	note $70
	note $a0
	note $9d
	note $50
	note $90
	note $c7
	octave4
	note $33
	note $50
	note $30
	note $50
	note $30
	note $2d
	octave3
	note $a0
	octave4
	note $20
	note $57
	endchannel ; end
; 0xf46bd

_Music_GymLeaderVictory_Ch2: ; 0xf46bd
	vibrato $12, $34
	dutycycle $03
	notetype $0c, $d7
	octave4
	note $a5
	note $70
	note $a0
	octave5
	note $35
	octave4
	note $a0
	octave5
	note $30
	note $7f
	dutycycle $03
	intensity $a1
	callchannel _Music_GymLeaderVictory_sub_0xf4711
	note $a3
	note $a3
	callchannel _Music_GymLeaderVictory_sub_0xf4711
	note $35
	dutycycle $02
	note $c0
	octave5
	note $20
	callchannel _Music_GymLeaderVictory_sub_0xf4711
	note $a3
	note $a3
	callchannel _Music_GymLeaderVictory_sub_0xf4711
	note $37
	dutycycle $03
	callchannel _Music_GymLeaderVictory_sub_0xf4720
	note $73
	note $53
	note $3d
	octave4
	note $c1
	intensity $a7
	note $af
	dutycycle $02
	callchannel _Music_GymLeaderVictory_sub_0xf4720
	octave4
	note $a3
	octave5
	note $23
	note $3d
	note $51
	intensity $a6
	note $3b
	note $01
	dutycycle $03
	octave4
	note $c0
	octave5
	note $20
	loopchannel $00, $46d0 ; end
; 0xf4711

_Music_GymLeaderVictory_sub_0xf4711: ; 0xf4711
; subroutine
	octave5
	note $31
	note $21
	octave4
	note $c3
	octave5
	note $21
	octave4
	note $c1
	note $a3
	note $c1
	note $a1
	note $81
	note $71
	endchannel ; end
; 0xf4720

_Music_GymLeaderVictory_sub_0xf4720: ; 0xf4720
; subroutine
	intensity $98
	note $a5
	note $70
	note $a0
	octave5
	note $37
	note $3f
	octave4
	note $c5
	note $90
	note $c0
	octave5
	note $57
	note $5f
	octave4
	note $85
	note $50
	note $80
	octave5
	note $27
	note $27
	endchannel ; end
; 0xf4737

_Music_GymLeaderVictory_Ch3: ; 0xf4737
	notetype $0c, $25
	octave3
	note $7f
	note $39
	octave2
	note $a1
	note $c1
	octave3
	note $21
	stereopanning $f0
	note $31
	note $03
	octave2
	note $a1
	octave3
	note $21
	note $03
	octave2
	note $a1
	note $c1
	note $03
	note $81
	note $a1
	note $01
	octave3
	note $23
	note $31
	note $03
	octave2
	note $a1
	octave3
	note $21
	note $03
	octave2
	note $a1
	note $c1
	note $03
	note $81
	octave3
	note $31
	note $05
	loopchannel $02, $4744
	callchannel _Music_GymLeaderVictory_sub_0xf479e
	octave3
	note $31
	note $01
	note $31
	octave4
	note $31
	note $01
	octave3
	note $31
	note $71
	note $31
	note $a1
	note $01
	octave2
	note $a1
	octave3
	note $51
	note $01
	octave2
	note $a1
	octave3
	note $21
	octave2
	note $a1
	callchannel _Music_GymLeaderVictory_sub_0xf479e
	octave3
	note $31
	note $01
	note $81
	octave4
	note $31
	note $01
	octave3
	note $31
	note $81
	note $51
	note $31
	note $01
	note $31
	note $a1
	note $01
	octave2
	note $a1
	note $c1
	octave3
	note $21
	loopchannel $00, $4744 ; end
; 0xf479e

_Music_GymLeaderVictory_sub_0xf479e: ; 0xf479e
; subroutine
	octave3
	note $31
	note $01
	note $31
	octave4
	note $31
	note $01
	octave3
	note $31
	note $71
	note $31
	note $a1
	note $01
	note $31
	note $71
	note $01
	octave2
	note $a1
	octave3
	note $31
	octave2
	note $a1
	octave3
	note $51
	note $01
	note $51
	octave4
	note $51
	note $01
	octave3
	note $51
	note $91
	note $51
	note $c1
	note $01
	note $51
	note $91
	note $01
	octave2
	note $c1
	octave3
	note $51
	octave2
	note $c1
	note $a1
	note $01
	note $a1
	octave3
	note $a1
	note $01
	octave2
	note $a1
	octave3
	note $21
	octave2
	note $a1
	octave3
	note $a1
	note $01
	octave2
	note $a1
	octave3
	note $51
	note $01
	octave2
	note $a1
	octave3
	note $21
	octave2
	note $a1
	endchannel ; end
; 0xf47e5

_Music_GymLeaderVictory_Ch4: ; 0xf47e5
	togglenoise $04
	notetype $0c
	note $cf
	note $cf
	callchannel _Music_GymLeaderVictory_sub_0xf480b
	note $45
	note $41
	note $47
	callchannel _Music_GymLeaderVictory_sub_0xf480b
	note $45
	note $41
	note $43
	note $20
	note $20
	note $20
	note $20
	note $41
	note $81
	note $31
	note $41
	note $81
	note $41
	note $31
	note $81
	loopchannel $10, $47fb
	loopchannel $00, $47eb ; end
; 0xf480b

_Music_GymLeaderVictory_sub_0xf480b: ; 0xf480b
; subroutine
	note $45
	note $41
	note $43
	note $31
	note $41
	loopchannel $03, $480b
	endchannel ; end
; 0xf4815
