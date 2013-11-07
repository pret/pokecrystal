Music_ViridianCity: ; f4000
	dbw $c0, Music_ViridianCity_Ch1
	dbw $01, Music_ViridianCity_Ch2
	dbw $02, Music_ViridianCity_Ch3
	dbw $03, Music_ViridianCity_Ch4
; f400c


Music_ViridianCity_Ch1: ; f400c
	tempo 157
	volume $77
	stereopanning $f
	dutycycle $2
	vibrato $12, $34
	notetype $c, $a7
	octave 3
	note F#, 0
	note __, 2
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note F#, 0
	note __, 0
	note F#, 3
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note F#, 0
	note __, 0
	note F#, 0
	note __, 2
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note G_, 0
	note __, 0
	note __, 3
	note G_, 7
	note __, 3

Music_ViridianCity_branch_f4039: ; f4039
	callchannel Music_ViridianCity_branch_f40c5
	note __, 3
	callchannel Music_ViridianCity_branch_f40c5
	octave 4
	note C_, 3
	callchannel Music_ViridianCity_branch_f410f
	octave 4
	note B_, 1
	note G_, 1
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	note E_, 1
	note F#, 0
	note __, 0
	note A_, 0
	note __, 2
	note F#, 1
	note A_, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	note __, 1
	octave 3
	note A_, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	note F#, 0
	note __, 0
	intensity $87
	octave 5
	note F#, 3
	note F_, 3
	intensity $a7
	octave 3
	note G_, 5
	note B_, 7
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	octave 3
	note B_, 3
	note G_, 1
	note F#, 1
	note E_, 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 0
	note __, 0
	note F#, 0
	note __, 2
	note D_, 1
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note __, 1
	note F#, 1
	note A_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note D#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	callchannel Music_ViridianCity_branch_f410f
	octave 4
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note F#, 1
	note E_, 1
	note F#, 0
	note __, 0
	note A_, 0
	note __, 2
	note F#, 1
	note A_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note F#, 1
	note G_, 5
	note B_, 0
	note __, 0
	octave 4
	note E_, 3
	note F#, 1
	note G_, 5
	note E_, 1
	note __, 1
	octave 3
	note G_, 1
	octave 4
	note E_, 1
	note __, 1
	note F#, 5
	note D_, 3
	octave 3
	note A_, 3
	note F#, 3
	note G_, 0
	note __, 2
	note G_, 7
	note A#, 3
	loopchannel 0, Music_ViridianCity_branch_f4039
; f40c5

Music_ViridianCity_branch_f40c5: ; f40c5
	octave 3
	note A_, 0
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 0
	note __, 0
	octave 4
	note C_, 3
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note G_, 0
	note __, 0
	note G_, 3
	note __, 1
	note B_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 2
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	note D_, 0
	note __, 0
	octave 3
	note G_, 3
	note __, 1
	octave 4
	note C#, 0
	note __, 0
	note E_, 0
	note __, 0
	note D_, 3
	note C#, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 2
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note G_, 0
	note __, 0
	note __, 3
	note G_, 7
	endchannel
; f410f

Music_ViridianCity_branch_f410f: ; f410f
	octave 3
	note B_, 1
	note D_, 1
	note G_, 0
	note __, 0
	note B_, 0
	note __, 2
	note G_, 1
	note B_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	endchannel

Music_ViridianCity_Ch2: ; f4125
	vibrato $10, $46
	dutycycle $1
	notetype $c, $b7
	stereopanning $f0
	octave 2
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 3
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note C#, 3
	octave 2
	note A_, 0
	note __, 0
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 1
	note E_, 0
	note __, 0
	note __, 3
	note E_, 7
	note __, 3

Music_ViridianCity_branch_f414c: ; f414c
	callchannel Music_ViridianCity_branch_f41c0
	note __, 3
	callchannel Music_ViridianCity_branch_f41c0
	octave 2
	note F#, 3
	callchannel Music_ViridianCity_branch_f4201
	note G_, 3
	note __, 1
	octave 3
	note D_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note D_, 3
	octave 2
	note B_, 1
	callchannel Music_ViridianCity_branch_f420b
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note C#, 0
	note __, 0
	note C#, 3
	note C_, 3
	callchannel Music_ViridianCity_branch_f4215
	note E_, 3
	note __, 1
	note B_, 0
	note __, 0
	note E_, 1
	note B_, 1
	note G_, 3
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note C_, 1
	note C#, 1
	note __, 1
	note D#, 1
	note A_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note D#, 1
	note C_, 1
	octave 2
	note A_, 1
	note F#, 1
	callchannel Music_ViridianCity_branch_f4201
	note G_, 3
	note __, 1
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 3
	note G_, 1
	callchannel Music_ViridianCity_branch_f420b
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note D#, 1
	callchannel Music_ViridianCity_branch_f4215
	note E_, 3
	note __, 1
	note A#, 0
	note __, 0
	note A#, 3
	note __, 1
	note G_, 0
	note __, 0
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 1
	note D_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 7
	octave 1
	note A_, 3
	loopchannel 0, Music_ViridianCity_branch_f414c
