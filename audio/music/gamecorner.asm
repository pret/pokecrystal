Music_GameCorner: ; edd6d
	dbw $c0, Music_GameCorner_Ch1
	dbw $01, Music_GameCorner_Ch2
	dbw $02, Music_GameCorner_Ch3
	dbw $03, Music_GameCorner_Ch4
; edd79


Music_GameCorner_Ch1: ; edd79
	tempo 147
	volume $77
	stereopanning $f
	notetype $c, $91
	note __, 7

Music_GameCorner_branch_edd84: ; edd84
	intensity $91
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede13
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede03
	callchannel Music_GameCorner_branch_ede13
	octave 3
	note __, 1
	note G#, 2
	note G#, 2
	note A#, 1
	note A#, 1
	note G#, 1
	note G_, 1
	intensity $71

Music_GameCorner_branch_eddb1: ; eddb1
	octave 4
	note G#, 0
	octave 5
	note C_, 0
	note F_, 0
	note C_, 0
	loopchannel 4, Music_GameCorner_branch_eddb1

Music_GameCorner_branch_eddbb: ; eddbb
	octave 4
	note A#, 0
	octave 5
	note D_, 0
	note G_, 0
	note D_, 0
	loopchannel 4, Music_GameCorner_branch_eddbb

Music_GameCorner_branch_eddc5: ; eddc5
	octave 4
	note D#, 0
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	loopchannel 4, Music_GameCorner_branch_eddc5

Music_GameCorner_branch_eddd0: ; eddd0
	octave 4
	note F_, 0
	note A_, 0
	octave 5
	note C_, 0
	octave 4
	note A_, 0
	loopchannel 4, Music_GameCorner_branch_eddd0

Music_GameCorner_branch_edddb: ; edddb
	octave 4
	note G#, 0
	octave 5
	note C_, 0
	note F_, 0
	note C_, 0
	loopchannel 4, Music_GameCorner_branch_edddb

Music_GameCorner_branch_edde5: ; edde5
	octave 4
	note A#, 0
	octave 5
	note D_, 0
	note G_, 0
	note D_, 0
	loopchannel 4, Music_GameCorner_branch_edde5

Music_GameCorner_branch_eddef: ; eddef
	octave 4
	note B_, 0
	octave 5
	note D_, 0
	note G_, 0
	note D_, 0
	loopchannel 4, Music_GameCorner_branch_eddef
	octave 3
	note D_, 0
	note D_, 0
	note D_, 2
	note F_, 1
	note F_, 8
	loopchannel 0, Music_GameCorner_branch_edd84
; ede03

Music_GameCorner_branch_ede03: ; ede03
	note __, 1
	octave 4
	note A#, 2
	note G_, 2
	note D#, 2
	octave 3
	note F_, 2
	note F_, 1
	note __, 1
	note G#, 2
	note G#, 2
	note A#, 1
	note A#, 1
	note G#, 0
	note A#, 2
	endchannel
; ede13

Music_GameCorner_branch_ede13: ; ede13
	note __, 1
	octave 4
	note A#, 2
	note G_, 2
	note D#, 2
	octave 3
	note F_, 2
	note F_, 1
	endchannel

Music_GameCorner_Ch2: ; ede1c
	stereopanning $ff
	vibrato $8, $24
	notetype $c, $a1
	note __, 7

