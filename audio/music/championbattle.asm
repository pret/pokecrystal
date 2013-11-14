Music_ChampionBattle: ; ea9c1
	dbw $80, Music_ChampionBattle_Ch1
	dbw $01, Music_ChampionBattle_Ch2
	dbw $02, Music_ChampionBattle_Ch3
; ea9ca


Music_ChampionBattle_Ch1: ; ea9ca
	tempo 98
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 2
	note A#, 7
	note A#, 7
	note A#, 7
	note A#, 3
	intensity $b7
	note B_, 3

Music_ChampionBattle_branch_ea9e2: ; ea9e2
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note D#, 3
	loopchannel 2, Music_ChampionBattle_branch_ea9e2
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note E_, 3

Music_ChampionBattle_branch_ea9f0: ; ea9f0
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 3, Music_ChampionBattle_branch_ea9f0
	callchannel Music_ChampionBattle_branch_eab06

Music_ChampionBattle_branch_ea9fa: ; ea9fa
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 7, Music_ChampionBattle_branch_ea9fa
	callchannel Music_ChampionBattle_branch_eab06
	intensity $b2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note D#, 3
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note E_, 3
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note F#, 3
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note G#, 3
	intensity $a0
	note A#, 7
	octave 2
	note A#, 7
	octave 3
	note B_, 11
	intensity $b2
	note A#, 0
	note B_, 0
	octave 4
	note C_, 0
	note C#, 0

Music_ChampionBattle_branch_eaa35: ; eaa35
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 1
	note E_, 1
	intensity $b7
	note F#, 3

Music_ChampionBattle_branch_eaa3d: ; eaa3d
	intensity $b2
	note E_, 1
	note E_, 1
	intensity $b7
	note G#, 3
	loopchannel 2, Music_ChampionBattle_branch_eaa3d
	intensity $b2
	note E_, 1
	note E_, 1
	intensity $b7
	note B_, 3
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 1
	note E_, 1
	intensity $b7
	note F#, 3
	intensity $b2
	note E_, 1
	note E_, 1
	intensity $b7
	note G#, 3
	intensity $b2
	note E_, 1
	note E_, 1
	intensity $b7
	note B_, 3
	intensity $b2
	note E_, 1
	note E_, 1
	intensity $b7
	octave 4
	note E_, 3
	callchannel Music_ChampionBattle_branch_eab24
	note B_, 3
	note G#, 3
	callchannel Music_ChampionBattle_branch_eab24
	octave 4
	note D_, 3
	note D_, 3
	intensity $a0
	octave 3
	note A#, 7
	octave 2
	note A#, 7
	octave 3
	note F#, 7
	octave 2
	note F#, 7
	intensity $60
	note B_, 15
	intensity $70
	note B_, 15
	intensity $80
	octave 3
	note C#, 15
	intensity $a0
	note D#, 15
	intensity $b4
	octave 4
	note F#, 3
	note F_, 3
	note E_, 3
	note D#, 3
	note D_, 3
	note C#, 3
	note F#, 3
	note F#, 3
	note F#, 3
	note F_, 3
	note E_, 3
	note D#, 3
	note F#, 1
	note G#, 1
	note D#, 1
	note E_, 1
	note F#, 3
	note F#, 3
	note __, 15
	intensity $90
	octave 3
	note F#, 7
	intensity $b4
	note E_, 3
	note E_, 3
	intensity $90
	note D#, 15
	note C#, 15

Music_ChampionBattle_branch_eaab1: ; eaab1
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note D#, 3
	loopchannel 4, Music_ChampionBattle_branch_eaab1

Music_ChampionBattle_branch_eaabe: ; eaabe
	intensity $b2
	note C_, 1
	note C_, 1
	intensity $b7
	note D#, 3
	loopchannel 2, Music_ChampionBattle_branch_eaabe
	intensity $b2
	note C_, 1
	note C_, 1
	intensity $b7
	note F#, 3
	intensity $b2
	note C_, 1
	note C_, 1
	intensity $b7
	note G#, 3
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 1
	note D#, 1
	intensity $b7
	note B_, 3
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 1
	note D#, 1
	intensity $b7
	octave 4
	note D_, 3
	loopchannel 0, Music_ChampionBattle_branch_eaa35
; eaaee

Music_ChampionBattle_branch_eaaee: ; eaaee
	intensity $b2
	octave 2
	note A#, 1
	note A#, 5
	note A#, 1
	note A#, 5
	note A#, 1
	note A#, 5
	note A#, 1
	note A#, 1
	intensity $b7
	endchannel
; eaafc

Music_ChampionBattle_branch_eaafc: ; eaafc
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	octave 3
	note D#, 3
	endchannel
