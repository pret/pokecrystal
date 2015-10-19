Music_WildPokemonVictory: ; f4518
	dbw $80, Music_WildPokemonVictory_Ch1
	dbw $01, Music_WildPokemonVictory_Ch2
	dbw $02, Music_WildPokemonVictory_Ch3
; f4521

Music_WildPokemonVictory_Ch1: ; f4521
	tempo 126
	volume $7, $7
	waveduty $3
	pitchoffset $0001
	notetype $c, $b, $0, $1
	octave 3
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	volenvelope $b, $0, $6
	note E_, 12
Music_SuccessfulCapture_branch_f4536: ; f4536
	stereopanning $f
Music_WildPokemonVictory_branch_f4538: ; f4538
	callchannel Music_WildPokemonVictory_branch_f455c
	note F#, 2
	note F#, 2
	note F#, 4
	callchannel Music_WildPokemonVictory_branch_f455c
	note G#, 4
	volenvelope $7, $1, $0
	octave 3
	note G_, 4
	transpose $0, $1
	callchannel Music_WildPokemonVictory_branch_f455c
	note F#, 2
	note F#, 2
	note F#, 4
	callchannel Music_WildPokemonVictory_branch_f455c
	note G#, 4
	transpose $0, $0
	volenvelope $7, $1, $0
	octave 3
	note F#, 4
	loopchannel 0, Music_WildPokemonVictory_branch_f4538
; f455c

Music_WildPokemonVictory_branch_f455c: ; f455c
	volenvelope $7, $0, $1
	octave 3
	note G#, 1
	note B_, 1
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G#, 2
	note E_, 2
	note A_, 1
	octave 4
	note C#, 1
	note E_, 2
	note E_, 2
	note A_, 2
	endchannel
; f4575

Music_WildPokemonVictory_Ch2: ; f4575
	vibrato $12, $2, $4
	waveduty $2
	notetype $c, $d, $0, $1
	octave 4
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	volenvelope $d, $0, $6
	note B_, 12
Music_SuccessfulCapture_branch_f4585: ; f4585
	stereopanning $f0
Music_WildPokemonVictory_branch_f4587: ; f4587
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 2
	note B_, 2
	note B_, 4
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 4
	volenvelope $8, $0, $1
	note C_, 1
	note E_, 1
	note G_, 1
	note A#, 1
	transpose $0, $1
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 2
	note B_, 2
	note B_, 4
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 4
	transpose $0, $0
	volenvelope $8, $0, $1
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note F#, 1
	note A_, 1
	loopchannel 0, Music_WildPokemonVictory_branch_f4587
; f45b5

Music_WildPokemonVictory_branch_f45b5: ; f45b5
	volenvelope $8, $0, $1
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note B_, 2
	note B_, 2
	note B_, 4
	octave 5
	note C#, 2
	note C#, 2
	note C#, 4
	endchannel
; f45c4

Music_WildPokemonVictory_Ch3: ; f45c4
	notetype $c, $2, $0, $0
	note __, 6
	octave 6
	note D#, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
Music_SuccessfulCapture_branch_f45cf: ; f45cf
Music_WildPokemonVictory_branch_f45cf: ; f45cf
	callchannel Music_WildPokemonVictory_branch_f45f4
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note __, 2
	callchannel Music_WildPokemonVictory_branch_f45f4
	note E_, 2
	note __, 2
	note C_, 4
	transpose $0, $1
	callchannel Music_WildPokemonVictory_branch_f45f4
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note __, 2
	callchannel Music_WildPokemonVictory_branch_f45f4
	note E_, 2
	note __, 2
	transpose $0, $0
	octave 2
	note B_, 4
	loopchannel 0, Music_WildPokemonVictory_branch_f45cf
; f45f4

Music_WildPokemonVictory_branch_f45f4: ; f45f4
	volenvelope $2, $0, $5
	octave 3
	note E_, 2
	note __, 4
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note C#, 2
	note __, 4
	note C#, 2
	endchannel
; f4602


