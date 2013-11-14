Music_RocketBattle: ; e9b6f
	dbw $80, Music_RocketBattle_Ch1
	dbw $01, Music_RocketBattle_Ch2
	dbw $02, Music_RocketBattle_Ch3
; e9b78


Music_RocketBattle_Ch1: ; e9b78
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $b2
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
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 2
	note B_, 0

Music_RocketBattle_branch_e9bad: ; e9bad
	intensity $b2
	octave 3
	note C_, 5
	note C_, 3
	note E_, 1
	intensity $b7
	note D_, 3
	loopchannel 3, Music_RocketBattle_branch_e9bad
	intensity $b2
	note C_, 5
	note C_, 5
	intensity $b7
	note D_, 3

Music_RocketBattle_branch_e9bc1: ; e9bc1
	intensity $b2
	octave 4
	note E_, 5
	note E_, 3
	note G_, 1
	intensity $b7
	note F_, 3
	loopchannel 3, Music_RocketBattle_branch_e9bc1
	intensity $b2
	note E_, 5
	note E_, 3
	intensity $b7
	note D_, 1
	note D#, 3
	intensity $b3
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note E_, 1
	note A#, 1
	note F_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note D_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	intensity $b5
	note G_, 3
	intensity $b3
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	intensity $b5
	note D#, 3
	intensity $b3
	note D#, 1
	note D_, 1
	note F_, 1

Music_RocketBattle_branch_e9c02: ; e9c02
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	note E_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note D_, 1
	note D_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	note E_, 1
	octave 4
	note D_, 1
	octave 3
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	intensity $b5
	note G_, 3
	intensity $b3
	note G_, 1
	note F_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	intensity $b5
	note F_, 3
	intensity $b2
	octave 3
	note F_, 1
	note G_, 1
	note G#, 3
	intensity $b5
	note D_, 3
	note C_, 3
	note D_, 3
	note E_, 1
	intensity $b2
	note F_, 1
	note A_, 3
	intensity $b7
	note A_, 3
	intensity $b5
	note A_, 1
	note G_, 1
	note F_, 3
	note D_, 3
	note C_, 3
	note D_, 3
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note A#, 1
	note G_, 1
	note A_, 1
	note A#, 1
	intensity $b7
	octave 4
	note E_, 5
	note D_, 3
	octave 3
	note G_, 1
	note A#, 3
	note A_, 5
	note G_, 3
	note E_, 1
	note F_, 3
	note E_, 5
	note D_, 5
	note D#, 3
	intensity $a0
	note E_, 7
	intensity $a7
	note E_, 7
	intensity $b7
	octave 2
	note A_, 7
	note G_, 7
	note A_, 7
	note A#, 7
	note A_, 7
	note G_, 7
	note A_, 7
	octave 3
	note C#, 7
	note D_, 7
	note C#, 7
	octave 2
	note A#, 7
	note A_, 7
	octave 3
	note D_, 7
	note C#, 7
	note D_, 7
	note E_, 7
	octave 2
	note A#, 5
	octave 3
	note D_, 5
	note C_, 3
	intensity $b5
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note E_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	note D_, 1
	note C#, 1
	octave 3
	note A#, 1
	note G_, 1
	intensity $b2
	note E_, 5
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 3
	intensity $b7
	note G_, 1
	note F_, 3
	intensity $b2
	note E_, 5
	note E_, 3
	intensity $b7
	note G_, 1
	note F_, 3
	intensity $b2
	note E_, 5
	octave 4
	note D_, 0
	note D#, 0
	intensity $a0
	note E_, 7
	intensity $b2
	octave 3
	note F_, 5
	note F_, 3
	intensity $b7
	note A#, 1
	note G_, 3

Music_RocketBattle_branch_e9cc5: ; e9cc5
	intensity $b2
	note F_, 5
	note F_, 3
	intensity $b7
	note A_, 1
	note G_, 3
	loopchannel 2, Music_RocketBattle_branch_e9cc5
	intensity $b2
	note F_, 5
	octave 4
	note D_, 0
	note E_, 0
	intensity $a0
	note F_, 7
	intensity $b3
	note D_, 1
	octave 3
	note A_, 1
	note E_, 1
	note A_, 3
	note A_, 1
	intensity $b7
	octave 4
	note D_, 3
	intensity $b3
	note D#, 1
	octave 3
	note A#, 1
	note G_, 1
	note A#, 3
	note A#, 1
	intensity $b7
	octave 4
	note D_, 3
	intensity $b3
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 3
	note C_, 1
	intensity $b7
	note D#, 3
	intensity $a0
	note E_, 3
	intensity $a7
	note E_, 5
	intensity $a0
	octave 3
	note G#, 5
	intensity $b3
	note C_, 1
	note E_, 1
	note E_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note F_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note D_, 1
	note C_, 1
	note E_, 1
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	note C_, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	intensity $b5
	note D_, 3
	intensity $b3
	note D_, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note C#, 1
	note D_, 1
	intensity $b5
	note D#, 3
	intensity $b3
	note D#, 1
	note D_, 1
	note F_, 1
	loopchannel 0, Music_RocketBattle_branch_e9c02

