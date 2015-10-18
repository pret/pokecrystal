Music_AfterTheRivalFight: ; f5127
	dbw $c0, Music_AfterTheRivalFight_Ch1
	dbw $01, Music_AfterTheRivalFight_Ch2
	dbw $02, Music_AfterTheRivalFight_Ch3
	dbw $03, Music_AfterTheRivalFight_Ch4
; f5133

Music_AfterTheRivalFight_Ch1: ; f5133
	tempo 112
	volume $7, $7
	setwaveduty $0
	setpitchoffset $0001
	vibrato $8, $1, $4
	stereopanning $f0
	notetype $c, $b, $0, $2
	octave 2
	note G#, 4
	note G#, 4
	volenvelope $8, $0, $2
	octave 3
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 0, Music_AfterTheRivalFight_branch_f4fb1
; f5153

Music_AfterTheRivalFight_Ch2: ; f5153
	setwaveduty $1
	vibrato $6, $3, $5
	stereopanning $f
	notetype $c, $c, $0, $2
	octave 4
	note G#, 4
	note G#, 4
	volenvelope $a, $0, $2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	loopchannel 0, Music_AfterTheRivalFight_branch_f502e
; f516a

Music_AfterTheRivalFight_Ch3: ; f516a
	notetype $c, $2, $1, $0
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	loopchannel 0, Music_AfterTheRivalFight_branch_f509d
; f517a

Music_AfterTheRivalFight_Ch4: ; f517a
	togglenoise $3
	stereopanning $f
	notetype $c
	note D_, 4
	note D_, 4
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	loopchannel 0, Music_AfterTheRivalFight_branch_f5118
; f518a


