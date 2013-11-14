Music_RocketHideout: ; eeb75
	dbw $c0, Music_RocketHideout_Ch1
	dbw $01, Music_RocketHideout_Ch2
	dbw $02, Music_RocketHideout_Ch3
	dbw $03, Music_RocketHideout_Ch4
; eeb81


Music_RocketHideout_Ch1: ; eeb81
	tempo 144
	volume $77
	dutycycle $3
	tone $0004
	vibrato $10, $44
	notetype $c, $b3
	stereopanning $f0

Music_RocketHideout_branch_eeb93: ; eeb93
	note __, 15
	loopchannel 4, Music_RocketHideout_branch_eeb93

Music_RocketHideout_branch_eeb98: ; eeb98
	octave 2
	note D#, 1
	note __, 1
	note A#, 3
	note A_, 1
	note __, 5
	note D#, 1
	note A#, 3
	note A_, 1
	note __, 7
	loopchannel 2, Music_RocketHideout_branch_eeb98
	octave 3
	note A#, 1
	note A_, 1
	note F_, 1
	note F#, 1
	octave 4
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note F_, 1
	note F#, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note A#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note A_, 1
	octave 2
	note A#, 1
	note B_, 1
	octave 3
	note D#, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note G#, 1
	octave 4
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	note G#, 1
	octave 4
	note D#, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note B_, 1
	note C_, 1
	note C#, 1
	note F_, 1
	note G_, 1
	note __, 15
	intensity $b7
	octave 2
	note G#, 15
	note __, 15
	note A_, 15
	intensity $b3

Music_RocketHideout_branch_eebfe: ; eebfe
	note __, 15
	loopchannel 4, Music_RocketHideout_branch_eebfe
	loopchannel 0, Music_RocketHideout_branch_eeb93

Music_RocketHideout_Ch2: ; eec07
	dutycycle $3
	tone $0002
	vibrato $0, $f0
	notetype $c, $c4
	stereopanning $f

Music_RocketHideout_branch_eec14: ; eec14
	octave 2
	note D#, 1
	note __, 1
	note A#, 3
	note A_, 1
	note __, 5
	note D#, 1
	note A#, 3
	note A_, 1
	note __, 7
	note D#, 1
	note __, 1
	note A#, 3
	note A_, 1
	note __, 5
	note D#, 1
	note A#, 3
	note A_, 1
	note __, 7
	octave 3
	note D#, 11
	note A#, 1
	note A_, 1
	octave 4
	note C#, 7
	note C_, 7
	octave 3
	note A#, 11
	note A_, 3
	note F#, 7
	note F_, 7
	octave 4
	note D#, 11
	note A#, 1
	note A_, 1
	note F#, 7
	note F_, 7
	note D#, 11
	note D_, 3
	octave 3
	note B_, 7
	note A#, 7
	octave 4
	note F_, 11
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note G#, 7
	note G_, 7
	note F_, 11
	note E_, 3
	note C#, 7
	note C_, 7
	octave 2
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	intensity $c7
	octave 3
	note C#, 15
	intensity $c4
	octave 2
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	intensity $c7
	octave 3
	note C#, 15
	intensity $c4
	octave 2
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	note C#, 1
	note G#, 3
	note G_, 1
	note __, 7
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	note C#, 1
	note G#, 3
	note G_, 1
	note __, 7
	loopchannel 0, Music_RocketHideout_branch_eec14

Music_RocketHideout_Ch3: ; eec79
	notetype $c, $19

Music_RocketHideout_branch_eec7c: ; eec7c
	octave 2
	note D#, 1
	note __, 1
	note A#, 3
	note A_, 1
	note __, 5
	note D#, 1
	note A#, 3
	note A_, 1
	note __, 7
	loopchannel 6, Music_RocketHideout_branch_eec7c

Music_RocketHideout_branch_eec8a: ; eec8a
	note F_, 1
	note __, 1
	octave 3
	note C_, 3
	octave 2
	note B_, 1
	note __, 5
	note F_, 1
	octave 3
	note C_, 3
	octave 2
	note B_, 1
	note __, 7
	loopchannel 2, Music_RocketHideout_branch_eec8a

Music_RocketHideout_branch_eec9b: ; eec9b
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	octave 3
	note C#, 15
	loopchannel 2, Music_RocketHideout_branch_eec9b

Music_RocketHideout_branch_eeca6: ; eeca6
	octave 2
	note C#, 1
	note __, 1
	note G#, 3
	note G_, 1
	note __, 5
	note C#, 1
	note G#, 3
	note G_, 1
	note __, 7
	loopchannel 2, Music_RocketHideout_branch_eeca6
	loopchannel 0, Music_RocketHideout_branch_eec7c

Music_RocketHideout_Ch4: ; eecb8
	togglenoise $0
	notetype $c
	stereopanning $f
	note __, 15
	note __, 15
	note D_, 0
	note D_, 0
	note D#, 0
	note D#, 0
	callchannel Music_RocketHideout_branch_eecdb

Music_RocketHideout_branch_eecc7: ; eecc7
	callchannel Music_RocketHideout_branch_eecdb
	note E_, 3
	callchannel Music_RocketHideout_branch_eecdb
	note F_, 3
	callchannel Music_RocketHideout_branch_eecdb
	note A#, 3
	callchannel Music_RocketHideout_branch_eecdb
	note F#, 3
	loopchannel 0, Music_RocketHideout_branch_eecc7
; eecdb

Music_RocketHideout_branch_eecdb: ; eecdb
	stereopanning $f0
	note D#, 0
	note D#, 0
	stereopanning $f
	note A_, 3
	note D#, 0
	note D#, 0
	stereopanning $f0
	note A_, 3
	endchannel
; eece8
