Music_MagnetTrain: ; ef5f0
	dbw $c0, Music_MagnetTrain_Ch1
	dbw $01, Music_MagnetTrain_Ch2
	dbw $02, Music_MagnetTrain_Ch3
	dbw $03, Music_MagnetTrain_Ch4
; ef5fc

Music_MagnetTrain_Ch1: ; ef5fc
	tempo 110
	volume $7, $7
	stereopanning $f
	vibrato $14, $2, $3
	waveduty $2
	notetype $c, $b, $0, $2
	note __, 16
	note __, 16
	volenvelope $b, $0, $7
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	notetype $6, $b, $0, $7
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $b, $0, $7
	note D_, 16
	endchannel
; ef648

Music_MagnetTrain_Ch2: ; ef648
	vibrato $14, $2, $3
	waveduty $1
	notetype $c, $d, $0, $2
	stereopanning $f0
	notetype $c, $d, $1, $0
	octave 1
	note F_, 12
	note __, 2
	notetype $6, $d, $0, $7
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 2
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	note F_, 4
	note __, 4
	waveduty $3
	notetype $c, $d, $0, $7
	octave 4
	note G_, 16
	note A_, 13
	note __, 1
	notetype $6, $d, $0, $7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $c, $d, $0, $7
	note A_, 16
	endchannel
; ef67d

Music_MagnetTrain_Ch3: ; ef67d
	stereopanning $ff
	vibrato $10, $2, $3
	notetype $c, $1, $0, $5
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note D#, 1
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note D_, 16
	endchannel
; ef6f4

Music_MagnetTrain_Ch4: ; ef6f4
	drumkittoggle $3
	notetype $c
	note B_, 12
	note D_, 2
	note A#, 1
	note A#, 1
	notetype $6
	note D#, 4
	note F#, 4
	note D#, 4
	note F#, 4
	note A#, 4
	note F#, 4
	note A#, 4
	note D_, 2
	note D_, 2
	callchannel Music_MagnetTrain_branch_ef71e
	callchannel Music_MagnetTrain_branch_ef71e
	notetype $c
	note B_, 16
	endchannel
; ef711


INCBIN "baserom.gbc", $ef711, $ef71e - $ef711


Music_MagnetTrain_branch_ef71e: ; ef71e
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note G_, 2
	note G_, 2
	endchannel
; ef72f


