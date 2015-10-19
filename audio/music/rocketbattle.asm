Music_RocketBattle: ; e9b6f
	dbw $80, Music_RocketBattle_Ch1
	dbw $01, Music_RocketBattle_Ch2
	dbw $02, Music_RocketBattle_Ch3
; e9b78

Music_RocketBattle_Ch1: ; e9b78
	tempo 101
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $10, $1, $5
	notetype $c, $b, $0, $2
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
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
Music_RocketBattle_branch_e9bad: ; e9bad
	volenvelope $b, $0, $2
	octave 3
	note C_, 6
	note C_, 4
	note E_, 2
	volenvelope $b, $0, $7
	note D_, 4
	loopchannel 3, Music_RocketBattle_branch_e9bad
	volenvelope $b, $0, $2
	note C_, 6
	note C_, 6
	volenvelope $b, $0, $7
	note D_, 4
Music_RocketBattle_branch_e9bc1: ; e9bc1
	volenvelope $b, $0, $2
	octave 4
	note E_, 6
	note E_, 4
	note G_, 2
	volenvelope $b, $0, $7
	note F_, 4
	loopchannel 3, Music_RocketBattle_branch_e9bc1
	volenvelope $b, $0, $2
	note E_, 6
	note E_, 4
	volenvelope $b, $0, $7
	note D_, 2
	note D#, 4
	volenvelope $b, $0, $3
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A#, 2
	note F_, 2
	note F_, 2
	note A_, 2
	note D_, 2
	note D_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	volenvelope $b, $0, $5
	note G_, 4
	volenvelope $b, $0, $3
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	volenvelope $b, $0, $5
	note D#, 4
	volenvelope $b, $0, $3
	note D#, 2
	note D_, 2
	note F_, 2
Music_RocketBattle_branch_e9c02: ; e9c02
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 2
	note D_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	volenvelope $b, $0, $5
	note G_, 4
	volenvelope $b, $0, $3
	note G_, 2
	note F_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	volenvelope $b, $0, $5
	note F_, 4
	volenvelope $b, $0, $2
	octave 3
	note F_, 2
	note G_, 2
	note G#, 4
	volenvelope $b, $0, $5
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	volenvelope $b, $0, $2
	note F_, 2
	note A_, 4
	volenvelope $b, $0, $7
	note A_, 4
	volenvelope $b, $0, $5
	note A_, 2
	note G_, 2
	note F_, 4
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 4
	note E_, 6
	note D_, 4
	octave 3
	note G_, 2
	note A#, 4
	note A_, 6
	note G_, 4
	note E_, 2
	note F_, 4
	note E_, 6
	note D_, 6
	note D#, 4
	volenvelope $a, $0, $0
	note E_, 8
	volenvelope $a, $0, $7
	note E_, 8
	volenvelope $b, $0, $7
	octave 2
	note A_, 8
	note G_, 8
	note A_, 8
	note A#, 8
	note A_, 8
	note G_, 8
	note A_, 8
	octave 3
	note C#, 8
	note D_, 8
	note C#, 8
	octave 2
	note A#, 8
	note A_, 8
	octave 3
	note D_, 8
	note C#, 8
	note D_, 8
	note E_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note C_, 4
	volenvelope $b, $0, $5
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note G_, 2
	volenvelope $b, $0, $2
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 6
	note E_, 4
	volenvelope $b, $0, $7
	note G_, 2
	note F_, 4
	volenvelope $b, $0, $2
	note E_, 6
	note E_, 4
	volenvelope $b, $0, $7
	note G_, 2
	note F_, 4
	volenvelope $b, $0, $2
	note E_, 6
	octave 4
	note D_, 1
	note D#, 1
	volenvelope $a, $0, $0
	note E_, 8
	volenvelope $b, $0, $2
	octave 3
	note F_, 6
	note F_, 4
	volenvelope $b, $0, $7
	note A#, 2
	note G_, 4
Music_RocketBattle_branch_e9cc5: ; e9cc5
	volenvelope $b, $0, $2
	note F_, 6
	note F_, 4
	volenvelope $b, $0, $7
	note A_, 2
	note G_, 4
	loopchannel 2, Music_RocketBattle_branch_e9cc5
	volenvelope $b, $0, $2
	note F_, 6
	octave 4
	note D_, 1
	note E_, 1
	volenvelope $a, $0, $0
	note F_, 8
	volenvelope $b, $0, $3
	note D_, 2
	octave 3
	note A_, 2
	note E_, 2
	note A_, 4
	note A_, 2
	volenvelope $b, $0, $7
	octave 4
	note D_, 4
	volenvelope $b, $0, $3
	note D#, 2
	octave 3
	note A#, 2
	note G_, 2
	note A#, 4
	note A#, 2
	volenvelope $b, $0, $7
	octave 4
	note D_, 4
	volenvelope $b, $0, $3
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 4
	note C_, 2
	volenvelope $b, $0, $7
	note D#, 4
	volenvelope $a, $0, $0
	note E_, 4
	volenvelope $a, $0, $7
	note E_, 6
	volenvelope $a, $0, $0
	octave 3
	note G#, 6
	volenvelope $b, $0, $3
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	note C_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	volenvelope $b, $0, $5
	note D_, 4
	volenvelope $b, $0, $3
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note C#, 2
	note D_, 2
	volenvelope $b, $0, $5
	note D#, 4
	volenvelope $b, $0, $3
	note D#, 2
	note D_, 2
	note F_, 2
	loopchannel 0, Music_RocketBattle_branch_e9c02
