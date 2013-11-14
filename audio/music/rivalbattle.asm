Music_RivalBattle: ; e974f
	dbw $80, Music_RivalBattle_Ch1
	dbw $01, Music_RivalBattle_Ch2
	dbw $02, Music_RivalBattle_Ch3
; e9758


Music_RivalBattle_Ch1: ; e9758
	tempo 102
	volume $77
	dutycycle $3
	tone $0002
	vibrato $8, $15
	notetype $c, $b2
	octave 3
	note F#, 1
	note A#, 3
	intensity $b7
	note A#, 9
	intensity $b2
	note F#, 1
	octave 4
	note C#, 3
	intensity $b7
	note C#, 5
	note E_, 3

Music_RivalBattle_branch_e9777: ; e9777
	intensity $b2
	octave 2
	note A#, 5
	intensity $b7
	octave 3
	note C#, 5
	intensity $b2
	note D#, 3
	loopchannel 3, Music_RivalBattle_branch_e9777
	intensity $b2
	octave 2
	note A#, 1
	octave 3
	note C#, 3
	intensity $b7
	note C#, 9

Music_RivalBattle_branch_e978f: ; e978f
	intensity $b2
	octave 3
	note G#, 5
	intensity $b7
	note B_, 5
	intensity $b2
	octave 4
	note C#, 3
	loopchannel 3, Music_RivalBattle_branch_e978f
	intensity $b2
	octave 3
	note G#, 1
	note B_, 3
	intensity $4d
	note B_, 9

Music_RivalBattle_branch_e97a6: ; e97a6
	intensity $b7
	note A#, 5
	note F#, 5
	note D#, 3
	note F_, 3
	note F#, 3
	note G#, 1
	note A#, 5
	intensity $b2
	note F_, 0
	note D#, 0
	note C#, 0
	note D#, 0
	intensity $b7
	note F_, 3
	intensity $b2
	note G#, 0
	note F#, 0
	note F_, 0
	note F#, 0
	intensity $b7
	note G#, 3
	intensity $b6
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	intensity $b7
	octave 3
	note A#, 5
	note F#, 5
	note A#, 3
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	note A#, 1
	note G#, 5
	note F_, 5
	octave 4
	note C#, 5
	octave 3
	note G#, 3
	intensity $b5
	note C#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	intensity $b7
	note F#, 9
	intensity $b4
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	intensity $b7
	note F_, 3
	note D#, 3
	note C#, 1
	note D#, 5
	intensity $a0
	note F_, 7
	intensity $a7
	note F_, 7
	intensity $a0
	octave 2
	note A#, 7
	intensity $a7
	note A#, 7
	intensity $b7
	octave 3
	note F#, 9
	intensity $b5
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note G#, 1
	intensity $a0
	note A#, 15
	intensity $a7
	note A#, 15
	intensity $a0
	note B_, 7
	intensity $a7
	note B_, 3
	intensity $b7
	note G#, 3
	intensity $b5
	octave 4
	note E_, 1
	note D#, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note F#, 1
	note E_, 1
	note D#, 1
	note C#, 1

Music_RivalBattle_branch_e9837: ; e9837
	octave 3
	note A#, 1
	note E_, 1
	note A#, 1
	octave 4
	note D#, 1
	note E_, 1
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	note E_, 1
	note D#, 1
	octave 3
	note A#, 1
	note D#, 1
	note A#, 1
	octave 4
	note D#, 1
	loopchannel 2, Music_RivalBattle_branch_e9837
	intensity $94
	octave 3
	note D#, 7
	octave 2
	note A#, 7
	octave 3
	note G_, 7
	note F_, 7
	intensity $96
	octave 2
	note G#, 7
	note A#, 7
	note B_, 7
	octave 3
	note C#, 7
	intensity $b7
	octave 4
	note D#, 7
	octave 3
	note A#, 7
	octave 4
	note G_, 7
	note F_, 7
	octave 3
	note G#, 7
	note A#, 7
	note B_, 7
	octave 4
	note C#, 7
	intensity $a0
	note D#, 7
	intensity $a7
	note D#, 7
	intensity $a0
	octave 3
	note G_, 7
	intensity $a7
	note G_, 7
	intensity $b7
	note D#, 7
	note C#, 7
	note D#, 3
	note C#, 3
	octave 2
	note B_, 3
	octave 3
	note C#, 3
	intensity $c7
	octave 2
	note A#, 5
	octave 3
	note C#, 5
	note D#, 3
	note E_, 5
	note D#, 5
	note C#, 3
	note G#, 5
	note E_, 5
	note D#, 3
	note C#, 5
	note D#, 5
	note D_, 3
	octave 2
	note G#, 5
	note B_, 5
	octave 3
	note C#, 3
	note D_, 5
	note C#, 5
	octave 2
	note B_, 3
	octave 3
	note F#, 5
	note D_, 5
	note C#, 3
	octave 2
	note B_, 5
	octave 3
	note C#, 9
	loopchannel 0, Music_RivalBattle_branch_e97a6

