Music_PokemonCenter: ; ed5c6
	dbw $c0, Music_PokemonCenter_Ch1
	dbw $01, Music_PokemonCenter_Ch2
	dbw $02, Music_PokemonCenter_Ch3
	dbw $03, Music_PokemonCenter_Ch4
; ed5d2


Music_PokemonCenter_Ch1: ; ed5d2
	tempo 152
	volume $77
	dutycycle $2
	vibrato $a, $14
	tone $0001

Music_PokemonCenter_branch_ed5df: ; ed5df
	stereopanning $f
	notetype $c, $83
	octave 3
	note F#, 1
	note F_, 1
	note F#, 1
	octave 4
	note D_, 3
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	octave 4
	note D_, 3
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	notetype $c, $b4
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	stereopanning $f0
	note F#, 1
	note E_, 1
	note D_, 3
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 3
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 3
	note C#, 1
	note D_, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 7
	octave 4
	note D_, 1
	note C#, 1
	octave 3
	note B_, 3
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 3
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note E_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 3
	note G_, 1
	note A_, 1
	note B_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	loopchannel 0, Music_PokemonCenter_branch_ed5df

Music_PokemonCenter_Ch2: ; ed671
	vibrato $10, $25

Music_PokemonCenter_branch_ed674: ; ed674
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6d1
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 3
	note E_, 3
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6e4
	note D_, 1
	note F#, 5
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 3
	note E_, 3
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6d1
	stereopanning $f
	notetype $c, $a5
	octave 3
	note A_, 3
	note E_, 3
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed6e4
	note D_, 7
	stereopanning $f
	notetype $c, $a5
	octave 3
	note D_, 3
	note E_, 3
	notetype $c, $c6
	octave 4
	note F#, 7
	note A_, 7
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 7
	note C#, 7
	note E_, 7
	note F#, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 7
	note F#, 7
	note A_, 7
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 7
	note A_, 3
	note G_, 1
	note F#, 1
	note G_, 7
	note F#, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 7
	loopchannel 0, Music_PokemonCenter_branch_ed674
; ed6d1

Music_PokemonCenter_branch_ed6d1: ; ed6d1
	dutycycle $2
	notetype $c, $c2
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	intensity $c3
	note A_, 3
	note G_, 3
	note F#, 1
	note E_, 1
	note C#, 5
	endchannel
; ed6e4

Music_PokemonCenter_branch_ed6e4: ; ed6e4
	notetype $c, $c2
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	intensity $c3
	note F#, 3
	note E_, 3
	note C#, 1
	endchannel

Music_PokemonCenter_Ch3: ; ed6f3
	notetype $c, $28

Music_PokemonCenter_branch_ed6f6: ; ed6f6
	stereopanning $f0
	octave 3
	note D_, 0
	note __, 4
	note F#, 0
	note __, 2
	note F#, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	callchannel Music_PokemonCenter_branch_ed76f
	callchannel Music_PokemonCenter_branch_ed778
	note F#, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 4
	note F#, 0
	note __, 2
	note F#, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	callchannel Music_PokemonCenter_branch_ed76f
	callchannel Music_PokemonCenter_branch_ed778
	note D_, 0
	note __, 4
	note F#, 0
	note __, 2
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	stereopanning $ff
	callchannel Music_PokemonCenter_branch_ed783
	note G_, 0
	note __, 4
	note B_, 0
	note __, 2
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note E_, 0
	note __, 4
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 0
	note F#, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note G#, 0
	note __, 0
	note A_, 0
	note __, 0
	callchannel Music_PokemonCenter_branch_ed783
	note G_, 0
	note __, 4
	note B_, 0
	note __, 2
	note B_, 0
	note __, 2
	note B_, 0
	note __, 0
	note E_, 0
	note __, 4
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 0
	note F#, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	loopchannel 0, Music_PokemonCenter_branch_ed6f6
; ed76f

Music_PokemonCenter_branch_ed76f: ; ed76f
	note E_, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	endchannel
; ed778

Music_PokemonCenter_branch_ed778: ; ed778
	note E_, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A_, 0
	note __, 0
	endchannel
; ed783

Music_PokemonCenter_branch_ed783: ; ed783
	note F#, 0
	note __, 4
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	endchannel

Music_PokemonCenter_Ch4: ; ed78c
	togglenoise $3
	notetype $c
	stereopanning $ff

Music_PokemonCenter_branch_ed792: ; ed792
	note G_, 5
	note G_, 3
	note G_, 1
	note G_, 1
	note G_, 1
	loopchannel 0, Music_PokemonCenter_branch_ed792
; ed79b
