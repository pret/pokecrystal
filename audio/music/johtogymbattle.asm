Music_JohtoGymBattle: ; ea50d
	dbw $80, Music_JohtoGymBattle_Ch1
	dbw $01, Music_JohtoGymBattle_Ch2
	dbw $02, Music_JohtoGymBattle_Ch3
; ea516

Music_JohtoGymBattle_Ch1: ; ea516
	tempo 101
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $12, $1, $5
	notetype $c, $b, $0, $2
Music_JohtoGymBattle_branch_ea526: ; ea526
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea526
Music_JohtoGymBattle_branch_ea52f: ; ea52f
	note C#, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	loopchannel 3, Music_JohtoGymBattle_branch_ea52f
	volenvelope $4, $1, $3
	note C#, 4
	volenvelope $b, $0, $2
	note D_, 6
	note D#, 6
	note C_, 4
	note F_, 6
	note D_, 6
	note D#, 4
	note D_, 6
	note D#, 6
	note C_, 4
	note F_, 6
	note G_, 6
	volenvelope $b, $0, $7
	note C_, 4
	volenvelope $b, $0, $2
	note G_, 6
	note G#, 6
	note F_, 4
	note G#, 6
	note F_, 6
	note G#, 4
	note G_, 6
	note G#, 6
	note F_, 4
	note G#, 6
	octave 4
	note C_, 6
	octave 3
	note G#, 2
	note F_, 2
Music_JohtoGymBattle_branch_ea55d: ; ea55d
	volenvelope $b, $0, $5
	note D_, 6
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note G_, 4
	volenvelope $b, $0, $7
	note G#, 12
	volenvelope $b, $0, $2
	note G_, 4
	volenvelope $b, $0, $7
	octave 4
	note C#, 12
	volenvelope $b, $0, $2
	note C_, 4
	volenvelope $b, $0, $5
	octave 3
	note D_, 6
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note G_, 4
	volenvelope $b, $0, $7
	note G#, 8
	note G_, 8
	note F_, 8
	note D#, 8
	volenvelope $7, $0, $0
	note C_, 8
	volenvelope $7, $0, $7
	note C_, 8
	volenvelope $b, $0, $4
	note D#, 2
	note E_, 2
	note F_, 6
	note G_, 2
	note D#, 4
	volenvelope $7, $0, $7
	octave 2
	note A#, 8
	note A#, 8
	volenvelope $c, $0, $5
	octave 3
	note G_, 2
	note G#, 2
	note A#, 6
	note A#, 2
	note G#, 4
	volenvelope $c, $0, $7
	note G_, 8
	note F_, 4
	note E_, 2
	note C#, 2
	volenvelope $a, $0, $0
	note C_, 8
	volenvelope $a, $0, $7
	note C_, 8
	volenvelope $b, $0, $2
	note F_, 6
	note F_, 4
	note E_, 2
	note F_, 4
	note F_, 6
	note F_, 6
	note F_, 2
	note G#, 2
	note E_, 6
	note E_, 4
	note F_, 2
	note E_, 2
	note C#, 2
	note C_, 6
	note C_, 6
	note C_, 4
	note F_, 6
	note F_, 2
	note G#, 2
	note E_, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note C_, 4
	note F_, 6
	note E_, 2
	note G#, 2
	note E_, 2
	note G_, 4
	note E_, 4
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 6
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note C_, 6
	note C_, 6
	note C_, 4
	note C#, 6
	note C#, 6
	note C#, 4
	note D_, 6
	note D_, 6
	note D_, 4
	note D#, 6
	note D#, 6
	note D#, 4
	volenvelope $8, $0, $0
	note G_, 16
	volenvelope $9, $0, $0
	note G#, 16
	volenvelope $a, $0, $0
	note A_, 8
	note A#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	volenvelope $b, $0, $0
	note A#, 8
	note B_, 2
	note A#, 2
	note A_, 2
	octave 4
	note C#, 2
	volenvelope $b, $0, $7
	note C_, 8
	note C#, 4
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note G#, 4
	note D#, 4
	note G#, 4
	note D#, 4
	note D#, 4
	octave 3
	note G#, 4
	octave 4
	note D#, 4
	octave 3
	note G#, 4
	note G#, 8
	note A_, 4
	note G#, 4
	note D#, 2
	note G#, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note A_, 2
	note D#, 2
	note G_, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 4
	octave 4
	note C#, 4
	octave 3
	note G#, 4
	note G#, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note B_, 8
	note A_, 8
	note G#, 8
	note F#, 8
	volenvelope $b, $0, $4
	note A_, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	volenvelope $9, $0, $2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	volenvelope $b, $0, $2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	volenvelope $c, $0, $2
	note D#, 16
	volenvelope $5, $0, $0
	octave 3
	note C_, 16
	note F_, 16
	note E_, 16
	volenvelope $9, $0, $7
	note D#, 10
	volenvelope $b, $0, $4
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note F#, 2
	loopchannel 0, Music_JohtoGymBattle_branch_ea55d
