_Music_MtMoonSquare: ; 0xf4815
	db $40
	dw _Music_MtMoonSquare_Ch1
	db $01
	dw _Music_MtMoonSquare_Ch2
; 0xf481b

_Music_MtMoonSquare_Ch1: ; 0xf481b
	tempo $7000
	volume $77
	dutycycle $02
	tone $0100
	note $00
	notetype $0c, $44
	octave4
	note $31
	note $51
	note $73
	note $71
	note $a1
	octave5
	note $33
	loopchannel $02, $4829
	octave4
	note $51
	note $71
	note $93
	note $91
	note $c1
	octave5
	note $53
	loopchannel $02, $4835
	octave4
	note $21
	note $31
	note $53
	note $51
	note $81
	octave5
	note $23
	loopchannel $02, $4841
	octave4
	note $31
	note $51
	note $73
	note $71
	note $a1
	octave5
	note $33
	loopchannel $02, $484d
	loopchannel $00, $4826 ; end
; 0xf485d

_Music_MtMoonSquare_Ch2: ; 0xf485d
	dutycycle $02
	vibrato $18, $24
	notetype $0c, $82
	octave4
	note $31
	note $51
	note $73
	note $71
	note $a1
	octave5
	note $33
	notetype $0c, $62
	loopchannel $02, $4865
	notetype $0c, $82
	octave4
	note $51
	note $71
	note $93
	note $91
	note $c1
	octave5
	note $53
	notetype $0c, $62
	loopchannel $02, $4877
	notetype $0c, $82
	octave4
	note $21
	note $31
	note $53
	note $51
	note $81
	octave5
	note $23
	notetype $0c, $62
	loopchannel $02, $4889
	notetype $0c, $82
	octave4
	note $31
	note $51
	note $73
	note $71
	note $a1
	octave5
	note $33
	notetype $0c, $62
	loopchannel $02, $489b
	loopchannel $00, $4862 ; end
; 0xf48ae