; f41c0

Music_ViridianCity_branch_f41c0: ; f41c0
	octave 2
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 3
	note D#, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note C_, 3
	octave 2
	note A_, 0
	note __, 0
	note E_, 3
	note __, 1
	note B_, 0
	note __, 0
	note B_, 3
	note __, 3
	note E_, 3
	note __, 1
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 3
	note D_, 3
	octave 2
	note B_, 0
	note __, 0
	note G_, 3
	note __, 1
	octave 3
	note D_, 0
	note __, 0
	note D_, 3
	note __, 3
	octave 2
	note A_, 3
	note __, 1
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 3
	note E_, 0
	note __, 0
	octave 2
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 1
	note E_, 0
	note __, 0
	note __, 3
	note E_, 7
	endchannel
; f4201

Music_ViridianCity_branch_f4201: ; f4201
	note G_, 3
	note __, 1
	octave 3
	note D_, 0
	note __, 0
	note D_, 3
	octave 2
	note F_, 1
	note F#, 1
	endchannel
; f420b

Music_ViridianCity_branch_f420b: ; f420b
	note F#, 3
	note __, 1
	octave 3
	note C#, 0
	note __, 0
	note C#, 3
	octave 2
	note E_, 1
	note F_, 1
	endchannel
; f4215

Music_ViridianCity_branch_f4215: ; f4215
	octave 2
	note E_, 3
	note __, 1
	note B_, 0
	note __, 0
	note B_, 3
	note D_, 1
	note D#, 1
	endchannel

Music_ViridianCity_Ch3: ; f421e
	vibrato $12, $24
	notetype $c, $13
	stereopanning $ff
	octave 4
	note A_, 0
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 0
	note __, 0
	note A_, 3
	note __, 1
	octave 5
	note F#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note A_, 0
	note __, 0
	note A_, 0
	note __, 2
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	octave 5
	note D_, 0
	note __, 0
	note __, 3
	note D_, 7
	note F#, 1
	note G_, 1

Music_ViridianCity_branch_f4246: ; f4246
	intensity $13
	callchannel Music_ViridianCity_branch_f42a2
	octave 5
	note F#, 1
	note G_, 1
	callchannel Music_ViridianCity_branch_f42a2
	note E_, 3
	vibrato $18, $25
	intensity $25
	note B_, 11
	note G_, 3
	octave 6
	note D_, 7
	note E_, 1
	note D_, 1
	note C#, 1
	octave 5
	note B_, 1
	note A_, 11
	note F#, 3
	note A_, 7
	note A_, 3
	note G#, 3
	note E_, 9
	note E_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note F#, 3
	note E_, 3
	note G_, 3
	note F#, 11
	note D_, 3
	note A_, 3
	note __, 3
	octave 6
	note C_, 7
	octave 5
	note B_, 11
	octave 6
	note C#, 1
	note D_, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 9
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 11
	note G_, 1
	note A_, 1
	note A#, 5
	note A_, 1
	note __, 1
	note G_, 1
	note A#, 1
	note __, 1
	note A_, 13
	note __, 3
	note D_, 0
	note __, 2
	note D_, 7
	note E_, 3
	loopchannel 0, Music_ViridianCity_branch_f4246
; f42a2

Music_ViridianCity_branch_f42a2: ; f42a2
	octave 5
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 5
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note E_, 1
	octave 4
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note B_, 0
	note __, 0
	note B_, 3
	octave 5
	note E_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 5
	note __, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	octave 5
	note D_, 0
	note __, 0
	note __, 3
	note D_, 7
	endchannel

Music_ViridianCity_Ch4: ; f42df
	togglenoise $3
	notetype $c
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c

Music_ViridianCity_branch_f42e9: ; f42e9
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f431d
	callchannel Music_ViridianCity_branch_f432c
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f434b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f434b
	callchannel Music_ViridianCity_branch_f433b
	callchannel Music_ViridianCity_branch_f433b
	loopchannel 0, Music_ViridianCity_branch_f42e9
; f431d

Music_ViridianCity_branch_f431d: ; f431d
	note E_, 1
	note E_, 1
	note D_, 1
	note E_, 3
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note E_, 1
	note D_, 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	endchannel
; f432c

Music_ViridianCity_branch_f432c: ; f432c
	note E_, 1
	note E_, 1
	note D_, 1
	note E_, 3
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note E_, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note A#, 1
	note A#, 1
	endchannel
; f433b

Music_ViridianCity_branch_f433b: ; f433b
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note F#, 1
	note D_, 3
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 1
	endchannel
; f434b

Music_ViridianCity_branch_f434b: ; f434b
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note F#, 1
	note D_, 3
	note D#, 1
	note F#, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note F#, 1
	endchannel
; f435b
