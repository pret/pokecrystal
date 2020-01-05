Music_BuenasPassword:
	musicheader 4, 1, Music_BuenasPassword_Ch1
	musicheader 1, 2, Music_BuenasPassword_Ch2
	musicheader 1, 3, Music_BuenasPassword_Ch3
	musicheader 1, 4, Music_BuenasPassword_Ch4

Music_BuenasPassword_Ch1:
	tempo 136
	volume $77
	tone $0001
	notetype $c, $b3
	note __, 8
.mainloop:
	stereopanning $ff
	note __, 16
	note __, 16
	dutycycle $3
	notetype $6, $97
	stereopanning $f
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 2
	note G#, 2
	note __, 10
	note __, 10
	stereopanning $f0
	note C#, 2
	note F_, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 2
	note G#, 2
	note __, 12
	dutycycle $2
	callchannel .sub1
	stereopanning $ff
	callchannel Music_BuenasPassword_Ch2.sub3
	callchannel .sub2
	callchannel .sub1
	stereopanning $ff
	callchannel Music_BuenasPassword_Ch2.sub3
	callchannel .sub2
	callchannel .sub1
	dutycycle $1
	note C#, 2
	note __, 2
	note D#, 2
	note __, 2
	note F#, 2
	note __, 1
	note G#, 2
	note __, 1
	note A#, 2
	note B_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 2
	note __, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note A#, 2
	note G#, 2
	note G_, 1
	note D#, 3
	note C#, 2
	octave 2
	note B_, 2
	note A#, 1
	note G#, 3
	note A#, 2
	note G_, 2
	note A#, 1
	octave 3
	note C#, 3
	note D#, 2
	note C#, 2
	note D#, 1
	note G_, 3
	note B_, 2
	note __, 2
	note A#, 2
	note __, 2
	note G#, 2
	note __, 1
	note F#, 2
	note __, 1
	note D#, 2
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 2
	note __, 2
	note G#, 2
	octave 4
	note C#, 2
	note F_, 2
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note F#, 3
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note G#, 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note D#, 2
	note F#, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	loopchannel 0, .mainloop

.sub1:
	stereopanning $f
	notetype $6, $84
	octave 4
	note D#, 2
	intensity $71
	note C#, 1
	note C_, 1
	intensity $51
	octave 3
	note A#, 1
	note G#, 1
	intensity $31
	note G_, 1
	note F_, 1
	intensity $11
	note D#, 1
	note C#, 1
	note C_, 1
	note __, 1
	notetype $c, $84
	endchannel

.sub2:
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 2
	endchannel

Music_BuenasPassword_Ch2:
	vibrato $12, $34
	dutycycle $2
	notetype $c, $a5
	note __, 7
	octave 3
	note F#, 1
.mainloop:
	stereopanning $ff
	callchannel .sub3
	callchannel .sub1
	stereopanning $ff
	callchannel .sub2
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 16
	callchannel .sub1
	stereopanning $ff
	callchannel .sub2
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 16
	callchannel .sub1
	note F#, 2
	note __, 2
	note G#, 2
	note __, 2
	note A#, 2
	note __, 1
	note B_, 2
	note __, 1
	octave 4
	note C#, 2
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 2
	note __, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note D#, 14
	note C#, 1
	note D#, 1
	note C#, 6
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 8
	note F#, 2
	note __, 2
	note F_, 2
	note __, 2
	note D#, 2
	note __, 1
	note C#, 2
	note __, 1
	octave 3
	note B_, 2
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 2
	note __, 2
	octave 4
	note C#, 2
	note F_, 2
	note G#, 2
	note B_, 14
	note A#, 1
	note B_, 1
	note G#, 10
	intensity $84
	octave 2
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	intensity $a5
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 2
	stereopanning $f0
	octave 4
	note G#, 1
	notetype $6, $81
	note G_, 1
	note F_, 1
	intensity $71
	note D#, 1
	note C#, 1
	intensity $61
	note C_, 1
	octave 3
	note A#, 1
	intensity $41
	note G#, 1
	intensity $21
	note G_, 1
	note F_, 1
	note __, 1
	notetype $c, $a5
	endchannel

.sub2:
	octave 4
	note G#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F_, 2
	note __, 1
	note D#, 2
	note __, 1
	note C#, 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note D#, 2
	note __, 2
	endchannel

.sub3:
	octave 3
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note B_, 1
	note G#, 3
	octave 3
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note B_, 1
	note G#, 2
	octave 3
	note F#, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note B_, 1
	note G#, 3
	endchannel

Music_BuenasPassword_Ch3:
	notetype $c, $14
	note __, 8
.mainloop:
.loop1:
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note G#, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	note __, 2
	note B_, 1
	note __, 1
	note G#, 4
	loopchannel 3, .loop1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note C#, 1
	octave 2
	note F#, 1
	note __, 1
	note A#, 2
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note F#, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note D#, 1
	note __, 1
	note A#, 1
	note D#, 1
	note __, 1
	note G#, 2
	note A#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note D#, 1
	note __, 1
	note A#, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note D#, 1
	note __, 1
	note G_, 2
	callchannel .sub2
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 1
	note C#, 1
	note __, 1
	note G#, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note C#, 2
	callchannel .sub2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note G#, 2
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	loopchannel 0, .mainloop

.sub1:
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note G#, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	octave 3
	note C#, 1
	note __, 1
	note B_, 1
	note __, 1
	note C#, 1
	note F_, 2
	note C#, 1
	endchannel

.sub2:
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	octave 2
	note G#, 1
	note __, 1
	note B_, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 2
	endchannel

Music_BuenasPassword_Ch4:
	togglenoise $3
	notetype $c
	note D#, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
.mainloop:
.loop1:
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub2
	loopchannel 4, .loop1
	callchannel .sub1
	callchannel .sub1
	callchannel .sub1
	stereopanning $ff
	note D#, 2
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D_, 2
	stereopanning $f
	note G_, 1
	note G_, 1
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	loopchannel 0, .mainloop

.sub1:
	stereopanning $ff
	note D#, 2
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D_, 2
	stereopanning $f
	note G_, 1
	note G_, 1
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D#, 2
	note D_, 2
	stereopanning $f
	note G_, 2
	endchannel

.sub2:
	stereopanning $ff
	note D#, 2
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D_, 2
	stereopanning $f
	note G_, 1
	note G_, 1
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D#, 2
	note D_, 2
	note D_, 1
	note D_, 1
	endchannel
