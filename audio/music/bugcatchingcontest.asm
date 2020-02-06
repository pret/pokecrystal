INCLUDE "constants/music_common.inc"


SECTION "audio/music/bugcatchingcontest.asm", ROMX

Music_BugCatchingContest::
	musicheader 4, 1, Music_BugCatchingContest_Ch1
	musicheader 1, 2, Music_BugCatchingContest_Ch2
	musicheader 1, 3, Music_BugCatchingContest_Ch3
	musicheader 1, 4, Music_BugCatchingContest_Ch4

Music_BugCatchingContest_Ch1:
	tempo 144
	volume $77
	stereopanning $f
	vibrato $8, $24
	dutycycle $2
	notetype $c, $b7
	note __, 8
	octave 4
	note C#, 1
	note __, 1
	note C#, 3
	note __, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 3
	note __, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note __, 1
	note D#, 3
	note __, 1
	note D#, 1
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 3
	note __, 1
	note E_, 1
	note E_, 1
.mainloop:
	notetype $c, $b1
.loop1:
	note __, 2
	octave 2
	note A_, 2
	loopchannel 4, .loop1
.loop2:
	note __, 2
	note B_, 2
	loopchannel 8, .loop2
	intensity $b4
	dutycycle $1
	octave 3
	note B_, 6
	note A_, 1
	note B_, 1
	note A_, 6
	octave 4
	note D_, 1
	note E_, 1
	intensity $b1
	dutycycle $2
.loop3:
	note __, 2
	octave 2
	note A_, 2
	loopchannel 4, .loop3
	note __, 2
	note B_, 2
	note __, 2
	note B_, 2
	notetype $6, $b7
	octave 4
	note E_, 4
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G_, 1
	note B_, 8
	octave 5
	note E_, 8
	intensity $b1
	note __, 4
	octave 2
	note B_, 4
	note __, 4
	octave 3
	note E_, 4
	note __, 4
	note E_, 4
.loop4:
	note __, 4
	octave 2
	note A_, 4
	loopchannel 3, .loop4
	intensity $a7
	octave 4
	note F#, 4
	note A_, 4
	note __, 4
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 8
	note __, 4
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	note F#, 2
	octave 4
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 8
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note G_, 2
	note __, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note B_, 2
	note __, 2
	note G#, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G#, 2
	note B_, 2
	note C#, 2
	note __, 2
	note C#, 6
	note __, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note __, 2
	note D_, 6
	note __, 2
	note D_, 2
	note D_, 2
	note D#, 2
	note __, 2
	note D#, 6
	note __, 2
	note D#, 2
	note D#, 2
	note E_, 2
	note __, 2
	note E_, 6
	note __, 2
	note E_, 2
	note E_, 2
	loopchannel 0, .mainloop

Music_BugCatchingContest_Ch2:
	stereopanning $f0
	vibrato $8, $23
	dutycycle $1
	notetype $c, $c7
	note __, 8
.loop5:
	octave 4
	note A_, 1
	note __, 1
	note A_, 3
	note __, 1
	note A_, 1
	note A_, 1
	loopchannel 4, .loop5
.mainloop:
	dutycycle $0
	callchannel .sub1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note G#, 2
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note E_, 1
	note __, 1
	callchannel .sub1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note A_, 1
	note __, 1
	dutycycle $0
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	octave 4
	note B_, 8
	note __, 2
	octave 5
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	octave 4
	note A_, 8
	note __, 2
	octave 5
	note D_, 4
	note F#, 2
	note E_, 2
	note D_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 10
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	note A_, 10
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note D_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note A_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note C#, 2
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note E_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 1
	note B_, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note C#, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note D#, 2
	octave 3
	note G_, 1
	note __, 1
	endchannel

Music_BugCatchingContest_Ch3:
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $14
	note __, 8
	octave 3
	note A_, 1
	note __, 1
	note A_, 3
	note __, 1
	note A_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 3
	note __, 1
	note B_, 1
	note B_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 3
	note __, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note __, 1
	note C#, 3
	note __, 1
	note C#, 1
	note C#, 1
.mainloop:
	notetype $c, $14
	note F#, 5
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 4
	octave 5
	note D_, 4
	note C#, 2
	intensity $10
	note E_, 1
	note G_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note E_, 1
	notetype $6, $20
	octave 6
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 8
	intensity $14
	octave 4
	note E_, 10
	note __, 2
	note E_, 2
	note F#, 2
	note G_, 8
	octave 5
	note C#, 8
	note __, 4
	intensity $10
	note E_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note E_, 2
	note C_, 2
	octave 6
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 8
	intensity $15
	octave 5
	note F#, 4
	note __, 4
	note G_, 4
	note __, 4
	note A_, 4
	note __, 4
	octave 6
	note D_, 4
	note __, 4
	note C#, 12
	octave 5
	note B_, 2
	octave 6
	note C#, 2
	octave 5
	note B_, 4
	note __, 4
	octave 6
	note G_, 4
	note F#, 4
	note __, 4
	octave 5
	note G_, 4
	note A_, 4
	note B_, 4
	octave 6
	note E_, 4
	note D_, 4
	note C#, 4
	octave 5
	note B_, 2
	octave 6
	note C#, 2
	note D_, 4
	note __, 8
	octave 5
	note B_, 4
	note A_, 4
	note __, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 6
	note C_, 8
	octave 3
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note B_, 2
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note G_, 2
	note __, 2
	note B_, 2
	note __, 2
	note D_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 6
	note __, 2
	note A_, 2
	note A_, 2
	note B_, 2
	note __, 2
	note B_, 6
	note __, 2
	note B_, 2
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 6
	note __, 2
	note C_, 2
	note C_, 2
	note C#, 2
	note __, 2
	note C#, 6
	note __, 2
	note C#, 2
	note C#, 2
	loopchannel 0, .mainloop

Music_BugCatchingContest_Ch4:
	togglenoise $4
	notetype $6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note E_, 2
	note E_, 2
	callchannel Music_BugCatchingContest_Ch4.sub1
.mainloop:
.loop1:
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 5, .loop1
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 4
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	callchannel .sub1
	loopchannel 0, .mainloop

.sub1:
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	note D_, 4
	note B_, 8
	note D_, 2
	note D_, 2
	endchannel
