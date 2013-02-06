_Music_LookSage: ; 0xee35e
	db $40
	dw _Music_LookSage_Ch1
	db $02
	dw _Music_LookSage_Ch3
; 0xee364

_Music_LookSage_Ch1: ; 0xee364
	tempo $9000
	stereopanning $0f
	volume $77
	dutycycle $03
	notetype $0c, $b3
	note $01
	note $0f
	callchannel _Music_LookSage_sub_0xee3fa
	intensity $b3
	octave3
	note $31
	intensity $93
	note $31
	intensity $b3
	note $51
	intensity $93
	note $51
	intensity $b3
	note $a1
	intensity $93
	note $a1
	intensity $b3
	note $61
	intensity $93
	note $61
	intensity $b3
	note $31
	intensity $93
	note $31
	intensity $b3
	octave2
	note $c1
	intensity $93
	note $c1
	intensity $b3
	note $a1
	intensity $93
	note $a1
	intensity $b3
	note $c1
	intensity $93
	note $c1
	intensity $b3
	octave3
	note $31
	intensity $93
	note $31
	intensity $b3
	octave2
	note $c1
	intensity $93
	note $c1
	intensity $b3
	octave3
	note $31
	intensity $93
	note $31
	intensity $b3
	note $51
	intensity $93
	note $51
	intensity $b3
	note $61
	intensity $93
	note $61
	intensity $b3
	note $31
	intensity $93
	note $31
	intensity $b3
	note $51
	intensity $93
	note $51
	intensity $b3
	note $a1
	intensity $93
	note $a1
	intensity $b3
	note $31
	intensity $93
	note $31
	intensity $b3
	octave2
	note $c1
	intensity $93
	note $c1
	intensity $b3
	note $a1
	intensity $93
	note $a1
	intensity $b3
	note $c1
	intensity $93
	note $c1
	callchannel _Music_LookSage_sub_0xee3fa
	loopchannel $00, $638e ; end
; 0xee3fa

_Music_LookSage_sub_0xee3fa: ; 0xee3fa
; subroutine
	intensity $b3
	octave2
	note $51
	intensity $93
	note $51
	intensity $b3
	note $a1
	intensity $93
	note $a1
	intensity $b3
	note $c1
	intensity $93
	note $c1
	intensity $b3
	note $a1
	intensity $93
	note $a1
	endchannel ; end
; 0xee414

_Music_LookSage_Ch3: ; 0xee414
	stereopanning $f0
	vibrato $16, $23
	notetype $0c, $10
	octave5
	note $c0
	octave6
	note $10
	octave5
	note $cf
	vibrato $07, $23
	note $c7
	vibrato $14, $23
	octave6
	note $35
	note $50
	note $60
	note $5d
	note $80
	note $90
	note $ab
	note $c3
	note $38
	note $50
	note $60
	note $30
	vibrato $00, $00
	note $53
	vibrato $07, $23
	note $57
	vibrato $14, $23
	octave5
	note $c7
	octave6
	note $67
	notetype $06, $10
	note $50
	note $40
	note $30
	note $20
	note $10
	octave5
	note $c0
	note $b0
	note $a0
	note $03
	octave6
	note $51
	note $61
	notetype $0c, $10
	note $5d
	note $80
	note $90
	loopchannel $00, $6430 ; end
; 0xee45f
