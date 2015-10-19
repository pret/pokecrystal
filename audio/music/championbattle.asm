Music_ChampionBattle: ; ea9c1
	dbw $80, Music_ChampionBattle_Ch1
	dbw $01, Music_ChampionBattle_Ch2
	dbw $02, Music_ChampionBattle_Ch3
; ea9ca

Music_ChampionBattle_Ch1: ; ea9ca
	tempo 98
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $12, $1, $5
	notetype $c, $b, $0, $2
	octave 2
	note A#, 8
	note A#, 8
	note A#, 8
	note A#, 4
	volenvelope $b, $0, $7
	note B_, 4
Music_ChampionBattle_branch_ea9e2: ; ea9e2
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_ea9e2
	callchannel Music_ChampionBattle_branch_eaaee
	octave 3
	note E_, 4
Music_ChampionBattle_branch_ea9f0: ; ea9f0
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 3, Music_ChampionBattle_branch_ea9f0
	callchannel Music_ChampionBattle_branch_eab06
Music_ChampionBattle_branch_ea9fa: ; ea9fa
	callchannel Music_ChampionBattle_branch_eaafc
	loopchannel 7, Music_ChampionBattle_branch_ea9fa
	callchannel Music_ChampionBattle_branch_eab06
	volenvelope $b, $0, $2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note D#, 4
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note E_, 4
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note F#, 4
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note G#, 4
	volenvelope $a, $0, $0
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note B_, 12
	volenvelope $b, $0, $2
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
Music_ChampionBattle_branch_eaa35: ; eaa35
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note F#, 4
Music_ChampionBattle_branch_eaa3d: ; eaa3d
	volenvelope $b, $0, $2
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note G#, 4
	loopchannel 2, Music_ChampionBattle_branch_eaa3d
	volenvelope $b, $0, $2
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eab0f
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note F#, 4
	volenvelope $b, $0, $2
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note G#, 4
	volenvelope $b, $0, $2
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	note B_, 4
	volenvelope $b, $0, $2
	note E_, 2
	note E_, 2
	volenvelope $b, $0, $7
	octave 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eab24
	note B_, 4
	note G#, 4
	callchannel Music_ChampionBattle_branch_eab24
	octave 4
	note D_, 4
	note D_, 4
	volenvelope $a, $0, $0
	octave 3
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note F#, 8
	octave 2
	note F#, 8
	volenvelope $6, $0, $0
	note B_, 16
	volenvelope $7, $0, $0
	note B_, 16
	volenvelope $8, $0, $0
	octave 3
	note C#, 16
	volenvelope $a, $0, $0
	note D#, 16
	volenvelope $b, $0, $4
	octave 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note D_, 4
	note C#, 4
	note F#, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note F#, 2
	note G#, 2
	note D#, 2
	note E_, 2
	note F#, 4
	note F#, 4
	note __, 16
	volenvelope $9, $0, $0
	octave 3
	note F#, 8
	volenvelope $b, $0, $4
	note E_, 4
	note E_, 4
	volenvelope $9, $0, $0
	note D#, 16
	note C#, 16
Music_ChampionBattle_branch_eaab1: ; eaab1
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note D#, 4
	loopchannel 4, Music_ChampionBattle_branch_eaab1
Music_ChampionBattle_branch_eaabe: ; eaabe
	volenvelope $b, $0, $2
	note C_, 2
	note C_, 2
	volenvelope $b, $0, $7
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_eaabe
	volenvelope $b, $0, $2
	note C_, 2
	note C_, 2
	volenvelope $b, $0, $7
	note F#, 4
	volenvelope $b, $0, $2
	note C_, 2
	note C_, 2
	volenvelope $b, $0, $7
	note G#, 4
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eab31
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $7
	octave 4
	note D_, 4
	loopchannel 0, Music_ChampionBattle_branch_eaa35
; eaaee

Music_ChampionBattle_branch_eaaee: ; eaaee
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	endchannel
; eaafc

Music_ChampionBattle_branch_eaafc: ; eaafc
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note D#, 4
	endchannel
; eab06

Music_ChampionBattle_branch_eab06: ; eab06
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	note B_, 4
	endchannel
; eab0f

Music_ChampionBattle_branch_eab0f: ; eab0f
	volenvelope $b, $0, $5
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note F#, 4
	note F_, 2
	note E_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note E_, 2
	note G#, 2
	note D#, 2
	note G_, 2
	volenvelope $b, $0, $2
	endchannel
; eab24

Music_ChampionBattle_branch_eab24: ; eab24
	volenvelope $b, $0, $2
	octave 3
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 2
	volenvelope $b, $0, $7
	endchannel
; eab31

Music_ChampionBattle_branch_eab31: ; eab31
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $7
	note A#, 4
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $7
	note B_, 4
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $7
	octave 4
	note C#, 4
	volenvelope $b, $0, $2
	endchannel
; eab4a

Music_ChampionBattle_Ch2: ; eab4a
	waveduty $3
	vibrato $8, $3, $6
	pitchoffset $0001
	notetype $c, $c, $0, $2
	octave 3
	note D#, 8
	note D#, 8
	note D#, 8
	note D#, 4
	volenvelope $c, $0, $7
	note D_, 4
	callchannel Music_ChampionBattle_branch_eac4f
	note A#, 4
	callchannel Music_ChampionBattle_branch_eac4f
	note B_, 4
	callchannel Music_ChampionBattle_branch_eac4f
	octave 4
	note C#, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note F_, 4
	callchannel Music_ChampionBattle_branch_eac5c
	note D_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note B_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	octave 4
	note C_, 4
	volenvelope $c, $0, $2
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note E_, 8
	volenvelope $3, $1, $4
	note E_, 8
