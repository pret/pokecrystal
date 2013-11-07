Music_NewBarkTown: ; eb2d3
	dbw $80, Music_NewBarkTown_Ch1
	dbw $01, Music_NewBarkTown_Ch2
	dbw $02, Music_NewBarkTown_Ch3
; eb2dc

INCBIN "baserom.gbc", $eb2dc, $eb2dd - $eb2dc

Music_NewBarkTown_Ch1: ; eb2dd
	tempo 187
	volume $77
	stereopanning $f
	vibrato $12, $23
	notetype $c, $87
	note __, 3

Music_NewBarkTown_branch_eb2eb: ; eb2eb
	dutycycle $0
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 0
	note __, 0
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note G_, 1
	note F#, 1
	dutycycle $2
	intensity $82
	note E_, 0
	note F#, 0
	note E_, 0
	note D_, 0
	note C#, 0
	octave 2
	note B_, 0
	note A_, 0
	note G_, 0
	dutycycle $0
	intensity $87
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 0
	note __, 0
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note E_, 1
	dutycycle $2
	intensity $82
	note C#, 0
	note __, 0
	octave 2
	note A_, 0
	octave 3
	note C#, 0
	note E_, 0
	note G_, 0
	note A_, 0
	octave 4
	note C#, 0
	note E_, 0
	note A_, 0
	dutycycle $1
	intensity $5e
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	octave 2
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 3
	note G_, 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 3
	note A_, 3
	note B_, 1
	intensity $87
	loopchannel 0, Music_NewBarkTown_branch_eb2eb
; eb349

Music_NewBarkTown_branch_eb349: ; eb349
	octave 3
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 1
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note A#, 1
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note B_, 1
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 4
	note C_, 1
	octave 3
	note D_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 3
	note G_, 1
	octave 2
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G#, 0
	note __, 0
	octave 3
	note E_, 1
	octave 2
	note B_, 0
	note __, 0
	endchannel
; eb37c

Music_NewBarkTown_branch_eb37c: ; eb37c
	octave 2
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 3
	note G_, 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 3
	note A_, 3
	note E_, 1
	endchannel

Music_NewBarkTown_Ch2: ; eb38d
	stereopanning $ff
	vibrato $12, $23
	notetype $6, $a7
	note __, 7

Music_NewBarkTown_branch_eb396: ; eb396
	dutycycle $2
	notetype $6, $a7
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 5
	note A_, 5
	intensity $77
	octave 6
	note D_, 3
	note C#, 15
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 5
	note A_, 5
	intensity $77
	octave 6
	note D_, 3
	note E_, 15
	loopchannel 0, Music_NewBarkTown_branch_eb396
; eb3bf

Music_NewBarkTown_branch_eb3bf: ; eb3bf
	octave 2
	note D_, 3
	note __, 7
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note D_, 1
	note __, 1
	note D_, 7
	note A#, 1
	note __, 1
	note D_, 3
	note __, 7
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note D_, 1
	note __, 1
	note D_, 7
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 3
	note __, 7
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 1
	note G#, 1
	note __, 1
	note G#, 7
	octave 2
	note D_, 1
	note __, 1
	note A_, 3
	note __, 7
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 1
	note A_, 1
	note __, 1
	note A_, 7
	octave 2
	note C#, 3
	endchannel
; eb3f2

Music_NewBarkTown_branch_eb3f2: ; eb3f2
	notetype $6, $97
	dutycycle $2
	octave 4
	note B_, 11
	note A_, 11
	note G_, 7
	notetype $c, $97
	note E_, 15
	endchannel

Music_NewBarkTown_Ch3: ; eb400
	stereopanning $f0
	notetype $c, $10
	octave 5
	note D_, 1
	note E_, 1

Music_NewBarkTown_branch_eb408: ; eb408
	vibrato $16, $23
	note F#, 3
	note A_, 3
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	note F#, 5
	note D_, 1
	octave 4
	note A_, 5
	note G_, 0
	note A_, 0
	note B_, 3
	octave 5
	note D_, 3
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 5
	note F#, 1
	note E_, 3
	note __, 1
	note D_, 0
	note E_, 0
	note F#, 3
	note A_, 3
	note A#, 1
	note A_, 1
	note G_, 1
	note A#, 1
	note A_, 5
	octave 6
	note C#, 1
	note D_, 5
	octave 5
	note E_, 0
	note F#, 0
	note G_, 5
	note A_, 1
	note B_, 7
	note A_, 5
	note G_, 0
	note F#, 0
	note E_, 3
	note __, 3
	intensity $25
	vibrato $12, $53
	octave 2
	note G_, 15
	note A_, 15
	note G_, 15
	note A_, 15
	note G_, 15
	note A_, 15
	note G_, 15
	note A_, 13
	intensity $10
	vibrato $16, $23
	octave 5
	note D_, 0
	note E_, 0
	loopchannel 0, Music_NewBarkTown_branch_eb408
; eb453
