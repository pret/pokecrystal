Music_KantoGymBattle: ; ec720
	dbw $80, Music_KantoGymBattle_Ch1
	dbw $01, Music_KantoGymBattle_Ch2
	dbw $02, Music_KantoGymBattle_Ch3
; ec729

Music_KantoGymBattle_Ch1: ; ec729
	tempo 101
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0002
	vibrato $12, $1, $5
	notetype $c, $b, $0, $2
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	volenvelope $b, $0, $7
	note B_, 2
	volenvelope $b, $0, $2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	volenvelope $b, $0, $7
	octave 3
	note E_, 2
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	volenvelope $b, $0, $7
	note B_, 2
	volenvelope $b, $0, $2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	volenvelope $b, $0, $4
	octave 3
	note E_, 4
	note E_, 4
	note E_, 2
Music_KantoGymBattle_branch_ec78b: ; ec78b
	callchannel Music_KantoGymBattle_branch_ec832
	octave 2
	note A#, 2
	volenvelope $b, $0, $7
	note G#, 8
	note B_, 8
	octave 3
	note D#, 10
	note E_, 6
	callchannel Music_KantoGymBattle_branch_ec832
	note D#, 2
	volenvelope $b, $0, $7
	note C#, 8
	octave 2
	note B_, 8
	note G#, 10
	octave 3
	note E_, 6
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D#, 2
	volenvelope $b, $0, $7
	note E_, 2
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	volenvelope $b, $0, $5
	note B_, 2
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 3
	note C#, 2
	volenvelope $b, $0, $7
	octave 2
	note B_, 8
	note A#, 8
	note G#, 10
	note B_, 6
	volenvelope $b, $0, $5
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note G#, 2
	note A#, 2
	octave 3
	note C#, 2
	volenvelope $b, $0, $7
	note E_, 8
	note F#, 8
	note G_, 16
	volenvelope $b, $0, $2
	octave 2
	note G#, 2
	note G#, 2
	volenvelope $b, $0, $7
	octave 3
	note C#, 12
	volenvelope $b, $0, $2
	note G#, 2
	note F_, 4
	volenvelope $b, $0, $5
	octave 2
	note F_, 4
	note G_, 2
	note G#, 2
	note A#, 2
	volenvelope $b, $0, $2
	note A#, 2
	note A#, 2
	volenvelope $b, $0, $7
	octave 3
	note D#, 12
	volenvelope $b, $0, $2
	note A#, 2
	note G_, 4
	volenvelope $b, $0, $7
	octave 4
	note D#, 6
	volenvelope $4, $1, $4
	octave 3
	note D_, 4
	loopchannel 0, Music_KantoGymBattle_branch_ec78b
; ec832

Music_KantoGymBattle_branch_ec832: ; ec832
	volenvelope $b, $0, $5
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 2
	octave 2
	note A#, 2
	note D#, 2
	note G#, 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	endchannel
; ec847

Music_KantoGymBattle_Ch2: ; ec847
	setwaveduty $3
	vibrato $8, $3, $6
	setpitchoffset $0001
	notetype $c, $c, $0, $2
Music_KantoGymBattle_branch_ec852: ; ec852
	octave 4
	note A#, 1
	note G#, 1
	note A#, 1
	octave 5
	note D#, 1
	loopchannel 8, Music_KantoGymBattle_branch_ec852
	octave 3
Music_KantoGymBattle_branch_ec85d: ; ec85d
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D_, 2
	volenvelope $c, $0, $7
	note E_, 2
	volenvelope $c, $0, $2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	volenvelope $c, $0, $7
	note B_, 2
	volenvelope $c, $0, $2
	octave 4
	loopchannel 2, Music_KantoGymBattle_branch_ec85d
