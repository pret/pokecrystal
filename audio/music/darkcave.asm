_Music_DarkCave: ; 0xea2be
	db $c0
	dw _Music_DarkCave_Ch1
	db $01
	dw _Music_DarkCave_Ch2
	db $02
	dw _Music_DarkCave_Ch3
	db $03
	dw _Music_DarkCave_Ch4
; 0xea2ca

_Music_DarkCave_Ch1: ; 0xea2ca
	tempo $8000
	volume $77
	dutycycle $03
	tone $0100
	vibrato $11, $15
	stereopanning $f0
	notetype $0c, $a7
	note $0f
	loopchannel $04, $62dc
	octave3
	note $4f
	note $3f
	note $2f
	note $1f
	intensity $a3
	callchannel _Music_DarkCave_sub_0xea333
	loopchannel $03, $62e8
	intensity $b7
	note $97
	note $47
	note $87
	note $37
	note $67
	note $27
	note $47
	note $87
	note $97
	note $47
	note $87
	note $37
	note $67
	note $27
	note $47
	note $17
	intensity $a3
	callchannel _Music_DarkCave_sub_0xea333
	loopchannel $02, $6303
	note $0f
	note $07
	intensity $b7
	octave2
	note $61
	note $81
	note $93
	octave3
	note $4f
	note $07
	octave2
	note $91
	note $81
	note $93
	octave3
	note $4f
	note $81
	note $05
	note $61
	note $81
	note $93
	note $8f
	note $61
	note $05
	note $91
	note $81
	note $93
	intensity $a3
	callchannel _Music_DarkCave_sub_0xea333
	loopchannel $02, $6328
	loopchannel $00, $62e8 ; end
; 0xea333

_Music_DarkCave_sub_0xea333: ; 0xea333
; subroutine
	octave4
	note $41
	octave3
	note $91
	octave4
	note $11
	note $41
	octave3
	note $91
	octave4
	note $11
	note $41
	note $11
	note $31
	octave3
	note $81
	note $b1
	octave4
	note $31
	octave3
	note $81
	note $b1
	octave4
	note $31
	octave3
	note $b1
	octave4
	note $21
	octave3
	note $61
	note $b1
	octave4
	note $21
	octave3
	note $61
	note $b1
	octave4
	note $21
	octave3
	note $b1
	octave4
	note $11
	octave3
	note $81
	note $b1
	octave4
	note $11
	octave3
	note $81
	note $b1
	octave4
	note $11
	octave3
	note $b1
	endchannel ; end
; 0xea36a

_Music_DarkCave_Ch2: ; 0xea36a
	dutycycle $01
	vibrato $12, $36
	stereopanning $0f
	notetype $0c, $a7
	note $0f
	loopchannel $04, $6374
	octave3
	note $8f
	note $bf
	note $6f
	note $8f
	note $0f
	loopchannel $04, $637e
	note $07
	stereopanning $ff
	intensity $c7
	octave5
	note $17
	intensity $c4
	note $31
	note $11
	octave4
	note $b1
	note $83
	note $b1
	octave5
	note $33
	intensity $b0
	note $23
	intensity $b7
	note $2b
	intensity $59
	note $17
	intensity $c7
	note $17
	note $07
	intensity $c7
	note $17
	intensity $c4
	note $31
	note $11
	octave4
	note $b1
	note $81
	note $81
	note $b1
	octave5
	note $33
	intensity $c7
	note $2b
	intensity $c3
	note $11
	note $21
	intensity $b0
	note $49
	intensity $b7
	note $45
	stereopanning $0f
	intensity $c4
	octave4
	note $63
	note $41
	note $31
	note $43
	note $31
	note $11
	note $31
	note $11
	octave3
	note $b1
	octave4
	note $11
	note $33
	note $11
	octave3
	note $b1
	octave4
	note $27
	octave3
	note $b7
	intensity $b0
	octave4
	note $41
	note $31
	note $11
	octave3
	note $b1
	octave4
	note $17
	note $63
	note $41
	note $31
	note $43
	note $31
	note $11
	note $31
	note $11
	octave3
	note $b1
	octave4
	note $11
	note $33
	note $11
	octave3
	note $b1
	octave4
	note $23
	note $11
	note $21
	note $11
	note $21
	octave3
	note $b1
	octave4
	note $21
	intensity $b0
	note $17
	intensity $b7
	note $17
	intensity $c7
	stereopanning $ff
	note $07
	octave5
	note $17
	intensity $c4
	note $31
	note $11
	octave4
	note $b1
	note $83
	note $b1
	octave5
	note $33
	intensity $49
	note $27
	intensity $c7
	note $27
	intensity $b0
	note $17
	intensity $b7
	note $17
	note $07
	intensity $c7
	note $17
	intensity $c4
	note $31
	note $11
	octave4
	note $b1
	note $81
	note $81
	note $b1
	octave5
	note $33
	intensity $b0
	note $27
	intensity $b7
	note $27
	intensity $b0
	note $17
	intensity $b7
	note $17
	intensity $c7
	note $0f
	stereopanning $0f
	note $07
	octave3
	note $b1
	octave4
	note $11
	note $23
	note $1f
	note $07
	note $21
	note $11
	note $23
	note $1f
	intensity $c2
	note $47
	intensity $c7
	octave3
	note $b1
	octave4
	note $11
	note $23
	note $1f
	intensity $c2
	octave3
	note $b7
	intensity $c7
	octave4
	note $21
	note $11
	intensity $c4
	note $2f
	note $03
	note $0f
	note $0f
	note $0f
	intensity $b7
	octave5
	note $4f
	note $3f
	note $6f
	note $4f
	loopchannel $00, $637e ; end
