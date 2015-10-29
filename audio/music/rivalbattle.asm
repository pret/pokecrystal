Music_RivalBattle: ; e974f
	dbw $80, Music_RivalBattle_Ch1
	dbw $01, Music_RivalBattle_Ch2
	dbw $02, Music_RivalBattle_Ch3
; e9758

Music_RivalBattle_Ch1: ; e9758
	tempo 102
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $8, $1, $5
	notetype $c, $b, $0, $2
	octave 3
	note F#, 2
	note A#, 4
	volenvelope $b, $0, $7
	note A#, 10
	volenvelope $b, $0, $2
	note F#, 2
	octave 4
	note C#, 4
	volenvelope $b, $0, $7
	note C#, 6
	note E_, 4
Music_RivalBattle_branch_e9777: ; e9777
	volenvelope $b, $0, $2
	octave 2
	note A#, 6
	volenvelope $b, $0, $7
	octave 3
	note C#, 6
	volenvelope $b, $0, $2
	note D#, 4
	loopchannel 3, Music_RivalBattle_branch_e9777
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	octave 3
	note C#, 4
	volenvelope $b, $0, $7
	note C#, 10
Music_RivalBattle_branch_e978f: ; e978f
	volenvelope $b, $0, $2
	octave 3
	note G#, 6
	volenvelope $b, $0, $7
	note B_, 6
	volenvelope $b, $0, $2
	octave 4
	note C#, 4
	loopchannel 3, Music_RivalBattle_branch_e978f
	volenvelope $b, $0, $2
	octave 3
	note G#, 2
	note B_, 4
	volenvelope $4, $1, $5
	note B_, 10
Music_RivalBattle_branch_e97a6: ; e97a6
	volenvelope $b, $0, $7
	note A#, 6
	note F#, 6
	note D#, 4
	note F_, 4
	note F#, 4
	note G#, 2
	note A#, 6
	volenvelope $b, $0, $2
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	volenvelope $b, $0, $7
	note F_, 4
	volenvelope $b, $0, $2
	note G#, 1
	note F#, 1
	note F_, 1
	note F#, 1
	volenvelope $b, $0, $7
	note G#, 4
	volenvelope $b, $0, $6
	note G#, 2
	note A#, 2
	note B_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 2
	volenvelope $b, $0, $7
	octave 3
	note A#, 6
	note F#, 6
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note A#, 2
	note G#, 6
	note F_, 6
	octave 4
	note C#, 6
	octave 3
	note G#, 4
	volenvelope $b, $0, $5
	note C#, 2
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	note C#, 2
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	volenvelope $b, $0, $7
	note F#, 10
	volenvelope $b, $0, $4
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	volenvelope $b, $0, $7
	note F_, 4
	note D#, 4
	note C#, 2
	note D#, 6
	volenvelope $a, $0, $0
	note F_, 8
	volenvelope $a, $0, $7
	note F_, 8
	volenvelope $a, $0, $0
	octave 2
	note A#, 8
	volenvelope $a, $0, $7
	note A#, 8
	volenvelope $b, $0, $7
	octave 3
	note F#, 10
	volenvelope $b, $0, $5
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note G#, 2
	volenvelope $a, $0, $0
	note A#, 16
	volenvelope $a, $0, $7
	note A#, 16
	volenvelope $a, $0, $0
	note B_, 8
	volenvelope $a, $0, $7
	note B_, 4
	volenvelope $b, $0, $7
	note G#, 4
	volenvelope $b, $0, $5
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
Music_RivalBattle_branch_e9837: ; e9837
	octave 3
	note A#, 2
	note E_, 2
	note A#, 2
	octave 4
	note D#, 2
	note E_, 2
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note E_, 2
	note D#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	loopchannel 2, Music_RivalBattle_branch_e9837
	volenvelope $9, $0, $4
	octave 3
	note D#, 8
	octave 2
	note A#, 8
	octave 3
	note G_, 8
	note F_, 8
	volenvelope $9, $0, $6
	octave 2
	note G#, 8
	note A#, 8
	note B_, 8
	octave 3
	note C#, 8
	volenvelope $b, $0, $7
	octave 4
	note D#, 8
	octave 3
	note A#, 8
	octave 4
	note G_, 8
	note F_, 8
	octave 3
	note G#, 8
	note A#, 8
	note B_, 8
	octave 4
	note C#, 8
	volenvelope $a, $0, $0
	note D#, 8
	volenvelope $a, $0, $7
	note D#, 8
	volenvelope $a, $0, $0
	octave 3
	note G_, 8
	volenvelope $a, $0, $7
	note G_, 8
	volenvelope $b, $0, $7
	note D#, 8
	note C#, 8
	note D#, 4
	note C#, 4
	octave 2
	note B_, 4
	octave 3
	note C#, 4
	volenvelope $c, $0, $7
	octave 2
	note A#, 6
	octave 3
	note C#, 6
	note D#, 4
	note E_, 6
	note D#, 6
	note C#, 4
	note G#, 6
	note E_, 6
	note D#, 4
	note C#, 6
	note D#, 6
	note D_, 4
	octave 2
	note G#, 6
	note B_, 6
	octave 3
	note C#, 4
	note D_, 6
	note C#, 6
	octave 2
	note B_, 4
	octave 3
	note F#, 6
	note D_, 6
	note C#, 4
	octave 2
	note B_, 6
	octave 3
	note C#, 10
	loopchannel 0, Music_RivalBattle_branch_e97a6
