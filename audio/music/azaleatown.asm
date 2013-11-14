Music_AzaleaTown: ; f57e8
	dbw $c0, Music_AzaleaTown_Ch1
	dbw $01, Music_AzaleaTown_Ch2
	dbw $02, Music_AzaleaTown_Ch3
	dbw $03, Music_AzaleaTown_Ch4
; f57f4


Music_AzaleaTown_Ch1: ; f57f4
	tempo 160
	volume $77
	dutycycle $2
	stereopanning $f
	notetype $c, $a1
	note __, 1

Music_AzaleaTown_branch_f5801: ; f5801
	intensity $a1
	octave 3
	note F_, 1
	intensity $61
	note F_, 1
	note F_, 1
	intensity $a1
	note F_, 1
	intensity $61
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	loopchannel 2, Music_AzaleaTown_branch_f5801

Music_AzaleaTown_branch_f5816: ; f5816
	callchannel Music_AzaleaTown_branch_f588c
	stereopanning $f0
	intensity $a4
	note G#, 1
	note A#, 0
	note __, 2
	octave 4
	note C_, 3
	notetype $6, $a4
	note G_, 0
	note G#, 2
	note F#, 3
	note D#, 1
	note __, 1
	stereopanning $f
	callchannel Music_AzaleaTown_branch_f588c
	stereopanning $f0
	notetype $6, $a4
	note D#, 3
	note C_, 3
	note __, 2
	note B_, 0
	octave 4
	note C_, 11
	octave 3
	note A#, 3
	note F#, 3
	stereopanning $f
	callchannel Music_AzaleaTown_branch_f5912
	intensity $a3
	note A#, 3
	octave 4
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	intensity $a1
	octave 3
	note C#, 3
	note A_, 1
	note __, 13
	callchannel Music_AzaleaTown_branch_f5912
	intensity $a3
	octave 4
	note C_, 0
	note C#, 2
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	intensity $a1
	octave 3
	note G_, 3
	note A#, 3
	note G_, 7
	intensity $a2
	note A#, 3
	octave 4
	note C#, 3
	octave 3
	note A#, 3
	note F#, 3
	note C#, 7
	note F#, 3
	note __, 3
	note A#, 3
	octave 4
	note C#, 3
	octave 3
	note A#, 3
	note G_, 3
	note C#, 3
	note __, 3
	note G_, 3
	note __, 3
	octave 4
	note C#, 3
	note D#, 3
	note C#, 3
	octave 3
	note G#, 3
	note D#, 3
	note C#, 3
	octave 2
	note G#, 3
	note __, 7
	notetype $c, $2f
	octave 3
	note G#, 13
	note __, 1
	loopchannel 0, Music_AzaleaTown_branch_f5816
; f588c

Music_AzaleaTown_branch_f588c: ; f588c
	notetype $c, $a1
	octave 4
	note F_, 1
	intensity $61
	note F_, 1
	note F_, 1
	intensity $a1
	note D#, 1
	intensity $61
	note D#, 1
	note D#, 1
	intensity $a1
	note F_, 1
	intensity $61
	note F_, 1
	intensity $a1
	note A#, 1
	intensity $61
	note A#, 1
	note A#, 1
	intensity $a1
	note G#, 1
	intensity $61
	note G#, 1
	note G#, 1
	intensity $a1
	note A_, 1
	intensity $61
	note A_, 1
	intensity $a1
	note C_, 1
	intensity $61
	note C_, 1
	note C_, 1
	intensity $a1
	note C#, 1
	intensity $61
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	intensity $a1
	note D#, 1
	intensity $61
	note D#, 1
	note D#, 1
	intensity $a1
	note C#, 1
	intensity $61
	note C#, 1
	note C#, 1
	note C#, 1
	note __, 1
	intensity $a1
	octave 3
	note F_, 1
	intensity $61
	note F_, 1
	note F_, 1
	intensity $a1
	note F#, 1
	intensity $61
	note F#, 1
	note F#, 1
	note F#, 1
	note F#, 1
	intensity $a1
	note F_, 1
	intensity $61
	note F_, 1
	note F_, 1
	intensity $a1
	note D#, 1
	intensity $61
	note D#, 1
	note D#, 1
	intensity $a1
	note C#, 1
	intensity $61
	note C#, 1
	intensity $a1
	note C_, 1
	intensity $61
	note C_, 1
	note C_, 1
	intensity $a1
	octave 2
	note A#, 1
	intensity $61
	note A#, 1
	note A#, 1
	intensity $a1
	octave 3
	note C#, 1
	intensity $61
	note C#, 1
	endchannel
