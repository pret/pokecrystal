Music_Route26: ; eefb2
	dbw $c0, Music_Route26_Ch1
	dbw $01, Music_Route26_Ch2
	dbw $02, Music_Route26_Ch3
	dbw $03, Music_Route26_Ch4
; eefbe


Music_Route26_Ch1: ; eefbe
	stereopanning $f
	vibrato $12, $23
	tempo 151
	volume $77
	vibrato $14, $23
	dutycycle $0
	notetype $c, $a7
	octave 3
	note D_, 3
	note __, 3
	note D#, 3
	note __, 3
	note F#, 3
	note __, 3
	note G#, 11
	notetype $8, $a7
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1

Music_Route26_branch_eefe0: ; eefe0
	dutycycle $0
	notetype $c, $a7
	octave 3
	note F_, 0
	note __, 1
	note C#, 0
	note F_, 2
	note G_, 0
	note G#, 0
	note __, 1
	note F_, 0
	octave 4
	note C#, 3
	note D#, 3
	octave 3
	note B_, 3
	note A_, 3
	note F#, 3
	note F_, 0
	note __, 0
	note C#, 0
	note F_, 0
	note G#, 2
	note G_, 0
	note G#, 0
	note __, 0
	note F_, 0
	note G#, 0
	octave 4
	note C#, 3
	note E_, 3
	note D#, 3
	octave 3
	note A_, 3
	note B_, 3
	note A#, 0
	note __, 0
	note F_, 0
	note A#, 0
	octave 4
	note C#, 0
	note __, 0
	octave 3
	note A#, 0
	octave 4
	note C#, 0
	note F_, 3
	note C#, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 0
	note A#, 3
	note __, 1
	notetype $6, $a7
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $8, $a5
	note G#, 1
	octave 4
	note C#, 1
	note D#, 1
	note G#, 5
	note F#, 5
	note D#, 5
	note C#, 5
	octave 3
	note A#, 5
	octave 4
	note C_, 5
	octave 3
	note G#, 5
	dutycycle $2
	notetype $c, $a5
	note A_, 2
	note G#, 2
	note F#, 3
	note C#, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note B_, 3
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note G#, 3
	note F#, 3
	note E_, 3
	note D#, 3
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note G#, 1
	note F_, 3
	note F#, 1
	notetype $6, $a5
	note G#, 6
	octave 4
	note C_, 0
	note C#, 7
	notetype $8, $a5
	octave 3
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 5
	notetype $6, $a5
	note __, 6
	octave 4
	note D#, 0
	note E_, 7
	notetype $8, $a5
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 5
	note __, 5
	notetype $c, $a5
	octave 2
	note B_, 0
	note F#, 0
	note B_, 0
	octave 3
	note E_, 0
	note F#, 0
	note E_, 0
	note F#, 0
	note B_, 0
	octave 4
	note E_, 0
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note F#, 0
	note B_, 0
	note F#, 0
	note E_, 0
	octave 3
	note B_, 0
	note F#, 3
	note D#, 3
	octave 2
	note B_, 3
	note __, 3
	loopchannel 0, Music_Route26_branch_eefe0

Music_Route26_Ch2: ; ef09d
	stereopanning $f0
	vibrato $14, $23
	dutycycle $2
	notetype $c, $c7
	octave 1
	note A#, 3
	note __, 1
	notetype $6, $c7
	note A#, 0
	note __, 0
	octave 2
	note A#, 0
	note __, 0
	octave 1
	note G#, 7
	note __, 3
	note G#, 0
	note __, 0
	octave 2
	note G#, 0
	note __, 0
	octave 1
	note F#, 7
	note __, 3
	note F#, 0
	note __, 0
	octave 2
	note F#, 0
	note __, 0
	notetype $c, $c7
	octave 1
	note G#, 11
	notetype $8, $c7
	note G#, 1
	octave 2
	note C_, 1
	note D#, 1

Music_Route26_branch_ef0ce: ; ef0ce
	dutycycle $2
	notetype $c, $c2
	octave 2
	note C#, 5
	note C#, 0
	note G#, 0
	note C#, 1
	note C#, 1
	note G#, 1
	note C#, 1
	octave 1
	note B_, 5
	note B_, 0
	octave 2
	note A_, 0
	octave 1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	callchannel Music_Route26_branch_ef14e
	note A_, 5
	note A_, 0
	octave 2
	note B_, 0
	notetype $8, $c2
	octave 1
	note B_, 1
	note B_, 1
	note B_, 1
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	notetype $c, $c2
	callchannel Music_Route26_branch_ef14e
	intensity $c7
	octave 2
	note F#, 3
	note __, 1
	notetype $6, $c2
	note F#, 1
	note F#, 1
	note F#, 3
	note F#, 3
	note D#, 3
	note D#, 3
	notetype $8, $c2

