INCLUDE "constants/music_common.inc"


SECTION "audio/music/gym.asm", ROMX

Music_Gym::
	musicheader 4, 1, Music_Gym_Ch1
	musicheader 1, 2, Music_Gym_Ch2
	musicheader 1, 3, Music_Gym_Ch3
	musicheader 1, 4, Music_Gym_Ch4

Music_Gym_Ch1:
	tempo 156
	volume $77
	stereopanning $f
	vibrato $12, $24
	dutycycle $1
	notetype $c, $b7
.mainloop:
	octave 4
	note F#, 2
	octave 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 3
	octave 4
	note E_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	octave 4
	note D_, 2
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note A_, 12
	note F#, 2
	note A_, 2
	note G_, 1
	note __, 2
	note E_, 1
	note E_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 8
	note A_, 4
	note F#, 2
	note A_, 2
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C_, 2
	note D_, 6
	octave 3
	note A_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note B_, 1
	note __, 2
	note G_, 1
	note G_, 4
	octave 4
	note E_, 1
	note __, 2
	note C_, 1
	note C_, 2
	octave 3
	note B_, 1
	note A#, 1
	note A_, 12
	note F#, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 1
	note E_, 1
	note G_, 4
	note D_, 6
	octave 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	octave 4
	note F#, 3
	note G_, 4
	note F#, 4
	note E_, 4
	note C_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 2
	octave 3
	note B_, 4
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	octave 4
	note D_, 4
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	octave 4
	note E_, 4
	note F#, 6
	octave 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 1
	note A_, 1
	octave 4
	note F#, 3
	note A_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note D_, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note E_, 1
	note F#, 4
	note E_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note F#, 1
	note G_, 4
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note A_, 4
	octave 5
	note D_, 4
	octave 4
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	loopchannel 0, .mainloop

Music_Gym_Ch2:
	dutycycle $1
	stereopanning $f0
.mainloop:
	notetype $c, $c3
	octave 2
	note D_, 2
	octave 1
	note D_, 1
	note D_, 1
	note D_, 2
	note A_, 1
	octave 2
	note F#, 1
	note C_, 2
	octave 1
	note C_, 1
	note C_, 1
	note C_, 2
	octave 2
	note G_, 1
	note E_, 1
	octave 1
	note G_, 2
	octave 1
	note G_, 1
	note G_, 1
	note G_, 2
	octave 1
	note G_, 1
	note G_, 1
	note A_, 4
	octave 2
	note A_, 2
	octave 3
	note C_, 1
	note C#, 1
	callchannel .sub1
	octave 3
	note E_, 2
	note C_, 1
	note C#, 1
	callchannel .sub1
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	intensity $d2
	callchannel .sub2
	octave 1
	note F#, 1
	note B_, 1
	note F#, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	note A#, 4
	note A#, 2
	note F_, 1
	note F_, 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note E_, 2
	callchannel .sub2
	octave 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	note D_, 4
	note D_, 2
	octave 1
	note A_, 1
	note A_, 1
	note A_, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 2
	octave 2
	note F#, 2
	note D_, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note D_, 3
	octave 2
	note D_, 3
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 3
	octave 2
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	octave 3
	note E_, 2
	note C_, 1
	note C#, 1
	note D_, 3
	octave 2
	note D_, 3
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C_, 3
	octave 2
	note C_, 3
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	endchannel

.sub2:
	octave 2
	note D_, 4
	note D_, 2
	octave 1
	note A_, 1
	note A_, 1
	note A_, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	note D_, 2
	note C_, 4
	note C_, 2
	octave 1
	note G_, 1
	note G_, 1
	note G_, 1
	octave 2
	note C_, 1
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note C_, 2
	octave 1
	note B_, 2
	note __, 2
	note B_, 2
	note F#, 1
	note F#, 1
	endchannel

Music_Gym_Ch3:
	vibrato $14, $23
	stereopanning $ff
.mainloop:
	notetype $c, $14
	octave 6
	note D_, 2
	octave 4
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note D_, 1
	note C_, 2
	octave 4
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 2
	octave 3
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 5
	note B_, 1
	note B_, 1
	note B_, 4
	octave 6
	note C#, 4
	octave 5
	note D_, 12
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note E_, 1
	note __, 2
	note C_, 1
	note C_, 4
	note G_, 4
	note E_, 4
	note D_, 12
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 8
	note __, 4
	note F#, 12
	note E_, 2
	note F#, 2
	note G_, 1
	note __, 2
	note E_, 1
	note E_, 4
	octave 6
	note C_, 1
	note __, 2
	octave 5
	note G_, 1
	note G_, 4
	note F#, 12
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 1
	note G_, 1
	octave 6
	note C_, 8
	octave 5
	note B_, 4
	intensity $13
	callchannel .sub1
	note __, 2
	note A_, 2
	octave 6
	note D_, 2
	octave 5
	note A_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 4
	note A_, 4
	note G_, 4
	callchannel .sub1
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F#, 8
	note E_, 4
	loopchannel 0, .mainloop

.sub1:
	octave 5
	note A_, 6
	octave 6
	note D_, 6
	octave 5
	note A_, 4
	octave 6
	note C_, 4
	octave 5
	note B_, 4
	note A_, 4
	note G_, 4
	note F#, 1
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 4
	endchannel

Music_Gym_Ch4:
	togglenoise $4
.mainloop:
	notetype $c
	note D_, 2
	note C#, 1
	note C#, 1
	note B_, 4
	note D_, 2
	note C#, 1
	note C#, 1
	note B_, 4
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 2
	note C#, 1
	note C#, 1
	note A#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	notetype $6
.loop1:
	note D_, 6
	note D_, 6
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 6
	note D_, 6
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	loopchannel 4, .loop1
.loop2:
	note D#, 4
	note F#, 4
	note D_, 4
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 4
	note F#, 4
	loopchannel 8, .loop2
	loopchannel 0, .mainloop
