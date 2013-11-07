Music_Surf: ; f518a
	dbw $80, Music_Surf_Ch1
	dbw $01, Music_Surf_Ch2
	dbw $02, Music_Surf_Ch3
; f5193

INCBIN "baserom.gbc", $f5193, $f5194 - $f5193

Music_Surf_Ch1: ; f5194
	tempo 108
	volume $77
	notetype $c, $a7
	stereopanning $f

Music_Surf_branch_f519e: ; f519e
	dutycycle $2
	vibrato $10, $24
	intensity $73
	octave 3
	note F_, 0
	note __, 0
	note D#, 0
	note __, 0
	intensity $73
	note F_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G#, 0
	note __, 0
	note D#, 0
	note __, 0
	intensity $73
	note F_, 0
	note __, 0
	note D#, 0
	note __, 0
	note F_, 0
	note __, 0
	note D#, 0
	intensity $93
	note __, 0
	note G#, 0
	note __, 0
	note D#, 0
	note __, 0
	intensity $a7
	note F_, 0
	note __, 0
	note D#, 0
	note __, 0
	note F_, 0
	note __, 0
	note D#, 0
	intensity $b7
	note __, 0
	note A#, 1
	note G#, 1
	note F_, 1
	note D_, 1
	notetype $8, $c7
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note F_, 1
	intensity $f7
	note G#, 1
	note A#, 1
	octave 4
	note D_, 1
	dutycycle $0
	callchannel Music_Surf_branch_f5233
	dutycycle $1
	notetype $8, $a7
	callchannel Music_Surf_branch_f5233
	callchannel Music_Surf_branch_f5293
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note G_, 1
	dutycycle $1
	notetype $6, $97
	callchannel Music_Surf_branch_f5293
	intensity $a8
	note G#, 5
	note A_, 5
	note A#, 2
	octave 4
	note D_, 2
	intensity $a8
	dutycycle $1
	callchannel Music_Surf_branch_f52d9
	octave 3
	note D#, 7
	note G#, 7
	note D#, 7
	dutycycle $3
	notetype $8, $98
	callchannel Music_Surf_branch_f52d9
	notetype $c, $a7
	octave 3
	note D#, 11
	octave 2
	note F_, 3
	note D#, 3
	note F_, 3
	note G#, 3
	note D#, 1
	note G#, 1
	note B_, 1
	octave 3
	note D#, 1
	loopchannel 0, Music_Surf_branch_f519e
; f5233

Music_Surf_branch_f5233: ; f5233
	notetype $c, $a7
	octave 3
	note D#, 3
	note A#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note D#, 3
	note A#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note C#, 3
	note A#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note C#, 3
	note A#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note C_, 3
	note G#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note G#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note C_, 3
	note G#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note G#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	notetype $6, $a7
	octave 3
	note A#, 0
	note B_, 14
	octave 4
	note D#, 3
	octave 3
	note B_, 3
	note G#, 7
	note F_, 7
	note C#, 3
	note D_, 3
	endchannel
; f5293

Music_Surf_branch_f5293: ; f5293
	octave 4
	note G#, 15
	note D#, 3
	note C_, 3
	octave 3
	note G#, 3
	octave 4
	note C_, 3
	note D_, 3
	note D#, 3
	note G_, 3
	note G#, 3
	notetype $8, $92
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	note A#, 1
	octave 4
	note D_, 1
	notetype $6, $97
	note C#, 0
	note D_, 14
	note G_, 3
	note D_, 3
	octave 3
	note A#, 3
	octave 4
	note D_, 3
	note F_, 3
	note G_, 3
	note A_, 3
	note A#, 3
	notetype $8, $92
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G_, 1
	endchannel
; f52d9

Music_Surf_branch_f52d9: ; f52d9
	octave 3
	note A#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D#, 8
	notetype $6, $58
	note D_, 0
	note C#, 0
	note C_, 0
	octave 3
	note B_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	intensity $a8
	note D#, 3
	note D_, 3
	note D#, 3
	note G_, 3
	note A_, 3
	note G#, 3
	note G_, 3
	note F#, 3
	note F_, 3
	note E_, 3
	note G_, 7
	note C#, 7
	note A#, 7
	note A_, 0
	note A#, 2
	note G#, 3
	octave 4
	note C_, 3
	note F_, 11
	intensity $58
	note D#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 3
	note B_, 0
	note A#, 0
	note A_, 0
	note G_, 0
	intensity $a8
	note G#, 7
	octave 4
	note D#, 3
	octave 3
	note B_, 3
	note G#, 7
	note D#, 7
	octave 2
	note B_, 7
	endchannel