Music_RivalBattle_Ch2: ; e98af
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
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
	intensity $c2
	octave 4
	note D#, 5
	intensity $c7
	octave 3
	note F#, 5
	intensity $c2
	note G#, 3

Music_RivalBattle_branch_e98ea: ; e98ea
	intensity $c2
	note D#, 5
	intensity $c7
	note F#, 5
	intensity $c2
	note G#, 3
	loopchannel 2, Music_RivalBattle_branch_e98ea
	intensity $c2
	note D#, 1
	note F#, 3
	intensity $c7
	note F#, 7
	intensity $a2
	note B_, 0
	octave 4
	note C_, 0

Music_RivalBattle_branch_e9903: ; e9903
	intensity $c2
	note C#, 5
	intensity $c7
	note E_, 5
	intensity $c2
	note F#, 3
	loopchannel 3, Music_RivalBattle_branch_e9903
	intensity $c2
	note C#, 1
	note E_, 3
	intensity $b0
	note E_, 3
	intensity $b7
	note E_, 5

Music_RivalBattle_branch_e991a: ; e991a
	callchannel Music_RivalBattle_branch_e99e0
	intensity $b0
	note G#, 7
	intensity $b7
	note G#, 7
	callchannel Music_RivalBattle_branch_e99e0
	intensity $4e
	note G#, 7
	intensity $b7
	note G#, 7
	intensity $b0
	octave 3
	note B_, 9
	intensity $b7
	note B_, 5
	intensity $b0
	octave 4
	note C#, 7
	octave 3
	note B_, 7
	intensity $b0
	note A#, 9
	intensity $b7
	note A#, 5
	intensity $2f
	note D#, 9
	intensity $b7
	note D#, 5
	intensity $b0
	note B_, 9
	intensity $b7
	note B_, 5
	intensity $c7
	octave 4
	note C#, 7
	octave 3
	note B_, 7
	intensity $b0
	octave 4
	note D#, 15
	intensity $b7
	note D#, 15
	intensity $b0
	note E_, 3
	intensity $b7
	note E_, 5
	intensity $c7
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note C#, 7
	octave 4
	note B_, 7
	intensity $b0
	note A#, 9
	intensity $b7
	note A#, 5
	intensity $b0
	note A_, 9
	intensity $b7
	note A_, 5
	intensity $b0
	note G#, 9
	intensity $b7
	note G#, 5
	intensity $b0
	note G_, 9
	intensity $b7
	note G_, 5
	intensity $a4
	octave 3
	note G_, 7
	note D#, 7
	note A#, 7
	note G#, 7
	intensity $a6
	octave 2
	note B_, 7
	octave 3
	note C#, 7
	note D#, 7
	note F_, 7
	intensity $c7
	octave 4
	note G_, 7
	note D#, 7
	note A#, 7
	note G#, 7
	octave 3
	note B_, 7
	octave 4
	note C#, 7
	note D#, 7
	note F_, 7
	intensity $b0
	note G_, 15
	note D#, 15
	octave 3
	note B_, 7
	note A#, 7
	note G#, 7
	intensity $c7
	note F_, 7

Music_RivalBattle_branch_e99a6: ; e99a6
	intensity $c2
	octave 3
	note A#, 5
	intensity $c7
	octave 4
	note C#, 5
	intensity $c2
	note D#, 3
	loopchannel 3, Music_RivalBattle_branch_e99a6
	intensity $c2
	octave 3
	note A#, 1
	octave 4
	note C#, 3
	intensity $b7
	note C#, 5
	intensity $9a
	note C#, 3

Music_RivalBattle_branch_e99c1: ; e99c1
	intensity $c2
	octave 3
	note G#, 5
	intensity $c7
	note B_, 5
	intensity $c2
	octave 4
	note C#, 3
	loopchannel 3, Music_RivalBattle_branch_e99c1
	intensity $c2
	octave 3
	note G#, 1
	note B_, 3
	intensity $c7
	note B_, 5
	intensity $6a
	octave 4
	note D_, 3
	loopchannel 0, Music_RivalBattle_branch_e991a
; e99e0

Music_RivalBattle_branch_e99e0: ; e99e0
	intensity $c7
	note D#, 9
	intensity $c4
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	note F#, 1
	intensity $c5
	note F_, 3
	note D#, 3
	intensity $c2
	note C#, 1
	intensity $c7
	note D#, 5
	intensity $b0
	note F_, 7
	intensity $b7
	note F_, 7
	endchannel

Music_RivalBattle_Ch3: ; e99fb
	notetype $c, $19
	octave 3
	note F#, 1
	note A#, 1
	note __, 1
	note A#, 9
	octave 3
	note F#, 1
	octave 4
	note C#, 1
	note __, 1
	note C#, 5
	octave 3
	note C#, 1
	note D_, 1

Music_RivalBattle_branch_e9a0c: ; e9a0c
	note D#, 1
	note C#, 1
	note D#, 1
	note F#, 3
	note E_, 1
	note D#, 1
	note C#, 1
	loopchannel 4, Music_RivalBattle_branch_e9a0c

