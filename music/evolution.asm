_Music_Evolution: ; 0xf06e1
	db $c0
	dw _Music_Evolution_Ch1
	db $01
	dw _Music_Evolution_Ch2
	db $02
	dw _Music_Evolution_Ch3
	db $03
	dw _Music_Evolution_Ch4
; 0xf06ed

_Music_Evolution_Ch1: ; 0xf06ed
	tempo $8400
	volume $77
	vibrato $06, $34
	tone $0100
	dutycycle $02
	notetype $0c, $92
	octave3
	unknownmusic0xe0 $00, $4a
	note $10
	unknownmusic0xe0 $00, $4a
	note $80
	unknownmusic0xe0 $00, $4a
	note $10
	unknownmusic0xe0 $00, $4a
	note $80
	note $03
	dutycycle $03
	stereopanning $0f
	callchannel _Music_Evolution_sub_0xf0737
	notetype $0c, $a4
	note $73
	callchannel _Music_Evolution_sub_0xf0737
	notetype $0c, $a4
	note $73
	loopchannel $02, $4713
	callchannel _Music_Evolution_sub_0xf0743
	notetype $0c, $a4
	note $93
	callchannel _Music_Evolution_sub_0xf0743
	notetype $0c, $a4
	note $93
	loopchannel $00, $4713 ; end
; 0xf0737

_Music_Evolution_sub_0xf0737: ; 0xf0737
; subroutine
	notetype $0c, $a2
	octave3
	note $13
	note $83
	note $13
	note $83
	note $13
	note $83
	note $13
	endchannel ; end
; 0xf0743

_Music_Evolution_sub_0xf0743: ; 0xf0743
; subroutine
	notetype $0c, $a2
	octave3
	note $33
	note $a3
	note $33
	note $a3
	note $33
	note $a3
	note $33
	endchannel ; end
; 0xf074f

_Music_Evolution_Ch2: ; 0xf074f
	dutycycle $02
	vibrato $08, $25
	notetype $0c, $a2
	octave4
	note $80
	note $30
	note $80
	note $30
	note $03
	dutycycle $03
	stereopanning $f0
	callchannel _Music_Evolution_sub_0xf0787
	notetype $0c, $b5
	note $a3
	callchannel _Music_Evolution_sub_0xf0787
	notetype $0c, $b5
	note $c3
	loopchannel $02, $4761
	callchannel _Music_Evolution_sub_0xf0793
	notetype $0c, $b5
	note $c3
	callchannel _Music_Evolution_sub_0xf0793
	notetype $0c, $b5
	octave4
	note $23
	octave3
	loopchannel $00, $4761 ; end
; 0xf0787

_Music_Evolution_sub_0xf0787: ; 0xf0787
; subroutine
	notetype $0c, $b2
	octave3
	note $83
	note $33
	note $83
	note $33
	note $83
	note $33
	note $83
	endchannel ; end
; 0xf0793

_Music_Evolution_sub_0xf0793: ; 0xf0793
; subroutine
	notetype $0c, $b2
	octave3
	note $a3
	note $53
	note $a3
	note $53
	note $a3
	note $53
	note $a3
	endchannel ; end
; 0xf079f

_Music_Evolution_Ch3: ; 0xf079f
	notetype $0c, $16
	note $07
	callchannel _Music_Evolution_sub_0xf07bf
	octave3
	note $a3
	callchannel _Music_Evolution_sub_0xf07bf
	octave3
	note $c3
	loopchannel $02, $47a3
	callchannel _Music_Evolution_sub_0xf07d5
	octave3
	note $c3
	callchannel _Music_Evolution_sub_0xf07d5
	octave4
	note $23
	loopchannel $00, $47a3 ; end
; 0xf07bf

_Music_Evolution_sub_0xf07bf: ; 0xf07bf
; subroutine
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave2
	note $a1
	note $01
	octave3
	note $31
	note $01
	octave2
	note $a1
	note $01
	endchannel ; end
; 0xf07d5

_Music_Evolution_sub_0xf07d5: ; 0xf07d5
; subroutine
	octave2
	note $c1
	note $01
	octave3
	note $51
	note $01
	octave2
	note $c1
	note $01
	octave3
	note $51
	note $01
	octave2
	note $c1
	note $01
	octave3
	note $51
	note $01
	octave2
	note $a1
	note $01
	endchannel ; end
; 0xf07eb

_Music_Evolution_Ch4: ; 0xf07eb
	togglenoise $05
	notetype $0c
	note $07
	stereopanning $f0
	note $b5
	note $b3
	stereopanning $0f
	note $51
	note $51
	note $51
	loopchannel $00, $47f0 ; end
; 0xf07fd
