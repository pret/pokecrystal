_Music_LookPokemaniac: ; 0xebde1
	db $80
	dw _Music_LookPokemaniac_Ch1
	db $01
	dw _Music_LookPokemaniac_Ch2
	db $02
	dw _Music_LookPokemaniac_Ch3
; 0xebdea

_Music_LookPokemaniac_Ch1: ; 0xebdea
	stereopanning $0f
	tempo $9000
	volume $77
	vibrato $02, $33
	tone $0200
	notetype $0c, $b3
	note $07
	note $03
	octave3
	note $b0
	note $02
	note $b0
	note $02
	loopchannel $04, $7dfb
	note $03
	note $80
	note $02
	note $80
	note $02
	loopchannel $04, $7dfb
	loopchannel $00, $7dfb ; end
; 0xebe12

_Music_LookPokemaniac_Ch2: ; 0xebe12
	stereopanning $ff
	vibrato $02, $33
	tone $0100
	notetype $0c, $b3
	octave2
	note $a0
	note $70
	note $40
	note $10
	octave1
	note $a3
	octave2
	note $11
	note $01
	octave3
	note $70
	note $02
	note $a0
	note $02
	octave1
	note $81
	note $01
	octave3
	note $10
	note $02
	note $40
	note $02
	loopchannel $02, $7e24
	octave1
	note $a1
	note $01
	octave3
	note $40
	note $02
	note $70
	note $02
	octave1
	note $51
	note $01
	octave2
	note $a0
	note $02
	octave3
	note $10
	note $02
	loopchannel $02, $7e38
	loopchannel $00, $7e24 ; end
; 0xebe51

_Music_LookPokemaniac_Ch3: ; 0xebe51
	stereopanning $f0
	vibrato $06, $33
	notetype $0c, $15
	octave4
	note $10
	note $40
	note $70
	note $a0
	octave5
	note $13
	intensity $10
	callchannel _Music_LookPokemaniac_sub_0xebe70
	intensity $14
	callchannel _Music_LookPokemaniac_sub_0xebe70
	intensity $10
	loopchannel $00, $7e62 ; end
; 0xebe70

_Music_LookPokemaniac_sub_0xebe70: ; 0xebe70
; subroutine
	note $b5
	note $a1
	note $91
	note $81
	note $75
	note $61
	note $71
	note $a1
	octave4
	note $43
	note $10
	note $00
	note $40
	note $00
	note $10
	note $00
	note $40
	note $00
	octave5
	note $73
	note $10
	note $00
	note $70
	note $00
	note $10
	note $00
	note $70
	note $00
	note $85
	note $71
	note $61
	note $51
	note $45
	note $31
	note $41
	note $71
	note $13
	octave4
	note $a0
	note $00
	octave5
	note $10
	note $00
	note $40
	note $00
	note $10
	note $00
	note $43
	octave4
	note $a0
	note $00
	octave5
	note $40
	note $00
	note $70
	note $00
	note $10
	note $00
	endchannel ; end
; 0xebeab
