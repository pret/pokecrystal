Music_JohtoGymBattle: ; ea50d
	dbw $80, Music_JohtoGymBattle_Ch1
	dbw $01, Music_JohtoGymBattle_Ch2
	dbw $02, Music_JohtoGymBattle_Ch3
; ea516


Music_JohtoGymBattle_Ch1: ; ea516
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2

Music_JohtoGymBattle_branch_ea526: ; ea526
	octave 3
	note A#, 0
	note A_, 0
	note G#, 0
	note A_, 0
	loopchannel 4, Music_JohtoGymBattle_branch_ea526

Music_JohtoGymBattle_branch_ea52f: ; ea52f
	note C#, 0
	note C_, 0
	octave 2
	note A#, 0
	octave 3
	note C_, 0
	loopchannel 3, Music_JohtoGymBattle_branch_ea52f
	intensity $4b
	note C#, 3
	intensity $b2
	note D_, 5
	note D#, 5
	note C_, 3
	note F_, 5
	note D_, 5
	note D#, 3
	note D_, 5
	note D#, 5
	note C_, 3
	note F_, 5
	note G_, 5
	intensity $b7
	note C_, 3
	intensity $b2
	note G_, 5
	note G#, 5
	note F_, 3
	note G#, 5
	note F_, 5
	note G#, 3
	note G_, 5
	note G#, 5
	note F_, 3
	note G#, 5
	octave 4
	note C_, 5
	octave 3
	note G#, 1
	note F_, 1

Music_JohtoGymBattle_branch_ea55d: ; ea55d
	intensity $b5
	note D_, 5
	note G_, 5
	note F_, 1
	note G_, 1
	note G#, 3
	note G_, 3
	note F_, 3
	note G_, 3
	intensity $b7
	note G#, 11
	intensity $b2
	note G_, 3
	intensity $b7
	octave 4
	note C#, 11
	intensity $b2
	note C_, 3
	intensity $b5
	octave 3
	note D_, 5
	note G_, 5
	note F_, 1
	note G_, 1
	note G#, 3
	note G_, 3
	note F_, 3
	note G_, 3
	intensity $b7
	note G#, 7
	note G_, 7
	note F_, 7
	note D#, 7
	intensity $70
	note C_, 7
	intensity $77
	note C_, 7
	intensity $b4
	note D#, 1
	note E_, 1
	note F_, 5
	note G_, 1
	note D#, 3
	intensity $77
	octave 2
	note A#, 7
	note A#, 7
	intensity $c5
	octave 3
	note G_, 1
	note G#, 1
	note A#, 5
	note A#, 1
	note G#, 3
	intensity $c7
	note G_, 7
	note F_, 3
	note E_, 1
	note C#, 1
	intensity $a0
	note C_, 7
	intensity $a7
	note C_, 7
	intensity $b2
	note F_, 5
	note F_, 3
	note E_, 1
	note F_, 3
	note F_, 5
	note F_, 5
	note F_, 1
	note G#, 1
	note E_, 5
	note E_, 3
	note F_, 1
	note E_, 1
	note C#, 1
	note C_, 5
	note C_, 5
	note C_, 3
	note F_, 5
	note F_, 1
	note G#, 1
	note E_, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note C_, 3
	note F_, 5
	note E_, 1
	note G#, 1
	note E_, 1
	note G_, 3
	note E_, 3
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 5
	note G_, 3
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note C_, 1
	note C_, 5
	note C_, 5
	note C_, 3
	note C#, 5
	note C#, 5
	note C#, 3
	note D_, 5
	note D_, 5
	note D_, 3
	note D#, 5
	note D#, 5
	note D#, 3
	intensity $80
	note G_, 15
	intensity $90
	note G#, 15
	intensity $a0
	note A_, 7
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	intensity $b0
	note A#, 7
	note B_, 1
	note A#, 1
	note A_, 1
	octave 4
	note C#, 1
	intensity $b7
	note C_, 7
	note C#, 3
	note C_, 3
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note D#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note G#, 3
	note D#, 3
	note G#, 3
	note D#, 3
	note D#, 3
	octave 3
	note G#, 3
	octave 4
	note D#, 3
	octave 3
	note G#, 3
	note G#, 7
	note A_, 3
	note G#, 3
	note D#, 1
	note G#, 1
	note D#, 1
	octave 4
	note C#, 1
	octave 3
	note D#, 1
	note A_, 1
	note D#, 1
	note G_, 1
	octave 4
	note C#, 3
	octave 3
	note G#, 3
	octave 4
	note C#, 3
	octave 3
	note G#, 3
	note G#, 3
	note C#, 3
	note G#, 3
	note C#, 3
	note B_, 7
	note A_, 7
	note G#, 7
	note F#, 7
	intensity $b4
	note A_, 3
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	octave 4
	note E_, 3
	intensity $92
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	intensity $b2
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	intensity $c2
	note D#, 15
	intensity $50
	octave 3
	note C_, 15
	note F_, 15
	note E_, 15
	intensity $97
	note D#, 9
	intensity $b4
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	note F#, 1
	loopchannel 0, Music_JohtoGymBattle_branch_ea55d

