Music_VictoryRoad:
	musicheader 4, 1, Music_VictoryRoad_Ch1
	musicheader 1, 2, Music_VictoryRoad_Ch2
	musicheader 1, 3, Music_VictoryRoad_Ch3
	musicheader 1, 4, Music_VictoryRoad_Ch4

Music_VictoryRoad_Ch1:
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $3
	tone $0002
	notetype $c, $b3
.mainloop:
.loop1:
	callchannel .sub1
	loopchannel 6, .loop1
.loop2:
	intensity $b2
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	intensity $b7
	octave 3
	note C#, 3
	octave 2
	note A_, 1
	octave 3
	note D_, 3
	octave 2
	note A_, 1
	octave 3
	note G#, 3
	loopchannel 2, .loop2
.loop3:
	callchannel .sub1
	loopchannel 2, .loop3
	loopchannel 0, .mainloop

.sub1:
	intensity $b2
	octave 2
	note G_, 1
	note B_, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	intensity $b7
	note B_, 3
	note G_, 1
	octave 3
	note C_, 3
	octave 2
	note G_, 1
	octave 3
	note F#, 3
	endchannel

Music_VictoryRoad_Ch2:
	dutycycle $3
	vibrato $10, $24
.mainloop:
	notetype $c, $c2
	callchannel .sub1
	note __, 2
	callchannel .sub1
	note __, 1
	octave 4
	note C_, 1
	notetype $c, $b0
	note E_, 8
	octave 5
	note C_, 4
	octave 4
	note B_, 4
	note E_, 15
	note D#, 1
	notetype $c, $b0
	note E_, 8
	octave 5
	note C_, 4
	octave 4
	note B_, 4
	notetype $c, $b0
	octave 5
	note E_, 8
	notetype $c, $b7
	note E_, 8
	notetype $c, $c7
	note D_, 8
	stereopanning $f0
	note C#, 4
	stereopanning $f
	octave 4
	note A_, 4
	stereopanning $ff
	octave 5
	note C_, 8
	stereopanning $f
	octave 4
	note A#, 4
	stereopanning $f0
	note F_, 4
	stereopanning $ff
	note A_, 12
	note D_, 1
	note F#, 1
	note A_, 1
	octave 5
	note C#, 1
	note D_, 16
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 2
	note G#, 1
	note G#, 1
	note __, 2
	note A_, 1
	note A_, 1
	endchannel

Music_VictoryRoad_Ch3:
	stereopanning $f0
	notetype $c, $28
.mainloop:
.loop1:
	callchannel .sub1
	loopchannel 6, .loop1
.loop2:
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note F_, 1
	note A_, 3
	note D_, 1
	note B_, 1
	note __, 2
	note D_, 1
	note B_, 3
	loopchannel 2, .loop2
.loop3:
	callchannel .sub1
	loopchannel 2, .loop3
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note C_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D#, 1
	note G_, 3
	note C_, 1
	note A_, 1
	note __, 2
	note C_, 1
	note A_, 3
	endchannel

Music_VictoryRoad_Ch4:
	togglenoise $0
	notetype $c
.mainloop:
	note D_, 2
	note D_, 2
	note D#, 1
	note D_, 3
	note D#, 1
	note D_, 3
	note D#, 1
	note D_, 3
	note D_, 2
	note D_, 2
	note D#, 1
	note D_, 3
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 1
	note D_, 2
	note D#, 1
	loopchannel 0, .mainloop
