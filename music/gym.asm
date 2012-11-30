_Music_Gym: ; 0xf48ae
	db $c0
	dw _Music_Gym_Ch1
	db $01
	dw _Music_Gym_Ch2
	db $02
	dw _Music_Gym_Ch3
	db $03
	dw _Music_Gym_Ch4
; 0xf48ba

_Music_Gym_Ch1: ; 0xf48ba
	tempo $9c00
	volume $77
	stereopanning $0f
	vibrato $12, $24
	dutycycle $01
	notetype $0c, $b7
	octave4
	note $71
	octave2
	note $a0
	note $a0
	note $a0
	note $02
	octave4
	note $51
	octave2
	note $80
	note $80
	note $80
	note $02
	octave4
	note $31
	octave2
	note $30
	note $30
	note $30
	note $00
	octave3
	note $30
	note $30
	note $c0
	note $80
	note $30
	note $c0
	octave4
	note $20
	octave3
	note $a0
	note $50
	octave4
	note $50
	octave3
	note $ab
	note $71
	note $a1
	note $80
	note $01
	note $50
	note $51
	note $11
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $81
	note $77
	note $a3
	note $71
	note $a1
	note $50
	note $00
	note $50
	note $70
	note $83
	octave4
	note $11
	octave3
	note $c1
	note $a1
	octave4
	note $11
	note $35
	octave3
	note $a1
	note $71
	note $51
	note $81
	note $a1
	note $c0
	note $01
	note $80
	note $83
	octave4
	note $50
	note $01
	note $10
	note $11
	octave3
	note $c0
	note $b0
	note $ab
	note $71
	note $a1
	octave4
	note $11
	octave3
	note $80
	octave4
	note $10
	note $51
	note $11
	note $51
	note $10
	note $50
	note $83
	note $35
	octave3
	note $a0
	note $02
	note $a0
	note $00
	note $a0
	octave4
	note $72
	note $83
	note $73
	note $53
	note $13
	note $30
	note $00
	note $30
	note $50
	note $01
	octave3
	note $c3
	note $71
	note $31
	note $71
	note $b0
	note $a0
	note $80
	note $60
	octave4
	note $33
	note $10
	octave3
	note $b0
	note $a0
	note $80
	octave4
	note $53
	note $75
	octave3
	note $a0
	note $02
	note $a0
	note $00
	note $a0
	octave4
	note $72
	note $a3
	note $83
	note $73
	note $53
	note $30
	octave3
	note $c0
	note $70
	octave4
	note $50
	note $73
	note $50
	note $10
	octave3
	note $80
	octave4
	note $70
	note $83
	note $a0
	note $80
	note $70
	note $50
	note $a3
	octave5
	note $33
	octave4
	note $a0
	note $80
	note $70
	note $50
	loopchannel $00, $48c9 ; end
; 0xf497c

_Music_Gym_Ch2: ; 0xf497c
	dutycycle $01
	stereopanning $f0
	notetype $0c, $c3
	octave2
	note $31
	octave1
	note $30
	note $30
	note $31
	note $a0
	octave2
	note $70
	note $11
	octave1
	note $10
	note $10
	note $11
	octave2
	note $80
	note $50
	octave1
	note $81
	octave1
	note $80
	note $80
	note $81
	octave1
	note $80
	note $80
	note $a3
	octave2
	note $a1
	octave3
	note $10
	note $20
	callchannel _Music_Gym_sub_0xf49e9
	octave3
	note $51
	note $10
	note $20
	callchannel _Music_Gym_sub_0xf49e9
	octave3
	note $10
	note $50
	note $80
	octave4
	note $10
	intensity $d2
	callchannel _Music_Gym_sub_0xf4a15
	octave1
	note $70
	note $c0
	note $71
	octave2
	note $71
	octave1
	note $c1
	note $b3
	note $b1
	note $60
	note $60
	note $80
	octave2
	note $10
	octave1
	note $81
	octave2
	note $81
	note $51
	callchannel _Music_Gym_sub_0xf4a15
	octave1
	note $80
	octave2
	note $10
	octave1
	note $81
	octave2
	note $51
	note $11
	note $33
	note $31
	octave1
	note $a0
	note $a0
	note $a0
	octave2
	note $30
	octave1
	note $a1
	octave2
	note $71
	note $31
	loopchannel $00, $4980 ; end
