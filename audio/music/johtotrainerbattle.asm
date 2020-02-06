INCLUDE "constants/music_common.inc"


SECTION "audio/music/johtotrainerbattle.asm", ROMX

Music_JohtoTrainerBattle::
	musicheader 3, 1, Music_JohtoTrainerBattle_Ch1
	musicheader 1, 2, Music_JohtoTrainerBattle_Ch2
	musicheader 1, 3, Music_JohtoTrainerBattle_Ch3

Music_JohtoTrainerBattle_Ch1:
	tempo 102
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $92
	note __, 8
	octave 3
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	intensity $b2
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	intensity $b7
	note D_, 4
	intensity $b2
	note E_, 6
	note D_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	intensity $b7
	note F_, 4
	intensity $b2
	octave 4
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	octave 3
	note A_, 2
	note A#, 2
	intensity $b7
	note B_, 4
	intensity $b2
	octave 4
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 6
	intensity $b7
	note G_, 4
.mainloop:
	intensity $b4
	callchannel .sub1
	intensity $b7
	note A#, 4
	intensity $b3
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	intensity $b7
	octave 4
	note C_, 4
	intensity $b3
	octave 3
	note A_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	intensity $b7
	octave 4
	note D_, 4
	intensity $b3
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	octave 4
	note C_, 1
	intensity $b5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	callchannel .sub1
	intensity $b7
	note F_, 4
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	intensity $a0
	octave 3
	note F_, 8
	intensity $a7
	note F_, 8
	intensity $b7
	note A_, 6
	note E_, 6
	note A#, 4
	octave 4
	note C#, 6
	note F_, 4
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $a0
	note A_, 8
	intensity $a7
	note A_, 8
	intensity $b7
	note E_, 8
	note D_, 8
	note E_, 8
	note F_, 8
	note E_, 8
	note D_, 8
	note G_, 8
	note F_, 8
	note D_, 8
	note C_, 8
	note D_, 8
	note D#, 8
	note D_, 8
	note C_, 8
	note D_, 8
	note D#, 8
	note D_, 8
	note D#, 8
	note E_, 8
	note F_, 8
	intensity $b4
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	octave 4
	note C#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	intensity $b5
	note D#, 2
	note D_, 2
	intensity $b2
	note D#, 4
	intensity $b7
	note C_, 8
	note D#, 4
	note C#, 4
	note C_, 4
	note D#, 4
	intensity $b5
	note E_, 2
	note D#, 2
	intensity $b2
	note E_, 4
	intensity $b7
	note C#, 8
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	intensity $b5
	note F#, 2
	note F_, 2
	intensity $b2
	note F#, 4
	intensity $b7
	note D_, 8
	note F#, 4
	note E_, 4
	note D_, 4
	note F#, 4
	note G_, 8
	note D#, 8
	note A#, 8
	note G_, 8
	intensity $a0
	note D#, 4
	intensity $a7
	note D#, 12
	note __, 16
.loop1:
	intensity $b7
	note F_, 8
	intensity $b4
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	note F_, 4
	octave 2
	note A#, 4
	intensity $b7
	octave 3
	note F_, 8
	intensity $b4
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	note F_, 4
	note F_, 4
	loopchannel 2, .loop1
	intensity $b7
	note F_, 8
	intensity $b4
	note G_, 4
	note D#, 4
	note F_, 4
	note G#, 2
	note G_, 2
	intensity $b7
	note F_, 8
	note F_, 8
	intensity $b5
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	intensity $b7
	note F_, 8
	note F_, 8
	intensity $b5
	note G_, 4
	note D#, 4
	note F_, 4
	note G_, 2
	note D#, 2
	intensity $3f
	note G#, 8
	intensity $b7
	note G#, 8
	intensity $a0
	octave 4
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $b2
	octave 3
	note D#, 6
	note D#, 6
	note D#, 4
	note D#, 6
	note D#, 6
	intensity $b7
	note F_, 4
	intensity $b2
	note D#, 6
	note D#, 6
	note D#, 4
	note D#, 6
	note D#, 6
	intensity $4c
	note F_, 4
	intensity $b7
	note G#, 6
	note G_, 6
	note F_, 4
	note D#, 4
	note F_, 4
	note G_, 4
	note D#, 4
	note F_, 4
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note F_, 4
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note F_, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 6
	note D#, 6
	note G_, 4
	octave 4
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note F_, 4
	note C#, 2
	note D#, 2
	note F_, 4
	note C#, 2
	note D#, 2
	note A#, 4
	note G#, 4
	note G_, 4
	note F_, 4
	intensity $90
	octave 2
	note A#, 8
	octave 3
	note D#, 8
	octave 2
	note A#, 8
	octave 3
	note G_, 8
	intensity $a0
	note D#, 8
	note A#, 8
	note G_, 8
	octave 4
	note D#, 8
	intensity $a0
	octave 3
	note A#, 8
	intensity $a7
	note A#, 8
	intensity $b7
	note G_, 6
	note A#, 6
	note G#, 2
	note G_, 2
	intensity $a0
	note D#, 8
	intensity $a7
	note D#, 8
	intensity $b4
	note A#, 6
	note G_, 4
	note G_, 2
	note A#, 12
	note __, 16
	note __, 8
	intensity $a0
	octave 4
	note D_, 4
	intensity $a7
	note D_, 12
	intensity $a0
	note F_, 8
	intensity $a7
	note F_, 8
	intensity $b3
	callchannel .sub1
	note F_, 4
	note E_, 2
	note F_, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	intensity $a0
	octave 3
	note F_, 10
	intensity $a7
	note F_, 6
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note F_, 2
	note D_, 2
	endchannel

