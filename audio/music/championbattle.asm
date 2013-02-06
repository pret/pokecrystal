_Music_ChampionBattle: ; 0xea9c1
	db $80
	dw _Music_ChampionBattle_Ch1
	db $01
	dw _Music_ChampionBattle_Ch2
	db $02
	dw _Music_ChampionBattle_Ch3
; 0xea9ca

_Music_ChampionBattle_Ch1: ; 0xea9ca
	tempo $6200
	volume $77
	dutycycle $03
	tone $0200
	vibrato $12, $15
	notetype $0c, $b2
	octave2
	note $b7
	note $b7
	note $b7
	note $b3
	intensity $b7
	note $c3
	callchannel _Music_ChampionBattle_sub_0xeaaee
	octave3
	note $43
	loopchannel $02, $69e2
	callchannel _Music_ChampionBattle_sub_0xeaaee
	octave3
	note $53
	callchannel _Music_ChampionBattle_sub_0xeaafc
	loopchannel $03, $69f0
	callchannel _Music_ChampionBattle_sub_0xeab06
	callchannel _Music_ChampionBattle_sub_0xeaafc
	loopchannel $07, $69fa
	callchannel _Music_ChampionBattle_sub_0xeab06
	intensity $b2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $43
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $53
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $73
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $93
	intensity $a0
	note $b7
	octave2
	note $b7
	octave3
	note $cb
	intensity $b2
	note $b0
	note $c0
	octave4
	note $10
	note $20
	callchannel _Music_ChampionBattle_sub_0xeab0f
	note $51
	note $51
	intensity $b7
	note $73
	intensity $b2
	note $51
	note $51
	intensity $b7
	note $93
	loopchannel $02, $6a3d
	intensity $b2
	note $51
	note $51
	intensity $b7
	note $c3
	callchannel _Music_ChampionBattle_sub_0xeab0f
	note $51
	note $51
	intensity $b7
	note $73
	intensity $b2
	note $51
	note $51
	intensity $b7
	note $93
	intensity $b2
	note $51
	note $51
	intensity $b7
	note $c3
	intensity $b2
	note $51
	note $51
	intensity $b7
	octave4
	note $53
	callchannel _Music_ChampionBattle_sub_0xeab24
	note $c3
	note $93
	callchannel _Music_ChampionBattle_sub_0xeab24
	octave4
	note $33
	note $33
	intensity $a0
	octave3
	note $b7
	octave2
	note $b7
	octave3
	note $77
	octave2
	note $77
	intensity $60
	note $cf
	intensity $70
	note $cf
	intensity $80
	octave3
	note $2f
	intensity $a0
	note $4f
	intensity $b4
	octave4
	note $73
	note $63
	note $53
	note $43
	note $33
	note $23
	note $73
	note $73
	note $73
	note $63
	note $53
	note $43
	note $71
	note $91
	note $41
	note $51
	note $73
	note $73
	note $0f
	intensity $90
	octave3
	note $77
	intensity $b4
	note $53
	note $53
	intensity $90
	note $4f
	note $2f
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $43
	loopchannel $04, $6ab1
	intensity $b2
	note $11
	note $11
	intensity $b7
	note $43
	loopchannel $02, $6abe
	intensity $b2
	note $11
	note $11
	intensity $b7
	note $73
	intensity $b2
	note $11
	note $11
	intensity $b7
	note $93
	callchannel _Music_ChampionBattle_sub_0xeab31
	octave3
	note $41
	note $41
	intensity $b7
	note $c3
	callchannel _Music_ChampionBattle_sub_0xeab31
	octave3
	note $41
	note $41
	intensity $b7
	octave4
	note $33
	loopchannel $00, $6a35 ; end
; 0xeaaee

_Music_ChampionBattle_sub_0xeaaee: ; 0xeaaee
; subroutine
	intensity $b2
	octave2
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	note $b5
	note $b1
	note $b1
	intensity $b7
	endchannel ; end
; 0xeaafc

_Music_ChampionBattle_sub_0xeaafc: ; 0xeaafc
; subroutine
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	octave3
	note $43
	endchannel ; end
; 0xeab06

_Music_ChampionBattle_sub_0xeab06: ; 0xeab06
; subroutine
	intensity $b2
	octave2
	note $b1
	note $b1
	intensity $b7
	note $c3
	endchannel ; end