; e9d3e

Music_RocketBattle_Ch2: ; e9d3e
	waveduty $3
	vibrato $8, $3, $6
	pitchoffset $0001
	notetype $c, $b, $0, $2
	octave 4
	note A_, 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 1
	volenvelope $8, $0, $2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	volenvelope $c, $0, $2
	octave 5
	note C#, 1
	volenvelope $9, $0, $2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	volenvelope $c, $0, $2
	octave 5
	note D_, 1
	volenvelope $a, $0, $2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	volenvelope $c, $0, $2
	octave 5
	note D#, 1
	volenvelope $b, $0, $2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	volenvelope $c, $0, $2
	octave 5
	note E_, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
Music_RocketBattle_branch_e9d7b: ; e9d7b
	volenvelope $c, $0, $2
	octave 3
	note A_, 6
	note A_, 4
	octave 4
	note C_, 2
	volenvelope $c, $0, $7
	octave 3
	note A#, 4
	loopchannel 3, Music_RocketBattle_branch_e9d7b
	volenvelope $c, $0, $2
	note A_, 6
	note A_, 6
	volenvelope $4, $1, $2
	note G#, 4
Music_RocketBattle_branch_e9d91: ; e9d91
	volenvelope $c, $0, $2
	octave 4
	note A_, 6
	note A_, 4
	octave 5
	note C_, 2
	volenvelope $c, $0, $7
	octave 4
	note A#, 4
	loopchannel 3, Music_RocketBattle_branch_e9d91
	volenvelope $c, $0, $2
	note A_, 6
	note A_, 4
	volenvelope $c, $0, $7
	note G_, 2
	note G#, 4
	callchannel Music_RocketBattle_branch_e9ea0
	volenvelope $b, $0, $0
	note F_, 16
	volenvelope $b, $0, $7
	note F_, 16
Music_RocketBattle_branch_e9db1: ; e9db1
	callchannel Music_RocketBattle_branch_e9ea0
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $0
	note A#, 8
	volenvelope $b, $0, $7
	note A#, 8
	volenvelope $c, $0, $4
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	volenvelope $c, $0, $7
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	volenvelope $c, $0, $2
	note A_, 2
	octave 4
	note C_, 4
	volenvelope $b, $0, $0
	note C_, 6
	volenvelope $b, $0, $7
	note C_, 4
	volenvelope $c, $0, $4
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	volenvelope $c, $0, $7
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	volenvelope $c, $0, $2
	note A#, 2
	octave 4
	note D_, 4
	volenvelope $b, $0, $0
	note D_, 4
	volenvelope $b, $0, $7
	note D_, 6
	volenvelope $4, $1, $7
	note A_, 6
	volenvelope $a, $0, $0
	note G_, 6
	note F_, 4
	note E_, 6
	note F_, 6
	note G_, 4
	note A_, 6
	note A#, 6
	note G#, 4
	note A_, 6
	volenvelope $a, $0, $7
	note A_, 10
	volenvelope $3, $1, $7
	octave 3
	note D_, 8
	volenvelope $b, $0, $7
	note D_, 8
	volenvelope $3, $1, $7
	note C#, 8
	volenvelope $b, $0, $7
	note C#, 8
	volenvelope $3, $1, $7
	note D_, 8
	volenvelope $b, $0, $7
	note D_, 8
	volenvelope $3, $1, $7
	note E_, 8
	volenvelope $b, $0, $7
	note E_, 8
	volenvelope $4, $1, $6
	note F_, 8
	volenvelope $a, $0, $0
	note F_, 8
	note E_, 16
	note F_, 16
	note A_, 16
	volenvelope $3, $1, $7
	note F_, 16
	volenvelope $c, $0, $7
	octave 4
	note D_, 8
	note C#, 8
	volenvelope $b, $0, $0
	note E_, 8
	volenvelope $b, $0, $7
	note E_, 8
	volenvelope $3, $1, $4
	note A_, 6
	volenvelope $c, $0, $7
	note A_, 10
	volenvelope $c, $0, $2
	octave 3
	note A_, 6
	note A_, 6
	note A_, 4
	note A_, 6
	note A_, 4
	volenvelope $c, $0, $7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	volenvelope $c, $0, $2
	note A_, 6
	note A_, 4
	volenvelope $c, $0, $7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	volenvelope $c, $0, $2
	note A_, 6
	volenvelope $c, $0, $7
	octave 4
	note G_, 1
	note G#, 1
	note A_, 8
