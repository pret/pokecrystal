Music_Surf: ; f518a
	dbw $80, Music_Surf_Ch1
	dbw $01, Music_Surf_Ch2
	dbw $02, Music_Surf_Ch3
; f5193


INCBIN "baserom.gbc", $f5193, $f5194 - $f5193


Music_Surf_Ch1: ; f5194
	tempo 108
	volume $7, $7
	notetype $c, $a, $0, $7
	stereopanning $f
Music_Surf_branch_f519e: ; f519e
	waveduty $2
	vibrato $10, $2, $4
	volenvelope $7, $0, $3
	octave 3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	volenvelope $7, $0, $3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	volenvelope $7, $0, $3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	volenvelope $9, $0, $3
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	volenvelope $a, $0, $7
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	volenvelope $b, $0, $7
	note __, 1
	note A#, 2
	note G#, 2
	note F_, 2
	note D_, 2
	notetype $8, $c, $0, $7
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	volenvelope $f, $0, $7
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	waveduty $0
	callchannel Music_Surf_branch_f5233
	waveduty $1
	notetype $8, $a, $0, $7
	callchannel Music_Surf_branch_f5233
	callchannel Music_Surf_branch_f5293
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	octave 4
	note C_, 2
	note D#, 2
	note G_, 2
	waveduty $1
	notetype $6, $9, $0, $7
	callchannel Music_Surf_branch_f5293
	volenvelope $a, $1, $0
	note G#, 6
	note A_, 6
	note A#, 3
	octave 4
	note D_, 3
	volenvelope $a, $1, $0
	waveduty $1
	callchannel Music_Surf_branch_f52d9
	octave 3
	note D#, 8
	note G#, 8
	note D#, 8
	waveduty $3
	notetype $8, $9, $1, $0
	callchannel Music_Surf_branch_f52d9
	notetype $c, $a, $0, $7
	octave 3
	note D#, 12
	octave 2
	note F_, 4
	note D#, 4
	note F_, 4
	note G#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 0, Music_Surf_branch_f519e
; f5233

Music_Surf_branch_f5233: ; f5233
	notetype $c, $a, $0, $7
	octave 3
	note D#, 4
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note D#, 4
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note C#, 4
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note C#, 4
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note C_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 4
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	notetype $6, $a, $0, $7
	octave 3
	note A#, 1
	note B_, 15
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note F_, 8
	note C#, 4
	note D_, 4
	endchannel
; f5293

Music_Surf_branch_f5293: ; f5293
	octave 4
	note G#, 16
	note D#, 4
	note C_, 4
	octave 3
	note G#, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note G#, 4
	notetype $8, $9, $0, $2
	note A#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	notetype $6, $9, $0, $7
	note C#, 1
	note D_, 15
	note G_, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note G_, 4
	note A_, 4
	note A#, 4
	notetype $8, $9, $0, $2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 3
	note G_, 2
	endchannel
; f52d9

Music_Surf_branch_f52d9: ; f52d9
	octave 3
	note A#, 3
	note G_, 3
	note A#, 3
	octave 4
	note D#, 9
	notetype $6, $5, $1, $0
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	volenvelope $a, $1, $0
	note D#, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note A_, 4
	note G#, 4
	note G_, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note G_, 8
	note C#, 8
	note A#, 8
	note A_, 1
	note A#, 3
	note G#, 4
	octave 4
	note C_, 4
	note F_, 12
	volenvelope $5, $1, $0
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	volenvelope $a, $1, $0
	note G#, 8
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note D#, 8
	octave 2
	note B_, 8
	endchannel
; f5317

Music_Surf_Ch2: ; f5317
Music_Surf_branch_f5317: ; f5317
	notetype $c, $c, $0, $2
	stereopanning $f0
	waveduty $2
	vibrato $14, $2, $3
Music_Surf_branch_f5321: ; f5321
	octave 1
	note A#, 4
	octave 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 3
	loopchannel 3, Music_Surf_branch_f5321
	octave 1
	note A#, 4
	octave 2
	note F_, 1
	note __, 3
	note A#, 1
	note __, 3
