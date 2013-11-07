Music_MagnetTrain: ; ef5f0
	dbw $c0, Music_MagnetTrain_Ch1
	dbw $01, Music_MagnetTrain_Ch2
	dbw $02, Music_MagnetTrain_Ch3
	dbw $03, Music_MagnetTrain_Ch4
; ef5fc


Music_MagnetTrain_Ch1: ; ef5fc
	tempo 110
	volume $77
	stereopanning $f
	vibrato $14, $23
	dutycycle $2
	notetype $c, $b2
	note __, 15
	note __, 15
	intensity $b7
	octave 4
	note D_, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D_, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D_, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D_, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note E_, 0
	note C_, 0
	octave 3
	note A_, 0
	octave 4
	note C_, 0
	note E_, 0
	note C_, 0
	octave 3
	note A_, 0
	octave 4
	note C_, 0
	note E_, 0
	note C_, 0
	octave 3
	note A_, 0
	octave 4
	note C_, 0
	note E_, 0
	note C_, 0
	notetype $6, $b7
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	notetype $c, $b7
	note D_, 15
	endchannel

Music_MagnetTrain_Ch2: ; ef648
	vibrato $14, $23
	dutycycle $1
	notetype $c, $d2
	stereopanning $f0
	notetype $c, $d8
	octave 1
	note F_, 11
	note __, 1
	notetype $6, $d7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 2
	note F_, 3
	note __, 3
	note F_, 3
	note __, 3
	note F_, 3
	note __, 3
	note F_, 3
	note __, 3
	dutycycle $3
	notetype $c, $d7
	octave 4
	note G_, 15
	note A_, 12
	note __, 0
	notetype $6, $d7
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	notetype $c, $d7
	note A_, 15
	endchannel

Music_MagnetTrain_Ch3: ; ef67d
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $15
	octave 6
	note C_, 0
	octave 5
	note G_, 0
	note D#, 0
	note C_, 0
	note G_, 0
	note D#, 0
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note D#, 0
	note C_, 0
	octave 4
	note G_, 0
	note D#, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	note D#, 0
	note C_, 0
	note G_, 0
	note D#, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D#, 0
	note G_, 0
	note C_, 0
	note D#, 0
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note G_, 0
	octave 5
	note C_, 0
	note D#, 0
	note G_, 0
	note C_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 0
	octave 3
	note D_, 0
	octave 2
	note D_, 15
	endchannel

Music_MagnetTrain_Ch4: ; ef6f4
	togglenoise $3
	notetype $c
	note B_, 11
	note D_, 1
	note A#, 0
	note A#, 0
	notetype $6
	note D#, 3
	note F#, 3
	note D#, 3
	note F#, 3
	note A#, 3
	note F#, 3
	note A#, 3
	note D_, 1
	note D_, 1
	callchannel Music_MagnetTrain_branch_ef71e
	callchannel Music_MagnetTrain_branch_ef71e
	notetype $c
	note B_, 15
	endchannel
; ef711
	note G#, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note G_, 0
	endchannel
; ef71e

Music_MagnetTrain_branch_ef71e: ; ef71e
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	endchannel
; ef72f
