Music_JohtoTrainerBattle: ; f6096
	dbw $80, Music_JohtoTrainerBattle_Ch1
	dbw $01, Music_JohtoTrainerBattle_Ch2
	dbw $02, Music_JohtoTrainerBattle_Ch3
; f609f


Music_JohtoTrainerBattle_Ch1: ; f609f
	tempo 102
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $92
	note __, 7
	octave 3
	note A_, 0
	note G#, 0
	note G_, 0
	note G#, 0
	intensity $b2
	note C_, 0
	octave 2
	note B_, 0
	note A#, 0
	note B_, 0
	octave 3
	note C#, 0
	note C_, 0
	octave 2
	note B_, 0
	octave 3
	note C_, 0
	note D_, 0
	note C#, 0
	note C_, 0
	note C#, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note E_, 5
	note E_, 5
	note E_, 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 5
	intensity $b7
	note D_, 3
	intensity $b2
	note E_, 5
	note D_, 5
	note E_, 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 5
	intensity $b7
	note F_, 3
	intensity $b2
	octave 4
	note E_, 5
	note E_, 5
	note E_, 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	octave 3
	note A_, 1
	note A#, 1
	intensity $b7
	note B_, 3
	intensity $b2
	octave 4
	note E_, 5
	note E_, 5
	note E_, 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 5
	intensity $b7
	note G_, 3

Music_JohtoTrainerBattle_branch_f6102: ; f6102
	intensity $b4
	callchannel Music_JohtoTrainerBattle_branch_f629f
	intensity $b7
	note A#, 3
	intensity $b3
	note G_, 0
	note F_, 0
	note E_, 0
	note G_, 0
	intensity $b7
	octave 4
	note C_, 3
	intensity $b3
	octave 3
	note A_, 0
	note G_, 0
	note F_, 0
	note A_, 0
	intensity $b7
	octave 4
	note D_, 3
	intensity $b3
	note C_, 0
	octave 3
	note A#, 0
	note A_, 0
	octave 4
	note C_, 0
	intensity $b5
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	callchannel Music_JohtoTrainerBattle_branch_f629f
	intensity $b7
	note F_, 3
	note E_, 1
	note F_, 1
	octave 4
	note C_, 3
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	intensity $a0
	octave 3
	note F_, 7
	intensity $a7
	note F_, 7
	intensity $b7
	note A_, 5
	note E_, 5
	note A#, 3
	octave 4
	note C#, 5
	note F_, 3
	note E_, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note A#, 1
	note A_, 1
	note A#, 1
	intensity $a0
	note A_, 7
	intensity $a7
	note A_, 7
	intensity $b7
	note E_, 7
	note D_, 7
	note E_, 7
	note F_, 7
	note E_, 7
	note D_, 7
	note G_, 7
	note F_, 7
	note D_, 7
	note C_, 7
	note D_, 7
	note D#, 7
	note D_, 7
	note C_, 7
	note D_, 7
	note D#, 7
	note D_, 7
	note D#, 7
	note E_, 7
	note F_, 7
	intensity $b4
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	octave 4
	note C#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	intensity $b5
	note D#, 1
	note D_, 1
	intensity $b2
	note D#, 3
	intensity $b7
	note C_, 7
	note D#, 3
	note C#, 3
	note C_, 3
	note D#, 3
	intensity $b5
	note E_, 1
	note D#, 1
	intensity $b2
	note E_, 3
	intensity $b7
	note C#, 7
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	intensity $b5
	note F#, 1
	note F_, 1
	intensity $b2
	note F#, 3
	intensity $b7
	note D_, 7
	note F#, 3
	note E_, 3
	note D_, 3
	note F#, 3
	note G_, 7
	note D#, 7
	note A#, 7
	note G_, 7
	intensity $a0
	note D#, 3
	intensity $a7
	note D#, 11
	note __, 15

