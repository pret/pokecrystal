INCLUDE "constants/music_common.inc"
INCLUDE "constants/floating_constants.inc"


SECTION "audio/music/rockettheme.asm", ROMX, BANK[BANK_MUSIC_ROCKET_ENCOUNTER]

Music_RocketTheme::
	musicheader 4, 1, Music_RocketTheme_Ch1
	musicheader 1, 2, Music_RocketTheme_Ch2
	musicheader 1, 3, Music_RocketTheme_Ch3
	musicheader 1, 4, Music_RocketTheme_Ch4

Music_RocketTheme_Ch1:
	tempo 128
	volume $77
	dutycycle $3
	stereopanning $f
	vibrato $5, $64
	notetype $c, $a8
	octave 4
	note C_, 1
	note D_, 1
.mainloop:
	dutycycle $3
	notetype $c, $a8
	callchannel Music_LookRocket_Ch1.sub1
	dutycycle $1
	intensity $a8
	callchannel Music_LookRocket_Ch1.sub2
	callchannel Music_LookRocket_Ch2.sub5
	octave 4
	note F#, 1
	note __, 1
	intensity $53
	callchannel Music_LookRocket_Ch1.sub3
	intensity $c3
	callchannel Music_LookRocket_Ch1.sub3
	intensity $e3
	callchannel Music_LookRocket_Ch1.sub3
	note __, 16
	dutycycle $0
	notetype $6, $b3
	vibrato $6, $64
	callchannel .sub1
	octave 4
	note F_, 1
	note F#, 3
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	note __, 4
	note D_, 4
	note __, 4
	note D#, 4
	note __, 4
	note D#, 2
	note F#, 2
	callchannel .sub1
	octave 3
	note F#, 1
	note G_, 3
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note C_, 2
	octave 2
	note A#, 2
	note G_, 2
	note A#, 2
	octave 3
	note C_, 2
	note __, 4
	note D_, 4
	note __, 4
	note D#, 4
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
.loop1:
	note __, 4
	note F_, 2
	note __, 14
	note F#, 2
	note __, 10
	loopchannel 3, .loop1
	note __, 4
	note F_, 2
	note __, 14
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note D#, 2
	note C_, 2
.loop2:
	note F#, 2
	note A_, 2
	loopchannel 4, .loop2
.loop3:
	note G_, 2
	note A#, 2
	loopchannel 4, .loop3
.loop4:
	note G#, 2
	note B_, 2
	loopchannel 4, .loop4
.loop5:
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	loopchannel 4, .loop5
	notetype $c, $b3
	note __, 16
	note __, 12
	note F_, 2
	note C_, 1
	note D_, 1
	loopchannel 0, .mainloop

.sub1:
	note __, 7
	note B_, 1
	octave 4
	note C_, 2
	note __, 6
	note C_, 2
	note __, 2
	octave 3
	note G_, 2
	note __, 6
	octave 4
	note D#, 12
	note D_, 8
	octave 3
	note A#, 2
	note __, 6
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A#, 2
	note __, 10
	endchannel

Music_RocketTheme_Ch2:
	stereopanning $ff
	vibrato $4, $64
	dutycycle $3
	notetype $c, $b7
	octave 5
	note C_, 1
	note D_, 1
.mainloop:
	notetype $c, $b7
	callchannel Music_LookRocket_Ch2.sub1
	intensity $b7
	callchannel Music_LookRocket_Ch2.sub5
	octave 5
	note C_, 1
	note __, 1
	callchannel Music_LookRocket_Ch2.sub2
	intensity $53
	callchannel Music_LookRocket_Ch2.sub3
	intensity $c3
	callchannel Music_LookRocket_Ch2.sub3
	intensity $e3
	callchannel Music_LookRocket_Ch2.sub3
	callchannel Music_LookRocket_Ch2.sub4
	vibrato $6, $64
	callchannel .sub1
	octave 4
	note A_, 1
	vibrato $0, $0
	intensity $b8
	note A#, 14
	vibrato $5, $22
	intensity $b7
	note A#, 5
	vibrato $6, $64
	notetype $c, $b7
	note A#, 12
	note __, 2
	octave 5
	note C_, 1
	note D_, 1
	callchannel .sub1
	note B_, 1
	vibrato $0, $0
	intensity $b8
	octave 4
	note C_, 14
	vibrato $5, $22
	intensity $b7
	note C_, 5
	vibrato $6, $64
	notetype $c, $b7
	note C_, 12
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	notetype $6, $b7
	callchannel .sub2
	octave 4
	note D_, 1
	note D#, 9
	note D_, 1
	note C#, 1
	note C_, 12
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	callchannel .sub2
	octave 3
	note B_, 2
	note __, 2
	octave 4
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 8
	note __, 4
	note D_, 2
	note __, 2
	note C_, 2
	octave 3
	note G_, 2
	note B_, 1
	octave 4
	note C_, 15
	note C#, 16
	note D_, 16
	note D#, 16
	note E_, 2
	note C#, 2
	octave 3
	note A#, 2
	note G_, 2
	octave 4
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G#, 2
	octave 4
	note F#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note G_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note G#, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D#, 2
	note C_, 2
	note A#, 2
	note G_, 2
	note E_, 2
	note C#, 2
	note B_, 4
	octave 5
	note C_, 2
	note D_, 2
	loopchannel 0, .mainloop

.sub1:
	notetype $6, $b7
	note __, 7
	octave 4
	note D_, 1
	note D#, 2
	note __, 6
	note D#, 2
	note __, 2
	note C_, 2
	note __, 6
	note F#, 12
	note F_, 8
	note D#, 2
	note __, 6
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	endchannel

.sub2:
	octave 3
	note B_, 1
	octave 4
	note C_, 3
	note D#, 4
	note C_, 4
	note F#, 8
	note F_, 8
	note C_, 4
	endchannel

Music_RocketTheme_Ch3:
	stereopanning $f0
	vibrato $4, $22
	notetype $c, $14
	note __, 2
.mainloop:
	notetype $c, $14
	callchannel Music_LookRocket_Ch3.sub1
	callchannel Music_LookRocket_Ch3.sub4
	callchannel Music_LookRocket_Ch3.sub4
	intensity $24
	callchannel Music_LookRocket_Ch3.sub5
	intensity $14
	callchannel Music_LookRocket_Ch3.sub2
	callchannel Music_LookRocket_Ch3.sub5
	callchannel Music_LookRocket_Ch3.sub3
	callchannel Music_LookRocket_Ch3.sub4
	callchannel Music_LookRocket_Ch3.sub4
	callchannel Music_LookRocket_Ch3.sub4
	callchannel Music_LookRocket_Ch3.sub4
	callchannel Music_LookRocket_Ch3.sub5
	callchannel Music_LookRocket_Ch3.sub2
	callchannel Music_LookRocket_Ch3.sub5
	callchannel Music_LookRocket_Ch3.sub2
	octave 3
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note D_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note E_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 4
	note G#, 1
	note __, 1
	loopchannel 0, .mainloop

Music_RocketTheme_Ch4:
	togglenoise $3
	notetype $c
	note __, 2
.mainloop:
	callchannel Music_LookRocket_Ch4.sub1
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub1
.loop1:
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 11, .loop1
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub2
	callchannel Music_LookRocket_Ch4.sub1
	callchannel Music_LookRocket_Ch4.sub1
	loopchannel 0, .mainloop