Music_JohtoGymBattle_Ch2: ; ea65f
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2

Music_JohtoGymBattle_branch_ea66a: ; ea66a
	octave 4
	note F#, 0
	note F_, 0
	note E_, 0
	note A#, 0
	loopchannel 4, Music_JohtoGymBattle_branch_ea66a

Music_JohtoGymBattle_branch_ea673: ; ea673
	note F#, 0
	note F_, 0
	note F#, 0
	note A#, 0
	loopchannel 4, Music_JohtoGymBattle_branch_ea673
	note A_, 5
	octave 3
	note A#, 5
	note G_, 3
	octave 4
	note D_, 5
	octave 3
	note A_, 5
	note A#, 3
	note A_, 5
	note A#, 5
	note G_, 3
	octave 4
	note D_, 5
	note D#, 5
	intensity $b0
	octave 3
	note D#, 3
	intensity $c2
	octave 4
	note D_, 1
	intensity $92
	octave 3
	note D_, 1
	note D_, 1
	intensity $c2
	octave 4
	note D#, 3
	intensity $92
	octave 3
	note D_, 1
	intensity $c2
	octave 4
	note C_, 3
	note G_, 1
	notetype $c, $92
	octave 3
	note D_, 1
	note D_, 1
	intensity $c2
	octave 4
	note D_, 3
	intensity $92
	octave 3
	note D_, 1
	intensity $c2
	octave 4
	note D#, 1
	intensity $92
	octave 3
	note D#, 1
	intensity $c2
	octave 4
	note D_, 1
	intensity $92
	octave 3
	note D_, 1
	note D_, 1
	intensity $c2
	octave 4
	note D#, 3
	intensity $92
	octave 3
	note D_, 1
	intensity $c2
	octave 4
	note C_, 1
	intensity $92
	octave 3
	note D#, 1
	intensity $c2
	octave 4
	note G_, 1
	intensity $92
	octave 3
	note F_, 1
	note F_, 1
	intensity $c2
	octave 4
	note G#, 1
	intensity $92
	octave 3
	note F_, 1
	note F_, 1
	intensity $c2
	octave 4
	note F#, 1
	intensity $b2
	octave 3
	note G#, 0
	note A_, 0

Music_JohtoGymBattle_branch_ea6ee: ; ea6ee
	intensity $c7
	note A#, 7
	intensity $c4
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	intensity $c7
	note C#, 7
	intensity $c4
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	intensity $b0
	note F_, 5
	intensity $b7
	note F_, 5
	intensity $c2
	note D#, 3
	intensity $b0
	note G#, 5
	intensity $b7
	note G#, 5
	intensity $c2
	note F_, 3
	intensity $c7
	octave 3
	note A#, 7
	intensity $c4
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	intensity $c7
	note C#, 7
	intensity $c4
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	intensity $b0
	note C#, 15
	intensity $b7
	note C#, 15
	intensity $a4
	octave 3
	note F_, 5
	note D#, 5
	note F_, 3
	intensity $c6
	octave 4
	note C_, 5
	octave 3
	note A#, 5
	octave 4
	note C_, 3
	intensity $a4
	octave 3
	note C#, 5
	note C_, 5
	note C#, 3
	intensity $c6
	octave 4
	note C#, 5
	note C_, 5
	note C#, 3
	intensity $3c
	note C_, 9
	intensity $b7
	note C_, 5
	intensity $b0
	note E_, 7
	intensity $b7
	note E_, 7
	intensity $b0
	octave 3
	note C#, 15
	octave 2
	note A#, 7
	octave 3
	note C#, 5
	note D#, 1
	note C_, 15
	note E_, 15
	intensity $a0
	octave 5
	note C#, 3
	intensity $a7
	octave 5
	note C#, 11
	intensity $b7
	octave 4
	note A#, 7
	octave 5
	note C#, 5
	note D#, 1
	intensity $a0
	note C_, 7
	intensity $a7
	note C_, 7
	intensity $3e
	note E_, 5
	intensity $a6
	note E_, 9
	intensity $c2
	octave 3
	note F_, 5
	note F_, 5
	note F_, 3
	note F#, 5
	note F#, 5
	note F#, 3
	note G_, 5
	note G_, 5
	note G_, 3
	note G#, 5
	note G#, 5
	note G#, 3
	intensity $90
	octave 4
	note C_, 15
	intensity $a0
	note C#, 15
	intensity $b0
	note D_, 15
	intensity $b7
	note D#, 7
	intensity $4c
	note D#, 5
	intensity $c2
	note F#, 0
	note G_, 0
	intensity $c7
	note G#, 7
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 3
	octave 5
	note C_, 3
	octave 4
	note A_, 3
	note G#, 3
	octave 5
	note D#, 3
	octave 4
	note G#, 3
	octave 5
	note D#, 3
	octave 4
	note G#, 3
	octave 5
	note D#, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 4
	note A_, 1
	note G#, 1
	note A_, 1
	note D#, 7
	note E_, 1
	note D#, 1
	note C#, 1
	note E_, 1
	note D#, 3
	note G#, 3
	note E_, 3
	note C#, 3
	note G#, 3
	note C#, 3
	note G#, 3
	note C#, 3
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	note D#, 7
	note C#, 7
	octave 3
	note B_, 7
	note A_, 7
	octave 4
	note D#, 3
	note G#, 3
	note E_, 3
	note A_, 3
	intensity $c0
	note G#, 7
	intensity $c7
	note G#, 7
	intensity $c2
	note G#, 15
	intensity $80
	octave 3
	note F_, 15
	octave 4
	note C_, 15
	octave 3
	note B_, 15
	note G_, 15
	loopchannel 0, Music_JohtoGymBattle_branch_ea6ee