; e98af

Music_RivalBattle_Ch2: ; e98af
	waveduty $3
	vibrato $8, $3, $6
	pitchoffset $0001
	notetype $c, $c, $0, $2
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
	volenvelope $c, $0, $2
	octave 4
	note D#, 6
	volenvelope $c, $0, $7
	octave 3
	note F#, 6
	volenvelope $c, $0, $2
	note G#, 4
Music_RivalBattle_branch_e98ea: ; e98ea
	volenvelope $c, $0, $2
	note D#, 6
	volenvelope $c, $0, $7
	note F#, 6
	volenvelope $c, $0, $2
	note G#, 4
	loopchannel 2, Music_RivalBattle_branch_e98ea
	volenvelope $c, $0, $2
	note D#, 2
	note F#, 4
	volenvelope $c, $0, $7
	note F#, 8
	volenvelope $a, $0, $2
	note B_, 1
	octave 4
	note C_, 1
Music_RivalBattle_branch_e9903: ; e9903
	volenvelope $c, $0, $2
	note C#, 6
	volenvelope $c, $0, $7
	note E_, 6
	volenvelope $c, $0, $2
	note F#, 4
	loopchannel 3, Music_RivalBattle_branch_e9903
	volenvelope $c, $0, $2
	note C#, 2
	note E_, 4
	volenvelope $b, $0, $0
	note E_, 4
	volenvelope $b, $0, $7
	note E_, 6
