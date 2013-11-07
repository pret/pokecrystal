Music_PokemonChannel: ; ee45f
	dbw $c0, Music_PokemonChannel_Ch1
	dbw $01, Music_PokemonChannel_Ch2
	dbw $02, Music_PokemonChannel_Ch3
	dbw $03, Music_PokemonChannel_Ch4
; ee46b


Music_PokemonChannel_Ch1: ; ee46b
	tempo 128
	volume $77
	vibrato $8, $38
	dutycycle $1
	stereopanning $f
	notetype $c, $b3
	octave 2
	note B_, 0
	note __, 1
	note F#, 0
	note B_, 0
	note __, 0
	octave 3
	note F#, 3
	dutycycle $0
	octave 2
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	notetype $6, $b3
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	dutycycle $1
	octave 3
	note C_, 1
	note __, 3
	note G_, 1
	note C_, 1
	note __, 1
	note B_, 7
	dutycycle $0
	note C_, 3
	note C_, 3
	octave 2
	note G_, 1
	note __, 1
	dutycycle $3
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note __, 7
	octave 3
	note G_, 1
	note __, 5
	note B_, 1
	note __, 5
	note D_, 1
	note __, 5
	endchannel

Music_PokemonChannel_Ch2: ; ee4be
	dutycycle $1
	vibrato $8, $38
	stereopanning $ff
	notetype $c, $b3
	octave 3
	note G_, 2
	note A_, 0
	note B_, 0
	note __, 0
	octave 4
	note D_, 3
	dutycycle $0
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	notetype $6, $b3
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	dutycycle $1
	octave 4
	note C_, 5
	note D_, 1
	note E_, 1
	note __, 1
	note G_, 7
	dutycycle $0
	octave 3
	note G_, 3
	note F#, 3
	note E_, 1
	note __, 1
	dutycycle $3
	octave 4
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 7
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note __, 7
	note D_, 1
	octave 3
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 4
	note G_, 1
	note __, 5
	octave 3
	note G_, 1
	note __, 5
	endchannel

Music_PokemonChannel_Ch3: ; ee50e
	vibrato $8, $38
	notetype $c, $25
	stereopanning $f0
	octave 2
	note G_, 0
	note __, 1
	note B_, 0
	octave 3
	note D_, 0
	note __, 0
	note G_, 5
	note __, 3
	note C_, 0
	note __, 1
	octave 2
	note G_, 0
	octave 3
	note C_, 0
	note __, 0
	note E_, 5
	note __, 3
	octave 4
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 3
	note G_, 3
	note G#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G#, 0
	note __, 0
	note D_, 0
	octave 3
	note B_, 0
	note G_, 0
	note B_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	endchannel

Music_PokemonChannel_Ch4: ; ee549
	togglenoise $3
	notetype $c

Music_PokemonChannel_branch_ee54d: ; ee54d
	note A#, 2
	note A#, 0
	note D_, 1
	note C_, 3
	note D_, 1
	note D_, 1
	note A#, 0
	note D_, 0
	loopchannel 2, Music_PokemonChannel_branch_ee54d
	note G#, 1
	note A#, 1
	note G#, 0
	note G#, 0
	note G#, 0
	note G#, 0
	note C_, 3
	note G#, 0
	note G#, 0
	note G#, 0
	note G#, 0
	note B_, 3
	note D_, 3
	note A#, 3
	note A#, 3
	endchannel
; ee569
