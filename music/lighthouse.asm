_Music_Lighthouse: ; 0xee569
	db $c0
	dw _Music_Lighthouse_Ch1
	db $01
	dw _Music_Lighthouse_Ch2
	db $02
	dw _Music_Lighthouse_Ch3
	db $03
	dw _Music_Lighthouse_Ch4
; 0xee575

_Music_Lighthouse_Ch1: ; 0xee575
	tempo $9000
	volume $77
	dutycycle $03
	tone $0400
	vibrato $08, $45
	stereopanning $0f
	notetype $0c, $b3
	octave3
	note $27
	octave2
	note $71
	note $91
	note $a1
	note $c1
	octave3
	note $23
	octave2
	note $c3
	note $a3
	note $c3
	note $90
	note $06
	octave3
	note $13
	octave2
	note $90
	note $00
	note $90
	note $00
	note $90
	note $00
	note $11
	note $40
	note $00
	note $70
	note $00
	note $90
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	octave3
	note $27
	octave2
	note $21
	note $71
	note $91
	octave3
	note $11
	note $31
	note $21
	octave2
	note $a1
	note $91
	note $a1
	note $91
	note $71
	note $a1
	note $90
	note $06
	octave3
	note $1b
	octave2
	note $90
	note $00
	note $90
	note $00
	note $90
	note $02
	octave3
	note $10
	note $02
	octave2
	note $a3
	octave3
	note $a3
	note $93
	note $73
	note $53
	note $43
	note $23
	note $53
	note $71
	note $51
	note $4b
	octave2
	note $c1
	note $a1
	note $c1
	note $a1
	note $97
	note $a3
	octave3
	note $a3
	note $91
	note $71
	note $51
	note $71
	note $51
	note $41
	note $21
	octave2
	note $c1
	note $a1
	note $c1
	octave3
	note $21
	note $41
	note $51
	note $71
	note $9b
	octave2
	note $c1
	note $a1
	note $c1
	note $a1
	note $97
	loopchannel $00, $6584 ; end
; 0xee5fc

_Music_Lighthouse_Ch2: ; 0xee5fc
	dutycycle $03
	tone $0200
	vibrato $10, $45
	notetype $0c, $c5
	octave3
	note $9b
	note $71
	note $91
	note $a7
	octave4
	note $27
	note $10
	note $06
	octave3
	note $9f
	intensity $c5
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	note $20
	note $00
	note $9b
	note $71
	note $91
	note $a7
	octave4
	note $27
	note $10
	note $06
	note $4b
	octave3
	note $40
	note $00
	note $40
	note $00
	note $40
	note $02
	note $40
	note $02
	octave4
	note $5b
	note $41
	note $21
	octave3
	note $9b
	note $b3
	note $c1
	octave4
	note $21
	note $4b
	octave3
	note $41
	note $21
	note $41
	note $21
	note $17
	octave4
	note $5b
	note $41
	note $21
	octave3
	note $9b
	octave4
	note $13
	octave3
	note $c1
	octave4
	note $11
	note $4b
	octave3
	note $41
	note $21
	note $41
	note $21
	note $17
	loopchannel $00, $6604 ; end
; 0xee656

_Music_Lighthouse_Ch3: ; 0xee656
	notetype $0c, $19
	stereopanning $f0
	octave2
	note $91
	note $01
	note $41
	note $01
	note $71
	note $01
	note $81
	note $01
	note $91
	note $01
	note $41
	note $01
	note $71
	note $01
	note $a1
	note $01
	loopchannel $02, $6664
	note $91
	note $01
	note $41
	note $01
	note $71
	note $01
	note $a1
	octave3
	note $11
	note $21
	note $01
	octave2
	note $91
	note $01
	note $a1
	note $01
	octave3
	note $11
	note $01
	note $21
	note $01
	octave2
	note $91
	note $01
	note $a1
	note $01
	octave3
	note $31
	note $01
	loopchannel $02, $6683
	note $21
	note $01
	octave2
	note $91
	note $01
	note $a1
	note $01
	octave3
	note $41
	note $71
	note $51
	note $01
	octave2
	note $c1
	note $01
	octave3
	note $11
	note $01
	note $61
	note $01
	loopchannel $08, $669b
	loopchannel $00, $665b ; end
; 0xee6ad

_Music_Lighthouse_Ch4: ; 0xee6ad
	togglenoise $00
	notetype $0c
	stereopanning $0f
	note $93
	note $61
	note $93
	note $61
	note $a1
	note $b1
	stereopanning $ff
	note $91
	note $63
	note $91
	note $63
	note $91
	note $a1
	loopchannel $00, $66b1 ; end
; 0xee6c5
