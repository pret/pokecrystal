INCLUDE "constants/music_common.inc"


SECTION "audio/music/bicycle.asm", ROMX

Music_Bicycle::
	musicheader 4, 1, Music_Bicycle_Ch1
	musicheader 1, 2, Music_Bicycle_Ch2
	musicheader 1, 3, Music_Bicycle_Ch3
	musicheader 1, 4, Music_Bicycle_Ch4

Music_Bicycle_Ch1:
	tempo 140
	volume $77
	dutycycle $3
	tone $0001
	stereopanning $f
	vibrato $8, $15
	notetype $c, $b4
	octave 3
	note B_, 6
	note A_, 6
	note G_, 4
	intensity $b0
	note A_, 6
	intensity $b6
	note A_, 8
	intensity $b2
	note F#, 2
.mainloop:
	stereopanning $f
	intensity $b2
	note G_, 2
	note G_, 2
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note D#, 2
	note D_, 2
	note D_, 2
	note E_, 2
	note E_, 2
	note C_, 2
	note C_, 2
	octave 2
	note B_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note C_, 2
	note E_, 2
	note E_, 2
	note C#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note D#, 2
	note D_, 2
	note D_, 2
	note E_, 2
	note E_, 2
	note C_, 2
	note C_, 2
	octave 2
	note B_, 2
	note B_, 2
	note A#, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	intensity $82
	note F#, 2
	intensity $b2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 2
	stereopanning $f0
	intensity $b6
	note B_, 4
	note G_, 4
	octave 4
	note D_, 4
	octave 3
	note G_, 4
	note A_, 4
	note F#, 4
	octave 4
	note D_, 4
	octave 3
	note F#, 4
	note G_, 4
	note E_, 4
	octave 4
	note C_, 4
	octave 3
	note E_, 4
	note F#, 4
	note D_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 4
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note F#, 2
	note A_, 2
	octave 4
	note C_, 2
	note F#, 2
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note G#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note G#, 2
	note A_, 2
	loopchannel 0, .mainloop

Music_Bicycle_Ch2:
	dutycycle $2
	vibrato $10, $24
	stereopanning $f0
	notetype $c, $c6
	octave 4
	note D_, 6
	note C_, 6
	octave 3
	note B_, 4
	intensity $c2
	octave 4
	note D_, 2
	note D_, 1
	note E_, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note D_, 2
	intensity $c3
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
.mainloop:
	stereopanning $ff
	dutycycle $2
	intensity $c3
	octave 3
	note B_, 4
	note G_, 4
	note A_, 4
	note F#, 4
	intensity $c2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	intensity $c5
	note D_, 8
	intensity $c4
	note E_, 4
	note G_, 4
	intensity $c2
	note E_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note G_, 2
	intensity $c5
	note F#, 8
	intensity $c3
	note B_, 4
	note G_, 4
	note A_, 4
	note F#, 4
	intensity $c2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	intensity $c5
	note D_, 8
	intensity $c4
	note E_, 4
	note G_, 4
	intensity $c2
	note E_, 2
	octave 4
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note E_, 2
	intensity $c7
	note F#, 8
	stereopanning $f
	callchannel .sub1
	note F#, 4
	intensity $c3
	note A_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note F#, 4
	intensity $c7
	callchannel .sub1
	note F#, 4
	intensity $c3
	note A_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 4
	loopchannel 0, .mainloop

.sub1:
	note G_, 6
	note B_, 6
	note G_, 4
	note F#, 6
	note A_, 6
	note F#, 4
	note E_, 6
	note G_, 6
	note E_, 4
	endchannel

Music_Bicycle_Ch3:
	notetype $c, $14
	note __, 16
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C_, 2
	note E_, 2
	note D_, 2
	octave 3
	note A_, 1
	note __, 1
.mainloop:
	callchannel .sub1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	callchannel .sub1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
.loop1:
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	loopchannel 2, .loop1
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel

Music_Bicycle_Ch4:
	togglenoise $0
	notetype $c
	note __, 16
	note __, 16
.mainloop:
	note __, 2
.loop1:
	stereopanning $f0
	note F_, 4
	loopchannel 12, .loop1
	note F_, 4
	note F_, 4
	stereopanning $ff
	note F_, 2
	note F_, 2
	note F_, 2
	loopchannel 0, .mainloop
