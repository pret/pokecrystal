Music_JohtoTrainerBattle: ; f6096
	dbw $80, Music_JohtoTrainerBattle_Ch1
	dbw $01, Music_JohtoTrainerBattle_Ch2
	dbw $02, Music_JohtoTrainerBattle_Ch3
; f609f

Music_JohtoTrainerBattle_Ch1: ; f609f
	tempo 102
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0002
	vibrato $12, $1, $5
	notetype $c, $9, $0, $2
	note __, 8
	octave 3
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	volenvelope $b, $0, $2
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	volenvelope $b, $0, $7
	note D_, 4
	volenvelope $b, $0, $2
	note E_, 6
	note D_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	volenvelope $b, $0, $7
	note F_, 4
	volenvelope $b, $0, $2
	octave 4
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A_, 2
	note A#, 2
	volenvelope $b, $0, $7
	note B_, 4
	volenvelope $b, $0, $2
	octave 4
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	volenvelope $b, $0, $7
	note G_, 4
Music_JohtoTrainerBattle_branch_f6102: ; f6102
	volenvelope $b, $0, $4
	callchannel Music_JohtoTrainerBattle_branch_f629f
	volenvelope $b, $0, $7
	note A#, 4
	volenvelope $b, $0, $3
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	volenvelope $b, $0, $7
	octave 4
	note C_, 4
	volenvelope $b, $0, $3
	octave 3
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	volenvelope $b, $0, $7
	octave 4
	note D_, 4
	volenvelope $b, $0, $3
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	octave 4
	note C_, 1
	volenvelope $b, $0, $5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	callchannel Music_JohtoTrainerBattle_branch_f629f
	volenvelope $b, $0, $7
	note F_, 4
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	volenvelope $a, $0, $0
	octave 3
	note F_, 8
	volenvelope $a, $0, $7
	note F_, 8
	volenvelope $b, $0, $7
	note A_, 6
	note E_, 6
	note A#, 4
	octave 4
	note C#, 6
	note F_, 4
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	volenvelope $a, $0, $0
	note A_, 8
	volenvelope $a, $0, $7
	note A_, 8
	volenvelope $b, $0, $7
	note E_, 8
	note D_, 8
	note E_, 8
	note F_, 8
	note E_, 8
	note D_, 8
	note G_, 8
	note F_, 8
	note D_, 8
	note C_, 8
	note D_, 8
	note D#, 8
	note D_, 8
	note C_, 8
	note D_, 8
	note D#, 8
	note D_, 8
	note D#, 8
	note E_, 8
	note F_, 8
	volenvelope $b, $0, $4
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	octave 4
	note C#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	volenvelope $b, $0, $5
	note D#, 2
	note D_, 2
	volenvelope $b, $0, $2
	note D#, 4
	volenvelope $b, $0, $7
	note C_, 8
	note D#, 4
	note C#, 4
	note C_, 4
	note D#, 4
	volenvelope $b, $0, $5
	note E_, 2
	note D#, 2
	volenvelope $b, $0, $2
	note E_, 4
	volenvelope $b, $0, $7
	note C#, 8
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	volenvelope $b, $0, $5
	note F#, 2
	note F_, 2
	volenvelope $b, $0, $2
	note F#, 4
	volenvelope $b, $0, $7
	note D_, 8
	note F#, 4
	note E_, 4
	note D_, 4
	note F#, 4
	note G_, 8
	note D#, 8
	note A#, 8
	note G_, 8
	volenvelope $a, $0, $0
	note D#, 4
	volenvelope $a, $0, $7
	note D#, 12
	note __, 16
