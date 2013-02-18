_Music_BuenasPassword: ; 0x178153
	db $c0
	dw _Music_BuenasPassword_Ch1
	db $01
	dw _Music_BuenasPassword_Ch2
	db $02
	dw _Music_BuenasPassword_Ch3
	db $03
	dw _Music_BuenasPassword_Ch4
; 0x17815f

_Music_BuenasPassword_Ch1: ; 0x17815f
	tempo $8800
	volume $77
	tone $0100
	notetype $0c, $b3
	note $07
	stereopanning $ff
	note $0f
	note $0f
	dutycycle $03
	notetype $06, $97
	stereopanning $0f
	octave4
	note $90
	note $00
	note $90
	note $00
	note $71
	note $91
	note $09
	note $09
	stereopanning $f0
	note $21
	note $61
	note $90
	note $00
	note $90
	note $00
	note $71
	note $91
	note $0b
	dutycycle $02
	callchannel _Music_BuenasPassword_sub_0x178204
	stereopanning $ff
	callchannel _Music_BuenasPassword_sub_0x1782df
	callchannel _Music_BuenasPassword_sub_0x178222
	callchannel _Music_BuenasPassword_sub_0x178204
	stereopanning $ff
	callchannel _Music_BuenasPassword_sub_0x1782df
	callchannel _Music_BuenasPassword_sub_0x178222
	callchannel _Music_BuenasPassword_sub_0x178204
	dutycycle $01
	note $21
	note $01
	note $41
	note $01
	note $71
	note $00
	note $91
	note $00
	note $b1
	note $c0
	note $00
	octave4
	note $20
	note $00
	note $40
	note $00
	octave3
	note $c1
	note $01
	note $c1
	note $91
	note $c1
	note $b1
	note $91
	note $80
	note $42
	note $21
	octave2
	note $c1
	note $b0
	note $92
	note $b1
	note $81
	note $b0
	octave3
	note $22
	note $41
	note $21
	note $40
	note $82
	note $c1
	note $01
	note $b1
	note $01
	note $91
	note $00
	note $71
	note $00
	note $41
	note $20
	note $00
	note $40
	note $00
	note $60
	note $00
	note $21
	note $01
	note $91
	octave4
	note $21
	note $61
	note $90
	note $00
	note $40
	note $00
	note $90
	note $72
	note $60
	note $00
	note $40
	note $00
	octave3
	note $c0
	note $92
	note $70
	note $00
	note $40
	note $00
	note $90
	note $41
	note $70
	note $90
	note $00
	note $40
	note $00
	note $70
	note $00
	note $80
	note $00
	loopchannel $00, $416b ; end
; 0x178204

_Music_BuenasPassword_sub_0x178204: ; 0x178204
; subroutine
	stereopanning $0f
	notetype $06, $84
	octave4
	note $41
	intensity $71
	note $20
	note $10
	intensity $51
	octave3
	note $b0
	note $90
	intensity $31
	note $80
	note $60
	intensity $11
	note $40
	note $20
	note $10
	note $00
	notetype $0c, $84
	endchannel ; end
; 0x178222

_Music_BuenasPassword_sub_0x178222: ; 0x178222
; subroutine
	octave3
	note $40
	note $00
	octave2
	note $90
	note $00
	octave3
	note $40
	octave2
	note $90
	note $00
	octave3
	note $40
	note $01
	endchannel ; end
; 0x178231

_Music_BuenasPassword_Ch2: ; 0x178231
	vibrato $12, $34
	dutycycle $02
	notetype $0c, $a5
	note $06
	octave3
	note $70
	stereopanning $ff
	callchannel _Music_BuenasPassword_sub_0x1782df
	callchannel _Music_BuenasPassword_sub_0x1782a4
	stereopanning $ff
	callchannel _Music_BuenasPassword_sub_0x1782cc
	octave3
	note $c1
	note $b1
	note $c1
	note $9f
	callchannel _Music_BuenasPassword_sub_0x1782a4
	stereopanning $ff
	callchannel _Music_BuenasPassword_sub_0x1782cc
	note $c1
	note $b1
	note $c1
	note $9f
	callchannel _Music_BuenasPassword_sub_0x1782a4
	note $71
	note $01
	note $91
	note $01
	note $b1
	note $00
	note $c1
	note $00
	octave4
	note $21
	note $40
	note $00
	note $60
	note $00
	note $70
	note $00
	note $41
	note $01
	note $91
	note $71
	note $91
	note $4d
	note $20
	note $40
	note $25
	octave3
	note $c0
	octave4
	note $20
	note $47
	note $71
	note $01
	note $61
	note $01
	note $41
	note $00
	note $21
	note $00
	octave3
	note $c1
	note $90
	note $00
	note $b0
	note $00
	note $c0
	note $00
	note $91
	note $01
	octave4
	note $21
	note $61
	note $91
	note $cd
	note $b0
	note $c0
	note $99
	intensity $84
	octave2
	note $40
	note $00
	note $70
	note $00
	note $80
	note $00
	intensity $a5
	loopchannel $00, $423c ; end
; 0x1782a4

_Music_BuenasPassword_sub_0x1782a4: ; 0x1782a4
; subroutine
	octave3
	note $90
	note $00
	note $40
	note $00
	note $70
	note $40
	note $00
	note $70
	note $01
	stereopanning $f0
	octave4
	note $90
	notetype $06, $81
	note $80
	note $60
	intensity $71
	note $40
	note $20
	intensity $61
	note $10
	octave3
	note $b0
	intensity $41
	note $90
	intensity $21
	note $80
	note $60
	note $00
	notetype $0c, $a5
	endchannel ; end
; 0x1782cc