Music_JohtoTrainerBattle_branch_f61bd: ; f61bd
	intensity $b7
	note F_, 7
	intensity $b4
	note G_, 3
	note D#, 3
	note F_, 3
	note G_, 1
	note D#, 1
	note F_, 3
	octave 2
	note A#, 3
	intensity $b7
	octave 3
	note F_, 7
	intensity $b4
	note G_, 3
	note D#, 3
	note F_, 3
	note G_, 1
	note D#, 1
	note F_, 3
	note F_, 3
	loopchannel 2, Music_JohtoTrainerBattle_branch_f61bd
	intensity $b7
	note F_, 7
	intensity $b4
	note G_, 3
	note D#, 3
	note F_, 3
	note G#, 1
	note G_, 1
	intensity $b7
	note F_, 7
	note F_, 7
	intensity $b5
	note G_, 3
	note D#, 3
	note F_, 3
	note G_, 1
	note D#, 1
	intensity $b7
	note F_, 7
	note F_, 7
	intensity $b5
	note G_, 3
	note D#, 3
	note F_, 3
	note G_, 1
	note D#, 1
	intensity $3f
	note G#, 7
	intensity $b7
	note G#, 7
	intensity $a0
	octave 4
	note C_, 7
	intensity $a7
	note C_, 7
	intensity $b2
	octave 3
	note D#, 5
	note D#, 5
	note D#, 3
	note D#, 5
	note D#, 5
	intensity $b7
	note F_, 3
	intensity $b2
	note D#, 5
	note D#, 5
	note D#, 3
	note D#, 5
	note D#, 5
	intensity $4c
	note F_, 3
	intensity $b7
	note G#, 5
	note G_, 5
	note F_, 3
	note D#, 3
	note F_, 3
	note G_, 3
	note D#, 3
	note F_, 3
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note F_, 3
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note F_, 1
	note G_, 1
	note G#, 1
	octave 4
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 5
	note D#, 5
	note G_, 3
	octave 4
	note C#, 3
	note C_, 3
	octave 3
	note A#, 3
	note G#, 3
	note F_, 3
	note C#, 1
	note D#, 1
	note F_, 3
	note C#, 1
	note D#, 1
	note A#, 3
	note G#, 3
	note G_, 3
	note F_, 3
	intensity $90
	octave 2
	note A#, 7
	octave 3
	note D#, 7
	octave 2
	note A#, 7
	octave 3
	note G_, 7
	intensity $a0
	note D#, 7
	note A#, 7
	note G_, 7
	octave 4
	note D#, 7
	intensity $a0
	octave 3
	note A#, 7
	intensity $a7
	note A#, 7
	intensity $b7
	note G_, 5
	note A#, 5
	note G#, 1
	note G_, 1
	intensity $a0
	note D#, 7
	intensity $a7
	note D#, 7
	intensity $b4
	note A#, 5
	note G_, 3
	note G_, 1
	note A#, 11
	note __, 15
	note __, 7
	intensity $a0
	octave 4
	note D_, 3
	intensity $a7
	note D_, 11
	intensity $a0
	note F_, 7
	intensity $a7
	note F_, 7
	intensity $b3
	callchannel Music_JohtoTrainerBattle_branch_f629f
	note F_, 3
	note E_, 1
	note F_, 1
	octave 4
	note C_, 3
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	intensity $a0
	octave 3
	note F_, 9
	intensity $a7
	note F_, 5
	loopchannel 0, Music_JohtoTrainerBattle_branch_f6102
; f629f

Music_JohtoTrainerBattle_branch_f629f: ; f629f
	octave 3
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note B_, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note F_, 1
	note D_, 1
	endchannel

Music_JohtoTrainerBattle_Ch2: ; f62b3
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 4
	note G#, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note G#, 0
	note D_, 0
	note D#, 0
	note E_, 0
	note G#, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note G#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note G#, 0
	note C#, 0
	note C_, 0
	note C#, 0
	note G#, 0
	octave 3
	note A#, 0
	note B_, 0
	octave 4
	note C_, 0
	note G#, 0
	octave 3
	note B_, 0
	note A#, 0
	note B_, 0
	octave 4
	note G#, 0
	octave 3
	note A#, 0
	note A_, 0
	note A#, 0
	intensity $c2
	octave 4
	note A_, 5
	callchannel Music_JohtoTrainerBattle_branch_f649a
	intensity $c2
	note A_, 5
	callchannel Music_JohtoTrainerBattle_branch_f649a
	intensity $c2
	octave 5
	note C_, 5
	note C_, 5
	note C_, 3
	note C_, 5
	note C_, 5
	intensity $c7
	note C#, 3
	intensity $c2
	note C_, 1
	intensity $a4
	octave 3
	note E_, 1
	note A_, 1
	intensity $c2
	octave 5
	note C_, 1
	intensity $a4
	octave 3
	note E_, 1
	note A_, 1
	intensity $c2
	octave 5
	note C_, 1
	intensity $a4
	octave 3
	note E_, 1
	intensity $c2
	octave 5
	note C_, 1
	intensity $a4
	octave 3
	note E_, 1
	note B_, 1
	intensity $c2
	octave 5
	note C_, 1
	intensity $a4
	octave 4
	note C_, 1
	note E_, 1
	intensity $c7
	note B_, 3

