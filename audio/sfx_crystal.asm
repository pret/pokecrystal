Sfx_IntroUnown1: ; 17982d
	dbw $04, Sfx_IntroUnown1_Ch5
; 179830

Sfx_IntroUnown1_Ch5: ; 179830
	vibrato $1, $a, $3
	waveduty $2
	sound $8, $39, $0705
	sound $20, $e2, $0705
	endchannel
; 17983e

Sfx_IntroUnown2: ; 17983e
	dbw $05, Sfx_IntroUnown2_Ch6
; 179841

Sfx_IntroUnown2_Ch6: ; 179841
	vibrato $1, $7, $3
	waveduty $2
	sound $8, $39, $0758
	sound $20, $e2, $0758
	endchannel
; 17984f

Sfx_IntroUnown3: ; 17984f
	dbw $06, Sfx_IntroUnown3_Ch7
; 179852

Sfx_IntroUnown3_Ch7: ; 179852
	vibrato $1, $5, $3
	sound $3, $32, $07c2
	sound $3, $22, $07c2
	sound $3, $12, $07c2
	sound $10, $12, $07c2
	sound $6, $22, $07c2
	sound $6, $32, $07c2
	endchannel
; 17986e

Sfx_DittoPopUp: ; 17986e
	dbw $04, Sfx_DittoPopUp_Ch5
; 179871

Sfx_DittoPopUp_Ch5: ; 179871
	waveduty $2
	sweep $1, $1, $6
	sound $3, $82, $0700
	sound $1, $31, $0701
	sweep $1, $0, $6
	sound $4, $b1, $0640
	sound $10, $31, $0641
	endchannel
; 179888

Sfx_DittoTransform: ; 179888
	dbw $04, Sfx_DittoTransform_Ch5
; 17988b

Sfx_DittoTransform_Ch5: ; 17988b
	waveduty $1
	sweep $2, $0, $6
	sound $14, $3b, $0440
	sound $4, $97, $04c0
	sound $4, $67, $04c1
	sound $4, $42, $04c2
	endchannel
; 1798a0

Sfx_IntroSuicune1: ; 1798a0
	dbw $07, Sfx_IntroSuicune1_Ch8
; 1798a3

Sfx_IntroSuicune1_Ch8: ; 1798a3
	noise $1, $58, $59
	noise $2, $91, $23
	endchannel
; 1798aa

Sfx_IntroPichu: ; 1798aa
	dbw $04, Sfx_IntroPichu_Ch5
; 1798ad

Sfx_IntroPichu_Ch5: ; 1798ad
	waveduty $3
	sweep $4, $1, $5
	sound $1, $88, $0770
	sound $3, $0, $0000
	sweep $1, $0, $7
	sound $2, $88, $0776
	endchannel
; 1798c0

Sfx_IntroSuicune2: ; 1798c0
	dbw $07, Sfx_IntroSuicune2_Ch8
; 1798c3

Sfx_IntroSuicune2_Ch8: ; 1798c3
	noise $1, $a7, $31
	noise $1, $91, $0
	noise $1, $92, $21
	noise $1, $91, $0
	noise $1, $92, $22
	noise $1, $82, $11
	noise $1, $82, $22
	noise $1, $72, $11
	noise $1, $72, $12
	noise $1, $62, $10
	noise $1, $63, $0
	noise $1, $53, $10
	noise $1, $43, $0
	noise $1, $33, $10
	noise $1, $23, $0
	noise $1, $13, $10
	endchannel
; 1798f4

Sfx_IntroSuicune3: ; 1798f4
	dbw $07, Sfx_IntroSuicune3_Ch8
; 1798f7

Sfx_IntroSuicune3_Ch8: ; 1798f7
	noise $1, $88, $31
	noise $8, $39, $11
	noise $4, $a4, $10
	noise $4, $44, $10
	noise $4, $24, $10
	endchannel
; 179907

Sfx_DittoBounce: ; 179907
	dbw $04, Sfx_DittoBounce_Ch5
; 17990a

Sfx_DittoBounce_Ch5: ; 17990a
	waveduty $2
	sweep $2, $1, $4
	sound $2, $82, $04b0
	sound $0, $31, $04b0
	sweep $3, $0, $4
	sound $10, $b1, $0420
	endchannel
