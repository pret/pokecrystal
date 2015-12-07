Music_JohtoWildBattleNight: ; f605c
	musicheader 3, 1, Music_JohtoWildBattleNight_Ch1
	musicheader 1, 2, Music_JohtoWildBattleNight_Ch2
	musicheader 1, 3, Music_JohtoWildBattleNight_Ch3
; f6065

Music_JohtoWildBattleNight_Ch1: ; f6065
	tempo 107
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $25
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5ddb
; f6076

Music_JohtoWildBattleNight_Ch2: ; f6076
	dutycycle $3
	vibrato $20, $36
	tone $0001
	callchannel Music_JohtoWildBattleNight_branch_f5f5d
	notetype $c, $c2
	octave 4
	note G_, 6
	tone $0001
	dutycycle $2
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5eb2
; f608f

Music_JohtoWildBattleNight_Ch3: ; f608f
	notetype $c, $11
	loopchannel 0, Music_JohtoWildBattleNight_branch_f5f94
; f6096
