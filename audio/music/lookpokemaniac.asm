Music_LookPokemaniac: ; ebde1
	dbw $80, Music_LookPokemaniac_Ch1
	dbw $01, Music_LookPokemaniac_Ch2
	dbw $02, Music_LookPokemaniac_Ch3
; ebdea


Music_LookPokemaniac_Ch1: ; ebdea
	stereopanning $f
	tempo 144
	volume $77
	vibrato $2, $33
	tone $0002
	notetype $c, $b3
	note __, 7

Music_LookPokemaniac_branch_ebdfb: ; ebdfb
	note __, 3
	octave 3
	note A#, 0
	note __, 2
	note A#, 0
	note __, 2
	loopchannel 4, Music_LookPokemaniac_branch_ebdfb
	note __, 3
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	loopchannel 4, Music_LookPokemaniac_branch_ebdfb
	loopchannel 0, Music_LookPokemaniac_branch_ebdfb

Music_LookPokemaniac_Ch2: ; ebe12
	stereopanning $ff
	vibrato $2, $33
	tone $0001
	notetype $c, $b3
	octave 2
	note A_, 0
	note F#, 0
	note D#, 0
	note C_, 0
	octave 1
	note A_, 3

Music_LookPokemaniac_branch_ebe24: ; ebe24
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note F#, 0
	note __, 2
	note A_, 0
	note __, 2
	octave 1
	note G_, 1
	note __, 1
	octave 3
	note C_, 0
	note __, 2
	note D#, 0
	note __, 2
	loopchannel 2, Music_LookPokemaniac_branch_ebe24

Music_LookPokemaniac_branch_ebe38: ; ebe38
	octave 1
	note A_, 1
	note __, 1
	octave 3
	note D#, 0
	note __, 2
	note F#, 0
	note __, 2
	octave 1
	note E_, 1
	note __, 1
	octave 2
	note A_, 0
	note __, 2
	octave 3
	note C_, 0
	note __, 2
	loopchannel 2, Music_LookPokemaniac_branch_ebe38
	loopchannel 0, Music_LookPokemaniac_branch_ebe24

Music_LookPokemaniac_Ch3: ; ebe51
	stereopanning $f0
	vibrato $6, $33
	notetype $c, $15
	octave 4
	note C_, 0
	note D#, 0
	note F#, 0
	note A_, 0
	octave 5
	note C_, 3
	intensity $10

Music_LookPokemaniac_branch_ebe62: ; ebe62
	callchannel Music_LookPokemaniac_branch_ebe70
	intensity $14
	callchannel Music_LookPokemaniac_branch_ebe70
	intensity $10
	loopchannel 0, Music_LookPokemaniac_branch_ebe62
; ebe70

Music_LookPokemaniac_branch_ebe70: ; ebe70
	note A#, 5
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 5
	note F_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D#, 3
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 5
	note F#, 3
	note C_, 0
	note __, 0
	note F#, 0
	note __, 0
	note C_, 0
	note __, 0
	note F#, 0
	note __, 0
	note G_, 5
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 5
	note D_, 1
	note D#, 1
	note F#, 1
	note C_, 3
	octave 4
	note A_, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	note C_, 0
	note __, 0
	note D#, 3
	octave 4
	note A_, 0
	note __, 0
	octave 5
	note D#, 0
	note __, 0
	note F#, 0
	note __, 0
	note C_, 0
	note __, 0
	endchannel
; ebeab
