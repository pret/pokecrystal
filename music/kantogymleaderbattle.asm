_Music_KantoGymLeaderBattle: ; 0xec720
	db $80
	dw _Music_KantoGymLeaderBattle_Ch1
	db $01
	dw _Music_KantoGymLeaderBattle_Ch2
	db $02
	dw _Music_KantoGymLeaderBattle_Ch3
; 0xec729

_Music_KantoGymLeaderBattle_Ch1: ; 0xec729
	tempo $6500
	volume $77
	dutycycle $03
	tone $0200
	vibrato $12, $15
	notetype $0c, $b2
	octave3
	note $b0
	note $a0
	note $90
	note $80
	note $90
	note $80
	note $70
	note $80
	note $70
	note $60
	note $70
	note $60
	note $50
	note $60
	note $50
	note $40
	note $50
	note $40
	note $30
	note $40
	note $30
	note $20
	note $30
	note $20
	note $10
	note $20
	note $10
	octave2
	note $c0
	octave3
	note $10
	octave2
	note $c0
	note $b0
	note $c0
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	note $b7
	intensity $b7
	note $c1
	intensity $b2
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	note $b7
	intensity $b7
	octave3
	note $51
	intensity $b2
	octave2
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	note $b7
	intensity $b7
	note $c1
	intensity $b2
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	intensity $b4
	octave3
	note $53
	note $53
	note $51
	callchannel _Music_KantoGymLeaderBattle_sub_0xec832
	octave2
	note $b1
	intensity $b7
	note $97
	note $c7
	octave3
	note $49
	note $55
	callchannel _Music_KantoGymLeaderBattle_sub_0xec832
	note $41
	intensity $b7
	note $27
	octave2
	note $c7
	note $99
	octave3
	note $55
	intensity $b2
	note $41
	note $41
	note $80
	note $50
	note $40
	note $80
	note $41
	note $41
	note $b0
	note $90
	note $50
	note $b0
	note $41
	note $41
	note $c0
	note $b0
	note $90
	note $c0
	note $41
	intensity $b7
	note $51
	intensity $b2
	note $41
	note $41
	note $80
	note $50
	note $40
	note $80
	note $41
	note $41
	note $b0
	note $90
	note $50
	note $b0
	note $41
	note $41
	note $c0
	note $b0
	note $90
	note $c0
	note $91
	intensity $b5
	note $c1
	note $41
	note $21
	octave2
	note $b3
	note $41
	note $91
	note $c1
	octave3
	note $51
	note $43
	note $21
	octave2
	note $b1
	note $b1
	note $41
	note $b1
	octave3
	note $21
	intensity $b7
	octave2
	note $c7
	note $b7
	note $99
	note $c5
	intensity $b5
	octave3
	note $41
	note $21
	octave2
	note $b3
	note $41
	note $91
	note $c1
	octave3
	note $51
	note $43
	note $21
	octave2
	note $b1
	note $b1
	note $91
	note $b1
	octave3
	note $21
	intensity $b7
	note $57
	note $77
	note $8f
	intensity $b2
	octave2
	note $91
	note $91
	intensity $b7
	octave3
	note $2b
	intensity $b2
	note $91
	note $63
	intensity $b5
	octave2
	note $63
	note $81
	note $91
	note $b1
	intensity $b2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $4b
	intensity $b2
	note $b1
	note $83
	intensity $b7
	octave4
	note $45
	intensity $4c
	octave3
	note $33
	loopchannel $00, $478b ; end
; 0xec832

_Music_KantoGymLeaderBattle_sub_0xec832: ; 0xec832
; subroutine
	intensity $b5
	note $41
	octave2
	note $b1
	octave3
	note $41
	note $53
	note $41
	note $21
	octave2
	note $b1
	note $41
	note $91
	note $b1
	octave3
	note $41
	note $51
	note $41
	note $21
	endchannel ; end
; 0xec847

