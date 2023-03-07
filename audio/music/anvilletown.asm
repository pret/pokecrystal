; Composed by Mmmmmmmmmmmmmmmmm
; Source: https://soundcloud.com/mmmmmmmmmmmmmmmmm-1/anville-town-gbc-8-bit

Music_AnvilleTown:
	dbw $80, Music_AnvilleTown_Ch1
	dbw $01, Music_AnvilleTown_Ch2
	dbw $02, Music_AnvilleTown_Ch3

Music_AnvilleTown_Ch1:
	tempo 175
	dutycycle $1
	tone $0001
	notetype $C, $73
	octave 3
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
Music_AnvilleTown_Ch1_loop:
	callchannel Music_AnvilleTown_Ch1_branch_1
	note C_, 6
	dutycycle $0
	intensity $97
	note G_, 4
	note F#, 2
	note F_, 4
	note E_, 2
	note D#, 4
	note D_, 2
	note D_, 4
	note F_, 2
	note __, 6
	octave 2
	note D#, 4
	note F_, 2
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note F#, 2
	octave 3
	note E_, 4
	note G_, 2
	note __, 6
	note C_, 4
	note D_, 2
	note A#, 4
	note A_, 2
	note G_, 16
	notetype $6, $97
	note __, 1
	note F#, 1
	note E_, 1
	note D#, 1
	notetype $c, $97
	note C_, 4
	note F#, 2
	octave 2
	note G_, 6
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
	note A_, 6
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
	callchannel Music_AnvilleTown_Ch1_branch_1
	dutycycle $0
	intensity $97
	octave 2
	note A_, 2
	note G#, 2
	note A_, 2
	octave 3
	note G_, 4
	note F#, 2
	octave 2
	note F#, 2
	note F_, 2
	note F#, 2
	octave 3
	note D#, 4
	note E_, 2
	note D_, 4
	note F_, 2
	note __, 6
	octave 2
	note D#, 4
	note F_, 2
	octave 3
	note C#, 3
	notetype $6, $97
	note C_, 1
	octave 2
	note A#, 1
	notetype $c, $97
	note F#, 2
	octave 3
	note E_, 4
	note G_, 2
	note __, 6
	note C_, 4
	note D_, 2
	note A#, 4
	note A_, 2
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	octave 4
	note A_, 2
	octave 2
	note __, 2
	note E_, 2
	octave 3
	note E_, 6
	note G_, 4
	note F_, 8
	note D_, 6
	note C_, 6
	octave 2
	note A#, 6
	intensity $74
	dutycycle $1
	octave 3
	note D#, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 1
	note D#, 1
	note F#, 4
	note F#, 1
	note F#, 1
	note F#, 4
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note __, 1
	note G_, 1
	note B_, 1
	octave 3
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note C_, 1
	note C_, 1
	note F_, 4
	note F_, 2
	note E_, 4
	note __, 2
	note E_, 4
	note __, 2
	note F_, 4
	note __, 2
	note F_, 4
	note __, 8
	note A_, 4
	note A_, 2
	dutycycle $1
	intensity $73
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	loopchannel 0, Music_AnvilleTown_Ch1_loop
	
Music_AnvilleTown_Ch1_branch_1:
	intensity $74
	dutycycle $1
	octave 3
	note G_, 6
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note F#, 4
	note F#, 2
	octave 4
	note F_, 2
	octave 3
	note D_, 2
	note G_, 2
	note A#, 4
	octave 4
	note G_, 4
	octave 3
	note E_, 2
	note G_, 2
	note E_, 4
	note E_, 2
	octave 4
	note A_, 4
	octave 3
	note C_, 1
	note A_, 1
	octave 4
	note G_, 4
	note D_, 4
	octave 3
	note F_, 2
	note A#, 2
	note C#, 4
	note G#, 2
	endchannel

Music_AnvilleTown_Ch2:
	tone $0001
	dutycycle 2
	notetype $C, $73
	octave 4
	note C_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A#, 2
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	note E_, 2
	note C_, 2
	octave 4
	note G#, 3
Music_AnvilleTown_Ch2_loop:
	octave 1
	dutycycle $2
	intensity $96
	note F_, 4
	note C_, 2
	note __, 6
	note D_, 4
	note D_, 2
	note __, 6
	octave 1
	note G_, 4
	note D_, 2
	note __, 6
	octave 2
	note C_, 4
	octave 1
	note C_, 2
	note __, 6
	note F_, 4
	note F_, 2
	note __, 6
	note A#, 4
	note C#, 2
	note __, 4
	note D_, 2
	note E_, 6
	note A_, 6
	note D_, 6
	note F#, 4
	note A_, 2
	note G_, 4
	note D_, 2
	note __, 6
	note A#, 4
	octave 2
	note F_, 2
	note D#, 2
	note C#, 2
	octave 1
	note A#, 2
	note A_, 4
	octave 2
	note C_, 2
	note __, 6
	octave 1
	note D_, 4
	note D_, 2
	note A_, 4
	note G#, 2
	note G_, 12
	octave 2
	note C_, 6
	octave 1
	note C_, 6
	note A_, 6
	note G#, 6
	note G_, 6
	note F#, 6
	note F_, 4
	note F_, 2
	note __, 6
	note D_, 4
	note D_, 2
	note __, 6
	note G_, 4
	note D_, 2
	note __, 6
	octave 2
	note C_, 6
	octave 1
	note C_, 6
	note F_, 4
	note __, 2
	note F_, 6
	note A#, 4
	note __, 2
	note A#, 6
	note A_, 10
	note F#, 2
	note D_, 6
	note F#, 4
	note A_, 2
	note G_, 4
	note G_, 2
	note __, 6
	note A#, 4
	octave 2
	note F_, 2
	note D#, 2
	note C#, 2
	octave 1
	note A#, 2
	note A_, 4
	octave 2
	note C_, 2
	note __, 6
	octave 1
	note D_, 4
	note D_, 2
	note __, 6
	note G_, 4
	octave 2
	note D_, 2
	note __, 4
	octave 1
	note G_, 2
	octave 2
	note C_, 6
	note C_, 2
	octave 1
	note A#, 2
	note G_, 2
	note F_, 6
	note G_, 6
	note A_, 6
	note G_, 6