Music_JohtoTrainerBattle_branch_f632a: ; f632a
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	intensity $3e
	note A#, 7
	intensity $c7
	note A#, 7
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	intensity $c4
	note D_, 3
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	octave 5
	note D_, 1
	intensity $b0
	note C#, 7
	intensity $b7
	note C#, 3
	intensity $c7
	octave 4
	note A#, 3
	intensity $b0
	note A_, 15
	intensity $b7
	note A_, 15

Music_JohtoTrainerBattle_branch_f635a: ; f635a
	intensity $c3
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	intensity $c7
	note A#, 3
	intensity $c3
	note A_, 1
	note G_, 1
	note A#, 1
	loopchannel 3, Music_JohtoTrainerBattle_branch_f635a
	note A_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1

Music_JohtoTrainerBattle_branch_f6376: ; f6376
	note G_, 1
	note F_, 1
	note G_, 1
	intensity $c7
	note G#, 3
	intensity $c3
	note G_, 1
	note F_, 1
	note G#, 1
	loopchannel 3, Music_JohtoTrainerBattle_branch_f6376
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	intensity $c7
	note G_, 5
	octave 4
	note D_, 5
	note C_, 1
	note D_, 1
	note F_, 3
	note E_, 3
	note D_, 3
	note C_, 3
	intensity $b0
	note D#, 9
	intensity $b7
	note D#, 5
	intensity $90
	note G_, 7
	intensity $97
	note G_, 7
	intensity $c7
	octave 3
	note F_, 7
	note D#, 3
	note F_, 3
	note G_, 3
	note F_, 3
	note D#, 3
	note G_, 3
	note G#, 7
	note F_, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note F_, 3
	note G#, 3
	note A_, 7
	note F#, 3
	note G#, 3
	note A_, 3
	note G#, 3
	note F#, 3
	note A_, 3
	intensity $b0
	note A#, 7
	note A#, 7
	intensity $b0
	octave 4
	note D#, 7
	intensity $b7
	note D#, 7
	intensity $62
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	intensity $82
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	intensity $92
	callchannel Music_JohtoTrainerBattle_branch_f64b6
	intensity $a2
	callchannel Music_JohtoTrainerBattle_branch_f64b6

Music_JohtoTrainerBattle_branch_f63dd: ; f63dd
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note G_, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note G_, 1
	octave 3
	note A#, 1
	loopchannel 8, Music_JohtoTrainerBattle_branch_f63dd
	callchannel Music_JohtoTrainerBattle_branch_f64be
	octave 3
	note A#, 1
	intensity $c7
	octave 4
	note C_, 7
	callchannel Music_JohtoTrainerBattle_branch_f64be
	note G_, 1
	intensity $c7
	note F_, 7
	callchannel Music_JohtoTrainerBattle_branch_f64be
	octave 3
	note A#, 1
	intensity $b0
	octave 4
	note C_, 7
	intensity $b7
	note C_, 7
	intensity $1f
	note D#, 11
	intensity $c7
	note D#, 3
	intensity $c2
	octave 3
	note G_, 3
	note D#, 1
	note G_, 5
	note G_, 3
	note G_, 1
	note F_, 1
	note D#, 1
	note G_, 5
	intensity $c7
	note G#, 3
	intensity $c2
	note G_, 3
	note D#, 1
	note G_, 5
	note G_, 3
	note G_, 5
	note G_, 5
	intensity $4c
	note G#, 3
	callchannel Music_JohtoTrainerBattle_branch_f64d2
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	intensity $b0
	note G#, 7
	intensity $b7
	note G#, 7
	callchannel Music_JohtoTrainerBattle_branch_f64d2
	intensity $b0
	note C#, 7
	intensity $b7
	note C#, 7
	intensity $c7
	note C#, 3
	note C_, 3
	octave 3
	note A#, 3
	note G#, 3
	note G_, 5
	note D#, 1
	note A#, 7
	note A#, 5
	note G_, 1
	octave 4
	note D#, 7
	note D#, 5
	octave 3
	note A#, 1
	octave 4
	note G_, 7
	note G_, 5
	note D#, 1
	note A#, 7
	note G_, 5
	note A#, 5
	note G#, 1
	note G_, 1
	intensity $b0
	note D#, 7
	intensity $b7
	note D#, 7
	intensity $c7
	note D#, 5
	note A#, 5
	note G#, 1
	note G_, 1
	intensity $b0
	note D#, 7
	intensity $b7
	note D#, 7
	intensity $c7
	octave 3
	note A_, 5
	octave 4
	note E_, 5
	note D_, 1
	note E_, 1
	note G_, 3
	note F#, 3
	note E_, 3
	note D_, 3
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	intensity $b0
	note A#, 7
	intensity $b7
	note A#, 7
	callchannel Music_JohtoTrainerBattle_branch_f64a3
	intensity $c7
	note D_, 3
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	loopchannel 0, Music_JohtoTrainerBattle_branch_f632a
; f649a

