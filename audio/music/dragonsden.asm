INCLUDE "constants/music_common.inc"


SECTION "audio/music/dragonsden.asm", ROMX

Music_DragonsDen::
	musicheader 4, 1, Music_DragonsDen_Ch1
	musicheader 1, 2, Music_DragonsDen_Ch2
	musicheader 1, 3, Music_DragonsDen_Ch3
	musicheader 1, 4, Music_DragonsDen_Ch4

Music_DragonsDen_Ch1:
	tempo 144
	volume $77
	dutycycle $0
	tone $0004
	stereopanning $f0
	notetype $c, $80
.mainloop:
	callchannel .sub1
	note __, 16
	callchannel .sub2
	note __, 2
	callchannel .sub2
	note __, 2
	callchannel .sub2
	note __, 2
	callchannel .sub2
	note __, 10
	notetype $c, $b7
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note A#, 12
	note A_, 4
	note A#, 12
	note A_, 4
	note A#, 6
	octave 4
	note C_, 4
	note C#, 6
	note E_, 16
	note D#, 12
	note D_, 4
	octave 3
	note G#, 16
	endchannel

.sub2:
	intensity $b1
	note __, 2
	octave 4
	note C#, 3
	note C#, 3
	note C#, 3
	note C#, 3
	note C#, 4
	note C#, 3
	note C#, 3
	note C#, 4
	note C#, 2
	note C#, 2
	endchannel

Music_DragonsDen_Ch2:
	dutycycle $0
	tone $0004
	stereopanning $f
	notetype $c, $90
.mainloop:
	callchannel .sub1
	note __, 16
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	note __, 16
	notetype $c, $c7
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note D#, 12
	note D_, 4
	note D#, 12
	note D_, 4
	note D#, 6
	note F_, 4
	note F#, 6
	note A_, 16
	note G#, 12
	note G_, 4
	note C#, 16
	endchannel

.sub2:
	intensity $c1
.sub2loop1:
	octave 5
	note C#, 4
	octave 4
	note G#, 4
	note G#, 4
	note G#, 4
	loopchannel 2, .sub2loop1
	endchannel

Music_DragonsDen_Ch3:
.mainloop:
.loop1:
	notetype $c, $14
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	loopchannel 15, .loop1
	note __, 16
	notetype $6, $27
.loop2:
	octave 3
	note C#, 4
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 4
	octave 3
	note C#, 4
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	octave 2
	note G#, 4
	octave 3
	note C#, 4
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	loopchannel 16, .loop2
	loopchannel 0, .mainloop

Music_DragonsDen_Ch4:
	togglenoise $0
	notetype $c
	note __, 16
	note __, 16
.mainloop:
	stereopanning $f0
	note F_, 4
	stereopanning $f
	note F#, 4
	note F#, 4
	stereopanning $f0
	note F#, 4
	loopchannel 0, .mainloop
