_Music_IndigoPlateau: ; 0xee852
	db $c0
	dw _Music_IndigoPlateau_Ch1
	db $01
	dw _Music_IndigoPlateau_Ch2
	db $02
	dw _Music_IndigoPlateau_Ch3
	db $03
	dw _Music_IndigoPlateau_Ch4
; 0xee85e

_Music_IndigoPlateau_Ch1: ; 0xee85e
	tempo $8000
	volume $77
	dutycycle $03
	tone $0200
	stereopanning $0f
	callchannel _Music_IndigoPlateau_sub_0xee881
	octave3
	note $33
	callchannel _Music_IndigoPlateau_sub_0xee881
	octave3
	note $43
	callchannel _Music_IndigoPlateau_sub_0xee881
	octave3
	note $43
	callchannel _Music_IndigoPlateau_sub_0xee881
	note $b3
	loopchannel $00, $686a ; end
; 0xee881

_Music_IndigoPlateau_sub_0xee881: ; 0xee881
; subroutine
	notetype $0c, $b6
	octave2
	note $a3
	intensity $b2
	note $a1
	note $a1
	note $a1
	note $a1
	note $a3
	note $a1
	note $a1
	intensity $a0
	endchannel ; end
; 0xee892

_Music_IndigoPlateau_Ch2: ; 0xee892
	dutycycle $03
	vibrato $10, $22
	stereopanning $f0
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $b3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $23
	intensity $c7
	note $a5
	note $31
	note $81
	note $b1
	note $a7
	intensity $b0
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $b3
	intensity $c7
	octave4
	note $35
	note $41
	note $13
	note $37
	intensity $b0
	octave3
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $23
	intensity $c7
	octave4
	note $15
	octave3
	note $b1
	note $a1
	note $81
	note $77
	intensity $b0
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $b3
	intensity $c7
	octave4
	note $35
	note $41
	note $63
	note $77
	intensity $b0
	octave3
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee8e9
	note $23
	loopchannel $00, $6899 ; end
; 0xee8e9

_Music_IndigoPlateau_sub_0xee8e9: ; 0xee8e9
; subroutine
	notetype $0c, $c6
	octave3
	note $33
	intensity $c2
	note $31
	note $31
	note $31
	note $31
	note $33
	note $31
	note $31
	intensity $b0
	endchannel ; end
; 0xee8fa

_Music_IndigoPlateau_Ch3: ; 0xee8fa
	notetype $0c, $19
	callchannel _Music_IndigoPlateau_sub_0xee915
	octave3
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee915
	octave3
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee915
	octave3
	note $a3
	callchannel _Music_IndigoPlateau_sub_0xee915
	octave3
	note $73
	loopchannel $00, $68fd ; end
; 0xee915

_Music_IndigoPlateau_sub_0xee915: ; 0xee915
; subroutine
	octave3
	note $30
	note $02
	octave2
	note $a0
	note $02
	octave3
	note $10
	note $02
	note $30
	note $02
	octave2
	note $a0
	note $02
	endchannel ; end
; 0xee924

_Music_IndigoPlateau_Ch4: ; 0xee924
	stereopanning $f0
	togglenoise $00
	notetype $0c
	note $43
	note $31
	note $41
	note $41
	note $41
	note $33
	note $31
	note $31
	notetype $06
	note $30
	note $30
	note $40
	note $40
	note $40
	note $40
	note $30
	note $30
	notetype $0c
	note $43
	note $31
	note $41
	note $41
	note $31
	note $23
	note $31
	note $31
	note $23
	loopchannel $00, $692a ; end
; 0xee94b