Music_JohtoGymBattle_Ch3: ; ea7f4
	notetype $c, $19
	octave 4
	note F_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 4
	note F_, 0
	note __, 0
	octave 3
	note G#, 1
	octave 4
	note F_, 0
	note __, 0
	octave 3
	note G_, 1
	octave 4
	note F_, 0
	note __, 0
	octave 3
	note F#, 1
	octave 4
	note G#, 0
	note __, 0
	octave 3
	note F_, 1
	octave 4
	note G#, 0
	note __, 0
	octave 3
	note E_, 1
	note F_, 1
	note G_, 1
	note G#, 3
	callchannel Music_JohtoGymBattle_branch_ea952
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note D#, 1
	note F#, 3
	callchannel Music_JohtoGymBattle_branch_ea952
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1

Music_JohtoGymBattle_branch_ea83f: ; ea83f
	callchannel Music_JohtoGymBattle_branch_ea963
	callchannel Music_JohtoGymBattle_branch_ea963
	callchannel Music_JohtoGymBattle_branch_ea96a
	note C#, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	note A#, 1
	note A_, 1
	note G#, 1
	callchannel Music_JohtoGymBattle_branch_ea963
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea96a
	note C_, 1
	note G_, 1
	note A#, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A#, 1
	callchannel Music_JohtoGymBattle_branch_ea971
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note G_, 1
	note G#, 1
	note F_, 1
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note C_, 1
	note C#, 1
	note G#, 1
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note F_, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 1
	note G_, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea983
	note __, 1
	callchannel Music_JohtoGymBattle_branch_ea990
	octave 4
	note C#, 1
	callchannel Music_JohtoGymBattle_branch_ea99c
	note __, 1
	note D#, 1
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note D#, 1
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	callchannel Music_JohtoGymBattle_branch_ea983
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea990
	note G#, 1
	callchannel Music_JohtoGymBattle_branch_ea99c
	note A_, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	note D#, 1
	octave 4
	note D#, 1
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	note D_, 3
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 1
	note G#, 1
	note D#, 1
	octave 4
	note C#, 1
	octave 3
	note D#, 1
	note A_, 1
	note D#, 1
	note G#, 1
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	callchannel Music_JohtoGymBattle_branch_ea9b1
	note C#, 1
	note F#, 1
	note C#, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	note A_, 1
	note C#, 1
	note G_, 1
	callchannel Music_JohtoGymBattle_branch_ea9b1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note D#, 1
	note E_, 1
	note A_, 1
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note D#, 1
	note G#, 1
	note D#, 1
	note A_, 1
	note D#, 1
	note B_, 1
	note D#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F#, 1
	note E_, 1
	note F#, 1
	callchannel Music_JohtoGymBattle_branch_ea9b8
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	callchannel Music_JohtoGymBattle_branch_ea9b8
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	loopchannel 0, Music_JohtoGymBattle_branch_ea83f
; ea952

Music_JohtoGymBattle_branch_ea952: ; ea952
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note F_, 1
	note D#, 1
	note F_, 1
	endchannel
; ea963

Music_JohtoGymBattle_branch_ea963: ; ea963
	note D_, 1
	note G_, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea963
	endchannel
; ea96a

Music_JohtoGymBattle_branch_ea96a: ; ea96a
	note C#, 1
	note G#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea96a
	endchannel
; ea971

Music_JohtoGymBattle_branch_ea971: ; ea971
	note C_, 1
	note G_, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea971
	endchannel
; ea978

Music_JohtoGymBattle_branch_ea978: ; ea978
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	octave 2
	note A#, 1
	endchannel
; ea983

Music_JohtoGymBattle_branch_ea983: ; ea983
	octave 3
	note C_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	endchannel
; ea990

Music_JohtoGymBattle_branch_ea990: ; ea990
	note C#, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	endchannel
; ea99c

Music_JohtoGymBattle_branch_ea99c: ; ea99c
	octave 3
	note D_, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	endchannel
; ea9a9

Music_JohtoGymBattle_branch_ea9a9: ; ea9a9
	octave 3
	note D#, 1
	note G#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea9a9
	endchannel
; ea9b1

Music_JohtoGymBattle_branch_ea9b1: ; ea9b1
	note C#, 1
	note F#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea9b1
	endchannel
; ea9b8

Music_JohtoGymBattle_branch_ea9b8: ; ea9b8
	note F_, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	endchannel
; ea9c1
