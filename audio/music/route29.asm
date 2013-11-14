Music_Route29: ; f0386
	dbw $c0, Music_Route29_Ch1
	dbw $01, Music_Route29_Ch2
	dbw $02, Music_Route29_Ch3
	dbw $03, Music_Route29_Ch4
; f0392


Music_Route29_Ch1: ; f0392
	tempo 146
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f
	notetype $c, $b2
	note __, 1

Music_Route29_branch_f03a5: ; f03a5
	note __, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 3
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 3
	note A_, 1
	note F#, 1
	note C_, 3
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note D_, 3
	octave 4
	note C_, 1
	note E_, 1
	note C_, 3
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 3
	note A_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note C_, 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note E_, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note F_, 0
	note G_, 0
	note A_, 1
	note C_, 1
	note F#, 1
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 3
	note E_, 1
	octave 4
	note C_, 1
	note E_, 1
	note E_, 1
	octave 3
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note D_, 0
	note G_, 0
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note E_, 0
	note F_, 0
	note G_, 1
	note G_, 1
	note F_, 7
	intensity $b4
	note A_, 3
	octave 4
	note C_, 1
	octave 3
	note A_, 9
	note E_, 3
	note G_, 1
	note E_, 1
	intensity $b2
	note G_, 5
	intensity $b4
	note F_, 3
	note A_, 1
	note G_, 1
	note F_, 1
	intensity $b2
	note A_, 3
	intensity $b4
	note C#, 3
	note E_, 1
	note G_, 3
	intensity $b3
	note E_, 7
	intensity $b4
	note A_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 3
	intensity $b2
	octave 3
	note A_, 5
	intensity $b4
	note G_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 3
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	intensity $b2
	note G_, 3
	note B_, 3
	intensity $b4
	note G_, 1
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 3
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G_, 3
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	intensity $b2
	note C_, 1
	note G_, 1
	note G_, 3
	loopchannel 0, Music_Route29_branch_f03a5

Music_Route29_Ch2: ; f044d
	dutycycle $3
	vibrato $12, $36
	notetype $c, $c2
	octave 4
	note C_, 0
	note D_, 0

Music_Route29_branch_f0458: ; f0458
	callchannel Music_Route29_branch_f04de
	note F_, 0
	note E_, 0
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note E_, 1
	octave 4
	note C_, 0
	note D_, 0
	callchannel Music_Route29_branch_f04de
	note F_, 0
	note E_, 0
	note D_, 1
	note D_, 1
	octave 3
	note B_, 1
	intensity $c4
	octave 4
	note C_, 7
	octave 3
	note A_, 1
	note A_, 1
	octave 4
	note C_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	octave 3
	note G_, 1
	note G_, 1
	octave 4
	note C_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	octave 3
	note F_, 1
	note F_, 1
	note A_, 1
	note A_, 1
	octave 4
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A_, 1
	octave 4
	note C_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	octave 3
	note G_, 1
	note G_, 1
	octave 4
	note C_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	intensity $c2
	note E_, 3
	note D_, 3
	intensity $c4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note E_, 1
	octave 3
	note G_, 1
	intensity $c2
	octave 4
	note C_, 1
	note C_, 1
	note C_, 1
	octave 4
	note C_, 0
	note D_, 0
	loopchannel 0, Music_Route29_branch_f0458
; f04de

Music_Route29_branch_f04de: ; f04de
	note E_, 1
	note E_, 1
	note G_, 1
	note G_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	note F_, 0
	note E_, 0
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	octave 4
	note A_, 1
	note G_, 1
	note C_, 0
	note D_, 0
	note E_, 1
	note E_, 1
	note G_, 1
	note G_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	endchannel

Music_Route29_Ch3: ; f04fb
	stereopanning $f0
	notetype $c, $25
	vibrato $9, $27
	note __, 1

Music_Route29_branch_f0504: ; f0504
	note __, 1
	octave 3
	note G_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 0
	octave 4
	note E_, 0
	note __, 0
	octave 3
	note F_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 2
	octave 3
	note A_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note E_, 0
	note __, 2
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 3
	note F_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 4
	note E_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 2
	note E_, 3
	note G_, 3
	octave 4
	note C_, 3
	octave 3
	note G_, 3
	note F_, 3
	note F#, 3
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note E_, 3
	note G_, 3
	octave 4
	note C_, 3
	octave 3
	note G_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 5
	octave 3
	note F_, 5
	note A_, 3
	octave 4
	note C_, 5
	octave 3
	note G_, 5
	note A_, 1
	note A#, 1
	note B_, 5
	note G_, 5
	octave 4
	note D_, 1
	note F_, 1
	octave 3
	note A_, 5
	note E_, 1
	octave 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note G_, 1
	note A_, 5
	octave 4
	note C_, 5
	octave 3
	note A_, 3
	note G_, 5
	octave 4
	note C_, 5
	note F_, 1
	note E_, 1
	note F_, 5
	note F_, 1
	note E_, 1
	note __, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 5
	octave 3
	note G_, 5
	octave 4
	note C_, 3
	note E_, 3
	note C_, 3
	octave 3
	note G_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note C_, 0
	note __, 2
	loopchannel 0, Music_Route29_branch_f0504

Music_Route29_Ch4: ; f05a9
	stereopanning $f
	togglenoise $0
	notetype $c
	note __, 1

Music_Route29_branch_f05b0: ; f05b0
	note __, 1
	note F_, 1
	note F_, 5
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	note F_, 3
	note F_, 3
	note F_, 1
	note F_, 3
	loopchannel 0, Music_Route29_branch_f05b0
; f05bf
