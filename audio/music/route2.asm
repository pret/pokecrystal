_Music_Route2: ; 0xed8dd
	db $c0
	dw _Music_Route2_Ch1
	db $01
	dw _Music_Route2_Ch2
	db $02
	dw _Music_Route2_Ch3
	db $03
	dw _Music_Route2_Ch4
; 0xed8e9

_Music_Route2_Ch1: ; 0xed8e9
	tempo $9700
	volume $77
	stereopanning $0f
	vibrato $06, $23
	notetype $0c, $b1
	note $0f
	note $0f
	callchannel _Music_Route2_sub_0xed931
	intensity $b1
	octave3
	note $c3
	note $c3
	note $c3
	note $c3
	octave4
	note $53
	note $53
	note $53
	note $53
	callchannel _Music_Route2_sub_0xed931
	callchannel _Music_Route2_sub_0xed940
	callchannel _Music_Route2_sub_0xed940
	callchannel _Music_Route2_sub_0xed971
	octave3
	note $81
	octave4
	note $11
	octave3
	note $81
	octave4
	note $11
	note $61
	note $31
	octave3
	note $c1
	note $81
	callchannel _Music_Route2_sub_0xed971
	note $81
	octave4
	note $11
	note $31
	note $81
	note $61
	note $31
	octave3
	note $c1
	note $81
	loopchannel $00, $58fb ; end
; 0xed931

_Music_Route2_sub_0xed931: ; 0xed931
; subroutine
	octave4
	note $13
	note $13
	note $13
	note $13
	note $13
	note $13
	intensity $b7
	note $13
	octave3
	note $c3
	intensity $b1
	endchannel ; end
; 0xed940

_Music_Route2_sub_0xed940: ; 0xed940
; subroutine
	octave2
	note $c1
	octave3
	note $51
	octave2
	note $c1
	octave3
	note $51
	octave2
	note $c1
	octave3
	note $51
	octave2
	note $c1
	octave3
	note $51
	note $51
	note $b1
	note $51
	note $b1
	note $51
	note $b1
	note $51
	note $b1
	note $11
	note $a1
	note $11
	note $a1
	note $11
	note $a1
	note $11
	note $a1
	note $11
	note $91
	note $11
	note $91
	intensity $b7
	octave2
	note $c1
	octave3
	note $91
	octave2
	note $c1
	octave3
	note $81
	intensity $b1
	endchannel ; end
; 0xed971

_Music_Route2_sub_0xed971: ; 0xed971
; subroutine
	note $c1
	note $81
	note $c1
	note $81
	note $c1
	note $91
	note $c1
	note $91
	octave4
	note $51
	note $11
	note $51
	note $11
	note $31
	octave3
	note $c1
	octave4
	note $31
	octave3
	note $c1
	octave4
	note $11
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $a1
	octave4
	note $11
	octave3
	note $a1
	endchannel ; end
; 0xed996

_Music_Route2_Ch2: ; 0xed996
	stereopanning $ff
	vibrato $08, $24
	notetype $0c, $b2
	callchannel _Music_Route2_sub_0xed9ba
	intensity $b2
	callchannel _Music_Route2_sub_0xed9ba
	dutycycle $02
	intensity $b5
	callchannel _Music_Route2_sub_0xed9dc
	callchannel _Music_Route2_sub_0xed9dc
	callchannel _Music_Route2_sub_0xeda02
	callchannel _Music_Route2_sub_0xeda02
	loopchannel $00, $59a1 ; end
; 0xed9ba

_Music_Route2_sub_0xed9ba: ; 0xed9ba
; subroutine
	octave4
	note $53
	note $53
	note $51
	octave2
	note $11
	octave4
	note $51
	octave2
	note $11
	octave4
	note $b3
	note $b3
	note $b1
	octave2
	note $81
	octave4
	note $b1
	octave2
	note $81
	octave4
	note $a3
	note $a3
	note $a3
	note $a3
	note $93
	note $93
	intensity $b7
	note $93
	note $83
	intensity $b2
	endchannel ; end
; 0xed9dc

_Music_Route2_sub_0xed9dc: ; 0xed9dc
; subroutine
	octave2
	note $13
	note $01
	note $10
	note $00
	note $10
	note $00
	note $11
	note $01
	note $10
	note $00
	note $83
	note $01
	note $80
	note $00
	note $80
	note $00
	note $81
	note $01
	note $80
	note $00
	note $63
	note $01
	note $60
	note $00
	note $60
	note $00
	note $61
	note $01
	note $60
	note $00
	note $63
	note $01
	note $60
	note $00
	note $63
	note $33
	endchannel ; end
