Music_GoldenrodCity: ; eb453
	dbw $c0, Music_GoldenrodCity_Ch1
	dbw $01, Music_GoldenrodCity_Ch2
	dbw $02, Music_GoldenrodCity_Ch3
	dbw $03, Music_GoldenrodCity_Ch4
; eb45f


Music_GoldenrodCity_Ch1: ; eb45f
	stereopanning $f
	tempo 176
	volume $77
	notetype $c, $97
	note __, 15
	note __, 15
	note __, 15
	note __, 15

Music_GoldenrodCity_branch_eb46d: ; eb46d
	dutycycle $0
	callchannel Music_GoldenrodCity_branch_eb4a9
	octave 3
	note G#, 0
	octave 4
	note C_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note F#, 0
	note G#, 0
	octave 5
	note C_, 0
	intensity $71
	dutycycle $0
	callchannel Music_GoldenrodCity_branch_eb4d1
	intensity $77
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 3
	intensity $71
	callchannel Music_GoldenrodCity_branch_eb4d1
	note D#, 0
	note F#, 0
	intensity $77
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	note F#, 1
	note D#, 1
	dutycycle $2
	intensity $97
	callchannel Music_GoldenrodCity_branch_eb4a9
	note C_, 3
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	loopchannel 0, Music_GoldenrodCity_branch_eb46d
; eb4a9

Music_GoldenrodCity_branch_eb4a9: ; eb4a9
	octave 4
	note C#, 1
	octave 3
	note G#, 0
	note __, 2
	note G#, 0
	note __, 0
	octave 4
	note C_, 1
	octave 3
	note G#, 0
	note __, 2
	note G#, 0
	note __, 0
	note A#, 1
	note F_, 0
	note __, 0
	note C#, 1
	note F_, 0
	note __, 0
	note D#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note F#, 1
	note C#, 0
	note __, 2
	note C#, 0
	note __, 0
	note F#, 1
	note C#, 0
	note __, 0
	note F#, 1
	note A#, 1
	note C#, 1
	note D#, 1
	note G#, 1
	octave 4
	note C#, 1
	endchannel
; eb4d1

Music_GoldenrodCity_branch_eb4d1: ; eb4d1
	octave 4
	note F_, 0
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	note F_, 0
	note G#, 0
	note F_, 0
	note G#, 0
	note C#, 0
	octave 3
	note G#, 0
	note F_, 0
	note G#, 0
	octave 4
	note C#, 0
	note F_, 0
	note C#, 0
	note F_, 0
	note D#, 0
	note C_, 0
	octave 3
	note G#, 0
	octave 4
	note C_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note F#, 0
	note C_, 0
	octave 3
	note G#, 0
	note F#, 0
	note G#, 0
	octave 4
	note C_, 0
	note D#, 0
	note C_, 0
	note D#, 0
	note C#, 0
	octave 3
	note A#, 0
	note F#, 0
	note A#, 0
	octave 4
	note C#, 0
	note F_, 0
	note C#, 0
	note F_, 0
	octave 3
	note A#, 0
	note F#, 0
	note C#, 0
	note F#, 0
	note A#, 0
	octave 4
	note C#, 0
	octave 3
	note A#, 0
	octave 4
	note C#, 0
	note D#, 0
	note C_, 0
	octave 3
	note G#, 0
	octave 4
	note C_, 0
	note D#, 0
	note F#, 0
	endchannel

Music_GoldenrodCity_Ch2: ; eb519
	stereopanning $f0
	vibrato $12, $23
	dutycycle $2
	notetype $c, $97

Music_GoldenrodCity_branch_eb523: ; eb523
	intensity $97
	callchannel Music_GoldenrodCity_branch_eb555
	octave 4
	note F_, 1
	note F#, 1
	note G#, 1
	note F_, 1
	note D#, 7
	callchannel Music_GoldenrodCity_branch_eb555
	note G#, 1
	note A#, 1
	octave 5
	note C_, 1
	note C#, 1
	note D#, 7
	dutycycle $2
	intensity $77
	callchannel Music_GoldenrodCity_branch_eb572
	octave 4
	note G#, 1
	note A#, 1
	note B_, 1
	octave 5
	note C_, 3
	dutycycle $3
	intensity $77
	callchannel Music_GoldenrodCity_branch_eb572
	note F_, 1
	note D#, 1
	note C#, 1
	note C_, 1
	octave 4
	note G#, 1
	loopchannel 0, Music_GoldenrodCity_branch_eb523
; eb555

Music_GoldenrodCity_branch_eb555: ; eb555
	octave 4
	note F_, 3
	note C#, 3
	note D#, 3
	note C_, 3
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 5
	octave 3
	note G#, 0
	octave 3
	note A_, 0
	note A#, 3
	octave 4
	note C#, 3
	octave 3
	note A#, 1
	octave 4
	note A#, 1
	note G#, 1
	note F#, 1
	dutycycle $1
	endchannel
