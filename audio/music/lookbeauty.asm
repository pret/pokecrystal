_Music_LookBeauty: ; 0xeee3e
	db $c0
	dw _Music_LookBeauty_Ch1
	db $01
	dw _Music_LookBeauty_Ch2
	db $02
	dw _Music_LookBeauty_Ch3
	db $03
	dw _Music_LookBeauty_Ch4
; 0xeee4a

_Music_LookBeauty_Ch1: ; 0xeee4a
	stereopanning $0f
	vibrato $12, $25
	dutycycle $02
	tempo $8000
	volume $77
	notetype $0c, $a3
	note $0f
	note $07
	octave4
	note $17
	dutycycle $03
	note $03
	octave3
	note $30
	note $04
	note $30
	note $04
	note $01
	note $30
	note $02
	note $30
	note $04
	note $33
	note $03
	note $30
	note $04
	note $30
	note $04
	note $01
	note $30
	note $02
	note $30
	note $02
	note $31
	note $01
	note $31
	note $03
	note $50
	note $04
	note $50
	note $04
	note $01
	note $50
	note $02
	note $50
	note $00
	note $50
	note $02
	note $53
	note $03
	note $70
	note $04
	note $70
	note $02
	note $31
	note $30
	note $06
	octave2
	note $a0
	octave3
	note $10
	note $40
	note $70
	note $40
	note $70
	note $a0
	octave4
	note $10
	loopchannel $00, $6e5f ; end
; 0xeee9c

_Music_LookBeauty_Ch2: ; 0xeee9c
	stereopanning $f0
	vibrato $10, $23
	dutycycle $02
	notetype $0c, $c7
	octave3
	note $30
	note $00
	octave5
	note $35
	note $10
	note $00
	octave4
	note $c0
	note $00
	note $b0
	note $00
	note $a0
	note $00
	note $90
	note $00
	note $80
	note $00
	note $70
	note $00
	note $60
	note $00
	note $51
	note $30
	note $00
	note $50
	note $00
	note $70
	note $00
	dutycycle $03
	notetype $0c, $c7
	note $8f
	note $a7
	note $c7
	note $a9
	note $90
	note $00
	note $a0
	note $00
	note $91
	note $97
	note $01
	note $61
	note $01
	note $51
	intensity $b7
	vibrato $10, $24
	octave5
	note $1e
	notetype $06, $c7
	intensity $c5
	vibrato $10, $23
	note $00
	note $20
	note $3f
	note $1f
	octave4
	note $cf
	note $03
	octave5
	note $31
	note $01
	octave4
	note $c1
	note $01
	note $a5
	note $0d
	note $77
	note $a7
	loopchannel $00, $6ec5 ; end
; 0xeeefa

_Music_LookBeauty_Ch3: ; 0xeeefa
	stereopanning $ff
	vibrato $08, $12
	notetype $0c, $15
	note $0f
	octave5
	note $50
	note $00
	note $40
	note $00
	note $30
	note $00
	note $20
	note $00
	octave3
	note $36
	note $70
	note $83
	octave4
	note $c0
	note $00
	octave3
	note $80
	note $00
	note $30
	note $00
	octave4
	note $c0
	note $00
	octave3
	note $30
	note $00
	note $81
	note $80
	octave4
	note $b0
	note $c0
	note $00
	octave3
	note $80
	note $00
	octave4
	note $c0
	note $00
	octave3
	note $30
	note $02
	octave4
	note $c3
	octave3
	note $53
	octave4
	note $c0
	note $00
	octave3
	note $50
	note $00
	octave2
	note $c0
	note $00
	octave4
	note $a0
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $51
	note $50
	octave4
	note $80
	note $90
	note $00
	octave3
	note $50
	note $00
	octave4
	note $70
	note $02
	note $91
	note $01
	note $c1
	octave3
	note $a3
	octave5
	note $10
	note $00
	octave3
	note $a0
	note $00
	note $50
	note $00
	octave5
	note $10
	note $00
	octave3
	note $50
	note $00
	note $a1
	note $a0
	octave4
	note $c0
	octave5
	note $10
	note $00
	octave3
	note $a0
	note $00
	octave5
	note $10
	note $00
	note $30
	note $02
	note $13
	octave3
	note $33
	octave4
	note $c0
	note $00
	octave3
	note $30
	note $00
	octave2
	note $a0
	note $00
	octave4
	note $a0
	note $00
	octave2
	note $a0
	note $00
	octave4
	note $a1
	note $a0
	note $06
	octave3
	note $37
	loopchannel $00, $6f0f ; end
; 0xeef8b

_Music_LookBeauty_Ch4: ; 0xeef8b
	togglenoise $03
	notetype $0c
	note $0f
	note $0f
	callchannel _Music_LookBeauty_sub_0xeefa1
	callchannel _Music_LookBeauty_sub_0xeefa1
	callchannel _Music_LookBeauty_sub_0xeefa1
	callchannel _Music_LookBeauty_sub_0xeefa1
	loopchannel $00, $6f91 ; end
; 0xeefa1

_Music_LookBeauty_sub_0xeefa1: ; 0xeefa1
; subroutine
	note $71
	note $81
	note $31
	note $81
	note $81
	note $31
	note $81
	note $81
	note $71
	note $31
	note $81
	note $31
	note $81
	note $81
	note $31
	note $81
	endchannel ; end
; 0xeefb2
