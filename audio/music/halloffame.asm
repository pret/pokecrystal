Music_HallOfFame: ; f05bf
	dbw $c0, Music_HallOfFame_Ch1
	dbw $01, Music_HallOfFame_Ch2
	dbw $02, Music_HallOfFame_Ch3
	dbw $03, Music_HallOfFame_Ch4
; f05cb


Music_HallOfFame_Ch1: ; f05cb
	tempo 112
	volume $77
	dutycycle $2
	vibrato $c, $22
	tone $0001
	stereopanning $f0
	notetype $c, $93
	note __, 15
	note __, 15
	note __, 15
	note __, 11
	octave 3
	note D_, 0
	note E_, 0
	note F_, 0
	note F#, 0

Music_HallOfFame_branch_f05e6: ; f05e6
	intensity $97
	octave 4
	note C_, 7
	intensity $77
	note C_, 7
	intensity $97
	note E_, 7
	intensity $77
	note E_, 7
	intensity $97
	note F#, 7
	intensity $77
	note F#, 7
	intensity $77
	note F_, 7
	intensity $57
	note F_, 7
	loopchannel 3, Music_HallOfFame_branch_f05e6
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	loopchannel 0, Music_HallOfFame_branch_f05e6

Music_HallOfFame_Ch2: ; f060b
	vibrato $8, $25
	dutycycle $3

Music_HallOfFame_branch_f0610: ; f0610
	notetype $c, $c4
	octave 3
	note G_, 1
	note D_, 1
	note G_, 1
	note A_, 9
	note G_, 1
	note D_, 1
	note G_, 1
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note A_, 9
	note F_, 1
	note C_, 1
	note F_, 1
	note A#, 3
	note A_, 3
	note F_, 1
	loopchannel 0, Music_HallOfFame_branch_f0610

Music_HallOfFame_branch_f062e: ; f062e

Music_HallOfFame_Ch3: ; f062e
	notetype $c, $28

Music_HallOfFame_branch_f0631: ; f0631
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note C_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	loopchannel 3, Music_HallOfFame_branch_f0631
	note D_, 3
	note G_, 3
	note D_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	note F#, 3
	note A_, 3
	note F#, 3
	note A_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note G_, 3
	loopchannel 0, Music_HallOfFame_branch_f062e

Music_HallOfFame_Ch4: ; f066d
	togglenoise $5
	notetype $c
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	notetype $6

Music_HallOfFame_branch_f0677: ; f0677
	stereopanning $f
	note A#, 3
	note A#, 7
	note A#, 3
	note A#, 3
	note A#, 3
	stereopanning $f0
	note A_, 1
	note A_, 1
	note A#, 1
	note A#, 1
	note A#, 3
	note A#, 3
	note A#, 7
	note A#, 3
	note A#, 3
	stereopanning $f
	note A#, 0
	note A#, 0
	note A_, 0
	note A_, 0
	note A#, 0
	note A#, 0
	note A#, 0
	note A#, 0
	loopchannel 0, Music_HallOfFame_branch_f0677
; f0697
