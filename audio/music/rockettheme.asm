Music_RocketTheme: ; f766d
	dbw $c0, Music_RocketTheme_Ch1
	dbw $01, Music_RocketTheme_Ch2
	dbw $02, Music_RocketTheme_Ch3
	dbw $03, Music_RocketTheme_Ch4
; f7679


Music_RocketTheme_Ch1: ; f7679
	tempo 128
	volume $77
	dutycycle $3
	stereopanning $f
	vibrato $5, $64
	notetype $c, $a8
	octave 4
	note C_, 0
	note D_, 0

Music_RocketTheme_branch_f768b: ; f768b
	dutycycle $3
	notetype $c, $a8
	callchannel Music_RocketTheme_branch_f74e6
	dutycycle $1
	intensity $a8
	callchannel Music_RocketTheme_branch_f74f7
	callchannel Music_RocketTheme_branch_f758a
	octave 4
	note F#, 0
	note __, 0
	intensity $53
	callchannel Music_RocketTheme_branch_f750c
	intensity $c3
	callchannel Music_RocketTheme_branch_f750c
	intensity $e3
	callchannel Music_RocketTheme_branch_f750c
	note __, 15
	dutycycle $0
	notetype $6, $b3
	vibrato $6, $64
	callchannel Music_RocketTheme_branch_f7727
	octave 4
	note F_, 0
	note F#, 2
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G_, 1
	note A#, 1
	octave 4
	note C_, 1
	note __, 3
	note D_, 3
	note __, 3
	note D#, 3
	note __, 3
	note D#, 1
	note F#, 1
	callchannel Music_RocketTheme_branch_f7727
	octave 3
	note F#, 0
	note G_, 2
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note C_, 1
	octave 2
	note A#, 1
	note G_, 1
	note A#, 1
	octave 3
	note C_, 1
	note __, 3
	note D_, 3
	note __, 3
	note D#, 3
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1

Music_RocketTheme_branch_f76ef: ; f76ef
	note __, 3
	note F_, 1
	note __, 13
	note F#, 1
	note __, 9
	loopchannel 3, Music_RocketTheme_branch_f76ef
	note __, 3
	note F_, 1
	note __, 13
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note C_, 1

Music_RocketTheme_branch_f7701: ; f7701
	note F#, 1
	note A_, 1
	loopchannel 4, Music_RocketTheme_branch_f7701

Music_RocketTheme_branch_f7707: ; f7707
	note G_, 1
	note A#, 1
	loopchannel 4, Music_RocketTheme_branch_f7707

Music_RocketTheme_branch_f770d: ; f770d
	note G#, 1
	note B_, 1
	loopchannel 4, Music_RocketTheme_branch_f770d

Music_RocketTheme_branch_f7713: ; f7713
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	loopchannel 4, Music_RocketTheme_branch_f7713
	notetype $c, $b3
	note __, 15
	note __, 11
	note F_, 1
	note C_, 0
	note D_, 0
	loopchannel 0, Music_RocketTheme_branch_f768b
; f7727

Music_RocketTheme_branch_f7727: ; f7727
	note __, 6
	note B_, 0
	octave 4
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 5
	octave 4
	note D#, 11
	note D_, 7
	octave 3
	note A#, 1
	note __, 5
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 9
	endchannel

Music_RocketTheme_Ch2: ; f773e
	stereopanning $ff
	vibrato $4, $64
	dutycycle $3
	notetype $c, $b7
	octave 5
	note C_, 0
	note D_, 0