; 0xeab0f

_Music_ChampionBattle_sub_0xeab0f: ; 0xeab0f
; subroutine
	intensity $b5
	octave3
	note $41
	note $b1
	note $41
	note $73
	note $61
	note $51
	note $c1
	note $71
	note $b1
	note $61
	note $a1
	note $51
	note $91
	note $41
	note $81
	intensity $b2
	endchannel ; end
; 0xeab24

_Music_ChampionBattle_sub_0xeab24: ; 0xeab24
; subroutine
	intensity $b2
	octave3
	note $b1
	note $b3
	note $b3
	note $b3
	note $b3
	note $b3
	note $b1
	intensity $b7
	endchannel ; end
; 0xeab31

_Music_ChampionBattle_sub_0xeab31: ; 0xeab31
; subroutine
	intensity $b2
	note $41
	note $41
	intensity $b7
	note $b3
	intensity $b2
	note $41
	note $41
	intensity $b7
	note $c3
	intensity $b2
	note $41
	note $41
	intensity $b7
	octave4
	note $23
	intensity $b2
	endchannel ; end
; 0xeab4a

_Music_ChampionBattle_Ch2: ; 0xeab4a
	dutycycle $03
	vibrato $08, $36
	tone $0100
	notetype $0c, $c2
	octave3
	note $47
	note $47
	note $47
	note $43
	intensity $c7
	note $33
	callchannel _Music_ChampionBattle_sub_0xeac4f
	note $b3
	callchannel _Music_ChampionBattle_sub_0xeac4f
	note $c3
	callchannel _Music_ChampionBattle_sub_0xeac4f
	octave4
	note $23
	callchannel _Music_ChampionBattle_sub_0xeac5c
	note $33
	callchannel _Music_ChampionBattle_sub_0xeac5c
	note $63
	callchannel _Music_ChampionBattle_sub_0xeac5c
	note $33
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $c3
	intensity $c2
	note $41
	note $41
	intensity $c7
	octave4
	note $13
	intensity $c2
	octave3
	note $41
	note $41
	intensity $c7
	octave4
	note $23
	note $47
	octave3
	note $47
	octave4
	note $57
	intensity $3c
	note $57
	intensity $c5
	note $45
	octave3
	note $b5
	octave4
	note $41
	note $31
	note $23
	note $13
	octave3
	note $c3
	note $b3
	intensity $c7
	note $c7
	octave4
	note $57
	intensity $c2
	octave3
	note $91
	note $91
	intensity $c7
	note $c3
	intensity $c2
	note $91
	note $91
	intensity $c7
	octave4
	note $23
	intensity $c5
	note $45
	octave3
	note $b5
	octave4
	note $41
	note $31
	note $23
	note $13
	octave3
	note $c3
	note $b1
	note $c1
	intensity $c7
	octave4
	note $57
	note $97
	note $57
	note $c7
	callchannel _Music_ChampionBattle_sub_0xeac79
	note $53
	note $53
	callchannel _Music_ChampionBattle_sub_0xeac79
	note $73
	note $73
	intensity $c7
	note $47
	octave3
	note $47
	octave4
	note $27
	octave3
	note $27
	intensity $b0
	note $4f
	note $4f
	note $6f
	note $7f
	intensity $c4
	octave5
	note $43
	note $33
	note $23
	note $13
	note $41
	note $31
	note $21
	note $11
	octave4
	note $c3
	note $c3
	loopchannel $02, $6bef
	intensity $b0
	octave3
	note $4f
	note $cf
	note $bf
	note $9f
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $c3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $a3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $c3
	intensity $c2
	note $41
	note $41
	intensity $c7
	octave4
	note $23
	intensity $c2
	octave3
	note $41
	note $41
	intensity $c7
	octave4
	note $33
	intensity $b0
	note $47
	note $57
	note $77
	note $57
	note $47
	note $57
	note $77
	note $97
	loopchannel $00, $6b9d ; end
; 0xeac4f

_Music_ChampionBattle_sub_0xeac4f: ; 0xeac4f
; subroutine
	intensity $c2
	note $41
	note $45
	note $41
	note $45
	note $41
	note $45
	note $41
	note $41
	intensity $c7
	endchannel ; end
; 0xeac5c