Music_JohtoTrainerBattle_branch_f61bd: ; f61bd
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $4
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	note F_, 4
	octave 2
	note A#, 4
	volenvelope $b, $0, $7
	octave 3
	note F_, 8
	volenvelope $b, $0, $4
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	note F_, 4
	note F_, 4
	loopchannel 2, Music_JohtoTrainerBattle_branch_f61bd
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $4
	note G_, 4
	note D#, 4
	note F_, 4
	note G#, 2
	note G_, 2
	volenvelope $b, $0, $7
	note F_, 8
	note F_, 8
	volenvelope $b, $0, $5
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	volenvelope $b, $0, $7
	note F_, 8
	note F_, 8
	volenvelope $b, $0, $5
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	volenvelope $3, $1, $7
	note G#, 8
	volenvelope $b, $0, $7
	note G#, 8
	volenvelope $a, $0, $0
	octave 4
	note C_, 8
	volenvelope $a, $0, $7
	note C_, 8
	volenvelope $b, $0, $2
	octave 3
	note D#, 6
	note D#, 6
	note D#, 4
	note D#, 6
	note D#, 6
	volenvelope $b, $0, $7
	note F_, 4
	volenvelope $b, $0, $2
	note D#, 6
	note D#, 6
	note D#, 4
	note D#, 6
	note D#, 6
	volenvelope $4, $1, $4
	note F_, 4
	volenvelope $b, $0, $7
	note G#, 6
	note G_, 6
	note F_, 4
	note D#, 4
	note F_, 4
	note G_, 4
	note D#, 4
	note F_, 4
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note F_, 4
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note F_, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 6
	note D#, 6
	note G_, 4
	octave 4
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note F_, 4
	note C#, 2
	note D#, 2
	note F_, 4
	note C#, 2
	note D#, 2
	note A#, 4
	note G#, 4
	note G_, 4
	note F_, 4
	volenvelope $9, $0, $0
	octave 2
	note A#, 8
	octave 3
	note D#, 8
	octave 2
	note A#, 8
	octave 3
	note G_, 8
	volenvelope $a, $0, $0
	note D#, 8
	note A#, 8
	note G_, 8
	octave 4
	note D#, 8
	volenvelope $a, $0, $0
	octave 3
	note A#, 8
	volenvelope $a, $0, $7
	note A#, 8
	volenvelope $b, $0, $7
	note G_, 6
	note A#, 6
	note G#, 2
	note G_, 2
	volenvelope $a, $0, $0
	note D#, 8
	volenvelope $a, $0, $7
	note D#, 8
	volenvelope $b, $0, $4
	note A#, 6
	note G_, 4
	note G_, 2
	note A#, 12
	note __, 16
	note __, 8
	volenvelope $a, $0, $0
	octave 4
	note D_, 4
	volenvelope $a, $0, $7
	note D_, 12
	volenvelope $a, $0, $0
	note F_, 8
	volenvelope $a, $0, $7
	note F_, 8
	volenvelope $b, $0, $3
	callchannel Music_JohtoTrainerBattle_branch_f629f
	note F_, 4
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	volenvelope $a, $0, $0
	octave 3
	note F_, 10
	volenvelope $a, $0, $7
	note F_, 6
	loopchannel 0, Music_JohtoTrainerBattle_branch_f6102
; f629f

Music_JohtoTrainerBattle_branch_f629f: ; f629f
	octave 3
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note F_, 2
	note D_, 2
	endchannel
; f62b3

Music_JohtoTrainerBattle_Ch2: ; f62b3
	setwaveduty $3
	vibrato $8, $3, $6
	setpitchoffset $0001
	notetype $c, $c, $0, $2
	octave 4
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note G#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note G#, 1
	octave 3
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note G#, 1
	octave 3
	note B_, 1
	note A#, 1
	note B_, 1
	octave 4
	note G#, 1
	octave 3
	note A#, 1
	note A_, 1
	note A#, 1
	volenvelope $c, $0, $2
	octave 4
	note A_, 6
	callchannel Music_JohtoTrainerBattle_branch_f649a
	volenvelope $c, $0, $2
	note A_, 6
	callchannel Music_JohtoTrainerBattle_branch_f649a
	volenvelope $c, $0, $2
	octave 5
	note C_, 6
	note C_, 6
	note C_, 4
	note C_, 6
	note C_, 6
	volenvelope $c, $0, $7
	note C#, 4
	volenvelope $c, $0, $2
	note C_, 2
	volenvelope $a, $0, $4
	octave 3
	note E_, 2
	note A_, 2
	volenvelope $c, $0, $2
	octave 5
	note C_, 2
	volenvelope $a, $0, $4
	octave 3
	note E_, 2
	note A_, 2
	volenvelope $c, $0, $2
	octave 5
	note C_, 2
	volenvelope $a, $0, $4
	octave 3
	note E_, 2
	volenvelope $c, $0, $2
	octave 5
	note C_, 2
	volenvelope $a, $0, $4
	octave 3
	note E_, 2
	note B_, 2
	volenvelope $c, $0, $2
	octave 5
	note C_, 2
	volenvelope $a, $0, $4
	octave 4
	note C_, 2
	note E_, 2
	volenvelope $c, $0, $7
	note B_, 4
