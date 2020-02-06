INCLUDE "constants/music_common.inc"


SECTION "audio/music/route2.asm", ROMX

Music_Route2::
	musicheader 4, 1, Music_Route2_Ch1
	musicheader 1, 2, Music_Route2_Ch2
	musicheader 1, 3, Music_Route2_Ch3
	musicheader 1, 4, Music_Route2_Ch4

Music_Route2_Ch1:
	tempo 151
	volume $77
	stereopanning $f
	vibrato $6, $23
	notetype $c, $b1
	note __, 16
	note __, 16
	callchannel .sub1
.mainloop:
	intensity $b1
	octave 3
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	octave 4
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	callchannel .sub1
	callchannel .sub2
	callchannel .sub2
	callchannel .sub3
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	callchannel .sub3
	note G_, 2
	octave 4
	note C_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	intensity $b7
	note C_, 4
	octave 3
	note B_, 4
	intensity $b1
	endchannel

.sub2:
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	intensity $b7
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	intensity $b1
	endchannel

.sub3:
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	endchannel

Music_Route2_Ch2:
	stereopanning $ff
	vibrato $8, $24
	notetype $c, $b2
	callchannel .sub1
.mainloop:
	intensity $b2
	callchannel .sub1
	dutycycle $2
	intensity $b5
	callchannel .sub2
	callchannel .sub2
	callchannel .sub3
	callchannel .sub3
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note E_, 4
	note E_, 4
	note E_, 2
	octave 2
	note C_, 2
	octave 4
	note E_, 2
	octave 2
	note C_, 2
	octave 4
	note A#, 4
	note A#, 4
	note A#, 2
	octave 2
	note G_, 2
	octave 4
	note A#, 2
	octave 2
	note G_, 2
	octave 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note G#, 4
	note G#, 4
	intensity $b7
	note G#, 4
	note G_, 4
	intensity $b2
	endchannel

.sub2:
	octave 2
	note C_, 4
	note __, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 1
	note __, 1
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 1
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
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note D_, 4
	endchannel

.sub3:
	octave 2
	note E_, 4
	note __, 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 1
	note __, 1
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note __, 2
	note G#, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	endchannel

Music_Route2_Ch3:
	stereopanning $f0
	vibrato $16, $15
	notetype $c, $14
	octave 4
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	octave 5
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	note E_, 1
	note __, 3
	callchannel .sub1
	octave 3
	note D_, 4
.mainloop:
	notetype $c, $15
	octave 3
	note C_, 4
	note __, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 1
	note __, 1
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	callchannel .sub1
	octave 3
	note D_, 2
	intensity $10
	octave 6
	note C_, 1
	note D_, 1
	callchannel .sub2
	note __, 4
	note G_, 8
	note F_, 2
	note G_, 2
	notetype $c, $10
	callchannel .sub2
	note __, 16
	intensity $25
	callchannel .sub3
	note __, 4
	note D#, 1
	note E_, 7
	note D_, 4
	octave 5
	note B_, 1
	octave 6
	note C_, 3
	octave 5
	note B_, 4
	note A_, 4
	note B_, 8
	note G_, 4
	octave 6
	note A_, 4
	note G_, 4
	callchannel .sub3
	note __, 4
	note G#, 1
	note A_, 7
	note B_, 4
	note F#, 1
	note G_, 16
	note G_, 15
	loopchannel 0, .mainloop

.sub1:
	octave 3
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
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	endchannel

.sub2:
	octave 6
	note E_, 10
	note D_, 2
	note __, 2
	note C_, 2
	notetype $6, $10
	octave 5
	note F#, 1
	note G_, 15
	note A_, 4
	note A#, 4
	note __, 4
	octave 6
	note C_, 2
	note D_, 2
	note D#, 1
	note E_, 16
	note E_, 7
	note F_, 4
	note E_, 4
	note D#, 1
	note E_, 3
	note D_, 4
	note C_, 4
	note D_, 4
	endchannel

.sub3:
	octave 5
	note B_, 16
	note __, 4
	octave 6
	note C#, 1
	note D_, 7
	note E_, 4
	octave 5
	note B_, 1
	octave 6
	note C_, 16
	note C_, 3
	note D_, 4
	note __, 4
	note E_, 4
	note F_, 16
	endchannel

Music_Route2_Ch4:
	togglenoise $5
	notetype $c
.loop1:
	note A_, 4
	note A_, 4
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	loopchannel 3, .loop1
	note A_, 4
	note A_, 4
	note A_, 2
	note A_, 2
	note D#, 4
.mainloop:
.loop2:
	note A_, 4
	note A_, 4
	note A_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	loopchannel 4, .loop2
.loop3:
	note B_, 4
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	loopchannel 7, .loop3
	note B_, 4
	note A_, 4
	note A_, 2
	note A_, 2
	note D#, 4
.loop4:
	note B_, 4
	note C_, 4
	note B_, 2
	note B_, 2
	note C_, 4
	loopchannel 3, .loop4
	note B_, 4
	note C_, 4
	note C#, 2
	note C_, 2
	note C#, 4
.loop5:
	note B_, 4
	note C_, 4
	note B_, 2
	note B_, 2
	note C_, 4
	loopchannel 3, .loop5
	note B_, 4
	note C_, 4
	note D_, 2
	note D_, 2
	note D#, 4
	loopchannel 0, .mainloop
