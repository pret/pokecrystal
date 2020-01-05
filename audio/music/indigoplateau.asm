Music_IndigoPlateau:
	musicheader 4, 1, Music_IndigoPlateau_Ch1
	musicheader 1, 2, Music_IndigoPlateau_Ch2
	musicheader 1, 3, Music_IndigoPlateau_Ch3
	musicheader 1, 4, Music_IndigoPlateau_Ch4

Music_IndigoPlateau_Ch1:
	tempo 128
	volume $77
	dutycycle $3
	tone $0002
	stereopanning $f
.mainloop:
	callchannel .sub1
	octave 3
	note D_, 4
	callchannel .sub1
	octave 3
	note D#, 4
	callchannel .sub1
	octave 3
	note D#, 4
	callchannel .sub1
	note A#, 4
	loopchannel 0, .mainloop

.sub1:
	notetype $c, $b6
	octave 2
	note A_, 4
	intensity $b2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	intensity $a0
	endchannel

Music_IndigoPlateau_Ch2:
	dutycycle $3
	vibrato $10, $22
	stereopanning $f0
.mainloop:
	callchannel .sub1
	note A_, 4
	callchannel .sub1
	note A#, 4
	callchannel .sub1
	note A_, 4
	callchannel .sub1
	note C#, 4
	intensity $c7
	note A_, 6
	note D_, 2
	note G_, 2
	note A#, 2
	note A_, 8
	intensity $b0
	note A_, 4
	callchannel .sub1
	note A#, 4
	intensity $c7
	octave 4
	note D_, 6
	note D#, 2
	note C_, 4
	note D_, 8
	intensity $b0
	octave 3
	note A_, 4
	callchannel .sub1
	note C#, 4
	intensity $c7
	octave 4
	note C_, 6
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F#, 8
	intensity $b0
	note A_, 4
	callchannel .sub1
	note A#, 4
	intensity $c7
	octave 4
	note D_, 6
	note D#, 2
	note F_, 4
	note F#, 8
	intensity $b0
	octave 3
	note A_, 4
	callchannel .sub1
	note C#, 4
	loopchannel 0, .mainloop

.sub1:
	notetype $c, $c6
	octave 3
	note D_, 4
	intensity $c2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 2
	note D_, 2
	intensity $b0
	endchannel

Music_IndigoPlateau_Ch3:
	notetype $c, $19
.mainloop:
	callchannel .sub1
	octave 3
	note A_, 4
	callchannel .sub1
	octave 3
	note A_, 4
	callchannel .sub1
	octave 3
	note A_, 4
	callchannel .sub1
	octave 3
	note F#, 4
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note D_, 1
	note __, 3
	octave 2
	note A_, 1
	note __, 3
	octave 3
	note C_, 1
	note __, 3
	note D_, 1
	note __, 3
	octave 2
	note A_, 1
	note __, 3
	endchannel

Music_IndigoPlateau_Ch4:
	stereopanning $f0
	togglenoise $0
	notetype $c
.mainloop:
	note D#, 4
	note D_, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D_, 4
	note D_, 2
	note D_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D#, 4
	note D_, 2
	note D#, 2
	note D#, 2
	note D_, 2
	note C#, 4
	note D_, 2
	note D_, 2
	note C#, 4
	loopchannel 0, .mainloop
