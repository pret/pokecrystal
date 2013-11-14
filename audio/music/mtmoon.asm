Music_MtMoon: ; edb29
	dbw $c0, Music_MtMoon_Ch1
	dbw $01, Music_MtMoon_Ch2
	dbw $02, Music_MtMoon_Ch3
	dbw $03, Music_MtMoon_Ch4
; edb35


Music_MtMoon_Ch1: ; edb35
	tempo 208
	volume $77
	dutycycle $2
	tone $0001
	vibrato $8, $14
	stereopanning $f0
	notetype $c, $45
	note __, 1
	loopchannel 0, Music_MtMoon_branch_edb56
; edb4c

Music_MtMoon_Ch2: ; edb4c
	vibrato $b, $15
	dutycycle $2
	notetype $c, $84
	stereopanning $f

Music_MtMoon_branch_edb56: ; edb56
	octave 4
	note D#, 5
	note C#, 5
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note C#, 5
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note C#, 5
	octave 3
	note B_, 1
	note A#, 1
	note B_, 5
	octave 4
	note C#, 9
	note G#, 5
	note F#, 5
	note E_, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	note F#, 5
	note E_, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	note F#, 5
	note E_, 1
	note D#, 1
	note E_, 5
	note F#, 5
	note E_, 3
	loopchannel 0, Music_MtMoon_branch_edb56

Music_MtMoon_Ch3: ; edb8a

Music_MtMoon_branch_edb8a: ; edb8a
	notetype $c, $28

Music_MtMoon_branch_edb8d: ; edb8d
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note G_, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note G_, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	loopchannel 3, Music_MtMoon_branch_edb8d
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note G_, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note G_, 1
	note D#, 1
	note E_, 1

Music_MtMoon_branch_edbab: ; edbab
	note E_, 1
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G#, 1
	loopchannel 4, Music_MtMoon_branch_edbab
	loopchannel 0, Music_MtMoon_branch_edb8a

Music_MtMoon_Ch4: ; edbbf
	togglenoise $5
	notetype $c

Music_MtMoon_branch_edbc3: ; edbc3
	stereopanning $f
	note A#, 3
	note A#, 7
	note A#, 3
	stereopanning $f0
	note A#, 3
	note A#, 3
	note A#, 3
	stereopanning $f
	note A#, 3
	note A#, 3
	stereopanning $f0
	note A#, 7
	loopchannel 0, Music_MtMoon_branch_edbc3
; edbd8