_Music_KantoGymLeaderBattle_Ch2: ; 0xec847
	dutycycle $03
	vibrato $08, $36
	tone $0100
	notetype $0c, $c2
	octave4
	note $b0
	note $90
	note $b0
	octave5
	note $40
	loopchannel $08, $4852
	octave3
	intensity $c2
	note $41
	note $41
	note $70
	note $50
	note $40
	note $70
	note $41
	note $41
	note $b0
	note $90
	note $70
	note $b0
	note $41
	note $41
	note $c0
	note $b0
	note $90
	note $c0
	note $31
	intensity $c7
	note $51
	intensity $c2
	note $41
	note $41
	note $70
	note $50
	note $40
	note $70
	note $41
	note $41
	note $b0
	note $90
	note $70
	note $b0
	note $41
	note $41
	note $c0
	note $b0
	note $90
	note $c0
	note $91
	intensity $c7
	note $c1
	intensity $c2
	octave4
	loopchannel $02, $485d
	callchannel _Music_KantoGymLeaderBattle_sub_0xec907
	note $57
	note $97
	note $c9
	note $95
	callchannel _Music_KantoGymLeaderBattle_sub_0xec907
	note $57
	note $97
	note $c9
	octave4
	note $55
	note $47
	intensity $b7
	note $47
	intensity $a2
	note $05
	octave5
	note $53
	note $53
	note $51
	intensity $a0
	note $47
	intensity $a7
	note $47
	note $0b
	intensity $c5
	octave3
	note $b3
	note $c3
	note $93
	note $b3
	note $c3
	note $93
	note $53
	intensity $b0
	note $47
	note $4f
	intensity $b7
	note $4b
	intensity $c5
	note $b3
	note $c3
	note $93
	note $b3
	note $c3
	note $93
	note $c3
	intensity $b0
	note $b7
	intensity $b7
	note $b7
	intensity $b0
	octave4
	note $47
	intensity $b7
	note $47
	intensity $c2
	octave3
	note $21
	note $21
	intensity $c7
	note $67
	intensity $c2
	octave4
	note $23
	note $61
	note $23
	intensity $c7
	note $93
	note $81
	note $61
	note $41
	intensity $c2
	octave3
	note $41
	note $41
	intensity $c7
	note $87
	intensity $c2
	octave4
	note $43
	note $81
	note $43
	intensity $c7
	note $b5
	octave3
	note $a3
	loopchannel $00, $4894 ; end
; 0xec907

_Music_KantoGymLeaderBattle_sub_0xec907: ; 0xec907
; subroutine
	dutycycle $02
	intensity $d1
	octave3
	note $b1
	intensity $a2
	note $b1
	intensity $d1
	note $91
	intensity $a2
	note $91
	intensity $d1
	note $b1
	intensity $a2
	note $b1
	intensity $c5
	note $c1
	octave4
	note $21
	note $21
	octave3
	note $c3
	note $b1
	note $91
	note $71
	note $91
	note $b1
	dutycycle $03
	intensity $b0
	endchannel ; end
; 0xec92e

_Music_KantoGymLeaderBattle_Ch3: ; 0xec92e
	notetype $0c, $19
	octave2
	note $50
	note $00
	note $c2
	note $00
	loopchannel $06, $4934
	note $c1
	note $91
	note $c1
	note $40
	note $00
	note $40
	note $00
	note $73
	note $40
	note $00
	note $40
	note $00
	note $b3
	note $40
	note $00
	note $40
	note $00
	note $c3
	note $30
	note $00
	note $61
	note $40
	note $00
	note $40
	note $00
	note $73
	note $40
	note $00
	note $40
	note $00
	note $b3
	note $40
	note $00
	note $40
	note $00
	note $c3
	note $40
	note $00
	note $51
	loopchannel $02, $493d
	octave2
	note $41
	note $b1
	loopchannel $08, $4965
	note $51
	note $c1
	loopchannel $04, $496c
	octave1
	note $c1
	octave2
	note $51
	octave1
	note $c1
	octave2
	note $53
	note $c1
	octave3
	note $51
	octave2
	note $c1
	octave2
	note $71
	octave3
	note $21
	loopchannel $08, $497f
	octave2
	note $51
	note $c1
	loopchannel $07, $4987
	octave3
	note $51
	octave2
	note $c1
	note $40
	note $00
	note $40
	note $00
	note $b3
	note $40
	note $00
	note $40
	note $00
	note $c3
	note $40
	note $00
	note $40
	note $00
	note $b3
	note $40
	note $00
	note $51
	loopchannel $02, $4992
	note $41
	note $b1
	loopchannel $07, $49a8
	octave3
	note $21
	octave2
	note $b1
	note $51
	note $c1
	octave3
	note $51
	octave2
	note $51
	note $c1
	octave3
	note $51
	octave2
	note $51
	note $c1
	loopchannel $05, $49bb
	octave2
	note $71
	octave3
	note $21
	loopchannel $07, $49c2
	octave2
	note $b1
	octave3
	note $21
	octave2
	note $51
	note $b1
	octave3
	note $51
	note $71
	note $91
	note $71
	note $51
	note $21
	octave2
	note $41
	note $b1
	loopchannel $04, $49d8
	note $21
	note $91
	loopchannel $08, $49df
	note $41
	note $b1
	loopchannel $04, $49e5
	octave3
	note $41
	octave2
	note $b1
	note $41
	note $31
	note $31
	note $b1
	octave3
	note $41
	note $61
	loopchannel $00, $4965 ; end
; 0xec9fa