Music_RivalBattle_branch_e9a17: ; e9a17
	octave 3
	note C#, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note E_, 3
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	loopchannel 3, Music_RivalBattle_branch_e9a17
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	octave 2
	note B_, 3
	octave 3
	note C_, 1
	note C#, 1
	note D_, 1

Music_RivalBattle_branch_e9a30: ; e9a30
	callchannel Music_RivalBattle_branch_e9b47
	octave 2
	note A#, 1
	octave 4
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note B_, 1
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	callchannel Music_RivalBattle_branch_e9b50
	note C#, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 3
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	callchannel Music_RivalBattle_branch_e9b47
	octave 2
	note A#, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	octave 3
	note G#, 1
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	callchannel Music_RivalBattle_branch_e9b50

Music_RivalBattle_branch_e9a66: ; e9a66
	note C#, 1
	note G#, 1
	loopchannel 4, Music_RivalBattle_branch_e9a66
	callchannel Music_RivalBattle_branch_e9b5c
	note G#, 1
	note F#, 1

Music_RivalBattle_branch_e9a71: ; e9a71
	octave 2
	note A#, 1
	octave 3
	note F_, 1
	loopchannel 4, Music_RivalBattle_branch_e9a71
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	note F_, 1
	note D#, 1
	callchannel Music_RivalBattle_branch_e9b5c
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	callchannel Music_RivalBattle_branch_e9b65
	octave 3
	note D#, 1
	octave 4
	note D#, 1
	callchannel Music_RivalBattle_branch_e9b65
	octave 3
	note D#, 1
	note A#, 1
	note E_, 1
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	note B_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note G#, 1

Music_RivalBattle_branch_e9ab3: ; e9ab3
	note D#, 1
	note A#, 1
	loopchannel 4, Music_RivalBattle_branch_e9ab3

Music_RivalBattle_branch_e9ab9: ; e9ab9
	note D#, 1
	note A_, 1
	loopchannel 4, Music_RivalBattle_branch_e9ab9

Music_RivalBattle_branch_e9abf: ; e9abf
	note D#, 1
	note G#, 1
	loopchannel 4, Music_RivalBattle_branch_e9abf

Music_RivalBattle_branch_e9ac5: ; e9ac5
	note D#, 1
	note G_, 1
	loopchannel 12, Music_RivalBattle_branch_e9ac5

Music_RivalBattle_branch_e9acb: ; e9acb
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	loopchannel 4, Music_RivalBattle_branch_e9acb

Music_RivalBattle_branch_e9ad3: ; e9ad3
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	loopchannel 4, Music_RivalBattle_branch_e9ad3
	note D#, 1
	note G_, 1
	note A#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	note D#, 1
	note A#, 1
	octave 2
	note B_, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 2
	note B_, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 2
	note B_, 1
	octave 3
	note B_, 1
	octave 2
	note B_, 1
	octave 3
	note G#, 1
	note B_, 1
	octave 2
	note B_, 1
	octave 4
	note D#, 1
	note C#, 1
	octave 3
	note B_, 1
	note G#, 1
	note G_, 7
	note D#, 7
	note A#, 7
	note G_, 7
	octave 2
	note B_, 7
	octave 3
	note C#, 7
	note D#, 7
	note F_, 7

Music_RivalBattle_branch_e9b10: ; e9b10
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	loopchannel 7, Music_RivalBattle_branch_e9b10
	note E_, 1
	note D#, 1

Music_RivalBattle_branch_e9b1a: ; e9b1a
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	loopchannel 6, Music_RivalBattle_branch_e9b1a
	octave 2
	note A#, 1
	octave 3
	note F#, 1
	note F_, 1
	note E_, 1

Music_RivalBattle_branch_e9b28: ; e9b28
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	loopchannel 7, Music_RivalBattle_branch_e9b28
	note D_, 1
	note C#, 1

Music_RivalBattle_branch_e9b32: ; e9b32
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	loopchannel 4, Music_RivalBattle_branch_e9b32
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note F_, 3
	note E_, 1
	note D#, 1
	note D_, 1
	loopchannel 0, Music_RivalBattle_branch_e9a30
; e9b47

Music_RivalBattle_branch_e9b47: ; e9b47
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	loopchannel 4, Music_RivalBattle_branch_e9b47
	endchannel
; e9b50

Music_RivalBattle_branch_e9b50: ; e9b50
	note C#, 1
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 3
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	note G#, 1
	endchannel
; e9b5c

Music_RivalBattle_branch_e9b5c: ; e9b5c
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	loopchannel 7, Music_RivalBattle_branch_e9b5c
	endchannel
; e9b65

Music_RivalBattle_branch_e9b65: ; e9b65
	octave 3
	note D#, 1
	note A#, 1
	octave 4
	note D#, 1
	loopchannel 2, Music_RivalBattle_branch_e9b65
	endchannel
; e9b6f
