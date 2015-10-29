Music_HallOfFame: ; f05bf
	dbw $c0, Music_HallOfFame_Ch1
	dbw $01, Music_HallOfFame_Ch2
	dbw $02, Music_HallOfFame_Ch3
	dbw $03, Music_HallOfFame_Ch4
; f05cb

Music_HallOfFame_Ch1: ; f05cb
	tempo 112
	volume $7, $7
	waveduty $2
	vibrato $c, $2, $2
	pitchoffset $0001
	stereopanning $f0
	notetype $c, $9, $0, $3
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
Music_HallOfFame_branch_f05e6: ; f05e6
	volenvelope $9, $0, $7
	octave 4
	note C_, 8
	volenvelope $7, $0, $7
	note C_, 8
	volenvelope $9, $0, $7
	note E_, 8
	volenvelope $7, $0, $7
	note E_, 8
	volenvelope $9, $0, $7
	note F#, 8
	volenvelope $7, $0, $7
	note F#, 8
	volenvelope $7, $0, $7
	note F_, 8
	volenvelope $5, $0, $7
	note F_, 8
	loopchannel 3, Music_HallOfFame_branch_f05e6
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, Music_HallOfFame_branch_f05e6
; f060b

Music_HallOfFame_Ch2: ; f060b
	vibrato $8, $2, $5
	waveduty $3
Music_HallOfFame_branch_f0610: ; f0610
	notetype $c, $c, $0, $4
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	loopchannel 0, Music_HallOfFame_branch_f0610
; f062e

Music_HallOfFame_Ch3: ; f062e
Music_HallOfFame_branch_f062e: ; f062e
	notetype $c, $2, $1, $0
Music_HallOfFame_branch_f0631: ; f0631
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	loopchannel 3, Music_HallOfFame_branch_f0631
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	loopchannel 0, Music_HallOfFame_branch_f062e
; f066d

Music_HallOfFame_Ch4: ; f066d
	drumkittoggle $5
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $6
Music_HallOfFame_branch_f0677: ; f0677
	stereopanning $f
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	note A#, 4
	stereopanning $f0
	note A_, 2
	note A_, 2
	note A#, 2
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	stereopanning $f
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	loopchannel 0, Music_HallOfFame_branch_f0677
; f0697


