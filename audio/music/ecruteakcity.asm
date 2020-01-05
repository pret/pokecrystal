Music_EcruteakCity:
	musicheader 3, 1, Music_EcruteakCity_Ch1
	musicheader 1, 2, Music_EcruteakCity_Ch2
	musicheader 1, 3, Music_EcruteakCity_Ch3

Music_EcruteakCity_Ch1:
	tempo 197
	volume $77
	stereopanning $f
	vibrato $12, $25
	dutycycle $2
.mainloop:
	notetype $c, $57
	note __, 10
	octave 4
	note C_, 6
	note __, 10
	note C_, 6
	note __, 16
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note D_, 4
	intensity $60
	note __, 4
	note __, 16
	note __, 10
	note G_, 2
	note A_, 2
	note A#, 2
	note __, 8
	note G#, 2
	note G_, 2
	note F_, 2
	octave 5
	note C_, 6
	notetype $6, $67
	note C#, 4
	note D_, 10
	note __, 2
	stereopanning $ff
	octave 4
	note B_, 8
	stereopanning $f
	octave 3
	note A#, 1
	note B_, 11
	octave 4
	note C_, 4
	note E_, 4
	note G_, 12
	note A#, 12
	note G_, 4
	note __, 4
	note A#, 4
	octave 5
	note C#, 4
	note E_, 2
	note __, 2
	octave 3
	note A_, 8
	octave 4
	note C_, 8
	note F_, 4
	note __, 12
	note E_, 1
	note F_, 11
	note G_, 2
	note __, 2
	note A_, 4
	note G_, 4
	note __, 8
	intensity $52
	callchannel .sub1
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	callchannel .sub2
	intensity $52
	note A#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	octave 4
	note A#, 2
	octave 5
	note E_, 2
	note C#, 2
	octave 4
	note A#, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	callchannel .sub1
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C_, 2
	callchannel .sub2
	loopchannel 0, .mainloop

.sub1:
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	note C_, 2
	loopchannel 2, .sub1
	endchannel

.sub2:
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	note F_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	note C_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
.sub2loop1:
	octave 4
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note F_, 2
	loopchannel 2, .sub2loop1
.sub2loop2:
	octave 4
	note G_, 2
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note G_, 2
	loopchannel 2, .sub2loop2
	intensity $50
	dutycycle $0
	note E_, 16
	note G_, 16
	dutycycle $2
	endchannel

Music_EcruteakCity_Ch2:
	vibrato $12, $25
	dutycycle $3
	stereopanning $f0
.mainloop:
	notetype $6, $67
	note __, 16
	note __, 5
	octave 4
	note G_, 1
	octave 5
	note D_, 1
	note E_, 9
	note __, 16
	note __, 5
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note F_, 9
	notetype $c, $77
	note __, 10
	note D_, 2
	note C_, 2
	octave 4
	note G#, 2
	note G_, 4
	note A_, 4
	note B_, 4
	notetype $6, $93
	intensity $97
	dutycycle $2
	octave 3
	note G_, 7
	octave 4
	note C#, 1
	note D_, 11
	note __, 1
	note C_, 2
	note __, 2
	note C_, 16
	note F_, 8
	note __, 4
	note E_, 4
	note __, 4
	note E_, 4
	note F_, 4
	note G_, 4
	note E_, 4
	note C_, 2
	note __, 2
	note C_, 4
	octave 3
	note A_, 2
	note F_, 1
	note A_, 1
	octave 4
	note C_, 16
	note E_, 4
	note G_, 2
	note __, 2
	note E_, 4
	note D_, 10
	note __, 1
	stereopanning $ff
	note D#, 9
	stereopanning $f0
	dutycycle $0
	octave 5
	note C#, 1
	note D_, 11
	note C_, 2
	note __, 2
	note C_, 16
	note F_, 12
	note E_, 4
	note __, 4
	note E_, 4
	note F_, 4
	note G_, 2
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
	note A_, 3
	note E_, 2
	note __, 2
	note E_, 4
	note C_, 2
	note __, 2
	note C_, 4
	octave 4
	note A_, 2
	note __, 2
	note B_, 4
	octave 5
	note C_, 2
	octave 4
	note G_, 1
	note B_, 1
	octave 5
	note D#, 1
	note E_, 11
	note D_, 2
	note __, 2
	note D_, 8
	dutycycle $1
	octave 4
	note E_, 4
	note G_, 3
	note G#, 1
	note A_, 16
	octave 3
	note A_, 4
	octave 4
	note C_, 2
	note __, 2
	note E_, 4
	note D_, 12
	note C_, 4
	note __, 4
	octave 3
	note B_, 4
	note __, 4
	octave 4
	note F_, 8
	note G_, 12
	note F_, 8
	note __, 4
	note E_, 8
	note D_, 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 4
	octave 4
	note C_, 2
	note __, 6
	octave 3
	note B_, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note A_, 16
	note __, 4
	octave 4
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 12
	octave 3
	note B_, 4
	note __, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	notetype $c, $83
	note E_, 16
	intensity $80
	note D_, 4
	note C#, 4
	note F_, 4
	notetype $6, $80
	note G_, 7
	note G#, 1
	intensity $87
	note A_, 12
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 3
	note G#, 1
	note A_, 4
	note E_, 2
	note __, 2
	note E_, 4
	note D_, 2
	note __, 2
	note C#, 4
	note D_, 12
	octave 3
	note B_, 4
	octave 4
	note F_, 4
	note G_, 12
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 4
	note G_, 4
	note D_, 2
	note __, 1
	note A#, 1
	note B_, 12
	octave 5
	note C_, 4
	octave 4
	note A_, 8
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	notetype $c, $87
	note F_, 10
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 8
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note E_, 16
	loopchannel 0, .mainloop

Music_EcruteakCity_Ch3:
	stereopanning $ff
.mainloop:
	vibrato $12, $25
	notetype $c, $25
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	octave 3
	note C_, 2
	note A_, 2
	octave 4
	note E_, 2
	note F_, 10
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	note G_, 4
	note F#, 4
	note F_, 4
	octave 3
	note B_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 10
	octave 3
	note C#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	note __, 2
	note C#, 2
	note D_, 2
	note E_, 2
	octave 3
	note D_, 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 2
	note F_, 1
	note __, 1
	note G#, 8
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	note F_, 2
	note G#, 2
	note B_, 2
	note G_, 1
	note G#, 5
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note D_, 2
	note E_, 2
	note G_, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	octave 3
	note C#, 2
	note A#, 2
	octave 4
	note D_, 2
	note C#, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note G_, 1
	note __, 1
	octave 3
	note F_, 8
	octave 4
	note A_, 2
	octave 5
	note C_, 1
	note __, 1
	note D_, 2
	note E_, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F#, 2
	note A_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	callchannel .sub1
	octave 4
	note C_, 8
	note E_, 8
	note G_, 8
	note B_, 8
	note A#, 8
	note G_, 8
	note E_, 8
	note C#, 8
	notetype $c, $25
	callchannel .sub1
	octave 4
	note C_, 8
	octave 3
	note G_, 8
	note E_, 8
	note D_, 8
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note __, 2
	note C_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 2
	note __, 2
	note F_, 1
	note __, 1
	note E_, 4
	note __, 2
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note B_, 1
	note __, 1
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 4
	note __, 2
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 4
	note __, 2
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	notetype $6, $25
	note __, 1
	note B_, 1
	endchannel
