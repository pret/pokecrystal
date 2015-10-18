Music_CherrygroveCity: ; f5b03
	dbw $c0, Music_CherrygroveCity_Ch1
	dbw $01, Music_CherrygroveCity_Ch2
	dbw $02, Music_CherrygroveCity_Ch3
	dbw $03, Music_CherrygroveCity_Ch4
; f5b0f

Music_CherrygroveCity_Ch1: ; f5b0f
	tempo 152
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0001
	vibrato $8, $1, $5
	stereopanning $f0
	notetype $c, $b, $0, $5
	note __, 10
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
Music_CherrygroveCity_branch_f5b26: ; f5b26
	note A_, 4
	note G#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 6
	note F_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 6
	note E_, 2
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note C_, 2
	volenvelope $b, $0, $7
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note A#, 4
	note A_, 6
	note F_, 2
	note C_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	volenvelope $b, $0, $5
	note A_, 4
	note G_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note A#, 4
	note A_, 6
	note F_, 2
	note C_, 4
	octave 2
	note B_, 4
	note A#, 6
	octave 3
	note C#, 2
	octave 2
	note A#, 4
	note G_, 4
	note A_, 4
	octave 3
	note C_, 4
	octave 2
	note A_, 4
	octave 3
	note C_, 4
	loopchannel 0, Music_CherrygroveCity_branch_f5b26
; f5b74

Music_CherrygroveCity_Ch2: ; f5b74
	setwaveduty $3
	vibrato $10, $3, $6
	stereopanning $f
	notetype $c, $c, $0, $3
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note A#, 2
Music_CherrygroveCity_branch_f5b87: ; f5b87
	volenvelope $c, $0, $6
	octave 4
	note C_, 6
	note D_, 4
	volenvelope $b, $0, $3
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	volenvelope $c, $0, $7
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	note F_, 8
	volenvelope $c, $0, $6
	note A#, 6
	octave 4
	note C_, 4
	volenvelope $b, $0, $3
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	volenvelope $c, $0, $7
	note A#, 6
	note G_, 2
	note E_, 8
	volenvelope $a, $0, $0
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	note C_, 6
	volenvelope $a, $0, $5
	octave 3
	note A_, 2
	volenvelope $c, $0, $7
	note F_, 8
	volenvelope $a, $0, $0
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	volenvelope $c, $0, $7
	note C_, 16
	volenvelope $b, $0, $5
	octave 3
	note D_, 6
	note F_, 6
	octave 4
	note D_, 4
	note C_, 6
	octave 3
	note A_, 2
	note F_, 8
	note C#, 6
	note F_, 6
	note G_, 4
	volenvelope $a, $0, $0
	note F_, 8
	volenvelope $a, $0, $7
	note F_, 8
	loopchannel 0, Music_CherrygroveCity_branch_f5b87
; f5bd8

Music_CherrygroveCity_Ch3: ; f5bd8
	notetype $c, $1, $0, $6
	note __, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
Music_CherrygroveCity_branch_f5be4: ; f5be4
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 4
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note F_, 4
	note A#, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	loopchannel 0, Music_CherrygroveCity_branch_f5be4
; f5c48

Music_CherrygroveCity_Ch4: ; f5c48
	togglenoise $3
	notetype $c
	note __, 16
Music_CherrygroveCity_branch_f5c4d: ; f5c4d
	note C#, 2
	note __, 2
	note G_, 2
	note C#, 2
	note C#, 2
	note F#, 2
	note C#, 4
	note C#, 2
	note __, 2
	note G_, 2
	note C#, 1
	note C#, 1
	note F#, 4
	note C#, 2
	note G_, 2
	loopchannel 0, Music_CherrygroveCity_branch_f5c4d
; f5c60