; 0xeda02

_Music_Route2_sub_0xeda02: ; 0xeda02
; subroutine
	octave2
	note $53
	note $01
	note $50
	note $00
	note $50
	note $00
	note $51
	note $01
	note $50
	note $00
	note $a3
	note $01
	note $a0
	note $00
	note $90
	note $00
	note $91
	note $01
	note $90
	note $00
	note $63
	note $01
	note $60
	note $00
	note $70
	note $00
	note $71
	note $01
	note $70
	note $00
	note $83
	note $01
	note $80
	note $00
	note $80
	note $00
	note $81
	note $01
	note $80
	note $00
	endchannel ; end
; 0xeda2c

_Music_Route2_Ch3: ; 0xeda2c
	stereopanning $f0
	vibrato $16, $15
	notetype $0c, $14
	octave4
	note $c0
	note $02
	note $c0
	note $02
	note $c0
	note $02
	note $c0
	note $02
	octave5
	note $50
	note $02
	note $50
	note $02
	note $50
	note $02
	note $50
	note $02
	callchannel _Music_Route2_sub_0xeda9e
	octave3
	note $33
	notetype $0c, $15
	octave3
	note $13
	note $01
	note $10
	note $00
	note $10
	note $00
	note $11
	note $01
	note $10
	note $00
	note $83
	note $01
	note $80
	note $00
	note $80
	note $00
	note $81
	note $01
	note $80
	note $00
	callchannel _Music_Route2_sub_0xeda9e
	octave3
	note $31
	intensity $10
	octave6
	note $10
	note $30
	callchannel _Music_Route2_sub_0xedaaf
	note $03
	note $87
	note $61
	note $81
	notetype $0c, $10
	callchannel _Music_Route2_sub_0xedaaf
	note $0f
	intensity $25
	callchannel _Music_Route2_sub_0xedacb
	note $03
	note $40
	note $56
	note $33
	octave5
	note $c0
	octave6
	note $12
	octave5
	note $c3
	note $a3
	note $c7
	note $83
	octave6
	note $a3
	note $83
	callchannel _Music_Route2_sub_0xedacb
	note $03
	note $90
	note $a6
	note $c3
	note $70
	note $8f
	note $8e
	loopchannel $00, $5a4b ; end
; 0xeda9e

_Music_Route2_sub_0xeda9e: ; 0xeda9e
; subroutine
	octave3
	note $63
	note $01
	note $60
	note $00
	note $60
	note $00
	note $61
	note $01
	note $60
	note $00
	note $63
	note $01
	note $60
	note $00
	note $63
	endchannel ; end
; 0xedaaf

_Music_Route2_sub_0xedaaf: ; 0xedaaf
; subroutine
	octave6
	note $59
	note $31
	note $01
	note $11
	notetype $06, $10
	octave5
	note $70
	note $8e
	note $a3
	note $b3
	note $03
	octave6
	note $11
	note $31
	note $40
	note $5f
	note $56
	note $63
	note $53
	note $40
	note $52
	note $33
	note $13
	note $33
	endchannel ; end
; 0xedacb

_Music_Route2_sub_0xedacb: ; 0xedacb
; subroutine
	octave5
	note $cf
	note $03
	octave6
	note $20
	note $36
	note $53
	octave5
	note $c0
	octave6
	note $1f
	note $12
	note $33
	note $03
	note $53
	note $6f
	endchannel ; end
; 0xedadc

_Music_Route2_Ch4: ; 0xedadc
	togglenoise $05
	notetype $0c
	note $a3
	note $a3
	note $a1
	note $c1
	note $a1
	note $c1
	loopchannel $03, $5ae0
	note $a3
	note $a3
	note $a1
	note $a1
	note $43
	note $a3
	note $a3
	note $a1
	note $a1
	note $c1
	note $a1
	loopchannel $04, $5aef
	note $c3
	note $a1
	note $c1
	note $a1
	note $c1
	note $a1
	note $c1
	loopchannel $07, $5af9
	note $c3
	note $a3
	note $a1
	note $a1
	note $43
	note $c3
	note $13
	note $c1
	note $c1
	note $13
	loopchannel $03, $5b09
	note $c3
	note $13
	note $21
	note $11
	note $23
	note $c3
	note $13
	note $c1
	note $c1
	note $13
	loopchannel $03, $5b17
	note $c3
	note $13
	note $31
	note $31
	note $43
	loopchannel $00, $5aef ; end
; 0xedb29