; ea65f

Music_JohtoGymBattle_Ch2: ; ea65f
	waveduty $3
	vibrato $8, $3, $6
	pitchoffset $0001
	notetype $c, $c, $0, $2
Music_JohtoGymBattle_branch_ea66a: ; ea66a
	octave 4
	note F#, 1
	note F_, 1
	note E_, 1
	note A#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea66a
Music_JohtoGymBattle_branch_ea673: ; ea673
	note F#, 1
	note F_, 1
	note F#, 1
	note A#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea673
	note A_, 6
	octave 3
	note A#, 6
	note G_, 4
	octave 4
	note D_, 6
	octave 3
	note A_, 6
	note A#, 4
	note A_, 6
	note A#, 6
	note G_, 4
	octave 4
	note D_, 6
	note D#, 6
	volenvelope $b, $0, $0
	octave 3
	note D#, 4
	volenvelope $c, $0, $2
	octave 4
	note D_, 2
	volenvelope $9, $0, $2
	octave 3
	note D_, 2
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note D#, 4
	volenvelope $9, $0, $2
	octave 3
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note C_, 4
	note G_, 2
	notetype $c, $9, $0, $2
	octave 3
	note D_, 2
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note D_, 4
	volenvelope $9, $0, $2
	octave 3
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note D#, 2
	volenvelope $9, $0, $2
	octave 3
	note D#, 2
	volenvelope $c, $0, $2
	octave 4
	note D_, 2
	volenvelope $9, $0, $2
	octave 3
	note D_, 2
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note D#, 4
	volenvelope $9, $0, $2
	octave 3
	note D_, 2
	volenvelope $c, $0, $2
	octave 4
	note C_, 2
	volenvelope $9, $0, $2
	octave 3
	note D#, 2
	volenvelope $c, $0, $2
	octave 4
	note G_, 2
	volenvelope $9, $0, $2
	octave 3
	note F_, 2
	note F_, 2
	volenvelope $c, $0, $2
	octave 4
	note G#, 2
	volenvelope $9, $0, $2
	octave 3
	note F_, 2
	note F_, 2
	volenvelope $c, $0, $2
	octave 4
	note F#, 2
	volenvelope $b, $0, $2
	octave 3
	note G#, 1
	note A_, 1
Music_JohtoGymBattle_branch_ea6ee: ; ea6ee
	volenvelope $c, $0, $7
	note A#, 8
	volenvelope $c, $0, $4
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	volenvelope $c, $0, $7
	note C#, 8
	volenvelope $c, $0, $4
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	volenvelope $b, $0, $0
	note F_, 6
	volenvelope $b, $0, $7
	note F_, 6
	volenvelope $c, $0, $2
	note D#, 4
	volenvelope $b, $0, $0
	note G#, 6
	volenvelope $b, $0, $7
	note G#, 6
	volenvelope $c, $0, $2
	note F_, 4
	volenvelope $c, $0, $7
	octave 3
	note A#, 8
	volenvelope $c, $0, $4
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	volenvelope $c, $0, $7
	note C#, 8
	volenvelope $c, $0, $4
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	volenvelope $b, $0, $0
	note C#, 16
	volenvelope $b, $0, $7
	note C#, 16
	volenvelope $a, $0, $4
	octave 3
	note F_, 6
	note D#, 6
	note F_, 4
	volenvelope $c, $0, $6
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	octave 4
	note C_, 4
	volenvelope $a, $0, $4
	octave 3
	note C#, 6
	note C_, 6
	note C#, 4
	volenvelope $c, $0, $6
	octave 4
	note C#, 6
	note C_, 6
	note C#, 4
	volenvelope $3, $1, $4
	note C_, 10
	volenvelope $b, $0, $7
	note C_, 6
	volenvelope $b, $0, $0
	note E_, 8
	volenvelope $b, $0, $7
	note E_, 8
	volenvelope $b, $0, $0
	octave 3
	note C#, 16
	octave 2
	note A#, 8
	octave 3
	note C#, 6
	note D#, 2
	note C_, 16
	note E_, 16
	volenvelope $a, $0, $0
	octave 5
	note C#, 4
	volenvelope $a, $0, $7
	octave 5
	note C#, 12
	volenvelope $b, $0, $7
	octave 4
	note A#, 8
	octave 5
	note C#, 6
	note D#, 2
	volenvelope $a, $0, $0
	note C_, 8
	volenvelope $a, $0, $7
	note C_, 8
	volenvelope $3, $1, $6
	note E_, 6
	volenvelope $a, $0, $6
	note E_, 10
	volenvelope $c, $0, $2
	octave 3
	note F_, 6
	note F_, 6
	note F_, 4
	note F#, 6
	note F#, 6
	note F#, 4
	note G_, 6
	note G_, 6
	note G_, 4
	note G#, 6
	note G#, 6
	note G#, 4
	volenvelope $9, $0, $0
	octave 4
	note C_, 16
	volenvelope $a, $0, $0
	note C#, 16
	volenvelope $b, $0, $0
	note D_, 16
	volenvelope $b, $0, $7
	note D#, 8
	volenvelope $4, $1, $4
	note D#, 6
	volenvelope $c, $0, $2
	note F#, 1
	note G_, 1
	volenvelope $c, $0, $7
	note G#, 8
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 2
	note G#, 4
	octave 5
	note C_, 4
	octave 4
	note A_, 4
	note G#, 4
	octave 5
	note D#, 4
	octave 4
	note G#, 4
	octave 5
	note D#, 4
	octave 4
	note G#, 4
	octave 5
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	octave 4
	note A_, 2
	note G#, 2
	note A_, 2
	note D#, 8
	note E_, 2
	note D#, 2
	note C#, 2
	note E_, 2
	note D#, 4
	note G#, 4
	note E_, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note D#, 8
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	octave 4
	note D#, 4
	note G#, 4
	note E_, 4
	note A_, 4
	volenvelope $c, $0, $0
	note G#, 8
	volenvelope $c, $0, $7
	note G#, 8
	volenvelope $c, $0, $2
	note G#, 16
	volenvelope $8, $0, $0
	octave 3
	note F_, 16
	octave 4
	note C_, 16
	octave 3
	note B_, 16
	note G_, 16
	loopchannel 0, Music_JohtoGymBattle_branch_ea6ee