Music_RocketTheme_branch_f774b: ; f774b
	notetype $c, $b7
	callchannel Music_RocketTheme_branch_f7547
	intensity $b7
	callchannel Music_RocketTheme_branch_f758a
	octave 5
	note C_, 0
	note __, 0
	callchannel Music_RocketTheme_branch_f7554
	intensity $53
	callchannel Music_RocketTheme_branch_f7568
	intensity $c3
	callchannel Music_RocketTheme_branch_f7568
	intensity $e3
	callchannel Music_RocketTheme_branch_f7568
	callchannel Music_RocketTheme_branch_f756f
	vibrato $6, $64
	callchannel Music_RocketTheme_branch_f7800
	octave 4
	note A_, 0
	vibrato $0, $0
	intensity $b8
	note A#, 13
	vibrato $5, $22
	intensity $b7
	note A#, 4
	vibrato $6, $64
	notetype $c, $b7
	note A#, 11
	note __, 1
	octave 5
	note C_, 0
	note D_, 0
	callchannel Music_RocketTheme_branch_f7800
	note B_, 0
	vibrato $0, $0
	intensity $b8
	octave 4
	note C_, 13
	vibrato $5, $22
	intensity $b7
	note C_, 4
	vibrato $6, $64
	notetype $c, $b7
	note C_, 11
	octave 3
	note A#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	notetype $6, $b7
	callchannel Music_RocketTheme_branch_f781c
	octave 4
	note D_, 0
	note D#, 8
	note D_, 0
	note C#, 0
	note C_, 11
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	callchannel Music_RocketTheme_branch_f781c
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 7
	note __, 3
	note D_, 1
	note __, 1
	note C_, 1
	octave 3
	note G_, 1
	note B_, 0
	octave 4
	note C_, 14
	note C#, 15
	note D_, 15
	note D#, 15
	note E_, 1
	note C#, 1
	octave 3
	note A#, 1
	note G_, 1
	octave 4
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G#, 1
	octave 4
	note F#, 1
	note D#, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note G_, 1
	note E_, 1
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note G#, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note B_, 3
	octave 5
	note C_, 1
	note D_, 1
	loopchannel 0, Music_RocketTheme_branch_f774b
; f7800

Music_RocketTheme_branch_f7800: ; f7800
	notetype $6, $b7
	note __, 6
	octave 4
	note D_, 0
	note D#, 1
	note __, 5
	note D#, 1
	note __, 1
	note C_, 1
	note __, 5
	note F#, 11
	note F_, 7
	note D#, 1
	note __, 5
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	endchannel
; f781c

Music_RocketTheme_branch_f781c: ; f781c
	octave 3
	note B_, 0
	octave 4
	note C_, 2
	note D#, 3
	note C_, 3
	note F#, 7
	note F_, 7
	note C_, 3
	endchannel

Music_RocketTheme_Ch3: ; f7826
	stereopanning $f0
	vibrato $4, $22
	notetype $c, $14
	note __, 1

Music_RocketTheme_branch_f782f: ; f782f
	notetype $c, $14
	callchannel Music_RocketTheme_branch_f75bf
	callchannel Music_RocketTheme_branch_f75fe
	callchannel Music_RocketTheme_branch_f75fe
	intensity $24
	callchannel Music_RocketTheme_branch_f7623
	intensity $14
	callchannel Music_RocketTheme_branch_f75cc
	callchannel Music_RocketTheme_branch_f7623
	callchannel Music_RocketTheme_branch_f75e1
	callchannel Music_RocketTheme_branch_f75fe
	callchannel Music_RocketTheme_branch_f75fe
	callchannel Music_RocketTheme_branch_f75fe
	callchannel Music_RocketTheme_branch_f75fe
	callchannel Music_RocketTheme_branch_f7623
	callchannel Music_RocketTheme_branch_f75cc
	callchannel Music_RocketTheme_branch_f7623
	callchannel Music_RocketTheme_branch_f75cc
	octave 3
	note C_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note A#, 0
	note G_, 0
	note E_, 0
	note C#, 0
	note D_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	note C_, 0
	octave 3
	note A_, 0
	note F#, 0
	note D#, 0
	note E_, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note F_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	octave 3
	note F#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 4
	note E_, 0
	note __, 0
	octave 3
	note G#, 0
	note __, 0
	octave 4
	note F_, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 0
	octave 4
	note F#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 4
	note G_, 0
	note __, 0
	octave 3
	note B_, 1
	octave 4
	note G#, 0
	note __, 0
	loopchannel 0, Music_RocketTheme_branch_f782f

Music_RocketTheme_Ch4: ; f78be
	togglenoise $3
	notetype $c
	note __, 1

Music_RocketTheme_branch_f78c3: ; f78c3
	callchannel Music_RocketTheme_branch_f765c
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f765c

Music_RocketTheme_branch_f78de: ; f78de
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 11, Music_RocketTheme_branch_f78de
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f7664
	callchannel Music_RocketTheme_branch_f765c
	callchannel Music_RocketTheme_branch_f765c
	loopchannel 0, Music_RocketTheme_branch_f78c3
; f78fd
