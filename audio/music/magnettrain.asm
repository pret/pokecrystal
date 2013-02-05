_Music_MagnetTrain: ; 0xef5f0
	db $c0
	dw _Music_MagnetTrain_Ch1
	db $01
	dw _Music_MagnetTrain_Ch2
	db $02
	dw _Music_MagnetTrain_Ch3
	db $03
	dw _Music_MagnetTrain_Ch4
; 0xef5fc

_Music_MagnetTrain_Ch1: ; 0xef5fc
	tempo $6e00
	volume $77
	stereopanning $0f
	vibrato $14, $23
	dutycycle $02
	notetype $0c, $b2
	note $0f
	note $0f
	intensity $b7
	octave4
	note $30
	note $10
	octave3
	note $80
	octave4
	note $10
	note $30
	note $10
	octave3
	note $80
	octave4
	note $10
	note $30
	note $10
	octave3
	note $80
	octave4
	note $10
	note $30
	note $10
	octave3
	note $80
	octave4
	note $10
	note $50
	note $10
	octave3
	note $a0
	octave4
	note $10
	note $50
	note $10
	octave3
	note $a0
	octave4
	note $10
	note $50
	note $10
	octave3
	note $a0
	octave4
	note $10
	note $50
	note $10
	notetype $06, $b7
	note $70
	note $00
	note $70
	note $00
	notetype $0c, $b7
	note $3f
	endchannel ; end
; 0xef648

_Music_MagnetTrain_Ch2: ; 0xef648
	vibrato $14, $23
	dutycycle $01
	notetype $0c, $d2
	stereopanning $f0
	notetype $0c, $d8
	octave1
	note $6b
	note $01
	notetype $06, $d7
	note $60
	note $00
	note $60
	note $00
	octave2
	note $63
	note $03
	note $63
	note $03
	note $63
	note $03
	note $63
	note $03
	dutycycle $03
	notetype $0c, $d7
	octave4
	note $8f
	note $ac
	note $00
	notetype $06, $d7
	note $a0
	note $00
	note $a0
	note $00
	notetype $0c, $d7
	note $af
	endchannel ; end
; 0xef67d

_Music_MagnetTrain_Ch3: ; 0xef67d
	stereopanning $ff
	vibrato $10, $23
	notetype $0c, $15
	octave6
	note $10
	octave5
	note $80
	note $40
	note $10
	note $80
	note $40
	note $10
	octave4
	note $80
	octave5
	note $40
	note $10
	octave4
	note $80
	note $40
	octave5
	note $10
	octave4
	note $80
	note $40
	note $10
	note $80
	note $40
	note $10
	octave3
	note $80
	octave4
	note $10
	note $40
	note $80
	note $10
	note $40
	note $80
	octave5
	note $10
	octave4
	note $80
	octave5
	note $10
	note $40
	note $80
	note $10
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $30
	octave3
	note $30
	octave2
	note $3f
	endchannel ; end
; 0xef6f4

_Music_MagnetTrain_Ch4: ; 0xef6f4
	togglenoise $03
	notetype $0c
	note $cb
	note $31
	note $b0
	note $b0
	notetype $06
	note $43
	note $73
	note $43
	note $73
	note $b3
	note $73
	note $b3
	note $31
	note $31
	callchannel _Music_MagnetTrain_sub_0xef71e
	callchannel _Music_MagnetTrain_sub_0xef71e
	notetype $0c
	note $cf
	endchannel ; end
; 0xef711

INCBIN "baserom.gbc", $ef711, $ef71e - $ef711

_Music_MagnetTrain_sub_0xef71e: ; 0xef71e
; subroutine
	note $91
	note $81
	note $81
	note $81
	note $91
	note $81
	note $81
	note $81
	note $91
	note $81
	note $81
	note $81
	note $91
	note $81
	note $81
	note $81
	endchannel ; end
; 0xef72f