; ea7f4

Music_JohtoGymBattle_Ch3: ; ea7f4
	notetype $c, $1, $1, $1
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note G#, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note F#, 2
	octave 4
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	octave 4
	note G#, 1
	note __, 1
	octave 3
	note E_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	callchannel Music_JohtoGymBattle_branch_ea952
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note F#, 4
	callchannel Music_JohtoGymBattle_branch_ea952
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
Music_JohtoGymBattle_branch_ea83f: ; ea83f
	callchannel Music_JohtoGymBattle_branch_ea963
	callchannel Music_JohtoGymBattle_branch_ea963
	callchannel Music_JohtoGymBattle_branch_ea96a
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea963
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea96a
	note C_, 2
	note G_, 2
	note A#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note A#, 2
	callchannel Music_JohtoGymBattle_branch_ea971
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note G_, 2
	note G#, 2
	note F_, 2
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note C_, 2
	note C#, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea96a
	callchannel Music_JohtoGymBattle_branch_ea978
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea971
	note C_, 2
	note G_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea983
	note __, 2
	callchannel Music_JohtoGymBattle_branch_ea990
	octave 4
	note C#, 2
	callchannel Music_JohtoGymBattle_branch_ea99c
	note __, 2
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	callchannel Music_JohtoGymBattle_branch_ea983
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea990
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea99c
	note A_, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	note D#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	note D_, 4
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 2
	note G#, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note A_, 2
	note D#, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	callchannel Music_JohtoGymBattle_branch_ea9b1
	note C#, 2
	note F#, 2
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note A_, 2
	note C#, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea9b1
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note A_, 2
	callchannel Music_JohtoGymBattle_branch_ea9a9
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note G#, 2
	note D#, 2
	note A_, 2
	note D#, 2
	note B_, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note D#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note D#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note F#, 2
	note E_, 2
	note F#, 2
	callchannel Music_JohtoGymBattle_branch_ea9b8
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D#, 2
	note C#, 2
	note D#, 2
	callchannel Music_JohtoGymBattle_branch_ea9b8
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	loopchannel 0, Music_JohtoGymBattle_branch_ea83f
; ea952

Music_JohtoGymBattle_branch_ea952: ; ea952
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	endchannel
; ea963

Music_JohtoGymBattle_branch_ea963: ; ea963
	note D_, 2
	note G_, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea963
	endchannel
; ea96a

Music_JohtoGymBattle_branch_ea96a: ; ea96a
	note C#, 2
	note G#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea96a
	endchannel
; ea971

Music_JohtoGymBattle_branch_ea971: ; ea971
	note C_, 2
	note G_, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea971
	endchannel
; ea978

Music_JohtoGymBattle_branch_ea978: ; ea978
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
	endchannel
; ea983

Music_JohtoGymBattle_branch_ea983: ; ea983
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	endchannel
; ea990

Music_JohtoGymBattle_branch_ea990: ; ea990
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	endchannel
; ea99c

Music_JohtoGymBattle_branch_ea99c: ; ea99c
	octave 3
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	endchannel
; ea9a9

Music_JohtoGymBattle_branch_ea9a9: ; ea9a9
	octave 3
	note D#, 2
	note G#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea9a9
	endchannel
; ea9b1

Music_JohtoGymBattle_branch_ea9b1: ; ea9b1
	note C#, 2
	note F#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea9b1
	endchannel
; ea9b8

Music_JohtoGymBattle_branch_ea9b8: ; ea9b8
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	endchannel
; ea9c1


