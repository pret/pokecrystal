Music_LookLass: ; ed79b
	dbw $c0, Music_LookLass_Ch1
	dbw $01, Music_LookLass_Ch2
	dbw $02, Music_LookLass_Ch3
	dbw $03, Music_LookLass_Ch4
; ed7a7

Music_LookLass_Ch1: ; ed7a7
	tempo 132
	volume $7, $7
	pitchoffset $0001
	waveduty $2
	notetype $c, $c, $0, $7
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note B_, 14
	stereopanning $f
	waveduty $0
Music_LookLass_branch_ed7bd: ; ed7bd
	volenvelope $a, $0, $2
	octave 3
	note E_, 4
	volenvelope $a, $0, $1
	note E_, 4
	note E_, 4
	note E_, 2
	volenvelope $a, $0, $3
	note B_, 2
	loopchannel 0, Music_LookLass_branch_ed7bd
; ed7cd

Music_LookLass_Ch2: ; ed7cd
	stereopanning $f0
	waveduty $0
	notetype $c, $8, $0, $3
	note __, 16
Music_LookLass_branch_ed7d5: ; ed7d5
	volenvelope $9, $0, $2
	octave 2
	note B_, 4
	volenvelope $9, $0, $1
	note B_, 4
	note B_, 4
	note B_, 2
	volenvelope $9, $0, $3
	octave 3
	note G#, 2
	loopchannel 0, Music_LookLass_branch_ed7d5
; ed7e6

Music_LookLass_Ch3: ; ed7e6
	notetype $c, $1, $0, $0
	note __, 8
	octave 6
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
Music_LookLass_branch_ed7ef: ; ed7ef
	octave 5
	note B_, 2
	note __, 2
	octave 6
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C#, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	octave 6
	note C#, 2
	octave 5
	note B_, 2
	note __, 2
	octave 6
	note C#, 2
	note __, 2
	octave 5
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	loopchannel 0, Music_LookLass_branch_ed7ef
; ed81a

Music_LookLass_Ch4: ; ed81a
	drumkittoggle $4
	notetype $c
	note C_, 16
Music_LookLass_branch_ed81f: ; ed81f
	notetype $6
	note D_, 8
	note C#, 8
	note C#, 8
	note C#, 4
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 0, Music_LookLass_branch_ed81f
; ed82d


