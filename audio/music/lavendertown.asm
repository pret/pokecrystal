_Music_LavenderTown: ; 0xef72f
	db $80
	dw _Music_LavenderTown_Ch1
	db $01
	dw _Music_LavenderTown_Ch2
	db $02
	dw _Music_LavenderTown_Ch3
; 0xef738

; 0xef738
	db $03
; 0xef739

_Music_LavenderTown_Ch1: ; 0xef739
	tempo $a000
	volume $77
	stereopanning $0f
	vibrato $06, $24
	dutycycle $00
	notetype $0c, $b3
	note $0f
	note $0f
	note $0f
	note $0f
	callchannel _Music_LavenderTown_sub_0xef7fd
	intensity $93
	octave5
	note $31
	intensity $43
	note $31
	intensity $93
	note $71
	intensity $43
	note $71
	intensity $93
	note $c1
	intensity $43
	note $c1
	intensity $93
	note $a1
	intensity $43
	note $a1
	callchannel _Music_LavenderTown_sub_0xef87f
	intensity $93
	intensity $93
	note $61
	intensity $83
	note $61
	intensity $93
	note $31
	intensity $43
	note $31
	intensity $93
	octave4
	note $c1
	intensity $43
	note $c1
	intensity $93
	note $81
	intensity $43
	note $81
	callchannel _Music_LavenderTown_sub_0xef7fd
	intensity $93
	octave5
	note $31
	intensity $43
	note $31
	intensity $93
	note $81
	intensity $43
	note $81
	intensity $93
	note $c1
	intensity $43
	note $c1
	intensity $93
	note $81
	intensity $43
	note $81
	callchannel _Music_LavenderTown_sub_0xef87f
	intensity $93
	octave6
	note $11
	intensity $43
	note $11
	intensity $93
	octave5
	note $81
	intensity $43
	note $81
	intensity $93
	note $51
	intensity $43
	note $51
	intensity $93
	note $11
	intensity $43
	note $11
	octave3
	note $61
	note $a1
	octave4
	note $11
	note $51
	note $61
	note $11
	octave3
	note $a1
	note $61
	octave3
	note $11
	note $51
	note $81
	note $c1
	octave4
	note $11
	octave3
	note $81
	note $51
	note $11
	note $61
	note $a1
	octave4
	note $11
	note $51
	note $61
	note $11
	octave3
	note $a1
	note $61
	loopchannel $02, $77ca
	note $71
	note $a1
	octave4
	note $11
	note $71
	note $a1
	note $11
	octave3
	note $a1
	note $71
	note $81
	octave4
	note $11
	note $31
	note $61
	note $81
	note $61
	note $31
	note $11
	octave3
	note $c7
	note $c7
	loopchannel $00, $774c ; end
; 0xef7fd

_Music_LavenderTown_sub_0xef7fd: ; 0xef7fd
; subroutine
	intensity $83
	octave5
	note $11
	intensity $43
	note $11
	intensity $83
	note $81
	intensity $43
	note $81
	intensity $83
	octave6
	note $11
	intensity $43
	note $11
	intensity $83
	octave5
	note $81
	intensity $43
	note $81
	intensity $83
	note $31
	intensity $43
	note $31
	intensity $83
	note $a1
	intensity $43
	note $a1
	intensity $83
	octave6
	note $31
	intensity $43
	note $31
	intensity $83
	octave5
	note $a1
	intensity $43
	note $a1
	intensity $83
	note $51
	intensity $43
	note $51
	intensity $83
	note $c1
	intensity $43
	note $c1
	intensity $83
	octave6
	note $51
	intensity $43
	note $51
	intensity $83
	octave5
	note $c1
	intensity $43
	note $c1
	intensity $83
	note $21
	intensity $43
	note $21
	intensity $83
	note $81
	intensity $43
	note $81
	intensity $83
	note $b1
	intensity $43
	note $b1
	intensity $83
	note $81
	intensity $43
	note $81
	intensity $83
	note $11
	intensity $43
	note $11
	intensity $83
	note $61
	intensity $43
	note $61
	intensity $83
	octave6
	note $11
	intensity $43
	note $11
	intensity $83
	octave5
	note $61
	intensity $43
	note $61
	endchannel ; end
; 0xef87f

