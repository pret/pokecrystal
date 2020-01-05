Music_Route1:
	musicheader 3, 1, Music_Route1_Ch1
	musicheader 1, 2, Music_Route1_Ch2
	musicheader 1, 3, Music_Route1_Ch3

	db $3 ; unused

Music_Route1_Ch1:
	stereopanning $f
	tempo 184
	volume $77
	vibrato $16, $11
	dutycycle $3
	notetype $c, $83
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note G_, 1
	note A_, 1
	note G_, 2
	note E_, 2
	note G_, 1
	note E_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 3
	note E_, 1
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	intensity $81
	octave 5
	note D_, 2
	note D_, 2
	intensity $83
	note __, 2
.mainloop:
	intensity $83
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note __, 4
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note __, 2
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 3
	octave 4
	note D_, 1
	octave 3
	note E_, 2
	intensity $81
	note G_, 2
	note G_, 2
	intensity $83
	note __, 2
	note __, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note __, 4
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note __, 2
	note __, 2
	octave 4
	note C#, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	note __, 2
	note __, 2
	octave 3
	note F#, 1
	note G_, 1
	note A_, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	intensity $81
	octave 4
	note G_, 2
	note G_, 2
	intensity $83
	octave 3
	note F#, 1
	note E_, 1
	note __, 2
	note E_, 1
	note F#, 1
	note G_, 6
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	note E_, 1
	note F#, 1
	note G_, 4
	notetype $8, $83
	note A_, 1
	note B_, 1
	note A_, 1
	notetype $c, $83
	note G_, 1
	note E_, 1
	note F#, 2
	intensity $81
	octave 4
	note A_, 2
	note A_, 2
	intensity $83
	octave 3
	note A_, 1
	note G_, 1
	intensity $77
	intensity $1d
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 4
	note A_, 3
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note G_, 1
	dutycycle $2
	intensity $87
	octave 6
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	intensity $81
	octave 5
	note D_, 2
	note D_, 2
	note __, 2
	loopchannel 0, .mainloop

Music_Route1_Ch2:
	stereopanning $f0
	vibrato $12, $22
	dutycycle $2
	notetype $c, $92
	octave 4
	note F#, 1
	note G_, 1
	callchannel .sub2
	octave 3
	note A_, 2
	note A_, 2
	octave 4
	note F#, 1
	note G_, 1
	callchannel .sub3
	note C#, 2
	note E_, 2
	note D_, 2
	intensity $81
	note F#, 2
	note F#, 2
	intensity $82
	octave 4
	note D_, 1
	note E_, 1
	dutycycle $2
.mainloop:
	intensity $82
	callchannel .sub1
	intensity $81
	octave 3
	note A_, 2
	note A_, 2
	intensity $82
	octave 4
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note E_, 1
	note F#, 1
	note D_, 2
	note __, 2
	note F#, 2
	note D_, 1
	note E_, 1
	callchannel .sub1
	intensity $81
	note A_, 2
	note A_, 2
	intensity $82
	note C#, 1
	note D_, 1
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note B_, 4
	notetype $8, $92
	note C#, 1
	note D_, 1
	note C#, 1
	notetype $c, $92
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	intensity $81
	octave 5
	note D_, 2
	note D_, 2
	intensity $82
	octave 4
	note F#, 1
	note G_, 1
	callchannel .sub2
	note __, 4
	note F#, 1
	note G_, 1
	callchannel .sub3
	notetype $8, $92
	note C#, 1
	note D_, 1
	note C#, 1
	notetype $c, $92
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D_, 2
	intensity $81
	note F#, 2
	note F#, 2
	intensity $82
	octave 4
	note D_, 1
	note E_, 1
	loopchannel 0, .mainloop

.sub1:
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note G_, 3
	note F#, 1
	note E_, 2
	endchannel

.sub2:
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 3
	note F#, 1
	note E_, 2
	endchannel

.sub3:
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 3
	note G_, 1
	note A_, 2
	octave 5
	note D_, 2
	endchannel

Music_Route1_Ch3:
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $25
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 3
	octave 3
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	octave 3
	note A_, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	note G_, 1
	note F#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
.mainloop:
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 2
	note G_, 1
	note E_, 1
	octave 2
	note D_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note E_, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	note E_, 2
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note E_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note C#, 2
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note D_, 2
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	octave 3
	note D_, 4
	note F#, 4
	note G_, 2
	note A_, 2
	note B_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 3
	octave 3
	note D_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note C#, 1
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	loopchannel 0, .mainloop
