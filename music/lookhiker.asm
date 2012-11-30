_Music_LookHiker: ; 0xf7411
	db $c0
	dw _Music_LookHiker_Ch1
	db $01
	dw _Music_LookHiker_Ch2
	db $02
	dw _Music_LookHiker_Ch3
	db $03
	dw _Music_LookHiker_Ch4
; 0xf741d

_Music_LookHiker_Ch1: ; 0xf741d
	tempo $8400
	volume $77
	tone $0100
	vibrato $12, $24
	dutycycle $02
	stereopanning $0f
	notetype $0c, $68
	octave3
	note $71
	note $61
	note $77
	note $31
	note $41
	note $51
	note $61
	note $71
	note $03
	note $71
	note $03
	note $71
	note $01
	note $71
	note $05
	loopchannel $00, $7433 ; end
; 0xf7443

_Music_LookHiker_Ch2: ; 0xf7443
	dutycycle $00
	notetype $0c, $a1
	note $03
	octave1
	note $c0
	note $c4
	octave2
	note $70
	note $74
	octave1
	note $c0
	octave2
	note $30
	note $70
	note $30
	intensity $a1
	octave1
	note $c0
	note $c1
	octave2
	note $30
	note $31
	note $70
	note $71
	note $b0
	note $b1
	octave1
	note $c0
	octave2
	note $30
	note $70
	note $30
	loopchannel $00, $7457 ; end
; 0xf746b

_Music_LookHiker_Ch3: ; 0xf746b
	vibrato $12, $24
	stereopanning $f0
	notetype $0c, $14
	octave4
	note $c1
	note $b1
	note $c7
	octave5
	note $41
	note $31
	note $21
	note $11
	callchannel _Music_LookHiker_sub_0xf748a
	note $81
	note $91
	note $a1
	note $b1
	callchannel _Music_LookHiker_sub_0xf748a
	loopchannel $00, $7477 ; end
; 0xf748a

_Music_LookHiker_sub_0xf748a: ; 0xf748a
; subroutine
	octave4
	note $c1
	note $03
	note $c1
	note $03
	note $c1
	note $01
	note $c1
	note $05
	endchannel ; end
; 0xf7494

_Music_LookHiker_Ch4: ; 0xf7494
	togglenoise $03
	notetype $0c
	note $63
	note $0f
	note $41
	note $81
	note $31
	note $81
	loopchannel $00, $749a ; end
; 0xf74a2