Music_KantoGymBattle_branch_ec894: ; ec894
	callchannel Music_KantoGymBattle_branch_ec907
	note E_, 8
	note G#, 8
	note B_, 10
	note G#, 6
	callchannel Music_KantoGymBattle_branch_ec907
	note E_, 8
	note G#, 8
	note B_, 10
	octave 4
	note E_, 6
	note D#, 8
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $a, $0, $2
	note __, 6
	octave 5
	note E_, 4
	note E_, 4
	note E_, 2
	volenvelope $a, $0, $0
	note D#, 8
	volenvelope $a, $0, $7
	note D#, 8
	note __, 12
	volenvelope $c, $0, $5
	octave 3
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note E_, 4
	volenvelope $b, $0, $0
	note D#, 8
	note D#, 16
	volenvelope $b, $0, $7
	note D#, 12
	volenvelope $c, $0, $5
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note B_, 4
	volenvelope $b, $0, $0
	note A#, 8
	volenvelope $b, $0, $7
	note A#, 8
	volenvelope $b, $0, $0
	octave 4
	note D#, 8
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $c, $0, $2
	octave 3
	note C#, 2
	note C#, 2
	volenvelope $c, $0, $7
	note F_, 8
	volenvelope $c, $0, $2
	octave 4
	note C#, 4
	note F_, 2
	note C#, 4
	volenvelope $c, $0, $7
	note G#, 4
	note G_, 2
	note F_, 2
	note D#, 2
	volenvelope $c, $0, $2
	octave 3
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $7
	note G_, 8
	volenvelope $c, $0, $2
	octave 4
	note D#, 4
	note G_, 2
	note D#, 4
	volenvelope $c, $0, $7
	note A#, 6
	octave 3
	note A_, 4
	loopchannel 0, Music_KantoGymBattle_branch_ec894
; ec907

Music_KantoGymBattle_branch_ec907: ; ec907
	setwaveduty $2
	volenvelope $d, $0, $1
	octave 3
	note A#, 2
	volenvelope $a, $0, $2
	note A#, 2
	volenvelope $d, $0, $1
	note G#, 2
	volenvelope $a, $0, $2
	note G#, 2
	volenvelope $d, $0, $1
	note A#, 2
	volenvelope $a, $0, $2
	note A#, 2
	volenvelope $c, $0, $5
	note B_, 2
	octave 4
	note C#, 2
	note C#, 2
	octave 3
	note B_, 4
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A#, 2
	setwaveduty $3
	volenvelope $b, $0, $0
	endchannel
; ec92e

Music_KantoGymBattle_Ch3: ; ec92e
	notetype $c, $1, $1, $1
	octave 2
	note E_, 1
	note __, 1
Music_KantoGymBattle_branch_ec934: ; ec934
	note B_, 3
	note __, 1
	loopchannel 6, Music_KantoGymBattle_branch_ec934
	note B_, 2
	note G#, 2
	note B_, 2
Music_KantoGymBattle_branch_ec93d: ; ec93d
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
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
	note D_, 1
	note __, 1
	note F_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
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
	note E_, 2
	loopchannel 2, Music_KantoGymBattle_branch_ec93d
Music_KantoGymBattle_branch_ec965: ; ec965
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec965
Music_KantoGymBattle_branch_ec96c: ; ec96c
	note E_, 2
	note B_, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec96c
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 4
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
Music_KantoGymBattle_branch_ec97f: ; ec97f
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec97f
Music_KantoGymBattle_branch_ec987: ; ec987
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec987
	octave 3
	note E_, 2
	octave 2
	note B_, 2
Music_KantoGymBattle_branch_ec992: ; ec992
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
	note E_, 2
	loopchannel 2, Music_KantoGymBattle_branch_ec992
Music_KantoGymBattle_branch_ec9a8: ; ec9a8
	note D#, 2
	note A#, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec9a8
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
Music_KantoGymBattle_branch_ec9bb: ; ec9bb
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 5, Music_KantoGymBattle_branch_ec9bb
Music_KantoGymBattle_branch_ec9c2: ; ec9c2
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_KantoGymBattle_branch_ec9c2
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	note A#, 2
	octave 3
	note E_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note C#, 2
Music_KantoGymBattle_branch_ec9d8: ; ec9d8
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec9d8
Music_KantoGymBattle_branch_ec9df: ; ec9df
	note C#, 2
	note G#, 2
	loopchannel 8, Music_KantoGymBattle_branch_ec9df
Music_KantoGymBattle_branch_ec9e5: ; ec9e5
	note D#, 2
	note A#, 2
	loopchannel 4, Music_KantoGymBattle_branch_ec9e5
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note A#, 2
	octave 3
	note D#, 2
	note F_, 2
	loopchannel 0, Music_KantoGymBattle_branch_ec965
; ec9fa


