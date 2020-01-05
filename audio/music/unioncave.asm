Music_UnionCave:
	musicheader 4, 1, Music_UnionCave_Ch1
	musicheader 1, 2, Music_UnionCave_Ch2
	musicheader 1, 3, Music_UnionCave_Ch3
	musicheader 1, 4, Music_UnionCave_Ch4

Music_UnionCave_Ch1:
	tempo 160
	volume $77
	dutycycle $1
	tone $0002
	vibrato $18, $34
	stereopanning $f
.mainloop:
	notetype $c, $b3
.loop1:
	callchannel .sub1
	loopchannel 4, .loop1
.loop2:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 4
	note C#, 2
	note E_, 2
	note F_, 4
	loopchannel 8, .loop2
.loop3:
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note F_, 4
	note D_, 2
	note F_, 2
	note F#, 4
	loopchannel 4, .loop3
	note __, 4
	intensity $80
	note F_, 16
	note F#, 16
	note G_, 16
	note F#, 16
	note G_, 8
	note F#, 8
	note F_, 8
	note E_, 8
	note G_, 8
	note F#, 8
	octave 4
	note C_, 8
	octave 3
	note A_, 8
	intensity $95
	tone $0004
	callchannel .sub1
	tone $0008
	callchannel .sub1
	tone $000c
	callchannel .sub1
	tone $0010
	callchannel .sub1
	tone $0002
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	endchannel

Music_UnionCave_Ch2:
	dutycycle $3
	vibrato $8, $24
.mainloop:
	notetype $c, $c4
	callchannel .sub1
	intensity $c5
	callchannel .sub1
	intensity $c7
	callchannel .sub1
	intensity $c4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 8
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	note F#, 2
	note F_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 8
	note D_, 4
	note C#, 4
	note __, 4
	intensity $a0
	note C_, 16
	note C#, 16
	note D_, 16
	note C#, 16
	note E_, 16
	note D#, 16
	note A#, 16
	note A_, 16
	intensity $a5
	vibrato $6, $44
	callchannel .sub2
	vibrato $4, $33
	callchannel .sub2
	vibrato $2, $22
	callchannel .sub2
	vibrato $1, $41
	callchannel .sub2
	vibrato $8, $24
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 8
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note F_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note C#, 4
	note C_, 4
	endchannel

.sub2:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	endchannel

Music_UnionCave_Ch3:
	notetype $c, $16
	stereopanning $f0
.mainloop:
.loop1:
	note __, 16
	loopchannel 7, .loop1
	note __, 14
	octave 4
	note C_, 2
.loop2:
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note __, 2
	octave 4
	note C_, 2
	loopchannel 4, .loop2
.loop3:
	note __, 2
	octave 3
	note F_, 2
	note __, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note __, 2
	octave 4
	note C#, 2
	loopchannel 4, .loop3
	note __, 4
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
	note A_, 8
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
.loop4:
	note A_, 4
	note G_, 4
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	loopchannel 3, .loop4
	note A_, 4
	note G_, 4
	note A#, 8
.loop5:
	note __, 16
	loopchannel 4, .loop5
	loopchannel 0, .mainloop

Music_UnionCave_Ch4:
	togglenoise $1
	notetype $c
.mainloop:
	stereopanning $f0
	note E_, 4
	stereopanning $ff
	note F_, 4
	stereopanning $f
	note G#, 4
	note __, 8
	stereopanning $f
	note E_, 4
	stereopanning $ff
	note F_, 4
	stereopanning $f0
	note G#, 4
	note __, 8
	loopchannel 0, .mainloop

	loopchannel 0, .mainloop ; unused
