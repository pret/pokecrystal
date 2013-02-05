_Music_BattleTowerTheme: ; 0x178889
	db $c0
	dw _Music_BattleTowerTheme_Ch1
	db $01
	dw _Music_BattleTowerTheme_Ch2
	db $02
	dw _Music_BattleTowerTheme_Ch3
	db $03
	dw _Music_BattleTowerTheme_Ch4
; 0x178895

_Music_BattleTowerTheme_Ch1: ; 0x178895
	tempo $8d00
	volume $77
	tone $0100
	vibrato $12, $34
	stereopanning $0f
	notetype $06, $94
	note $0f
	note $0f
	note $0b
	note $0b
	dutycycle $02
	octave3
	note $11
	note $51
	note $83
	callchannel _Music_BattleTowerTheme_sub_0x17895e
	note $81
	note $01
	note $13
	note $03
	intensity $92
	note $81
	note $61
	note $11
	note $51
	note $81
	octave4
	note $51
	note $81
	note $51
	octave3
	note $81
	note $51
	callchannel _Music_BattleTowerTheme_sub_0x17895e
	note $81
	note $01
	octave2
	note $b3
	note $03
	intensity $92
	octave3
	note $81
	note $41
	note $11
	note $61
	note $a1
	octave4
	note $11
	note $61
	note $11
	octave3
	note $a1
	note $61
	intensity $93
	note $31
	note $01
	note $53
	note $63
	note $81
	note $a1
	note $b7
	octave2
	note $b7
	octave3
	note $11
	note $01
	note $33
	note $53
	note $61
	note $81
	note $a7
	octave2
	note $a7
	note $b1
	note $01
	octave3
	note $13
	note $33
	note $41
	note $61
	note $43
	note $63
	note $83
	note $b3
	octave4
	note $11
	note $01
	octave3
	note $63
	note $03
	octave2
	note $a1
	octave3
	note $11
	note $53
	note $03
	dutycycle $03
	note $11
	note $51
	note $83
	note $a3
	note $67
	note $61
	note $81
	note $a7
	note $83
	note $63
	note $37
	note $b1
	note $31
	note $51
	note $61
	note $81
	note $a1
	note $b1
	octave4
	note $11
	note $31
	note $11
	note $31
	note $41
	note $63
	octave3
	note $67
	note $21
	note $41
	note $67
	note $83
	note $63
	note $63
	note $17
	note $81
	note $61
	note $57
	octave4
	note $11
	octave3
	note $b1
	note $81
	note $51
	note $13
	note $67
	note $11
	note $61
	note $a7
	note $b3
	octave4
	note $13
	octave3
	note $b3
	note $67
	note $b3
	octave4
	note $37
	octave3
	note $b1
	note $a1
	note $63
	note $93
	note $67
	note $93
	note $63
	note $43
	note $23
	note $63
	intensity $94
	octave4
	note $13
	octave3
	note $55
	note $01
	note $50
	note $00
	note $50
	note $00
	note $53
	note $0b
	loopchannel $00, $48a5 ; end
; 0x17895e

_Music_BattleTowerTheme_sub_0x17895e: ; 0x17895e
; subroutine
	intensity $94
	note $a1
	note $01
	note $13
	note $03
	note $a0
	note $00
	note $a0
	note $00
	note $13
	note $63
	note $03
	note $a3
	endchannel ; end
; 0x17896d

_Music_BattleTowerTheme_Ch2: ; 0x17896d
	vibrato $12, $34
	dutycycle $03
	notetype $06, $b8
	octave3
	note $61
	note $01
	octave2
	note $a3
	note $03
	octave3
	note $60
	note $00
	note $60
	note $00
	octave2
	note $a3
	octave3
	note $63
	note $03
	octave2
	note $a1
	note $01
	octave3
	note $61
	note $01
	octave2
	note $a3
	note $03
	tone $0100
	note $a0
	note $00
	octave3
	note $10
	note $00
	note $63
	note $03
	tone $0000
	intensity $b7
	note $81
	octave4
	note $11
	note $53
	callchannel _Music_BattleTowerTheme_sub_0x178a15
	note $b3
	note $01
	note $61
	notetype $0c, $b7
	note $1b
	notetype $06, $b7
	callchannel _Music_BattleTowerTheme_sub_0x178a15
	notetype $0c, $b7
	note $b1
	note $00
	note $80
	note $ab
	note $b0
	note $00
	note $b3
	note $80
	note $a0
	note $b3
	note $33
	note $a0
	note $00
	note $a3
	note $80
	note $a0
	note $67
	note $80
	note $00
	note $83
	note $b0
	note $a0
	note $b3
	note $43
	note $60
	note $00
	note $63
	note $80
	note $60
	note $57
	stereopanning $f0
	dutycycle $02
	note $65
	note $a0
	note $b0
	octave5
	note $13
	octave4
	note $b1
	note $a1
	note $bf
	note $b5
	note $80
	note $a0
	note $b3
	octave5
	note $11
	octave4
	note $b1
	note $a5
	note $b0
	note $a0
	note $87
	note $a5
	note $60
	note $a0
	octave5
	note $13
	note $31
	note $41
	note $35
	note $11
	octave4
	note $b7
	octave5
	note $25
	note $11
	octave4
	note $b1
	note $91
	note $61
	note $91
	note $84
	note $00
	notetype $06, $b7
	note $80
	note $00
	note $80
	note $00
	note $83
	note $03
	stereopanning $ff
	dutycycle $03
	octave3
	note $11
	note $31
	note $53
	loopchannel $00, $4970 ; end
; 0x178a15

_Music_BattleTowerTheme_sub_0x178a15: ; 0x178a15
; subroutine
	note $61
	note $01
	note $67
	note $11
	note $61
	octave5
	note $17
	octave4
	note $b3
	note $a3
	endchannel ; end