Music_Surf_Ch2: ; f5317

Music_Surf_branch_f5317: ; f5317
	notetype $c, $c2
	stereopanning $f0
	dutycycle $2
	vibrato $14, $23

Music_Surf_branch_f5321: ; f5321
	octave 1
	note A#, 3
	octave 2
	note A#, 0
	note __, 2
	note A#, 0
	note __, 2
	loopchannel 3, Music_Surf_branch_f5321
	octave 1
	note A#, 3
	octave 2
	note F_, 0
	note __, 2
	note A#, 0
	note __, 2

Music_Surf_branch_f5333: ; f5333
	note D#, 3
	note G_, 1
	note G#, 1
	note A#, 3
	note D#, 3
	note G_, 1
	note G#, 1
	note A#, 3
	note C#, 3
	note G_, 1
	note G#, 1
	note A#, 3
	note C#, 3
	note G_, 1
	note G#, 1
	note A#, 3
	note C_, 3
	note F_, 1
	note G_, 1
	note G#, 3
	note C_, 3
	note F_, 1
	note G_, 1
	note G#, 3
	octave 1
	note B_, 3
	octave 2
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 1
	note B_, 3
	note A#, 3
	note G#, 3
	loopchannel 2, Music_Surf_branch_f5333
	intensity $c7
	callchannel Music_Surf_branch_f53b2
	note D#, 3
	note D_, 3
	note C#, 3
	callchannel Music_Surf_branch_f53b2
	note D_, 3
	note D#, 3
	octave 1
	note A#, 3
	notetype $6, $b8
	callchannel Music_Surf_branch_f53d6
	dutycycle $1
	intensity $b8
	callchannel Music_Surf_branch_f53e8
	dutycycle $2
	callchannel Music_Surf_branch_f53f3
	dutycycle $1
	intensity $b8
	callchannel Music_Surf_branch_f5404
	octave 3
	note B_, 15
	octave 4
	note C#, 7
	forceoctave $c
	dutycycle $3
	callchannel Music_Surf_branch_f53d6
	intensity $b8
	dutycycle $1
	callchannel Music_Surf_branch_f53e8
	dutycycle $3
	callchannel Music_Surf_branch_f53f3
	intensity $b8
	dutycycle $1
	callchannel Music_Surf_branch_f5404
	forceoctave $0
	notetype $c, $b8
	octave 4
	note B_, 11
	dutycycle $2
	note A#, 3
	note G#, 3
	note D#, 3
	note G#, 3
	note A#, 3
	note B_, 3
	loopchannel 0, Music_Surf_branch_f5317
; f53b2

Music_Surf_branch_f53b2: ; f53b2
	octave 1
	note G#, 3
	octave 3
	note F_, 3
	note D#, 3
	octave 1
	note G#, 3
	octave 3
	note D#, 3
	note D_, 3
	octave 1
	note A#, 3
	octave 3
	note C_, 3
	octave 2
	note A#, 3
	octave 1
	note A#, 3
	octave 2
	note G#, 3
	note A#, 3
	octave 1
	note G_, 3
	octave 3
	note D_, 3
	note C_, 3
	octave 1
	note G_, 3
	octave 2
	note A#, 3
	note G_, 3
	note C_, 3
	octave 3
	note F_, 3
	note G_, 3
	endchannel
; f53d6

Music_Surf_branch_f53d6: ; f53d6
	octave 4
	note F_, 3
	note D#, 3
	note F_, 3
	note G_, 11
	intensity $58
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 3
	note B_, 0
	note A_, 0
	endchannel
; f53e8

Music_Surf_branch_f53e8: ; f53e8
	note A#, 6
	octave 4
	note C_, 7
	note C#, 15
	note C_, 3
	octave 3
	note B_, 3
	octave 4
	note C_, 15
	note G_, 7
	endchannel
