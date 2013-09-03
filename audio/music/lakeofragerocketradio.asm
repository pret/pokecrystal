_Music_LakeOfRageRocketsRadioSignal: ; 0xef5b1
	db $80
	dw _Music_LakeOfRageRocketsRadioSignal_Ch1
	db $01
	dw _Music_LakeOfRageRocketsRadioSignal_Ch2
	db $02
	dw _Music_LakeOfRageRocketsRadioSignal_Ch3
; 0xef5ba

_Music_LakeOfRageRocketsRadioSignal_Ch1: ; 0xef5ba
	tempo $a000
	volume $77
	dutycycle $01
	tone $1811
	vibrato $00, $f0
	stereopanning $f0
	notetype $0c, $a7
	octave7
	note $83
	note $73
	note $83
	note $73
	note $0f
	loopchannel $00, $75c9 ; end
; 0xef5d6

_Music_LakeOfRageRocketsRadioSignal_Ch2: ; 0xef5d6
	dutycycle $01
	vibrato $13, $e8
	notetype $0c, $a7
	note $01
	stereopanning $0f
	loopchannel $00, $75c9 ; end
; 0xef5e5

_Music_LakeOfRageRocketsRadioSignal_Ch3: ; 0xef5e5
	notetype $0c, $26
	vibrato $10, $44
	note $03
	loopchannel $00, $75c9 ; end
; 0xef5f0
