INCLUDE "constants/music_common.inc"


SECTION "audio/music/credits.asm", ROMX

Music_Credits::
	musicheader 4, 1, Music_Credits_Ch1
	musicheader 1, 2, Music_Credits_Ch2
	musicheader 1, 3, Music_Credits_Ch3
	musicheader 1, 4, Music_Credits_Ch4

Music_Credits_Ch1:
	tempo 139
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $2f
	octave 2
	note G_, 16
	notetype $6, $a7
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	callchannel .sub1
	note __, 4
	octave 3
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	intensity $96
	note A_, 1
	note G_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	intensity $94
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 1
	note B_, 1
	note A_, 1
	octave 3
	note __, 1
	intensity $a7
	callchannel .sub1
	callchannel .sub2
	intensity $97
	callchannel .sub3
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note C_, 2
	octave 3
	note B_, 2
	callchannel .sub3
	callchannel .sub4
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	intensity $a7
	octave 5
	note E_, 2
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	note C#, 2
	note C#, 1
	note D_, 7
	note E_, 7
	octave 3
	note __, 1
	pitchoffset 0, D_
	callchannel .sub1
	callchannel .sub2
	callchannel .sub3
	callchannel .sub4
	pitchoffset 0, C_
	octave 3
	note A_, 12
	notetype $8, $a7
	note D_, 1
	note D_, 1
	note D_, 1
	callchannel .sub5
	octave 3
	note B_, 6
	note A_, 6
	note A_, 6
	note G_, 6
	note A#, 6
	note A#, 6
	note A_, 6
	octave 4
	note C#, 6
	callchannel .sub5
	tempo 143
	octave 4
	note D_, 6
	octave 3
	note B_, 6
	note G_, 6
	octave 4
	note D_, 6
	tempo 146
	note E_, 6
	note F#, 6
	note A_, 6
	octave 5
	note C#, 6
	notetype $c, $a7
.loop1:
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	loopchannel 6, .loop1
	notetype $8, $a7
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	tempo 153
	notetype $c, $a7
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	notetype $8, $a7
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $c, $a7
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $8, $a7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	tempo 160
	notetype $c, $a7
	octave 2
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $a7
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $a7
	octave 2
	note D_, 1
	note __, 7
	intensity $c7
	octave 2
	note D_, 16
	intensity $b8
	intensity $b7
	note __, 16
	note __, 16
	note __, 16
	endchannel

.sub1:
	note C_, 16
	note F#, 1
	note G_, 3
	note E_, 4
	note D_, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 4
	note G_, 4
	note __, 4
	octave 4
	note D_, 4
	note __, 4
	note E_, 4
	octave 3
	note A#, 4
	note G_, 4
	note E_, 4
	note G_, 4
	octave 4
	note G_, 4
	note C_, 4
	note D_, 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G#, 8
	note F_, 4
	note C_, 7
	note G#, 1
	note A_, 1
	note A#, 7
	note G#, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note E_, 4
	note C_, 4
	note E_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	endchannel

.sub2:
	octave 4
	note C_, 4
	octave 3
	note D_, 4
	note G_, 4
	note B_, 8
	octave 4
	note D_, 4
	note C_, 4
	note D#, 4
	endchannel

.sub3:
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note C_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 4
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G_, 4
	note A_, 2
	note B_, 2
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	note E_, 4
	octave 3
	note G#, 8
	octave 4
	note C_, 8
	note E_, 4
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	endchannel

.sub4:
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	endchannel

.sub5:
	note __, 6
	octave 3
	note D_, 6
	note E_, 6
	note F_, 6
	note F#, 6
	note A_, 6
	octave 4
	note F#, 6
	note C#, 6
	endchannel

