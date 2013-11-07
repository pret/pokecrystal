Music_PalletTown: ; f4b0c
	dbw $80, Music_PalletTown_Ch1
	dbw $01, Music_PalletTown_Ch2
	dbw $02, Music_PalletTown_Ch3
; f4b15


Music_PalletTown_Ch1: ; f4b15
	tempo 188
	volume $77
	vibrato $12, $24
	tone $0001
	stereopanning $f

Music_PalletTown_branch_f4b22: ; f4b22
	dutycycle $2
	notetype $c, $78
	octave 3
	note B_, 11
	note A_, 0
	note D_, 0
	note F#, 0
	note A_, 0
	note B_, 11
	note D#, 0
	note G_, 0
	note B_, 0
	octave 4
	note D#, 0
	note E_, 3
	note D_, 3
	note C_, 3
	octave 3
	note A_, 3
	intensity $77
	note G_, 7
	intensity $78
	note F#, 3
	note A_, 3
	note B_, 11
	note A_, 0
	note D_, 0
	note F#, 0
	note A_, 0
	note G_, 1
	note B_, 1
	octave 4
	note E_, 1
	note G_, 3
	note F#, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 7
	intensity $77
	note B_, 7

Music_PalletTown_branch_f4b59: ; f4b59
	dutycycle $3
	intensity $92
	note G_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	intensity $5f
	note G_, 0
	note A_, 0
	note B_, 0
	octave 4
	note C_, 0
	note D_, 1
	note G_, 3
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	loopchannel 2, Music_PalletTown_branch_f4b59
	intensity $3f
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note A_, 3
	note G_, 3
	note F#, 3
	note D_, 3
	note E_, 3
	intensity $72
	note C_, 0
	note E_, 0
	note G_, 0
	octave 4
	note C_, 0
	note D_, 0
	note A_, 0
	octave 5
	note D_, 1
	intensity $62
	note D_, 1
	intensity $22
	note D_, 1
	intensity $2f
	octave 3
	note D_, 3
	note E_, 3
	note G_, 5
	note A_, 0
	note G_, 0
	intensity $1f
	note F#, 7
	loopchannel 0, Music_PalletTown_branch_f4b22

Music_PalletTown_Ch2: ; f4ba1
	vibrato $12, $44
	dutycycle $2
	stereopanning $f0

Music_PalletTown_branch_f4ba8: ; f4ba8
	notetype $c, $88
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	note G_, 5
	note F#, 3
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	note G_, 5
	octave 1
	note B_, 3
	octave 2
	note C_, 1
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note C_, 3
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note D_, 1
	note __, 3
	note D_, 3
	note F#, 3
	octave 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	note G_, 5
	note F#, 3
	note E_, 1
	note D_, 1
	note E_, 1
	octave 1
	note B_, 3
	octave 2
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 7
	note A_, 7
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note D_, 3
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1

Music_PalletTown_branch_f4be5: ; f4be5
	intensity $a2
	octave 3
	note E_, 1
	octave 2
	note C_, 1
	octave 3
	note E_, 1
	octave 2
	note C_, 1
	octave 3
	note D#, 1
	octave 2
	note C_, 1
	octave 3
	note D#, 1
	octave 2
	note C_, 1
	intensity $93
	note G_, 5
	note G_, 0
	note G_, 2
	note D_, 1
	note G_, 3
	loopchannel 2, Music_PalletTown_branch_f4be5
	note C_, 1
	octave 3
	note E_, 3
	octave 2
	note C_, 0
	octave 3
	note C_, 2
	octave 2
	note C_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	octave 3
	note D_, 3
	octave 2
	note D_, 0
	note G_, 2
	note E_, 1
	note G_, 1
	note E_, 1
	intensity $1f
	note F#, 3
	intensity $88
	note F#, 3
	note B_, 3
	note G_, 3
	note A_, 1
	note D_, 1
	note G_, 1
	note D_, 3
	note C_, 1
	octave 1
	note B_, 1
	note A_, 1
	loopchannel 0, Music_PalletTown_branch_f4ba8

Music_PalletTown_Ch3: ; f4c2a
	vibrato $14, $24

Music_PalletTown_branch_f4c2d: ; f4c2d
	notetype $c, $10
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	octave 6
	note G_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 5
	octave 5
	note B_, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 6
	note C_, 7
	note __, 1
	octave 5
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 5
	octave 6
	note C_, 0
	octave 5
	note B_, 0
	note A_, 7
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 5
	note D_, 0
	note __, 0
	note D_, 7
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 7
	note __, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 7
	note D_, 5
	note C_, 1
	octave 5
	note B_, 7
	note __, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	note __, 1
	note C_, 3
	note D_, 5
	note C_, 0
	note D_, 0
	octave 5
	note B_, 7
	note __, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 7
	note E_, 3
	note B_, 3
	note A_, 7
	note G_, 3
	note E_, 3
	note F#, 6
	note __, 0
	note G_, 2
	note __, 0
	note B_, 2
	note __, 0
	note B_, 7
	note A_, 7
	loopchannel 0, Music_PalletTown_branch_f4c2d
; f4c9f
