_Music_BugCatchingContestResults: ; 0xefb3e
	db $c0
	dw _Music_BugCatchingContestResults_Ch1
	db $01
	dw _Music_BugCatchingContestResults_Ch2
	db $02
	dw _Music_BugCatchingContestResults_Ch3
	db $03
	dw _Music_BugCatchingContestResults_Ch4
; 0xefb4a

_Music_BugCatchingContestResults_Ch1: ; 0xefb4a
	tempo $9000
	volume $77
	notetype $0c, $51
	note $01
	octave2
	note $80
	note $02
	note $80
	note $02
	note $80
	note $02
	note $80
	note $00
	note $01
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $00
	note $01
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $00
	note $01
	note $c0
	note $02
	note $b0
	note $02
	note $a0
	note $02
	note $80
	note $00
	loopchannel $00, $7b52 ; end
; 0xefb7b

_Music_BugCatchingContestResults_Ch2: ; 0xefb7b
	notetype $0c, $61
	octave2
	note $11
	octave3
	note $50
	note $00
	octave1
	note $81
	octave3
	note $50
	note $00
	octave1
	note $a1
	octave3
	note $50
	note $00
	octave1
	note $c1
	octave3
	note $50
	note $00
	octave2
	note $31
	octave3
	note $60
	note $00
	octave1
	note $a1
	octave3
	note $60
	note $00
	octave1
	note $c1
	octave3
	note $60
	note $00
	octave2
	note $21
	octave3
	note $60
	note $00
	octave2
	note $31
	octave3
	note $60
	note $00
	octave1
	note $a1
	octave3
	note $60
	note $00
	loopchannel $02, $7ba6
	octave2
	note $81
	octave3
	note $80
	note $00
	octave2
	note $31
	octave3
	note $70
	note $00
	octave2
	note $81
	octave3
	note $60
	note $00
	octave2
	note $31
	octave3
	note $30
	note $00
	loopchannel $00, $7b7e ; end
; 0xefbcc

_Music_BugCatchingContestResults_Ch3: ; 0xefbcc
	vibrato $08, $24
	notetype $0c, $23
	octave4
	note $54
	note $00
	note $50
	note $60
	note $83
	octave5
	note $13
	octave4
	note $c7
	note $a7
	note $34
	note $00
	note $30
	note $50
	note $63
	note $c3
	note $a7
	note $87
	loopchannel $00, $7bd2 ; end
; 0xefbe9

_Music_BugCatchingContestResults_Ch4: ; 0xefbe9
	togglenoise $04
	notetype $06
	note $23
	note $23
	note $21
	note $21
	note $21
	note $21
	note $23
	note $23
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	note $80
	loopchannel $00, $7bed ; end
; 0xefc01