Music_Credits_Ch2:
	dutycycle $1
	vibrato $14, $23
	notetype $c, $2f
	stereopanning $f0
	octave 4
	note G_, 16
	intensity $c7
	octave 5
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	notetype $6, $c7
	callchannel .sub1
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	note __, 2
	note F#, 2
	note G_, 2
	note __, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	intensity $97
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	intensity $c7
	callchannel .sub1
	callchannel .sub2
	callchannel .sub3
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	note A_, 8
	note B_, 4
	note F#, 1
	note G_, 15
	notetype $c, $c7
	octave 5
	note E_, 15
	notetype $6, $c7
	note G_, 1
	note G#, 1
	note A_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	callchannel .sub3
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	octave 5
	note C_, 12
	notetype $c, $c7
	note D_, 16
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	octave 5
	note A_, 1
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	note E_, 1
	octave 3
	note A_, 4
	note G_, 4
	notetype $6, $c7
	pitchoffset 0, D_
	callchannel .sub1
	callchannel .sub2
	callchannel .sub3
	pitchoffset 0, C_
	octave 5
	note C#, 1
	note D_, 11
	note C#, 8
	note D_, 12
	notetype $c, $c7
	note E_, 16
	note A_, 14
	notetype $8, $c7
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 6
	octave 3
	note F#, 6
	note G_, 6
	note G#, 6
	note A_, 6
	octave 4
	note C#, 6
	note A_, 6
	note G_, 6
	note G_, 6
	note F#, 6
	note F#, 6
	note E_, 6
	note E_, 6
	note D_, 6
	note C#, 6
	note E_, 6
	octave 1
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	notetype $c, $c7
	octave 2
	note F#, 1
	note __, 1
	octave 1
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
.loop1:
	octave 1
	note G_, 2
	octave 2
	note G_, 1
	note __, 1
	loopchannel 4, .loop1
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 5
	note D_, 12
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c7
	note D_, 12
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 9
	notetype $c, $c7
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8, $c7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $c, $c7
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c7
	note D_, 1
	note __, 7
	intensity $c8
	intensity $c7
	octave 1
	note D_, 16
	intensity $c7
	note __, 16
	note __, 16
	note __, 16
	endchannel

.sub1:
	octave 2
	note C_, 4
	intensity $b1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	intensity $c7
	octave 2
	note C_, 1
	note __, 1
	note C_, 4
	note __, 12
	octave 1
	note B_, 4
	note __, 10
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 2
	note G_, 2
	octave 1
	note B_, 6
	note A#, 4
	intensity $b1
	octave 5
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 2
	note __, 2
	intensity $c7
	octave 1
	note A#, 1
	note __, 1
	note A#, 4
	note __, 12
	note A_, 4
	note __, 10
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 2
	note F_, 2
	octave 1
	note A_, 6
	note G#, 4
	intensity $b1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 5
	note C_, 2
	note __, 2
	intensity $c7
	octave 1
	note G#, 1
	note __, 1
	note G#, 4
	note __, 12
	note G_, 4
	note __, 10
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 2
	note E_, 2
	octave 1
	note G_, 6
	note F#, 4
	note __, 2
	note F#, 2
	note F#, 2
	octave 2
	note D_, 2
	octave 1
	note F#, 4
	note A_, 2
	octave 2
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 3
	note C_, 2
	endchannel

.sub2:
	octave 1
	note G_, 4
	note __, 4
	note G_, 2
	note __, 2
	octave 2
	note G_, 12
	note F#, 8
	endchannel

.sub3:
	octave 4
	note A_, 8
	note B_, 8
	octave 5
	note C_, 8
	note E_, 8
	notetype $c, $c7
	note D_, 16
	octave 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 5
	note D_, 4
	note C_, 10
	notetype $6, $c7
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	octave 4
	note B_, 4
	octave 5
	note C_, 4
	notetype $c, $c7
	octave 4
	note A_, 10
	notetype $6, $c7
	note G#, 1
	note A_, 3
	note B_, 4
	octave 5
	note C_, 4
	endchannel

