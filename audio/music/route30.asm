_Music_Route30: ; 0xefc01
	db $c0
	dw _Music_Route30_Ch1
	db $01
	dw _Music_Route30_Ch2
	db $02
	dw _Music_Route30_Ch3
	db $03
	dw _Music_Route30_Ch4
; 0xefc0d

_Music_Route30_Ch1: ; 0xefc0d
	tempo $9000
	volume $77
	dutycycle $03
	tone $0100
	vibrato $10, $15
	stereopanning $f0
	notetype $0c, $b2
	octave3
	note $35
	note $30
	note $30
	note $31
	note $31
	note $33
	note $35
	note $30
	note $30
	note $31
	note $31
	intensity $4e
	note $13
	intensity $b6
	note $35
	intensity $b4
	octave2
	note $c1
	octave3
	note $61
	note $51
	note $31
	note $51
	intensity $b6
	note $65
	intensity $b4
	note $11
	note $a1
	note $81
	note $61
	note $11
	note $31
	note $81
	note $a1
	note $81
	note $61
	note $51
	note $31
	note $51
	note $c0
	octave4
	note $10
	octave3
	note $c0
	octave4
	note $10
	intensity $b7
	octave3
	note $cb
	intensity $b5
	note $65
	note $11
	note $a1
	note $81
	note $61
	note $11
	octave4
	note $31
	note $11
	octave3
	note $c1
	note $a1
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $81
	note $30
	note $50
	note $30
	note $50
	intensity $b6
	note $33
	note $83
	note $33
	intensity $b3
	octave2
	note $c0
	octave3
	note $10
	octave2
	note $c0
	octave3
	note $10
	intensity $b6
	octave2
	note $c3
	octave3
	note $33
	octave2
	note $c3
	intensity $b4
	octave3
	note $61
	note $51
	note $31
	note $11
	note $a1
	note $81
	note $61
	note $51
	intensity $b6
	note $a3
	note $c3
	octave4
	note $13
	note $53
	note $31
	octave3
	note $83
	note $a3
	note $c3
	octave4
	note $11
	octave3
	note $81
	intensity $b7
	note $3d
	intensity $b6
	note $61
	note $51
	note $31
	note $11
	note $a1
	note $81
	note $61
	note $81
	octave4
	note $11
	octave3
	note $c1
	note $a1
	note $c1
	octave4
	note $11
	note $51
	note $61
	note $a1
	octave3
	note $81
	octave4
	note $11
	note $31
	octave3
	note $81
	octave4
	note $11
	note $31
	octave3
	note $81
	octave4
	note $31
	intensity $b5
	octave3
	note $c1
	octave4
	note $31
	octave3
	note $c1
	octave4
	note $33
	octave3
	note $81
	note $c1
	octave4
	note $31
	loopchannel $00, $7c2e ; end
; 0xefcda

_Music_Route30_Ch2: ; 0xefcda
	dutycycle $03
	vibrato $12, $36
	stereopanning $0f
	notetype $0c, $c2
	octave3
	note $85
	note $80
	note $80
	note $81
	note $81
	note $83
	note $85
	note $80
	note $80
	note $81
	note $81
	intensity $c4
	note $30
	note $50
	note $60
	note $70
	intensity $c7
	note $89
	octave4
	note $31
	octave3
	note $c1
	note $81
	octave4
	note $69
	note $51
	note $31
	note $11
	note $30
	note $50
	note $30
	note $50
	intensity $b0
	note $33
	intensity $b7
	note $37
	intensity $3f
	note $37
	intensity $b7
	note $37
	intensity $c7
	note $19
	note $11
	octave3
	note $a1
	note $61
	octave4
	note $69
	note $51
	note $31
	note $11
	octave3
	note $c5
	note $81
	octave4
	note $37
	octave3
	note $85
	note $31
	note $c7
	note $11
	note $a3
	note $c3
	octave4
	note $13
	note $31
	note $67
	note $a7
	note $81
	intensity $b0
	note $33
	intensity $b7
	note $39
	intensity $c7
	note $13
	octave3
	note $c3
	note $a3
	note $83
	note $a3
	note $c3
	octave4
	note $13
	note $33
	note $67
	octave5
	note $17
	octave4
	note $c1
	intensity $b0
	note $85
	intensity $b7
	note $87
	intensity $c7
	note $c1
	intensity $b0
	note $83
	intensity $b7
	note $87
	intensity $a7
	octave3
	note $71
	loopchannel $00, $7cf6 ; end
; 0xefd5f

