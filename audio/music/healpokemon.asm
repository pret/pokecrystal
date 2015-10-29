Music_HealPokemon: ; f0697
	dbw $80, Music_HealPokemon_Ch1
	dbw $01, Music_HealPokemon_Ch2
	dbw $02, Music_HealPokemon_Ch3
; f06a0

Music_HealPokemon_Ch1: ; f06a0
	tempo 144
	volume $7, $7
	waveduty $2
	pitchoffset $0001
	notetype $c, $8, $0, $1
	note __, 2
	pitchbend $0, $4, $0
	note B_, 2
	pitchbend $0, $5, $5
	note B_, 2
	pitchbend $0, $4, $5
	note E_, 2
	note __, 4
	pitchbend $0, $3, $0
	note E_, 4
	pitchbend $0, $4, $0
	note B_, 4
	endchannel
; f06c4

Music_HealPokemon_Ch2: ; f06c4
	waveduty $2
	notetype $c, $c, $0, $3
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	notetype $c, $c, $0, $4
	octave 5
	note E_, 8
	endchannel
; f06d4

Music_HealPokemon_Ch3: ; f06d4
	notetype $c, $1, $0, $0
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 6
	note __, 2
	endchannel
; f06e1