; eab06

Music_ChampionBattle_branch_eab06: ; eab06
	intensity $b2
	octave 2
	note A#, 1
	note A#, 1
	intensity $b7
	note B_, 3
	endchannel
; eab0f

Music_ChampionBattle_branch_eab0f: ; eab0f
	intensity $b5
	octave 3
	note D#, 1
	note A#, 1
	note D#, 1
	note F#, 3
	note F_, 1
	note E_, 1
	note B_, 1
	note F#, 1
	note A#, 1
	note F_, 1
	note A_, 1
	note E_, 1
	note G#, 1
	note D#, 1
	note G_, 1
	intensity $b2
	endchannel
; eab24

Music_ChampionBattle_branch_eab24: ; eab24
	intensity $b2
	octave 3
	note A#, 1
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 1
	intensity $b7
	endchannel
; eab31

Music_ChampionBattle_branch_eab31: ; eab31
	intensity $b2
	note D#, 1
	note D#, 1
	intensity $b7
	note A#, 3
	intensity $b2
	note D#, 1
	note D#, 1
	intensity $b7
	note B_, 3
	intensity $b2
	note D#, 1
	note D#, 1
	intensity $b7
	octave 4
	note C#, 3
	intensity $b2
	endchannel

Music_ChampionBattle_Ch2: ; eab4a
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 3
	note D#, 7
	note D#, 7
	note D#, 7
	note D#, 3
	intensity $c7
	note D_, 3
	callchannel Music_ChampionBattle_branch_eac4f
	note A#, 3
	callchannel Music_ChampionBattle_branch_eac4f
	note B_, 3
	callchannel Music_ChampionBattle_branch_eac4f
	octave 4
	note C#, 3
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 3
	callchannel Music_ChampionBattle_branch_eac5c
	note F_, 3
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note B_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	octave 4
	note C_, 3
	intensity $c2
	octave 3
	note D#, 1
	note D#, 1
	intensity $c7
	octave 4
	note C#, 3
	note D#, 7
	octave 3
	note D#, 7
	octave 4
	note E_, 7
	intensity $3c
	note E_, 7

Music_ChampionBattle_branch_eab9d: ; eab9d
	intensity $c5
	note D#, 5
	octave 3
	note A#, 5
	octave 4
	note D#, 1
	note D_, 1
	note C#, 3
	note C_, 3
	octave 3
	note B_, 3
	note A#, 3
	intensity $c7
	note B_, 7
	octave 4
	note E_, 7
	intensity $c2
	octave 3
	note G#, 1
	note G#, 1
	intensity $c7
	note B_, 3
	intensity $c2
	note G#, 1
	note G#, 1
	intensity $c7
	octave 4
	note C#, 3
	intensity $c5
	note D#, 5
	octave 3
	note A#, 5
	octave 4
	note D#, 1
	note D_, 1
	note C#, 3
	note C_, 3
	octave 3
	note B_, 3
	note A#, 1
	note B_, 1
	intensity $c7
	octave 4
	note E_, 7
	note G#, 7
	note E_, 7
	note B_, 7
	callchannel Music_ChampionBattle_branch_eac79
	note E_, 3
	note E_, 3
	callchannel Music_ChampionBattle_branch_eac79
	note F#, 3
	note F#, 3
	intensity $c7
	note D#, 7
	octave 3
	note D#, 7
	octave 4
	note C#, 7
	octave 3
	note C#, 7
	intensity $b0
	note D#, 15
	note D#, 15
	note F_, 15
	note F#, 15
	intensity $c4

Music_ChampionBattle_branch_eabef: ; eabef
	octave 5
	note D#, 3
	note D_, 3
	note C#, 3
	note C_, 3
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 3
	note B_, 3
	loopchannel 2, Music_ChampionBattle_branch_eabef
	intensity $b0
	octave 3
	note D#, 15
	note B_, 15
	note A#, 15
	note G#, 15
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note B_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note B_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	octave 4
	note C#, 3
	intensity $c2
	octave 3
	note D#, 1
	note D#, 1
	intensity $c7
	octave 4
	note D_, 3
	intensity $b0
	note D#, 7
	note E_, 7
	note F#, 7
	note E_, 7
	note D#, 7
	note E_, 7
	note F#, 7
	note G#, 7
	loopchannel 0, Music_ChampionBattle_branch_eab9d
; eac4f

Music_ChampionBattle_branch_eac4f: ; eac4f
	intensity $c2
	note D#, 1
	note D#, 5
	note D#, 1
	note D#, 5
	note D#, 1
	note D#, 5
	note D#, 1
	note D#, 1
	intensity $c7
	endchannel
