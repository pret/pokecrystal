Music_VioletCity: ; f0000
	dbw $c0, Music_VioletCity_Ch1
	dbw $01, Music_VioletCity_Ch2
	dbw $02, Music_VioletCity_Ch3
	dbw $03, Music_VioletCity_Ch4
; f000c


Music_VioletCity_Ch1: ; f000c
	tempo 164
	volume $77
	vibrato $12, $25
	dutycycle $2
	notetype $c, $95
	note __, 15
	stereopanning $f0
	octave 2
	note E_, 0
	note G#, 0
	note B_, 0
	stereopanning $ff
	octave 3
	note D#, 0
	note G#, 0
	note __, 0
	note A#, 3
	note G#, 1
	note F#, 1
	note C#, 1
	stereopanning $f
	octave 2
	note D#, 0
	note F#, 0
	note A#, 0
	stereopanning $ff
	octave 3
	note C#, 0
	note F#, 0
	note __, 0
	note D#, 3
	note G#, 1
	note D#, 1
	octave 2
	note G#, 1
	note C#, 0
	note E_, 0
	note G#, 0
	note B_, 0
	octave 3
	note G#, 0
	note __, 0
	octave 2
	note B_, 3
	notetype $6, $91
	octave 3
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note B_, 1
	intensity $a4
	octave 2
	note B_, 7
	note __, 3
	octave 3
	note C#, 11
	note __, 7

Music_VioletCity_branch_f0056: ; f0056
	notetype $6, $95
	note __, 3
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 3
	note D#, 1
	note E_, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	stereopanning $f0
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	note E_, 1
	octave 4
	note C#, 1
	stereopanning $ff
	note C_, 1
	octave 3
	note G#, 1
	note E_, 1
	octave 4
	note C_, 1
	stereopanning $f
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A#, 7
	stereopanning $ff
	note __, 3
	note C#, 1
	note E_, 1
	note A#, 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	stereopanning $f
	note D#, 7
	stereopanning $ff
	note E_, 7
	stereopanning $f0
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 3
	stereopanning $ff
	note G#, 1
	note D#, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note D#, 0
	note __, 0
	note B_, 3
	note G#, 1
	note G#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note D#, 3
	note F#, 1
	note __, 1
	notetype $c, $95
	note __, 7
	octave 4
	note F_, 2
	dutycycle $1
	notetype $6, $75
	note G#, 0
	note B_, 0
	octave 5
	note D#, 7
	notetype $c, $93
	dutycycle $2
	note __, 15
	notetype $6, $91
	stereopanning $f0
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	note G#, 1
	octave 3
	note E_, 1
	stereopanning $f
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note E_, 1
	intensity $a4
	stereopanning $ff
	note D#, 7
	note __, 7
	dutycycle $3
	intensity $84
	note __, 3
	note G_, 1
	note A_, 1
	note B_, 3
	octave 4
	note D_, 3
	note C#, 3
	notetype $8, $84
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	note A_, 2
	notetype $c, $84
	note F#, 0
	note __, 0
	note F#, 1
	note C#, 0
	note __, 0
	note F#, 1
	note D_, 3
	note E_, 3
	note F#, 1
	note B_, 0
	note __, 0
	note B_, 0
	octave 4
	note C#, 0
	note D_, 1
	note F#, 1
	note E_, 1
	notetype $8, $84
	note D_, 0
	note E_, 0
	note D_, 0
	note C#, 2
	notetype $c, $84
	octave 3
	note B_, 0
	note __, 0
	note A_, 1
	note F#, 0
	note __, 0
	note A_, 1
	octave 4
	note E_, 3
	note D_, 3
	note C#, 1
	note G#, 0
	note E_, 0
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note G#, 0
	note __, 0
	note G#, 0
	note A#, 0
	note B_, 3
	note __, 3
	note G#, 0
	note F_, 0
	octave 3
	note B_, 0
	octave 4
	note F_, 0
	note G#, 0
	note __, 0
	note G#, 0
	note A#, 0
	note B_, 3
	note __, 3
	note C#, 0
	octave 3
	note B_, 0
	note F#, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	note F#, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	note F#, 0
	note C#, 0
	note F#, 0
	note A#, 0
	octave 4
	note C#, 0
	note F#, 0
	note A#, 0
	octave 5
	note C#, 0
	dutycycle $2
	octave 4
	note C#, 5
	note C_, 0
	octave 3
	note B_, 0
	octave 4
	note C#, 3
	note __, 3
	loopchannel 0, Music_VioletCity_branch_f0056

