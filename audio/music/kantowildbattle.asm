Music_KantoWildBattle: ; ed06d
	dbw $80, Music_KantoWildBattle_Ch1
	dbw $01, Music_KantoWildBattle_Ch2
	dbw $02, Music_KantoWildBattle_Ch3
; ed076

INCBIN "baserom.gbc", $ed076, $ed077 - $ed076

Music_KantoWildBattle_Ch1: ; ed077
	tempo 112
	volume $77
	vibrato $12, $23
	dutycycle $2
	notetype $c, $b7
	note __, 15
	octave 4
	note A#, 5
	note A_, 0
	note G#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	note G#, 0
	note G_, 0
	note F#, 0
	note F_, 0

Music_KantoWildBattle_branch_ed091: ; ed091
	notetype $c, $b7
	callchannel Music_KantoWildBattle_branch_ed18a
	octave 4
	note F_, 3
	note C#, 3
	octave 3
	note B_, 7
	callchannel Music_KantoWildBattle_branch_ed18a
	note __, 7
	note G_, 0
	note B_, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	note G_, 0
	note B_, 0
	octave 4
	note D_, 0
	note D#, 0
	intensity $b1
	note E_, 5
	note C_, 5
	octave 3
	note G_, 3
	octave 4
	note E_, 5
	note C_, 5
	note E_, 3
	intensity $b7
	note F_, 0
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C_, 0
	note C#, 0
	octave 3
	note G#, 0
	note F_, 0
	note G_, 0
	note G#, 3
	note F#, 0
	note G_, 0
	note G#, 0
	octave 4
	note C_, 0
	note C#, 3
	octave 3
	note F_, 0
	note G#, 0
	octave 4
	note C#, 0
	note E_, 0
	note F_, 2
	note G_, 0
	note G#, 3
	intensity $b1
	octave 3
	note G_, 5
	note F_, 5
	note E_, 3
	note G#, 5
	note G_, 5
	note F_, 3
	octave 4
	note C_, 5
	octave 3
	note A#, 5
	note G_, 3
	notetype $8, $b7
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note C#, 1
	octave 2
	note G#, 1
	notetype $c, $b7
	octave 3
	note G#, 3
	octave 4
	note C#, 3
	intensity $71
	note F_, 0
	note F_, 0
	intensity $91
	note F_, 0
	note F_, 0
	intensity $b1
	note G#, 0
	note G#, 0
	intensity $d1
	note G#, 0
	note G#, 0
	intensity $c7
	note E_, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note E_, 11
	note E_, 7
	intensity $b1
	note E_, 0
	note D_, 0
	note C_, 0
	octave 3
	note A#, 0
	note A_, 0
	note G_, 0
	note F_, 0
	note E_, 0
	intensity $b7
	note D_, 7
	note F_, 7
	note A#, 7
	octave 4
	note D_, 7
	octave 3
	note G_, 7
	octave 4
	note C_, 7
	note E_, 7
	note G_, 7
	note __, 7
	octave 3
	note D#, 7
	note G#, 7
	octave 4
	note C_, 7
	octave 3
	note A#, 7
	note __, 7
	octave 4
	note D_, 7
	octave 3
	note G#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave 4
	note C_, 3
	note __, 5
	note C_, 0
	note __, 4
	note C#, 1
	note C_, 0
	note __, 12
	note C#, 3
	note __, 5
	note C#, 0
	note __, 4
	note F_, 1
	note D#, 0
	note __, 4
	note C#, 7

Music_KantoWildBattle_branch_ed15b: ; ed15b
	intensity $b1
	octave 3
	note C_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	loopchannel 8, Music_KantoWildBattle_branch_ed15b

Music_KantoWildBattle_branch_ed166: ; ed166
	note C#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	loopchannel 8, Music_KantoWildBattle_branch_ed166

Music_KantoWildBattle_branch_ed16e: ; ed16e
	note C_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	loopchannel 16, Music_KantoWildBattle_branch_ed16e

Music_KantoWildBattle_branch_ed176: ; ed176
	note C#, 0
	note E_, 0
	note D#, 0
	note D_, 0
	loopchannel 8, Music_KantoWildBattle_branch_ed176

