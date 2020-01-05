Music_ChampionBattle:
	musicheader 3, 1, Music_ChampionBattle_Ch1
	musicheader 1, 2, Music_ChampionBattle_Ch2
	musicheader 1, 3, Music_ChampionBattle_Ch3

Music_ChampionBattle_Ch1:
	tempo 98
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 2
	note A#, 8
	note A#, 8
	note A#, 8
	note A#, 4
	intensity $b7
	note B_, 4
.loop1:
	callchannel .sub1
	octave 3
	note D#, 4
	loopchannel 2, .loop1
	callchannel .sub1
	octave 3
	note E_, 4
.loop2:
	callchannel .sub2
	loopchannel 3, .loop2
	callchannel .sub3
.loop3:
	callchannel .sub2
	loopchannel 7, .loop3
	callchannel .sub3
	intensity $b2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note E_, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note F#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note G#, 4
	intensity $a0
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note B_, 12
	intensity $b2
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
.mainloop:
	callchannel .sub4
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
.loop4:
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	loopchannel 2, .loop4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	callchannel .sub4
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	octave 4
	note E_, 4
	callchannel .sub5
	note B_, 4
	note G#, 4
	callchannel .sub5
	octave 4
	note D_, 4
	note D_, 4
	intensity $a0
	octave 3
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note F#, 8
	octave 2
	note F#, 8
	intensity $60
	note B_, 16
	intensity $70
	note B_, 16
	intensity $80
	octave 3
	note C#, 16
	intensity $a0
	note D#, 16
	intensity $b4
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
	intensity $90
	octave 3
	note F#, 8
	intensity $b4
	note E_, 4
	note E_, 4
	intensity $90
	note D#, 16
	note C#, 16
.loop5:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	loopchannel 4, .loop5
.loop6:
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note D#, 4
	loopchannel 2, .loop6
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note G#, 4
	callchannel .sub6
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	callchannel .sub6
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note D_, 4
	loopchannel 0, .mainloop

.sub1:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 2
	intensity $b7
	endchannel

.sub2:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	endchannel

.sub3:
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	note B_, 4
	endchannel

.sub4:
	intensity $b5
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
	intensity $b2
	endchannel

.sub5:
	intensity $b2
	octave 3
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 2
	intensity $b7
	endchannel

.sub6:
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note A#, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note C#, 4
	intensity $b2
	endchannel

Music_ChampionBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 3
	note D#, 8
	note D#, 8
	note D#, 8
	note D#, 4
	intensity $c7
	note D_, 4
	callchannel .sub1
	note A#, 4
	callchannel .sub1
	note B_, 4
	callchannel .sub1
	octave 4
	note C#, 4
	callchannel .sub2
	note D_, 4
	callchannel .sub2
	note F_, 4
	callchannel .sub2
	note D_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C_, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note E_, 8
	intensity $3c
	note E_, 8
.mainloop:
	intensity $c5
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
	intensity $c7
	note B_, 8
	octave 4
	note E_, 8
	intensity $c2
	octave 3
	note G#, 2
	note G#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note G#, 2
	note G#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c5
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
	intensity $c7
	octave 4
	note E_, 8
	note G#, 8
	note E_, 8
	note B_, 8
	callchannel .sub3
	note E_, 4
	note E_, 4
	callchannel .sub3
	note F#, 4
	note F#, 4
	intensity $c7
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note C#, 8
	octave 3
	note C#, 8
	intensity $b0
	note D#, 16
	note D#, 16
	note F_, 16
	note F#, 16
	intensity $c4
.loop1:
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
	loopchannel 2, .loop1
	intensity $b0
	octave 3
	note D#, 16
	note B_, 16
	note A#, 16
	note G#, 16
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note D_, 4
	intensity $b0
	note D#, 8
	note E_, 8
	note F#, 8
	note E_, 8
	note D#, 8
	note E_, 8
	note F#, 8
	note G#, 8
	loopchannel 0, .mainloop

.sub1:
	intensity $c2
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel

.sub2:
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel

.sub3:
	intensity $c1
	note D#, 2
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 2
	intensity $c5
	endchannel

Music_ChampionBattle_Ch3:
	notetype $c, $14
.loop1:
	octave 3
	note D#, 1
	note __, 7
	loopchannel 3, .loop1
	note D#, 1
	note __, 3
	note E_, 4
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	note D_, 4
	callchannel .sub2
	note A_, 4
	callchannel .sub2
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
.mainloop:
.loop2:
	note D#, 2
	note A#, 2
	loopchannel 8, .loop2
.loop3:
	note E_, 2
	note B_, 2
	loopchannel 5, .loop3
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
.loop4:
	note D#, 2
	note A#, 2
	loopchannel 8, .loop4
.loop5:
	note E_, 2
	note B_, 2
	loopchannel 8, .loop5
	callchannel .sub3
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
	callchannel .sub3
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
.loop6:
	note D#, 2
	note F#, 2
	loopchannel 16, .loop6
	callchannel .sub4
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
	callchannel .sub4
.loop7:
	octave 3
	note E_, 2
	note B_, 2
	loopchannel 4, .loop7
.loop8:
	note D#, 2
	note A#, 2
	loopchannel 5, .loop8
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
.loop9:
	note E_, 2
	note B_, 2
	loopchannel 5, .loop9
	octave 4
	note C#, 2
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
.loop10:
	note D#, 2
	note G#, 2
	loopchannel 8, .loop10
.loop11:
	note D#, 2
	note A#, 2
	loopchannel 7, .loop11
	note B_, 2
	note A#, 2
.loop12:
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D_, 2
	note D#, 2
	loopchannel 7, .loop12
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	note G#, 2
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 5
	loopchannel 3, .sub1loop1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	endchannel

.sub2:
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

.sub3:
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

.sub4:
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
