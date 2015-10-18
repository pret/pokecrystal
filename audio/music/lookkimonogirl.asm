Music_LookKimonoGirl: ; f79b8
	dbw $80, Music_LookKimonoGirl_Ch1
	dbw $01, Music_LookKimonoGirl_Ch2
	dbw $02, Music_LookKimonoGirl_Ch3
; f79c1


INCBIN "baserom.gbc", $f79c1, $f79c2 - $f79c1


Music_LookKimonoGirl_Ch1: ; f79c2
	tempo 160
	volume $7, $7
	stereopanning $f
	setwaveduty $1
	notetype $6, $8, $0, $7
	setpitchoffset $0001
	callchannel Music_LookKimonoGirl_branch_f7aa8
	setpitchoffset $0000
Music_LookKimonoGirl_branch_f79d7: ; f79d7
	notetype $c, $b, $0, $2
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a34
	callchannel Music_LookKimonoGirl_branch_f7a34
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a13
	callchannel Music_LookKimonoGirl_branch_f7a34
	volenvelope $b, $0, $4
	octave 3
	note E_, 1
	volenvelope $5, $0, $4
	octave 4
	note E_, 1
	volenvelope $b, $0, $4
	octave 3
	note D_, 1
	volenvelope $5, $0, $4
	octave 4
	note D_, 1
	volenvelope $b, $0, $4
	octave 2
	note B_, 1
	volenvelope $5, $0, $4
	octave 3
	note B_, 1
	volenvelope $b, $0, $4
	octave 2
	note A_, 1
	volenvelope $5, $0, $4
	octave 3
	note A_, 1
	loopchannel 0, Music_LookKimonoGirl_branch_f79d7
; f7a13

Music_LookKimonoGirl_branch_f7a13: ; f7a13
	volenvelope $b, $0, $4
	octave 2
	note F_, 1
	volenvelope $7, $0, $4
	octave 3
	note F_, 1
	volenvelope $b, $0, $4
	octave 2
	note A_, 1
	volenvelope $7, $0, $4
	octave 3
	note A_, 1
	volenvelope $b, $0, $4
	octave 2
	note B_, 1
	volenvelope $7, $0, $4
	octave 3
	note B_, 1
	volenvelope $b, $0, $4
	octave 3
	note D_, 1
	volenvelope $7, $0, $4
	octave 4
	note D_, 1
	endchannel
; f7a34

Music_LookKimonoGirl_branch_f7a34: ; f7a34
	volenvelope $b, $0, $4
	octave 2
	note E_, 1
	volenvelope $7, $0, $4
	octave 3
	note E_, 1
	volenvelope $b, $0, $4
	octave 2
	note A_, 1
	volenvelope $7, $0, $4
	octave 3
	note A_, 1
	volenvelope $b, $0, $4
	octave 2
	note B_, 1
	volenvelope $7, $0, $4
	octave 3
	note B_, 1
	volenvelope $b, $0, $4
	octave 3
	note D_, 1
	volenvelope $7, $0, $4
	octave 4
	note D_, 1
	endchannel
; f7a55

Music_LookKimonoGirl_Ch2: ; f7a55
	setwaveduty $0
	notetype $6, $a, $0, $7
	stereopanning $f0
	callchannel Music_LookKimonoGirl_branch_f7aa8
Music_LookKimonoGirl_branch_f7a5f: ; f7a5f
	setwaveduty $3
	notetype $c, $9, $0, $1
	octave 5
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	callchannel Music_LookKimonoGirl_branch_f7a94
	octave 5
	note F_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	callchannel Music_LookKimonoGirl_branch_f7a94
	loopchannel 0, Music_LookKimonoGirl_branch_f7a5f
; f7a94

Music_LookKimonoGirl_branch_f7a94: ; f7a94
	octave 5
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note E_, 1
	endchannel
; f7aa8

Music_LookKimonoGirl_branch_f7aa8: ; f7aa8
	octave 4
	note E_, 1
	octave 5
	note E_, 16
	note __, 1
	note E_, 2
	note __, 3
	volenvelope $b, $0, $7
	note E_, 2
	note __, 2
	volenvelope $b, $0, $7
	note E_, 2
	note __, 1
	volenvelope $a, $0, $7
	note E_, 2
	note __, 1
	notetype $6, $6, $0, $5
	note E_, 2
	note __, 1
	volenvelope $5, $0, $4
	note E_, 2
	note __, 1
	volenvelope $6, $0, $3
	note E_, 2
	note E_, 2
	volenvelope $9, $0, $1
	note E_, 2
	volenvelope $a, $0, $1
	note E_, 1
	notetype $8, $b, $0, $1
	note E_, 1
	note E_, 1
	endchannel
; f7ad4

Music_LookKimonoGirl_Ch3: ; f7ad4
	stereopanning $ff
	vibrato $12, $2, $4
	notetype $6, $1, $0, $3
	note __, 1
	note __, 16
	octave 5
	note E_, 1
	note F_, 1
	note E_, 2
	notetype $c, $1, $0, $3
	note E_, 12
	notetype $6, $1, $0, $3
	octave 5
	note D_, 2
	note E_, 2
Music_LookKimonoGirl_branch_f7aec: ; f7aec
	octave 5
	note D_, 4
	note E_, 4
	note F_, 4
	note A_, 4
	note B_, 4
	note A_, 4
	note B_, 4
	octave 6
	note D_, 4
	note E_, 8
	note F_, 1
	note F#, 1
	note F_, 2
	note D_, 4
	note E_, 8
	note D_, 4
	note E_, 4
	note F_, 8
	note A_, 8
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 2
	note A_, 4
	note F_, 4
	note D_, 4
	note E_, 1
	note F_, 1
	note E_, 10
	note F_, 2
	note E_, 2
	note D_, 8
	note E_, 8
	loopchannel 0, Music_LookKimonoGirl_branch_f7aec
; f7b13