Music_KantoWildBattle_branch_ed17e: ; ed17e
	note C_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	loopchannel 8, Music_KantoWildBattle_branch_ed17e
	loopchannel 0, Music_KantoWildBattle_branch_ed091
; ed18a

Music_KantoWildBattle_branch_ed18a: ; ed18a
	octave 4
	note C_, 0
	note __, 4
	octave 3
	note B_, 0
	note __, 4
	note A#, 0
	note __, 2
	note __, 9
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note C#, 0
	note __, 4
	note C_, 0
	note __, 4
	octave 3
	note B_, 0
	note __, 2
	endchannel

Music_KantoWildBattle_Ch2: ; ed19f
	dutycycle $1
	vibrato $12, $23
	notetype $c, $b1
	octave 4
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0

Music_KantoWildBattle_branch_ed1c8: ; ed1c8
	notetype $c, $b7
	callchannel Music_KantoWildBattle_branch_ed2c6
	octave 2
	note F_, 1
	octave 1
	note B_, 0
	note __, 0
	octave 2
	note G_, 1
	callchannel Music_KantoWildBattle_branch_ed2c6
	octave 2
	note G_, 0
	note __, 0
	octave 1
	note B_, 0
	note __, 0
	octave 2
	note F_, 0
	note F#, 0
	notetype $6, $b7
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	forceoctave $1
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	forceoctave $0
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	forceoctave $1
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	forceoctave $0
	callchannel Music_KantoWildBattle_branch_ed307
	callchannel Music_KantoWildBattle_branch_ed307
	note __, 15
	octave 3
	note A#, 15
	octave 4
	note D_, 15
	note F_, 15
	notetype $c, $b7
	note E_, 15
	note G_, 7
	octave 5
	note C_, 7
	note __, 7
	octave 3
	note G#, 7
	octave 4
	note C_, 7
	note D#, 7
	note F_, 7
	note F_, 0
	octave 3
	note A#, 0
	note G#, 0
	note A#, 0
	octave 4
	note F_, 0
	octave 3
	note A#, 0
	note G#, 0
	note A#, 0
	octave 4
	note G#, 7
	note G#, 0
	note F_, 0
	note D_, 0
	octave 3
	note B_, 0
	octave 4
	note F_, 0
	note D_, 0
	octave 3
	note B_, 0
	note G#, 0
	notetype $6, $b7
	callchannel Music_KantoWildBattle_branch_ed31b
	forceoctave $1
	callchannel Music_KantoWildBattle_branch_ed31b
	forceoctave $0
	callchannel Music_KantoWildBattle_branch_ed340
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note C_, 3
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note D#, 3
	octave 2
	note C_, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	octave 4
	note F_, 3
	octave 2
	note C#, 1
	note __, 1
	callchannel Music_KantoWildBattle_branch_ed340
	callchannel Music_KantoWildBattle_branch_ed354
	callchannel Music_KantoWildBattle_branch_ed340
	callchannel Music_KantoWildBattle_branch_ed354
	forceoctave $1
	callchannel Music_KantoWildBattle_branch_ed340
	forceoctave $0
	note C#, 1
	note __, 1
	octave 3
	note G#, 3
	octave 2
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 3
	octave 2
	note C#, 1
	note __, 1
	octave 3
	note A#, 3
	octave 2
	note C#, 1
	note __, 1
	callchannel Music_KantoWildBattle_branch_ed340
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note C_, 3
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note A#, 3
	octave 2
	note C_, 1
	note __, 1
	loopchannel 0, Music_KantoWildBattle_branch_ed1c8
; ed2c6

Music_KantoWildBattle_branch_ed2c6: ; ed2c6
	octave 2
	note C_, 0
	note __, 1
	note C_, 0
	octave 1
	note G_, 0
	note __, 0
	octave 2
	note C_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note C_, 0
	note __, 0
	octave 1
	note G_, 0
	note __, 1
	note G_, 0
	octave 2
	note C_, 2
	note C_, 0
	octave 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 1
	octave 2
	note F#, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note C#, 0
	note __, 1
	note C#, 0
	octave 1
	note G#, 0
	note __, 0
	octave 2
	note C#, 0
	note __, 0
	octave 3
	note C#, 0
	note __, 0
	octave 2
	note C#, 1
	octave 1
	note G#, 0
	note __, 1
	note G#, 0
	octave 2
	note C#, 0
	note __, 1
	note C#, 0
	octave 1
	note G#, 0
	note __, 0
	octave 2
	note C#, 0
	note __, 0
	octave 1
	note G_, 1
	endchannel
