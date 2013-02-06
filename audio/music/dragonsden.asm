_Music_DragonsDen: ; 0xeece8
	db $c0
	dw _Music_DragonsDen_Ch1
	db $01
	dw _Music_DragonsDen_Ch2
	db $02
	dw _Music_DragonsDen_Ch3
	db $03
	dw _Music_DragonsDen_Ch4
; 0xeecf4

_Music_DragonsDen_Ch1: ; 0xeecf4
	tempo $9000
	volume $77
	dutycycle $00
	tone $0400
	stereopanning $f0
	notetype $0c, $80
	callchannel _Music_DragonsDen_sub_0xeed1e
	note $0f
	callchannel _Music_DragonsDen_sub_0xeed2d
	note $01
	callchannel _Music_DragonsDen_sub_0xeed2d
	note $01
	callchannel _Music_DragonsDen_sub_0xeed2d
	note $01
	callchannel _Music_DragonsDen_sub_0xeed2d
	note $09
	notetype $0c, $b7
	loopchannel $00, $6d03 ; end
; 0xeed1e

_Music_DragonsDen_sub_0xeed1e: ; 0xeed1e
; subroutine
	octave3
	note $bb
	note $a3
	note $bb
	note $a3
	note $b5
	octave4
	note $13
	note $25
	note $5f
	note $4b
	note $33
	octave3
	note $9f
	endchannel ; end
; 0xeed2d

_Music_DragonsDen_sub_0xeed2d: ; 0xeed2d
; subroutine
	intensity $b1
	note $01
	octave4
	note $22
	note $22
	note $22
	note $22
	note $23
	note $22
	note $22
	note $23
	note $21
	note $21
	endchannel ; end
; 0xeed3c

_Music_DragonsDen_Ch2: ; 0xeed3c
	dutycycle $00
	tone $0400
	stereopanning $0f
	notetype $0c, $90
	callchannel _Music_DragonsDen_sub_0xeed5e
	note $0f
	callchannel _Music_DragonsDen_sub_0xeed6b
	callchannel _Music_DragonsDen_sub_0xeed6b
	callchannel _Music_DragonsDen_sub_0xeed6b
	callchannel _Music_DragonsDen_sub_0xeed6b
	note $0f
	notetype $0c, $c7
	loopchannel $00, $6d46 ; end
; 0xeed5e

_Music_DragonsDen_sub_0xeed5e: ; 0xeed5e
; subroutine
	octave4
	note $4b
	note $33
	note $4b
	note $33
	note $45
	note $63
	note $75
	note $af
	note $9b
	note $83
	note $2f
	endchannel ; end
; 0xeed6b

_Music_DragonsDen_sub_0xeed6b: ; 0xeed6b
; subroutine
	intensity $c1
	octave5
	note $23
	octave4
	note $93
	note $93
	note $93
	loopchannel $02, $6d6d
	endchannel ; end
; 0xeed78

_Music_DragonsDen_Ch3: ; 0xeed78
	notetype $0c, $14
	octave4
	note $21
	octave3
	note $90
	octave4
	note $20
	octave3
	note $91
	octave4
	note $21
	octave3
	note $90
	octave4
	note $20
	octave3
	note $91
	octave4
	note $21
	octave3
	note $90
	octave4
	note $20
	loopchannel $0f, $6d78
	note $0f
	notetype $06, $27
	octave3
	note $23
	octave2
	note $91
	octave3
	note $21
	octave2
	note $93
	octave3
	note $23
	octave2
	note $91
	octave3
	note $21
	octave2
	note $93
	octave3
	note $23
	octave2
	note $91
	octave3
	note $21
	loopchannel $10, $6d99
	loopchannel $00, $6d78 ; end
; 0xeedb7

_Music_DragonsDen_Ch4: ; 0xeedb7
	togglenoise $00
	notetype $0c
	note $0f
	note $0f
	stereopanning $f0
	note $63
	stereopanning $0f
	note $73
	note $73
	stereopanning $f0
	note $73
	loopchannel $00, $6dbd ; end
; 0xeedcb
