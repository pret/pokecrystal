INCLUDE "constants/music_common.inc"
INCLUDE "constants/floating_constants.inc"


SECTION "audio/music/lookrocket.asm", ROMX, BANK[BANK_MUSIC_ROCKET_ENCOUNTER]

Music_LookRocket::
	musicheader 4, 1, Music_LookRocket_Ch1
	musicheader 1, 2, Music_LookRocket_Ch2
	musicheader 1, 3, Music_LookRocket_Ch3
	musicheader 1, 4, Music_LookRocket_Ch4

Music_LookRocket_Ch1:
	tempo 123
	volume $77
	pitchoffset 0, D_
	stereopanning $f
	dutycycle $3
	vibrato $5, $64
	notetype $c, $a8
	octave 4
	note C_, 1
	note D_, 1
	callchannel .sub1
	dutycycle $1
.mainloop:
	intensity $a8
	callchannel .sub2
	callchannel Music_LookRocket_Ch2.sub5
	octave 4
	note F#, 1
	note __, 1
	intensity $53
	callchannel .sub3
	intensity $c3
	callchannel .sub3
	intensity $e3
	callchannel .sub3
	note __, 16
	loopchannel 0, .mainloop

.sub1::
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 2
	note F_, 1
	note G#, 1
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	endchannel

.sub2::
	note __, 2
	octave 3
	note D#, 1
	note __, 5
	note D#, 4
	octave 2
	note A_, 2
	octave 3
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	note __, 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	endchannel

.sub3::
	note __, 2
	octave 2
	note B_, 1
	note __, 7
	octave 3
	note C_, 1
	note __, 5
	endchannel

Music_LookRocket_Ch2:
	pitchoffset 0, D_
	vibrato $4, $64
	dutycycle $3
	notetype $c, $b7
	stereopanning $ff
	octave 5
	note C_, 1
	note D_, 1
	callchannel .sub1
.mainloop:
	intensity $b7
	callchannel .sub5
	octave 5
	note C_, 1
	note __, 1
	callchannel .sub2
	intensity $53
	callchannel .sub3
	intensity $c3
	callchannel .sub3
	intensity $e3
	callchannel .sub3
	callchannel .sub4
	loopchannel 0, .mainloop

.sub1::
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 3
	note B_, 6
	dutycycle $0
	endchannel

.sub2::
	note __, 2
	octave 4
	note D#, 1
	note __, 5
	note F_, 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	note __, 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 5
	note D#, 1
	note __, 1
	endchannel

.sub3::
	note __, 2
	octave 3
	note F_, 1
	note __, 7
	note F#, 1
	note __, 5
	endchannel

.sub4::
	intensity $63
	note G#, 1
	note F_, 1
	note D_, 1
	octave 2
	note B_, 1
	intensity $a3
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	intensity $c3
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	intensity $f3
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	endchannel

.sub5::
	octave 3
	note __, 2
	note G_, 1
	note __, 5
	note A_, 8
	note A#, 6
	note A_, 1
	note __, 3
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel

Music_LookRocket_Ch3:
	pitchoffset 0, D_
	vibrato $4, $22
	notetype $c, $14
	stereopanning $f0
	note __, 2
	callchannel .sub1
.mainloop:
	callchannel .sub4
	callchannel .sub4
	intensity $24
	callchannel .sub5
	intensity $14
	callchannel .sub2
	callchannel .sub5
	callchannel .sub3
	loopchannel 0, .mainloop

.sub1::
	octave 3
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 3
	octave 3
	note D_, 6
	endchannel

.sub2::
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F#, 1
	note __, 1
	endchannel

.sub3::
	intensity $24
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	intensity $14
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	endchannel

.sub4::
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
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
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
	note C_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel

.sub5::
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	note G#, 1
	note F#, 1
	note D#, 1
	note C_, 1
	endchannel

Music_LookRocket_Ch4:
	togglenoise $3
	notetype $c
	note __, 2
	callchannel .sub1
.mainloop:
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub2
	callchannel .sub1
	loopchannel 0, .mainloop

.sub1::
	note C_, 8
	note D_, 2
	note D#, 2
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	endchannel

.sub2::
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	endchannel