; f53f3

Music_Surf_branch_f53f3: ; f53f3
	note F#, 0
	note G_, 2
	note F_, 3
	note G_, 3
	note G#, 11
	intensity $58
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	octave 3
	note B_, 0
	endchannel
; f5404

Music_Surf_branch_f5404: ; f5404
	octave 4
	note C_, 7
	note G_, 3
	note G#, 3
	note A#, 7
	note G#, 7
	note D#, 7
	endchannel

Music_Surf_branch_f540c: ; f540c

Music_Surf_Ch3: ; f540c
	stereopanning $ff
	notetype $c, $15
	vibrato $16, $23
	octave 4
	note A#, 11
	octave 5
	note C_, 11
	note D_, 7
	note D#, 3
	note F_, 3
	note G_, 3
	note G#, 3
	intensity $12
	note A#, 11
	note __, 3
	note G#, 3
	note G_, 3
	notetype $6, $12
	note F#, 0
	note G_, 14
	note G#, 3
	note G_, 3
	note F_, 15
	octave 4
	note A#, 7
	notetype $c, $12
	octave 5
	note G#, 15
	note G_, 3
	note F_, 3
	notetype $6, $12
	note E_, 0
	note F_, 14
	note G_, 3
	note F_, 3
	note D#, 15
	note F_, 7
	notetype $c, $14
	note A#, 11
	note __, 3
	note G#, 3
	note G_, 3
	notetype $6, $14
	note F#, 0
	note G_, 14
	note G#, 3
	note G_, 3
	note F_, 15
	octave 4
	note A#, 7
	notetype $c, $14
	octave 5
	note G#, 15
	note G_, 3
	note F_, 3
	notetype $6, $14
	note E_, 0
	note F_, 14
	note G_, 3
	note F_, 3
	note D#, 15
	octave 6
	note D#, 7
	notetype $c, $13
	note C_, 15
	note D_, 3
	note D#, 3
	notetype $6, $13
	note D_, 0
	note D#, 14
	note D_, 3
	note C_, 3
	octave 5
	note D_, 15
	octave 6
	note D_, 7
	notetype $c, $13
	octave 5
	note A#, 11
	notetype $6, $13
	note A_, 0
	note A#, 6
	octave 6
	note C_, 7
	note D_, 7
	note F_, 15
	note D#, 3
	note D_, 3
	note D#, 15
	note D_, 7
	notetype $c, $14
	note C_, 11
	note C_, 3
	note D_, 3
	note D#, 3
	notetype $6, $14
	note D_, 0
	note D#, 14
	note D_, 3
	note C_, 3
	octave 5
	note D_, 15
	octave 6
	note D_, 7
	notetype $c, $14
	octave 5
	note A#, 11
	notetype $6, $14
	note A_, 0
	note A#, 6
	octave 6
	note C_, 7
	note D_, 7
	notetype $c, $14
	note F_, 11
	note G_, 7
	octave 5
	note A#, 3
	intensity $15
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 3
	octave 3
	note D#, 3
	note F_, 3
	note G#, 3
	note A#, 3
	note B_, 3
	callchannel Music_Surf_branch_f54c8
	octave 2
	note B_, 3
	octave 3
	note D#, 3
	note G#, 3
	note B_, 11
	octave 2
	note B_, 11
	octave 3
	note D#, 7
	octave 2
	note B_, 3
	loopchannel 0, Music_Surf_branch_f540c
; f54c8

Music_Surf_branch_f54c8: ; f54c8
	octave 3
	note D#, 3
	note G_, 0
	note __, 2
	note A#, 0
	note __, 2
	note D#, 3
	note G_, 0
	note __, 2
	note A#, 0
	note __, 2
	note C#, 3
	note G_, 0
	note __, 2
	note A#, 0
	note __, 2
	note C#, 3
	note G_, 0
	note __, 2
	note A#, 0
	note __, 2
	note C_, 3
	note F_, 0
	note __, 2
	note G#, 0
	note __, 2
	note C_, 3
	note F_, 0
	note __, 2
	note G#, 0
	note __, 2
	endchannel
; f54e8
