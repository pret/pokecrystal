_Music_RuinsOfAlphRadioSignal: ; 0xeedcb
	db $80
	dw _Music_RuinsOfAlphRadioSignal_Ch1
	db $01
	dw _Music_RuinsOfAlphRadioSignal_Ch2
	db $02
	dw _Music_RuinsOfAlphRadioSignal_Ch3
; 0xeedd4

_Music_RuinsOfAlphRadioSignal_Ch1: ; 0xeedd4
	tempo $a000
	volume $77
	dutycycle $00
	tone $1801
	vibrato $00, $f0
	stereopanning $f0
	notetype $06, $71
	callchannel _Music_RuinsOfAlphRadioSignal_sub_0xeee01
	notetype $0c, $a1
	note $0f
	note $0f
	callchannel _Music_RuinsOfAlphRadioSignal_sub_0xeee08
	notetype $0c, $a1
	note $0f
	note $0f
	callchannel _Music_RuinsOfAlphRadioSignal_sub_0xeee01
	notetype $0c, $a1
	note $0f
	loopchannel $00, $6de3 ; end
; 0xeee01

_Music_RuinsOfAlphRadioSignal_sub_0xeee01: ; 0xeee01
; subroutine
	octave4
	note $80
	note $70
	note $80
	note $70
	note $17
	endchannel ; end
; 0xeee08

_Music_RuinsOfAlphRadioSignal_sub_0xeee08: ; 0xeee08
; subroutine
	octave4
	note $80
	note $70
	note $80
	note $70
	note $13
	note $80
	octave5
	note $17
	endchannel ; end
; 0xeee12

_Music_RuinsOfAlphRadioSignal_Ch2: ; 0xeee12
	dutycycle $01
	vibrato $01, $e0
	stereopanning $0f
	notetype $06, $81
	callchannel _Music_RuinsOfAlphRadioSignal_sub_0xeee01
	notetype $0c, $a1
	note $0f
	note $0f
	notetype $06, $81
	callchannel _Music_RuinsOfAlphRadioSignal_sub_0xeee08
	notetype $0c, $a1
	note $0f
	loopchannel $00, $6e17 ; end
; 0xeee32

_Music_RuinsOfAlphRadioSignal_Ch3: ; 0xeee32
	notetype $06, $26
	octave2
	note $10
	note $20
	note $10
	note $0f
	loopchannel $00, $6e35 ; end
; 0xeee3e
