_Music_PokemonCenter: ; 0xed5c6
	db $c0
	dw _Music_PokemonCenter_Ch1
	db $01
	dw _Music_PokemonCenter_Ch2
	db $02
	dw _Music_PokemonCenter_Ch3
	db $03
	dw _Music_PokemonCenter_Ch4
; 0xed5d2

_Music_PokemonCenter_Ch1: ; 0xed5d2
	tempo $9800
	volume $77
	dutycycle $02
	vibrato $0a, $14
	tone $0100
	stereopanning $0f
	notetype $0c, $83
	octave3
	note $71
	note $61
	note $71
	octave4
	note $33
	note $21
	octave3
	note $c1
	note $a1
	note $c1
	note $a1
	note $81
	note $71
	note $51
	note $71
	note $81
	note $a1
	note $a1
	note $51
	note $a1
	octave4
	note $23
	octave3
	note $c1
	note $a1
	note $81
	note $71
	note $a1
	note $c1
	octave4
	note $21
	note $31
	note $21
	octave3
	note $c1
	note $a1
	note $71
	note $61
	note $71
	octave4
	note $33
	note $21
	octave3
	note $c1
	note $a1
	note $c1
	note $a1
	note $81
	note $71
	note $51
	note $71
	note $81
	note $a1
	note $a1
	note $51
	note $a1
	octave4
	note $23
	octave3
	note $c1
	note $a1
	note $81
	notetype $0c, $b4
	note $71
	note $51
	note $31
	note $51
	note $71
	note $81
	note $a1
	note $c1
	stereopanning $f0
	note $71
	note $51
	note $33
	note $51
	note $71
	note $81
	note $a1
	note $c1
	note $a1
	note $83
	note $51
	note $71
	note $81
	note $a1
	note $81
	note $71
	note $53
	note $21
	note $31
	note $51
	note $81
	note $71
	note $81
	note $a1
	note $c1
	note $a7
	octave4
	note $31
	note $21
	octave3
	note $c3
	note $a1
	note $c1
	octave4
	note $21
	note $31
	note $51
	note $31
	note $23
	octave3
	note $c1
	octave4
	note $21
	note $31
	note $51
	note $21
	octave3
	note $c1
	note $a3
	note $81
	note $a1
	note $c1
	note $81
	note $a1
	note $81
	note $71
	note $51
	note $31
	note $51
	note $71
	note $81
	loopchannel $00, $55df ; end
; 0xed671

_Music_PokemonCenter_Ch2: ; 0xed671
	vibrato $10, $25
	stereopanning $ff
	callchannel _Music_PokemonCenter_sub_0xed6d1
	stereopanning $0f
	notetype $0c, $a5
	octave3
	note $a3
	note $53
	stereopanning $ff
	callchannel _Music_PokemonCenter_sub_0xed6e4
	note $31
	note $75
	stereopanning $0f
	notetype $0c, $a5
	octave3
	note $a3
	note $53
	stereopanning $ff
	callchannel _Music_PokemonCenter_sub_0xed6d1
	stereopanning $0f
	notetype $0c, $a5
	octave3
	note $a3
	note $53
	stereopanning $ff
	callchannel _Music_PokemonCenter_sub_0xed6e4
	note $37
	stereopanning $0f
	notetype $0c, $a5
	octave3
	note $33
	note $53
	notetype $0c, $c6
	octave4
	note $77
	note $a7
	note $81
	note $a1
	note $81
	note $71
	note $57
	note $27
	note $57
	note $71
	note $81
	note $71
	note $51
	note $37
	note $77
	note $a7
	note $81
	note $71
	note $81
	note $a1
	note $c7
	note $a3
	note $81
	note $71
	note $87
	note $71
	note $81
	note $71
	note $51
	note $37
	loopchannel $00, $5674 ; end
; 0xed6d1

_Music_PokemonCenter_sub_0xed6d1: ; 0xed6d1
; subroutine
	dutycycle $02
	notetype $0c, $c2
	octave4
	note $31
	octave3
	note $a1
	octave4
	note $31
	intensity $c3
	note $a3
	note $83
	note $71
	note $51
	note $25
	endchannel ; end
; 0xed6e4

_Music_PokemonCenter_sub_0xed6e4: ; 0xed6e4
; subroutine
	notetype $0c, $c2
	octave4
	note $21
	octave3
	note $a1
	octave4
	note $21
	intensity $c3
	note $73
	note $53
	note $21
	endchannel ; end
; 0xed6f3

_Music_PokemonCenter_Ch3: ; 0xed6f3
	notetype $0c, $28
	stereopanning $f0
	octave3
	note $30
	note $04
	note $70
	note $02
	note $70
	note $00
	note $80
	note $00
	note $70
	note $00
	callchannel _Music_PokemonCenter_sub_0xed76f
	callchannel _Music_PokemonCenter_sub_0xed778
	note $70
	note $04
	note $a0
	note $02
	note $a0
	note $00
	note $80
	note $00
	note $a0
	note $00
	note $30
	note $04
	note $70
	note $02
	note $70
	note $00
	note $80
	note $00
	note $70
	note $00
	callchannel _Music_PokemonCenter_sub_0xed76f
	callchannel _Music_PokemonCenter_sub_0xed778
	note $30
	note $04
	note $70
	note $02
	note $70
	note $00
	note $30
	note $00
	note $80
	note $00
	stereopanning $ff
	callchannel _Music_PokemonCenter_sub_0xed783
	note $80
	note $04
	note $c0
	note $02
	note $c0
	note $00
	note $80
	note $00
	note $c0
	note $00
	note $50
	note $04
	note $80
	note $02
	note $80
	note $02
	note $80
	note $00
	note $70
	note $04
	note $a0
	note $02
	note $a0
	note $00
	note $90
	note $00
	note $a0
	note $00
	callchannel _Music_PokemonCenter_sub_0xed783
	note $80
	note $04
	note $c0
	note $02
	note $c0
	note $02
	note $c0
	note $00
	note $50
	note $04
	note $80
	note $02
	note $80
	note $02
	note $80
	note $00
	note $70
	note $04
	note $a0
	note $02
	note $a0
	note $00
	note $80
	note $00
	note $50
	note $00
	loopchannel $00, $56f6 ; end
; 0xed76f

_Music_PokemonCenter_sub_0xed76f: ; 0xed76f
; subroutine
	note $50
	note $04
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $00
	endchannel ; end
; 0xed778

_Music_PokemonCenter_sub_0xed778: ; 0xed778
; subroutine
	note $50
	note $04
	note $a0
	note $02
	note $a0
	note $00
	note $80
	note $00
	note $a0
	note $00
	endchannel ; end
; 0xed783

_Music_PokemonCenter_sub_0xed783: ; 0xed783
; subroutine
	note $70
	note $04
	note $a0
	note $02
	note $a0
	note $02
	note $a0
	note $00
	endchannel ; end
; 0xed78c

_Music_PokemonCenter_Ch4: ; 0xed78c
	togglenoise $03
	notetype $0c
	stereopanning $ff
	note $85
	note $83
	note $81
	note $81
	note $81
	loopchannel $00, $5792 ; end
; 0xed79b