Music_VioletCity_Ch2: ; f0162
	vibrato $12, $24
	dutycycle $2
	notetype $c, $c7
	note __, 15
	octave 3
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 4
	note D#, 3
	note C#, 1
	octave 3
	note A#, 1
	note G#, 1
	note F#, 0
	note __, 0
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A#, 1
	note B_, 1
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	note B_, 0
	note __, 0
	note G#, 3
	note A#, 1
	note B_, 1
	octave 4
	note C#, 1
	note D#, 1
	octave 3
	note F#, 1
	octave 4
	note D#, 0
	note __, 0
	note C#, 5
	note __, 1
	note D#, 0
	note E_, 0

Music_VioletCity_branch_f0199: ; f0199
	intensity $b7
	note F#, 3
	note __, 1
	note F#, 0
	note G#, 0
	note F#, 0
	note __, 0
	note E_, 0
	note __, 0
	note D#, 0
	note __, 0
	note F#, 0
	note __, 0
	note E_, 13
	note C#, 0
	note D#, 0
	note E_, 3
	note __, 1
	note E_, 0
	note F#, 0
	note E_, 0
	note __, 0
	note D#, 0
	note __, 0
	note C#, 0
	note __, 0
	note E_, 0
	note __, 0
	note D#, 11
	note __, 1
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	note D#, 3
	note __, 1
	note D#, 0
	note E_, 0
	note D#, 0
	note __, 0
	note C#, 0
	note __, 0
	octave 3
	note B_, 1
	octave 4
	note C#, 0
	note __, 0
	note D#, 3
	note G#, 3
	note B_, 2
	note __, 2
	note C#, 0
	note D#, 0
	note E_, 1
	octave 3
	note G#, 1
	note B_, 1
	octave 4
	note E_, 1
	note D#, 0
	octave 3
	note F#, 0
	note B_, 0
	octave 4
	note D#, 0
	note C#, 0
	octave 3
	note E_, 0
	note A#, 0
	octave 4
	note C#, 0
	octave 3
	note B_, 11
	note __, 3
	intensity $a7
	dutycycle $3
	note __, 1
	note B_, 0
	octave 4
	note C#, 0
	note D_, 1
	note F#, 1
	note E_, 1
	notetype $8, $a7
	note D_, 0
	note E_, 0
	note D_, 0
	note C#, 2
	notetype $c, $a7
	octave 3
	note B_, 0
	note __, 0
	note A_, 1
	note F#, 0
	note __, 0
	note A_, 1
	octave 4
	note E_, 3
	note D_, 3
	note C#, 1
	note __, 1
	note G_, 0
	note A_, 0
	note B_, 1
	octave 5
	note D_, 1
	note C#, 1
	notetype $8, $a7
	octave 4
	note B_, 0
	octave 5
	note C#, 0
	octave 4
	note B_, 0
	note A_, 2
	notetype $c, $a7
	note G_, 0
	note __, 0
	note F#, 1
	note C#, 0
	note __, 0
	note F#, 1
	vibrato $0, $0
	intensity $87
	octave 5
	note E_, 3
	note F#, 3
	note D_, 0
	note E_, 0
	note F#, 11
	note __, 1
	note D_, 0
	note E_, 0
	note F#, 11
	note __, 1
	octave 4
	note A#, 0
	note B_, 0
	octave 5
	note C#, 10
	note __, 4
	vibrato $12, $24
	intensity $a7
	dutycycle $2
	octave 4
	note A#, 5
	note A_, 0
	note G#, 0
	note F#, 3
	note __, 1
	note D#, 0
	note E_, 0
	loopchannel 0, Music_VioletCity_branch_f0199

