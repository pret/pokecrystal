Music_Evolution:
	musicheader 4, 1, Music_Evolution_Ch1
	musicheader 1, 2, Music_Evolution_Ch2
	musicheader 1, 3, Music_Evolution_Ch3
	musicheader 1, 4, Music_Evolution_Ch4

Music_Evolution_Ch1:
	tempo 132
	volume $77
	vibrato $6, $34
	tone $0001
	dutycycle $2
	notetype $c, $92
	octave 3
	slidepitchto 1, 4, A_
	note C_, 1
	slidepitchto 1, 4, A_
	note G_, 1
	slidepitchto 1, 4, A_
	note C_, 1
	slidepitchto 1, 4, A_
	note G_, 1
	note __, 4
	dutycycle $3
	stereopanning $f
.mainloop:
.loop1:
	callchannel .sub1
	notetype $c, $a4
	note F#, 4
	callchannel .sub1
	notetype $c, $a4
	note F#, 4
	loopchannel 2, .loop1
	callchannel .sub2
	notetype $c, $a4
	note G#, 4
	callchannel .sub2
	notetype $c, $a4
	note G#, 4
	loopchannel 0, .mainloop

.sub1:
	notetype $c, $a2
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	endchannel

.sub2:
	notetype $c, $a2
	octave 3
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	endchannel

Music_Evolution_Ch2:
	dutycycle $2
	vibrato $8, $25
	notetype $c, $a2
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note __, 4
	dutycycle $3
	stereopanning $f0
.mainloop:
.loop1:
	callchannel .sub1
	notetype $c, $b5
	note A_, 4
	callchannel .sub1
	notetype $c, $b5
	note B_, 4
	loopchannel 2, .loop1
	callchannel .sub2
	notetype $c, $b5
	note B_, 4
	callchannel .sub2
	notetype $c, $b5
	octave 4
	note C#, 4
	octave 3
	loopchannel 0, .mainloop

.sub1:
	notetype $c, $b2
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	endchannel

.sub2:
	notetype $c, $b2
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	endchannel

Music_Evolution_Ch3:
	notetype $c, $16
	note __, 8
.mainloop:
.loop1:
	callchannel .sub1
	octave 3
	note A_, 4
	callchannel .sub1
	octave 3
	note B_, 4
	loopchannel 2, .loop1
	callchannel .sub2
	octave 3
	note B_, 4
	callchannel .sub2
	octave 4
	note C#, 4
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	endchannel

.sub2:
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	endchannel

Music_Evolution_Ch4:
	togglenoise $5
	notetype $c
	note __, 8
.mainloop:
	stereopanning $f0
	note A#, 6
	note A#, 4
	stereopanning $f
	note E_, 2
	note E_, 2
	note E_, 2
	loopchannel 0, .mainloop
