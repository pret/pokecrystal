Music_JohtoWildBattle: ; f5dc5
	dbw $80, Music_JohtoWildBattle_Ch1
	dbw $01, Music_JohtoWildBattle_Ch2
	dbw $02, Music_JohtoWildBattle_Ch3
; f5dce


Music_JohtoWildBattle_Ch1: ; f5dce
	tempo 104
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15

Music_JohtoWildBattleNight_branch_f5ddb: ; f5ddb
	notetype $c, $b2
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
	octave 3
	note C_, 0
	octave 2
	note B_, 0
	note A#, 0
	note A_, 0
	note A#, 0
	note B_, 0
	octave 3
	note C_, 0
	note C#, 0
	intensity $b2
	note G_, 5
	octave 2
	note A#, 5
	octave 3
	note D_, 3
	note C_, 3
	note C#, 3
	note D_, 7
	note D#, 5
	octave 2
	note A#, 5
	octave 3
	note D#, 3
	note C_, 3
	note D_, 3
	intensity $b5
	note D#, 7
	intensity $b2
	octave 4
	note D_, 5
	octave 3
	note A#, 5
	octave 4
	note D_, 3
	note C_, 3
	note C#, 3
	note D_, 7
	note D#, 5
	octave 3
	note A#, 5
	octave 4
	note D#, 3
	note C_, 3
	note D_, 3
	intensity $6f
	note D#, 7

Music_JohtoWildBattle_branch_f5e2d: ; f5e2d
	intensity $b6
	octave 3
	note D_, 5
	octave 2
	note B_, 5
	note B_, 3
	octave 3
	note F_, 5
	note E_, 5
	note C_, 3
	note G#, 7
	note A#, 0
	note A_, 0
	note G_, 0
	note F#, 0
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	octave 4
	note C_, 7
	octave 3
	note B_, 0
	note A#, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	note B_, 0
	note D_, 5
	octave 2
	note B_, 5
	note B_, 3
	octave 3
	note F_, 5
	note E_, 5
	note D_, 3
	note E_, 7
	note D_, 7
	note C_, 7
	note F_, 7
	note D#, 5
	note C_, 5
	note C_, 3
	note F#, 5
	note F_, 5
	note C#, 3
	note A_, 7
	note B_, 0
	note A#, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	note B_, 0
	octave 4
	note C#, 7
	note C_, 0
	octave 3
	note B_, 0
	note A_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	note B_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 5
	note C_, 5
	note C_, 3
	note F#, 5
	note F_, 5
	note C#, 3
	note F_, 7
	note D#, 7
	note C#, 7
	note F#, 7
	intensity $b7
	note E_, 5
	note D_, 5
	note E_, 3
	note F_, 5
	note E_, 5
	note C_, 3
	note F_, 7
	note C_, 7
	note E_, 5
	note D_, 5
	note F_, 3
	note G_, 15
	octave 4
	note D_, 7
	note G_, 7
	note G_, 15
	note D_, 15
	octave 3
	note C_, 3
	note D_, 3
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 15
	note D_, 3
	note E_, 3
	note D_, 3
	note F#, 3
	note G_, 15
	loopchannel 0, Music_JohtoWildBattle_branch_f5e2d

Music_JohtoWildBattle_Ch2: ; f5ea2
	dutycycle $3
	vibrato $8, $36
	tone $0001
	callchannel Music_JohtoWildBattle_branch_f5f5d
	notetype $c, $c2
	octave 4
	note G_, 5

Music_JohtoWildBattleNight_branch_f5eb2: ; f5eb2
	octave 3
	note D_, 5
	note G_, 3
	note F_, 3
	note F#, 3
	note G_, 7
	note G#, 5
	note D_, 5
	note G#, 3
	note F_, 3
	note G_, 3
	intensity $c7
	note G#, 7
	intensity $c2
	octave 4
	note G_, 5
	note D_, 5
	note G_, 3
	note F_, 3
	note F#, 3
	note G_, 7
	note G#, 5
	note D_, 5
	note G#, 3
	note F_, 3
	note G_, 3
	intensity $6f
	note G#, 7

