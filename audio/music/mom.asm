Music_Mom: ; f6bf2
	dbw $81, Music_Mom_Ch2
	dbw $02, Music_Mom_Ch3
	dbw $03, Music_Mom_Ch4
; f6bfb


Music_Mom_Ch2: ; f6bfb
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $2
	notetype $6, $b3
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note G#, 0
	note A_, 0
	note B_, 7

Music_Mom_branch_f6c0e: ; f6c0e
	notetype $c, $b1
	note __, 3
	octave 3
	note C#, 5
	note D_, 3
	note C_, 1
	note __, 1
	note C#, 5
	octave 2
	note E_, 3
	note A#, 1
	note B_, 1
	loopchannel 0, Music_Mom_branch_f6c0e

Music_Mom_Ch3: ; f6c20
	stereopanning $f0
	notetype $6, $25
	octave 3
	note E_, 0
	note D_, 0
	octave 2
	note B_, 0
	note G#, 0
	note E_, 7
	intensity $23

Music_Mom_branch_f6c2e: ; f6c2e
	octave 2
	note A_, 1
	note __, 5
	octave 4
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 7
	note D#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 5
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 5
	note C#, 3
	note D_, 1
	note __, 1
	loopchannel 0, Music_Mom_branch_f6c2e

Music_Mom_Ch4: ; f6c51
	togglenoise $3
	notetype $c
	note __, 5

Music_Mom_branch_f6c56: ; f6c56
	note D#, 0
	note __, 0
	note F#, 1
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 3
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note F#, 3
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note D_, 1
	note D#, 0
	note __, 0
	loopchannel 0, Music_Mom_branch_f6c56
; f6c72
