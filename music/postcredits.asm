_Music_PostCredits: ; 0xcfd9e
	db $40
	dw _Music_PostCredits_Ch1
	db $01
	dw _Music_PostCredits_Ch2
; 0xcfda4

; 0xcfda4
	db $02
; 0xcfda5

_Music_PostCredits_Ch1: ; 0xcfda5
	tempo $0f01
	volume $77
	forceoctave $03
	dutycycle $02
	notetype $0c, $93
	note $07
	octave3
	note $11
	note $51
	note $81
	octave4
	note $11
	note $51
	intensity $73
	note $51
	intensity $53
	note $51
	intensity $43
	note $51
	intensity $93
	octave2
	note $c1
	octave3
	note $31
	note $81
	note $c1
	octave4
	note $31
	intensity $73
	note $31
	intensity $53
	note $31
	intensity $43
	note $31
	intensity $93
	octave2
	note $b1
	octave3
	note $31
	note $81
	note $b1
	octave4
	note $31
	intensity $73
	note $31
	intensity $53
	note $31
	intensity $43
	note $31
	intensity $93
	octave2
	note $a1
	octave3
	note $11
	note $61
	note $a1
	octave4
	note $11
	intensity $73
	note $11
	intensity $53
	note $11
	intensity $43
	note $11
	intensity $93
	octave2
	note $91
	octave3
	note $11
	note $61
	note $91
	octave4
	note $11
	intensity $73
	note $11
	intensity $53
	note $11
	intensity $43
	note $11
	intensity $93
	octave2
	note $81
	octave3
	note $11
	note $51
	note $81
	octave4
	note $11
	intensity $73
	note $11
	intensity $63
	note $11
	intensity $43
	note $11
	intensity $93
	octave2
	note $71
	note $a1
	octave3
	note $31
	note $71
	note $a1
	intensity $73
	note $a1
	intensity $63
	note $a1
	intensity $43
	note $a1
	intensity $93
	octave2
	note $81
	octave3
	note $11
	note $31
	note $81
	note $81
	intensity $73
	note $81
	intensity $93
	note $31
	octave2
	note $81
	loopchannel $00, $7db2 ; end
; 0xcfe48

_Music_PostCredits_Ch2: ; 0xcfe48
	forceoctave $03
	dutycycle $02
	notetype $0c, $a3
	octave5
	note $51
	intensity $73
	note $51
	intensity $a3
	note $61
	intensity $73
	note $61
	intensity $a3
	note $81
	intensity $73
	note $81
	intensity $53
	note $81
	intensity $43
	note $81
	intensity $93
	octave6
	note $31
	note $11
	octave5
	note $c1
	octave6
	note $11
	octave5
	note $81
	intensity $73
	note $81
	intensity $53
	note $81
	intensity $43
	note $81
	intensity $33
	note $81
	intensity $a3
	note $51
	intensity $73
	note $51
	intensity $a3
	note $61
	note $81
	intensity $73
	note $81
	intensity $53
	note $81
	intensity $43
	note $81
	intensity $33
	note $81
	intensity $a3
	note $a1
	intensity $73
	note $a1
	intensity $a3
	note $51
	note $81
	intensity $73
	note $81
	intensity $53
	note $81
	intensity $a3
	note $61
	intensity $73
	note $61
	intensity $53
	note $61
	intensity $a3
	note $31
	note $51
	note $61
	intensity $73
	note $61
	intensity $53
	note $61
	intensity $43
	note $61
	intensity $33
	note $61
	intensity $a3
	note $81
	intensity $73
	note $81
	intensity $a3
	note $61
	note $51
	note $41
	note $51
	note $c1
	intensity $73
	note $c1
	intensity $53
	note $c1
	intensity $a3
	note $a1
	intensity $73
	note $a1
	intensity $a3
	note $31
	intensity $73
	note $31
	intensity $53
	note $31
	intensity $43
	note $31
	intensity $33
	note $31
	note $31
	intensity $23
	note $31
	note $31
	intensity $a3
	note $81
	intensity $73
	octave4
	note $81
	intensity $a3
	octave5
	note $31
	note $81
	intensity $73
	note $81
	intensity $53
	note $81
	intensity $a3
	note $51
	note $61
	loopchannel $00, $7e5a ; end
; 0xcff04
