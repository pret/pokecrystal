Music_NewBarkTown: ; eb2d3
	dbw $80, Music_NewBarkTown_Ch1
	dbw $01, Music_NewBarkTown_Ch2
	dbw $02, Music_NewBarkTown_Ch3
; eb2dc


INCBIN "baserom.gbc", $eb2dc, $eb2dd - $eb2dc


Music_NewBarkTown_Ch1: ; eb2dd
	tempo 187
	volume $7, $7
	stereopanning $f
	vibrato $12, $2, $3
	notetype $c, $8, $0, $7
	note __, 4
Music_NewBarkTown_branch_eb2eb: ; eb2eb
	waveduty $0
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note G_, 2
	note F#, 2
	waveduty $2
	volenvelope $8, $0, $2
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	waveduty $0
	volenvelope $8, $0, $7
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 2
	waveduty $2
	volenvelope $8, $0, $2
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note A_, 1
	waveduty $1
	volenvelope $5, $1, $6
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 2
	volenvelope $8, $0, $7
	loopchannel 0, Music_NewBarkTown_branch_eb2eb
; eb349

Music_NewBarkTown_branch_eb349: ; eb349
	octave 3
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	note __, 1
	endchannel
; eb37c

Music_NewBarkTown_branch_eb37c: ; eb37c
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note E_, 2
	endchannel
; eb38d

Music_NewBarkTown_Ch2: ; eb38d
	stereopanning $ff
	vibrato $12, $2, $3
	notetype $6, $a, $0, $7
	note __, 8
Music_NewBarkTown_branch_eb396: ; eb396
	waveduty $2
	notetype $6, $a, $0, $7
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3f2
	volenvelope $8, $0, $7
	octave 5
	note B_, 6
	note A_, 6
	volenvelope $7, $0, $7
	octave 6
	note D_, 4
	note C#, 16
	callchannel Music_NewBarkTown_branch_eb3f2
	volenvelope $8, $0, $7
	octave 5
	note B_, 6
	note A_, 6
	volenvelope $7, $0, $7
	octave 6
	note D_, 4
	note E_, 16
	loopchannel 0, Music_NewBarkTown_branch_eb396
; eb3bf

Music_NewBarkTown_branch_eb3bf: ; eb3bf
	octave 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	note A#, 2
	note __, 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note G_, 4
	note __, 8
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 1
	note G#, 2
	note __, 2
	note G#, 8
	octave 2
	note D_, 2
	note __, 2
	note A_, 4
	note __, 8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 1
	note A_, 2
	note __, 2
	note A_, 8
	octave 2
	note C#, 4
	endchannel
; eb3f2

Music_NewBarkTown_branch_eb3f2: ; eb3f2
	notetype $6, $9, $0, $7
	waveduty $2
	octave 4
	note B_, 12
	note A_, 12
	note G_, 8
	notetype $c, $9, $0, $7
	note E_, 16
	endchannel
; eb400

Music_NewBarkTown_Ch3: ; eb400
	stereopanning $f0
	notetype $c, $1, $0, $0
	octave 5
	note D_, 2
	note E_, 2
Music_NewBarkTown_branch_eb408: ; eb408
	vibrato $16, $2, $3
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 6
	note D_, 2
	octave 4
	note A_, 6
	note G_, 1
	note A_, 1
	note B_, 4
	octave 5
	note D_, 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 6
	note F#, 2
	note E_, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 4
	note A_, 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note A_, 6
	octave 6
	note C#, 2
	note D_, 6
	octave 5
	note E_, 1
	note F#, 1
	note G_, 6
	note A_, 2
	note B_, 8
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	note __, 4
	volenvelope $2, $0, $5
	vibrato $12, $5, $3
	octave 2
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 14
	volenvelope $1, $0, $0
	vibrato $16, $2, $3
	octave 5
	note D_, 1
	note E_, 1
	loopchannel 0, Music_NewBarkTown_branch_eb408
; eb453


