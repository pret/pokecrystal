_Music_Route1: ; 0xec000
	db $80
	dw _Music_Route1_Ch1
	db $01
	dw _Music_Route1_Ch2
	db $02
	dw _Music_Route1_Ch3
; 0xec009

; 0xec009
	db $03
; 0xec00a

_Music_Route1_Ch1: ; 0xec00a
	stereopanning $0f
	tempo $b800
	volume $77
	vibrato $16, $11
	dutycycle $03
	notetype $0c, $83
	octave4
	note $30
	note $50
	note $71
	note $71
	note $31
	octave3
	note $a1
	octave4
	note $c1
	note $a1
	note $81
	note $71
	note $31
	octave3
	note $a1
	note $71
	note $80
	note $a0
	note $81
	note $51
	note $80
	note $50
	octave4
	note $30
	note $50
	note $71
	note $71
	note $31
	octave3
	note $a1
	octave4
	note $c1
	note $a1
	note $82
	note $50
	note $51
	note $81
	note $a1
	note $81
	note $71
	intensity $81
	octave5
	note $31
	note $31
	intensity $83
	note $01
	intensity $83
	note $01
	octave4
	note $31
	octave3
	note $a1
	note $03
	octave4
	note $31
	octave3
	note $a1
	note $01
	note $01
	octave4
	note $31
	octave3
	note $a2
	octave4
	note $30
	octave3
	note $51
	intensity $81
	note $81
	note $81
	intensity $83
	note $01
	note $01
	octave4
	note $21
	octave3
	note $a1
	note $03
	octave4
	note $21
	octave3
	note $a1
	note $01
	note $01
	octave4
	note $21
	note $20
	octave3
	note $c0
	note $a0
	note $80
	note $71
	note $a1
	octave4
	note $31
	note $01
	note $01
	octave3
	note $70
	note $80
	note $a3
	note $01
	note $30
	note $50
	note $71
	note $70
	note $80
	note $a1
	note $a0
	note $c0
	note $a1
	note $a0
	note $c0
	note $a1
	intensity $81
	octave4
	note $81
	note $81
	intensity $83
	octave3
	note $70
	note $50
	note $01
	note $50
	note $70
	note $85
	note $50
	octave2
	note $c0
	octave3
	note $21
	note $50
	note $70
	note $83
	notetype $08, $83
	note $a0
	note $c0
	note $a0
	notetype $0c, $83
	note $80
	note $50
	note $71
	intensity $81
	octave4
	note $a1
	note $a1
	intensity $83
	octave3
	note $a0
	note $80
	intensity $77
	intensity $1d
	note $73
	note $a3
	note $81
	note $71
	note $51
	note $81
	note $73
	note $a2
	note $70
	note $51
	note $a1
	octave4
	note $21
	octave3
	note $a0
	note $80
	dutycycle $02
	intensity $87
	octave6
	note $73
	note $a3
	note $81
	note $71
	note $52
	note $80
	note $71
	note $31
	note $51
	note $21
	note $31
	intensity $81
	octave5
	note $31
	note $31
	note $01
	loopchannel $00, $404a ; end
; 0xec0eb

_Music_Route1_Ch2: ; 0xec0eb
	stereopanning $f0
	vibrato $12, $22
	dutycycle $02
	notetype $0c, $92
	octave4
	note $70
	note $80
	callchannel _Music_Route1_sub_0xec198
	octave3
	note $a1
	note $a1
	octave4
	note $70
	note $80
	callchannel _Music_Route1_sub_0xec1aa
	note $21
	note $51
	note $31
	intensity $81
	note $71
	note $71
	intensity $82
	octave4
	note $30
	note $50
	dutycycle $02
	intensity $82
	callchannel _Music_Route1_sub_0xec188
	intensity $81
	octave3
	note $a1
	note $a1
	intensity $82
	octave4
	note $20
	note $30
	note $51
	note $51
	note $51
	note $20
	note $30
	note $51
	note $51
	note $51
	note $20
	note $30
	note $51
	note $51
	note $70
	note $50
	note $50
	note $70
	note $31
	note $01
	note $71
	note $30
	note $50
	callchannel _Music_Route1_sub_0xec188
	intensity $81
	note $a1
	note $a1
	intensity $82
	note $20
	note $30
	note $51
	note $81
	note $71
	note $51
	note $31
	note $21
	octave3
	note $c1
	note $a1
	octave4
	note $c3
	notetype $08, $92
	note $20
	note $30
	note $20
	notetype $0c, $92
	octave3
	note $c0
	octave4
	note $20
	note $31
	intensity $81
	octave5
	note $31
	note $31
	intensity $82
	octave4
	note $70
	note $80
	callchannel _Music_Route1_sub_0xec198
	note $03
	note $70
	note $80
	callchannel _Music_Route1_sub_0xec1aa
	notetype $08, $92
	note $20
	note $30
	note $20
	notetype $0c, $92
	octave4
	note $c0
	octave5
	note $20
	note $31
	intensity $81
	note $71
	note $71
	intensity $82
	octave4
	note $30
	note $50
	loopchannel $00, $4112 ; end
