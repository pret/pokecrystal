_Music_MtMoon: ; 0xedb29
	db $c0
	dw _Music_MtMoon_Ch1
	db $01
	dw _Music_MtMoon_Ch2
	db $02
	dw _Music_MtMoon_Ch3
	db $03
	dw _Music_MtMoon_Ch4
; 0xedb35

_Music_MtMoon_Ch1: ; 0xedb35
	tempo $d000
	volume $77
	dutycycle $02
	tone $0100
	vibrato $08, $14
	stereopanning $f0
	notetype $0c, $45
	note $01
	loopchannel $00, $5b56 ; end
; 0xedb4c

_Music_MtMoon_Ch2: ; 0xedb4c
	vibrato $0b, $15
	dutycycle $02
	notetype $0c, $84
	stereopanning $0f
	octave4
	note $45
	note $25
	octave3
	note $c1
	octave4
	note $21
	note $41
	note $81
	note $41
	note $25
	octave3
	note $c1
	octave4
	note $21
	note $41
	note $81
	note $41
	note $25
	octave3
	note $c1
	note $b1
	note $c5
	octave4
	note $29
	note $95
	note $75
	note $51
	note $71
	note $91
	octave5
	note $11
	octave4
	note $91
	note $75
	note $51
	note $71
	note $91
	octave5
	note $11
	octave4
	note $91
	note $75
	note $51
	note $41
	note $55
	note $75
	note $53
	loopchannel $00, $5b56 ; end
; 0xedb8a

_Music_MtMoon_Ch3: ; 0xedb8a
	notetype $0c, $28
	octave2
	note $c1
	octave3
	note $41
	note $81
	octave2
	note $c1
	octave3
	note $41
	note $81
	octave2
	note $c1
	octave3
	note $41
	loopchannel $03, $5b8d
	octave2
	note $c1
	octave3
	note $41
	note $81
	octave2
	note $c1
	octave3
	note $41
	note $81
	note $41
	note $51
	note $51
	note $91
	octave4
	note $11
	octave3
	note $51
	note $91
	octave4
	note $11
	octave3
	note $51
	note $91
	loopchannel $04, $5bab
	loopchannel $00, $5b8a ; end
; 0xedbbf

_Music_MtMoon_Ch4: ; 0xedbbf
	togglenoise $05
	notetype $0c
	stereopanning $0f
	note $b3
	note $b7
	note $b3
	stereopanning $f0
	note $b3
	note $b3
	note $b3
	stereopanning $0f
	note $b3
	note $b3
	stereopanning $f0
	note $b7
	loopchannel $00, $5bc3 ; end
; 0xedbd8
