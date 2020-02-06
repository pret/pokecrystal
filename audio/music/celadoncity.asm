INCLUDE "constants/music_common.inc"


SECTION "audio/music/celadoncity.asm", ROMX

Music_CeladonCity::
	musicheader 3, 1, Music_CeladonCity_Ch1
	musicheader 1, 2, Music_CeladonCity_Ch2
	musicheader 1, 3, Music_CeladonCity_Ch3

Music_CeladonCity_Ch1:
	tempo 146
	volume $77
	tone $0001
.mainloop:
	stereopanning $f
	notetype $c, $a6
	octave 3
	note A_, 7
	intensity $a1
	note G#, 1
	note A_, 1
	note D_, 3
	note E_, 2
	note F#, 2
	callchannel .sub1
.loop1:
	note D_, 2
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	loopchannel 3, .loop1
	note D_, 2
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	callchannel .sub1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 16
	callchannel .sub2
	callchannel .sub3
	octave 2
	note B_, 2
	note A#, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	callchannel .sub2
	callchannel .sub3
	note D_, 2
	note C#, 1
	note D_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 8
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	note D_, 2
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	loopchannel 3, .sub1loop1
	note D_, 2
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note A_, 1
	endchannel

.sub2:
.sub2loop1
	octave 2
	note G_, 2
	note B_, 1
	octave 3
	note D_, 1
	loopchannel 4, .sub2loop1
	note C_, 2
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note B_, 1
	endchannel

.sub3:
.sub3loop1:
	note D_, 2
	note F#, 1
	note A_, 1
	loopchannel 4, .sub3loop1
	endchannel

Music_CeladonCity_Ch2:
	vibrato $12, $34
	dutycycle $2
	stereopanning $f0
	notetype $c, $b7
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 8
.mainloop:
	callchannel .sub1
	note A_, 4
	note F#, 4
	note A_, 2
	note F#, 6
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 2
	note B_, 2
	note G_, 4
	note B_, 4
	callchannel .sub1
	intensity $c1
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	intensity $b3
	octave 5
	note D_, 6
	intensity $a2
	octave 1
	note F#, 2
	callchannel .sub2
	octave 1
	note G_, 3
	note B_, 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 6
	note F#, 2
	callchannel .sub2
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note A_, 4
	note D_, 6
	intensity $97
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 16
	loopchannel 0, .mainloop

.sub1:
	intensity $b2
	octave 4
	note B_, 4
	note G_, 4
	note B_, 2
	note G_, 6
	note B_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A_, 8
	endchannel

.sub2:
	note G_, 3
	note B_, 1
	octave 2
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note G_, 3
	octave 2
	note C_, 1
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note F#, 4
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note F#, 4
	endchannel

Music_CeladonCity_Ch3:
	vibrato $12, $24
.mainloop:
	notetype $c, $25
	octave 3
	note A_, 2
	note __, 2
	note F#, 2
	note __, 2
	note D_, 8
	callchannel .sub1
.loop1:
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note D_, 4
	loopchannel 3, .loop1
	octave 2
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note D_, 3
	octave 2
	note F#, 1
	callchannel .sub1
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 3
	note F#, 3
	octave 2
	note G#, 1
	note A_, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	note E_, 2
	note C#, 2
	note D_, 2
	note __, 6
	octave 2
	note A_, 2
	note __, 6
	intensity $10
	callchannel .sub2
	octave 5
	note E_, 2
	note __, 2
	note F#, 2
	note __, 2
	note D_, 4
	note __, 4
	note C_, 8
	octave 4
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	note __, 2
	note D_, 2
	note E_, 2
	note D_, 4
	note __, 4
	callchannel .sub2
	octave 5
	note E_, 2
	note __, 2
	note D_, 2
	note E_, 2
	note D_, 4
	note __, 4
	note C_, 8
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note __, 6
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note D_, 4
	loopchannel 3, .sub1loop1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note F#, 3
	octave 2
	note G#, 1
	endchannel

.sub2:
	octave 5
	note D_, 8
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	endchannel