Music_JohtoTrainerBattle_branch_f632a: ; f632a
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	volenvelope $3, $1, $6
	note A#, 8
	volenvelope $c, $0, $7
	note A#, 8
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	volenvelope $c, $0, $4
	note D_, 4
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	octave 5
	note D_, 2
	volenvelope $b, $0, $0
	note C#, 8
	volenvelope $b, $0, $7
	note C#, 4
	volenvelope $c, $0, $7
	octave 4
	note A#, 4
	volenvelope $b, $0, $0
	note A_, 16
	volenvelope $b, $0, $7
	note A_, 16
Music_JohtoTrainerBattle_branch_f635a: ; f635a
	volenvelope $c, $0, $3
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $3
	note A_, 2
	note G_, 2
	note A#, 2
	loopchannel 3, Music_JohtoTrainerBattle_branch_f635a
	note A_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note A#, 2
Music_JohtoTrainerBattle_branch_f6376: ; f6376
	note G_, 2
	note F_, 2
	note G_, 2
	volenvelope $c, $0, $7
	note G#, 4
	volenvelope $c, $0, $3
	note G_, 2
	note F_, 2
	note G#, 2
	loopchannel 3, Music_JohtoTrainerBattle_branch_f6376
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	volenvelope $c, $0, $7
	note G_, 6
	octave 4
	note D_, 6
	note C_, 2
	note D_, 2
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	volenvelope $b, $0, $0
	note D#, 10
	volenvelope $b, $0, $7
	note D#, 6
	volenvelope $9, $0, $0
	note G_, 8
	volenvelope $9, $0, $7
	note G_, 8
	volenvelope $c, $0, $7
	octave 3
	note F_, 8
	note D#, 4
	note F_, 4
	note G_, 4
	note F_, 4
	note D#, 4
	note G_, 4
	note G#, 8
	note F_, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note F_, 4
	note G#, 4
	note A_, 8
	note F#, 4
	note G#, 4
	note A_, 4
	note G#, 4
	note F#, 4
	note A_, 4
	volenvelope $b, $0, $0
	note A#, 8
	note A#, 8
	volenvelope $b, $0, $0
	octave 4
	note D#, 8
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $6, $0, $2
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	volenvelope $8, $0, $2
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	volenvelope $9, $0, $2
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	volenvelope $a, $0, $2
	callchannel Music_JohtoTrainerBattle_branch_f64b6