Music_RocketBattle_Ch2: ; e9d3e
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $b2
	octave 4
	note A_, 3
	note A#, 3
	note B_, 3
	octave 5
	note C_, 0
	intensity $82
	octave 4
	note G#, 0
	note A_, 0
	note G#, 0
	intensity $c2
	octave 5
	note C#, 0
	intensity $92
	octave 4
	note G#, 0
	note A_, 0
	note G#, 0
	intensity $c2
	octave 5
	note D_, 0
	intensity $a2
	octave 4
	note G#, 0
	note A_, 0
	note G#, 0
	intensity $c2
	octave 5
	note D#, 0
	intensity $b2
	octave 4
	note G#, 0
	note A_, 0
	note G#, 0
	intensity $c2
	octave 5
	note E_, 0
	octave 4
	note G#, 0
	note A_, 0
	note G#, 0

Music_RocketBattle_branch_e9d7b: ; e9d7b
	intensity $c2
	octave 3
	note A_, 5
	note A_, 3
	octave 4
	note C_, 1
	intensity $c7
	octave 3
	note A#, 3
	loopchannel 3, Music_RocketBattle_branch_e9d7b
	intensity $c2
	note A_, 5
	note A_, 5
	intensity $4a
	note G#, 3

Music_RocketBattle_branch_e9d91: ; e9d91
	intensity $c2
	octave 4
	note A_, 5
	note A_, 3
	octave 5
	note C_, 1
	intensity $c7
	octave 4
	note A#, 3
	loopchannel 3, Music_RocketBattle_branch_e9d91
	intensity $c2
	note A_, 5
	note A_, 3
	intensity $c7
	note G_, 1
	note G#, 3
	callchannel Music_RocketBattle_branch_e9ea0
	intensity $b0
	note F_, 15
	intensity $b7
	note F_, 15

Music_RocketBattle_branch_e9db1: ; e9db1
	callchannel Music_RocketBattle_branch_e9ea0
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	intensity $b0
	note A#, 7
	intensity $b7
	note A#, 7
	intensity $c4
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	intensity $c7
	octave 4
	note C_, 3
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	intensity $c2
	note A_, 1
	octave 4
	note C_, 3
	intensity $b0
	note C_, 5
	intensity $b7
	note C_, 3
	intensity $c4
	octave 3
	note A#, 1
	note A_, 1
	note A#, 1
	intensity $c7
	octave 4
	note D_, 3
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	intensity $c2
	note A#, 1
	octave 4
	note D_, 3
	intensity $b0
	note D_, 3
	intensity $b7
	note D_, 5
	intensity $4f
	note A_, 5
	intensity $a0
	note G_, 5
	note F_, 3
	note E_, 5
	note F_, 5
	note G_, 3
	note A_, 5
	note A#, 5
	note G#, 3
	note A_, 5
	intensity $a7
	note A_, 9
	intensity $3f
	octave 3
	note D_, 7
	intensity $b7
	note D_, 7
	intensity $3f
	note C#, 7
	intensity $b7
	note C#, 7
	intensity $3f
	note D_, 7
	intensity $b7
	note D_, 7
	intensity $3f
	note E_, 7
	intensity $b7
	note E_, 7
	intensity $4e
	note F_, 7
	intensity $a0
	note F_, 7
	note E_, 15
	note F_, 15
	note A_, 15
	intensity $3f
	note F_, 15
	intensity $c7
	octave 4
	note D_, 7
	note C#, 7
	intensity $b0
	note E_, 7
	intensity $b7
	note E_, 7
	intensity $3c
	note A_, 5
	intensity $c7
	note A_, 9
	intensity $c2
	octave 3
	note A_, 5
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 3
	intensity $c7
	octave 4
	note C_, 1
	octave 3
	note A#, 3
	intensity $c2
	note A_, 5
	note A_, 3
	intensity $c7
	octave 4
	note C_, 1
	octave 3
	note A#, 3
	intensity $c2
	note A_, 5
	intensity $c7
	octave 4
	note G_, 0
	note G#, 0
	note A_, 7

Music_RocketBattle_branch_e9e5a: ; e9e5a
	intensity $c2
	octave 3
	note A#, 5
	note A#, 3
	intensity $c7
	octave 4
	note D_, 1
	note C_, 3
	loopchannel 3, Music_RocketBattle_branch_e9e5a
	intensity $c2
	octave 3
	note A#, 5
	intensity $c7
	octave 4
	note G_, 0
	note A_, 0
	note A#, 7
	intensity $c7
	note A_, 5
	note G_, 5
	note A_, 3
	note A#, 5
	octave 5
	note D_, 5
	octave 4
	note A#, 3
	note A_, 5
	note G_, 5
	intensity $c5
	note A_, 3
	intensity $b0
	note A_, 7
	intensity $b7
	note A_, 7
	intensity $c6
	octave 3
	note A_, 5
	note G#, 5
	note E_, 3
	note A_, 5
	note G#, 5
	note E_, 3
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	intensity $3d
	note A#, 7
	intensity $c7
	note A#, 7
	loopchannel 0, Music_RocketBattle_branch_e9db1