Music_GameCorner_branch_ede25: ; ede25
	intensity $92
	dutycycle $1
	callchannel Music_GameCorner_branch_ede75
	octave 1
	note F_, 1
	octave 3
	note G#, 1
	octave 1
	note F_, 0
	octave 3
	note G#, 1
	intensity $a4
	note G#, 2
	intensity $92
	note G_, 1
	note A#, 0
	octave 4
	note C_, 2
	callchannel Music_GameCorner_branch_ede75
	octave 4
	note F_, 1
	note D#, 1
	note F_, 0
	note D#, 1
	intensity $a4
	note G_, 2
	note F_, 3
	dutycycle $2
	intensity $c7
	octave 3
	note D#, 0
	note F_, 0
	note G_, 5
	note F_, 5
	note C_, 3
	note D_, 5
	note D#, 5
	note F_, 3
	note D_, 5
	note C_, 5
	octave 2
	note A#, 3
	note A_, 3
	note __, 9
	octave 3
	note D#, 0
	note F_, 0
	note G_, 5
	note F_, 5
	note C_, 3
	note D_, 5
	note D#, 5
	note F_, 1
	note D#, 0
	note F_, 0
	note G_, 15
	intensity $92
	note G_, 0
	note G_, 0
	note G_, 2
	note A#, 1
	note A#, 8
	intensity $a4
	loopchannel 0, Music_GameCorner_branch_ede25
; ede75

Music_GameCorner_branch_ede75: ; ede75
	octave 1
	note C_, 1
	octave 3
	note D#, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note F_, 1
	octave 1
	note C_, 1
	octave 3
	note D#, 2
	note D#, 2
	note F_, 1
	note F_, 1
	note D#, 0
	note F_, 2
	octave 1
	note C_, 1
	octave 3
	note D#, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note F_, 1
	octave 1
	note C_, 1
	octave 3
	note D#, 2
	note D#, 2
	note F_, 1
	note C_, 1
	note D#, 0
	note F_, 2
	octave 1
	note C_, 1
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	note G_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 0
	note D#, 1
	intensity $a4
	note F_, 2
	note G_, 3
	intensity $92
	note F#, 0
	note F_, 0
	octave 1
	note C_, 1
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	note G_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	octave 1
	note F_, 0
	octave 4
	note F_, 0
	note D#, 1
	note G_, 0
	note D#, 1
	intensity $a4
	note A#, 2
	note A_, 1
	intensity $92
	note A#, 0
	octave 5
	note C_, 2
	octave 1
	note C_, 1
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	note G_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 0
	note D#, 1
	intensity $a4
	note F_, 2
	note G_, 3
	intensity $92
	note F#, 0
	note F_, 0
	octave 1
	note C_, 1
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	note G_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	endchannel

Music_GameCorner_Ch3: ; edee8
	vibrato $8, $22
	notetype $c, $14
	note __, 7

Music_GameCorner_branch_edeef: ; edeef
	stereopanning $ff
	notetype $c, $14
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note G_, 0
	note A_, 2
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note A#, 0
	octave 5
	note C_, 2
	stereopanning $f0
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee024
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	stereopanning $ff
	octave 2
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 2
	note F_, 0
	octave 5
	note C_, 0
	octave 3
	note F_, 0
	octave 5
	note D#, 2
	note D_, 0
	note __, 0
	note D#, 0
	note F_, 0
	note __, 1
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note G_, 0
	note A_, 2
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_edff8
	octave 4
	note A#, 0
	octave 5
	note C_, 2
	stereopanning $f0
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee024
	callchannel Music_GameCorner_branch_edfdd
	callchannel Music_GameCorner_branch_ee00c
	callchannel Music_GameCorner_branch_edfdd
	octave 2
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	intensity $15
	callchannel Music_GameCorner_branch_ee03f
	octave 2
	note C_, 1
	note __, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 2
	note C_, 1
	octave 3
	note C_, 0
	octave 2
	note C_, 0
	note __, 0
	octave 3
	note C_, 0
	octave 2
	note F_, 1
	note __, 0
	note F_, 0
	octave 3
	note F_, 0
	octave 2
	note F_, 0
	note __, 0
	note F_, 0
	note F_, 0
	octave 3
	note F_, 0
	octave 2
	note F_, 1
	octave 3
	note F_, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note F_, 0
	callchannel Music_GameCorner_branch_ee03f
	octave 2
	note G_, 1
	note __, 0
	note G_, 0
	octave 3
	note G_, 0
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note G_, 0
	octave 3
	note G_, 0
	octave 2
	note G_, 1
	octave 3
	note G_, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	octave 2
	note B_, 0
	note B_, 0
	note B_, 0
	note __, 1
	note B_, 0
	note __, 0
	note B_, 0
	note __, 3
	notetype $6, $15
	octave 3
	note D_, 0
	note C_, 0
	octave 2
	note B_, 0
	note A_, 0
	note G_, 0
	note F_, 0
	note E_, 0
	note D_, 0
	loopchannel 0, Music_GameCorner_branch_edeef
