INCLUDE "constants/music_common.inc"


SECTION "audio/music/mtmoon.asm", ROMX

Music_MtMoon::
	musicheader 4, 1, Music_MtMoon_Ch1
	musicheader 1, 2, Music_MtMoon_Ch2
	musicheader 1, 3, Music_MtMoon_Ch3
	musicheader 1, 4, Music_MtMoon_Ch4

Music_MtMoon_Ch1:
	tempo 208
	volume $77
	dutycycle $2
	tone $0001
	vibrato $8, $14
	stereopanning $f0
	notetype $c, $45
	note __, 2
	loopchannel 0, Music_MtMoon_Ch2.mainloop

Music_MtMoon_Ch2:
	vibrato $b, $15
	dutycycle $2
	notetype $c, $84
	stereopanning $f
.mainloop:
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 6
	octave 4
	note C#, 10
	note G#, 6
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note D#, 2
	note E_, 6
	note F#, 6
	note E_, 4
	loopchannel 0, .mainloop

Music_MtMoon_Ch3:
.mainloop:
	notetype $c, $28
.loop1:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 3, .loop1
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	note D#, 2
	note E_, 2
.loop2:
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	loopchannel 4, .loop2
	loopchannel 0, .mainloop

Music_MtMoon_Ch4:
	togglenoise $5
	notetype $c
.mainloop:
	stereopanning $f
	note A#, 4
	note A#, 8
	note A#, 4
	stereopanning $f0
	note A#, 4
	note A#, 4
	note A#, 4
	stereopanning $f
	note A#, 4
	note A#, 4
	stereopanning $f0
	note A#, 8
	loopchannel 0, .mainloop
