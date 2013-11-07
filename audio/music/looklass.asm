Music_LookLass: ; ed79b
	dbw $c0, Music_LookLass_Ch1
	dbw $01, Music_LookLass_Ch2
	dbw $02, Music_LookLass_Ch3
	dbw $03, Music_LookLass_Ch4
; ed7a7


Music_LookLass_Ch1: ; ed7a7
	tempo 132
	volume $77
	tone $0001
	dutycycle $2
	notetype $c, $c7
	octave 3
	note B_, 0
	note __, 0
	octave 4
	note B_, 13
	stereopanning $f
	dutycycle $0

Music_LookLass_branch_ed7bd: ; ed7bd
	intensity $a2
	octave 3
	note E_, 3
	intensity $a1
	note E_, 3
	note E_, 3
	note E_, 1
	intensity $a3
	note B_, 1
	loopchannel 0, Music_LookLass_branch_ed7bd

Music_LookLass_Ch2: ; ed7cd
	stereopanning $f0
	dutycycle $0
	notetype $c, $83
	note __, 15

Music_LookLass_branch_ed7d5: ; ed7d5
	intensity $92
	octave 2
	note B_, 3
	intensity $91
	note B_, 3
	note B_, 3
	note B_, 1
	intensity $93
	octave 3
	note G#, 1
	loopchannel 0, Music_LookLass_branch_ed7d5

Music_LookLass_Ch3: ; ed7e6
	notetype $c, $10
	note __, 7
	octave 6
	note E_, 1
	note D#, 1
	note C#, 1
	note C_, 1

Music_LookLass_branch_ed7ef: ; ed7ef
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	loopchannel 0, Music_LookLass_branch_ed7ef

Music_LookLass_Ch4: ; ed81a
	togglenoise $4
	notetype $c
	note C_, 15

Music_LookLass_branch_ed81f: ; ed81f
	notetype $6
	note D_, 7
	note C#, 7
	note C#, 7
	note C#, 3
	note D_, 0
	note C#, 0
	note C#, 0
	note C#, 0
	loopchannel 0, Music_LookLass_branch_ed81f
; ed82d
