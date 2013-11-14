Music_LookKimonoGirl: ; f79b8
	dbw $80, Music_LookKimonoGirl_Ch1
	dbw $01, Music_LookKimonoGirl_Ch2
	dbw $02, Music_LookKimonoGirl_Ch3
; f79c1

INCBIN "baserom.gbc", $f79c1, $f79c2 - $f79c1

Music_LookKimonoGirl_Ch1: ; f79c2
	tempo 160
	volume $77
	stereopanning $f
	dutycycle $1
	notetype $6, $87
	tone $0001
	callchannel Music_LookKimonoGirl_branch_f7aa8
	tone $0000

Music_LookKimonoGirl_branch_f79d7: ; f79d7
	notetype $c, $b2
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a34
	callchannel Music_LookKimonoGirl_branch_f7a34
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a34
	intensity $b4
	octave 3
	note E_, 0
	intensity $54
	octave 4
	note E_, 0
	intensity $b4
	octave 3
	note D_, 0
	intensity $54
	octave 4
	note D_, 0
	intensity $b4
	octave 2
	note B_, 0
	intensity $54
	octave 3
	note B_, 0
	intensity $b4
	octave 2
	note A_, 0
	intensity $54
	octave 3
	note A_, 0
	loopchannel 0, Music_LookKimonoGirl_branch_f79d7
; f7a13

Music_LookKimonoGirl_branch_f7a13: ; f7a13
	intensity $b4
	octave 2
	note F_, 0
	intensity $74
	octave 3
	note F_, 0
	intensity $b4
	octave 2
	note A_, 0
	intensity $74
	octave 3
	note A_, 0
	intensity $b4
	octave 2
	note B_, 0
	intensity $74
	octave 3
	note B_, 0
	intensity $b4
	octave 3
	note D_, 0
	intensity $74
	octave 4
	note D_, 0
	endchannel
; f7a34

Music_LookKimonoGirl_branch_f7a34: ; f7a34
	intensity $b4
	octave 2
	note E_, 0
	intensity $74
	octave 3
	note E_, 0
	intensity $b4
	octave 2
	note A_, 0
	intensity $74
	octave 3
	note A_, 0
	intensity $b4
	octave 2
	note B_, 0
	intensity $74
	octave 3
	note B_, 0
	intensity $b4
	octave 3
	note D_, 0
	intensity $74
	octave 4
	note D_, 0
	endchannel
; f7a55

Music_LookKimonoGirl_Ch2: ; f7a55
	dutycycle $0
	notetype $6, $a7
	stereopanning $f0
	callchannel Music_LookKimonoGirl_branch_f7aa8

Music_LookKimonoGirl_branch_f7a5f: ; f7a5f
	dutycycle $3
	notetype $c, $91
	octave 5
	note E_, 0
	note D_, 0
	octave 4
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	note D_, 0
	octave 3
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note E_, 0
	note D_, 0
	callchannel Music_LookKimonoGirl_branch_f7a94
	octave 5
	note F_, 0
	note D_, 0
	octave 4
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 0
	note D_, 0
	note F_, 0
	note D_, 0
	octave 3
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note E_, 0
	note D_, 0
	callchannel Music_LookKimonoGirl_branch_f7a94
	loopchannel 0, Music_LookKimonoGirl_branch_f7a5f
; f7a94

Music_LookKimonoGirl_branch_f7a94: ; f7a94
	octave 5
	note B_, 0
	note A_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	note D_, 0
	octave 4
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	note D_, 0
	octave 3
	note B_, 0
	note E_, 0
	endchannel
; f7aa8

Music_LookKimonoGirl_branch_f7aa8: ; f7aa8
	octave 4
	note E_, 0
	octave 5
	note E_, 15
	note __, 0
	note E_, 1
	note __, 2
	intensity $b7
	note E_, 1
	note __, 1
	intensity $b7
	note E_, 1
	note __, 0
	intensity $a7
	note E_, 1
	note __, 0
	notetype $6, $65
	note E_, 1
	note __, 0
	intensity $54
	note E_, 1
	note __, 0
	intensity $63
	note E_, 1
	note E_, 1
	intensity $91
	note E_, 1
	intensity $a1
	note E_, 0
	notetype $8, $b1
	note E_, 0
	note E_, 0
	endchannel

Music_LookKimonoGirl_Ch3: ; f7ad4
	stereopanning $ff
	vibrato $12, $24
	notetype $6, $13
	note __, 0
	note __, 15
	octave 5
	note E_, 0
	note F_, 0
	note E_, 1
	notetype $c, $13
	note E_, 11
	notetype $6, $13
	octave 5
	note D_, 1
	note E_, 1

Music_LookKimonoGirl_branch_f7aec: ; f7aec
	octave 5
	note D_, 3
	note E_, 3
	note F_, 3
	note A_, 3
	note B_, 3
	note A_, 3
	note B_, 3
	octave 6
	note D_, 3
	note E_, 7
	note F_, 0
	note F#, 0
	note F_, 1
	note D_, 3
	note E_, 7
	note D_, 3
	note E_, 3
	note F_, 7
	note A_, 7
	note B_, 0
	octave 7
	note C_, 0
	octave 6
	note B_, 1
	note A_, 3
	note F_, 3
	note D_, 3
	note E_, 0
	note F_, 0
	note E_, 9
	note F_, 1
	note E_, 1
	note D_, 7
	note E_, 7
	loopchannel 0, Music_LookKimonoGirl_branch_f7aec
; f7b13
