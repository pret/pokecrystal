_Music_LakeOfRage: ; 0xee6c5
	db $c0
	dw _Music_LakeOfRage_Ch1
	db $01
	dw _Music_LakeOfRage_Ch2
	db $02
	dw _Music_LakeOfRage_Ch3
	db $03
	dw _Music_LakeOfRage_Ch4
; 0xee6d1

_Music_LakeOfRage_Ch1: ; 0xee6d1
	tempo $9000
	volume $77
	dutycycle $03
	tone $0200
	vibrato $08, $22
	stereopanning $f0
	notetype $0c, $b4
	octave3
	note $35
	note $39
	note $35
	note $35
	note $53
	intensity $b5
	note $75
	note $55
	note $33
	octave4
	note $35
	note $13
	note $51
	note $33
	octave3
	note $c5
	note $81
	notetype $08, $b5
	note $33
	note $83
	note $c3
	notetype $0c, $b4
	note $32
	note $70
	intensity $b7
	note $a7
	note $73
	note $a2
	octave4
	note $20
	note $3b
	notetype $08, $b4
	octave3
	note $13
	octave2
	note $c3
	note $a3
	notetype $08, $b7
	note $ab
	notetype $0c, $b7
	octave3
	note $1b
	intensity $b4
	note $53
	note $31
	intensity $b7
	octave2
	note $a9
	intensity $b4
	octave3
	note $53
	note $32
	note $50
	intensity $b7
	note $77
	note $35
	note $10
	note $50
	note $17
	note $55
	note $50
	note $80
	note $57
	note $85
	note $70
	note $80
	intensity $a0
	note $a6
	intensity $a7
	note $a6
	note $a0
	octave4
	note $10
	intensity $a0
	note $35
	intensity $a7
	note $35
	loopchannel $00, $66e9 ; end
; 0xee749

_Music_LakeOfRage_Ch2: ; 0xee749
	dutycycle $03
	vibrato $20, $44
	stereopanning $ff
	notetype $0c, $90
	octave3
	note $87
	intensity $97
	note $87
	intensity $a0
	note $a7
	intensity $a7
	note $a7
	notetype $08, $c7
	octave4
	note $3f
	octave3
	note $a3
	octave4
	note $33
	note $af
	octave5
	note $13
	octave4
	note $c3
	notetype $0c, $c7
	note $8b
	note $c3
	note $a2
	note $80
	intensity $b0
	note $7b
	intensity $b7
	note $7f
	notetype $08, $c3
	octave3
	note $83
	note $73
	note $53
	note $1e
	notetype $0c, $c3
	octave4
	note $10
	note $50
	note $80
	note $00
	note $50
	note $80
	intensity $c5
	octave5
	note $19
	intensity $c3
	octave4
	note $a3
	note $83
	note $73
	note $51
	notetype $08, $c3
	note $33
	note $53
	note $73
	notetype $08, $c7
	note $ab
	notetype $08, $c3
	octave3
	note $83
	note $73
	note $53
	octave4
	note $13
	octave3
	note $c3
	note $a3
	octave4
	note $53
	note $33
	note $13
	note $83
	note $73
	note $53
	notetype $08, $c7
	note $7f
	note $33
	note $73
	notetype $0c, $c7
	note $af
	loopchannel $00, $675e ; end
; 0xee7c1

_Music_LakeOfRage_Ch3: ; 0xee7c1
	stereopanning $0f
	notetype $0c, $16
	octave3
	note $83
	note $01
	note $83
	note $05
	note $73
	note $01
	note $73
	note $01
	note $53
	octave3
	note $33
	octave2
	note $a1
	octave3
	note $33
	octave2
	note $a1
	octave3
	note $31
	note $51
	note $63
	note $11
	note $63
	note $11
	note $61
	note $71
	note $83
	note $31
	note $83
	note $31
	note $81
	note $c1
	note $a1
	note $31
	note $71
	note $a3
	note $31
	note $51
	note $71
	note $a1
	note $71
	note $a1
	octave4
	note $33
	octave3
	note $a1
	octave4
	note $31
	note $71
	octave3
	note $53
	note $11
	note $53
	note $11
	note $51
	note $11
	note $83
	note $11
	note $83
	note $11
	note $81
	note $11
	note $73
	note $31
	note $73
	note $31
	note $71
	note $31
	note $a1
	note $31
	note $71
	octave4
	note $33
	octave3
	note $31
	note $51
	note $71
	note $83
	note $11
	note $83
	note $11
	note $81
	note $11
	note $83
	note $11
	note $83
	note $11
	note $81
	note $11
	note $73
	note $31
	note $73
	note $31
	note $71
	note $31
	note $33
	octave2
	note $a1
	octave3
	note $33
	octave2
	note $a1
	octave3
	note $31
	octave2
	note $a1
	loopchannel $00, $67d0 ; end
; 0xee835

_Music_LakeOfRage_Ch4: ; 0xee835
	stereopanning $f0
	togglenoise $03
	notetype $0c
	note $31
	note $30
	note $30
	note $81
	note $31
	note $30
	note $30
	note $75
	note $31
	note $30
	note $30
	note $81
	note $31
	note $30
	note $30
	note $72
	note $30
	note $30
	note $30
	loopchannel $00, $683b ; end
; 0xee852
