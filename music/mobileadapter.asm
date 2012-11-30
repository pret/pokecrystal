_Music_MobileAdapter: ; 0x1fc87
	db $c0
	dw _Music_MobileAdapter_Ch1
	db $01
	dw _Music_MobileAdapter_Ch2
	db $02
	dw _Music_MobileAdapter_Ch3
	db $03
	dw _Music_MobileAdapter_Ch4
; 0x1fc93

_Music_MobileAdapter_Ch1: ; 0x1fc93
	tempo $8400
	volume $77
	tone $0100
	stereopanning $0f
	dutycycle $02
	notetype $0c, $84
	note $01
	note $05
	octave3
	note $80
	octave4
	note $30
	note $50
	note $00
	note $30
	note $00
	note $23
	callchannel _Music_MobileAdapter_sub_0x1fd39
	note $30
	note $20
	note $31
	octave3
	note $a0
	note $80
	note $a1
	note $70
	note $50
	note $71
	note $30
	note $20
	note $31
	callchannel _Music_MobileAdapter_sub_0x1fd39
	note $30
	note $20
	octave3
	note $c0
	octave4
	note $30
	note $70
	note $50
	note $30
	note $20
	intensity $94
	note $31
	octave3
	note $a1
	octave4
	note $33
	octave5
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	octave4
	note $27
	intensity $92
	note $70
	note $80
	note $a1
	note $91
	note $a1
	intensity $94
	note $52
	octave3
	note $a2
	note $53
	octave4
	note $80
	note $00
	note $80
	note $00
	note $80
	note $00
	octave3
	note $c7
	intensity $92
	octave4
	note $c0
	octave5
	note $10
	note $21
	octave4
	note $c1
	note $a1
	octave5
	note $22
	intensity $94
	octave4
	note $22
	octave3
	note $a3
	octave4
	note $70
	note $00
	note $70
	note $00
	note $70
	note $00
	octave3
	note $79
	octave4
	note $30
	note $00
	note $30
	note $00
	note $30
	note $00
	octave3
	note $39
	octave4
	note $a7
	intensity $a1
	octave3
	note $20
	note $30
	note $50
	note $70
	note $80
	note $a0
	note $c0
	octave4
	note $20
	note $30
	note $20
	note $31
	octave3
	note $a0
	note $80
	note $a1
	intensity $94
	note $71
	octave2
	note $a1
	octave3
	note $33
	intensity $77
	callchannel _Music_MobileAdapter_sub_0x1ff09
	loopchannel $00, $7cad ; end
; 0x1fd39

_Music_MobileAdapter_sub_0x1fd39: ; 0x1fd39
; subroutine
	intensity $94
	octave4
	note $70
	note $00
	note $70
	note $00
	note $71
	octave3
	note $79
	octave4
	note $80
	note $00
	note $80
	note $00
	note $81
	octave3
	note $87
	intensity $a1
	note $c0
	octave4
	note $30
	note $50
	note $30
	note $20
	note $50
	note $30
	note $20
	octave3
	note $c0
	note $a0
	note $50
	note $70
	note $80
	note $70
	note $50
	note $a0
	note $c0
	octave4
	note $20
	endchannel ; end
; 0x1fd63

_Music_MobileAdapter_Ch2: ; 0x1fd63
	notetype $0c, $c1
	vibrato $10, $23
	dutycycle $02
	octave3
	note $80
	note $c0
	octave4
	note $30
	note $20
	note $31
	octave3
	note $c0
	note $b0
	note $c1
	octave4
	note $21
	octave3
	note $c1
	note $a1
	intensity $b4
	octave4
	note $30
	note $70
	callchannel _Music_MobileAdapter_sub_0x1fdfe
	note $a3
	note $83
	note $a3
	note $53
	note $7b
	note $01
	note $30
	note $70
	callchannel _Music_MobileAdapter_sub_0x1fdfe
	octave5
	note $23
	octave4
	note $a3
	octave5
	note $73
	note $53
	note $3b
	note $01
	note $20
	note $30
	note $50
	note $00
	note $50
	note $00
	note $50
	note $00
	note $83
	note $71
	note $51
	note $31
	note $28
	intensity $a2
	octave3
	note $52
	note $21
	intensity $b4
	octave5
	note $30
	note $20
	octave4
	note $c0
	note $00
	note $c0
	note $00
	note $c0
	note $00
	octave5
	note $23
	note $31
	note $51
	note $71
	note $58
	intensity $a2
	octave3
	note $a2
	note $51
	intensity $b4
	octave5
	note $70
	note $80
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $83
	note $71
	note $51
	note $30
	note $20
	octave4
	note $c0
	note $00
	note $c0
	note $00
	note $c0
	note $00
	octave5
	note $83
	note $71
	note $31
	octave4
	note $b0
	note $c0
	octave5
	note $2b
	note $53
	note $3f
	dutycycle $01
	intensity $71
	callchannel _Music_MobileAdapter_sub_0x1fe16
	octave4
	note $50
	note $a0
	octave5
	note $20
	note $50
	callchannel _Music_MobileAdapter_sub_0x1fe16
	note $01
	dutycycle $02
	intensity $b4
	octave4
	note $30
	note $70
	loopchannel $00, $7d80 ; end
; 0x1fdfe

_Music_MobileAdapter_sub_0x1fdfe: ; 0x1fdfe
; subroutine
	note $a0
	note $00
	note $a0
	note $00
	note $a1
	octave5
	note $33
	note $21
	octave4
	note $c1
	note $80
	note $a0
	note $c0
	note $00
	note $c0
	note $00
	note $c1
	octave5
	note $53
	note $31
	note $21
	octave4
	note $c1
	endchannel ; end
