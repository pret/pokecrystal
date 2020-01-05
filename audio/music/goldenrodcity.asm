Music_GoldenrodCity:
	musicheader 4, 1, Music_GoldenrodCity_Ch1
	musicheader 1, 2, Music_GoldenrodCity_Ch2
	musicheader 1, 3, Music_GoldenrodCity_Ch3
	musicheader 1, 4, Music_GoldenrodCity_Ch4

Music_GoldenrodCity_Ch1:
	stereopanning $f
	tempo 176
	volume $77
	notetype $c, $97
	note __, 16
	note __, 16
	note __, 16
	note __, 16
.mainloop:
	dutycycle $0
	callchannel .sub1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	intensity $71
	dutycycle $0
	callchannel .sub2
	intensity $77
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 4
	intensity $71
	callchannel .sub2
	note D#, 1
	note F#, 1
	intensity $77
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note D#, 2
	dutycycle $2
	intensity $97
	callchannel .sub1
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note A#, 2
	note F_, 1
	note __, 1
	note C#, 2
	note F_, 1
	note __, 1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note F#, 2
	note C#, 1
	note __, 3
	note C#, 1
	note __, 1
	note F#, 2
	note C#, 1
	note __, 1
	note F#, 2
	note A#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	octave 4
	note C#, 2
	endchannel

.sub2:
	octave 4
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	endchannel

Music_GoldenrodCity_Ch2:
	stereopanning $f0
	vibrato $12, $23
	dutycycle $2
	notetype $c, $97
.mainloop:
	intensity $97
	callchannel .sub1
	octave 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note D#, 8
	callchannel .sub1
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note D#, 8
	dutycycle $2
	intensity $77
	callchannel .sub2
	octave 4
	note G#, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	dutycycle $3
	intensity $77
	callchannel .sub2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 2
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note F_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 6
	octave 3
	note G#, 1
	octave 3
	note A_, 1
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	octave 4
	note A#, 2
	note G#, 2
	note F#, 2
	dutycycle $1
	endchannel

.sub2:
	note C#, 6
	note F_, 6
	note C#, 4
	note C_, 6
	note D#, 6
	note C_, 2
	octave 4
	note G#, 1
	note A_, 1
	note A#, 6
	octave 5
	note C#, 6
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D#, 2
	endchannel

Music_GoldenrodCity_Ch3:
	stereopanning $ff
	vibrato $8, $23
	notetype $c, $25
.mainloop:
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	note __, 3
	octave 3
	note C_, 1
	note D#, 1
	note G_, 1
	note G#, 1
	note D#, 2
	callchannel .sub2
	note __, 1
	octave 3
	note G#, 2
	note F#, 2
	note D#, 2
	octave 2
	note G#, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note C#, 4
	note __, 2
	note C#, 1
	note __, 1
	note C_, 4
	note __, 2
	note C_, 1
	note __, 1
	octave 2
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	note G#, 4
	note __, 2
	note G#, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	octave 3
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	note G#, 4
	note __, 2
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 3
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	endchannel

.sub2:
	note C#, 1
	note __, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	note __, 2
	note C#, 1
	note __, 5
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	note __, 2
	note C_, 1
	note __, 5
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	note __, 2
	note A#, 1
	note __, 5
	octave 3
	note A_, 1
	note A#, 1
	note F#, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	octave 2
	note G#, 1
	note __, 2
	note G#, 1
	endchannel

Music_GoldenrodCity_Ch4:
	togglenoise $3
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note D_, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
.mainloop:
.loop1:
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, .loop1
	callchannel .sub1
	callchannel .sub2
	note G_, 1
	note G_, 1
	note F#, 2
	callchannel .sub2
	note D_, 2
	note F#, 2
	callchannel .sub2
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel .sub2
	note D_, 2
	note D_, 1
	note D_, 1
	callchannel .sub2
	note G_, 1
	note G_, 1
	note F#, 2
	callchannel .sub2
	note D_, 2
	note F#, 2
	callchannel .sub2
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel .sub2
	note D_, 2
	note D_, 1
	note D_, 1
.loop2:
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, .loop2
	callchannel .sub1
	loopchannel 0, .mainloop

.sub1:
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
	endchannel

.sub2:
	note D#, 2
	note D_, 1
	note D#, 3
	note D#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	endchannel
