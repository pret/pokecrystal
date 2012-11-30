_Music_MobileAdapterMenu: ; 0x17801f
	db $80
	dw _Music_MobileAdapterMenu_Ch1
	db $01
	dw _Music_MobileAdapterMenu_Ch2
	db $02
	dw _Music_MobileAdapterMenu_Ch3
; 0x178028

_Music_MobileAdapterMenu_Ch1: ; 0x178028
	tempo $a800
	volume $77
	tone $0100
	stereopanning $0f
	dutycycle $02
	notetype $0c, $66
	note $01
	callchannel _Music_MobileAdapterMenu_sub_0x178057
	callchannel _Music_MobileAdapterMenu_sub_0x178076
	octave3
	note $73
	note $c3
	note $71
	note $c0
	note $00
	note $43
	callchannel _Music_MobileAdapterMenu_sub_0x178076
	octave3
	note $71
	octave2
	note $c1
	octave3
	note $42
	note $50
	note $47
	callchannel _Music_MobileAdapterMenu_sub_0x178057
	loopchannel $00, $4038 ; end
; 0x178057

_Music_MobileAdapterMenu_sub_0x178057: ; 0x178057
; subroutine
	octave3
	note $96
	octave4
	note $50
	note $40
	note $00
	octave3
	note $c0
	note $00
	note $73
	note $57
	note $40
	note $00
	note $20
	note $00
	note $43
	note $96
	octave4
	note $50
	note $40
	note $00
	octave3
	note $c0
	note $00
	note $73
	note $a1
	note $51
	note $a2
	note $a0
	note $97
	endchannel ; end
; 0x178076

_Music_MobileAdapterMenu_sub_0x178076: ; 0x178076
; subroutine
	note $50
	note $00
	note $a0
	note $00
	octave4
	note $22
	octave3
	note $c0
	note $a1
	octave4
	note $50
	note $00
	note $23
	endchannel ; end
; 0x178084

_Music_MobileAdapterMenu_Ch2: ; 0x178084
	stereopanning $f0
	notetype $0c, $84
	dutycycle $02
	octave4
	note $50
	note $90
	callchannel _Music_MobileAdapterMenu_sub_0x1780ae
	note $57
	callchannel _Music_MobileAdapterMenu_sub_0x1780d7
	note $41
	note $21
	note $42
	note $50
	note $77
	callchannel _Music_MobileAdapterMenu_sub_0x1780d7
	note $41
	note $51
	note $72
	note $90
	note $75
	note $50
	note $90
	callchannel _Music_MobileAdapterMenu_sub_0x1780ae
	note $55
	note $50
	note $90
	loopchannel $00, $408e ; end
; 0x1780ae

_Music_MobileAdapterMenu_sub_0x1780ae: ; 0x1780ae
; subroutine
	octave4
	note $c0
	note $00
	note $c0
	note $00
	note $a2
	note $90
	note $70
	note $00
	note $40
	note $00
	octave3
	note $c3
	octave4
	note $21
	note $41
	note $52
	note $90
	note $75
	note $50
	note $90
	note $c0
	note $00
	note $c0
	note $00
	note $a2
	note $90
	note $70
	note $00
	note $40
	note $00
	octave3
	note $c3
	octave4
	note $21
	octave3
	note $c1
	octave4
	note $22
	note $40
	endchannel ; end
; 0x1780d7

_Music_MobileAdapterMenu_sub_0x1780d7: ; 0x1780d7
; subroutine
	note $a0
	note $00
	note $a0
	note $00
	note $92
	note $70
	note $51
	note $a0
	note $00
	note $53
	endchannel ; end
; 0x1780e2

_Music_MobileAdapterMenu_Ch3: ; 0x1780e2
	vibrato $08, $34
	notetype $0c, $25
	note $01
	callchannel _Music_MobileAdapterMenu_sub_0x178119
	octave2
	note $c0
	note $90
	callchannel _Music_MobileAdapterMenu_sub_0x178146
	octave2
	note $c1
	note $01
	octave3
	note $71
	note $00
	note $40
	note $71
	note $40
	note $00
	octave2
	note $c1
	note $70
	note $90
	callchannel _Music_MobileAdapterMenu_sub_0x178146
	octave2
	note $c1
	note $01
	octave3
	note $71
	note $00
	note $40
	octave2
	note $c0
	note $00
	octave3
	note $40
	note $00
	note $73
	callchannel _Music_MobileAdapterMenu_sub_0x178119
	note $01
	loopchannel $00, $40e9 ; end
; 0x178119

_Music_MobileAdapterMenu_sub_0x178119: ; 0x178119
; subroutine
	octave3
	note $51
	note $01
	note $c1
	note $00
	note $90
	note $40
	note $00
	note $c0
	note $00
	note $43
	note $21
	note $01
	note $a1
	note $00
	note $70
	octave2
	note $c0
	note $00
	octave3
	note $40
	note $00
	note $73
	note $51
	note $01
	note $c1
	note $00
	note $90
	note $40
	note $00
	note $c0
	note $00
	note $43
	note $21
	note $01
	note $a1
	note $00
	note $20
	note $52
	intensity $35
	note $52
	intensity $25
	endchannel ; end
; 0x178146

_Music_MobileAdapterMenu_sub_0x178146: ; 0x178146
; subroutine
	note $a1
	note $01
	octave3
	note $a1
	note $00
	note $20
	note $a1
	octave4
	note $20
	note $00
	octave3
	note $a3
	endchannel ; end
; 0x178153
