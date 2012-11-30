_Music_LookOfficer: ; 0xed82d
	db $80
	dw _Music_LookOfficer_Ch1
	db $01
	dw _Music_LookOfficer_Ch2
	db $02
	dw _Music_LookOfficer_Ch3
; 0xed836

_Music_LookOfficer_Ch1: ; 0xed836
	tempo $7400
	volume $77
	tone $0100
	vibrato $12, $34
	stereopanning $0f
	dutycycle $03
	notetype $0c, $a7
	octave4
	note $20
	note $30
	note $40
	note $50
	note $6b
	intensity $2f
	octave3
	note $cf
	intensity $82
	note $03
	note $c5
	note $93
	note $c5
	note $c5
	note $93
	note $c1
	intensity $2f
	note $bf
	note $af
	loopchannel $00, $5852 ; end
; 0xed863

_Music_LookOfficer_Ch2: ; 0xed863
	vibrato $12, $34
	dutycycle $03
	notetype $0c, $b7
	octave5
	note $40
	note $30
	note $20
	note $10
	octave4
	note $cb
	dutycycle $03
	intensity $a2
	octave1
	note $c3
	octave2
	note $a1
	octave1
	note $c3
	octave2
	note $61
	octave1
	note $c1
	octave2
	note $41
	note $51
	note $91
	octave3
	note $51
	octave2
	note $51
	note $91
	note $c1
	note $51
	note $91
	loopchannel $02, $5882
	forceoctave $01
	callchannel _Music_LookOfficer_sub_0xed89e
	forceoctave $00
	callchannel _Music_LookOfficer_sub_0xed89e
	loopchannel $00, $5882 ; end
; 0xed89e

_Music_LookOfficer_sub_0xed89e: ; 0xed89e
; subroutine
	octave1
	note $a1
	octave2
	note $21
	note $a1
	octave1
	note $a1
	octave2
	note $21
	note $51
	octave1
	note $a1
	octave2
	note $21
	endchannel ; end
; 0xed8ad

_Music_LookOfficer_Ch3: ; 0xed8ad
	vibrato $14, $14
	stereopanning $f0
	notetype $0c, $14
	note $09
	octave3
	note $c1
	note $01
	note $c1
	intensity $12
	octave5
	note $41
	note $00
	note $61
	note $00
	note $a1
	note $c1
	note $00
	octave6
	note $21
	note $00
	note $41
	note $55
	note $45
	note $23
	octave5
	note $c1
	note $a1
	note $91
	note $71
	note $91
	note $a1
	note $c1
	octave6
	note $21
	note $67
	note $37
	note $57
	note $27
	loopchannel $00, $58c8 ; end
; 0xed8dd
