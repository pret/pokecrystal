_Music_GoldSilverOpening2: ; 0xf7308
	db $c0
	dw _Music_GoldSilverOpening2_Ch1
	db $01
	dw _Music_GoldSilverOpening2_Ch2
	db $02
	dw _Music_GoldSilverOpening2_Ch3
	db $03
	dw _Music_GoldSilverOpening2_Ch4
; 0xf7314

_Music_GoldSilverOpening2_Ch1: ; 0xf7314
	tempo $5c00
	volume $77
	dutycycle $03
	tone $0200
	stereopanning $0f
	notetype $0c, $3d
	octave3
	note $47
	notetype $0c, $c1
	octave3
	note $31
	note $31
	note $31
	intensity $b7
	note $49
	intensity $c1
	note $31
	note $31
	note $31
	intensity $b7
	note $63
	note $43
	note $11
	loopchannel $02, $7325
	intensity $c1
	note $31
	note $31
	note $31
	intensity $b7
	note $49
	intensity $c1
	note $31
	note $31
	note $31
	intensity $b7
	note $63
	note $83
	note $b1
	intensity $b0
	note $af
	note $af
	intensity $b2
	octave4
	note $3f
	endchannel ; end
; 0xf7358

_Music_GoldSilverOpening2_Ch2: ; 0xf7358
	dutycycle $03
	vibrato $14, $14
	stereopanning $f0
	notetype $0c, $3f
	octave3
	note $b7
	notetype $0c, $d1
	octave3
	note $a1
	note $a1
	note $a1
	intensity $c7
	note $b9
	intensity $d1
	note $a1
	note $a1
	note $a1
	intensity $c7
	octave4
	note $13
	octave3
	note $b3
	note $81
	intensity $d1
	note $a1
	note $a1
	note $a1
	intensity $c7
	note $b9
	intensity $d1
	note $a1
	note $a1
	note $a1
	intensity $c7
	octave4
	note $13
	note $23
	note $41
	intensity $c7
	note $37
	note $47
	note $67
	note $b7
	intensity $b0
	octave5
	note $3f
	note $3f
	intensity $c2
	note $3f
	endchannel ; end
; 0xf739c

_Music_GoldSilverOpening2_Ch3: ; 0xf739c
	notetype $0c, $17
	note $07
	octave2
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $b7
	note $01
	note $a0
	note $00
	note $a0
	note $00
	note $a0
	note $00
	note $33
	note $63
	note $a1
	note $31
	note $a1
	note $31
	note $a1
	note $91
	note $51
	note $81
	note $61
	note $31
	note $a1
	note $91
	note $51
	note $81
	note $61
	note $11
	note $41
	note $31
	note $a1
	note $31
	note $a1
	note $91
	note $51
	note $81
	note $61
	note $31
	note $a1
	note $91
	note $51
	note $81
	note $61
	note $11
	note $41
	note $31
	note $71
	note $b1
	octave3
	note $31
	octave2
	note $b1
	note $a1
	note $71
	note $41
	note $31
	note $71
	note $b1
	octave3
	note $31
	octave2
	note $b1
	note $71
	note $b1
	octave3
	note $21
	note $31
	note $0d
	endchannel ; end
; 0xf73ea

_Music_GoldSilverOpening2_Ch4: ; 0xf73ea
	togglenoise $00
	notetype $06
	note $41
	note $41
	note $41
	note $41
	note $41
	note $31
	note $31
	note $31
	notetype $0c
	note $31
	note $31
	note $31
	note $23
	note $41
	note $41
	note $41
	note $31
	note $31
	note $31
	note $25
	notetype $06
	note $41
	note $41
	note $41
	note $41
	notetype $0c
	loopchannel $04, $73f8
	note $1f
	endchannel ; end
; 0xf7411