_Music_BuenasPassword_sub_0x1782cc: ; 0x1782cc
; subroutine
	octave4
	note $91
	note $01
	note $71
	note $01
	note $61
	note $00
	note $41
	note $00
	note $21
	note $40
	note $00
	note $40
	note $00
	note $20
	note $00
	note $41
	note $01
	endchannel ; end
; 0x1782df

_Music_BuenasPassword_sub_0x1782df: ; 0x1782df
; subroutine
	octave3
	note $90
	note $00
	note $40
	note $00
	note $70
	note $40
	note $00
	note $70
	note $60
	note $00
	note $20
	note $00
	octave2
	note $c0
	note $92
	octave3
	note $90
	note $00
	note $40
	note $00
	note $70
	note $40
	note $00
	note $70
	note $60
	note $00
	note $20
	note $00
	octave2
	note $c0
	note $91
	octave3
	note $70
	note $90
	note $00
	note $40
	note $00
	note $70
	note $40
	note $00
	note $70
	note $60
	note $00
	note $20
	note $00
	octave2
	note $c0
	note $92
	endchannel ; end
; 0x178311

_Music_BuenasPassword_Ch3: ; 0x178311
	notetype $0c, $14
	note $07
	callchannel _Music_BuenasPassword_sub_0x1783a7
	callchannel _Music_BuenasPassword_sub_0x1783a7
	callchannel _Music_BuenasPassword_sub_0x1783a7
	octave2
	note $90
	note $00
	octave3
	note $70
	note $00
	octave2
	note $90
	octave3
	note $41
	octave2
	note $90
	note $01
	note $c0
	note $00
	note $93
	loopchannel $03, $4315
	note $70
	note $00
	note $b0
	note $00
	octave3
	note $20
	octave2
	note $70
	note $00
	octave3
	note $20
	octave2
	note $70
	note $00
	note $b1
	octave3
	note $20
	note $00
	octave2
	note $71
	note $90
	note $00
	note $90
	note $00
	note $c0
	note $90
	note $00
	octave3
	note $40
	octave2
	note $90
	note $00
	octave3
	note $91
	octave2
	note $90
	note $00
	octave3
	note $41
	octave2
	note $40
	note $00
	note $40
	note $00
	note $90
	note $40
	note $00
	note $b0
	note $40
	note $00
	note $91
	note $b0
	note $00
	note $40
	note $00
	note $40
	note $00
	note $40
	note $00
	note $80
	note $40
	note $00
	note $b0
	note $40
	note $00
	octave3
	note $41
	octave2
	note $40
	note $00
	note $81
	callchannel _Music_BuenasPassword_sub_0x1783bc
	octave3
	note $20
	note $00
	note $20
	note $00
	note $60
	note $20
	note $00
	note $90
	octave2
	note $90
	note $00
	octave3
	note $61
	octave2
	note $90
	note $00
	octave3
	note $21
	callchannel _Music_BuenasPassword_sub_0x1783bc
	note $90
	note $00
	note $90
	note $00
	note $c0
	note $91
	octave3
	note $40
	octave2
	note $90
	note $00
	note $40
	note $00
	note $70
	note $00
	note $80
	note $00
	loopchannel $00, $4315 ; end
; 0x1783a7

_Music_BuenasPassword_sub_0x1783a7: ; 0x1783a7
; subroutine
	octave2
	note $90
	note $00
	octave3
	note $70
	note $00
	octave2
	note $90
	octave3
	note $41
	octave2
	note $90
	octave3
	note $20
	note $00
	note $c0
	note $00
	note $20
	note $61
	note $20
	endchannel ; end
; 0x1783bc

_Music_BuenasPassword_sub_0x1783bc: ; 0x1783bc
; subroutine
	octave2
	note $90
	note $00
	note $90
	note $00
	note $c0
	note $90
	note $00
	octave3
	note $40
	octave2
	note $90
	note $00
	note $c1
	octave3
	note $40
	note $00
	octave2
	note $91
	endchannel ; end
; 0x1783d0

_Music_BuenasPassword_Ch4: ; 0x1783d0
	togglenoise $03
	notetype $0c
	note $41
	note $31
	note $31
	note $30
	note $30
	callchannel _Music_BuenasPassword_sub_0x17840c
	callchannel _Music_BuenasPassword_sub_0x17840c
	callchannel _Music_BuenasPassword_sub_0x17840c
	callchannel _Music_BuenasPassword_sub_0x178424
	loopchannel $04, $43d9
	callchannel _Music_BuenasPassword_sub_0x17840c
	callchannel _Music_BuenasPassword_sub_0x17840c
	callchannel _Music_BuenasPassword_sub_0x17840c
	stereopanning $ff
	note $41
	stereopanning $f0
	note $81
	stereopanning $ff
	note $31
	stereopanning $0f
	note $80
	note $80
	stereopanning $f0
	note $81
	stereopanning $ff
	note $31
	note $31
	note $30
	note $30
	loopchannel $00, $43d9 ; end
; 0x17840c

_Music_BuenasPassword_sub_0x17840c: ; 0x17840c
; subroutine
	stereopanning $ff
	note $41
	stereopanning $f0
	note $81
	stereopanning $ff
	note $31
	stereopanning $0f
	note $80
	note $80
	stereopanning $f0
	note $81
	stereopanning $ff
	note $41
	note $31
	stereopanning $0f
	note $81
	endchannel ; end
; 0x178424

_Music_BuenasPassword_sub_0x178424: ; 0x178424
; subroutine
	stereopanning $ff
	note $41
	stereopanning $f0
	note $81
	stereopanning $ff
	note $31
	stereopanning $0f
	note $80
	note $80
	stereopanning $f0
	note $81
	stereopanning $ff
	note $41
	note $31
	note $30
	note $30
	endchannel ; end
; 0x17843b