Music_RocketBattle_branch_e9e5a: ; e9e5a
	volenvelope $c, $0, $2
	octave 3
	note A#, 6
	note A#, 4
	volenvelope $c, $0, $7
	octave 4
	note D_, 2
	note C_, 4
	loopchannel 3, Music_RocketBattle_branch_e9e5a
	volenvelope $c, $0, $2
	octave 3
	note A#, 6
	volenvelope $c, $0, $7
	octave 4
	note G_, 1
	note A_, 1
	note A#, 8
	volenvelope $c, $0, $7
	note A_, 6
	note G_, 6
	note A_, 4
	note A#, 6
	octave 5
	note D_, 6
	octave 4
	note A#, 4
	note A_, 6
	note G_, 6
	volenvelope $c, $0, $5
	note A_, 4
	volenvelope $b, $0, $0
	note A_, 8
	volenvelope $b, $0, $7
	note A_, 8
	volenvelope $c, $0, $6
	octave 3
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $3, $1, $5
	note A#, 8
	volenvelope $c, $0, $7
	note A#, 8
	loopchannel 0, Music_RocketBattle_branch_e9db1
; e9ea0

Music_RocketBattle_branch_e9ea0: ; e9ea0
	volenvelope $c, $0, $6
	octave 4
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	endchannel
; e9eaa

Music_RocketBattle_Ch3: ; e9eaa
	notetype $c, $1, $1, $1
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note F#, 2
	octave 4
	note E_, 2
	octave 3
	note F_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
Music_RocketBattle_branch_e9ecc: ; e9ecc
	callchannel Music_RocketBattle_branch_e9fe6
	loopchannel 3, Music_RocketBattle_branch_e9ecc
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
Music_RocketBattle_branch_e9edf: ; e9edf
	callchannel Music_RocketBattle_branch_e9fe6
	loopchannel 3, Music_RocketBattle_branch_e9edf
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	note A_, 2
	note A#, 2
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_ea01d
Music_RocketBattle_branch_e9efe: ; e9efe
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel Music_RocketBattle_branch_ea02a
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
Music_RocketBattle_branch_e9f25: ; e9f25
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, Music_RocketBattle_branch_e9f25
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	callchannel Music_RocketBattle_branch_ea02a
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel Music_RocketBattle_branch_ea02a
	callchannel Music_RocketBattle_branch_ea02a
Music_RocketBattle_branch_e9f4e: ; e9f4e
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F_, 2
	loopchannel 7, Music_RocketBattle_branch_e9f4e
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
Music_RocketBattle_branch_e9f6a: ; e9f6a
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 4, Music_RocketBattle_branch_e9f6a
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
Music_RocketBattle_branch_e9f7c: ; e9f7c
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 13, Music_RocketBattle_branch_e9f7c
	octave 2
	note A_, 2
	octave 3
	note E_, 4
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
Music_RocketBattle_branch_e9f8c: ; e9f8c
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, Music_RocketBattle_branch_e9f8c
	octave 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note A#, 4
	note A_, 2
	note G_, 2
	note A#, 2
Music_RocketBattle_branch_e9f9e: ; e9f9e
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 7, Music_RocketBattle_branch_e9f9e
	note E_, 2
	note F_, 2
Music_RocketBattle_branch_e9fa8: ; e9fa8
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, Music_RocketBattle_branch_e9fa8
	octave 3
	note A#, 2
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	callchannel Music_RocketBattle_branch_ea033
	octave 3
	note E_, 2
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_ea033
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	callchannel Music_RocketBattle_branch_e9ff3
	callchannel Music_RocketBattle_branch_ea010
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_ea01d
	loopchannel 0, Music_RocketBattle_branch_e9efe
; e9fe6

Music_RocketBattle_branch_e9fe6: ; e9fe6
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	note A#, 2
	octave 3
	note E_, 2
	note G_, 2
	note F_, 2
	endchannel
; e9ff3

Music_RocketBattle_branch_e9ff3: ; e9ff3
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note D_, 2
	endchannel
; ea010

Music_RocketBattle_branch_ea010: ; ea010
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	endchannel
; ea01d

Music_RocketBattle_branch_ea01d: ; ea01d
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	endchannel
; ea02a

Music_RocketBattle_branch_ea02a: ; ea02a
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, Music_RocketBattle_branch_ea02a
	endchannel
; ea033

Music_RocketBattle_branch_ea033: ; ea033
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	endchannel
; ea040