_Music_Route30_Ch3: ; 0xefd5f
	notetype $0c, $27
	octave2
	note $80
	note $04
	note $80
	note $80
	note $80
	note $00
	note $80
	note $00
	note $80
	note $02
	note $80
	note $04
	note $80
	note $80
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $c1
	note $01
	note $80
	note $80
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $60
	note $00
	octave3
	note $31
	note $a1
	octave2
	note $60
	note $60
	note $60
	note $00
	octave3
	note $11
	octave2
	note $60
	note $00
	note $70
	note $00
	note $80
	note $00
	note $c1
	octave3
	note $31
	octave2
	note $80
	note $80
	note $80
	note $00
	octave3
	note $31
	octave2
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	octave3
	note $51
	note $31
	octave2
	note $80
	note $80
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $60
	note $00
	octave3
	note $11
	octave2
	note $a1
	note $60
	note $60
	note $60
	note $00
	octave3
	note $11
	octave2
	note $60
	note $00
	note $60
	note $00
	note $60
	note $00
	octave3
	note $11
	note $61
	octave2
	note $60
	note $60
	note $60
	note $00
	octave3
	note $51
	octave2
	note $61
	note $71
	note $80
	note $00
	note $c1
	octave3
	note $81
	octave2
	note $80
	note $80
	note $80
	note $00
	note $c1
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	octave4
	note $31
	octave3
	note $c1
	octave2
	note $80
	note $80
	note $80
	note $00
	octave3
	note $81
	octave2
	note $81
	note $91
	note $a0
	note $00
	octave3
	note $11
	octave2
	note $c1
	note $a0
	note $a0
	note $a0
	note $00
	octave3
	note $31
	octave2
	note $a0
	note $00
	note $c0
	note $00
	octave3
	note $10
	note $00
	note $61
	note $51
	note $10
	note $10
	note $10
	note $00
	note $a1
	note $10
	note $00
	note $10
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $51
	note $31
	octave2
	note $c0
	note $c0
	note $c0
	note $00
	note $c0
	note $00
	note $c0
	note $00
	note $c0
	note $00
	note $80
	note $00
	note $c1
	note $a1
	note $80
	note $80
	note $80
	note $00
	note $c1
	note $80
	note $00
	note $80
	note $00
	note $a0
	note $00
	octave3
	note $11
	octave2
	note $c1
	note $a0
	note $a0
	note $a0
	note $00
	octave3
	note $31
	octave2
	note $a0
	note $00
	note $c0
	note $00
	octave3
	note $10
	note $00
	note $61
	note $51
	note $10
	note $10
	note $10
	note $00
	note $a1
	note $10
	note $00
	note $10
	note $00
	octave2
	note $80
	note $00
	octave3
	note $11
	note $31
	octave2
	note $80
	note $80
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	octave3
	note $51
	note $31
	octave2
	note $80
	note $80
	note $80
	note $00
	octave3
	note $31
	octave2
	note $80
	note $00
	note $80
	note $00
	loopchannel $00, $7d79 ; end
; 0xefe7a

_Music_Route30_Ch4: ; 0xefe7a
	togglenoise $03
	notetype $0c
	callchannel _Music_Route30_sub_0xefeb8
	callchannel _Music_Route30_sub_0xefec1
	callchannel _Music_Route30_sub_0xefecd
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefee1
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefecd
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefee1
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefecd
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefed7
	callchannel _Music_Route30_sub_0xefecd
	callchannel _Music_Route30_sub_0xefee1
	loopchannel $00, $7e84 ; end
; 0xefeb8

_Music_Route30_sub_0xefeb8: ; 0xefeb8
; subroutine
	note $31
	note $71
	note $71
	note $30
	note $30
	note $31
	note $31
	note $33
	endchannel ; end
; 0xefec1

_Music_Route30_sub_0xefec1: ; 0xefec1
; subroutine
	note $31
	note $71
	note $71
	note $30
	note $30
	note $31
	note $31
	note $30
	note $30
	note $30
	note $30
	endchannel ; end
; 0xefecd

_Music_Route30_sub_0xefecd: ; 0xefecd
; subroutine
	note $31
	note $71
	note $71
	note $30
	note $30
	note $31
	note $31
	note $31
	note $31
	endchannel ; end
; 0xefed7

_Music_Route30_sub_0xefed7: ; 0xefed7
; subroutine
	note $31
	note $71
	note $71
	note $30
	note $30
	note $31
	note $71
	note $31
	note $31
	endchannel ; end
; 0xefee1

_Music_Route30_sub_0xefee1: ; 0xefee1
; subroutine
	note $31
	note $71
	note $71
	note $30
	note $30
	note $31
	note $31
	notetype $06
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	note $30
	notetype $0c
	endchannel ; end
; 0xefef5
