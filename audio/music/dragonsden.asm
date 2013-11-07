Music_DragonsDen: ; eece8
	dbw $c0, Music_DragonsDen_Ch1
	dbw $01, Music_DragonsDen_Ch2
	dbw $02, Music_DragonsDen_Ch3
	dbw $03, Music_DragonsDen_Ch4
; eecf4


Music_DragonsDen_Ch1: ; eecf4
	tempo 144
	volume $77
	dutycycle $0
	tone $0004
	stereopanning $f0
	notetype $c, $80

Music_DragonsDen_branch_eed03: ; eed03
	callchannel Music_DragonsDen_branch_eed1e
	note __, 15
	callchannel Music_DragonsDen_branch_eed2d
	note __, 1
	callchannel Music_DragonsDen_branch_eed2d
	note __, 1
	callchannel Music_DragonsDen_branch_eed2d
	note __, 1
	callchannel Music_DragonsDen_branch_eed2d
	note __, 9
	notetype $c, $b7
	loopchannel 0, Music_DragonsDen_branch_eed03
; eed1e

Music_DragonsDen_branch_eed1e: ; eed1e
	octave 3
	note A#, 11
	note A_, 3
	note A#, 11
	note A_, 3
	note A#, 5
	octave 4
	note C_, 3
	note C#, 5
	note E_, 15
	note D#, 11
	note D_, 3
	octave 3
	note G#, 15
	endchannel
; eed2d

Music_DragonsDen_branch_eed2d: ; eed2d
	intensity $b1
	note __, 1
	octave 4
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note C#, 3
	note C#, 2
	note C#, 2
	note C#, 3
	note C#, 1
	note C#, 1
	endchannel

Music_DragonsDen_Ch2: ; eed3c
	dutycycle $0
	tone $0004
	stereopanning $f
	notetype $c, $90

Music_DragonsDen_branch_eed46: ; eed46
	callchannel Music_DragonsDen_branch_eed5e
	note __, 15
	callchannel Music_DragonsDen_branch_eed6b
	callchannel Music_DragonsDen_branch_eed6b
	callchannel Music_DragonsDen_branch_eed6b
	callchannel Music_DragonsDen_branch_eed6b
	note __, 15
	notetype $c, $c7
	loopchannel 0, Music_DragonsDen_branch_eed46
; eed5e

Music_DragonsDen_branch_eed5e: ; eed5e
	octave 4
	note D#, 11
	note D_, 3
	note D#, 11
	note D_, 3
	note D#, 5
	note F_, 3
	note F#, 5
	note A_, 15
	note G#, 11
	note G_, 3
	note C#, 15
	endchannel
; eed6b

Music_DragonsDen_branch_eed6b: ; eed6b
	intensity $c1

Music_DragonsDen_branch_eed6d: ; eed6d
	octave 5
	note C#, 3
	octave 4
	note G#, 3
	note G#, 3
	note G#, 3
	loopchannel 2, Music_DragonsDen_branch_eed6d
	endchannel

Music_DragonsDen_Ch3: ; eed78

Music_DragonsDen_branch_eed78: ; eed78
	notetype $c, $14
	octave 4
	note C#, 1
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	loopchannel 15, Music_DragonsDen_branch_eed78
	note __, 15
	notetype $6, $27

Music_DragonsDen_branch_eed99: ; eed99
	octave 3
	note C#, 3
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	octave 2
	note G#, 3
	octave 3
	note C#, 3
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	octave 2
	note G#, 3
	octave 3
	note C#, 3
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	loopchannel 16, Music_DragonsDen_branch_eed99
	loopchannel 0, Music_DragonsDen_branch_eed78

Music_DragonsDen_Ch4: ; eedb7
	togglenoise $0
	notetype $c
	note __, 15
	note __, 15

Music_DragonsDen_branch_eedbd: ; eedbd
	stereopanning $f0
	note F_, 3
	stereopanning $f
	note F#, 3
	note F#, 3
	stereopanning $f0
	note F#, 3
	loopchannel 0, Music_DragonsDen_branch_eedbd
; eedcb
