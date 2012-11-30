_Music_BugCatchingContest: ; 0xf7c16
	db $c0
	dw _Music_BugCatchingContest_Ch1
	db $01
	dw _Music_BugCatchingContest_Ch2
	db $02
	dw _Music_BugCatchingContest_Ch3
	db $03
	dw _Music_BugCatchingContest_Ch4
; 0xf7c22

_Music_BugCatchingContest_Ch1: ; 0xf7c22
	tempo $9000
	volume $77
	stereopanning $0f
	vibrato $08, $24
	dutycycle $02
	notetype $0c, $b7
	note $07
	octave4
	note $20
	note $00
	note $22
	note $00
	note $20
	note $20
	note $30
	note $00
	note $32
	note $00
	note $30
	note $30
	note $40
	note $00
	note $42
	note $00
	note $40
	note $40
	note $50
	note $00
	note $52
	note $00
	note $50
	note $50
	notetype $0c, $b1
	note $01
	octave2
	note $a1
	loopchannel $04, $7c4e
	note $01
	note $c1
	loopchannel $08, $7c55
	intensity $b4
	dutycycle $01
	octave3
	note $c5
	note $a0
	note $c0
	note $a5
	octave4
	note $30
	note $50
	intensity $b1
	dutycycle $02
	note $01
	octave2
	note $a1
	loopchannel $04, $7c6b
	note $01
	note $c1
	note $01
	note $c1
	notetype $06, $b7
	octave4
	note $53
	note $00
	octave3
	note $c0
	octave4
	note $50
	note $80
	note $c7
	octave5
	note $57
	intensity $b1
	note $03
	octave2
	note $c3
	note $03
	octave3
	note $53
	note $03
	note $53
	note $03
	octave2
	note $a3
	loopchannel $03, $7c8e
	intensity $a7
	octave4
	note $73
	note $a3
	note $03
	octave3
	note $81
	note $c1
	octave4
	note $31
	note $01
	octave3
	note $c1
	note $81
	octave4
	note $80
	note $a0
	note $80
	note $a0
	note $80
	note $a0
	note $80
	note $a0
	note $87
	note $03
	octave3
	note $71
	note $a1
	octave4
	note $31
	note $01
	octave3
	note $a1
	note $71
	octave4
	note $70
	note $80
	note $70
	note $80
	note $70
	note $80
	note $70
	note $80
	note $77
	note $31
	note $01
	octave3
	note $c1
	note $81
	octave4
	note $81
	note $01
	note $31
	octave3
	note $c1
	octave4
	note $c1
	note $01
	note $91
	note $31
	octave3
	note $c1
	octave4
	note $31
	note $91
	note $c1
	note $21
	note $01
	note $25
	note $01
	note $21
	note $21
	note $31
	note $01
	note $35
	note $01
	note $31
	note $31
	note $41
	note $01
	note $45
	note $01
	note $41
	note $41
	note $51
	note $01
	note $55
	note $01
	note $51
	note $51
	loopchannel $00, $7c4b ; end
; 0xf7cf4

_Music_BugCatchingContest_Ch2: ; 0xf7cf4
	stereopanning $f0
	vibrato $08, $23
	dutycycle $01
	notetype $0c, $c7
	note $07
	octave4
	note $a0
	note $00
	note $a2
	note $00
	note $a0
	note $a0
	loopchannel $04, $7cff
	dutycycle $00
	callchannel _Music_BugCatchingContest_sub_0xf7d8e
	octave2
	note $51
	octave3
	note $80
	note $00
	octave1
	note $c1
	octave3
	note $80
	note $00
	octave2
	note $51
	octave3
	note $80
	note $00
	octave2
	note $81
	octave3
	note $80
	note $00
	octave2
	note $a1
	octave3
	note $a0
	note $00
	octave2
	note $91
	octave3
	note $90
	note $00
	octave2
	note $81
	octave3
	note $80
	note $00
	octave2
	note $51
	octave3
	note $50
	note $00
	callchannel _Music_BugCatchingContest_sub_0xf7d8e
	octave2
	note $51
	octave3
	note $80
	note $00
	octave1
	note $c1
	octave3
	note $80
	note $00
	octave2
	note $a1
	octave4
	note $20
	note $00
	octave2
	note $51
	octave4
	note $20
	note $00
	octave2
	note $31
	octave3
	note $70
	note $00
	octave1
	note $a1
	octave3
	note $70
	note $00
	octave1
	note $c1
	octave3
	note $70
	note $00
	octave2
	note $41
	octave3
	note $a0
	note $00
	dutycycle $00
	note $01
	octave5
	note $30
	note $00
	note $21
	note $30
	note $00
	octave4
	note $c7
	note $01
	octave5
	note $30
	note $00
	note $21
	note $30
	note $00
	octave4
	note $a7
	note $01
	octave5
	note $33
	note $71
	note $51
	note $30
	note $00
	note $21
	note $30
	note $00
	note $50
	note $00
	note $50
	note $02
	note $59
	note $a0
	note $00
	note $a0
	note $02
	note $a9
	loopchannel $00, $7d0a ; end