; ed307

Music_KantoWildBattle_branch_ed307: ; ed307
	octave 2
	note C_, 1
	note __, 3
	note C_, 0
	note __, 0
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 3
	endchannel
; ed31b

Music_KantoWildBattle_branch_ed31b: ; ed31b
	octave 2
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	octave 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note C_, 5
	note C_, 1
	note __, 3
	note C_, 1
	octave 1
	note G_, 1
	octave 2
	note E_, 1
	note C_, 1
	octave 1
	note G_, 1
	octave 2
	note C_, 1
	note __, 3
	note C_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 3
	note C_, 1
	endchannel
; ed340

Music_KantoWildBattle_branch_ed340: ; ed340
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	endchannel
; ed354

Music_KantoWildBattle_branch_ed354: ; ed354
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note G_, 3
	octave 2
	note C_, 1
	note __, 1
	endchannel

Music_KantoWildBattle_Ch3: ; ed368
	vibrato $14, $23
	notetype $c, $14
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	octave 4
	note C_, 0
	octave 3
	note C#, 0
	note __, 0
	note C#, 0
	octave 4
	note C#, 0
	octave 3
	note D_, 0
	note __, 0
	note D_, 0
	octave 4
	note D_, 0
	octave 3
	note D#, 0
	note __, 0
	note D#, 0
	octave 4
	note D#, 0
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	octave 4
	note E_, 0
	octave 3
	note F_, 0
	note __, 0
	note F_, 0
	octave 4
	note F_, 0
	octave 3
	note F#, 0
	note __, 0
	note F#, 0
	octave 4
	note F#, 0
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	octave 4
	note G_, 0