; 17991d

Sfx_IntroSuicune4: ; 17991d
	dbw $07, Sfx_IntroSuicune4_Ch8
; 179920

Sfx_IntroSuicune4_Ch8: ; 179920
	noise $1, $a1, $5c
	noise $0, $0, $0
	noise $1, $c1, $4d
	noise $0, $0, $0
	noise $4, $b2, $31
	noise $0, $0, $0
	noise $4, $a2, $2
	noise $0, $0, $0
	noise $4, $92, $1
	noise $0, $0, $0
	noise $20, $72, $0
	endchannel
; 179942

Sfx_GameFreakPresents: ; 179942
	dbw $04, Sfx_GameFreakPresents_Ch5
; 179945

Sfx_GameFreakPresents_Ch5: ; 179945
	togglesfx
	waveduty $2
	notetype $2, $b, $0, $1
	sweep $f, $1, $7
	transpose $1, $a
	octave 5
	note C_, 2
	note E_, 2
	note G_, 2
	octave 6
	note C_, 2
	note E_, 2
	note G_, 3
	volenvelope $8, $0, $1
	note G_, 3
	volenvelope $5, $0, $1
	note G_, 3
	volenvelope $3, $0, $1
	note G_, 3
	endchannel
; 179961

Sfx_Tingle: ; 179961
	dbw $04, Sfx_Tingle_Ch5
; 179964

Sfx_Tingle_Ch5: ; 179964
	togglesfx
	waveduty $1
	transpose $0, $b
	notetype $1, $b, $0, $1
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
	volenvelope $a, $0, $1
	note G_, 13
	endchannel
; 17997c

Sfx_TwoPcBeeps: ; 17997c
	dbw $04, Sfx_TwoPcBeeps_Ch5
; 17997f

Sfx_TwoPcBeeps_Ch5: ; 17997f
	waveduty $2
	sound $2, $e8, $07c2
	sound $2, $28, $07c2
	sound $2, $e8, $07c2
	sound $2, $28, $07c2
	endchannel
; 179992

Sfx_4NoteDitty: ; 179992
	dbw $84, Sfx_4NoteDitty_Ch5
	dbw $05, Sfx_4NoteDitty_Ch6
	dbw $06, Sfx_4NoteDitty_Ch7
; 17999b

Sfx_4NoteDitty_Ch5: ; 17999b
	togglesfx
	waveduty $2
	notetype $2, $e, $1, $0
	transpose $0, $2
	octave 4
	note C_, 2
	volenvelope $4, $1, $0
	note C_, 2
	volenvelope $e, $1, $0
	note G_, 2
	volenvelope $4, $1, $0
	note G_, 2
	octave 5
	volenvelope $e, $1, $0
	note E_, 2
	volenvelope $4, $1, $0
	note E_, 2
	octave 6
	volenvelope $e, $1, $0
	note C_, 2
	volenvelope $4, $0, $3
	note C_, 16
	endchannel
; 1799bd

Sfx_4NoteDitty_Ch6: ; 1799bd
	togglesfx
	notetype $2, $b, $1, $0
	note __, 9
	note __, 16
	endchannel
; 1799c4

Sfx_4NoteDitty_Ch7: ; 1799c4
	togglesfx
	notetype $2, $b, $1, $0
	note __, 9
	note __, 16
	endchannel
; 1799cb

Sfx_Twinkle: ; 1799cb
	dbw $04, Sfx_Twinkle_Ch5
; 1799ce

Sfx_Twinkle_Ch5: ; 1799ce
	togglesfx
	waveduty $0
	transpose $0, $2
	notetype $2, $e, $0, $1
	octave 3
	note G_, 2
	volenvelope $b, $0, $1
	octave 4
	note D_, 2
	volenvelope $e, $0, $1
	note B_, 2
	volenvelope $b, $0, $1
	note G_, 2
	volenvelope $e, $0, $1
	octave 5
	note D_, 2
	volenvelope $b, $0, $1
	octave 4
	note B_, 2
	volenvelope $e, $0, $1
	octave 5
	note G_, 6
	endchannel
; 1799ef