Music_JohtoTrainerBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 4
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note G#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note G#, 1
	octave 3
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note G#, 1
	octave 3
	note B_, 1
	note A#, 1
	note B_, 1
	octave 4
	note G#, 1
	octave 3
	note A#, 1
	note A_, 1
	note A#, 1
	intensity $c2
	octave 4
	note A_, 6
	callchannel .sub1
	intensity $c2
	note A_, 6
	callchannel .sub1
	intensity $c2
	octave 5
	note C_, 6
	note C_, 6
	note C_, 4
	note C_, 6
	note C_, 6
	intensity $c7
	note C#, 4
	intensity $c2
	note C_, 2
	intensity $a4
	octave 3
	note E_, 2
	note A_, 2
	intensity $c2
	octave 5
	note C_, 2
	intensity $a4
	octave 3
	note E_, 2
	note A_, 2
	intensity $c2
	octave 5
	note C_, 2
	intensity $a4
	octave 3
	note E_, 2
	intensity $c2
	octave 5
	note C_, 2
	intensity $a4
	octave 3
	note E_, 2
	note B_, 2
	intensity $c2
	octave 5
	note C_, 2
	intensity $a4
	octave 4
	note C_, 2
	note E_, 2
	intensity $c7
	note B_, 4
.mainloop:
	callchannel .sub2
	intensity $3e
	note A#, 8
	intensity $c7
	note A#, 8
	callchannel .sub2
	intensity $c4
	note D_, 4
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	octave 5
	note D_, 2
	intensity $b0
	note C#, 8
	intensity $b7
	note C#, 4
	intensity $c7
	octave 4
	note A#, 4
	intensity $b0
	note A_, 16
	intensity $b7
	note A_, 16
.loop1:
	intensity $c3
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	intensity $c7
	note A#, 4
	intensity $c3
	note A_, 2
	note G_, 2
	note A#, 2
	loopchannel 3, .loop1
	note A_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note A#, 2
.loop2:
	note G_, 2
	note F_, 2
	note G_, 2
	intensity $c7
	note G#, 4
	intensity $c3
	note G_, 2
	note F_, 2
	note G#, 2
	loopchannel 3, .loop2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	intensity $c7
	note G_, 6
	octave 4
	note D_, 6
	note C_, 2
	note D_, 2
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	intensity $b0
	note D#, 10
	intensity $b7
	note D#, 6
	intensity $90
	note G_, 8
	intensity $97
	note G_, 8
	intensity $c7
	octave 3
	note F_, 8
	note D#, 4
	note F_, 4
	note G_, 4
	note F_, 4
	note D#, 4
	note G_, 4
	note G#, 8
	note F_, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note F_, 4
	note G#, 4
	note A_, 8
	note F#, 4
	note G#, 4
	note A_, 4
	note G#, 4
	note F#, 4
	note A_, 4
	intensity $b0
	note A#, 8
	note A#, 8
	intensity $b0
	octave 4
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $62
	callchannel .sub3
	intensity $82
	callchannel .sub3
	intensity $92
	callchannel .sub3
	intensity $a2
	callchannel .sub3
.loop3:
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note G_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note G_, 2
	octave 3
	note A#, 2
	loopchannel 8, .loop3
	callchannel .sub4
	octave 3
	note A#, 2
	intensity $c7
	octave 4
	note C_, 8
	callchannel .sub4
	note G_, 2
	intensity $c7
	note F_, 8
	callchannel .sub4
	octave 3
	note A#, 2
	intensity $b0
	octave 4
	note C_, 8
	intensity $b7
	note C_, 8
	intensity $1f
	note D#, 12
	intensity $c7
	note D#, 4
	intensity $c2
	octave 3
	note G_, 4
	note D#, 2
	note G_, 6
	note G_, 4
	note G_, 2
	note F_, 2
	note D#, 2
	note G_, 6
	intensity $c7
	note G#, 4
	intensity $c2
	note G_, 4
	note D#, 2
	note G_, 6
	note G_, 4
	note G_, 6
	note G_, 6
	intensity $4c
	note G#, 4
	callchannel .sub5
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $b0
	note G#, 8
	intensity $b7
	note G#, 8
	callchannel .sub5
	intensity $b0
	note C#, 8
	intensity $b7
	note C#, 8
	intensity $c7
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	note G_, 6
	note D#, 2
	note A#, 8
	note A#, 6
	note G_, 2
	octave 4
	note D#, 8
	note D#, 6
	octave 3
	note A#, 2
	octave 4
	note G_, 8
	note G_, 6
	note D#, 2
	note A#, 8
	note G_, 6
	note A#, 6
	note G#, 2
	note G_, 2
	intensity $b0
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $c7
	note D#, 6
	note A#, 6
	note G#, 2
	note G_, 2
	intensity $b0
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $c7
	octave 3
	note A_, 6
	octave 4
	note E_, 6
	note D_, 2
	note E_, 2
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $b0
	note A#, 8
	intensity $b7
	note A#, 8
	callchannel .sub2
	intensity $c7
	note D_, 4
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note A_, 6
	note A_, 4
	note A_, 6
	note A_, 6
	intensity $c7
	note A#, 4
	endchannel

