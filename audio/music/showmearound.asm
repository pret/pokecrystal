INCLUDE "constants/music_common.inc"


SECTION "audio/music/showmearound.asm", ROMX

Music_ShowMeAround::
	musicheader 4, 1, Music_ShowMeAround_Ch1
	musicheader 1, 2, Music_ShowMeAround_Ch2
	musicheader 1, 3, Music_ShowMeAround_Ch3
	musicheader 1, 4, Music_ShowMeAround_Ch4

Music_ShowMeAround_Ch1:
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $2
	notetype $c, $b1
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 4
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 8
.mainloop:
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	callchannel Music_ShowMeAround_Ch2.sub3
	callchannel .sub1
	callchannel Music_ShowMeAround_Ch2.sub3
	callchannel .sub1
	loopchannel 0, .mainloop

.sub1:
	note __, 4
	octave 3
	note C#, 1
	note __, 5
	note D_, 4
	note C_, 1
	note __, 1
	note __, 4
	octave 2
	note E_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	endchannel

Music_ShowMeAround_Ch2:
	stereopanning $ff
	dutycycle $2
	notetype $c, $b1
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note E_, 4
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	note E_, 8
	dutycycle $1
.mainloop:
	callchannel .sub3
	callchannel .sub3
	callchannel .sub1
	note A_, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	callchannel .sub1
	note A_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4
	callchannel .sub2
	note A_, 4
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note A_, 4
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note __, 1
	note D#, 1
	note E_, 1
	callchannel .sub2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	endchannel

.sub2:
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note A_, 4
	octave 5
	note F#, 2
	octave 4
	note A_, 2
	endchannel

.sub3:
	note __, 4
	octave 3
	note C#, 1
	note __, 5
	note D_, 4
	note C_, 1
	note __, 1
	note __, 2
	note C#, 1
	note __, 5
	octave 2
	note E_, 1
	note __, 3
	note A#, 2
	note B_, 1
	note __, 1
	endchannel

Music_ShowMeAround_Ch3:
	stereopanning $f0
	vibrato $10, $22
	notetype $6, $25
	octave 2
	note B_, 1
	note __, 3
	octave 3
	note D_, 1
	note __, 3
	note E_, 1
	note __, 3
	note G#, 1
	note __, 3
	note B_, 1
	note __, 3
	octave 4
	note D_, 1
	note __, 3
	note E_, 1
	note __, 3
	note G#, 1
	note __, 3
	note D_, 2
	note __, 6
	note D_, 2
	octave 3
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 2
	note __, 6
	intensity $14
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 2
	intensity $14
.mainloop:
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub2
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note A_, 2
	note __, 6
	octave 4
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 8
	note D#, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 2
	note __, 6
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note D_, 2
	note __, 6
	note C#, 4
	note D_, 2
	note __, 2
	endchannel

.sub2:
	octave 2
	note A_, 2
	note __, 6
	octave 4
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 8
	note D#, 2
	note __, 2
	octave 2
	note G#, 2
	note __, 6
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note __, 2
	note C#, 2
	note __, 2
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 6
	endchannel

Music_ShowMeAround_Ch4:
	togglenoise $3
	notetype $c
	note __, 16
	note __, 8
	note D_, 2
	note D#, 2
	note F#, 4
.mainloop:
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub2
	loopchannel 0, .mainloop

.sub1:
	note D#, 2
	note F#, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note F#, 4
	note D_, 2
	note D#, 2
	note F#, 4
	note D_, 2
	note G_, 2
	note G_, 2
	note D_, 2
	note D#, 2
	endchannel

.sub2:
	note D#, 2
	note F#, 2
	note D_, 2
	note G_, 2
	note G_, 2
	note F#, 4
	note D_, 2
	note D#, 2
	note F#, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note F#, 2
	endchannel