Music_RivalBattle_branch_e991a: ; e991a
	callchannel Music_RivalBattle_branch_e99e0
	volenvelope $b, $0, $0
	note G#, 8
	volenvelope $b, $0, $7
	note G#, 8
	callchannel Music_RivalBattle_branch_e99e0
	volenvelope $4, $1, $6
	note G#, 8
	volenvelope $b, $0, $7
	note G#, 8
	volenvelope $b, $0, $0
	octave 3
	note B_, 10
	volenvelope $b, $0, $7
	note B_, 6
	volenvelope $b, $0, $0
	octave 4
	note C#, 8
	octave 3
	note B_, 8
	volenvelope $b, $0, $0
	note A#, 10
	volenvelope $b, $0, $7
	note A#, 6
	volenvelope $2, $1, $7
	note D#, 10
	volenvelope $b, $0, $7
	note D#, 6
	volenvelope $b, $0, $0
	note B_, 10
	volenvelope $b, $0, $7
	note B_, 6
	volenvelope $c, $0, $7
	octave 4
	note C#, 8
	octave 3
	note B_, 8
	volenvelope $b, $0, $0
	octave 4
	note D#, 16
	volenvelope $b, $0, $7
	note D#, 16
	volenvelope $b, $0, $0
	note E_, 4
	volenvelope $b, $0, $7
	note E_, 6
	volenvelope $c, $0, $7
	note E_, 2
	note G#, 2
	note B_, 2
	octave 5
	note C#, 8
	octave 4
	note B_, 8
	volenvelope $b, $0, $0
	note A#, 10
	volenvelope $b, $0, $7
	note A#, 6
	volenvelope $b, $0, $0
	note A_, 10
	volenvelope $b, $0, $7
	note A_, 6
	volenvelope $b, $0, $0
	note G#, 10
	volenvelope $b, $0, $7
	note G#, 6
	volenvelope $b, $0, $0
	note G_, 10
	volenvelope $b, $0, $7
	note G_, 6
	volenvelope $a, $0, $4
	octave 3
	note G_, 8
	note D#, 8
	note A#, 8
	note G#, 8
	volenvelope $a, $0, $6
	octave 2
	note B_, 8
	octave 3
	note C#, 8
	note D#, 8
	note F_, 8
	volenvelope $c, $0, $7
	octave 4
	note G_, 8
	note D#, 8
	note A#, 8
	note G#, 8
	octave 3
	note B_, 8
	octave 4
	note C#, 8
	note D#, 8
	note F_, 8
	volenvelope $b, $0, $0
	note G_, 16
	note D#, 16
	octave 3
	note B_, 8
	note A#, 8
	note G#, 8
	volenvelope $c, $0, $7
	note F_, 8
Music_RivalBattle_branch_e99a6: ; e99a6
	volenvelope $c, $0, $2
	octave 3
	note A#, 6
	volenvelope $c, $0, $7
	octave 4
	note C#, 6
	volenvelope $c, $0, $2
	note D#, 4
	loopchannel 3, Music_RivalBattle_branch_e99a6
	volenvelope $c, $0, $2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	volenvelope $b, $0, $7
	note C#, 6
	volenvelope $9, $1, $2
	note C#, 4
Music_RivalBattle_branch_e99c1: ; e99c1
	volenvelope $c, $0, $2
	octave 3
	note G#, 6
	volenvelope $c, $0, $7
	note B_, 6
	volenvelope $c, $0, $2
	octave 4
	note C#, 4
	loopchannel 3, Music_RivalBattle_branch_e99c1
	volenvelope $c, $0, $2
	octave 3
	note G#, 2
	note B_, 4
	volenvelope $c, $0, $7
	note B_, 6
	volenvelope $6, $1, $2
	octave 4
	note D_, 4
	loopchannel 0, Music_RivalBattle_branch_e991a
; e99e0

Music_RivalBattle_branch_e99e0: ; e99e0
	volenvelope $c, $0, $7
	note D#, 10
	volenvelope $c, $0, $4
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note F#, 2
	volenvelope $c, $0, $5
	note F_, 4
	note D#, 4
	volenvelope $c, $0, $2
	note C#, 2
	volenvelope $c, $0, $7
	note D#, 6
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $b, $0, $7
	note F_, 8
	endchannel
; e99fb

Music_RivalBattle_Ch3: ; e99fb
	notetype $c, $1, $1, $1
	octave 3
	note F#, 2
	note A#, 2
	note __, 2
	note A#, 10
	octave 3
	note F#, 2
	octave 4
	note C#, 2
	note __, 2
	note C#, 6
	octave 3
	note C#, 2
	note D_, 2
Music_RivalBattle_branch_e9a0c: ; e9a0c
	note D#, 2
	note C#, 2
	note D#, 2
	note F#, 4
	note E_, 2
	note D#, 2
	note C#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a0c