.sub2:
	intensity $c7
	octave 3
	note A_, 6
	octave 4
	note E_, 6
	note D_, 2
	note E_, 2
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	endchannel

.sub3:
	octave 3
	note A#, 2
	note D#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	endchannel

.sub4:
	intensity $c7
	octave 4
	note F_, 4
	intensity $c4
	octave 3
	note A#, 2
	octave 4
	note F_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F_, 2
	endchannel

.sub5:
	intensity $c7
	octave 4
	note D#, 6
	note A#, 6
	note G#, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note D#, 4
	endchannel

Music_JohtoTrainerBattle_Ch3:
	notetype $c, $19
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
	note E_, 2
	note A#, 2
	note A_, 2
	note G#, 2
.loop1:
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	loopchannel 3, .loop1
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	callchannel .sub1
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	callchannel .sub1
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
.mainloop:
	callchannel .sub2
	note E_, 2
	callchannel .sub3
	callchannel .sub3
	callchannel .sub2
	note A_, 2
	callchannel .sub3
	callchannel .sub3
	callchannel .sub4
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	callchannel .sub4
	note E_, 2
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	octave 3
	note A_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	callchannel .sub5
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	callchannel .sub5
	note D_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	callchannel .sub6
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	callchannel .sub6
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note G_, 8
	note F_, 8
	note E_, 8
	note D#, 8
.loop2:
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note A_, 2
	octave 4
	note C_, 2
	loopchannel 2, .loop2
	callchannel .sub6
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note G_, 2
.loop3:
	note C#, 2
	note G#, 2
	loopchannel 7, .loop3
	note B_, 2
	note A_, 2
.loop4:
	note D_, 2
	note A_, 2
	loopchannel 5, .loop4
	note B_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
.loop5:
	note A#, 4
	note D#, 4
	loopchannel 4, .loop5
.loop6:
	octave 4
	note G_, 4
	octave 3
	note A#, 4
	loopchannel 4, .loop6
.loop7:
	callchannel .sub7
	note D#, 2
	note F_, 8
	callchannel .sub7
	octave 4
	note C_, 2
	octave 3
	note A#, 8
	loopchannel 2, .loop7
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note A#, 8
	note G#, 8
	note F_, 8
	note G_, 8
	note G#, 8
	note A#, 8
	note F_, 8
	note G_, 8
	note G#, 4
	note D#, 2
	note G#, 2
	octave 4
	note C_, 8
	note C_, 8
	note D#, 8
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
.loop8:
	note D#, 2
	note A#, 2
	loopchannel 8, .loop8
.loop9:
	note C#, 2
	note G#, 2
	loopchannel 6, .loop9
	note C#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
.loop10:
	note D#, 2
	note A#, 2
	loopchannel 8, .loop10
.loop11:
	note C#, 2
	note G#, 2
	loopchannel 4, .loop11
	note C#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note D#, 8
	note C#, 8
	note C_, 8
	octave 2
	note A#, 8
	octave 3
	note A#, 8
	note G#, 8
	note G_, 8
	note F_, 8
	octave 4
	note D#, 8
	note D#, 8
	octave 3
	note A#, 8
	note A#, 8
	note G_, 8
	note G_, 8
	note D#, 8
	note D#, 4
	note A#, 4
	note A_, 16
	octave 4
	note C_, 16
	octave 3
	note A#, 16
	octave 4
	note D_, 16
	octave 3
	note A_, 16
	octave 4
	note C_, 16
	octave 3
	note A#, 16
	octave 4
	note D_, 8
	note __, 2
	octave 3
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note G_, 2
	endchannel

.sub2:
	octave 3
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	endchannel

.sub3:
	octave 3
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	endchannel

.sub4:
.sub4loop1:
	octave 3
	note E_, 2
	note A_, 2
	loopchannel 4, .sub4loop1
	endchannel

.sub5:
.sub5loop1:
	note D_, 2
	note A_, 2
	loopchannel 4, .sub5loop1
	endchannel

.sub6:
.sub6loop1:
	octave 3
	note C_, 2
	note G_, 2
	loopchannel 4, .sub6loop1
	endchannel

.sub7:
	note A#, 4
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 2
	endchannel
