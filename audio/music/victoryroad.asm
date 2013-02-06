_Music_VictoryRoad: ; 0xf6c72
	db $c0
	dw _Music_VictoryRoad_Ch1
	db $01
	dw _Music_VictoryRoad_Ch2
	db $02
	dw _Music_VictoryRoad_Ch3
	db $03
	dw _Music_VictoryRoad_Ch4
; 0xf6c7e

_Music_VictoryRoad_Ch1: ; 0xf6c7e
	tempo $9000
	volume $77
	stereopanning $0f
	dutycycle $03
	tone $0200
	notetype $0c, $b3
	callchannel _Music_VictoryRoad_sub_0xf6cb9
	loopchannel $06, $6c8d
	intensity $b2
	octave2
	note $a0
	octave3
	note $20
	note $30
	note $00
	octave2
	note $a0
	intensity $b7
	octave3
	note $22
	octave2
	note $a0
	octave3
	note $32
	octave2
	note $a0
	octave3
	note $92
	loopchannel $02, $6c94
	callchannel _Music_VictoryRoad_sub_0xf6cb9
	loopchannel $02, $6cae
	loopchannel $00, $6c8d ; end
; 0xf6cb9

_Music_VictoryRoad_sub_0xf6cb9: ; 0xf6cb9
; subroutine
	intensity $b2
	octave2
	note $80
	note $c0
	octave3
	note $10
	note $00
	octave2
	note $80
	intensity $b7
	note $c2
	note $80
	octave3
	note $12
	octave2
	note $80
	octave3
	note $72
	endchannel ; end
; 0xf6cce

_Music_VictoryRoad_Ch2: ; 0xf6cce
	dutycycle $03
	vibrato $10, $24
	notetype $0c, $c2
	callchannel _Music_VictoryRoad_sub_0xf6d1e
	note $01
	callchannel _Music_VictoryRoad_sub_0xf6d1e
	note $00
	octave4
	note $10
	notetype $0c, $b0
	note $57
	octave5
	note $13
	octave4
	note $c3
	note $5e
	note $40
	notetype $0c, $b0
	note $57
	octave5
	note $13
	octave4
	note $c3
	notetype $0c, $b0
	octave5
	note $57
	notetype $0c, $b7
	note $57
	notetype $0c, $c7
	note $37
	stereopanning $f0
	note $23
	stereopanning $0f
	octave4
	note $a3
	stereopanning $ff
	octave5
	note $17
	stereopanning $0f
	octave4
	note $b3
	stereopanning $f0
	note $63
	stereopanning $ff
	note $ab
	note $30
	note $70
	note $a0
	octave5
	note $20
	note $3f
	loopchannel $00, $6cd3 ; end
; 0xf6d1e

_Music_VictoryRoad_sub_0xf6d1e: ; 0xf6d1e
; subroutine
	octave3
	note $50
	note $00
	note $50
	note $00
	note $70
	note $70
	note $01
	note $90
	note $90
	note $01
	note $a0
	note $a0
	endchannel ; end
; 0xf6d2c

_Music_VictoryRoad_Ch3: ; 0xf6d2c
	stereopanning $f0
	notetype $0c, $28
	callchannel _Music_VictoryRoad_sub_0xf6d52
	loopchannel $06, $6d31
	note $30
	note $00
	note $c0
	note $00
	note $60
	note $a2
	note $30
	note $c0
	note $01
	note $30
	note $c2
	loopchannel $02, $6d38
	callchannel _Music_VictoryRoad_sub_0xf6d52
	loopchannel $02, $6d47
	loopchannel $00, $6d31 ; end
; 0xf6d52

_Music_VictoryRoad_sub_0xf6d52: ; 0xf6d52
; subroutine
	octave3
	note $10
	note $00
	note $a0
	note $00
	note $40
	note $82
	note $10
	note $a0
	note $01
	note $10
	note $a2
	endchannel ; end
; 0xf6d5f

_Music_VictoryRoad_Ch4: ; 0xf6d5f
	togglenoise $00
	notetype $0c
	note $31
	note $31
	note $40
	note $32
	note $40
	note $32
	note $40
	note $32
	note $31
	note $31
	note $40
	note $32
	note $40
	note $40
	note $31
	note $40
	note $31
	note $40
	loopchannel $00, $6d63 ; end
; 0xf6d79