; eac5c

Music_ChampionBattle_branch_eac5c: ; eac5c
	intensity $c2
	octave 3
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note B_, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	note A#, 3
	intensity $c2
	note D#, 1
	note D#, 1
	intensity $c7
	endchannel
; eac79

Music_ChampionBattle_branch_eac79: ; eac79
	intensity $c1
	note D#, 1
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note D#, 1
	intensity $c5
	endchannel

Music_ChampionBattle_Ch3: ; eac85
	notetype $c, $14

Music_ChampionBattle_branch_eac88: ; eac88
	octave 3
	note D#, 0
	note __, 6
	loopchannel 3, Music_ChampionBattle_branch_eac88
	note D#, 0
	note __, 2
	note E_, 3
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 3
	callchannel Music_ChampionBattle_branch_ead6f
	note A_, 3
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note B_, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 4
	note C#, 3
	note D#, 7
	octave 3
	note D#, 7
	note B_, 3
	note G_, 1
	note B_, 1
	note F#, 1
	note A#, 1
	note F_, 1
	note A_, 1

Music_ChampionBattle_branch_eacc6: ; eacc6
	note D#, 1
	note A#, 1
	loopchannel 8, Music_ChampionBattle_branch_eacc6

Music_ChampionBattle_branch_eaccc: ; eaccc
	note E_, 1
	note B_, 1
	loopchannel 5, Music_ChampionBattle_branch_eaccc
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note B_, 1
	note G_, 1
	note A_, 1

Music_ChampionBattle_branch_eacda: ; eacda
	note D#, 1
	note A#, 1
	loopchannel 8, Music_ChampionBattle_branch_eacda

Music_ChampionBattle_branch_eace0: ; eace0
	note E_, 1
	note B_, 1
	loopchannel 8, Music_ChampionBattle_branch_eace0
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	octave 4
	note D_, 1
	note C#, 1
	note C_, 1
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 1
	octave 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 7
	note D#, 7
	note B_, 7
	note D#, 7

Music_ChampionBattle_branch_ead05: ; ead05
	note D#, 1
	note F#, 1
	loopchannel 16, Music_ChampionBattle_branch_ead05
	callchannel Music_ChampionBattle_branch_ead8e
	octave 3
	note E_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 1
	note F#, 1
	octave 3
	note B_, 1
	octave 4
	note D#, 1
	note E_, 1
	callchannel Music_ChampionBattle_branch_ead8e

Music_ChampionBattle_branch_ead1d: ; ead1d
	octave 3
	note E_, 1
	note B_, 1
	loopchannel 4, Music_ChampionBattle_branch_ead1d

Music_ChampionBattle_branch_ead24: ; ead24
	note D#, 1
	note A#, 1
	loopchannel 5, Music_ChampionBattle_branch_ead24
	note B_, 1
	octave 4
	note D#, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1

Music_ChampionBattle_branch_ead32: ; ead32
	note E_, 1
	note B_, 1
	loopchannel 5, Music_ChampionBattle_branch_ead32
	octave 4
	note C#, 1
	note E_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1

Music_ChampionBattle_branch_ead40: ; ead40
	note D#, 1
	note G#, 1
	loopchannel 8, Music_ChampionBattle_branch_ead40

Music_ChampionBattle_branch_ead46: ; ead46
	note D#, 1
	note A#, 1
	loopchannel 7, Music_ChampionBattle_branch_ead46
	note B_, 1
	note A#, 1

Music_ChampionBattle_branch_ead4e: ; ead4e
	octave 3
	note D#, 1
	note A#, 1
	octave 4
	note D_, 1
	note D#, 1
	loopchannel 7, Music_ChampionBattle_branch_ead4e
	note C#, 1
	octave 3
	note B_, 1
	note A#, 1
	note G#, 1
	loopchannel 0, Music_ChampionBattle_branch_eacc6
; ead61

Music_ChampionBattle_branch_ead61: ; ead61
	note D#, 0
	note __, 0
	note D#, 0
	note __, 4
	loopchannel 3, Music_ChampionBattle_branch_ead61
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note B_, 3
	endchannel
; ead6f

Music_ChampionBattle_branch_ead6f: ; ead6f
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note B_, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note A#, 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	endchannel
; ead83

Music_ChampionBattle_branch_ead83: ; ead83
	octave 3
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note D#, 1
	octave 4
	note D_, 1
	note C#, 1
	note C_, 1
	endchannel
; ead8e

Music_ChampionBattle_branch_ead8e: ; ead8e
	octave 3
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	note E_, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 1
	endchannel
; ead99
