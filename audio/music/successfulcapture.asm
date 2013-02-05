_Music_SuccessfulCapture: ; 0xf4602
	db $80
	dw _Music_SuccessfulCapture_Ch1
	db $01
	dw _Music_SuccessfulCapture_Ch2
	db $02
	dw _Music_SuccessfulCapture_Ch3
; 0xf460b

_Music_SuccessfulCapture_Ch1: ; 0xf460b
	tempo $7e00
	volume $77
	dutycycle $03
	tone $0100
	notetype $0c, $a1
	jumpchannel $4536 ; end
; 0xf461b

_Music_SuccessfulCapture_Ch2: ; 0xf461b
	vibrato $12, $24
	notetype $0c, $c1
	dutycycle $02
	jumpchannel $4585 ; end
; 0xf4626

_Music_SuccessfulCapture_Ch3: ; 0xf4626
	notetype $0c, $25
	jumpchannel $45cf ; end
; 0xf462c
