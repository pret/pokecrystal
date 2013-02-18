_Music_BattleTowerLobby: ; 0x17948b
	db $c0
	dw _Music_BattleTowerLobby_Ch1
	db $01
	dw _Music_BattleTowerLobby_Ch2
	db $02
	dw _Music_BattleTowerLobby_Ch3
	db $03
	dw _Music_BattleTowerLobby_Ch4
; 0x179497

_Music_BattleTowerLobby_Ch1: ; 0x179497
	tempo $9800
	volume $77
	dutycycle $03
	tone $0100
	vibrato $08, $22
	stereopanning $f0
	notetype $0c, $72
	notetype $0c, $72
	octave3
	note $91
	notetype $0c, $73
	octave2
	note $c1
	octave3
	note $51
	note $91
	note $51
	octave2
	note $c1
	octave3
	note $51
	note $91
	notetype $0c, $72
	note $71
	notetype $0c, $73
	octave2
	note $c1
	octave3
	note $71
	note $51
	note $41
	octave2
	note $c1
	octave3
	note $41
	note $71
	notetype $0c, $72
	note $91
	notetype $0c, $73
	octave2
	note $c1
	octave3
	note $51
	note $91
	octave2
	note $c1
	octave3
	note $51
	note $c1
	octave4
	note $51
	notetype $0c, $72
	note $72
	notetype $0c, $73
	note $30
	note $51
	octave3
	note $c1
	note $91
	note $51
	note $91
	note $c1
	notetype $0c, $72
	note $21
	notetype $0c, $73
	note $41
	note $51
	note $20
	octave2
	note $c0
	note $a3
	notetype $0c, $62
	note $a3
	notetype $0c, $72
	note $c1
	notetype $0c, $73
	octave3
	note $21
	note $41
	note $50
	note $70
	note $93
	notetype $0c, $62
	octave2
	note $93
	notetype $0c, $72
	note $a1
	notetype $0c, $73
	note $c1
	octave3
	note $21
	note $30
	note $50
	note $31
	note $51
	note $71
	note $a1
	notetype $0c, $72
	note $c1
	notetype $0c, $73
	note $c3
	note $a0
	note $90
	notetype $0c, $72
	note $73
	notetype $0c, $75
	octave2
	note $c3
	loopchannel $00, $54a9 ; end
; 0x17953a

_Music_BattleTowerLobby_Ch2: ; 0x17953a
	dutycycle $02
	vibrato $10, $34
	stereopanning $0f
	notetype $0c, $82
	notetype $0c, $82
	octave4
	note $51
	note $53
	octave3
	note $c0
	octave4
	note $50
	note $c3
	note $a1
	note $91
	note $a2
	note $50
	octave3
	note $c3
	notetype $0c, $65
	note $73
	octave2
	note $c3
	notetype $0c, $82
	octave4
	note $51
	note $53
	octave3
	note $c0
	octave4
	note $50
	note $c3
	note $a1
	note $91
	note $a2
	note $70
	notetype $0c, $87
	note $9b
	notetype $0c, $82
	octave3
	note $a1
	notetype $0c, $84
	note $a3
	note $70
	note $90
	note $a3
	notetype $0c, $82
	note $23
	octave4
	note $91
	notetype $0c, $84
	note $93
	note $70
	note $90
	note $53
	notetype $0c, $82
	octave3
	note $53
	octave4
	note $71
	notetype $0c, $84
	note $73
	note $a0
	note $90
	note $a3
	note $33
	notetype $0c, $82
	note $51
	notetype $0c, $84
	note $53
	note $70
	note $50
	note $43
	notetype $0c, $73
	octave3
	note $40
	note $70
	note $c0
	octave4
	note $40
	loopchannel $00, $5544 ; end
; 0x1795ae

_Music_BattleTowerLobby_Ch3: ; 0x1795ae
	notetype $0c, $11
	octave2
	note $c1
	octave3
	note $51
	note $01
	note $51
	note $01
	note $51
	note $01
	note $51
	octave2
	note $c1
	octave3
	note $51
	note $01
	note $51
	note $01
	note $41
	note $01
	note $41
	octave2
	note $c1
	octave3
	note $51
	note $01
	note $51
	note $01
	note $51
	note $01
	note $51
	octave2
	note $a1
	octave3
	note $31
	note $01
	octave2
	note $a1
	note $c1
	octave3
	note $51
	note $01
	note $51
	octave2
	note $a1
	octave3
	note $21
	octave2
	note $51
	octave3
	note $51
	octave2
	note $a1
	octave3
	note $21
	note $51
	note $01
	octave2
	note $c1
	octave3
	note $51
	octave2
	note $51
	octave3
	note $51
	octave2
	note $91
	note $c1
	octave3
	note $51
	note $01
	note $31
	octave2
	note $71
	note $a1
	octave3
	note $71
	octave2
	note $71
	note $a1
	octave3
	note $31
	note $71
	note $51
	octave2
	note $c1
	note $51
	note $c1
	note $71
	note $51
	note $41
	note $71
	loopchannel $00, $55b1 ; end
; 0x179610

_Music_BattleTowerLobby_Ch4: ; 0x179610
	togglenoise $00
	notetype $0c
	note $01
	note $63
	note $63
	note $61
	note $63
	loopchannel $00, $5612 ; end
; 0x17961d