Music_JohtoWildBattle_branch_f5ed1: ; f5ed1
	intensity $c4
	octave 3
	note G_, 5
	note D_, 5
	note D_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	intensity $b0
	note D#, 15
	intensity $b7
	note D#, 15
	intensity $c4
	octave 3
	note G_, 5
	note D_, 5
	note D_, 1
	note G_, 1
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	note A_, 3
	note B_, 3
	intensity $b0
	note A_, 15
	intensity $b6
	note A_, 15
	intensity $c4
	note G#, 5
	note D#, 5
	note D#, 1
	note G#, 1
	octave 4
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A#, 1
	octave 4
	note D_, 1
	intensity $b0
	note E_, 15
	intensity $b7
	note E_, 15
	intensity $c4
	octave 3
	note G#, 5
	note D#, 5
	note D#, 1
	note G#, 1
	octave 4
	note C#, 3
	note C_, 3
	octave 3
	note A#, 3
	note G#, 3
	intensity $b0
	note A#, 15
	intensity $b5
	note A#, 15
	intensity $c6
	octave 4
	note B_, 11
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	note C_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note G_, 1
	note A_, 11
	octave 3
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	intensity $c7
	note D_, 15
	note G_, 7
	octave 5
	note C_, 7
	octave 4
	note B_, 15
	note G_, 15
	octave 3
	note E_, 3
	note F#, 3
	note E_, 3
	note D_, 3
	note E_, 15
	note G_, 3
	note A_, 3
	note G_, 3
	note A#, 3
	note B_, 15
	loopchannel 0, Music_JohtoWildBattle_branch_f5ed1
; f5f5d

Music_JohtoWildBattle_branch_f5f5d: ; f5f5d

Music_JohtoWildBattleNight_branch_f5f5d: ; f5f5d
	notetype $c, $c2
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note F_, 0
	note F#, 0
	note G_, 0
	octave 5
	note G_, 0
	endchannel

Music_JohtoWildBattle_Ch3: ; f5f91
	notetype $c, $14

Music_JohtoWildBattleNight_branch_f5f94: ; f5f94
	octave 4
	note G_, 1
	octave 5
	note D_, 1
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	octave 4
	note F#, 1
	octave 5
	note C_, 1
	octave 4
	note F#, 1
	note B_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoWildBattle_branch_f6055
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note D#, 1
	note G_, 1
	note F_, 1

Music_JohtoWildBattle_branch_f5fc6: ; f5fc6
	note D_, 1
	note G_, 1
	loopchannel 6, Music_JohtoWildBattle_branch_f5fc6
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	callchannel Music_JohtoWildBattle_branch_f6055
	note F_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1

Music_JohtoWildBattle_branch_f5fdb: ; f5fdb
	note D_, 1
	note G_, 1
	loopchannel 7, Music_JohtoWildBattle_branch_f5fdb
	note F#, 3
	callchannel Music_JohtoWildBattle_branch_f6055
	callchannel Music_JohtoWildBattle_branch_f6055

Music_JohtoWildBattle_branch_f5fe8: ; f5fe8
	note D_, 1
	note G_, 1
	loopchannel 7, Music_JohtoWildBattle_branch_f5fe8
	note D_, 1
	note A_, 1

Music_JohtoWildBattle_branch_f5ff0: ; f5ff0
	note C_, 1
	note F_, 1
	loopchannel 5, Music_JohtoWildBattle_branch_f5ff0
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	callchannel Music_JohtoWildBattle_branch_f6055
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note G_, 3

Music_JohtoWildBattle_branch_f6006: ; f6006
	note E_, 1
	note A_, 1
	loopchannel 8, Music_JohtoWildBattle_branch_f6006
	callchannel Music_JohtoWildBattle_branch_f6055
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note A#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 1

Music_JohtoWildBattle_branch_f6027: ; f6027
	note D_, 1
	note G_, 1
	loopchannel 8, Music_JohtoWildBattle_branch_f6027

Music_JohtoWildBattle_branch_f602d: ; f602d
	note C_, 1
	note F_, 1
	loopchannel 7, Music_JohtoWildBattle_branch_f602d
	note E_, 1
	note C_, 1
	note D_, 3
	note G_, 3
	note D_, 3
	note G_, 3

Music_JohtoWildBattle_branch_f6039: ; f6039
	note D_, 1
	note G_, 1
	loopchannel 12, Music_JohtoWildBattle_branch_f6039

Music_JohtoWildBattle_branch_f603f: ; f603f
	note C_, 1
	note E_, 1
	loopchannel 7, Music_JohtoWildBattle_branch_f603f
	note F_, 1
	note F#, 1

Music_JohtoWildBattle_branch_f6047: ; f6047
	note D_, 1
	note G_, 1
	loopchannel 6, Music_JohtoWildBattle_branch_f6047
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	loopchannel 0, Music_JohtoWildBattle_branch_f5fdb
; f6055

Music_JohtoWildBattle_branch_f6055: ; f6055
	note D#, 1
	note G#, 1
	loopchannel 4, Music_JohtoWildBattle_branch_f6055
	endchannel
; f605c
