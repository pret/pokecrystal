INCLUDE "constants/music_common.inc"


SECTION "audio/music/rocketbattle.asm", ROMX

Music_RocketBattle::
	musicheader 3, 1, Music_RocketBattle_Ch1
	musicheader 1, 2, Music_RocketBattle_Ch2
	musicheader 1, 3, Music_RocketBattle_Ch3

Music_RocketBattle_Ch1:
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $b2
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
.loop1:
	intensity $b2
	octave 3
	note C_, 6
	note C_, 4
	note E_, 2
	intensity $b7
	note D_, 4
	loopchannel 3, .loop1
	intensity $b2
	note C_, 6
	note C_, 6
	intensity $b7
	note D_, 4
.loop2:
	intensity $b2
	octave 4
	note E_, 6
	note E_, 4
	note G_, 2
	intensity $b7
	note F_, 4
	loopchannel 3, .loop2
	intensity $b2
	note E_, 6
	note E_, 4
	intensity $b7
	note D_, 2
	note D#, 4
	intensity $b3
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A#, 2
	note F_, 2
	note F_, 2
	note A_, 2
	note D_, 2
	note D_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	intensity $b5
	note G_, 4
	intensity $b3
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	intensity $b5
	note D#, 4
	intensity $b3
	note D#, 2
	note D_, 2
	note F_, 2
.mainloop:
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 2
	note D_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	intensity $b5
	note G_, 4
	intensity $b3
	note G_, 2
	note F_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	intensity $b5
	note F_, 4
	intensity $b2
	octave 3
	note F_, 2
	note G_, 2
	note G#, 4
	intensity $b5
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	intensity $b2
	note F_, 2
	note A_, 4
	intensity $b7
	note A_, 4
	intensity $b5
	note A_, 2
	note G_, 2
	note F_, 4
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	intensity $b7
	octave 4
	note E_, 6
	note D_, 4
	octave 3
	note G_, 2
	note A#, 4
	note A_, 6
	note G_, 4
	note E_, 2
	note F_, 4
	note E_, 6
	note D_, 6
	note D#, 4
	intensity $a0
	note E_, 8
	intensity $a7
	note E_, 8
	intensity $b7
	octave 2
	note A_, 8
	note G_, 8
	note A_, 8
	note A#, 8
	note A_, 8
	note G_, 8
	note A_, 8
	octave 3
	note C#, 8
	note D_, 8
	note C#, 8
	octave 2
	note A#, 8
	note A_, 8
	octave 3
	note D_, 8
	note C#, 8
	note D_, 8
	note E_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note C_, 4
	intensity $b5
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note G_, 2
	intensity $b2
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 6
	note E_, 4
	intensity $b7
	note G_, 2
	note F_, 4
	intensity $b2
	note E_, 6
	note E_, 4
	intensity $b7
	note G_, 2
	note F_, 4
	intensity $b2
	note E_, 6
	octave 4
	note D_, 1
	note D#, 1
	intensity $a0
	note E_, 8
	intensity $b2
	octave 3
	note F_, 6
	note F_, 4
	intensity $b7
	note A#, 2
	note G_, 4
.loop3:
	intensity $b2
	note F_, 6
	note F_, 4
	intensity $b7
	note A_, 2
	note G_, 4
	loopchannel 2, .loop3
	intensity $b2
	note F_, 6
	octave 4
	note D_, 1
	note E_, 1
	intensity $a0
	note F_, 8
	intensity $b3
	note D_, 2
	octave 3
	note A_, 2
	note E_, 2
	note A_, 4
	note A_, 2
	intensity $b7
	octave 4
	note D_, 4
	intensity $b3
	note D#, 2
	octave 3
	note A#, 2
	note G_, 2
	note A#, 4
	note A#, 2
	intensity $b7
	octave 4
	note D_, 4
	intensity $b3
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 4
	note C_, 2
	intensity $b7
	note D#, 4
	intensity $a0
	note E_, 4
	intensity $a7
	note E_, 6
	intensity $a0
	octave 3
	note G#, 6
	intensity $b3
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	note C_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	intensity $b5
	note D_, 4
	intensity $b3
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note C#, 2
	note D_, 2
	intensity $b5
	note D#, 4
	intensity $b3
	note D#, 2
	note D_, 2
	note F_, 2
	loopchannel 0, .mainloop

Music_RocketBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $b2
	octave 4
	note A_, 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 1
	intensity $82
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note C#, 1
	intensity $92
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note D_, 1
	intensity $a2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note D#, 1
	intensity $b2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note E_, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
.loop1:
	intensity $c2
	octave 3
	note A_, 6
	note A_, 4
	octave 4
	note C_, 2
	intensity $c7
	octave 3
	note A#, 4
	loopchannel 3, .loop1
	intensity $c2
	note A_, 6
	note A_, 6
	intensity $4a
	note G#, 4