; 0xea46e

_Music_DarkCave_Ch3: ; 0xea46e
	notetype $0c, $27
	callchannel _Music_DarkCave_sub_0xea4ce
	loopchannel $02, $6471
	callchannel _Music_DarkCave_sub_0xea4ce
	loopchannel $07, $6478
	callchannel _Music_DarkCave_sub_0xea4c3
	octave3
	note $13
	note $81
	note $43
	note $81
	note $43
	note $61
	note $01
	octave2
	note $bb
	callchannel _Music_DarkCave_sub_0xea4c3
	octave3
	note $13
	note $81
	note $43
	note $81
	note $43
	note $61
	note $01
	octave2
	note $b3
	octave3
	note $21
	note $11
	note $23
	callchannel _Music_DarkCave_sub_0xea4a7
	callchannel _Music_DarkCave_sub_0xea4a7
	loopchannel $00, $6478 ; end
; 0xea4a7

_Music_DarkCave_sub_0xea4a7: ; 0xea4a7
; subroutine
	octave3
	note $13
	note $81
	note $43
	note $81
	note $63
	note $41
	note $01
	octave2
	note $b3
	note $b1
	octave3
	note $11
	note $23
	note $13
	note $81
	note $43
	note $81
	note $43
	note $61
	note $01
	octave2
	note $b3
	octave3
	note $21
	note $11
	note $23
	endchannel ; end
; 0xea4c3

_Music_DarkCave_sub_0xea4c3: ; 0xea4c3
; subroutine
	octave3
	note $13
	note $81
	note $43
	note $81
	note $63
	note $41
	note $01
	octave2
	note $bb
	endchannel ; end
; 0xea4ce

_Music_DarkCave_sub_0xea4ce: ; 0xea4ce
; subroutine
	octave2
	note $13
	note $81
	note $43
	note $81
	note $63
	note $41
	note $01
	octave1
	note $b3
	note $b1
	octave2
	note $11
	note $23
	note $13
	note $81
	note $43
	note $81
	note $43
	note $61
	note $01
	octave1
	note $b3
	octave2
	note $21
	note $11
	note $23
	endchannel ; end
; 0xea4ea

_Music_DarkCave_Ch4: ; 0xea4ea
	togglenoise $03
	notetype $0c
	stereopanning $ff
	note $47
	note $47
	note $43
	stereopanning $f0
	note $23
	stereopanning $0f
	note $21
	note $21
	stereopanning $f0
	note $23
	stereopanning $ff
	note $47
	note $47
	note $43
	stereopanning $0f
	note $27
	stereopanning $f0
	note $21
	note $21
	loopchannel $00, $64ee ; end
; 0xea50d
