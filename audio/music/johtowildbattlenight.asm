Music_JohtoWildBattleNight: ; f605c
	dbw $80, Music_JohtoWildBattleNight_Ch1
	dbw $01, Music_JohtoWildBattleNight_Ch2
	dbw $02, Music_JohtoWildBattleNight_Ch3
; f6065

Music_JohtoWildBattleNight_Ch1: ; f6065
	tempo 107
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0002
	vibrato $10, $2, $5
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5ddb
; f6076

Music_JohtoWildBattleNight_Ch2: ; f6076
	setwaveduty $3
	vibrato $20, $3, $6
	setpitchoffset $0001
	callchannel Music_JohtoWildBattleNight_branch_f5f5d
	notetype $c, $c, $0, $2
	octave 4
	note G_, 6
	setpitchoffset $0001
	setwaveduty $2
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5eb2
; f608f

Music_JohtoWildBattleNight_Ch3: ; f608f
	notetype $c, $1, $0, $1
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5f94
; f6096


