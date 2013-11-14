Music_ProfOak: ; f4dea
	dbw $80, Music_ProfOak_Ch1
	dbw $01, Music_ProfOak_Ch2
	dbw $02, Music_ProfOak_Ch3
; f4df3


Music_ProfOak_Ch1: ; f4df3
	tempo 118
	volume $77
	vibrato $12, $34
	tone $0001
	stereopanning $f0
	dutycycle $3
	notetype $c, $98
	octave 2
	note F#, 0
	note B_, 0
	octave 3
	note D#, 0
	note F#, 0
	note A_, 15
	note G#, 7
	intensity $97
	note G#, 7

Music_ProfOak_branch_f4e10: ; f4e10
	intensity $91
	callchannel Music_ProfOak_branch_f4e42
	callchannel Music_ProfOak_branch_f4e42
	callchannel Music_ProfOak_branch_f4e4d
	callchannel Music_ProfOak_branch_f4e4d
	loopchannel 2, Music_ProfOak_branch_f4e10

Music_ProfOak_branch_f4e22: ; f4e22
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e6c
	callchannel Music_ProfOak_branch_f4e6c
	forceoctave $2
	callchannel Music_ProfOak_branch_f4e58
	callchannel Music_ProfOak_branch_f4e58
	forceoctave $0
	callchannel Music_ProfOak_branch_f4e6c
	callchannel Music_ProfOak_branch_f4e6c
	loopchannel 0, Music_ProfOak_branch_f4e22
; f4e42

Music_ProfOak_branch_f4e42: ; f4e42
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	endchannel
; f4e4d

Music_ProfOak_branch_f4e4d: ; f4e4d
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note D#, 1
	note B_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	endchannel
; f4e58

Music_ProfOak_branch_f4e58: ; f4e58
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note C#, 0
	note E_, 0
	note C#, 1
	intensity $92
	note A_, 1
	intensity $91
	note C#, 1
	intensity $92
	note E_, 1
	intensity $91
	endchannel
; f4e6c

Music_ProfOak_branch_f4e6c: ; f4e6c
	octave 2
	note B_, 0
	octave 3
	note E_, 0
	intensity $92
	note G#, 3
	note E_, 3
	intensity $91
	note E_, 0
	note G#, 0
	intensity $92
	note B_, 3
	intensity $91
	endchannel

Music_ProfOak_Ch2: ; f4e7e
	vibrato $12, $34
	dutycycle $3
	notetype $c, $a8
	octave 3
	note B_, 0
	octave 4
	note D#, 0
	note F#, 0
	note A#, 0
	note B_, 15
	intensity $a7
	note B_, 9
	dutycycle $2

Music_ProfOak_branch_f4e92: ; f4e92
	intensity $b2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	note E_, 3
	note D#, 1
	note C#, 3
	intensity $91
	note B_, 1
	octave 5
	note C#, 1
	note D#, 1
	note E_, 3
	note D#, 1
	note C#, 3
	intensity $b2
	octave 3
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 3
	note B_, 0
	note __, 0
	note B_, 3
	intensity $91
	octave 4
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 3
	note B_, 1
	note B_, 3
	loopchannel 2, Music_ProfOak_branch_f4e92
	note __, 5
	intensity $b4

Music_ProfOak_branch_f4ebf: ; f4ebf
	note C#, 5
	octave 3
	note A_, 0
	octave 4
	note C#, 0
	note E_, 5
	note C#, 0
	note E_, 0
	note F#, 3
	note E_, 3
	note D#, 3
	note C#, 3
	octave 3
	note B_, 5
	note G#, 0
	note B_, 0
	octave 4
	note E_, 7
	intensity $82
	note B_, 5
	note G#, 0
	note B_, 0
	intensity $83
	octave 5
	note E_, 7
	intensity $b4
	octave 3
	note A_, 5
	note F#, 0
	note A_, 0
	octave 4
	note D#, 7
	note E_, 3
	note D#, 3
	note C#, 3
	note C_, 3
	octave 3
	note B_, 5
	note G#, 0
	note B_, 0
	octave 4
	note E_, 5
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note G#, 15
	loopchannel 0, Music_ProfOak_branch_f4ebf

Music_ProfOak_Ch3: ; f4ef5
	stereopanning $f
	notetype $c, $14
	note __, 3
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 0
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note B_, 1
	octave 3
	note B_, 0
	note __, 0
	note E_, 1
	callchannel Music_ProfOak_branch_f4f3d

Music_ProfOak_branch_f4f0d: ; f4f0d
	callchannel Music_ProfOak_branch_f4f3d
	callchannel Music_ProfOak_branch_f4f3d
	callchannel Music_ProfOak_branch_f4f4c
	callchannel Music_ProfOak_branch_f4f4c
	loopchannel 2, Music_ProfOak_branch_f4f0d

Music_ProfOak_branch_f4f1d: ; f4f1d
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f69
	callchannel Music_ProfOak_branch_f4f69
	forceoctave $2
	callchannel Music_ProfOak_branch_f4f5a
	callchannel Music_ProfOak_branch_f4f5a
	forceoctave $0
	callchannel Music_ProfOak_branch_f4f69
	callchannel Music_ProfOak_branch_f4f69
	loopchannel 0, Music_ProfOak_branch_f4f1d
; f4f3d

Music_ProfOak_branch_f4f3d: ; f4f3d
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 0
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note B_, 1
	octave 3
	note B_, 0
	note __, 0
	note E_, 1
	endchannel
; f4f4c

Music_ProfOak_branch_f4f4c: ; f4f4c
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note D#, 1
	note __, 1
	note F#, 1
	note B_, 0
	note __, 0
	note D#, 1
	endchannel
; f4f5a

Music_ProfOak_branch_f4f5a: ; f4f5a
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 0
	note __, 0
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note A_, 0
	note __, 0
	note C#, 1
	endchannel
; f4f69

Music_ProfOak_branch_f4f69: ; f4f69
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 0
	note __, 0
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note E_, 1
	note G#, 0
	note __, 0
	octave 2
	note B_, 1
	endchannel
; f4f79
