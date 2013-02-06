_Music_PokeFluteChannel: ; 0xf7b13
	db $80
	dw _Music_PokeFluteChannel_Ch1
	db $01
	dw _Music_PokeFluteChannel_Ch2
	db $02
	dw _Music_PokeFluteChannel_Ch3
; 0xf7b1c

_Music_PokeFluteChannel_Ch1: ; 0xf7b1c
	tempo $f000
	volume $77
	stereopanning $f0
	dutycycle $03
	tone $0200
	notetype $0c, $b4
	note $03
	octave3
	note $57
	note $57
	notetype $0c, $b3
	note $61
	note $51
	note $31
	note $11
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $cf
	note $01
	octave2
	note $83
	note $a7
	octave3
	note $51
	note $81
	note $63
	octave2
	note $67
	octave3
	note $81
	note $a1
	note $83
	octave2
	note $53
	octave3
	note $81
	note $a1
	note $c1
	octave4
	note $11
	octave3
	note $c7
	note $a7
	note $87
	octave2
	note $c1
	octave3
	note $31
	octave2
	note $c3
	note $87
	octave3
	note $13
	note $51
	note $31
	octave2
	note $83
	note $a7
	loopchannel $00, $7b40 ; end
; 0xf7b68

_Music_PokeFluteChannel_Ch2: ; 0xf7b68
	stereopanning $0f
	dutycycle $03
	tone $0100
	notetype $0c, $c4
	note $03
	octave3
	note $17
	octave2
	note $87
	note $a7
	octave3
	note $57
	notetype $0c, $c3
	octave2
	note $51
	note $81
	octave3
	note $11
	note $51
	octave2
	note $81
	octave3
	note $11
	note $51
	note $31
	octave2
	note $51
	octave3
	note $11
	octave2
	note $61
	octave3
	note $11
	octave2
	note $51
	note $81
	octave3
	note $11
	note $51
	octave2
	note $a3
	note $13
	octave3
	note $81
	note $61
	note $51
	note $31
	octave2
	note $83
	note $13
	note $81
	note $51
	octave3
	note $11
	octave2
	note $a1
	note $31
	note $81
	note $c1
	octave3
	note $31
	octave2
	note $31
	note $71
	note $a1
	octave3
	note $31
	octave2
	note $81
	octave3
	note $31
	note $81
	note $31
	octave2
	note $33
	note $83
	note $51
	octave3
	note $11
	note $13
	octave2
	note $81
	octave3
	note $51
	octave2
	note $81
	note $c1
	note $51
	octave3
	note $11
	octave2
	note $61
	octave3
	note $11
	octave2
	note $51
	note $81
	loopchannel $00, $7b94 ; end
; 0xf7bd5

_Music_PokeFluteChannel_Ch3: ; 0xf7bd5
	vibrato $10, $14
	notetype $0c, $10
	callchannel _Music_PokeFluteChannel_sub_0xf7c05
	callchannel _Music_PokeFluteChannel_sub_0xf7c05
	note $03
	octave4
	note $11
	octave5
	note $61
	note $51
	note $61
	octave6
	note $13
	note $03
	octave4
	note $11
	octave5
	note $81
	note $71
	note $81
	octave6
	note $13
	octave5
	note $c1
	note $a1
	note $c3
	note $a1
	note $81
	note $a3
	note $81
	note $71
	note $87
	note $03
	callchannel _Music_PokeFluteChannel_sub_0xf7c05
	loopchannel $00, $7be1 ; end
; 0xf7c05

_Music_PokeFluteChannel_sub_0xf7c05: ; 0xf7c05
; subroutine
	octave5
	note $51
	note $61
	note $83
	note $a1
	note $81
	octave6
	note $13
	note $11
	note $31
	note $11
	octave5
	note $81
	note $a1
	note $61
	note $83
	endchannel ; end
; 0xf7c16
