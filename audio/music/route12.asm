_Music_Route12: ; 0xec506
	db $c0
	dw _Music_Route12_Ch1
	db $01
	dw _Music_Route12_Ch2
	db $02
	dw _Music_Route12_Ch3
	db $03
	dw _Music_Route12_Ch4
; 0xec512

_Music_Route12_Ch1: ; 0xec512
	tempo $9400
	volume $77
	vibrato $12, $34
	tone $0100
	stereopanning $0f
	dutycycle $03
	notetype $0c, $98
	octave3
	note $90
	note $01
	note $a0
	note $97
	octave2
	note $c0
	octave3
	note $50
	note $70
	note $90
	note $70
	note $01
	note $50
	intensity $97
	note $4b
	dutycycle $02
	intensity $96
	callchannel _Music_Route12_sub_0xec5b1
	callchannel _Music_Route12_sub_0xec5bf
	callchannel _Music_Route12_sub_0xec5b1
	note $50
	note $01
	note $70
	note $53
	note $c3
	octave4
	note $43
	callchannel _Music_Route12_sub_0xec5b1
	callchannel _Music_Route12_sub_0xec5bf
	callchannel _Music_Route12_sub_0xec5b1
	intensity $92
	octave4
	note $50
	octave3
	note $c0
	note $90
	note $50
	octave4
	note $40
	octave3
	note $c0
	note $90
	note $40
	octave4
	note $30
	octave3
	note $c0
	note $90
	note $30
	note $20
	note $60
	note $90
	note $c0
	dutycycle $03
	intensity $7f
	octave4
	note $22
	octave3
	note $c2
	note $a0
	note $00
	note $a3
	octave4
	note $21
	octave3
	note $c1
	octave4
	note $20
	octave3
	note $c0
	note $a3
	note $91
	note $71
	note $91
	note $a1
	octave4
	note $11
	octave3
	note $c2
	note $a2
	note $90
	note $00
	note $93
	note $c1
	note $a1
	note $c0
	note $a0
	note $93
	note $71
	note $51
	note $71
	note $81
	note $51
	note $42
	note $72
	note $41
	note $57
	note $77
	note $43
	note $73
	intensity $97
	note $90
	note $a0
	note $c3
	octave2
	note $c0
	octave3
	note $40
	note $50
	note $00
	note $50
	note $70
	note $93
	loopchannel $02, $459b
	loopchannel $00, $4535 ; end
; 0xec5b1

_Music_Route12_sub_0xec5b1: ; 0xec5b1
; subroutine
	octave3
	note $90
	note $00
	note $50
	note $00
	octave2
	note $c0
	note $00
	note $c0
	octave3
	note $40
	note $53
	note $93
	endchannel ; end
; 0xec5bf

_Music_Route12_sub_0xec5bf: ; 0xec5bf
; subroutine
	note $a0
	note $00
	note $70
	note $00
	note $30
	note $00
	note $70
	note $90
	note $a3
	note $73
	endchannel ; end
; 0xec5ca

_Music_Route12_Ch2: ; 0xec5ca
	dutycycle $03
	vibrato $12, $34
	notetype $0c, $b8
	octave4
	note $50
	note $01
	note $70
	note $5b
	octave3
	note $c0
	note $01
	octave4
	note $10
	intensity $b7
	octave3
	note $c7
	note $40
	note $70
	note $c0
	octave4
	note $40
	dutycycle $03
	intensity $b7
	callchannel _Music_Route12_sub_0xec647
	note $70
	note $a0
	note $90
	note $70
	note $91
	note $00
	note $50
	octave3
	note $cb
	dutycycle $02
	octave2
	note $c0
	note $01
	octave3
	note $10
	octave2
	note $c3
	octave3
	note $43
	note $73
	dutycycle $03
	callchannel _Music_Route12_sub_0xec647
	note $a0
	octave5
	note $20
	octave4
	note $c0
	note $a0
	note $c1
	note $00
	note $a0
	intensity $b8
	note $95
	intensity $b7
	note $95
	intensity $6f
	note $9f
	dutycycle $02
	intensity $a8
	note $a2
	note $92
	note $70
	note $00
	note $77
	intensity $a7
	note $79
	note $01
	note $73
	intensity $a8
	note $92
	note $72
	note $50
	note $00
	note $57
	intensity $a7
	note $59
	note $01
	note $53
	note $72
	note $42
	octave3
	note $c1
	intensity $a8
	octave4
	note $c7
	note $c7
	note $a7
	note $90
	note $70
	note $5d
	note $59
	intensity $a4
	note $55
	loopchannel $00, $45e5 ; end
