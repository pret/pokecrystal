Music_CherrygroveCity: ; f5b03
	dbw $c0, Music_CherrygroveCity_Ch1
	dbw $01, Music_CherrygroveCity_Ch2
	dbw $02, Music_CherrygroveCity_Ch3
	dbw $03, Music_CherrygroveCity_Ch4
; f5b0f


Music_CherrygroveCity_Ch1: ; f5b0f
	tempo 152
	volume $77
	dutycycle $3
	tone $0001
	vibrato $8, $15
	stereopanning $f0
	notetype $c, $b5
	note __, 9
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1

Music_CherrygroveCity_branch_f5b26: ; f5b26
	note A_, 3
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 5
	note F_, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	note E_, 1
	note G_, 3
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 5
	note E_, 1
	note C_, 1
	octave 2
	note A#, 1
	note A_, 1
	octave 3
	note C_, 1
	intensity $b7
	octave 2
	note A#, 5
	octave 3
	note D_, 5
	note A#, 3
	note A_, 5
	note F_, 1
	note C_, 7
	octave 2
	note A#, 5
	octave 3
	note D_, 5
	intensity $b5
	note A_, 3
	note G_, 3
	note E_, 3
	note D_, 3
	note E_, 3
	octave 2
	note A#, 5
	octave 3
	note D_, 5
	note A#, 3
	note A_, 5
	note F_, 1
	note C_, 3
	octave 2
	note B_, 3
	note A#, 5
	octave 3
	note C#, 1
	octave 2
	note A#, 3
	note G_, 3
	note A_, 3
	octave 3
	note C_, 3
	octave 2
	note A_, 3
	octave 3
	note C_, 3
	loopchannel 0, Music_CherrygroveCity_branch_f5b26

Music_CherrygroveCity_Ch2: ; f5b74
	dutycycle $3
	vibrato $10, $36
	stereopanning $f
	notetype $c, $c3
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note A#, 1

Music_CherrygroveCity_branch_f5b87: ; f5b87
	intensity $c6
	octave 4
	note C_, 5
	note D_, 3
	intensity $b3
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	intensity $c7
	octave 4
	note C_, 5
	octave 3
	note A_, 1
	note F_, 7
	intensity $c6
	note A#, 5
	octave 4
	note C_, 3
	intensity $b3
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	intensity $c7
	note A#, 5
	note G_, 1
	note E_, 7
	intensity $a0
	note D_, 5
	note F_, 5
	octave 4
	note D_, 3
	note C_, 5
	intensity $a5
	octave 3
	note A_, 1
	intensity $c7
	note F_, 7
	intensity $a0
	note D_, 5
	note F_, 5
	octave 4
	note D_, 3
	intensity $c7
	note C_, 15
	intensity $b5
	octave 3
	note D_, 5
	note F_, 5
	octave 4
	note D_, 3
	note C_, 5
	octave 3
	note A_, 1
	note F_, 7
	note C#, 5
	note F_, 5
	note G_, 3
	intensity $a0
	note F_, 7
	intensity $a7
	note F_, 7
	loopchannel 0, Music_CherrygroveCity_branch_f5b87

Music_CherrygroveCity_Ch3: ; f5bd8
	notetype $c, $16
	note __, 3
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1

Music_CherrygroveCity_branch_f5be4: ; f5be4
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 3
	octave 3
	note F_, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 3
	octave 3
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 4
	note C_, 3
	octave 3
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 3
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 3
	note A#, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note F_, 3
	note A#, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note F_, 3
	note A#, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note C#, 1
	note F_, 3
	note A#, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	loopchannel 0, Music_CherrygroveCity_branch_f5be4

Music_CherrygroveCity_Ch4: ; f5c48
	togglenoise $3
	notetype $c
	note __, 15

Music_CherrygroveCity_branch_f5c4d: ; f5c4d
	note C#, 1
	note __, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note F#, 1
	note C#, 3
	note C#, 1
	note __, 1
	note G_, 1
	note C#, 0
	note C#, 0
	note F#, 3
	note C#, 1
	note G_, 1
	loopchannel 0, Music_CherrygroveCity_branch_f5c4d
; f5c60