; eb572

Music_GoldenrodCity_branch_eb572: ; eb572
	note C#, 5
	note F_, 5
	note C#, 3
	note C_, 5
	note D#, 5
	note C_, 1
	octave 4
	note G#, 0
	note A_, 0
	note A#, 5
	octave 5
	note C#, 5
	octave 4
	note A#, 3
	octave 5
	note C_, 3
	note D#, 1
	endchannel

Music_GoldenrodCity_Ch3: ; eb584
	stereopanning $ff
	vibrato $8, $23
	notetype $c, $25

Music_GoldenrodCity_branch_eb58c: ; eb58c
	callchannel Music_GoldenrodCity_branch_eb5aa
	callchannel Music_GoldenrodCity_branch_eb5aa
	callchannel Music_GoldenrodCity_branch_eb5d2
	note __, 2
	octave 3
	note C_, 0
	note D#, 0
	note G_, 0
	note G#, 0
	note D#, 1
	callchannel Music_GoldenrodCity_branch_eb5d2
	note __, 0
	octave 3
	note G#, 1
	note F#, 1
	note D#, 1
	octave 2
	note G#, 1
	loopchannel 0, Music_GoldenrodCity_branch_eb58c
; eb5aa

Music_GoldenrodCity_branch_eb5aa: ; eb5aa
	octave 3
	note C#, 3
	note __, 1
	note C#, 0
	note __, 0
	note C_, 3
	note __, 1
	note C_, 0
	note __, 0
	octave 2
	note A#, 3
	note __, 1
	note A#, 0
	note __, 0
	note G#, 3
	note __, 1
	note G#, 0
	note __, 0
	note F#, 3
	note __, 1
	note F#, 0
	note __, 0
	octave 3
	note D#, 3
	note __, 1
	note D#, 0
	note __, 0
	note G#, 3
	note __, 1
	note G#, 0
	note __, 0
	octave 2
	note G#, 0
	note __, 0
	note G#, 2
	note __, 0
	octave 3
	note G#, 0
	note __, 0
	endchannel
; eb5d2

Music_GoldenrodCity_branch_eb5d2: ; eb5d2
	note C#, 0
	note __, 0
	octave 4
	note C#, 0
	octave 3
	note C#, 0
	note __, 1
	note C#, 0
	note __, 4
	octave 4
	note C_, 0
	note C#, 0
	octave 3
	note G#, 1
	note C_, 0
	note __, 0
	octave 4
	note C_, 0
	octave 3
	note C_, 0
	note __, 1
	note C_, 0
	note __, 4
	note B_, 0
	octave 4
	note C_, 0
	octave 3
	note G#, 1
	octave 2
	note A#, 0
	note __, 0
	octave 3
	note A#, 0
	octave 2
	note A#, 0
	note __, 1
	note A#, 0
	note __, 4
	octave 3
	note A_, 0
	note A#, 0
	note F#, 1
	octave 2
	note G#, 0
	note __, 0
	octave 3
	note G#, 0
	octave 2
	note G#, 0
	note __, 1
	note G#, 0
	endchannel

Music_GoldenrodCity_Ch4: ; eb606
	togglenoise $3
	notetype $c
	note __, 15
	note __, 15
	note __, 15
	note __, 7
	note D_, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note F#, 1

Music_GoldenrodCity_branch_eb613: ; eb613
	note D#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GoldenrodCity_branch_eb613
	callchannel Music_GoldenrodCity_branch_eb663
	callchannel Music_GoldenrodCity_branch_eb66d
	note G_, 0
	note G_, 0
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 1
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 0
	note D_, 0
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 1
	note D_, 0
	note D_, 0
	callchannel Music_GoldenrodCity_branch_eb66d
	note G_, 0
	note G_, 0
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 1
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 0
	note D_, 0
	note F#, 1
	callchannel Music_GoldenrodCity_branch_eb66d
	note D_, 1
	note D_, 0
	note D_, 0

Music_GoldenrodCity_branch_eb650: ; eb650
	note D#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	loopchannel 3, Music_GoldenrodCity_branch_eb650
	callchannel Music_GoldenrodCity_branch_eb663
	loopchannel 0, Music_GoldenrodCity_branch_eb613
; eb663

Music_GoldenrodCity_branch_eb663: ; eb663
	note D#, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note F#, 1
	endchannel
; eb66d

Music_GoldenrodCity_branch_eb66d: ; eb66d
	note D#, 1
	note D_, 0
	note D#, 2
	note D#, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	endchannel
; eb676
