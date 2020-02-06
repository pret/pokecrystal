INCLUDE "constants/music_common.inc"


SECTION "audio/music/route3.asm", ROMX

Music_Route3::
	musicheader 4, 1, Music_Route3_Ch1
	musicheader 1, 2, Music_Route3_Ch2
	musicheader 1, 3, Music_Route3_Ch3
	musicheader 1, 4, Music_Route3_Ch4

Music_Route3_Ch1:
	stereopanning $f
	tempo 160
	volume $77
	notetype $c, $91
	note __, 10
	dutycycle $0
	vibrato $14, $6
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
.mainloop:
	callchannel .sub1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	intensity $6f
	note G_, 1
	note D_, 1
	intensity $77
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 4
	intensity $6f
	octave 3
	note G#, 2
	note E_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note E_, 8
	note D#, 1
	note E_, 1
	note G#, 2
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note A_, 1
	note G#, 1
	note F_, 3
	note E_, 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 2
	intensity $91
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, .sub1loop1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
.sub1loop2:
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, .sub1loop2
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
.sub1loop3:
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	loopchannel 3, .sub1loop3
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	endchannel

Music_Route3_Ch2:
	stereopanning $f0
	notetype $c, $5e
	dutycycle $2
	vibrato $6, $3
	octave 4
	note E_, 1
	note G_, 1
	note G#, 6
	intensity $87
	note F#, 1
	note G#, 1
	note A_, 1
	note __, 7
	note C#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	intensity $a7
	dutycycle $2
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G#, 1
.mainloop:
	intensity $7d
	callchannel .sub1
	note G_, 1
	note B_, 10
	intensity $b7
	note B_, 6
	intensity $7d
	note __, 4
	dutycycle $3
	note G#, 4
	callchannel .sub1
	note B_, 1
	intensity $7d
	octave 5
	note D_, 5
	intensity $b7
	octave 5
	note D_, 5
	dutycycle $0
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	intensity $8f
	dutycycle $2
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G#, 1
	note A_, 1
	note B_, 2
	note E_, 4
	octave 4
	note E_, 8
	note D_, 1
	note C#, 1
	note D_, 3
	note C#, 3
	octave 3
	note A_, 10
	dutycycle $2
	octave 4
	note F#, 6
	note E_, 1
	note F#, 1
	note G#, 6
	note F#, 1
	note G#, 1
	loopchannel 0, .mainloop

.sub1:
	note A_, 6
	note E_, 1
	note A_, 1
	octave 5
	note C#, 7
	intensity $b7
	octave 5
	note C#, 3
	intensity $7d
	octave 4
	note E_, 2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 6
	note D_, 1
	endchannel

Music_Route3_Ch3:
	stereopanning $ff
	vibrato $6, $3
	notetype $c, $13
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	intensity $14
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	callchannel .sub1
.mainloop:
	intensity $14
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note A_, 6
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 1
	note __, 1
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 6
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note C#, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note F#, 1
	note G#, 1
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note G#, 2
	endchannel

.sub2:
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	note G_, 2
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G#, 2
	note B_, 2
	endchannel

Music_Route3_Ch4:
	togglenoise $4
	notetype $c
	note __, 10
.mainloop:
	notetype $c
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 0, .mainloop