; 0xf7d8e

_Music_BugCatchingContest_sub_0xf7d8e: ; 0xf7d8e
; subroutine
	octave2
	note $31
	octave3
	note $70
	note $00
	octave1
	note $a1
	octave3
	note $70
	note $00
	octave1
	note $c1
	octave3
	note $70
	note $00
	octave2
	note $21
	octave3
	note $70
	note $00
	octave2
	note $51
	octave3
	note $80
	note $00
	octave1
	note $c1
	octave3
	note $80
	note $00
	octave2
	note $21
	octave3
	note $80
	note $00
	octave2
	note $41
	octave3
	note $80
	note $00
	endchannel ; end
; 0xf7db7

_Music_BugCatchingContest_Ch3: ; 0xf7db7
	stereopanning $ff
	vibrato $10, $23
	notetype $0c, $14
	note $07
	octave3
	note $a0
	note $00
	note $a2
	note $00
	note $a0
	note $a0
	note $c0
	note $00
	note $c2
	note $00
	note $c0
	note $c0
	octave4
	note $10
	note $00
	note $12
	note $00
	note $10
	note $10
	note $20
	note $00
	note $22
	note $00
	note $20
	note $20
	notetype $0c, $14
	note $74
	note $00
	note $70
	note $80
	note $a3
	octave5
	note $33
	note $21
	intensity $10
	note $50
	note $80
	note $c0
	note $00
	note $80
	note $50
	notetype $06, $20
	octave6
	note $50
	note $70
	note $50
	note $70
	note $50
	note $70
	note $50
	note $70
	note $57
	intensity $14
	octave4
	note $59
	note $01
	note $51
	note $71
	note $87
	octave5
	note $27
	note $03
	intensity $10
	note $51
	note $81
	note $a1
	note $01
	note $51
	note $11
	octave6
	note $20
	note $30
	note $20
	note $30
	note $20
	note $30
	note $20
	note $30
	note $27
	intensity $15
	octave5
	note $73
	note $03
	note $83
	note $03
	note $a3
	note $03
	octave6
	note $33
	note $03
	note $2b
	octave5
	note $c1
	octave6
	note $21
	octave5
	note $c3
	note $03
	octave6
	note $83
	note $73
	note $03
	octave5
	note $83
	note $a3
	note $c3
	octave6
	note $53
	note $33
	note $23
	octave5
	note $c1
	octave6
	note $21
	note $33
	note $07
	octave5
	note $c3
	note $a3
	note $00
	note $40
	note $70
	note $a0
	octave6
	note $17
	octave3
	note $81
	note $01
	note $c1
	note $01
	note $31
	note $01
	note $c1
	note $01
	note $51
	note $01
	note $c1
	note $01
	note $81
	note $01
	note $c1
	note $01
	note $31
	note $01
	note $71
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $71
	note $01
	note $41
	note $01
	octave4
	note $11
	note $01
	octave3
	note $a1
	note $01
	octave4
	note $11
	note $01
	octave3
	note $81
	note $01
	note $c1
	note $01
	note $31
	note $01
	note $c1
	note $01
	note $91
	note $01
	note $c1
	note $01
	note $51
	note $01
	note $c1
	note $01
	note $a1
	note $01
	note $a5
	note $01
	note $a1
	note $a1
	note $c1
	note $01
	note $c5
	note $01
	note $c1
	note $c1
	octave4
	note $11
	note $01
	note $15
	note $01
	note $11
	note $11
	note $21
	note $01
	note $25
	note $01
	note $21
	note $21
	loopchannel $00, $7dda ; end
; 0xf7e9a

_Music_BugCatchingContest_Ch4: ; 0xf7e9a
	togglenoise $04
	notetype $06
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $51
	note $51
	callchannel _Music_BugCatchingContest_sub_0xf7ee2
	note $33
	note $33
	note $31
	note $21
	note $31
	note $21
	note $33
	note $33
	note $31
	note $21
	note $31
	note $21
	note $33
	note $33
	note $31
	note $21
	note $31
	note $21
	note $33
	note $33
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	loopchannel $05, $7eaf
	note $33
	note $33
	note $31
	note $31
	note $31
	note $31
	note $33
	note $33
	note $31
	note $31
	note $31
	note $31
	callchannel _Music_BugCatchingContest_sub_0xf7ee2
	loopchannel $00, $7eaf ; end
; 0xf7ee2

_Music_BugCatchingContest_sub_0xf7ee2: ; 0xf7ee2
; subroutine
	note $33
	note $c7
	note $31
	note $31
	note $33
	note $c7
	note $31
	note $31
	note $33
	note $c7
	note $31
	note $31
	note $33
	note $c7
	note $31
	note $31
	endchannel ; end
; 0xf7ef3
