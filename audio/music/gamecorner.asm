Music_GameCorner:
	musicheader 4, 1, Music_GameCorner_Ch1
	musicheader 1, 2, Music_GameCorner_Ch2
	musicheader 1, 3, Music_GameCorner_Ch3
	musicheader 1, 4, Music_GameCorner_Ch4

Music_GameCorner_Ch1:
	tempo 147
	volume $77
	stereopanning $f
	notetype $c, $91
	note __, 8
.mainloop:
	intensity $91
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	octave 3
	note __, 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 2
	note G_, 2
	intensity $71
.loop1:
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	loopchannel 4, .loop1
.loop2:
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, .loop2
.loop3:
	octave 4
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	loopchannel 4, .loop3
.loop4:
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	loopchannel 4, .loop4
.loop5:
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	loopchannel 4, .loop5
.loop6:
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, .loop6
.loop7:
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	loopchannel 4, .loop7
	octave 3
	note D_, 1
	note D_, 1
	note D_, 3
	note F_, 2
	note F_, 9
	loopchannel 0, .mainloop

.sub1:
	note __, 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	note __, 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 1
	note A#, 3
	endchannel

.sub2:
	note __, 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	endchannel

Music_GameCorner_Ch2:
	stereopanning $ff
	vibrato $8, $24
	notetype $c, $a1
	note __, 8
.mainloop:
	intensity $92
	dutycycle $1
	callchannel .sub1
	octave 1
	note F_, 2
	octave 3
	note G#, 2
	octave 1
	note F_, 1
	octave 3
	note G#, 2
	intensity $a4
	note G#, 3
	intensity $92
	note G_, 2
	note A#, 1
	octave 4
	note C_, 3
	callchannel .sub1
	octave 4
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note G_, 3
	note F_, 4
	dutycycle $2
	intensity $c7
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 4
	note D_, 6
	note C_, 6
	octave 2
	note A#, 4
	note A_, 4
	note __, 10
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 2
	note D#, 1
	note F_, 1
	note G_, 16
	intensity $92
	note G_, 1
	note G_, 1
	note G_, 3
	note A#, 2
	note A#, 9
	intensity $a4
	loopchannel 0, .mainloop

.sub1:
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note F_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note C_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note F_, 3
	note G_, 4
	intensity $92
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	octave 1
	note F_, 1
	octave 4
	note F_, 1
	note D#, 2
	note G_, 1
	note D#, 2
	intensity $a4
	note A#, 3
	note A_, 2
	intensity $92
	note A#, 1
	octave 5
	note C_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	intensity $a4
	note F_, 3
	note G_, 4
	intensity $92
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	endchannel

Music_GameCorner_Ch3:
	vibrato $8, $22
	notetype $c, $14
	note __, 8
.mainloop:
	stereopanning $ff
	notetype $c, $14
	callchannel .sub1
	callchannel .sub2
	octave 4
	note G_, 1
	note A_, 3
	callchannel .sub1
	callchannel .sub2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereopanning $f0
	callchannel .sub1
	callchannel .sub3
	callchannel .sub1
	callchannel .sub4
	callchannel .sub1
	callchannel .sub3
	callchannel .sub1
	stereopanning $ff
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 2
	note F_, 1
	octave 5
	note C_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 3
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 1
	note __, 2
	callchannel .sub1
	callchannel .sub2
	octave 4
	note G_, 1
	note A_, 3
	callchannel .sub1
	callchannel .sub2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereopanning $f0
	callchannel .sub1
	callchannel .sub3
	callchannel .sub1
	callchannel .sub4
	callchannel .sub1
	callchannel .sub3
	callchannel .sub1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	intensity $15
	callchannel .sub5
	octave 2
	note C_, 2
	note __, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 2
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	octave 2
	note F_, 2
	note __, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note F_, 1
	callchannel .sub5
	octave 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 4
	notetype $6, $15
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 2
	endchannel

.sub2:
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel

.sub3:
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 3
	endchannel

.sub4:
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note D_, 1
	octave 3
	note F_, 1
	note __, 1
	endchannel

.sub5:
	octave 2
	note F_, 2
	note __, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note F_, 1
	octave 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note D#, 1
	octave 3
	note D#, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	endchannel

Music_GameCorner_Ch4:
	togglenoise $3
	notetype $c
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 1
	note D_, 1
.mainloop:
	callchannel .sub1
.loop1:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 6, .loop1
	callchannel .sub2
.loop2:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, .loop2
	note __, 12
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel .sub1
.loop3:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 6, .loop3
	callchannel .sub2
.loop4:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, .loop4
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
.loop5:
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note F#, 2
	loopchannel 3, .loop5
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note D_, 1
	note D_, 1
.loop6:
	note A#, 2
	note F#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note D#, 1
	note D_, 2
	note F#, 2
	loopchannel 3, .loop6
	note D_, 1
	note D_, 1
	note D_, 2
	note A#, 1
	note F#, 2
	note F#, 5
	note D_, 1
	note D_, 1
	note D#, 2
	loopchannel 0, .mainloop

.sub1:
	note C_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	endchannel

.sub2:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
	endchannel