; 0xec647

_Music_Route12_sub_0xec647: ; 0xec647
; subroutine
	octave4
	note $55
	intensity $b1
	octave3
	note $c0
	note $c0
	intensity $b7
	note $c3
	octave4
	note $c3
	note $a3
	note $93
	note $73
	endchannel ; end
; 0xec657

_Music_Route12_Ch3: ; 0xec657
	vibrato $12, $54
	notetype $0c, $16
	octave3
	note $91
	note $03
	note $90
	note $a0
	note $c1
	note $01
	note $53
	note $41
	note $03
	note $40
	note $50
	note $71
	note $01
	note $43
	callchannel _Music_Route12_sub_0xec6b4
	note $70
	note $00
	note $50
	note $02
	note $40
	note $50
	note $73
	octave2
	note $c3
	callchannel _Music_Route12_sub_0xec6b4
	note $50
	note $00
	note $c0
	note $02
	octave2
	note $c0
	octave3
	note $20
	note $33
	note $63
	note $7c
	note $00
	note $70
	note $90
	note $a4
	note $00
	note $a0
	note $c0
	octave4
	note $13
	octave3
	note $73
	note $5d
	note $90
	note $a0
	note $c5
	note $50
	note $70
	note $83
	note $53
	octave2
	note $c4
	note $00
	note $c0
	octave3
	note $40
	note $77
	note $57
	note $73
	note $43
	note $50
	note $00
	note $50
	note $02
	note $50
	note $70
	note $93
	note $52
	note $00
	loopchannel $02, $46a3
	loopchannel $00, $466c ; end
; 0xec6b4

_Music_Route12_sub_0xec6b4: ; 0xec6b4
; subroutine
	octave3
	note $50
	note $00
	note $50
	note $02
	note $50
	note $70
	note $93
	note $53
	note $30
	note $00
	note $30
	note $02
	note $30
	note $50
	note $73
	note $33
	note $50
	note $00
	note $50
	note $02
	note $50
	note $70
	note $93
	note $53
	endchannel ; end
; 0xec6ce

_Music_Route12_Ch4: ; 0xec6ce
	togglenoise $04
	stereopanning $f0
	notetype $0c
	note $c9
	note $20
	note $20
	note $33
	note $c5
	note $20
	note $20
	note $33
	notetype $06
	callchannel _Music_Route12_sub_0xec717
	note $33
	note $37
	note $21
	note $21
	note $37
	callchannel _Music_Route12_sub_0xec717
	loopchannel $08, $46e1
	notetype $0c
	note $c9
	note $30
	note $30
	note $35
	note $20
	note $20
	note $35
	note $20
	note $20
	note $33
	loopchannel $02, $46ed
	note $cf
	notetype $06
	callchannel _Music_Route12_sub_0xec717
	callchannel _Music_Route12_sub_0xec717
	note $cf
	note $33
	note $37
	note $21
	note $21
	note $37
	callchannel _Music_Route12_sub_0xec717
	loopchannel $02, $4707
	loopchannel $00, $46e1 ; end
; 0xec717

_Music_Route12_sub_0xec717: ; 0xec717
; subroutine
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	note $20
	endchannel ; end
; 0xec720
