INCLUDE "constants/music_common.inc"


SECTION "audio/music/kantogymbattle.asm", ROMX

Music_KantoGymBattle::
	musicheader 3, 1, Music_KantoGymBattle_Ch1
	musicheader 1, 2, Music_KantoGymBattle_Ch2
	musicheader 1, 3, Music_KantoGymBattle_Ch3

Music_KantoGymBattle_Ch1:
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	note B_, 2
	intensity $b2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	octave 3
	note E_, 2
	intensity $b2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 8
	intensity $b7
	note B_, 2
	intensity $b2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	intensity $b4
	octave 3
	note E_, 4
	note E_, 4
	note E_, 2
.mainloop:
	callchannel .sub1
	octave 2
	note A#, 2
	intensity $b7
	note G#, 8
	note B_, 8
	octave 3
	note D#, 10
	note E_, 6
	callchannel .sub1
	note D#, 2
	intensity $b7
	note C#, 8
	octave 2
	note B_, 8
	note G#, 10
	octave 3
	note E_, 6
	intensity $b2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D#, 2
	intensity $b7
	note E_, 2
	intensity $b2
	note D#, 2
	note D#, 2
	note G_, 1
	note E_, 1
	note D#, 1
	note G_, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note E_, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	intensity $b5
	note B_, 2
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $b7
	octave 2
	note B_, 8
	note A#, 8
	note G#, 10
	note B_, 6
	intensity $b5
	octave 3
	note D#, 2
	note C#, 2
	octave 2
	note A#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	note D#, 4
	note C#, 2
	octave 2
	note A#, 2
	note A#, 2
	note G#, 2
	note A#, 2
	octave 3
	note C#, 2
	intensity $b7
	note E_, 8
	note F#, 8
	note G_, 16
	intensity $b2
	octave 2
	note G#, 2
	note G#, 2
	intensity $b7
	octave 3
	note C#, 12
	intensity $b2
	note G#, 2
	note F_, 4
	intensity $b5
	octave 2
	note F_, 4
	note G_, 2
	note G#, 2
	note A#, 2
	intensity $b2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 12
	intensity $b2
	note A#, 2
	note G_, 4
	intensity $b7
	octave 4
	note D#, 6
	intensity $4c
	octave 3
	note D_, 4
	loopchannel 0, .mainloop

.sub1:
	intensity $b5
	note D#, 2
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 2
	octave 2
	note A#, 2
	note D#, 2
	note G#, 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	endchannel

Music_KantoGymBattle_Ch2:
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
.loop1:
	octave 4
	note A#, 1
	note G#, 1
	note A#, 1
	octave 5
	note D#, 1
	loopchannel 8, .loop1
	octave 3
.loop2:
	intensity $c2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note D_, 2
	intensity $c7
	note E_, 2
	intensity $c2
	note D#, 2
	note D#, 2
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	note D#, 2
	note D#, 2
	note A#, 1
	note G#, 1
	note F#, 1
	note A#, 1
	note D#, 2
	note D#, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note B_, 1
	note G#, 2
	intensity $c7
	note B_, 2
	intensity $c2
	octave 4
	loopchannel 2, .loop2
.mainloop:
	callchannel .sub1
	note E_, 8
	note G#, 8
	note B_, 10
	note G#, 6
	callchannel .sub1
	note E_, 8
	note G#, 8
	note B_, 10
	octave 4
	note E_, 6
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $a2
	note __, 6
	octave 5
	note E_, 4
	note E_, 4
	note E_, 2
	intensity $a0
	note D#, 8
	intensity $a7
	note D#, 8
	note __, 12
	intensity $c5
	octave 3
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note E_, 4
	intensity $b0
	note D#, 8
	note D#, 16
	intensity $b7
	note D#, 12
	intensity $c5
	note A#, 4
	note B_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	note G#, 4
	note B_, 4
	intensity $b0
	note A#, 8
	intensity $b7
	note A#, 8
	intensity $b0
	octave 4
	note D#, 8
	intensity $b7
	note D#, 8
	intensity $c2
	octave 3
	note C#, 2
	note C#, 2
	intensity $c7
	note F_, 8
	intensity $c2
	octave 4
	note C#, 4
	note F_, 2
	note C#, 4
	intensity $c7
	note G#, 4
	note G_, 2
	note F_, 2
	note D#, 2
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	note G_, 8
	intensity $c2
	octave 4
	note D#, 4
	note G_, 2
	note D#, 4
	intensity $c7
	note A#, 6
	octave 3
	note A_, 4
	loopchannel 0, .mainloop

.sub1:
	dutycycle $2
	intensity $d1
	octave 3
	note A#, 2
	intensity $a2
	note A#, 2
	intensity $d1
	note G#, 2
	intensity $a2
	note G#, 2
	intensity $d1
	note A#, 2
	intensity $a2
	note A#, 2
	intensity $c5
	note B_, 2
	octave 4
	note C#, 2
	note C#, 2
	octave 3
	note B_, 4
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A#, 2
	dutycycle $3
	intensity $b0
	endchannel

Music_KantoGymBattle_Ch3:
	notetype $c, $19
	octave 2
	note E_, 1
	note __, 1
.loop1:
	note B_, 3
	note __, 1
	loopchannel 6, .loop1
	note B_, 2
	note G#, 2
	note B_, 2
.loop2:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D_, 1
	note __, 1
	note F_, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note E_, 2
	loopchannel 2, .loop2
.mainloop:
.loop3:
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 8, .loop3
.loop4:
	note E_, 2
	note B_, 2
	loopchannel 4, .loop4
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 4
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
.loop5:
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 8, .loop5
.loop6:
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 7, .loop6
	octave 3
	note E_, 2
	octave 2
	note B_, 2
.loop7:
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note E_, 2
	loopchannel 2, .loop7
.loop8:
	note D#, 2
	note A#, 2
	loopchannel 7, .loop8
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
.loop9:
	octave 2
	note E_, 2
	note B_, 2
	loopchannel 5, .loop9
.loop10:
	octave 2
	note F#, 2
	octave 3
	note C#, 2
	loopchannel 7, .loop10
	octave 2
	note A#, 2
	octave 3
	note C#, 2
	octave 2
	note E_, 2
	note A#, 2
	octave 3
	note E_, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note C#, 2
.loop11:
	octave 2
	note D#, 2
	note A#, 2
	loopchannel 4, .loop11
.loop12:
	note C#, 2
	note G#, 2
	loopchannel 8, .loop12
.loop13:
	note D#, 2
	note A#, 2
	loopchannel 4, .loop13
	octave 3
	note D#, 2
	octave 2
	note A#, 2
	note D#, 2
	note D_, 2
	note D_, 2
	note A#, 2
	octave 3
	note D#, 2
	note F_, 2
	loopchannel 0, .mainloop
