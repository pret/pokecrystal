INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/music_common.inc"


SECTION "audio/music/johtowildbattlenight.asm", ROMX, BANK[BANK_MUSIC_JOHTO_WILD_BATTLE]

Music_JohtoWildBattleNight::
	musicheader 3, 1, Music_JohtoWildBattleNight_Ch1
	musicheader 1, 2, Music_JohtoWildBattleNight_Ch2
	musicheader 1, 3, Music_JohtoWildBattleNight_Ch3

Music_JohtoWildBattleNight_Ch1:
	tempo 107
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $25
	loopchannel 0, Music_JohtoWildBattle_Ch1.body

Music_JohtoWildBattleNight_Ch2:
	dutycycle $3
	vibrato $20, $36
	tone $0001
	callchannel Music_JohtoWildBattle_Ch2.sub1
	notetype $c, $c2
	octave 4
	note G_, 6
	tone $0001
	dutycycle $2
	loopchannel 0, Music_JohtoWildBattle_Ch2.body

Music_JohtoWildBattleNight_Ch3:
	notetype $c, $11
	loopchannel 0, Music_JohtoWildBattle_Ch3.body
