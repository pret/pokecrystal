Music_PalletTown: ; f4b0c
	dbw $80, Music_PalletTown_Ch1
	dbw $01, Music_PalletTown_Ch2
	dbw $02, Music_PalletTown_Ch3
; f4b15

Music_PalletTown_Ch1: ; f4b15
	tempo 188
	volume $7, $7
	vibrato $12, $2, $4
	pitchoffset $0001
	stereopanning $f
Music_PalletTown_branch_f4b22: ; f4b22
	waveduty $2
	notetype $c, $7, $1, $0
	octave 3
	note B_, 12
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note B_, 12
	note D#, 1
	note G_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 4
	volenvelope $7, $0, $7
	note G_, 8
	volenvelope $7, $1, $0
	note F#, 4
	note A_, 4
	note B_, 12
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	note G_, 4
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 8
	volenvelope $7, $0, $7
	note B_, 8
Music_PalletTown_branch_f4b59: ; f4b59
	waveduty $3
	volenvelope $9, $0, $2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	volenvelope $5, $1, $7
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	note G_, 4
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	loopchannel 2, Music_PalletTown_branch_f4b59
	volenvelope $3, $1, $7
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 4
	note D_, 4
	note E_, 4
	volenvelope $7, $0, $2
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note A_, 1
	octave 5
	note D_, 2
	volenvelope $6, $0, $2
	note D_, 2
	volenvelope $2, $0, $2
	note D_, 2
	volenvelope $2, $1, $7
	octave 3
	note D_, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	volenvelope $1, $1, $7
	note F#, 8
	loopchannel 0, Music_PalletTown_branch_f4b22
; f4ba1

Music_PalletTown_Ch2: ; f4ba1
	vibrato $12, $4, $4
	waveduty $2
	stereopanning $f0
Music_PalletTown_branch_f4ba8: ; f4ba8
	notetype $c, $8, $1, $0
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	note F#, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	octave 1
	note B_, 4
	octave 2
	note C_, 2
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note C_, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note D_, 2
	note __, 4
	note D_, 4
	note F#, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 2
	note G_, 6
	note F#, 4
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note B_, 4
	octave 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 8
	note A_, 8
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
Music_PalletTown_branch_f4be5: ; f4be5
	volenvelope $a, $0, $2
	octave 3
	note E_, 2
	octave 2
	note C_, 2
	octave 3
	note E_, 2
	octave 2
	note C_, 2
	octave 3
	note D#, 2
	octave 2
	note C_, 2
	octave 3
	note D#, 2
	octave 2
	note C_, 2
	volenvelope $9, $0, $3
	note G_, 6
	note G_, 1
	note G_, 3
	note D_, 2
	note G_, 4
	loopchannel 2, Music_PalletTown_branch_f4be5
	note C_, 2
	octave 3
	note E_, 4
	octave 2
	note C_, 1
	octave 3
	note C_, 3
	octave 2
	note C_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 3
	note D_, 4
	octave 2
	note D_, 1
	note G_, 3
	note E_, 2
	note G_, 2
	note E_, 2
	volenvelope $1, $1, $7
	note F#, 4
	volenvelope $8, $1, $0
	note F#, 4
	note B_, 4
	note G_, 4
	note A_, 2
	note D_, 2
	note G_, 2
	note D_, 4
	note C_, 2
	octave 1
	note B_, 2
	note A_, 2
	loopchannel 0, Music_PalletTown_branch_f4ba8
; f4c2a

Music_PalletTown_Ch3: ; f4c2a
	vibrato $14, $2, $4
Music_PalletTown_branch_f4c2d: ; f4c2d
	notetype $c, $1, $0, $0
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	octave 6
	note G_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 6
	octave 5
	note B_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note C_, 8
	note __, 2
	octave 5
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 6
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 8
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	octave 6
	note D_, 2
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 6
	note D_, 1
	note __, 1
	note D_, 8
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 2
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 8
	note __, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 8
	note D_, 6
	note C_, 2
	octave 5
	note B_, 8
	note __, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	note __, 2
	note C_, 4
	note D_, 6
	note C_, 1
	note D_, 1
	octave 5
	note B_, 8
	note __, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 8
	note E_, 4
	note B_, 4
	note A_, 8
	note G_, 4
	note E_, 4
	note F#, 7
	note __, 1
	note G_, 3
	note __, 1
	note B_, 3
	note __, 1
	note B_, 8
	note A_, 8
	loopchannel 0, Music_PalletTown_branch_f4c2d
; f4c9f