Music_Credits_Ch3:
	vibrato $16, $23
	notetype $c, $34
	stereopanning $ff
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	intensity $24
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	intensity $14
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	note D_, 1
	notetype $6, $14
	note D#, 1
	note E_, 7
	note F_, 8
	callchannel .sub1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	notetype $6, $14
	intensity $24
	note F_, 1
	note E_, 1
	intensity $14
	note E_, 4
	note __, 4
	note F_, 4
	callchannel .sub1
	callchannel .sub2
	callchannel .sub3
	callchannel .sub4
	octave 2
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note G_, 2
	octave 2
	note E_, 4
	note __, 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 4
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	note E_, 2
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	note G_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G_, 2
	note F#, 4
	octave 3
	note E_, 4
	callchannel .sub3
	callchannel .sub4
	callchannel .sub5
	octave 5
	note D#, 1
	note E_, 7
	note F_, 8
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 2
	note __, 2
	octave 5
	note F_, 1
	note F#, 7
	note G_, 8
	pitchoffset 0, D_
	callchannel .sub1
	callchannel .sub2
	pitchoffset 1, D_
	callchannel .sub3
	pitchoffset 0, D_
	callchannel .sub4
	callchannel .sub5
	pitchoffset 0, C_
	octave 6
	note C#, 2
	octave 5
	note A_, 2
	note E_, 2
	note C#, 2
	note A_, 2
	note E_, 2
	notetype $8, $14
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c, $14
	note D_, 16
	note F#, 16
	note G_, 16
	note G_, 8
	note A_, 8
	note __, 4
	octave 4
	note F#, 4
	note G_, 4
	note G#, 4
	note A_, 4
	octave 5
	note C#, 4
	note A_, 4
	note G_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 6
	note C#, 4
	note E_, 4
	intensity $15
	octave 4
	note D_, 6
	note F#, 2
	note A_, 8
	note E_, 6
	note G_, 2
	octave 5
	note C_, 6
	octave 4
	note B_, 1
	note A#, 1
	note A_, 8
	intensity $14
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $8, $14
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 5
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $14
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $14
	note A_, 1
	note __, 16
	note __, 16
	note __, 16
	endchannel

.sub1:
	note G_, 16
	octave 6
	note C#, 1
	note D_, 3
	note C_, 4
	octave 5
	note B_, 4
	octave 6
	note C_, 4
	notetype $c, $14
	octave 5
	note G_, 10
	note E_, 2
	note __, 2
	note F_, 2
	note G_, 10
	notetype $6, $14
	note G#, 1
	note A_, 7
	note E_, 4
	note G_, 12
	note F_, 8
	note D_, 4
	note __, 4
	note E_, 4
	notetype $c, $14
	note F_, 10
	notetype $6, $14
	note F#, 1
	note G_, 7
	note F_, 4
	note E_, 4
	note D#, 4
	note E_, 4
	note B_, 12
	note A_, 8
	notetype $c, $14
	note D_, 16
	endchannel

.sub2:
	notetype $6, $14
	note F#, 1
	note G_, 3
	octave 4
	note G_, 4
	octave 5
	note D_, 4
	note G_, 12
	note G#, 8
	endchannel

.sub3:
	octave 3
	note F_, 4
	note __, 2
	note F_, 2
	note __, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 4
	note G_, 4
	note __, 2
	note G_, 2
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 4
	note E_, 4
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note G_, 2
	note E_, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	note E_, 4
	note A_, 4
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note __, 2
	note G#, 2
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	endchannel

.sub4:
	octave 2
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 4
	note A_, 2
	octave 3
	note C_, 2
	note E_, 2
	note F_, 2
	endchannel

.sub5:
	octave 2
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 4
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note F#, 2
	note G_, 8
	octave 4
	note C_, 8
	note D_, 8
	note F_, 8
	octave 6
	note G_, 2
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	octave 6
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	note D_, 2
	endchannel

Music_Credits_Ch4:
	togglenoise $3
	notetype $c
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note A#, 4
	note A#, 4
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
.loop1:
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, .loop1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
.loop2:
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, .loop2
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note A#, 4
	note C#, 4
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note B_, 2
	note A#, 4
	note A#, 4
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
.loop3:
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, .loop3
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 7
	notetype $8
	note A#, 1
	note A#, 1
	note A#, 1
	notetype $c
	note B_, 16
	note __, 16
	note B_, 15
	note __, 1
	note B_, 8
	note B_, 8
	note B_, 16
	note __, 16
	note B_, 16
	note B_, 8
	note B_, 6
	note D_, 1
	note D_, 1
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	notetype $c
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8
	note C#, 2
	note C#, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	notetype $8
	note C#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 7
	note A#, 8
	note __, 16
	note __, 16
	note __, 16
	endchannel

.sub1:
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 2
	endchannel

.sub2:
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note A#, 1
	note D_, 1
	endchannel
