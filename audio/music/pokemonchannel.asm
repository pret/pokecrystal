Music_PokemonChannel: ; ee45f
	dbw $c0, Music_PokemonChannel_Ch1
	dbw $01, Music_PokemonChannel_Ch2
	dbw $02, Music_PokemonChannel_Ch3
	dbw $03, Music_PokemonChannel_Ch4
; ee46b

Music_PokemonChannel_Ch1: ; ee46b
	tempo 128
	volume $7, $7
	vibrato $8, $3, $8
	waveduty $1
	stereopanning $f
	notetype $c, $b, $0, $3
	octave 2
	note B_, 1
	note __, 2
	note F#, 1
	note B_, 1
	note __, 1
	octave 3
	note F#, 4
	waveduty $0
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	notetype $6, $b, $0, $3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	waveduty $1
	octave 3
	note C_, 2
	note __, 4
	note G_, 2
	note C_, 2
	note __, 2
	note B_, 8
	waveduty $0
	note C_, 4
	note C_, 4
	octave 2
	note G_, 2
	note __, 2
	waveduty $3
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	note __, 8
	octave 3
	note G_, 2
	note __, 6
	note B_, 2
	note __, 6
	note D_, 2
	note __, 6
	endchannel
; ee4be

Music_PokemonChannel_Ch2: ; ee4be
	waveduty $1
	vibrato $8, $3, $8
	stereopanning $ff
	notetype $c, $b, $0, $3
	octave 3
	note G_, 3
	note A_, 1
	note B_, 1
	note __, 1
	octave 4
	note D_, 4
	waveduty $0
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $6, $b, $0, $3
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	waveduty $1
	octave 4
	note C_, 6
	note D_, 2
	note E_, 2
	note __, 2
	note G_, 8
	waveduty $0
	octave 3
	note G_, 4
	note F#, 4
	note E_, 2
	note __, 2
	waveduty $3
	octave 4
	note B_, 2
	note __, 2
	note A#, 2
	note __, 2
	note B_, 8
	octave 5
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note A#, 2
	note __, 2
	note G#, 2
	note __, 2
	note __, 8
	note D_, 2
	octave 3
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	note __, 6
	octave 3
	note G_, 2
	note __, 6
	endchannel
; ee50e

Music_PokemonChannel_Ch3: ; ee50e
	vibrato $8, $3, $8
	notetype $c, $2, $0, $5
	stereopanning $f0
	octave 2
	note G_, 1
	note __, 2
	note B_, 1
	octave 3
	note D_, 1
	note __, 1
	note G_, 6
	note __, 4
	note C_, 1
	note __, 2
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note __, 1
	note E_, 6
	note __, 4
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note G_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	endchannel
; ee549

Music_PokemonChannel_Ch4: ; ee549
	drumkittoggle $3
	notetype $c
Music_PokemonChannel_branch_ee54d: ; ee54d
	note A#, 3
	note A#, 1
	note D_, 2
	note C_, 4
	note D_, 2
	note D_, 2
	note A#, 1
	note D_, 1
	loopchannel 2, Music_PokemonChannel_branch_ee54d
	note G#, 2
	note A#, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note C_, 4
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note B_, 4
	note D_, 4
	note A#, 4
	note A#, 4
	endchannel
; ee569


