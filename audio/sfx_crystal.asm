Sfx_IntroUnown1: ; 17982d
	musicheader 1, 5, Sfx_IntroUnown1_Ch5
; 179830

Sfx_IntroUnown1_Ch5: ; 179830
	vibrato $1, $a3
	dutycycle $2
	sound __,  9, $39, $0705
	sound C#,  1, $e2, $0705
	endchannel
; 17983e

Sfx_IntroUnown2: ; 17983e
	musicheader 1, 6, Sfx_IntroUnown2_Ch6
; 179841

Sfx_IntroUnown2_Ch6: ; 179841
	vibrato $1, $73
	dutycycle $2
	sound __,  9, $39, $0758
	sound C#,  1, $e2, $0758
	endchannel
; 17984f

Sfx_IntroUnown3: ; 17984f
	musicheader 1, 7, Sfx_IntroUnown3_Ch7
; 179852

Sfx_IntroUnown3_Ch7: ; 179852
	vibrato $1, $53
	sound __,  4, $32, $07c2
	sound __,  4, $22, $07c2
	sound __,  4, $12, $07c2
	sound C_,  1, $12, $07c2
	sound __,  7, $22, $07c2
	sound __,  7, $32, $07c2
	endchannel
; 17986e

Sfx_DittoPopUp: ; 17986e
	musicheader 1, 5, Sfx_DittoPopUp_Ch5
; 179871

Sfx_DittoPopUp_Ch5: ; 179871
	dutycycle $2
	soundinput $1e
	sound __,  4, $82, $0700
	sound __,  2, $31, $0701
	soundinput $16
	sound __,  5, $b1, $0640
	sound C_,  1, $31, $0641
	endchannel
; 179888

Sfx_DittoTransform: ; 179888
	musicheader 1, 5, Sfx_DittoTransform_Ch5
; 17988b

Sfx_DittoTransform_Ch5: ; 17988b
	dutycycle $1
	soundinput $26
	sound C_,  5, $3b, $0440
	sound __,  5, $97, $04c0
	sound __,  5, $67, $04c1
	sound __,  5, $42, $04c2
	endchannel
; 1798a0

Sfx_IntroSuicune1: ; 1798a0
	musicheader 1, 8, Sfx_IntroSuicune1_Ch8
; 1798a3

Sfx_IntroSuicune1_Ch8: ; 1798a3
	noise __,  2, $58, $59
	noise __,  3, $91, $23
	endchannel
; 1798aa

Sfx_IntroPichu: ; 1798aa
	musicheader 1, 5, Sfx_IntroPichu_Ch5
; 1798ad

Sfx_IntroPichu_Ch5: ; 1798ad
	dutycycle $3
	soundinput $4d
	sound __,  2, $88, $0770
	sound __,  4, $0, 0
	soundinput $17
	sound __,  3, $88, $0776
	endchannel
; 1798c0

Sfx_IntroSuicune2: ; 1798c0
	musicheader 1, 8, Sfx_IntroSuicune2_Ch8
; 1798c3

Sfx_IntroSuicune2_Ch8: ; 1798c3
	noise __,  2, $a7, $31
	noise __,  2, $91, $0
	noise __,  2, $92, $21
	noise __,  2, $91, $0
	noise __,  2, $92, $22
	noise __,  2, $82, $11
	noise __,  2, $82, $22
	noise __,  2, $72, $11
	noise __,  2, $72, $12
	noise __,  2, $62, $10
	noise __,  2, $63, $0
	noise __,  2, $53, $10
	noise __,  2, $43, $0
	noise __,  2, $33, $10
	noise __,  2, $23, $0
	noise __,  2, $13, $10
	endchannel
; 1798f4

Sfx_IntroSuicune3: ; 1798f4
	musicheader 1, 8, Sfx_IntroSuicune3_Ch8
; 1798f7

Sfx_IntroSuicune3_Ch8: ; 1798f7
	noise __,  2, $88, $31
	noise __,  9, $39, $11
	noise __,  5, $a4, $10
	noise __,  5, $44, $10
	noise __,  5, $24, $10
	endchannel
; 179907

Sfx_DittoBounce: ; 179907
	musicheader 1, 5, Sfx_DittoBounce_Ch5
; 17990a

