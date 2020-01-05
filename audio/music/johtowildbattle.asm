Music_JohtoWildBattle:
	musicheader 3, 1, Music_JohtoWildBattle_Ch1
	musicheader 1, 2, Music_JohtoWildBattle_Ch2
	musicheader 1, 3, Music_JohtoWildBattle_Ch3

Music_JohtoWildBattle_Ch1:
	tempo 104
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
.body:
	notetype $c, $b2
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
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	intensity $b2
	note G_, 6
	octave 2
	note A#, 6
	octave 3
	note D_, 4
	note C_, 4
	note C#, 4
	note D_, 8
	note D#, 6
	octave 2
	note A#, 6
	octave 3
	note D#, 4
	note C_, 4
	note D_, 4
	intensity $b5
	note D#, 8
	intensity $b2
	octave 4
	note D_, 6
	octave 3
	note A#, 6
	octave 4
	note D_, 4
	note C_, 4
	note C#, 4
	note D_, 8
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 4
	note C_, 4
	note D_, 4
	intensity $6f
	note D#, 8
.mainloop:
	intensity $b6
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	note B_, 4
	octave 3
	note F_, 6
	note E_, 6
	note C_, 4
	note G#, 8
	note A#, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 8
	octave 3
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	note D_, 6
	octave 2
	note B_, 6
	note B_, 4
	octave 3
	note F_, 6
	note E_, 6
	note D_, 4
	note E_, 8
	note D_, 8
	note C_, 8
	note F_, 8
	note D#, 6
	note C_, 6
	note C_, 4
	note F#, 6
	note F_, 6
	note C#, 4
	note A_, 8
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C#, 8
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 6
	note C_, 6
	note C_, 4
	note F#, 6
	note F_, 6
	note C#, 4
	note F_, 8
	note D#, 8
	note C#, 8
	note F#, 8
	intensity $b7
	note E_, 6
	note D_, 6
	note E_, 4
	note F_, 6
	note E_, 6
	note C_, 4
	note F_, 8
	note C_, 8
	note E_, 6
	note D_, 6
	note F_, 4
	note G_, 16
	octave 4
	note D_, 8
	note G_, 8
	note G_, 16
	note D_, 16
	octave 3
	note C_, 4
	note D_, 4
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 16
	note D_, 4
	note E_, 4
	note D_, 4
	note F#, 4
	note G_, 16
	loopchannel 0, .mainloop

Music_JohtoWildBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	callchannel .sub1
	notetype $c, $c2
	octave 4
	note G_, 6
.body:
	octave 3
	note D_, 6
	note G_, 4
	note F_, 4
	note F#, 4
	note G_, 8
	note G#, 6
	note D_, 6
	note G#, 4
	note F_, 4
	note G_, 4
	intensity $c7
	note G#, 8
	intensity $c2
	octave 4
	note G_, 6
	note D_, 6
	note G_, 4
	note F_, 4
	note F#, 4
	note G_, 8
	note G#, 6
	note D_, 6
	note G#, 4
	note F_, 4
	note G_, 4
	intensity $6f
	note G#, 8
.mainloop:
	intensity $c4
	octave 3
	note G_, 6
	note D_, 6
	note D_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C#, 2
	intensity $b0
	note D#, 16
	intensity $b7
	note D#, 16
	intensity $c4
	octave 3
	note G_, 6
	note D_, 6
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note B_, 4
	intensity $b0
	note A_, 16
	intensity $b6
	note A_, 16
	intensity $c4
	note G#, 6
	note D#, 6
	note D#, 2
	note G#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	intensity $b0
	note E_, 16
	intensity $b7
	note E_, 16
	intensity $c4
	octave 3
	note G#, 6
	note D#, 6
	note D#, 2
	note G#, 2
	octave 4
	note C#, 4
	note C_, 4
	octave 3
	note A#, 4
	note G#, 4
	intensity $b0
	note A#, 16
	intensity $b5
	note A#, 16
	intensity $c6
	octave 4
	note B_, 12
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 12
	octave 3
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	intensity $c7
	note D_, 16
	note G_, 8
	octave 5
	note C_, 8
	octave 4
	note B_, 16
	note G_, 16
	octave 3
	note E_, 4
	note F#, 4
	note E_, 4
	note D_, 4
	note E_, 16
	note G_, 4
	note A_, 4
	note G_, 4
	note A#, 4
	note B_, 16
	loopchannel 0, .mainloop

.sub1:
	notetype $c, $c2
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	octave 5
	note G_, 1
	endchannel

Music_JohtoWildBattle_Ch3:
	notetype $c, $14
.body:
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	octave 5
	note C#, 2
	octave 4
	note F#, 2
	octave 5
	note C_, 2
	octave 4
	note F#, 2
	note B_, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel .sub1
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note D#, 2
	note G_, 2
	note F_, 2
.loop1:
	note D_, 2
	note G_, 2
	loopchannel 6, .loop1
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel .sub1
	note F_, 2
	note F_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
.mainloop:
.loop2:
	note D_, 2
	note G_, 2
	loopchannel 7, .loop2
	note F#, 4
	callchannel .sub1
	callchannel .sub1
.loop3:
	note D_, 2
	note G_, 2
	loopchannel 7, .loop3
	note D_, 2
	note A_, 2
.loop4:
	note C_, 2
	note F_, 2
	loopchannel 5, .loop4
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	callchannel .sub1
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note G_, 4
.loop5:
	note E_, 2
	note A_, 2
	loopchannel 8, .loop5
	callchannel .sub1
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note A#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note F_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
.loop6:
	note D_, 2
	note G_, 2
	loopchannel 8, .loop6
.loop7:
	note C_, 2
	note F_, 2
	loopchannel 7, .loop7
	note E_, 2
	note C_, 2
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
.loop8:
	note D_, 2
	note G_, 2
	loopchannel 12, .loop8
.loop9:
	note C_, 2
	note E_, 2
	loopchannel 7, .loop9
	note F_, 2
	note F#, 2
.loop10:
	note D_, 2
	note G_, 2
	loopchannel 6, .loop10
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	note D#, 2
	note G#, 2
	loopchannel 4, .sub1loop1
	endchannel