Music_RivalBattle_branch_e9a17: ; e9a17
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
	loopchannel 3, Music_RivalBattle_branch_e9a17
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	octave 2
	note B_, 4
	octave 3
	note C_, 2
	note C#, 2
	note D_, 2
Music_RivalBattle_branch_e9a30: ; e9a30
	callchannel Music_RivalBattle_branch_e9b47
	octave 2
	note A#, 2
	octave 4
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note B_, 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	callchannel Music_RivalBattle_branch_e9b50
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 4
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	callchannel Music_RivalBattle_branch_e9b47
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	callchannel Music_RivalBattle_branch_e9b50
Music_RivalBattle_branch_e9a66: ; e9a66
	note C#, 2
	note G#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a66
	callchannel Music_RivalBattle_branch_e9b5c
	note G#, 2
	note F#, 2
Music_RivalBattle_branch_e9a71: ; e9a71
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 4, Music_RivalBattle_branch_e9a71
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	note F_, 2
	note D#, 2
	callchannel Music_RivalBattle_branch_e9b5c
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	callchannel Music_RivalBattle_branch_e9b65
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	callchannel Music_RivalBattle_branch_e9b65
	octave 3
	note D#, 2
	note A#, 2
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note G#, 2
Music_RivalBattle_branch_e9ab3: ; e9ab3
	note D#, 2
	note A#, 2
	loopchannel 4, Music_RivalBattle_branch_e9ab3
Music_RivalBattle_branch_e9ab9: ; e9ab9
	note D#, 2
	note A_, 2
	loopchannel 4, Music_RivalBattle_branch_e9ab9
Music_RivalBattle_branch_e9abf: ; e9abf
	note D#, 2
	note G#, 2
	loopchannel 4, Music_RivalBattle_branch_e9abf
Music_RivalBattle_branch_e9ac5: ; e9ac5
	note D#, 2
	note G_, 2
	loopchannel 12, Music_RivalBattle_branch_e9ac5
Music_RivalBattle_branch_e9acb: ; e9acb
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 4, Music_RivalBattle_branch_e9acb
Music_RivalBattle_branch_e9ad3: ; e9ad3
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	loopchannel 4, Music_RivalBattle_branch_e9ad3
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	note G#, 2
	note G_, 8
	note D#, 8
	note A#, 8
	note G_, 8
	octave 2
	note B_, 8
	octave 3
	note C#, 8
	note D#, 8
	note F_, 8
Music_RivalBattle_branch_e9b10: ; e9b10
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 7, Music_RivalBattle_branch_e9b10
	note E_, 2
	note D#, 2
Music_RivalBattle_branch_e9b1a: ; e9b1a
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 6, Music_RivalBattle_branch_e9b1a
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	note F_, 2
	note E_, 2
Music_RivalBattle_branch_e9b28: ; e9b28
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_RivalBattle_branch_e9b28
	note D_, 2
	note C#, 2
Music_RivalBattle_branch_e9b32: ; e9b32
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	loopchannel 4, Music_RivalBattle_branch_e9b32
	octave 2
	note B_, 2
	note G#, 2
	note B_, 2
	octave 3
	note F_, 4
	note E_, 2
	note D#, 2
	note D_, 2
	loopchannel 0, Music_RivalBattle_branch_e9a30
; e9b47

Music_RivalBattle_branch_e9b47: ; e9b47
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 4, Music_RivalBattle_branch_e9b47
	endchannel
; e9b50

Music_RivalBattle_branch_e9b50: ; e9b50
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 4
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note G#, 2
	endchannel
; e9b5c

Music_RivalBattle_branch_e9b5c: ; e9b5c
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	loopchannel 7, Music_RivalBattle_branch_e9b5c
	endchannel
; e9b65

Music_RivalBattle_branch_e9b65: ; e9b65
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	loopchannel 2, Music_RivalBattle_branch_e9b65
	endchannel
; e9b6f