Music_VioletCity_Ch3: ; f0247
	notetype $c, $25
	note __, 15
	note __, 5
	octave 4
	note E_, 3
	note __, 5
	note __, 5
	octave 3
	note G#, 3
	note __, 5
	note __, 5
	note F_, 3
	note __, 5
	octave 2
	note F#, 3
	octave 3
	note C#, 0
	note __, 0
	note A#, 3
	note A_, 0
	note G#, 0
	note F#, 1
	octave 2
	note A#, 1

Music_VioletCity_branch_f0261: ; f0261
	notetype $c, $25
	note B_, 0
	note __, 4
	note B_, 0
	note B_, 0
	note __, 1
	note B_, 0
	note __, 0
	octave 3
	note F#, 1
	octave 2
	note F#, 0
	note __, 0
	octave 3
	note C#, 0
	note __, 4
	note C#, 0
	note C#, 0
	note __, 1
	note C#, 0
	note __, 0
	note G#, 1
	octave 2
	note G#, 0
	note __, 0
	note F#, 0
	note __, 4
	note F#, 0
	note F#, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	octave 3
	note F#, 1
	note C#, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 4
	note B_, 0
	note B_, 0
	note __, 1
	note B_, 0
	note __, 0
	octave 3
	note B_, 3
	note G#, 0
	note __, 4
	note G#, 0
	note G#, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 1
	note F#, 0
	note __, 0
	notetype $6, $25
	octave 3
	note C#, 1
	note F_, 1
	note G#, 1
	note B_, 1
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	note B_, 1
	octave 4
	note C#, 5
	notetype $c, $25
	note __, 4
	notetype $6, $25
	octave 2
	note E_, 1
	note __, 9
	note E_, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note C#, 3
	note C_, 3
	octave 2
	note B_, 1
	note __, 9
	note B_, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note A_, 7
	callchannel Music_VioletCity_branch_f0311
	note F#, 1
	note __, 9
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 1
	note A#, 7
	note A_, 1
	note __, 1
	callchannel Music_VioletCity_branch_f0311
	note F#, 1
	note __, 9
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 1
	note A#, 7
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 9
	note E_, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note B_, 3
	note G#, 1
	note F#, 1
	note F_, 1
	note __, 9
	note F_, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	octave 4
	note C#, 3
	octave 3
	note A#, 1
	note G#, 1
	note F#, 1
	note __, 9
	note F#, 1
	note F#, 1
	octave 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 3
	octave 2
	note F#, 1
	note G#, 1
	octave 3
	note F#, 11
	note G#, 1
	note A_, 1
	note A#, 7
	note __, 3
	octave 2
	note A#, 3
	loopchannel 0, Music_VioletCity_branch_f0261
; f0311

Music_VioletCity_branch_f0311: ; f0311
	note G_, 1
	note __, 9
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note E_, 3
	octave 2
	note A_, 3
	endchannel

Music_VioletCity_Ch4: ; f031e
	togglenoise $3
	notetype $c
	note D#, 1
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 1
	note D_, 3
	note F#, 3
	callchannel Music_VioletCity_branch_f036c
	callchannel Music_VioletCity_branch_f036c
	callchannel Music_VioletCity_branch_f036c
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 1
	note C_, 7
	note D#, 1

Music_VioletCity_branch_f0338: ; f0338
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	loopchannel 0, Music_VioletCity_branch_f0338
; f036c

Music_VioletCity_branch_f036c: ; f036c
	note D_, 0
	note D_, 0
	note D#, 0
	note D#, 0
	note D_, 1
	note G_, 1
	note G_, 0
	note G_, 0
	note F#, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	endchannel
; f037a

Music_VioletCity_branch_f037a: ; f037a
	note D#, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note D#, 0
	note D#, 0
	note __, 1
	note D#, 1
	note D_, 1
	note D#, 1
	endchannel
; f0386
