Music_PokeFluteChannel: ; f7b13
	dbw $80, Music_PokeFluteChannel_Ch1
	dbw $01, Music_PokeFluteChannel_Ch2
	dbw $02, Music_PokeFluteChannel_Ch3
; f7b1c


Music_PokeFluteChannel_Ch1: ; f7b1c
	tempo 240
	volume $77
	stereopanning $f0
	dutycycle $3
	tone $0002
	notetype $c, $b4
	note __, 3
	octave 3
	note E_, 7
	note E_, 7
	notetype $c, $b3
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 15
	note __, 1
	octave 2
	note G_, 3
	note A_, 7

Music_PokeFluteChannel_branch_f7b40: ; f7b40
	octave 3
	note E_, 1
	note G_, 1
	note F_, 3
	octave 2
	note F_, 7
	octave 3
	note G_, 1
	note A_, 1
	note G_, 3
	octave 2
	note E_, 3
	octave 3
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 7
	note A_, 7
	note G_, 7
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 3
	note G_, 7
	octave 3
	note C_, 3
	note E_, 1
	note D_, 1
	octave 2
	note G_, 3
	note A_, 7
	loopchannel 0, Music_PokeFluteChannel_branch_f7b40

Music_PokeFluteChannel_Ch2: ; f7b68
	stereopanning $f
	dutycycle $3
	tone $0001
	notetype $c, $c4
	note __, 3
	octave 3
	note C_, 7
	octave 2
	note G_, 7
	note A_, 7
	octave 3
	note E_, 7
	notetype $c, $c3
	octave 2
	note E_, 1
	note G_, 1
	octave 3
	note C_, 1
	note E_, 1
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note E_, 1
	note D_, 1
	octave 2
	note E_, 1
	octave 3
	note C_, 1
	octave 2
	note F_, 1
	octave 3
	note C_, 1
	octave 2
	note E_, 1
	note G_, 1

Music_PokeFluteChannel_branch_f7b94: ; f7b94
	octave 3
	note C_, 1
	note E_, 1
	octave 2
	note A_, 3
	note C_, 3
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	octave 2
	note G_, 3
	note C_, 3
	note G_, 1
	note E_, 1
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	note F#, 1
	note A_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note D_, 3
	note G_, 3
	note E_, 1
	octave 3
	note C_, 1
	note C_, 3
	octave 2
	note G_, 1
	octave 3
	note E_, 1
	octave 2
	note G_, 1
	note B_, 1
	note E_, 1
	octave 3
	note C_, 1
	octave 2
	note F_, 1
	octave 3
	note C_, 1
	octave 2
	note E_, 1
	note G_, 1
	loopchannel 0, Music_PokeFluteChannel_branch_f7b94

Music_PokeFluteChannel_Ch3: ; f7bd5
	vibrato $10, $14
	notetype $c, $10
	callchannel Music_PokeFluteChannel_branch_f7c05
	callchannel Music_PokeFluteChannel_branch_f7c05

Music_PokeFluteChannel_branch_f7be1: ; f7be1
	note __, 3
	octave 4
	note C_, 1
	octave 5
	note F_, 1
	note E_, 1
	note F_, 1
	octave 6
	note C_, 3
	note __, 3
	octave 4
	note C_, 1
	octave 5
	note G_, 1
	note F#, 1
	note G_, 1
	octave 6
	note C_, 3
	octave 5
	note B_, 1
	note A_, 1
	note B_, 3
	note A_, 1
	note G_, 1
	note A_, 3
	note G_, 1
	note F#, 1
	note G_, 7
	note __, 3
	callchannel Music_PokeFluteChannel_branch_f7c05
	loopchannel 0, Music_PokeFluteChannel_branch_f7be1
; f7c05

Music_PokeFluteChannel_branch_f7c05: ; f7c05
	octave 5
	note E_, 1
	note F_, 1
	note G_, 3
	note A_, 1
	note G_, 1
	octave 6
	note C_, 3
	note C_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	note A_, 1
	note F_, 1
	note G_, 3
	endchannel
; f7c16