.loop2:
	intensity $c2
	octave 4
	note A_, 6
	note A_, 4
	octave 5
	note C_, 2
	intensity $c7
	octave 4
	note A#, 4
	loopchannel 3, .loop2
	intensity $c2
	note A_, 6
	note A_, 4
	intensity $c7
	note G_, 2
	note G#, 4
	callchannel .sub1
	intensity $b0
	note F_, 16
	intensity $b7
	note F_, 16
.mainloop:
	callchannel .sub1
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $b0
	note A#, 8
	intensity $b7
	note A#, 8
	intensity $c4
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	intensity $c7
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	intensity $c2
	note A_, 2
	octave 4
	note C_, 4
	intensity $b0
	note C_, 6
	intensity $b7
	note C_, 4
	intensity $c4
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $c7
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	intensity $c2
	note A#, 2
	octave 4
	note D_, 4
	intensity $b0
	note D_, 4
	intensity $b7
	note D_, 6
	intensity $4f
	note A_, 6
	intensity $a0
	note G_, 6
	note F_, 4
	note E_, 6
	note F_, 6
	note G_, 4
	note A_, 6
	note A#, 6
	note G#, 4
	note A_, 6
	intensity $a7
	note A_, 10
	intensity $3f
	octave 3
	note D_, 8
	intensity $b7
	note D_, 8
	intensity $3f
	note C#, 8
	intensity $b7
	note C#, 8
	intensity $3f
	note D_, 8
	intensity $b7
	note D_, 8
	intensity $3f
	note E_, 8
	intensity $b7
	note E_, 8
	intensity $4e
	note F_, 8
	intensity $a0
	note F_, 8
	note E_, 16
	note F_, 16
	note A_, 16
	intensity $3f
	note F_, 16
	intensity $c7
	octave 4
	note D_, 8
	note C#, 8
	intensity $b0
	note E_, 8
	intensity $b7
	note E_, 8
	intensity $3c
	note A_, 6
	intensity $c7
	note A_, 10
	intensity $c2
	octave 3
	note A_, 6
	note A_, 6
	note A_, 4
	note A_, 6
	note A_, 4
	intensity $c7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	intensity $c2
	note A_, 6
	note A_, 4
	intensity $c7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	intensity $c2
	note A_, 6
	intensity $c7
	octave 4
	note G_, 1
	note G#, 1
	note A_, 8
.loop3:
	intensity $c2
	octave 3
	note A#, 6
	note A#, 4
	intensity $c7
	octave 4
	note D_, 2
	note C_, 4
	loopchannel 3, .loop3
	intensity $c2
	octave 3
	note A#, 6
	intensity $c7
	octave 4
	note G_, 1
	note A_, 1
	note A#, 8
	intensity $c7
	note A_, 6
	note G_, 6
	note A_, 4
	note A#, 6
	octave 5
	note D_, 6
	octave 4
	note A#, 4
	note A_, 6
	note G_, 6
	intensity $c5
	note A_, 4
	intensity $b0
	note A_, 8
	intensity $b7
	note A_, 8
	intensity $c6
	octave 3
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $3d
	note A#, 8
	intensity $c7
	note A#, 8
	loopchannel 0, .mainloop

.sub1:
	intensity $c6
	octave 4
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	endchannel

Music_RocketBattle_Ch3:
	notetype $c, $19
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note F#, 2
	octave 4
	note E_, 2
	octave 3
	note F_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
.loop1:
	callchannel .sub1
	loopchannel 3, .loop1
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
.loop2:
	callchannel .sub1
	loopchannel 3, .loop2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	note A_, 2
	note A#, 2
	callchannel .sub2
	callchannel .sub3
	octave 3
	note F_, 2
	callchannel .sub4
.mainloop:
	callchannel .sub2
	callchannel .sub3
	octave 3
	note A#, 2
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
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel .sub5
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
.loop3:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, .loop3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	callchannel .sub5
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel .sub5
	callchannel .sub5
.loop4:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F_, 2
	loopchannel 7, .loop4
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
.loop5:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 4, .loop5
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
.loop6:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 13, .loop6
	octave 2
	note A_, 2
	octave 3
	note E_, 4
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
.loop7:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, .loop7
	octave 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note A#, 4
	note A_, 2
	note G_, 2
	note A#, 2
.loop8:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 7, .loop8
	note E_, 2
	note F_, 2
.loop9:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, .loop9
	octave 3
	note A#, 2
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	callchannel .sub6
	octave 3
	note E_, 2
	callchannel .sub3
	octave 3
	note F_, 2
	callchannel .sub6
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	callchannel .sub2
	callchannel .sub3
	octave 3
	note F_, 2
	callchannel .sub4
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	note A#, 2
	octave 3
	note E_, 2
	note G_, 2
	note F_, 2
	endchannel

.sub2:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note D_, 2
	endchannel

.sub3:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	endchannel

.sub4:
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	endchannel

.sub5:
.sub5loop1:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, .sub5loop1
	endchannel

.sub6:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	endchannel