Music_ChampionBattle_branch_eab9d: ; eab9d
	volenvelope $c, $0, $5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 4
	volenvelope $c, $0, $7
	note B_, 8
	octave 4
	note E_, 8
	volenvelope $c, $0, $2
	octave 3
	note G#, 2
	note G#, 2
	volenvelope $c, $0, $7
	note B_, 4
	volenvelope $c, $0, $2
	note G#, 2
	note G#, 2
	volenvelope $c, $0, $7
	octave 4
	note C#, 4
	volenvelope $c, $0, $5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 2
	note B_, 2
	volenvelope $c, $0, $7
	octave 4
	note E_, 8
	note G#, 8
	note E_, 8
	note B_, 8
	callchannel Music_ChampionBattle_branch_eac79
	note E_, 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eac79
	note F#, 4
	note F#, 4
	volenvelope $c, $0, $7
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note C#, 8
	octave 3
	note C#, 8
	volenvelope $b, $0, $0
	note D#, 16
	note D#, 16
	note F_, 16
	note F#, 16
	volenvelope $c, $0, $4
Music_ChampionBattle_branch_eabef: ; eabef
	octave 5
	note D#, 4
	note D_, 4
	note C#, 4
	note C_, 4
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 4
	note B_, 4
	note B_, 4
	loopchannel 2, Music_ChampionBattle_branch_eabef
	volenvelope $b, $0, $0
	octave 3
	note D#, 16
	note B_, 16
	note A#, 16
	note G#, 16
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note B_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note B_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	octave 4
	note C#, 4
	volenvelope $c, $0, $2
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	octave 4
	note D_, 4
	volenvelope $b, $0, $0
	note D#, 8
	note E_, 8
	note F#, 8
	note E_, 8
	note D#, 8
	note E_, 8
	note F#, 8
	note G#, 8
	loopchannel 0, Music_ChampionBattle_branch_eab9d
; eac4f

Music_ChampionBattle_branch_eac4f: ; eac4f
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	endchannel
; eac5c

Music_ChampionBattle_branch_eac5c: ; eac5c
	volenvelope $c, $0, $2
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note B_, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note A#, 4
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	endchannel
; eac79

Music_ChampionBattle_branch_eac79: ; eac79
	volenvelope $c, $0, $1
	note D#, 2
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 2
	volenvelope $c, $0, $5
	endchannel
; eac85

Music_ChampionBattle_Ch3: ; eac85
	notetype $c, $1, $0, $4
Music_ChampionBattle_branch_eac88: ; eac88
	octave 3
	note D#, 1
	note __, 7
	loopchannel 3, Music_ChampionBattle_branch_eac88
	note D#, 1
	note __, 3
	note E_, 4
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead61
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 4
	callchannel Music_ChampionBattle_branch_ead6f
	note A_, 4
	callchannel Music_ChampionBattle_branch_ead6f
	note D_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	note B_, 4
	note G_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
Music_ChampionBattle_branch_eacc6: ; eacc6
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eacc6
Music_ChampionBattle_branch_eaccc: ; eaccc
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_eaccc
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
Music_ChampionBattle_branch_eacda: ; eacda
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eacda
Music_ChampionBattle_branch_eace0: ; eace0
	note E_, 2
	note B_, 2
	loopchannel 8, Music_ChampionBattle_branch_eace0
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	callchannel Music_ChampionBattle_branch_ead83
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 8
	note D#, 8
	note B_, 8
	note D#, 8
Music_ChampionBattle_branch_ead05: ; ead05
	note D#, 2
	note F#, 2
	loopchannel 16, Music_ChampionBattle_branch_ead05
	callchannel Music_ChampionBattle_branch_ead8e
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	note F#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	callchannel Music_ChampionBattle_branch_ead8e
Music_ChampionBattle_branch_ead1d: ; ead1d
	octave 3
	note E_, 2
	note B_, 2
	loopchannel 4, Music_ChampionBattle_branch_ead1d
Music_ChampionBattle_branch_ead24: ; ead24
	note D#, 2
	note A#, 2
	loopchannel 5, Music_ChampionBattle_branch_ead24
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
Music_ChampionBattle_branch_ead32: ; ead32
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_ead32
	octave 4
	note C#, 2
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
Music_ChampionBattle_branch_ead40: ; ead40
	note D#, 2
	note G#, 2
	loopchannel 8, Music_ChampionBattle_branch_ead40
Music_ChampionBattle_branch_ead46: ; ead46
	note D#, 2
	note A#, 2
	loopchannel 7, Music_ChampionBattle_branch_ead46
	note B_, 2
	note A#, 2
Music_ChampionBattle_branch_ead4e: ; ead4e
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D_, 2
	note D#, 2
	loopchannel 7, Music_ChampionBattle_branch_ead4e
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	note G#, 2
	loopchannel 0, Music_ChampionBattle_branch_eacc6
; ead61

Music_ChampionBattle_branch_ead61: ; ead61
	note D#, 1
	note __, 1
	note D#, 1
	note __, 5
	loopchannel 3, Music_ChampionBattle_branch_ead61
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	endchannel
; ead6f

Music_ChampionBattle_branch_ead6f: ; ead6f
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	endchannel
; ead83

Music_ChampionBattle_branch_ead83: ; ead83
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel
; ead8e

Music_ChampionBattle_branch_ead8e: ; ead8e
	octave 3
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	endchannel
; ead99


