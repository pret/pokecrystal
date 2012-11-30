_Music_Clair: ; 0x1fa8d
	db $c0
	dw _Music_Clair_Ch1
	db $01
	dw _Music_Clair_Ch2
	db $02
	dw _Music_Clair_Ch3
	db $03
	dw _Music_Clair_Ch4
; 0x1fa99

_Music_Clair_Ch1: ; 0x1fa99
	tempo $8800
	volume $77
	tone $0100
	vibrato $12, $34
	stereopanning $0f
	notetype $0c, $93
	dutycycle $03
	octave4
	note $60
	note $70
	note $60
	note $00
	note $20
	note $00
	loopchannel $02, $7aab
	octave3
	note $c0
	note $00
	note $90
	dutycycle $02
	intensity $92
	octave5
	note $60
	note $83
	intensity $a7
	dutycycle $03
	octave3
	note $43
	note $63
	note $83
	intensity $93
	callchannel _Music_Clair_sub_0x1fb12
	octave2
	note $c0
	octave3
	note $20
	note $41
	octave2
	note $80
	note $b0
	octave3
	note $21
	octave2
	note $b0
	note $80
	callchannel _Music_Clair_sub_0x1fb12
	note $40
	note $20
	note $41
	octave4
	note $b0
	note $90
	note $80
	note $90
	note $b0
	octave5
	note $40
	callchannel _Music_Clair_sub_0x1fb2e
	dutycycle $03
	note $92
	note $61
	note $00
	note $b3
	dutycycle $02
	note $40
	note $20
	note $40
	note $80
	note $b0
	octave5
	note $40
	callchannel _Music_Clair_sub_0x1fb2e
	dutycycle $03
	note $42
	note $21
	note $00
	octave3
	note $c3
	dutycycle $02
	note $90
	note $20
	note $40
	note $90
	note $c0
	octave4
	note $40
	loopchannel $00, $7ac9 ; end
; 0x1fb12

_Music_Clair_sub_0x1fb12: ; 0x1fb12
; subroutine
	dutycycle $03
	stereopanning $ff
	octave3
	note $c0
	note $01
	note $94
	dutycycle $02
	stereopanning $0f
	octave2
	note $c1
	note $90
	note $c0
	octave3
	note $40
	note $00
	note $40
	note $70
	note $60
	note $20
	note $00
	note $60
	note $20
	note $00
	endchannel ; end
; 0x1fb2e

_Music_Clair_sub_0x1fb2e: ; 0x1fb2e
; subroutine
	octave4
	note $70
	note $40
	note $00
	note $70
	note $40
	note $00
	octave3
	note $40
	note $90
	note $c1
	note $90
	note $c0
	octave4
	note $40
	note $00
	note $40
	note $70
	endchannel ; end
; 0x1fb41

_Music_Clair_Ch2: ; 0x1fb41
	dutycycle $03
	vibrato $12, $34
	notetype $06, $b7
	octave3
	note $b1
	note $c1
	note $b1
	note $01
	note $91
	note $01
	loopchannel $02, $7b49
	note $61
	note $01
	note $21
	note $01
	intensity $82
	note $41
	note $b1
	octave4
	note $21
	octave3
	note $b1
	intensity $92
	note $81
	octave4
	note $21
	note $41
	octave3
	note $b1
	intensity $b2
	octave4
	note $21
	note $41
	note $81
	note $41
	intensity $c2
	note $21
	note $41
	note $81
	note $b1
	intensity $b7
	callchannel _Music_Clair_sub_0x1fba6
	note $71
	note $03
	note $4b
	note $01
	note $43
	note $23
	octave3
	note $c2
	note $b0
	note $c5
	octave4
	note $23
	note $01
	octave3
	note $bf
	note $03
	forceoctave $0c
	callchannel _Music_Clair_sub_0x1fba6
	forceoctave $00
	octave5
	note $71
	note $03
	note $4b
	note $01
	octave4
	note $93
	note $b3
	note $c2
	octave5
	note $10
	note $25
	octave4
	note $b3
	note $01
	note $9f
	note $03
	loopchannel $00, $7b77 ; end
; 0x1fba6

_Music_Clair_sub_0x1fba6: ; 0x1fba6
; subroutine
	octave4
	note $71
	note $03
	note $4b
	note $01
	octave3
	note $93
	note $b3
	note $c2
	octave4
	note $10
	note $25
	octave3
	note $c3
	note $01
	octave4
	note $4f
	note $03
	endchannel ; end
; 0x1fbb9

_Music_Clair_Ch3: ; 0x1fbb9
	notetype $0c, $14
	forceoctave $0c
	octave3
	note $21
	note $03
	octave2
	note $90
	note $c0
	octave3
	note $21
	note $03
	octave2
	note $90
	note $c0
	octave3
	note $41
	note $01
	octave2
	note $b3
	note $93
	note $83
	callchannel _Music_Clair_sub_0x1fc3c
	octave2
	note $21
	note $00
	note $91
	note $00
	note $21
	note $01
	note $41
	note $b1
	note $41
	callchannel _Music_Clair_sub_0x1fc3c
	octave2
	note $91
	note $00
	note $21
	note $00
	note $41
	note $01
	note $40
	note $20
	note $40
	note $60
	note $80
	note $b0
	octave1
	note $91
	note $00
	octave2
	note $41
	note $00
	octave1
	note $91
	octave3
	note $70
	note $00
	octave1
	note $90
	octave3
	note $40
	octave2
	note $41
	octave1
	note $91
	octave2
	note $21
	note $00
	note $91
	note $00
	note $21
	octave3
	note $40
	note $00
	octave2
	note $40
	octave3
	note $b0
	octave2
	note $b1
	octave3
	note $80
	octave2
	note $40
	octave1
	note $91
	note $00
	octave2
	note $41
	note $00
	octave1
	note $91
	octave3
	note $70
	note $00
	octave1
	note $90
	octave3
	note $40
	octave2
	note $41
	octave1
	note $91
	octave2
	note $41
	note $00
	note $81
	note $00
	note $91
	octave2
	note $c0
	note $00
	octave1
	note $90
	octave2
	note $b0
	note $41
	note $90
	octave1
	note $90
	loopchannel $00, $7bd1 ; end
; 0x1fc3c

_Music_Clair_sub_0x1fc3c: ; 0x1fc3c
; subroutine
	octave1
	note $91
	note $00
	octave2
	note $41
	note $00
	octave1
	note $91
	note $01
	note $91
	octave2
	note $41
	octave1
	note $91
	endchannel ; end
; 0x1fc4b

_Music_Clair_Ch4: ; 0x1fc4b
	togglenoise $03
	notetype $0c
	stereopanning $f0
	note $c7
	note $c7
	note $c5
	stereopanning $ff
	note $40
	note $40
	note $31
	note $40
	note $40
	note $31
	note $30
	note $30
	stereopanning $ff
	callchannel _Music_Clair_sub_0x1fc6e
	note $80
	stereopanning $ff
	callchannel _Music_Clair_sub_0x1fc6e
	note $70
	loopchannel $00, $7c5e ; end
; 0x1fc6e

_Music_Clair_sub_0x1fc6e: ; 0x1fc6e
; subroutine
	note $41
	stereopanning $f0
	note $81
	stereopanning $ff
	note $31
	stereopanning $f0
	note $80
	note $80
	note $81
	stereopanning $ff
	note $40
	stereopanning $f0
	note $80
	stereopanning $ff
	note $31
	stereopanning $f0
	note $80
	endchannel ; end
; 0x1fc87
