Music_PokemonLullaby: ; f6d79
	dbw $80, Music_PokemonLullaby_Ch1
	dbw $01, Music_PokemonLullaby_Ch2
	dbw $02, Music_PokemonLullaby_Ch3
; f6d82


Music_PokemonLullaby_Ch1: ; f6d82
	tempo 224
	volume $77
	dutycycle $3
	tone $0001

Music_PokemonLullaby_branch_f6d8c: ; f6d8c
	notetype $c, $a7
	octave 3
	note G_, 15
	octave 4
	note C_, 15
	stereopanning $f0
	octave 3
	note G_, 15
	stereopanning $f
	octave 4
	note C_, 7
	stereopanning $f0
	octave 3
	note B_, 7
	stereopanning $f
	note G_, 15
	stereopanning $f0
	octave 4
	note C_, 7
	stereopanning $f
	octave 3
	note B_, 7
	stereopanning $f0
	note G_, 7
	stereopanning $ff
	note __, 1
	note G_, 1
	note G_, 1
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note G_, 15
	octave 4
	note C_, 7
	octave 3
	note B_, 7
	loopchannel 0, Music_PokemonLullaby_branch_f6d8c

Music_PokemonLullaby_Ch2: ; f6dc4
	vibrato $10, $14
	dutycycle $0
	notetype $c, $b4

Music_PokemonLullaby_branch_f6dcc: ; f6dcc
	note __, 15
	note __, 9
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	intensity $b7
	note E_, 11
	note D_, 1
	note E_, 1
	note F_, 3
	note G_, 3
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	note E_, 9
	intensity $b5
	note D_, 1
	note D_, 1
	intensity $c7
	note E_, 1
	note F_, 3
	note E_, 3
	note F_, 3
	intensity $b5
	note G_, 1
	note G_, 1
	note D#, 1
	intensity $b7
	note E_, 13
	intensity $87
	octave 3
	note F_, 7
	note G_, 3
	intensity $b5
	octave 4
	note G_, 1
	note G_, 1
	intensity $b7
	note D#, 1
	note E_, 15
	note __, 13
	loopchannel 0, Music_PokemonLullaby_branch_f6dcc

Music_PokemonLullaby_Ch3: ; f6e03
	notetype $c, $11

Music_PokemonLullaby_branch_f6e06: ; f6e06
	stereopanning $f0
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	stereopanning $f
	note D_, 1
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note D_, 1
	note C_, 1
	octave 4
	note B_, 1
	note A_, 1
	loopchannel 0, Music_PokemonLullaby_branch_f6e06
; f6e23