Music_JohtoTrainerBattle_branch_f63dd: ; f63dd
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note G_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note G_, 2
	octave 3
	note A#, 2
	loopchannel 8, Music_JohtoTrainerBattle_branch_f63dd
	callchannel Music_JohtoTrainerBattle_branch_f64be
	octave 3
	note A#, 2
	volenvelope $c, $0, $7
	octave 4
	note C_, 8
	callchannel Music_JohtoTrainerBattle_branch_f64be
	note G_, 2
	volenvelope $c, $0, $7
	note F_, 8
	callchannel Music_JohtoTrainerBattle_branch_f64be
	octave 3
	note A#, 2
	volenvelope $b, $0, $0
	octave 4
	note C_, 8
	volenvelope $b, $0, $7
	note C_, 8
	volenvelope $1, $1, $7
	note D#, 12
	volenvelope $c, $0, $7
	note D#, 4
	volenvelope $c, $0, $2
	octave 3
	note G_, 4
	note D#, 2
	note G_, 6
	note G_, 4
	note G_, 2
	note F_, 2
	note D#, 2
	note G_, 6
	volenvelope $c, $0, $7
	note G#, 4
	volenvelope $c, $0, $2
	note G_, 4
	note D#, 2
	note G_, 6
	note G_, 4
	note G_, 6
	note G_, 6
	volenvelope $4, $1, $4
	note G#, 4
	callchannel Music_JohtoTrainerBattle_branch_f64d2
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $0
	note G#, 8
	volenvelope $b, $0, $7
	note G#, 8
	callchannel Music_JohtoTrainerBattle_branch_f64d2
	volenvelope $b, $0, $0
	note C#, 8
	volenvelope $b, $0, $7
	note C#, 8
	volenvelope $c, $0, $7
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note G_, 6
	note D#, 2
	note A#, 8
	note A#, 6
	note G_, 2
	octave 4
	note D#, 8
	note D#, 6
	octave 3
	note A#, 2
	octave 4
	note G_, 8
	note G_, 6
	note D#, 2
	note A#, 8
	note G_, 6
	note A#, 6
	note G#, 2
	note G_, 2
	volenvelope $b, $0, $0
	note D#, 8
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $c, $0, $7
	note D#, 6
	note A#, 6
	note G#, 2
	note G_, 2
	volenvelope $b, $0, $0
	note D#, 8
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $c, $0, $7
	octave 3
	note A_, 6
	octave 4
	note E_, 6
	note D_, 2
	note E_, 2
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $0
	note A#, 8
	volenvelope $b, $0, $7
	note A#, 8
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	volenvelope $c, $0, $7
	note D_, 4
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	loopchannel 0, Music_JohtoTrainerBattle_branch_f632a
; f649a

Music_JohtoTrainerBattle_branch_f649a: ; f649a
	octave 3
	note A_, 6
	note A_, 4
	note A_, 6
	note A_, 6
	volenvelope $c, $0, $7
	note A#, 4
	endchannel
; f64a3

Music_JohtoTrainerBattle_branch_f64a3: ; f64a3
	volenvelope $c, $0, $7
	octave 3
	note A_, 6
	octave 4
	note E_, 6
	note D_, 2
	note E_, 2
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	endchannel
; f64b6

Music_JohtoTrainerBattle_branch_f64b6: ; f64b6
	octave 3
	note A#, 2
	note D#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	endchannel
; f64be

Music_JohtoTrainerBattle_branch_f64be: ; f64be
	volenvelope $c, $0, $7
	octave 4
	note F_, 4
	volenvelope $c, $0, $4
	octave 3
	note A#, 2
	octave 4
	note F_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F_, 2
	endchannel
; f64d2

Music_JohtoTrainerBattle_branch_f64d2: ; f64d2
	volenvelope $c, $0, $7
	octave 4
	note D#, 6
	note A#, 6
	note G#, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note D#, 4
	endchannel
; f64de

Music_JohtoTrainerBattle_Ch3: ; f64de
	notetype $c, $1, $1, $1
	octave 4
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 2
	note A#, 2
	note A_, 2
	note G#, 2
Music_JohtoTrainerBattle_branch_f6501: ; f6501
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	loopchannel 3, Music_JohtoTrainerBattle_branch_f6501
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	callchannel Music_JohtoTrainerBattle_branch_f6676
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	callchannel Music_JohtoTrainerBattle_branch_f6676
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
Music_JohtoTrainerBattle_branch_f6531: ; f6531
	callchannel Music_JohtoTrainerBattle_branch_f6681
	note E_, 2
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6681
	note A_, 2
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f669d
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	callchannel Music_JohtoTrainerBattle_branch_f669d
	note E_, 2
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	octave 3
	note A_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	callchannel Music_JohtoTrainerBattle_branch_f66a5
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	callchannel Music_JohtoTrainerBattle_branch_f66a5
	note D_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note G_, 8
	note F_, 8
	note E_, 8
	note D#, 8
Music_JohtoTrainerBattle_branch_f6591: ; f6591
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note A_, 2
	octave 4
	note C_, 2
	loopchannel 2, Music_JohtoTrainerBattle_branch_f6591
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note G_, 2
Music_JohtoTrainerBattle_branch_f65ac: ; f65ac
	note C#, 2
	note G#, 2
	loopchannel 7, Music_JohtoTrainerBattle_branch_f65ac
	note B_, 2
	note A_, 2