_Music_ChampionBattle_sub_0xeac5c: ; 0xeac5c
; subroutine
	intensity $c2
	octave3
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $c3
	intensity $c2
	note $41
	note $41
	intensity $c7
	note $b3
	intensity $c2
	note $41
	note $41
	intensity $c7
	endchannel ; end
; 0xeac79

_Music_ChampionBattle_sub_0xeac79: ; 0xeac79
; subroutine
	intensity $c1
	note $41
	note $43
	note $43
	note $43
	note $43
	note $43
	note $41
	intensity $c5
	endchannel ; end
; 0xeac85

_Music_ChampionBattle_Ch3: ; 0xeac85
	notetype $0c, $14
	octave3
	note $40
	note $06
	loopchannel $03, $6c88
	note $40
	note $02
	note $53
	callchannel _Music_ChampionBattle_sub_0xead61
	callchannel _Music_ChampionBattle_sub_0xead61
	callchannel _Music_ChampionBattle_sub_0xead61
	callchannel _Music_ChampionBattle_sub_0xead6f
	note $33
	callchannel _Music_ChampionBattle_sub_0xead6f
	note $a3
	callchannel _Music_ChampionBattle_sub_0xead6f
	note $33
	note $40
	note $00
	note $40
	note $00
	note $b3
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
	octave4
	note $23
	note $47
	octave3
	note $47
	note $c3
	note $81
	note $c1
	note $71
	note $b1
	note $61
	note $a1
	note $41
	note $b1
	loopchannel $08, $6cc6
	note $51
	note $c1
	loopchannel $05, $6ccc
	note $51
	octave4
	note $11
	octave3
	note $a1
	note $c1
	note $81
	note $a1
	note $41
	note $b1
	loopchannel $08, $6cda
	note $51
	note $c1
	loopchannel $08, $6ce0
	callchannel _Music_ChampionBattle_sub_0xead83
	octave3
	note $41
	note $51
	note $41
	note $51
	note $41
	octave4
	note $31
	note $21
	note $11
	callchannel _Music_ChampionBattle_sub_0xead83
	octave3
	note $41
	note $b1
	note $41
	note $b1
	note $41
	octave4
	note $31
	note $21
	note $11
	octave3
	note $b7
	note $47
	note $c7
	note $47
	note $41
	note $71
	loopchannel $10, $6d05
	callchannel _Music_ChampionBattle_sub_0xead8e
	octave3
	note $51
	note $c1
	octave4
	note $41
	note $51
	note $71
	octave3
	note $c1
	octave4
	note $41
	note $51
	callchannel _Music_ChampionBattle_sub_0xead8e
	octave3
	note $51
	note $c1
	loopchannel $04, $6d1d
	note $41
	note $b1
	loopchannel $05, $6d24
	note $c1
	octave4
	note $41
	octave3
	note $41
	note $01
	note $41
	note $01
	note $51
	note $c1
	loopchannel $05, $6d32
	octave4
	note $21
	note $51
	octave3
	note $51
	note $01
	note $51
	note $01
	note $41
	note $91
	loopchannel $08, $6d40
	note $41
	note $b1
	loopchannel $07, $6d46
	note $c1
	note $b1
	octave3
	note $41
	note $b1
	octave4
	note $31
	note $41
	loopchannel $07, $6d4e
	note $21
	octave3
	note $c1
	note $b1
	note $91
	loopchannel $00, $6cc6 ; end
; 0xead61

_Music_ChampionBattle_sub_0xead61: ; 0xead61
; subroutine
	note $40
	note $00
	note $40
	note $04
	loopchannel $03, $6d61
	note $40
	note $00
	note $40
	note $00
	note $c3
	endchannel ; end
; 0xead6f

_Music_ChampionBattle_sub_0xead6f: ; 0xead6f
; subroutine
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
	note $40
	note $00
	endchannel ; end
; 0xead83

_Music_ChampionBattle_sub_0xead83: ; 0xead83
; subroutine
	octave3
	note $41
	note $71
	note $41
	note $71
	note $41
	octave4
	note $31
	note $21
	note $11
	endchannel ; end
; 0xead8e

_Music_ChampionBattle_sub_0xead8e: ; 0xead8e
; subroutine
	octave3
	note $51
	note $c1
	note $51
	note $c1
	note $51
	note $c1
	octave4
	note $41
	note $51
	endchannel ; end
; 0xead99