; 0xf49e9

_Music_Gym_sub_0xf49e9: ; 0xf49e9
; subroutine
	octave3
	note $32
	octave2
	note $32
	note $31
	note $30
	note $30
	note $31
	octave3
	note $31
	octave2
	note $a1
	octave3
	note $12
	octave2
	note $12
	note $11
	note $10
	note $10
	note $11
	octave3
	note $51
	note $10
	note $20
	note $32
	octave2
	note $32
	note $31
	note $30
	note $30
	note $31
	octave3
	note $31
	octave2
	note $a1
	octave3
	note $12
	octave2
	note $12
	note $11
	note $10
	note $10
	note $11
	endchannel ; end
; 0xf4a15

_Music_Gym_sub_0xf4a15: ; 0xf4a15
; subroutine
	octave2
	note $33
	note $31
	octave1
	note $a0
	note $a0
	note $a0
	octave2
	note $30
	octave1
	note $a1
	octave2
	note $a1
	note $31
	note $13
	note $11
	octave1
	note $80
	note $80
	note $80
	octave2
	note $10
	octave1
	note $81
	octave2
	note $81
	note $11
	octave1
	note $c1
	note $01
	note $c1
	note $70
	note $70
	endchannel ; end
; 0xf4a37

_Music_Gym_Ch3: ; 0xf4a37
	vibrato $14, $23
	stereopanning $ff
	notetype $0c, $14
	octave6
	note $31
	octave4
	note $30
	note $30
	note $30
	note $00
	octave5
	note $a0
	octave6
	note $30
	note $11
	octave4
	note $10
	note $10
	note $10
	note $00
	octave5
	note $a0
	octave6
	note $10
	octave5
	note $c1
	octave3
	note $80
	note $80
	note $80
	note $00
	octave5
	note $c0
	note $c0
	note $c3
	octave6
	note $23
	octave5
	note $3b
	octave4
	note $a1
	octave5
	note $31
	note $50
	note $01
	note $10
	note $13
	note $83
	note $53
	note $3b
	octave4
	note $a1
	octave5
	note $31
	note $10
	note $00
	note $10
	note $30
	note $57
	note $03
	note $7b
	note $51
	note $71
	note $80
	note $01
	note $50
	note $53
	octave6
	note $10
	note $01
	octave5
	note $80
	note $83
	note $7b
	note $51
	note $71
	note $81
	note $50
	note $80
	octave6
	note $17
	octave5
	note $c3
	intensity $13
	callchannel _Music_Gym_sub_0xf4ab3
	note $01
	note $a1
	octave6
	note $31
	octave5
	note $a1
	octave6
	note $13
	octave5
	note $b3
	note $a3
	note $83
	callchannel _Music_Gym_sub_0xf4ab3
	note $a0
	note $00
	note $a0
	note $c0
	octave6
	note $13
	note $30
	note $00
	note $30
	note $50
	note $77
	note $53
	loopchannel $00, $4a3c ; end
; 0xf4ab3

_Music_Gym_sub_0xf4ab3: ; 0xf4ab3
; subroutine
	octave5
	note $a5
	octave6
	note $35
	octave5
	note $a3
	octave6
	note $13
	octave5
	note $c3
	note $a3
	note $83
	note $70
	note $00
	note $70
	note $80
	note $a3
	endchannel ; end
; 0xf4ac5

_Music_Gym_Ch4: ; 0xf4ac5
	togglenoise $04
	notetype $0c
	note $31
	note $20
	note $20
	note $c3
	note $31
	note $20
	note $20
	note $c3
	note $31
	note $20
	note $20
	note $31
	note $20
	note $20
	note $b0
	note $40
	note $40
	note $40
	note $20
	note $20
	note $30
	note $30
	notetype $06
	note $35
	note $35
	note $33
	note $31
	note $31
	note $33
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $35
	note $35
	note $33
	note $31
	note $31
	note $33
	note $c7
	loopchannel $04, $4ae1
	note $43
	note $73
	note $33
	note $41
	note $31
	note $41
	note $31
	note $43
	note $33
	note $73
	loopchannel $08, $4afa
	loopchannel $00, $4ac7 ; end
; 0xf4b0c
