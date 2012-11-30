_Music_SproutTower: ; 0xf6974
	db $c0
	dw _Music_SproutTower_Ch1
	db $01
	dw _Music_SproutTower_Ch2
	db $02
	dw _Music_SproutTower_Ch3
	db $03
	dw _Music_SproutTower_Ch4
; 0xf6980

_Music_SproutTower_Ch1: ; 0xf6980
	tempo $b000
	volume $77
	dutycycle $03
	tone $0200
	vibrato $08, $45
	stereopanning $0f
	notetype $0c, $a3
	note $0f
	note $0f
	note $05
	octave3
	note $61
	note $73
	note $73
	note $63
	note $13
	note $23
	note $43
	note $43
	note $43
	note $73
	note $73
	note $61
	note $71
	note $91
	note $71
	note $63
	note $71
	note $49
	note $71
	note $61
	note $41
	note $21
	intensity $a5
	note $17
	intensity $a3
	note $21
	note $11
	octave2
	note $b1
	octave3
	note $21
	intensity $a7
	note $1f
	intensity $a3
	note $63
	note $63
	note $73
	note $73
	note $63
	note $63
	note $43
	note $43
	loopchannel $00, $6994 ; end
; 0xf69c8

_Music_SproutTower_Ch2: ; 0xf69c8
	dutycycle $03
	tone $0100
	vibrato $08, $48
	notetype $0c, $b2
	octave3
	note $63
	note $63
	note $73
	note $73
	note $63
	note $63
	note $43
	note $43
	intensity $b5
	octave4
	note $13
	octave3
	note $b3
	octave4
	note $23
	note $11
	octave3
	note $b1
	octave4
	note $11
	octave3
	note $b1
	note $73
	intensity $b7
	note $67
	intensity $b5
	note $73
	note $b3
	octave4
	note $11
	note $21
	note $11
	octave3
	note $b1
	octave4
	note $11
	note $21
	note $41
	note $21
	note $17
	intensity $b5
	note $21
	note $11
	octave3
	note $b1
	note $71
	intensity $b7
	note $b7
	intensity $b5
	octave4
	note $11
	octave3
	note $b1
	note $71
	note $41
	intensity $b7
	note $67
	intensity $b3
	note $63
	note $63
	note $73
	note $b1
	note $60
	note $b0
	intensity $b7
	octave4
	note $1f
	note $0f
	loopchannel $00, $69dc ; end
; 0xf6a25

_Music_SproutTower_Ch3: ; 0xf6a25
	vibrato $14, $e8
	notetype $0c, $14
	octave3
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $71
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $71
	stereopanning $f0
	note $03
	note $11
	note $61
	note $71
	note $41
	note $01
	note $71
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $61
	note $41
	note $01
	octave2
	note $b1
	octave3
	note $41
	note $71
	note $41
	note $01
	note $71
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $71
	note $67
	note $73
	note $b3
	note $47
	note $63
	note $73
	note $6f
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $61
	note $61
	note $01
	note $11
	note $61
	note $71
	note $41
	note $01
	note $61
	loopchannel $00, $6a3e ; end
; 0xf6a7a

_Music_SproutTower_Ch4: ; 0xf6a7a
	togglenoise $00
	notetype $0c
	note $03
	note $73
	stereopanning $f0
	note $43
	note $71
	stereopanning $0f
	note $41
	stereopanning $ff
	note $73
	note $73
	stereopanning $0f
	note $43
	note $71
	stereopanning $f0
	note $41
	stereopanning $ff
	note $73
	loopchannel $00, $6a7f ; end
; 0xf6a99