Music_Surf_branch_f5333: ; f5333
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	octave 1
	note B_, 4
	octave 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note B_, 4
	note A#, 4
	note G#, 4
	loopchannel 2, Music_Surf_branch_f5333
	volenvelope $c, $0, $7
	callchannel Music_Surf_branch_f53b2
	note D#, 4
	note D_, 4
	note C#, 4
	callchannel Music_Surf_branch_f53b2
	note D_, 4
	note D#, 4
	octave 1
	note A#, 4
	notetype $6, $b, $1, $0
	callchannel Music_Surf_branch_f53d6
	waveduty $1
	volenvelope $b, $1, $0
	callchannel Music_Surf_branch_f53e8
	waveduty $2
	callchannel Music_Surf_branch_f53f3
	waveduty $1
	volenvelope $b, $1, $0
	callchannel Music_Surf_branch_f5404
	octave 3
	note B_, 16
	octave 4
	note C#, 8
	transpose $0, $c
	waveduty $3
	callchannel Music_Surf_branch_f53d6
	volenvelope $b, $1, $0
	waveduty $1
	callchannel Music_Surf_branch_f53e8
	waveduty $3
	callchannel Music_Surf_branch_f53f3
	volenvelope $b, $1, $0
	waveduty $1
	callchannel Music_Surf_branch_f5404
	transpose $0, $0
	notetype $c, $b, $1, $0
	octave 4
	note B_, 12
	waveduty $2
	note A#, 4
	note G#, 4
	note D#, 4
	note G#, 4
	note A#, 4
	note B_, 4
	loopchannel 0, Music_Surf_branch_f5317
; f53b2

Music_Surf_branch_f53b2: ; f53b2
	octave 1
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	octave 1
	note G#, 4
	octave 3
	note D#, 4
	note D_, 4
	octave 1
	note A#, 4
	octave 3
	note C_, 4
	octave 2
	note A#, 4
	octave 1
	note A#, 4
	octave 2
	note G#, 4
	note A#, 4
	octave 1
	note G_, 4
	octave 3
	note D_, 4
	note C_, 4
	octave 1
	note G_, 4
	octave 2
	note A#, 4
	note G_, 4
	note C_, 4
	octave 3
	note F_, 4
	note G_, 4
	endchannel
; f53d6

Music_Surf_branch_f53d6: ; f53d6
	octave 4
	note F_, 4
	note D#, 4
	note F_, 4
	note G_, 12
	volenvelope $5, $1, $0
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	endchannel
; f53e8

Music_Surf_branch_f53e8: ; f53e8
	note A#, 7
	octave 4
	note C_, 8
	note C#, 16
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 16
	note G_, 8
	endchannel
; f53f3

Music_Surf_branch_f53f3: ; f53f3
	note F#, 1
	note G_, 3
	note F_, 4
	note G_, 4
	note G#, 12
	volenvelope $5, $1, $0
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	endchannel
; f5404

Music_Surf_branch_f5404: ; f5404
	octave 4
	note C_, 8
	note G_, 4
	note G#, 4
	note A#, 8
	note G#, 8
	note D#, 8
	endchannel
; f540c

Music_Surf_Ch3: ; f540c
Music_Surf_branch_f540c: ; f540c
	stereopanning $ff
	notetype $c, $1, $0, $5
	vibrato $16, $2, $3
	octave 4
	note A#, 12
	octave 5
	note C_, 12
	note D_, 8
	note D#, 4
	note F_, 4
	note G_, 4
	note G#, 4
	volenvelope $1, $0, $2
	note A#, 12
	note __, 4
	note G#, 4
	note G_, 4
	notetype $6, $1, $0, $2
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	notetype $c, $1, $0, $2
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	notetype $6, $1, $0, $2
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	note F_, 8
	notetype $c, $1, $0, $4
	note A#, 12
	note __, 4
	note G#, 4
	note G_, 4
	notetype $6, $1, $0, $4
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	notetype $c, $1, $0, $4
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	notetype $6, $1, $0, $4
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	octave 6
	note D#, 8
	notetype $c, $1, $0, $3
	note C_, 16
	note D_, 4
	note D#, 4
	notetype $6, $1, $0, $3
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	notetype $c, $1, $0, $3
	octave 5
	note A#, 12
	notetype $6, $1, $0, $3
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	note F_, 16
	note D#, 4
	note D_, 4
	note D#, 16
	note D_, 8
	notetype $c, $1, $0, $4
	note C_, 12
	note C_, 4
	note D_, 4
	note D#, 4
	notetype $6, $1, $0, $4
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	notetype $c, $1, $0, $4
	octave 5
	note A#, 12
	notetype $6, $1, $0, $4
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	notetype $c, $1, $0, $4
	note F_, 12
	note G_, 8
	octave 5
	note A#, 4
	volenvelope $1, $0, $5
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note F_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note G#, 4
	note B_, 12
	octave 2
	note B_, 12
	octave 3
	note D#, 8
	octave 2
	note B_, 4
	loopchannel 0, Music_Surf_branch_f540c
; f54c8

Music_Surf_branch_f54c8: ; f54c8
	octave 3
	note D#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note D#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C#, 4
	note G_, 1
	note __, 3
	note A#, 1
	note __, 3
	note C_, 4
	note F_, 1
	note __, 3
	note G#, 1
	note __, 3
	note C_, 4
	note F_, 1
	note __, 3
	note G#, 1
	note __, 3
	endchannel
; f54e8