;;;;;;;;;;;;;;;mark
	note F_, 10
	note G#, 2
	note A#, 6
	note F_, 4
	note E_, 2
	note D#, 4
	note D#, 2
	note G_, 4
	note D#, 2
	note A#, 4
	note G_, 2
	octave 2
	note A#, 2
	note G_, 2
	note D#, 2
	note D_, 6
	octave 1
	note F_, 4
	note D_, 2
	note G_, 6
	note G_, 6
	note C_, 4
	note G_, 2
	octave 2
	note D_, 4
	octave 1
	note G_, 2
	dutycycle 2
	notetype $C, $73
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	note E_, 2
	note C_, 2
	octave 4
	note G#, 3
	loopchannel 0, Music_AnvilleTown_Ch2_loop
	

Music_AnvilleTown_Ch3:
	stereopanning $ff
	notetype $C, $25
	vibrato $16, $13
	octave 2
	note G_, 8
	intensity $35
	note G_, 4
	intensity $25
	note C_, 6
	octave 3
	note C#, 4
	octave 2
	note A#, 2
Music_AnvilleTown_Ch3_branch_1:
	intensity $13
	octave 5
	note C_, 10
	octave 6
	note C_, 1
	octave 5
	note F_, 1
	note A#, 4
	note A_, 2
	note __, 6
	octave 5
	note D_, 10
	octave 6
	note D_, 1
	octave 5
	note G_, 1
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	note __, 4
	note A_, 1
	note A#, 1
	octave 6
	note C_, 8
	intensity $23
	note C_, 4
	intensity $13
	note G_, 6
	intensity $33
	note G_, 2
	note __, 2
	intensity $13
	note F_, 2
	note C_, 12
	intensity $23
	note C_, 6
	intensity $33
	note C_, 6
	intensity $13
	note D_, 8
	octave 5
	note D_, 2
	note F_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	note __, 6
	octave 6
	note C_, 8
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	notetype $6, $13
	note __, 3
	note B_, 1
	octave 6
	notetype $c, $13
	note C_, 2
	octave 5
	note A_, 6
	note __, 4
	octave 4
	note B_, 2
	octave 5
	note C_, 2
	note A_, 6
	note C_, 2
	note __, 2
	note E_, 8
	note D#, 6
	note D_, 6
	note E_, 6
;;;;;;;;;;;;;;mark
	note C_, 2
	note D_, 2
	note E_, 2
	notetype $6, $13
	note F_, 3
	note B_, 1
	notetype $c, $13
	octave 6
	note C_, 2
	note __, 1
	octave 5
	note F_, 1
	note A#, 4
	note A_, 2
	note __, 6
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 4
	octave 6
	note D_, 1
	octave 5
	note G_, 1
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	note __, 4
	note A_, 1
	note A#, 1
	octave 6
	note C_, 8
	notetype $6, $23
	note C_, 7
	intensity $13
	note F#, 1
	notetype $c, $13
	note G_, 4
	note A_, 2
	intensity $33
	note A_, 2
	intensity $13
	note G_, 4
	note C_, 12
	intensity $23
	note C_, 6
	notetype $6, $33
	note C_, 11
	intensity $13
	note C#, 1
	notetype $c, $13
	note D_, 6
	intensity $33
	note D_, 2
	intensity $13
	octave 5
	note D_, 2
	note F_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	intensity $33
	note A#, 2
	note __, 4
	intensity $13
	octave 6
	note C_, 8
	intensity $33
	note C_, 2
	intensity $13
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 4
	octave 5
	note A#, 2
	notetype $6, $33
	note A#, 3
	intensity $13
	note B_, 1
	notetype $c, $13
	octave 6
	note C_, 2
	octave 5
	note A_, 8
	intensity $33
	note A_, 2
	intensity $13
	note __, 2
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	notetype $6, $13
	note G#, 11
	note G_, 1
	notetype $c, $13
	note G#, 4
	note F_, 12
	intensity $23
	note F_, 6
	intensity $13
	note __, 10
;;;;;;;;;;;;;;mark
	note A#, 1
	note B_, 1
	octave 6
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 2
	note G_, 4
	note A#, 1
	note F#, 5
	note D_, 2
	note F_, 3
	note __, 1
	note F_, 4
	note G_, 8
	intensity $23
	note G_, 4
	intensity $33
	note G_, 2
	notetype $6, $13
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 1
	notetype $c, $13
	note G_, 2
	note A_, 4
	note C#, 2
	note D_, 2
	note F_, 2
	note E_, 5
	notetype $6, $13
	note F_, 1
	note E_, 1
	note D_, 7
	note F#, 1
	notetype $c, $13
	note G_, 8
	intensity $23
	note G_, 6
	intensity $25
	octave 2
	note C_, 6
	octave 3
	note C#, 4
	octave 2
	note A#, 2
	loopchannel 0, Music_AnvilleTown_Ch3_branch_1