Sfx_DittoBounce_Ch5: ; 17990a
	dutycycle $2
	soundinput $2c
	sound __,  3, $82, $04b0
	sound __,  1, $31, $04b0
	soundinput $34
	sound C_,  1, $b1, $0420
	endchannel
; 17991d

Sfx_IntroSuicune4: ; 17991d
	musicheader 1, 8, Sfx_IntroSuicune4_Ch8
; 179920

Sfx_IntroSuicune4_Ch8: ; 179920
	noise __,  2, $a1, $5c
	noise __,  1, $0, $0
	noise __,  2, $c1, $4d
	noise __,  1, $0, $0
	noise __,  5, $b2, $31
	noise __,  1, $0, $0
	noise __,  5, $a2, $2
	noise __,  1, $0, $0
	noise __,  5, $92, $1
	noise __,  1, $0, $0
	noise C#,  1, $72, $0
	endchannel
; 179942

Sfx_GameFreakPresents: ; 179942
	musicheader 1, 5, Sfx_GameFreakPresents_Ch5
; 179945

Sfx_GameFreakPresents_Ch5: ; 179945
	togglesfx
	dutycycle $2
	notetype $2, $b1
	soundinput $ff
	pitchoffset 1, A#
	octave 5
	note C_, 2
	note E_, 2
	note G_, 2
	octave 6
	note C_, 2
	note E_, 2
	note G_, 3
	intensity $81
	note G_, 3
	intensity $51
	note G_, 3
	intensity $31
	note G_, 3
	endchannel
; 179961

Sfx_Tingle: ; 179961
	musicheader 1, 5, Sfx_Tingle_Ch5
; 179964

Sfx_Tingle_Ch5: ; 179964
	togglesfx
	dutycycle $1
	pitchoffset 0, B_
	notetype $1, $b1
Sfx_Tingle_branch_17996c: ; 17996c
	octave 5
	note C_, 3
	octave 6
	note G_, 2
	octave 5
	note C_, 3
	note __, 2
	loopchannel 2, Sfx_Tingle_branch_17996c
	note C_, 2
	intensity $a1
	note G_, 13
	endchannel
; 17997c

Sfx_TwoPcBeeps: ; 17997c
	musicheader 1, 5, Sfx_TwoPcBeeps_Ch5
; 17997f

Sfx_TwoPcBeeps_Ch5: ; 17997f
	dutycycle $2
	sound __,  3, $e8, $07c2
	sound __,  3, $28, $07c2
	sound __,  3, $e8, $07c2
	sound __,  3, $28, $07c2
	endchannel
; 179992

Sfx_4NoteDitty: ; 179992
	musicheader 3, 5, Sfx_4NoteDitty_Ch5
	musicheader 1, 6, Sfx_4NoteDitty_Ch6
	musicheader 1, 7, Sfx_4NoteDitty_Ch7
; 17999b

Sfx_4NoteDitty_Ch5: ; 17999b
	togglesfx
	dutycycle $2
	notetype $2, $e8
	pitchoffset 0, D_
	octave 4
	note C_, 2
	intensity $48
	note C_, 2
	intensity $e8
	note G_, 2
	intensity $48
	note G_, 2
	octave 5
	intensity $e8
	note E_, 2
	intensity $48
	note E_, 2
	octave 6
	intensity $e8
	note C_, 2
	intensity $43
	note C_, 16
	endchannel
; 1799bd

Sfx_4NoteDitty_Ch6: ; 1799bd
	togglesfx
	notetype $2, $b8
	note __, 9
	note __, 16
	endchannel
; 1799c4

Sfx_4NoteDitty_Ch7: ; 1799c4
	togglesfx
	notetype $2, $b8
	note __, 9
	note __, 16
	endchannel
; 1799cb

Sfx_Twinkle: ; 1799cb
	musicheader 1, 5, Sfx_Twinkle_Ch5
; 1799ce

Sfx_Twinkle_Ch5: ; 1799ce
	togglesfx
	dutycycle $0
	pitchoffset 0, D_
	notetype $2, $e1
	octave 3
	note G_, 2
	intensity $b1
	octave 4
	note D_, 2
	intensity $e1
	note B_, 2
	intensity $b1
	note G_, 2
	intensity $e1
	octave 5
	note D_, 2
	intensity $b1
	octave 4
	note B_, 2
	intensity $e1
	octave 5
	note G_, 6
	endchannel
; 1799ef