; 0x1fe16

_Music_MobileAdapter_sub_0x1fe16: ; 0x1fe16
; subroutine
	octave5
	note $70
	note $30
	octave4
	note $a0
	note $70
	octave5
	note $70
	note $30
	octave4
	note $a0
	note $70
	octave5
	note $70
	note $30
	octave4
	note $b0
	note $70
	octave5
	note $70
	note $30
	octave4
	note $b0
	note $70
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $80
	note $30
	octave4
	note $c0
	note $80
	octave5
	note $23
	endchannel ; end
; 0x1fe3d

_Music_MobileAdapter_Ch3: ; 0x1fe3d
	notetype $0c, $14
	note $01
	octave3
	note $80
	note $00
	note $c0
	note $00
	note $80
	note $00
	note $c0
	note $80
	note $a0
	note $00
	note $50
	note $00
	note $a3
	callchannel _Music_MobileAdapter_sub_0x1fecf
	callchannel _Music_MobileAdapter_sub_0x1fee3
	callchannel _Music_MobileAdapter_sub_0x1feee
	note $30
	note $00
	octave2
	note $a0
	note $00
	note $c0
	note $00
	octave3
	note $20
	note $00
	callchannel _Music_MobileAdapter_sub_0x1fecf
	callchannel _Music_MobileAdapter_sub_0x1fee3
	callchannel _Music_MobileAdapter_sub_0x1feee
	note $31
	octave2
	note $a1
	octave3
	note $33
	callchannel _Music_MobileAdapter_sub_0x1fee3
	callchannel _Music_MobileAdapter_sub_0x1fef7
	note $c0
	note $00
	octave3
	note $80
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $30
	note $00
	octave2
	note $80
	note $00
	octave3
	note $30
	note $00
	octave2
	note $80
	note $00
	note $c0
	note $00
	callchannel _Music_MobileAdapter_sub_0x1fef7
	octave3
	note $30
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $20
	note $00
	note $a0
	note $00
	note $20
	note $00
	note $a0
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $80
	note $00
	octave2
	note $c0
	note $00
	octave3
	note $80
	note $00
	octave2
	note $b0
	note $00
	octave3
	note $80
	note $00
	octave2
	note $b0
	note $00
	octave3
	note $80
	note $00
	callchannel _Music_MobileAdapter_sub_0x1fee3
	note $30
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	note $71
	octave2
	note $a1
	octave3
	note $33
	callchannel _Music_MobileAdapter_sub_0x1ff09
	loopchannel $00, $7e4f ; end
; 0x1fecf

_Music_MobileAdapter_sub_0x1fecf: ; 0x1fecf
; subroutine
	octave3
	note $30
	note $00
	note $a0
	note $00
	loopchannel $04, $7ecf
	octave2
	note $80
	note $00
	octave3
	note $30
	note $00
	loopchannel $04, $7ed8
	endchannel ; end
; 0x1fee3

_Music_MobileAdapter_sub_0x1fee3: ; 0x1fee3
; subroutine
	octave2
	note $a0
	note $00
	octave3
	note $50
	note $00
	loopchannel $04, $7ee3
	endchannel ; end
; 0x1feee

_Music_MobileAdapter_sub_0x1feee: ; 0x1feee
; subroutine
	note $30
	note $00
	note $a0
	note $00
	note $30
	note $00
	note $a0
	note $00
	endchannel ; end
; 0x1fef7

_Music_MobileAdapter_sub_0x1fef7: ; 0x1fef7
; subroutine
	octave2
	note $a0
	note $00
	octave3
	note $20
	note $00
	note $50
	note $00
	note $20
	note $00
	octave2
	note $a0
	octave3
	note $51
	note $00
	octave2
	note $a3
	endchannel ; end
; 0x1ff09

_Music_MobileAdapter_sub_0x1ff09: ; 0x1ff09
; subroutine
	octave2
	note $a0
	note $00
	octave3
	note $31
	octave2
	note $a0
	octave3
	note $32
	octave2
	note $b0
	note $00
	octave3
	note $31
	octave2
	note $b0
	octave3
	note $32
	octave2
	note $c0
	note $00
	octave3
	note $31
	octave2
	note $c0
	octave3
	note $32
	octave2
	note $a1
	note $05
	loopchannel $02, $7f09
	endchannel ; end
; 0x1ff2c

_Music_MobileAdapter_Ch4: ; 0x1ff2c
	togglenoise $03
	stereopanning $f0
	notetype $0c
	note $01
	note $09
	note $31
	note $31
	note $30
	note $30
	callchannel _Music_MobileAdapter_sub_0x1ff60
	callchannel _Music_MobileAdapter_sub_0x1ff60
	note $03
	note $37
	note $37
	note $33
	note $30
	note $32
	note $33
	loopchannel $02, $7f3e
	note $03
	note $33
	loopchannel $0b, $7f49
	note $01
	note $31
	note $31
	note $30
	note $30
	note $03
	note $37
	note $37
	note $35
	note $31
	note $31
	note $30
	note $30
	loopchannel $00, $7f38 ; end
; 0x1ff60

_Music_MobileAdapter_sub_0x1ff60: ; 0x1ff60
; subroutine
	note $03
	note $33
	loopchannel $07, $7f60
	note $01
	note $31
	note $31
	note $30
	note $30
	endchannel ; end
; 0x1ff6c