_Music_LavenderTown_sub_0xef87f: ; 0xef87f
; subroutine
	intensity $93
	octave5
	note $81
	intensity $83
	note $81
	intensity $83
	note $61
	intensity $43
	note $61
	intensity $83
	note $31
	intensity $43
	note $31
	intensity $83
	note $81
	intensity $43
	note $81
	endchannel ; end
; 0xef899

_Music_LavenderTown_Ch2: ; 0xef899
	dutycycle $01
	vibrato $08, $24
	stereopanning $ff
	notetype $0c, $a3
	octave5
	note $11
	intensity $63
	note $11
	intensity $a3
	note $81
	intensity $63
	note $81
	intensity $a3
	note $c1
	intensity $63
	note $c1
	intensity $a3
	note $71
	intensity $63
	note $71
	loopchannel $03, $78a0
	intensity $a3
	note $11
	intensity $63
	note $11
	intensity $a3
	note $81
	intensity $63
	note $81
	intensity $a3
	note $c1
	intensity $63
	note $c1
	intensity $a3
	octave6
	note $31
	intensity $63
	note $31
	intensity $b5
	callchannel _Music_LavenderTown_sub_0xef915
	octave2
	note $73
	octave3
	note $13
	note $73
	note $a3
	octave2
	note $83
	octave3
	note $13
	note $33
	note $83
	note $63
	note $33
	octave2
	note $c3
	note $83
	callchannel _Music_LavenderTown_sub_0xef915
	octave2
	note $83
	octave3
	note $13
	note $63
	note $83
	note $13
	note $63
	note $83
	note $63
	note $13
	note $53
	note $83
	octave4
	note $13
	intensity $b7
	octave2
	note $6f
	note $1f
	note $6f
	note $1f
	note $6f
	note $7f
	note $8f
	octave1
	note $87
	intensity $57
	octave5
	note $30
	note $60
	note $85
	loopchannel $00, $78d7 ; end
; 0xef915

_Music_LavenderTown_sub_0xef915: ; 0xef915
; subroutine
	octave2
	note $13
	note $83
	octave3
	note $53
	octave2
	note $83
	note $33
	note $a3
	octave3
	note $63
	octave2
	note $a3
	note $53
	note $c3
	octave3
	note $83
	note $63
	note $53
	note $23
	octave2
	note $b3
	note $83
	note $63
	octave3
	note $13
	note $a3
	note $13
	endchannel ; end
; 0xef932

_Music_LavenderTown_Ch3: ; 0xef932
	vibrato $12, $24
	notetype $0c, $13
	stereopanning $f0
	note $0f
	note $0f
	note $0f
	note $07
	octave5
	note $53
	note $63
	intensity $12
	octave5
	note $83
	note $03
	note $83
	note $03
	note $53
	note $03
	note $53
	note $63
	note $83
	note $63
	note $53
	note $c3
	note $27
	note $01
	note $21
	note $31
	note $51
	note $69
	note $81
	note $61
	note $51
	note $37
	octave4
	note $a3
	octave5
	note $33
	note $5b
	note $61
	note $51
	note $3b
	note $51
	note $61
	note $83
	note $03
	note $83
	note $03
	note $53
	note $03
	note $53
	note $63
	note $83
	note $63
	note $53
	note $c3
	note $27
	note $01
	note $21
	note $31
	note $51
	note $69
	note $81
	note $61
	note $51
	note $3b
	note $11
	note $31
	note $1f
	note $1b
	note $03
	intensity $24
	note $a1
	note $81
	note $a1
	note $c1
	octave6
	note $13
	octave5
	note $83
	note $63
	note $53
	note $33
	note $13
	note $a1
	note $81
	note $a1
	note $c1
	octave6
	note $13
	octave5
	note $83
	octave6
	note $63
	notetype $08, $24
	note $51
	note $61
	note $51
	notetype $0c, $24
	note $33
	note $13
	octave5
	note $a1
	note $81
	note $a1
	note $c1
	octave6
	note $13
	octave5
	note $83
	note $a1
	note $81
	note $a1
	note $c1
	octave6
	note $13
	note $23
	note $3b
	note $13
	octave5
	note $cb
	note $51
	note $61
	loopchannel $00, $7941 ; end
; 0xef9bc
