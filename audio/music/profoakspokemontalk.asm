Music_ProfOaksPokemonTalk: ; f4c9f
	dbw $80, Music_ProfOaksPokemonTalk_Ch1
	dbw $01, Music_ProfOaksPokemonTalk_Ch2
	dbw $02, Music_ProfOaksPokemonTalk_Ch3
; f4ca8

INCBIN "baserom.gbc", $f4ca8, $f4ca9 - $f4ca8

Music_ProfOaksPokemonTalk_Ch1: ; f4ca9
	tempo 164
	volume $77
	stereopanning $f
	vibrato $6, $25
	dutycycle $1
	notetype $c, $94
	note __, 7
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	note D#, 0
	note E_, 0
	note C#, 0
	note D#, 0
	note E_, 0
	note F#, 0

Music_ProfOaksPokemonTalk_branch_f4cc3: ; f4cc3
	note D#, 5
	note C#, 0
	octave 3
	note B_, 0
	note F#, 0
	note G#, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note A#, 0
	note B_, 1
	note F#, 0
	note G#, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 0
	note G#, 0
	note F#, 0
	note __, 0
	note A#, 3
	octave 4
	note D#, 5
	note C#, 0
	octave 3
	note B_, 0
	note G#, 0
	note B_, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 0
	note B_, 0
	note F#, 0
	note A#, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note F#, 0
	note A#, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 3
	note E_, 1
	octave 2
	note B_, 0
	octave 3
	note E_, 0
	note G#, 1
	note E_, 0
	note G#, 0
	note B_, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 3
	note F#, 1
	note D#, 0
	note F#, 0
	note B_, 1
	note F#, 0
	note B_, 0
	octave 4
	note D#, 0
	note E_, 0
	note D#, 0
	note E_, 0
	note D#, 3
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note E_, 1
	note F#, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note C#, 1
	octave 3
	note A#, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	note D#, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F#, 0
	note __, 0
	loopchannel 0, Music_ProfOaksPokemonTalk_branch_f4cc3

Music_ProfOaksPokemonTalk_Ch2: ; f4d31
	vibrato $8, $24
	dutycycle $3
	notetype $c, $a7
	stereopanning $ff
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	note D#, 0
	note E_, 0
	note C#, 0
	note D#, 0
	note E_, 0
	note F#, 0
	note D#, 0
	note E_, 0
	note F#, 0
	note G#, 0
	note E_, 0
	note F#, 0
	note G#, 0
	note A#, 0

Music_ProfOaksPokemonTalk_branch_f4d4d: ; f4d4d
	note B_, 5
	note A#, 0
	note G#, 0
	note F#, 5
	note F_, 0
	note F#, 0
	note G#, 3
	note F#, 7
	note F#, 3
	note G#, 5
	note F#, 0
	note E_, 0
	note D#, 5
	note D_, 0
	note D#, 0
	note E_, 3
	note D#, 7
	note D#, 3
	note E_, 5
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note G#, 7
	note F#, 5
	note D#, 0
	note F#, 0
	note B_, 7
	note A#, 3
	note B_, 1
	note A#, 1
	note G#, 3
	note A#, 1
	note G#, 1
	note F#, 1
	note C#, 0
	note __, 0
	note D#, 0
	note __, 0
	note E_, 0
	note __, 0
	note F#, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	loopchannel 0, Music_ProfOaksPokemonTalk_branch_f4d4d

Music_ProfOaksPokemonTalk_Ch3: ; f4d82
	vibrato $6, $38
	notetype $c, $25
	stereopanning $f0
	note __, 7
	octave 3
	note F#, 0
	note E_, 0
	note D#, 0
	note C#, 0
	note E_, 0
	note D#, 0
	note C#, 0
	octave 2
	note A#, 0

Music_ProfOaksPokemonTalk_branch_f4d95: ; f4d95
	note B_, 5
	octave 3
	note D#, 0
	note F#, 0
	note B_, 5
	note D#, 0
	note C#, 0
	octave 2
	note B_, 3
	octave 3
	note B_, 7
	octave 4
	note D#, 3
	octave 3
	note G#, 5
	note D#, 0
	note G#, 0
	octave 2
	note G#, 5
	octave 3
	note D#, 0
	note G#, 0
	note D#, 5
	note F#, 1
	note A#, 1
	note G#, 1
	note F#, 1
	note D#, 1
	note E_, 1
	note __, 3
	note E_, 0
	note E_, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note B_, 3
	note F#, 1
	note __, 3
	note F#, 0
	note F#, 0
	octave 2
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 3
	note B_, 3
	note F#, 1
	octave 4
	note F#, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note C#, 1
	octave 4
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	octave 2
	note F#, 1
	octave 3
	note A#, 0
	note __, 0
	note G#, 0
	note __, 0
	note F#, 0
	note __, 0
	note E_, 0
	note __, 0
	note D#, 0
	note __, 0
	note C#, 0
	note __, 0
	octave 2
	note A#, 0
	note __, 0
	loopchannel 0, Music_ProfOaksPokemonTalk_branch_f4d95
; f4dea