; 0x178a20

_Music_BattleTowerTheme_Ch3: ; 0x178a20
	vibrato $12, $34
	notetype $06, $16
	stereopanning $ff
	callchannel _Music_BattleTowerTheme_sub_0x178afe
	note $11
	note $01
	note $63
	note $03
	octave2
	note $a0
	note $00
	octave3
	note $10
	note $00
	note $63
	note $03
	stereopanning $f0
	note $17
	callchannel _Music_BattleTowerTheme_sub_0x178afe
	note $11
	note $01
	note $63
	note $03
	note $10
	note $00
	note $10
	note $00
	note $53
	note $13
	note $03
	note $11
	note $01
	callchannel _Music_BattleTowerTheme_sub_0x178afe
	octave2
	note $b1
	note $01
	octave3
	note $43
	note $03
	octave2
	note $b0
	note $00
	note $b0
	note $00
	octave3
	note $13
	note $63
	note $03
	note $10
	note $00
	note $11
	octave2
	note $b1
	note $01
	note $b3
	note $63
	octave3
	note $60
	note $00
	note $61
	octave2
	note $b1
	note $01
	octave3
	note $31
	note $01
	note $67
	note $11
	note $01
	note $13
	octave2
	note $63
	octave3
	note $60
	note $00
	note $60
	note $00
	octave2
	note $a1
	note $01
	octave3
	note $11
	note $01
	note $67
	note $41
	note $01
	note $43
	octave2
	note $83
	octave3
	note $80
	note $00
	note $80
	note $00
	octave2
	note $81
	note $01
	note $b1
	note $01
	octave3
	note $47
	note $61
	note $01
	note $13
	note $03
	note $11
	octave2
	note $61
	note $83
	note $03
	stereopanning $ff
	note $81
	octave3
	note $11
	note $53
	note $63
	note $17
	note $60
	note $00
	note $60
	note $00
	note $a3
	note $15
	note $01
	note $10
	note $00
	note $10
	note $00
	note $63
	note $37
	note $60
	note $00
	note $60
	note $00
	note $b3
	note $a3
	note $63
	note $33
	note $63
	note $27
	note $60
	note $00
	note $60
	note $00
	note $b3
	note $67
	note $20
	note $00
	note $20
	note $00
	note $13
	note $67
	note $10
	note $00
	note $10
	note $00
	note $83
	note $13
	note $33
	note $53
	note $63
	note $17
	note $60
	note $00
	note $60
	note $00
	note $a3
	note $17
	note $61
	note $01
	note $63
	octave2
	note $b7
	octave3
	note $60
	note $00
	note $60
	note $00
	note $b3
	octave2
	note $b3
	octave3
	note $33
	note $53
	note $63
	octave2
	note $97
	octave3
	note $20
	note $00
	note $20
	note $00
	note $93
	octave2
	note $97
	octave3
	note $23
	note $13
	note $87
	note $10
	note $00
	note $10
	note $00
	note $83
	note $0b
	loopchannel $00, $4a26 ; end
; 0x178afe

_Music_BattleTowerTheme_sub_0x178afe: ; 0x178afe
; subroutine
	octave3
	note $11
	note $01
	note $63
	note $03
	note $10
	note $00
	note $10
	note $00
	note $63
	note $13
	note $03
	note $11
	note $01
	endchannel ; end
; 0x178b0d

_Music_BattleTowerTheme_Ch4: ; 0x178b0d
	togglenoise $03
	notetype $0c
	callchannel _Music_BattleTowerTheme_sub_0x178b58
	note $31
	note $33
	note $30
	note $30
	note $33
	note $30
	note $20
	note $30
	note $20
	callchannel _Music_BattleTowerTheme_sub_0x178b58
	callchannel _Music_BattleTowerTheme_sub_0x178b61
	loopchannel $02, $4b1d
	callchannel _Music_BattleTowerTheme_sub_0x178b6c
	callchannel _Music_BattleTowerTheme_sub_0x178b61
	callchannel _Music_BattleTowerTheme_sub_0x178b6c
	note $31
	note $33
	note $30
	note $30
	note $37
	callchannel _Music_BattleTowerTheme_sub_0x178b76
	note $31
	note $31
	note $31
	note $30
	note $30
	note $31
	note $31
	note $30
	note $20
	note $30
	note $20
	loopchannel $03, $4b35
	callchannel _Music_BattleTowerTheme_sub_0x178b76
	note $31
	note $31
	note $31
	note $30
	note $30
	note $33
	note $30
	note $20
	note $30
	note $20
	loopchannel $00, $4b11 ; end
; 0x178b58

_Music_BattleTowerTheme_sub_0x178b58: ; 0x178b58
; subroutine
	note $31
	note $33
	note $30
	note $30
	note $31
	note $33
	note $30
	note $30
	endchannel ; end
; 0x178b61

_Music_BattleTowerTheme_sub_0x178b61: ; 0x178b61
; subroutine
	note $31
	note $33
	note $30
	note $30
	note $31
	note $31
	note $30
	note $20
	note $30
	note $20
	endchannel ; end
; 0x178b6c

_Music_BattleTowerTheme_sub_0x178b6c: ; 0x178b6c
; subroutine
	note $31
	note $33
	note $30
	note $30
	note $31
	note $31
	note $31
	note $30
	note $30
	endchannel ; end
; 0x178b76

_Music_BattleTowerTheme_sub_0x178b76: ; 0x178b76
; subroutine
	note $31
	note $21
	note $31
	note $30
	note $20
	note $31
	note $21
	note $31
	note $30
	note $20
	endchannel ; end
; 0x178b81