Music_Route26_branch_ef10e: ; ef10e
	octave 2
	note G#, 1
	note G#, 1
	note G#, 1
	octave 1
	note G#, 5
	loopchannel 3, Music_Route26_branch_ef10e
	octave 2
	note G#, 1
	note G#, 1
	note G#, 1
	notetype $c, $c7
	note F#, 0
	note D#, 0
	note C_, 0
	octave 1
	note G#, 0
	dutycycle $3
	octave 4
	note C#, 5
	note D#, 5
	note E_, 3
	note F#, 5
	note B_, 3
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 5
	note D#, 1
	note __, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note F_, 1
	note __, 1
	note F_, 1
	note F#, 5
	note G#, 3
	note A_, 7
	note __, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 7
	note __, 3
	note G#, 1
	note A_, 1
	note B_, 11
	note __, 3
	note D#, 11
	note D#, 0
	note C#, 0
	note C_, 0
	note D#, 0
	loopchannel 0, Music_Route26_branch_ef0ce
; ef14e

Music_Route26_branch_ef14e: ; ef14e
	note A#, 5
	note A#, 0
	octave 2
	note A#, 0
	octave 1
	note A#, 1
	note A#, 1
	octave 2
	note A#, 1
	octave 1
	note A#, 1
	endchannel

Music_Route26_Ch3: ; ef15a
	stereopanning $ff
	vibrato $12, $23
	notetype $c, $14
	vibrato $18, $23
	octave 4
	note A#, 3
	note __, 1
	notetype $6, $14
	note F_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 5
	note C_, 7
	note __, 3
	octave 4
	note G#, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	note C#, 7
	note __, 3
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note C#, 0
	note __, 0
	notetype $c, $14
	note D#, 11
	notetype $8, $14
	note F#, 1
	note F_, 1
	note D#, 1

Music_Route26_branch_ef18a: ; ef18a
	vibrato $18, $23
	notetype $c, $14
	octave 5
	note C#, 0
	note __, 1
	octave 4
	note G#, 0
	callchannel Music_Route26_branch_ef22f
	vibrato $25, $13
	note C#, 0
	note __, 0
	octave 4
	note G#, 0
	octave 5
	note C#, 0
	callchannel Music_Route26_branch_ef22f
	note F_, 0
	note __, 0
	note C#, 0
	note F_, 0
	note A#, 7
	note A#, 0
	note __, 0
	octave 6
	note C_, 0
	note __, 0
	note C#, 11
	note D#, 3
	note C#, 7
	note C_, 7
	octave 5
	note A#, 7
	octave 6
	note C_, 3
	note G#, 0
	note D#, 0
	note C_, 0
	octave 5
	note G#, 0
	intensity $15
	octave 2
	note A_, 0
	note __, 0
	note A_, 0
	note __, 2
	notetype $6, $15
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 5
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note A_, 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 5
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 9
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note F_, 1
	note __, 1
	note C#, 3
	octave 3
	note F#, 7
	notetype $8, $15
	octave 2
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 5
	note __, 5
	octave 4
	note C_, 5
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 5
	note __, 5
	notetype $c, $15
	octave 2
	note B_, 15
	note B_, 7
	octave 3
	note F#, 3
	note D#, 0
	note __, 0
	octave 2
	note G#, 0
	octave 3
	note C_, 0
	loopchannel 0, Music_Route26_branch_ef18a
; ef22f

Music_Route26_branch_ef22f: ; ef22f
	octave 5
	note F_, 7
	note C#, 1
	note F_, 1
	note G#, 3
	note F#, 3
	note C#, 3
	note D#, 3
	endchannel

Music_Route26_Ch4: ; ef238
	togglenoise $4
	notetype $c

Music_Route26_branch_ef23c: ; ef23c
	note B_, 5
	note D_, 0
	note D_, 0
	loopchannel 3, Music_Route26_branch_ef23c
	callchannel Music_Route26_branch_ef2b0

Music_Route26_branch_ef246: ; ef246
	notetype $6
	callchannel Music_Route26_branch_ef29a
	callchannel Music_Route26_branch_ef29a
	callchannel Music_Route26_branch_ef2a8
	note D_, 11
	note D_, 1
	note D_, 1
	notetype $8
	note D_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note E_, 1
	notetype $6
	callchannel Music_Route26_branch_ef29a
	callchannel Music_Route26_branch_ef29a
	notetype $8

Music_Route26_branch_ef266: ; ef266
	note D_, 1
	note D_, 1
	note D_, 1
	note B_, 5
	loopchannel 4, Music_Route26_branch_ef266
	notetype $6
	callchannel Music_Route26_branch_ef2a8
	callchannel Music_Route26_branch_ef2a8
	callchannel Music_Route26_branch_ef29a
	callchannel Music_Route26_branch_ef2a8

Music_Route26_branch_ef27c: ; ef27c
	notetype $6
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	note B_, 11
	loopchannel 2, Music_Route26_branch_ef27c
	notetype $c
	note B_, 15
	callchannel Music_Route26_branch_ef2b0
	loopchannel 0, Music_Route26_branch_ef246
; ef29a

Music_Route26_branch_ef29a: ; ef29a
	note E_, 11
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 3
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	endchannel
; ef2a8

Music_Route26_branch_ef2a8: ; ef2a8
	note E_, 11
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 3
	note E_, 3
	note D_, 3
	endchannel
; ef2b0

Music_Route26_branch_ef2b0: ; ef2b0
	notetype $6
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	notetype $8
	note D_, 1
	note D_, 1
	note E_, 1
	endchannel
; ef2d0