Music_JohtoTrainerBattle_branch_f65b4: ; f65b4
	note D_, 2
	note A_, 2
	loopchannel 5, Music_JohtoTrainerBattle_branch_f65b4
	note B_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
Music_JohtoTrainerBattle_branch_f65c0: ; f65c0
	note A#, 4
	note D#, 4
	loopchannel 4, Music_JohtoTrainerBattle_branch_f65c0
Music_JohtoTrainerBattle_branch_f65c6: ; f65c6
	octave 4
	note G_, 4
	octave 3
	note A#, 4
	loopchannel 4, Music_JohtoTrainerBattle_branch_f65c6
Music_JohtoTrainerBattle_branch_f65ce: ; f65ce
	callchannel Music_JohtoTrainerBattle_branch_f66b4
	note D#, 2
	note F_, 8
	callchannel Music_JohtoTrainerBattle_branch_f66b4
	octave 4
	note C_, 2
	octave 3
	note A#, 8
	loopchannel 2, Music_JohtoTrainerBattle_branch_f65ce
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note A#, 8
	note G#, 8
	note F_, 8
	note G_, 8
	note G#, 8
	note A#, 8
	note F_, 8
	note G_, 8
	note G#, 4
	note D#, 2
	note G#, 2
	octave 4
	note C_, 8
	note C_, 8
	note D#, 8
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
Music_JohtoTrainerBattle_branch_f661e: ; f661e
	note D#, 2
	note A#, 2
	loopchannel 8, Music_JohtoTrainerBattle_branch_f661e
Music_JohtoTrainerBattle_branch_f6624: ; f6624
	note C#, 2
	note G#, 2
	loopchannel 6, Music_JohtoTrainerBattle_branch_f6624
	note C#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
Music_JohtoTrainerBattle_branch_f6630: ; f6630
	note D#, 2
	note A#, 2
	loopchannel 8, Music_JohtoTrainerBattle_branch_f6630
Music_JohtoTrainerBattle_branch_f6636: ; f6636
	note C#, 2
	note G#, 2
	loopchannel 4, Music_JohtoTrainerBattle_branch_f6636
	note C#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note D#, 8
	note C#, 8
	note C_, 8
	octave 2
	note A#, 8
	octave 3
	note A#, 8
	note G#, 8
	note G_, 8
	note F_, 8
	octave 4
	note D#, 8
	note D#, 8
	octave 3
	note A#, 8
	note A#, 8
	note G_, 8
	note G_, 8
	note D#, 8
	note D#, 4
	note A#, 4
	note A_, 16
	octave 4
	note C_, 16
	octave 3
	note A#, 16
	octave 4
	note D_, 16
	octave 3
	note A_, 16
	octave 4
	note C_, 16
	octave 3
	note A#, 16
	octave 4
	note D_, 8
	note __, 2
	octave 3
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	loopchannel 0, Music_JohtoTrainerBattle_branch_f6531
; f6676

Music_JohtoTrainerBattle_branch_f6676: ; f6676
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	endchannel
; f6681

Music_JohtoTrainerBattle_branch_f6681: ; f6681
	octave 3
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	endchannel
; f6692

Music_JohtoTrainerBattle_branch_f6692: ; f6692
	octave 3
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	endchannel
; f669d

Music_JohtoTrainerBattle_branch_f669d: ; f669d
	octave 3
	note E_, 2
	note A_, 2
	loopchannel 4, Music_JohtoTrainerBattle_branch_f669d
	endchannel
; f66a5

Music_JohtoTrainerBattle_branch_f66a5: ; f66a5
	note D_, 2
	note A_, 2
	loopchannel 4, Music_JohtoTrainerBattle_branch_f66a5
	endchannel
; f66ac

Music_JohtoTrainerBattle_branch_f66ac: ; f66ac
	octave 3
	note C_, 2
	note G_, 2
	loopchannel 4, Music_JohtoTrainerBattle_branch_f66ac
	endchannel
; f66b4

Music_JohtoTrainerBattle_branch_f66b4: ; f66b4
	note A#, 4
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 2
	endchannel
; f66c3


