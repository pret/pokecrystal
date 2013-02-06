_Music_RuinsOfAlphInterior: ; 0xebd9e
	db $80
	dw _Music_RuinsOfAlphInterior_Ch1
	db $01
	dw _Music_RuinsOfAlphInterior_Ch2
	db $02
	dw _Music_RuinsOfAlphInterior_Ch3
; 0xebda7

_Music_RuinsOfAlphInterior_Ch1: ; 0xebda7
	tempo $e000
	volume $77
	dutycycle $00
	stereopanning $f0
	notetype $0c, $44
	note $00
	loopchannel $00, $7dc2 ; end
; 0xebdb8

_Music_RuinsOfAlphInterior_Ch2: ; 0xebdb8
	tone $0200
	dutycycle $00
	stereopanning $0f
	notetype $0c, $a4
	octave4
	note $13
	octave3
	note $b3
	octave4
	note $21
	note $41
	note $11
	octave3
	note $b1
	octave4
	note $13
	octave3
	note $b3
	loopchannel $00, $7dc2 ; end
; 0xebdd4

_Music_RuinsOfAlphInterior_Ch3: ; 0xebdd4
	notetype $0c, $10
	octave2
	note $91
	octave3
	note $21
	note $51
	note $09
	loopchannel $00, $7dd7 ; end
; 0xebde1
