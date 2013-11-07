Music_UnionCave: ; f5c60
	dbw $c0, Music_UnionCave_Ch1
	dbw $01, Music_UnionCave_Ch2
	dbw $02, Music_UnionCave_Ch3
	dbw $03, Music_UnionCave_Ch4
; f5c6c


Music_UnionCave_Ch1: ; f5c6c
	tempo 160
	volume $77
	dutycycle $1
	tone $0002
	vibrato $18, $34
	stereopanning $f

Music_UnionCave_branch_f5c7b: ; f5c7b
	notetype $c, $b3

Music_UnionCave_branch_f5c7e: ; f5c7e
	callchannel Music_UnionCave_branch_f5ccf
	loopchannel 4, Music_UnionCave_branch_f5c7e

Music_UnionCave_branch_f5c85: ; f5c85
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note E_, 3
	note C#, 1
	note E_, 1
	note F_, 3
	loopchannel 8, Music_UnionCave_branch_f5c85

Music_UnionCave_branch_f5c91: ; f5c91
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F_, 3
	note D_, 1
	note F_, 1
	note F#, 3
	loopchannel 4, Music_UnionCave_branch_f5c91
	note __, 3
	intensity $80
	note F_, 15
	note F#, 15
	note G_, 15
	note F#, 15
	note G_, 7
	note F#, 7
	note F_, 7
	note E_, 7
	note G_, 7
	note F#, 7
	octave 4
	note C_, 7
	octave 3
	note A_, 7
	intensity $95
	tone $0004
	callchannel Music_UnionCave_branch_f5ccf
	tone $0008
	callchannel Music_UnionCave_branch_f5ccf
	tone $000c
	callchannel Music_UnionCave_branch_f5ccf
	tone $0010
	callchannel Music_UnionCave_branch_f5ccf
	tone $0002
	loopchannel 0, Music_UnionCave_branch_f5c7b
; f5ccf

Music_UnionCave_branch_f5ccf: ; f5ccf
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note E_, 11
	endchannel

Music_UnionCave_Ch2: ; f5cd5
	dutycycle $3
	vibrato $8, $24

Music_UnionCave_branch_f5cda: ; f5cda
	notetype $c, $c4
	callchannel Music_UnionCave_branch_f5d34
	intensity $c5
	callchannel Music_UnionCave_branch_f5d34
	intensity $c7
	callchannel Music_UnionCave_branch_f5d34
	intensity $c4
	note C#, 3
	octave 3
	note B_, 3
	octave 4
	note D_, 1
	note E_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	octave 4
	note D_, 7
	octave 3
	note B_, 3
	octave 4
	note D_, 3
	note F#, 1
	note F_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 7
	note D_, 3
	note C#, 3
	note __, 3
	intensity $a0
	note C_, 15
	note C#, 15
	note D_, 15
	note C#, 15
	note E_, 15
	note D#, 15
	note A#, 15
	note A_, 15
	intensity $a5
	vibrato $6, $44
	callchannel Music_UnionCave_branch_f5d52
	vibrato $4, $33
	callchannel Music_UnionCave_branch_f5d52
	vibrato $2, $22
	callchannel Music_UnionCave_branch_f5d52
	vibrato $1, $41
	callchannel Music_UnionCave_branch_f5d52
	vibrato $8, $24
	loopchannel 0, Music_UnionCave_branch_f5cda
; f5d34

Music_UnionCave_branch_f5d34: ; f5d34
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	octave 4
	note C#, 1
	note D#, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	octave 4
	note C#, 7
	octave 3
	note A#, 3
	octave 4
	note C#, 3
	note F_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 7
	note C#, 3
	note C_, 3
	endchannel
; f5d52

Music_UnionCave_branch_f5d52: ; f5d52
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note E_, 11
	endchannel

Music_UnionCave_Ch3: ; f5d58
	notetype $c, $16
	stereopanning $f0

Music_UnionCave_branch_f5d5d: ; f5d5d
	note __, 15
	loopchannel 7, Music_UnionCave_branch_f5d5d
	note __, 13
	octave 4
	note C_, 1

Music_UnionCave_branch_f5d65: ; f5d65
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note __, 1
	octave 4
	note C_, 1
	loopchannel 4, Music_UnionCave_branch_f5d65

Music_UnionCave_branch_f5d73: ; f5d73
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note __, 1
	octave 4
	note C#, 1
	loopchannel 4, Music_UnionCave_branch_f5d73
	note __, 3
	note C_, 7
	octave 3
	note B_, 7
	note A#, 7
	note A_, 7
	octave 4
	note C#, 7
	note C_, 7
	octave 3
	note B_, 7
	note A#, 7

Music_UnionCave_branch_f5d8d: ; f5d8d
	note A_, 3
	note G_, 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note G_, 1
	loopchannel 3, Music_UnionCave_branch_f5d8d
	note A_, 3
	note G_, 3
	note A#, 7

Music_UnionCave_branch_f5d9c: ; f5d9c
	note __, 15
	loopchannel 4, Music_UnionCave_branch_f5d9c
	loopchannel 0, Music_UnionCave_branch_f5d5d

Music_UnionCave_Ch4: ; f5da5
	togglenoise $1
	notetype $c

Music_UnionCave_branch_f5da9: ; f5da9
	stereopanning $f0
	note E_, 3
	stereopanning $ff
	note F_, 3
	stereopanning $f
	note G#, 3
	note __, 7
	stereopanning $f
	note E_, 3
	stereopanning $ff
	note F_, 3
	stereopanning $f0
	note G#, 3
	note __, 7
	loopchannel 0, Music_UnionCave_branch_f5da9
; f5dc1

INCBIN "baserom.gbc", $f5dc1, $f5dc5 - $f5dc1