; 0xec188

_Music_Route1_sub_0xec188: ; 0xec188
; subroutine
	note $71
	note $71
	note $71
	note $30
	note $50
	note $71
	note $71
	note $71
	note $30
	note $50
	note $71
	note $71
	note $82
	note $70
	note $51
	endchannel ; end
; 0xec198

_Music_Route1_sub_0xec198: ; 0xec198
; subroutine
	note $a1
	note $a1
	note $71
	note $31
	octave5
	note $31
	note $21
	octave4
	note $c1
	octave5
	note $31
	octave4
	note $a1
	note $71
	note $32
	note $70
	note $51
	endchannel ; end
; 0xec1aa

_Music_Route1_sub_0xec1aa: ; 0xec1aa
; subroutine
	note $a1
	note $a1
	note $71
	note $31
	octave5
	note $31
	note $21
	octave4
	note $c2
	note $80
	note $a1
	octave5
	note $31
	endchannel ; end
; 0xec1b8

_Music_Route1_Ch3: ; 0xec1b8
	stereopanning $ff
	vibrato $10, $23
	notetype $0c, $25
	note $01
	octave3
	note $30
	note $00
	note $a0
	note $00
	octave4
	note $70
	note $02
	octave3
	note $30
	note $00
	note $c0
	note $00
	octave4
	note $80
	note $00
	octave3
	note $c0
	note $00
	note $30
	note $00
	note $a0
	note $00
	octave4
	note $30
	note $02
	octave3
	note $20
	note $00
	note $a0
	note $00
	octave4
	note $20
	note $00
	note $20
	octave3
	note $a0
	note $30
	octave2
	note $a0
	octave3
	note $30
	note $70
	octave4
	note $30
	octave3
	note $a0
	note $70
	note $a0
	note $80
	note $30
	note $80
	note $c0
	octave4
	note $80
	note $30
	octave3
	note $c0
	note $80
	octave2
	note $a0
	octave3
	note $20
	note $50
	note $80
	note $50
	note $a0
	octave4
	note $20
	note $80
	note $71
	note $a0
	note $00
	note $a0
	note $02
	octave3
	note $30
	note $00
	octave4
	note $31
	octave3
	note $20
	note $00
	octave4
	note $21
	octave2
	note $c0
	note $00
	octave3
	note $c1
	octave2
	note $a0
	note $00
	octave3
	note $a1
	note $30
	note $00
	octave4
	note $31
	octave2
	note $a0
	note $00
	octave3
	note $a1
	octave2
	note $c0
	note $00
	octave3
	note $c1
	octave2
	note $a0
	note $00
	octave3
	note $a1
	note $20
	note $00
	octave4
	note $21
	octave2
	note $a0
	note $00
	octave3
	note $a1
	octave2
	note $c0
	note $00
	octave3
	note $c1
	note $10
	note $00
	octave4
	note $11
	octave3
	note $20
	note $00
	octave4
	note $21
	octave2
	note $a0
	note $00
	octave3
	note $a1
	octave4
	note $31
	note $20
	octave3
	note $c0
	note $a1
	note $80
	note $50
	octave2
	note $30
	note $00
	octave3
	note $31
	octave2
	note $50
	note $00
	octave3
	note $51
	octave2
	note $70
	note $00
	octave3
	note $71
	octave2
	note $a0
	note $00
	octave3
	note $a1
	octave4
	note $31
	octave3
	note $a1
	octave4
	note $31
	note $71
	note $51
	octave3
	note $50
	note $00
	note $50
	note $00
	octave4
	note $51
	octave3
	note $20
	note $00
	octave4
	note $21
	octave2
	note $c0
	note $00
	octave3
	note $c1
	octave2
	note $a0
	note $00
	octave3
	note $a1
	octave2
	note $80
	note $00
	octave3
	note $80
	note $c0
	octave4
	note $21
	note $50
	note $20
	octave3
	note $a0
	note $80
	note $50
	note $20
	note $31
	octave4
	note $70
	note $00
	note $70
	note $02
	octave3
	note $33
	note $73
	note $81
	note $a1
	note $c2
	note $80
	note $71
	note $31
	octave2
	note $a2
	octave3
	note $30
	note $a0
	note $c0
	note $a0
	note $c0
	note $a2
	note $80
	note $71
	note $31
	octave2
	note $a1
	octave3
	note $31
	note $81
	note $71
	note $52
	note $20
	note $31
	note $71
	note $a1
	octave4
	note $21
	note $31
	octave5
	note $a0
	note $00
	note $a0
	note $02
	loopchannel $00, $420c ; end
; 0xec2ca
