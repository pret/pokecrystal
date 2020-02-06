INCLUDE "constants/music_common.inc"


SECTION "audio/music/mtmoonsquare.asm", ROMX

Music_MtMoonSquare::
	musicheader 2, 1, Music_MtMoonSquare_Ch1
	musicheader 1, 2, Music_MtMoonSquare_Ch2

Music_MtMoonSquare_Ch1:
	tempo 112
	volume $77
	dutycycle $2
	tone $0001
	note __, 1
.mainloop:
	notetype $c, $44
.loop1:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	loopchannel 2, .loop1
.loop2:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	loopchannel 2, .loop2
.loop3:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	loopchannel 2, .loop3
.loop4:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	loopchannel 2, .loop4
	loopchannel 0, .mainloop

Music_MtMoonSquare_Ch2:
	dutycycle $2
	vibrato $18, $24
.mainloop:
	notetype $c, $82
.loop1:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	notetype $c, $62
	loopchannel 2, .loop1
	notetype $c, $82
.loop2:
	octave 4
	note E_, 2
	note F#, 2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note E_, 4
	notetype $c, $62
	loopchannel 2, .loop2
	notetype $c, $82
.loop3:
	octave 4
	note C#, 2
	note D_, 2
	note E_, 4
	note E_, 2
	note G_, 2
	octave 5
	note C#, 4
	notetype $c, $62
	loopchannel 2, .loop3
	notetype $c, $82
.loop4:
	octave 4
	note D_, 2
	note E_, 2
	note F#, 4
	note F#, 2
	note A_, 2
	octave 5
	note D_, 4
	notetype $c, $62
	loopchannel 2, .loop4
	loopchannel 0, .mainloop