; edfdd

Music_GameCorner_branch_edfdd: ; edfdd
	octave 2
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note G_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note G_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note G_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note A_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note A_, 1
	endchannel
; edff8

Music_GameCorner_branch_edff8: ; edff8
	octave 2
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note G_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note G_, 0
	note C_, 0
	octave 3
	note C_, 0
	octave 4
	note A#, 0
	note __, 0
	note A_, 0
	note __, 0
	endchannel
; ee00c

Music_GameCorner_branch_ee00c: ; ee00c
	octave 2
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note C_, 0
	note D_, 2
	endchannel
; ee024

Music_GameCorner_branch_ee024: ; ee024
	octave 2
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note C_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 0
	octave 5
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note C_, 0
	note D_, 0
	octave 3
	note F_, 0
	note __, 0
	endchannel
; ee03f

Music_GameCorner_branch_ee03f: ; ee03f
	octave 2
	note F_, 1
	note __, 0
	note F_, 0
	octave 3
	note F_, 0
	octave 2
	note F_, 0
	note __, 0
	note F_, 0
	note F_, 0
	octave 3
	note F_, 0
	octave 2
	note F_, 1
	octave 3
	note F_, 0
	octave 2
	note F_, 0
	note __, 0
	octave 3
	note F_, 0
	octave 2
	note G_, 1
	note __, 0
	note G_, 0
	octave 3
	note G_, 0
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note G_, 0
	octave 3
	note G_, 0
	octave 2
	note F_, 0
	octave 3
	note F_, 0
	octave 2
	note D#, 0
	octave 3
	note D#, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	endchannel

Music_GameCorner_Ch4: ; ee06f
	togglenoise $3
	notetype $c
	notetype $8
	note D_, 0
	note D_, 0
	note D_, 0
	notetype $c
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 0
	note D_, 0

Music_GameCorner_branch_ee07f: ; ee07f
	callchannel Music_GameCorner_branch_ee106

Music_GameCorner_branch_ee082: ; ee082
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 6, Music_GameCorner_branch_ee082
	callchannel Music_GameCorner_branch_ee10f

Music_GameCorner_branch_ee091: ; ee091
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GameCorner_branch_ee091
	note __, 11
	note D_, 0
	note D_, 0
	note F#, 1
	callchannel Music_GameCorner_branch_ee106

Music_GameCorner_branch_ee0a4: ; ee0a4
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 6, Music_GameCorner_branch_ee0a4
	callchannel Music_GameCorner_branch_ee10f

Music_GameCorner_branch_ee0b3: ; ee0b3
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GameCorner_branch_ee0b3
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0

Music_GameCorner_branch_ee0c9: ; ee0c9
	note A#, 1
	note F#, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note D#, 0
	note D_, 0
	note F#, 0
	note D#, 0
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GameCorner_branch_ee0c9
	note A#, 1
	note F#, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note D#, 0
	note D_, 0
	note F#, 0
	note D#, 0
	note D_, 1
	note D_, 0
	note D_, 0

Music_GameCorner_branch_ee0e8: ; ee0e8
	note A#, 1
	note F#, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note D#, 0
	note D_, 0
	note F#, 0
	note D#, 0
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GameCorner_branch_ee0e8
	note D_, 0
	note D_, 0
	note D_, 1
	note A#, 0
	note F#, 1
	note F#, 4
	note D_, 0
	note D_, 0
	note D#, 1
	loopchannel 0, Music_GameCorner_branch_ee07f
; ee106

Music_GameCorner_branch_ee106: ; ee106
	note C_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	endchannel
; ee10f

Music_GameCorner_branch_ee10f: ; ee10f
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note F#, 1
	endchannel
; ee119