; f5912

Music_AzaleaTown_branch_f5912: ; f5912
	intensity $61
	note G#, 7
	note G#, 7
	intensity $81
	note A_, 7
	intensity $a1
	note A_, 7
	endchannel

Music_AzaleaTown_Ch2: ; f591d
	vibrato $12, $23
	dutycycle $2
	stereopanning $f0
	notetype $c, $62
	note __, 0
	octave 4
	note D_, 0
	intensity $b1
	note D#, 1
	intensity $71
	note D#, 1
	note D#, 1
	intensity $b1
	note C#, 1
	intensity $71
	note C#, 1
	note C#, 1
	intensity $51
	note C#, 1
	note C#, 1
	intensity $b1
	note C_, 1
	intensity $71
	note C_, 1
	note C_, 1
	intensity $b1
	note C#, 1
	intensity $71
	note C#, 1
	note C#, 1
	notetype $6, $b4
	note F_, 6
	dutycycle $1
	octave 5
	note C_, 0

Music_AzaleaTown_branch_f5952: ; f5952
	callchannel Music_AzaleaTown_branch_f59c7
	note C#, 3
	note C_, 1
	note C#, 0
	note __, 2
	notetype $6, $b4
	note D#, 10
	note __, 7
	dutycycle $1
	octave 5
	note C_, 0
	callchannel Music_AzaleaTown_branch_f59c7
	note __, 1
	note C#, 1
	note C_, 1
	octave 3
	note G#, 1
	notetype $6, $b4
	note __, 2
	octave 4
	note G_, 0
	note G#, 11
	note F#, 3
	note F_, 3
	dutycycle $0
	note D_, 0
	note D#, 2
	note C#, 3
	note C_, 1
	note __, 1
	note G#, 3
	note __, 3
	note F#, 3
	note __, 3
	note F_, 3
	note D#, 3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 7
	note __, 11
	note D_, 0
	note D#, 2
	note C#, 3
	note C_, 1
	note __, 1
	note G#, 3
	note __, 3
	note A_, 3
	note __, 3
	octave 5
	note C_, 3
	octave 4
	note B_, 0
	octave 5
	note C_, 2
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note F_, 3
	note __, 3
	note D#, 3
	note __, 3
	note C#, 3
	dutycycle $2
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	note __, 3
	note D#, 3
	note __, 3
	note C#, 3
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	note __, 3
	note A#, 3
	note __, 3
	octave 5
	note C_, 3
	notetype $c, $b7
	octave 4
	note G#, 11
	note D#, 3
	intensity $1f
	note C_, 13
	notetype $6, $b4
	dutycycle $1
	note G#, 1
	octave 5
	note C_, 1
	loopchannel 0, Music_AzaleaTown_branch_f5952
; f59c7

Music_AzaleaTown_branch_f59c7: ; f59c7
	note C#, 3
	octave 4
	note G#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note C#, 7
	note D#, 7
	note F_, 1
	note __, 0
	note G_, 0
	note G#, 11
	note F_, 1
	note __, 5
	note D#, 7
	note F_, 1
	note __, 0
	note C_, 0
	notetype $c, $a8
	vibrato $0, $0
	note C#, 7
	intensity $a7
	vibrato $12, $23
	note C#, 15
	note __, 3
	intensity $b4
	dutycycle $2
	octave 3
	note A#, 1
	octave 4
	note C#, 0
	note __, 0
	note F#, 7
	note __, 1
	note F#, 1
	note F_, 1
	note D#, 0
	note __, 0
	note C#, 5
	note C_, 1
	note __, 1
	note C_, 3
	note C#, 0
	notetype $6, $b4
	note __, 0
	note D_, 0
	notetype $c, $b7
	note D#, 11
	intensity $b4
	endchannel