Music_JohtoTrainerBattle_branch_f649a: ; f649a
	octave 3
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 5
	intensity $c7
	note A#, 3
	endchannel
; f64a3

Music_JohtoTrainerBattle_branch_f64a3: ; f64a3
	intensity $c7
	octave 3
	note A_, 5
	octave 4
	note E_, 5
	note D_, 1
	note E_, 1
	note G_, 3
	note F#, 3
	note E_, 3
	note D_, 3
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	endchannel
; f64b6

Music_JohtoTrainerBattle_branch_f64b6: ; f64b6
	octave 3
	note A#, 1
	note D#, 1
	octave 4
	note D#, 1
	octave 3
	note D#, 1
	endchannel
; f64be

Music_JohtoTrainerBattle_branch_f64be: ; f64be
	intensity $c7
	octave 4
	note F_, 3
	intensity $c4
	octave 3
	note A#, 1
	octave 4
	note F_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 0
	note D#, 0
	note D_, 0
	note D#, 0
	note F_, 1
	endchannel
; f64d2

Music_JohtoTrainerBattle_branch_f64d2: ; f64d2
	intensity $c7
	octave 4
	note D#, 5
	note A#, 5
	note G#, 1
	note G_, 1
	note G#, 3
	note G_, 3
	note F_, 3
	note D#, 3
	endchannel

Music_JohtoTrainerBattle_Ch3: ; f64de
	notetype $c, $19
	octave 4
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	octave 3
	note B_, 0
	note A#, 0
	note A_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note E_, 1
	note A#, 1
	note A_, 1
	note G#, 1

Music_JohtoTrainerBattle_branch_f6501: ; f6501
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note E_, 1
	loopchannel 3, Music_JohtoTrainerBattle_branch_f6501
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	callchannel Music_JohtoTrainerBattle_branch_f6676
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	callchannel Music_JohtoTrainerBattle_branch_f6676
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note A_, 1
	note A#, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note G_, 1

Music_JohtoTrainerBattle_branch_f6531: ; f6531
	callchannel Music_JohtoTrainerBattle_branch_f6681
	note E_, 1
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6681
	note A_, 1
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f6692
	callchannel Music_JohtoTrainerBattle_branch_f669d
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	callchannel Music_JohtoTrainerBattle_branch_f669d
	note E_, 1
	octave 4
	note F_, 1
	note E_, 1
	note D_, 1
	octave 3
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	callchannel Music_JohtoTrainerBattle_branch_f66a5
	note D_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	callchannel Music_JohtoTrainerBattle_branch_f66a5
	note D_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note G_, 7
	note F_, 7
	note E_, 7
	note D#, 7

Music_JohtoTrainerBattle_branch_f6591: ; f6591
	octave 3
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note A_, 1
	octave 4
	note C_, 1
	loopchannel 2, Music_JohtoTrainerBattle_branch_f6591
	callchannel Music_JohtoTrainerBattle_branch_f66ac
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note G_, 1

Music_JohtoTrainerBattle_branch_f65ac: ; f65ac
	note C#, 1
	note G#, 1
	loopchannel 7, Music_JohtoTrainerBattle_branch_f65ac
	note B_, 1
	note A_, 1

Music_JohtoTrainerBattle_branch_f65b4: ; f65b4
	note D_, 1
	note A_, 1
	loopchannel 5, Music_JohtoTrainerBattle_branch_f65b4
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1

