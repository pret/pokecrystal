Music_WildPokemonVictory: ; f4518
	dbw $80, Music_WildPokemonVictory_Ch1
	dbw $01, Music_WildPokemonVictory_Ch2
	dbw $02, Music_WildPokemonVictory_Ch3
; f4521


Music_WildPokemonVictory_Ch1: ; f4521
	tempo 126
	volume $77
	dutycycle $3
	tone $0001
	notetype $c, $b1
	octave 3
	note B_, 0
	note A_, 0
	note G#, 0
	note F#, 0
	intensity $b6
	note E_, 11

Music_SuccessfulCapture_branch_f4536: ; f4536
	stereopanning $f

Music_WildPokemonVictory_branch_f4538: ; f4538
	callchannel Music_WildPokemonVictory_branch_f455c
	note F#, 1
	note F#, 1
	note F#, 3
	callchannel Music_WildPokemonVictory_branch_f455c
	note G#, 3
	intensity $78
	octave 3
	note G_, 3
	forceoctave $1
	callchannel Music_WildPokemonVictory_branch_f455c
	note F#, 1
	note F#, 1
	note F#, 3
	callchannel Music_WildPokemonVictory_branch_f455c
	note G#, 3
	forceoctave $0
	intensity $78
	octave 3
	note F#, 3
	loopchannel 0, Music_WildPokemonVictory_branch_f4538
; f455c

Music_WildPokemonVictory_branch_f455c: ; f455c
	intensity $71
	octave 3
	note G#, 0
	note B_, 0
	octave 4
	note E_, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note G#, 0
	note F#, 0
	note E_, 0
	note F#, 0
	note G#, 1
	note E_, 1
	note A_, 0
	octave 4
	note C#, 0
	note E_, 1
	note E_, 1
	note A_, 1
	endchannel

Music_WildPokemonVictory_Ch2: ; f4575
	vibrato $12, $24
	dutycycle $2
	notetype $c, $d1
	octave 4
	note E_, 0
	note F#, 0
	note G#, 0
	note A_, 0
	intensity $d6
	note B_, 11

Music_SuccessfulCapture_branch_f4585: ; f4585
	stereopanning $f0

Music_WildPokemonVictory_branch_f4587: ; f4587
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 1
	note B_, 1
	note B_, 3
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 3
	intensity $81
	note C_, 0
	note E_, 0
	note G_, 0
	note A#, 0
	forceoctave $1
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 1
	note B_, 1
	note B_, 3
	callchannel Music_WildPokemonVictory_branch_f45b5
	octave 4
	note B_, 3
	forceoctave $0
	intensity $81
	octave 3
	note B_, 0
	octave 4
	note D#, 0
	note F#, 0
	note A_, 0
	loopchannel 0, Music_WildPokemonVictory_branch_f4587
; f45b5

Music_WildPokemonVictory_branch_f45b5: ; f45b5
	intensity $81
	octave 4
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	note B_, 1
	note B_, 3
	octave 5
	note C#, 1
	note C#, 1
	note C#, 3
	endchannel

Music_WildPokemonVictory_Ch3: ; f45c4
	notetype $c, $20
	note __, 5
	octave 6
	note D#, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 0
	note __, 2

Music_SuccessfulCapture_branch_f45cf: ; f45cf

Music_WildPokemonVictory_branch_f45cf: ; f45cf
	callchannel Music_WildPokemonVictory_branch_f45f4
	note D#, 1
	note C#, 1
	octave 2
	note B_, 1
	note __, 1
	callchannel Music_WildPokemonVictory_branch_f45f4
	note E_, 1
	note __, 1
	note C_, 3
	forceoctave $1
	callchannel Music_WildPokemonVictory_branch_f45f4
	note D#, 1
	note C#, 1
	octave 2
	note B_, 1
	note __, 1
	callchannel Music_WildPokemonVictory_branch_f45f4
	note E_, 1
	note __, 1
	forceoctave $0
	octave 2
	note B_, 3
	loopchannel 0, Music_WildPokemonVictory_branch_f45cf
; f45f4

Music_WildPokemonVictory_branch_f45f4: ; f45f4
	intensity $25
	octave 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note C#, 1
	note __, 3
	note C#, 1
	endchannel
; f4602