Music_KantoWildBattle_branch_ed39e: ; ed39e
	notetype $c, $14
	octave 5
	note G_, 0
	note __, 1
	octave 4
	note G_, 0
	note __, 1
	octave 5
	note G_, 0
	note __, 2
	octave 4
	note G_, 0
	note __, 0
	octave 5
	note G_, 0
	note __, 1
	octave 4
	note G_, 0
	octave 3
	note G_, 0
	note B_, 0
	octave 4
	note C_, 0
	note D_, 0
	note D#, 5
	octave 5
	note D#, 1
	note __, 1
	note G_, 1
	note G#, 0
	note __, 1
	octave 4
	note G#, 0
	note __, 1
	octave 5
	note G#, 0
	note __, 2
	octave 4
	note G#, 0
	note __, 0
	octave 5
	note G#, 0
	note __, 1
	octave 4
	note G#, 0
	octave 6
	note C#, 5
	octave 5
	note G#, 0
	note F_, 0
	note B_, 0
	note G_, 0
	note F_, 0
	note D_, 0
	note G_, 0
	note F_, 0
	note D_, 0
	octave 4
	note B_, 0
	octave 5
	note G_, 0
	note __, 1
	octave 4
	note G_, 0
	note __, 1
	octave 5
	note G_, 0
	note __, 2
	octave 4
	note G_, 0
	note __, 0
	octave 5
	note G_, 0
	note __, 1
	octave 4
	note G_, 0
	note C_, 0
	note D_, 0
	note D#, 0
	note F_, 0
	note G_, 5
	octave 5
	note D#, 1
	note __, 1
	note G_, 1
	note G#, 0
	note __, 1
	octave 4
	note G_, 0
	note __, 1
	octave 5
	note G#, 0
	note __, 2
	octave 4
	note G_, 0
	note __, 0
	octave 5
	note G#, 0
	note __, 1
	octave 4
	note G_, 0
	note C#, 3
	note G#, 3
	octave 5
	note F_, 6
	note F#, 0
	note G_, 1
	intensity $24
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	intensity $14
	octave 5
	note F#, 1
	intensity $24
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	intensity $14
	octave 5
	note E_, 1
	intensity $24
	note C_, 0
	octave 4
	note G_, 0
	intensity $14
	octave 5
	note G_, 1
	intensity $24
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	intensity $14
	octave 5
	note A_, 1
	intensity $24
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	intensity $14
	octave 5
	note G_, 1
	intensity $24
	note C_, 0
	octave 4
	note G#, 0
	intensity $14
	octave 5
	note G#, 11
	note G_, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note C#, 0
	note F_, 0
	note G#, 0
	octave 6
	note C_, 0
	note C#, 7
	octave 5
	note C_, 1
	intensity $24
	octave 4
	note E_, 0
	note G_, 0
	note E_, 0
	note G_, 0
	intensity $14
	note A#, 1
	intensity $24
	note E_, 0
	note G_, 0
	note E_, 0
	note G_, 0
	intensity $14
	note G#, 1
	intensity $24
	note E_, 0
	note G_, 0
	intensity $14
	octave 5
	note C#, 1
	intensity $24
	octave 4
	note E_, 0
	note G_, 0
	note E_, 0
	note G_, 0
	intensity $14
	octave 5
	note C_, 1
	intensity $24
	octave 4
	note E_, 0
	note G_, 0
	note E_, 0
	note G_, 0
	intensity $14
	note A#, 1
	intensity $24
	note E_, 0
	note G_, 0
	intensity $14
	octave 5
	note F_, 1
	intensity $24
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	intensity $14
	note E_, 1
	intensity $24
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	intensity $14
	note D_, 1
	intensity $24
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	intensity $14
	octave 4
	note A#, 3
	octave 5
	note C_, 3
	note D_, 3
	note F_, 3
	note G#, 15
	notetype $6, $14
	note G#, 0
	note __, 0
	intensity $24
	note G#, 0
	note __, 0
	intensity $34
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	intensity $24
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	intensity $14
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	octave 6
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	octave 5
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	notetype $c, $15
	note G_, 11
	note G_, 7
	notetype $6, $15
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	intensity $24
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	intensity $14
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	notetype $c, $14
	octave 2
	note A#, 15
	note A#, 0
	note __, 1
	note A#, 0
	note __, 1
	note A#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 1
	note A#, 0
	note __, 1
	note A#, 0
	note __, 0
	note C_, 0
	note __, 1
	notetype $6, $15
	note C_, 0
	note __, 0
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 3
	note C_, 1
	note __, 3
	note C_, 0
	note __, 0
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 3
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	notetype $c, $14
	note G#, 15
	note G#, 15
	note A#, 1
	note __, 1
	note A#, 0
	note __, 2
	note A#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	octave 2
	note A#, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	note D_, 1
	note __, 1
	note D_, 0
	note __, 2
	note D_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	octave 5
	note E_, 3
	octave 4
	note C_, 0
	note E_, 0
	note G_, 0
	note B_, 0
	octave 5
	note C_, 0
	note __, 0
	note E_, 0
	note __, 4
	note F_, 1
	note E_, 0
	note __, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note E_, 0
	note G_, 0
	note E_, 0
	note C_, 0
	note E_, 0
	note G_, 0
	octave 5
	note C_, 0
	note E_, 0
	note G_, 0
	note F_, 3
	octave 4
	note C#, 0
	note F_, 0
	note G#, 0
	octave 5
	note C_, 0
	note C#, 0
	note __, 0
	note F_, 0
	note __, 4
	note G#, 1
	note G_, 0
	note __, 4
	note F_, 7
	intensity $13
	note G_, 5
	note F#, 5
	note E_, 1
	note __, 1
	note G_, 5
	note A_, 5
	note G_, 1
	note __, 1
	note G#, 11
	note G_, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note __, 3
	octave 6
	note C#, 7
	octave 5
	note C_, 5
	octave 4
	note A#, 5
	note G#, 1
	note __, 1
	octave 5
	note C#, 5
	note C_, 5
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note F_, 5
	note E_, 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 3
	octave 5
	note C_, 3
	note D_, 3
	note F_, 3
	note G#, 15
	note G#, 15
	note G_, 15
	note G_, 15
	loopchannel 0, Music_KantoWildBattle_branch_ed39e
; ed5c6