Music_JohtoTrainerBattle_branch_f65c0: ; f65c0
	note A#, 3
	note D#, 3
	loopchannel 4, Music_JohtoTrainerBattle_branch_f65c0

Music_JohtoTrainerBattle_branch_f65c6: ; f65c6
	octave 4
	note G_, 3
	octave 3
	note A#, 3
	loopchannel 4, Music_JohtoTrainerBattle_branch_f65c6

Music_JohtoTrainerBattle_branch_f65ce: ; f65ce
	callchannel Music_JohtoTrainerBattle_branch_f66b4
	note D#, 1
	note F_, 7
	callchannel Music_JohtoTrainerBattle_branch_f66b4
	octave 4
	note C_, 1
	octave 3
	note A#, 7
	loopchannel 2, Music_JohtoTrainerBattle_branch_f65ce
	octave 4
	note C#, 7
	note C_, 7
	octave 3
	note A#, 7
	note G#, 7
	note F_, 7
	note G_, 7
	note G#, 7
	note A#, 7
	note F_, 7
	note G_, 7
	note G#, 3
	note D#, 1
	note G#, 1
	octave 4
	note C_, 7
	note C_, 7
	note D#, 7
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	note D#, 1
	note A#, 1
	octave 4
	note C_, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1

Music_JohtoTrainerBattle_branch_f661e: ; f661e
	note D#, 1
	note A#, 1
	loopchannel 8, Music_JohtoTrainerBattle_branch_f661e

Music_JohtoTrainerBattle_branch_f6624: ; f6624
	note C#, 1
	note G#, 1
	loopchannel 6, Music_JohtoTrainerBattle_branch_f6624
	note C#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1

Music_JohtoTrainerBattle_branch_f6630: ; f6630
	note D#, 1
	note A#, 1
	loopchannel 8, Music_JohtoTrainerBattle_branch_f6630

Music_JohtoTrainerBattle_branch_f6636: ; f6636
	note C#, 1
	note G#, 1
	loopchannel 4, Music_JohtoTrainerBattle_branch_f6636
	note C#, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G_, 1
	note G#, 1
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 7
	note C#, 7
	note C_, 7
	octave 2
	note A#, 7
	octave 3
	note A#, 7
	note G#, 7
	note G_, 7
	note F_, 7
	octave 4
	note D#, 7
	note D#, 7
	octave 3
	note A#, 7
	note A#, 7
	note G_, 7
	note G_, 7
	note D#, 7
	note D#, 3
	note A#, 3
	note A_, 15
	octave 4
	note C_, 15
	octave 3
	note A#, 15
	octave 4
	note D_, 15
	octave 3
	note A_, 15
	octave 4
	note C_, 15
	octave 3
	note A#, 15
	octave 4
	note D_, 7
	note __, 1
	octave 3
	note A_, 1
	note A#, 1
	octave 4
	note D_, 1
	loopchannel 0, Music_JohtoTrainerBattle_branch_f6531
; f6676

Music_JohtoTrainerBattle_branch_f6676: ; f6676
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note A_, 1
	note A#, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note G_, 1
	endchannel
; f6681

Music_JohtoTrainerBattle_branch_f6681: ; f6681
	octave 3
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	endchannel
; f6692

Music_JohtoTrainerBattle_branch_f6692: ; f6692
	octave 3
	note F_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note A_, 1
	note A#, 1
	octave 4
	note D_, 1
	endchannel
; f669d

Music_JohtoTrainerBattle_branch_f669d: ; f669d
	octave 3
	note E_, 1
	note A_, 1
	loopchannel 4, Music_JohtoTrainerBattle_branch_f669d
	endchannel
; f66a5

Music_JohtoTrainerBattle_branch_f66a5: ; f66a5
	note D_, 1
	note A_, 1
	loopchannel 4, Music_JohtoTrainerBattle_branch_f66a5
	endchannel
; f66ac

Music_JohtoTrainerBattle_branch_f66ac: ; f66ac
	octave 3
	note C_, 1
	note G_, 1
	loopchannel 4, Music_JohtoTrainerBattle_branch_f66ac
	endchannel
; f66b4

Music_JohtoTrainerBattle_branch_f66b4: ; f66b4
	note A#, 3
	note D#, 1
	note A#, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note G_, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note A#, 1
	endchannel
; f66c3