; e9ea0

Music_RocketBattle_branch_e9ea0: ; e9ea0
	intensity $c6
	octave 4
	note A_, 5
	note G#, 5
	note E_, 3
	note A_, 5
	note G#, 5
	note E_, 3
	endchannel

Music_RocketBattle_Ch3: ; e9eaa
	notetype $c, $19
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	octave 3
	note G#, 1
	octave 4
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note E_, 1
	octave 3
	note F#, 1
	octave 4
	note E_, 1
	octave 3
	note F_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1

Music_RocketBattle_branch_e9ecc: ; e9ecc
	callchannel Music_RocketBattle_branch_e9fe6
	loopchannel 3, Music_RocketBattle_branch_e9ecc
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1

Music_RocketBattle_branch_e9edf: ; e9edf
	callchannel Music_RocketBattle_branch_e9fe6
	loopchannel 3, Music_RocketBattle_branch_e9edf
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note A_, 1
	note A#, 1
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 1
	callchannel Music_RocketBattle_branch_ea01d

Music_RocketBattle_branch_e9efe: ; e9efe
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note A#, 1
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
	octave 3
	note F_, 1
	note E_, 1
	note D_, 1
	callchannel Music_RocketBattle_branch_ea02a
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1

Music_RocketBattle_branch_e9f25: ; e9f25
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	loopchannel 5, Music_RocketBattle_branch_e9f25
	note A#, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	callchannel Music_RocketBattle_branch_ea02a
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note F_, 1
	note E_, 1
	note D_, 1
	callchannel Music_RocketBattle_branch_ea02a
	callchannel Music_RocketBattle_branch_ea02a

Music_RocketBattle_branch_e9f4e: ; e9f4e
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note A#, 1
	note A_, 1
	octave 3
	note D_, 1
	note G_, 1
	note F_, 1
	loopchannel 7, Music_RocketBattle_branch_e9f4e
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note A#, 1
	note A_, 1
	octave 3
	note A_, 1
	note G_, 1
	note F_, 1

Music_RocketBattle_branch_e9f6a: ; e9f6a
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	loopchannel 4, Music_RocketBattle_branch_e9f6a
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1

Music_RocketBattle_branch_e9f7c: ; e9f7c
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	loopchannel 13, Music_RocketBattle_branch_e9f7c
	octave 2
	note A_, 1
	octave 3
	note E_, 3
	note D_, 1
	note C_, 1
	octave 2
	note A#, 1

Music_RocketBattle_branch_e9f8c: ; e9f8c
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	loopchannel 4, Music_RocketBattle_branch_e9f8c
	octave 2
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note A#, 3
	note A_, 1
	note G_, 1
	note A#, 1

Music_RocketBattle_branch_e9f9e: ; e9f9e
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	loopchannel 7, Music_RocketBattle_branch_e9f9e
	note E_, 1
	note F_, 1

Music_RocketBattle_branch_e9fa8: ; e9fa8
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	loopchannel 5, Music_RocketBattle_branch_e9fa8
	octave 3
	note A#, 1
	octave 4
	note D_, 3
	note C_, 1
	octave 3
	note A#, 1
	note G_, 1
	callchannel Music_RocketBattle_branch_ea033
	octave 3
	note E_, 1
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 1
	callchannel Music_RocketBattle_branch_ea033
	octave 3
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 1
	callchannel Music_RocketBattle_branch_ea01d
	loopchannel 0, Music_RocketBattle_branch_e9efe
; e9fe6

Music_RocketBattle_branch_e9fe6: ; e9fe6
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note A_, 1
	note A#, 1
	octave 3
	note E_, 1
	note G_, 1
	note F_, 1
	endchannel
; e9ff3

Music_RocketBattle_branch_e9ff3: ; e9ff3
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D#, 1
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note D#, 1
	note D_, 1
	endchannel
; ea010

Music_RocketBattle_branch_ea010: ; ea010
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 2
	note A#, 1
	endchannel
; ea01d

Music_RocketBattle_branch_ea01d: ; ea01d
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	endchannel
; ea02a

Music_RocketBattle_branch_ea02a: ; ea02a
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	loopchannel 4, Music_RocketBattle_branch_ea02a
	endchannel
; ea033

Music_RocketBattle_branch_ea033: ; ea033
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note A_, 1
	octave 2
	note A_, 1
	endchannel
; ea040
