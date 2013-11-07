Music_HealPokemon: ; f0697
	dbw $80, Music_HealPokemon_Ch1
	dbw $01, Music_HealPokemon_Ch2
	dbw $02, Music_HealPokemon_Ch3
; f06a0


Music_HealPokemon_Ch1: ; f06a0
	tempo 144
	volume $77
	dutycycle $2
	tone $0001
	notetype $c, $81
	note __, 1
	unknownmusic0xe0 $0, $40
	note B_, 1
	unknownmusic0xe0 $0, $55
	note B_, 1
	unknownmusic0xe0 $0, $45
	note E_, 1
	note __, 3
	unknownmusic0xe0 $0, $30
	note E_, 3
	unknownmusic0xe0 $0, $40
	note B_, 3
	endchannel

Music_HealPokemon_Ch2: ; f06c4
	dutycycle $2
	notetype $c, $c3
	octave 4
	note B_, 3
	note B_, 3
	note B_, 1
	note G#, 1
	notetype $c, $c4
	octave 5
	note E_, 7
	endchannel

Music_HealPokemon_Ch3: ; f06d4
	notetype $c, $10
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note G#, 1
	note E_, 5
	note __, 1
	endchannel
; f06e1