Music_AzaleaTown_Ch3: ; f5a08
	stereopanning $ff
	vibrato $6, $26
	notetype $c, $25
	octave 2
	note G#, 0
	octave 3
	note C_, 0
	note C#, 0
	note __, 4
	note C#, 0
	note __, 2
	note C#, 0
	note __, 0
	octave 2
	note G#, 3
	octave 3
	note C#, 0
	note __, 4
	note C#, 0
	note __, 2
	note C#, 0
	note __, 0
	note G#, 3

Music_AzaleaTown_branch_f5a24: ; f5a24
	callchannel Music_AzaleaTown_branch_f5a86
	note G#, 3
	note D#, 1
	callchannel Music_AzaleaTown_branch_f5a86
	note G#, 1
	note __, 1
	note F#, 1
	callchannel Music_AzaleaTown_branch_f5acf
	note A#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	note F_, 1
	octave 3
	note A_, 3
	octave 4
	note C#, 0
	note __, 2
	note F_, 0
	note __, 0
	callchannel Music_AzaleaTown_branch_f5acf
	octave 2
	note A#, 1
	octave 3
	note F_, 0
	note __, 0
	note A#, 0
	note __, 0
	note D#, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 0
	note __, 2
	note G_, 1
	octave 2
	note F#, 0
	note __, 4
	note F#, 0
	note F#, 0
	note F#, 0
	note __, 0
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F_, 0
	note F#, 0
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 0
	note G_, 0
	note G#, 0
	note __, 4
	note G#, 0
	note G#, 0
	note G#, 0
	note __, 0
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F#, 0
	note G_, 0
	note G#, 0
	note __, 4
	note G#, 0
	note G#, 0
	note G#, 0
	note __, 0
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note B_, 0
	octave 3
	note C_, 0
	loopchannel 0, Music_AzaleaTown_branch_f5a24
; f5a86

Music_AzaleaTown_branch_f5a86: ; f5a86
	note C#, 0
	note __, 4
	note C#, 0
	note __, 2
	note C#, 0
	note __, 0
	octave 2
	note G#, 3
	octave 3
	note F_, 0
	note __, 4
	note F_, 0
	note __, 0
	note C_, 0
	note __, 0
	note F_, 3
	note A_, 1
	intensity $15
	note A#, 0
	note __, 0
	intensity $25
	octave 4
	note C#, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note A_, 3
	octave 4
	note C#, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note G#, 3
	note A#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G_, 5
	note __, 3
	note F#, 0
	note __, 4
	note F#, 0
	note __, 2
	note F#, 0
	note __, 0
	note C#, 3
	note G_, 0
	note __, 4
	note G_, 0
	note __, 2
	note C#, 3
	note G_, 0
	note __, 0
	note G#, 0
	note __, 4
	note G#, 0
	note __, 0
	note D#, 0
	note __, 0
	note C#, 3
	note G#, 0
	note __, 0
	note G#, 0
	note __, 4
	note G#, 0
	note __, 0
	note C_, 0
	note __, 0
	endchannel
; f5acf

Music_AzaleaTown_branch_f5acf: ; f5acf
	intensity $35
	octave 3
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	intensity $25
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	endchannel

Music_AzaleaTown_Ch4: ; f5ae5
	togglenoise $3
	notetype $c
	note F_, 1

Music_AzaleaTown_branch_f5aea: ; f5aea
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note D#, 1
	note D_, 1
	note G_, 0
	note G_, 0
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note D#, 1
	note D_, 1
	note F#, 1
	loopchannel 0, Music_AzaleaTown_branch_f5aea
; f5b03
