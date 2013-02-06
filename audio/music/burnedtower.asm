_Music_BurnedTower: ; 0xf6a99
	db $c0
	dw _Music_BurnedTower_Ch1
	db $01
	dw _Music_BurnedTower_Ch2
	db $02
	dw _Music_BurnedTower_Ch3
	db $03
	dw _Music_BurnedTower_Ch4
; 0xf6aa5

_Music_BurnedTower_Ch1: ; 0xf6aa5
	tempo $a800
	volume $77
	dutycycle $01
	tone $0400
	vibrato $08, $45
	stereopanning $f0
	notetype $0c, $91
	note $01
	octave2
	note $a3
	note $a3
	note $a1
	intensity $80
	octave3
	note $45
	intensity $91
	note $33
	note $33
	note $31
	intensity $80
	note $25
	intensity $91
	octave2
	note $a3
	note $a3
	note $a1
	intensity $80
	note $b5
	loopchannel $02, $6ac8
	tempo $9600
	intensity $b1
	octave2
	note $a3
	note $a3
	note $a1
	intensity $a0
	octave3
	note $45
	intensity $b1
	note $33
	note $33
	note $31
	intensity $a0
	note $25
	intensity $b1
	octave2
	note $a3
	note $a3
	note $a1
	intensity $a0
	note $b5
	intensity $b1
	note $a3
	note $a3
	note $a1
	intensity $b3
	note $bf
	note $bf
	note $bf
	note $95
	intensity $b1
	note $a3
	note $a3
	note $a1
	intensity $a0
	note $b5
	intensity $b1
	note $c3
	note $c3
	note $c1
	intensity $a0
	octave3
	note $65
	intensity $b1
	note $53
	note $53
	note $51
	intensity $a0
	note $45
	intensity $b1
	octave2
	note $c3
	note $c3
	note $c1
	intensity $a0
	octave3
	note $15
	loopchannel $02, $6b17
	loopchannel $00, $6ad8 ; end
; 0xf6b29

_Music_BurnedTower_Ch2: ; 0xf6b29
	dutycycle $02
	vibrato $20, $82
	tone $0200
	notetype $0c, $70
	callchannel _Music_BurnedTower_sub_0xf6b8e
	intensity $c5
	callchannel _Music_BurnedTower_sub_0xf6b8e
	intensity $c1
	dutycycle $03
	note $01
	octave2
	note $a3
	note $a3
	note $a1
	intensity $b0
	octave3
	note $45
	intensity $c1
	note $33
	note $33
	note $31
	intensity $b0
	note $25
	intensity $c1
	octave2
	note $a3
	note $a3
	note $a1
	intensity $b0
	note $b3
	intensity $c1
	intensity $c2
	octave3
	note $a0
	note $80
	note $a0
	octave4
	note $10
	vibrato $00, $00
	intensity $3d
	note $57
	vibrato $20, $83
	intensity $b0
	octave2
	note $83
	dutycycle $02
	intensity $b0
	octave3
	note $73
	note $51
	note $71
	note $83
	note $c3
	octave4
	note $23
	note $31
	note $21
	octave3
	note $c3
	note $83
	note $73
	note $51
	note $71
	note $83
	note $53
	intensity $b7
	note $7f
	loopchannel $00, $6b39 ; end
; 0xf6b8e

_Music_BurnedTower_sub_0xf6b8e: ; 0xf6b8e
; subroutine
	octave3
	note $53
	note $31
	note $51
	note $63
	note $a3
	note $c3
	octave4
	note $11
	octave3
	note $c1
	note $a3
	note $63
	note $53
	note $31
	note $51
	note $63
	note $33
	note $5f
	endchannel ; end
; 0xf6ba2

_Music_BurnedTower_Ch3: ; 0xf6ba2
	stereopanning $0f
	notetype $0c, $14
	note $0f
	note $0f
	note $0f
	note $0b
	octave3
	note $43
	octave2
	note $a1
	octave3
	note $51
	note $01
	note $51
	note $01
	note $51
	note $63
	octave2
	note $a1
	octave3
	note $51
	note $01
	note $51
	note $01
	note $51
	note $43
	loopchannel $04, $6bad
	octave2
	note $c1
	octave3
	note $71
	note $01
	note $71
	note $01
	note $71
	note $83
	octave2
	note $c1
	octave3
	note $71
	note $01
	note $71
	note $01
	note $71
	note $63
	loopchannel $02, $6bc3
	loopchannel $00, $6bad ; end
; 0xf6bdd

_Music_BurnedTower_Ch4: ; 0xf6bdd
	togglenoise $00
	notetype $0c
	note $0f
	loopchannel $04, $6be1
	note $01
	stereopanning $f0
	note $81
	note $91
	note $83
	note $91
	note $83
	loopchannel $00, $6be7 ; end
; 0xf6bf2
