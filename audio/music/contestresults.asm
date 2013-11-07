Music_ContestResults: ; efb3e
	dbw $c0, Music_ContestResults_Ch1
	dbw $01, Music_ContestResults_Ch2
	dbw $02, Music_ContestResults_Ch3
	dbw $03, Music_ContestResults_Ch4
; efb4a


Music_ContestResults_Ch1: ; efb4a
	tempo 144
	volume $77
	notetype $c, $51

Music_ContestResults_branch_efb52: ; efb52
	note __, 1
	octave 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 0
	note __, 1
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note __, 1
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note __, 1
	note B_, 0
	note __, 2
	note A#, 0
	note __, 2
	note A_, 0
	note __, 2
	note G_, 0
	note __, 0
	loopchannel 0, Music_ContestResults_branch_efb52

Music_ContestResults_Ch2: ; efb7b
	notetype $c, $61

Music_ContestResults_branch_efb7e: ; efb7e
	octave 2
	note C_, 1
	octave 3
	note E_, 0
	note __, 0
	octave 1
	note G_, 1
	octave 3
	note E_, 0
	note __, 0
	octave 1
	note A_, 1
	octave 3
	note E_, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note E_, 0
	note __, 0
	octave 2
	note D_, 1
	octave 3
	note F_, 0
	note __, 0
	octave 1
	note A_, 1
	octave 3
	note F_, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note F_, 0
	note __, 0
	octave 2
	note C#, 1
	octave 3
	note F_, 0
	note __, 0

Music_ContestResults_branch_efba6: ; efba6
	octave 2
	note D_, 1
	octave 3
	note F_, 0
	note __, 0
	octave 1
	note A_, 1
	octave 3
	note F_, 0
	note __, 0
	loopchannel 2, Music_ContestResults_branch_efba6
	octave 2
	note G_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note D_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 2
	note G_, 1
	octave 3
	note F_, 0
	note __, 0
	octave 2
	note D_, 1
	octave 3
	note D_, 0
	note __, 0
	loopchannel 0, Music_ContestResults_branch_efb7e

Music_ContestResults_Ch3: ; efbcc
	vibrato $8, $24
	notetype $c, $23

Music_ContestResults_branch_efbd2: ; efbd2
	octave 4
	note E_, 4
	note __, 0
	note E_, 0
	note F_, 0
	note G_, 3
	octave 5
	note C_, 3
	octave 4
	note B_, 7
	note A_, 7
	note D_, 4
	note __, 0
	note D_, 0
	note E_, 0
	note F_, 3
	note B_, 3
	note A_, 7
	note G_, 7
	loopchannel 0, Music_ContestResults_branch_efbd2

Music_ContestResults_Ch4: ; efbe9
	togglenoise $4
	notetype $6

Music_ContestResults_branch_efbed: ; efbed
	note C#, 3
	note C#, 3
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 3
	note C#, 3
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	loopchannel 0, Music_ContestResults_branch_efbed
; efc01
