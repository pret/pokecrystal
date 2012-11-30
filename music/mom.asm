_Music_Mom: ; 0xf6bf2
	db $81
	dw _Music_Mom_Ch2
	db $02
	dw _Music_Mom_Ch3
	db $03
	dw _Music_Mom_Ch4
; 0xf6bfb

_Music_Mom_Ch2: ; 0xf6bfb
	tempo $9000
	volume $77
	stereopanning $0f
	dutycycle $02
	notetype $06, $b3
	octave3
	note $c0
	octave4
	note $50
	note $90
	note $a0
	note $c7
	notetype $0c, $b1
	note $03
	octave3
	note $25
	note $33
	note $11
	note $01
	note $25
	octave2
	note $53
	note $b1
	note $c1
	loopchannel $00, $6c0e ; end
; 0xf6c20

_Music_Mom_Ch3: ; 0xf6c20
	stereopanning $f0
	notetype $06, $25
	octave3
	note $50
	note $30
	octave2
	note $c0
	note $90
	note $57
	intensity $23
	octave2
	note $a1
	note $05
	octave4
	note $51
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave4
	note $77
	note $41
	note $01
	octave2
	note $a1
	note $01
	octave4
	note $51
	note $05
	octave2
	note $a1
	note $01
	octave4
	note $31
	note $05
	note $23
	note $31
	note $01
	loopchannel $00, $6c2e ; end
; 0xf6c51

_Music_Mom_Ch4: ; 0xf6c51
	togglenoise $03
	notetype $0c, $05
	note $40
	note $00
	note $71
	note $30
	note $00
	note $80
	note $00
	note $80
	note $00
	note $73
	note $30
	note $00
	note $40
	note $00
	note $73
	note $30
	note $00
	note $80
	note $00
	note $80
	note $00
	note $31
	note $40
	note $00
	loopchannel $00, $6c56 ; end
; 0xf6c72
