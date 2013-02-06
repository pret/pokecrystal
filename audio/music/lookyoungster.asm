_Music_LookYoungster: ; 0xf66c3
	db $80
	dw _Music_LookYoungster_Ch1
	db $01
	dw _Music_LookYoungster_Ch2
	db $02
	dw _Music_LookYoungster_Ch3
; 0xf66cc

_Music_LookYoungster_Ch1: ; 0xf66cc
	tempo $7600
	volume $77
	stereopanning $0f
	dutycycle $03
	notetype $0c, $a3
	octave3
	note $80
	note $90
	note $a0
	note $b0
	intensity $3e
	note $cf
	intensity $c3
	octave4
	note $10
	note $02
	note $13
	note $01
	note $15
	intensity $b3
	note $01
	octave3
	note $80
	note $00
	note $c0
	note $00
	note $80
	note $00
	octave4
	note $30
	note $00
	note $10
	note $02
	note $10
	note $00
	note $0f
	note $01
	octave3
	note $80
	note $00
	note $c0
	note $00
	note $80
	note $00
	octave4
	note $30
	note $00
	note $10
	note $02
	note $10
	note $00
	note $0f
	loopchannel $00, $66ea ; end
; 0xf670e

; 0xf670e
	endchannel
; 0xf670f

_Music_LookYoungster_Ch2: ; 0xf670f
	stereopanning $f0
	vibrato $12, $26
	dutycycle $01
	notetype $0c, $a3
	octave3
	note $c0
	octave4
	note $10
	note $20
	note $30
	intensity $3e
	notetype $0c, $2e
	note $8f
	notetype $0c, $b3
	intensity $c3
	note $60
	note $02
	note $63
	note $01
	note $75
	dutycycle $03
	intensity $b3
	note $01
	octave3
	note $c0
	note $00
	octave4
	note $30
	note $00
	octave3
	note $c0
	note $00
	octave4
	note $80
	note $00
	note $60
	note $02
	note $60
	note $00
	intensity $97
	dutycycle $02
	note $40
	note $60
	note $40
	note $30
	note $10
	note $00
	octave3
	note $90
	note $02
	note $60
	note $00
	note $80
	note $00
	note $90
	note $00
	dutycycle $03
	intensity $b3
	note $01
	note $c0
	note $00
	octave4
	note $30
	note $00
	octave3
	note $c0
	note $00
	octave4
	note $80
	note $00
	note $60
	note $02
	note $60
	note $00
	dutycycle $02
	intensity $97
	note $90
	note $b0
	note $90
	note $80
	note $60
	note $00
	note $10
	note $02
	octave3
	note $90
	note $00
	note $b0
	note $00
	octave4
	note $10
	note $00
	loopchannel $00, $672f ; end
; 0xf6783

; 0xf6783
	endchannel
; 0xf6784

_Music_LookYoungster_Ch3: ; 0xf6784
	stereopanning $ff
	vibrato $02, $24
	notetype $0c, $25
	note $03
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	intensity $15
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	note $30
	note $02
	note $33
	note $01
	note $95
	intensity $25
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $60
	note $00
	octave3
	note $40
	note $00
	octave2
	note $60
	note $00
	octave3
	note $40
	note $00
	octave2
	note $60
	note $00
	octave3
	note $40
	note $00
	octave2
	note $60
	note $00
	octave3
	note $40
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $80
	note $00
	octave3
	note $80
	note $00
	octave2
	note $90
	note $00
	octave3
	note $40
	note $00
	octave2
	note $90
	note $00
	octave3
	note $40
	note $00
	octave2
	note $90
	note $00
	octave3
	note $40
	note $00
	note $80
	note $00
	note $90
	note $00
	loopchannel $00, $67ae ; end
; 0xf6810

	endchannel ; end
	
; 0xf6811