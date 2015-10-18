Music_GoldSilverOpening: ; f7055
	dbw $80, Music_GoldSilverOpening_Ch1
	dbw $01, Music_GoldSilverOpening_Ch2
	dbw $02, Music_GoldSilverOpening_Ch3
; f705e

Music_GoldSilverOpening_Ch1: ; f705e
	tempo 256
	volume $7, $7
	setpitchoffset $0001
	setwaveduty $2
	stereopanning $f0
	notetype $c, $b, $0, $7
	octave 1
	note G#, 16
	note G#, 16
	tempo 168
	setwaveduty $3
	notetype $6, $c, $0, $7
	octave 3
	note F_, 12
	note A_, 4
	octave 4
	note C_, 12
	octave 3
	note B_, 2
	note A#, 2
	note G_, 12
	note A#, 4
	octave 4
	note D#, 12
	note D_, 2
	note C#, 2
	notetype $6, $b, $0, $5
	note C_, 8
	octave 3
	note F_, 8
	note A_, 8
	note B_, 4
	octave 4
	note C_, 4
	notetype $6, $b, $0, $3
	octave 3
	note A#, 8
	note C#, 8
	octave 2
	note F#, 8
	octave 1
	note B_, 8
	notetype $6, $b, $0, $2
	note __, 4
	octave 3
	note A#, 4
	note A#, 8
	note G#, 4
	note G#, 8
	note G_, 4
	note G_, 8
	note F#, 4
	note F#, 8
	octave 2
	note A_, 4
	note A_, 8
	note G#, 4
	note G#, 8
	note G_, 4
	note G_, 8
	note F#, 4
	note A_, 8
	note A_, 4
	note A_, 8
	note G#, 6
	note G#, 6
	note F#, 4
	note G_, 4
	note F_, 4
	notetype $8, $b, $0, $3
	octave 4
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 5
	note C_, 1
	setwaveduty $2
	notetype $c, $b, $0, $3
	note D_, 1
	note C#, 1
	note D_, 4
	note A_, 1
	note G#, 1
	note A_, 4
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note F_, 2
	note G_, 6
	note D#, 2
	note D_, 2
	note C_, 2
	note D#, 4
	note F#, 2
	setwaveduty $3
	notetype $8, $9, $0, $2
	note A_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 3
	note A_, 3
	notetype $c, $b, $0, $2
	note A#, 2
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note D#, 2
	volenvelope $c, $0, $2
	note F_, 2
	note G_, 2
	note A_, 16
	endchannel
; f70f8

Music_GoldSilverOpening_Ch2: ; f70f8
	setpitchoffset $0001
	stereopanning $f
	notetype $c, $b, $0, $7
	setwaveduty $2
	octave 2
	note C_, 16
	note C_, 16
	setwaveduty $3
	notetype $c, $b, $0, $2
	note __, 2
	notetype $6, $6, $0, $2
	octave 1
	note F_, 2
	note A_, 2
	octave 2
	note C_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	octave 1
	note D#, 2
	note G_, 2
	note A#, 2
	octave 2
	note D_, 2
	note D#, 2
	note G_, 2
	note A#, 2
	octave 3
	note D_, 2
	note D#, 2
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	note D#, 2
	note G_, 2
	notetype $c, $b, $0, $7
	octave 1
	note F_, 16
	volenvelope $8, $0, $3
	octave 4
	note F_, 2
	volenvelope $8, $0, $1
	note D_, 2
	volenvelope $9, $0, $3
	note G#, 2
	volenvelope $9, $0, $1
	note F_, 2
	volenvelope $a, $0, $3
	octave 5
	note C#, 2
	volenvelope $a, $0, $1
	octave 4
	note A#, 2
	volenvelope $b, $0, $3
	octave 5
	note F#, 2
	volenvelope $c, $0, $1
	note D#, 2
	volenvelope $b, $0, $3
	octave 1
	note A#, 2
	notetype $6, $b, $0, $2
	octave 4
	note D_, 4
	note D_, 4
	octave 1
	note F_, 4
	octave 4
	note D_, 4
	note D_, 4
	octave 2
	note C_, 4
	octave 4
	note D#, 4
	note D#, 4
	octave 1
	note F_, 4
	octave 4
	note D#, 4
	note D#, 4
	octave 1
	note A#, 4
	octave 3
	note D_, 4
	note D_, 4
	octave 1
	note B_, 4
	octave 3
	note D_, 4
	note D_, 4
	octave 2
	note C_, 4
	octave 3
	note D#, 4
	note D#, 4
	octave 1
	note B_, 4
	octave 3
	note D#, 4
	note F#, 4
	octave 1
	note A#, 4
	octave 3
	note D_, 4
	note D_, 4
	octave 1
	note B_, 4
	octave 3
	note D_, 6
	note D_, 2
	octave 2
	note C_, 4
	octave 3
	note D#, 4
	note D#, 16
	octave 2
	note D#, 2
	octave 3
	note G_, 4
	note G_, 4
	note G_, 2
	octave 2
	note D#, 4
	octave 3
	note F#, 4
	note F#, 4
	octave 2
	note D_, 2
	octave 3
	note F_, 4
	note F_, 4
	note F_, 2
	octave 2
	note G_, 4
	octave 3
	note B_, 4
	note B_, 4
	octave 2
	note C_, 4
	octave 3
	note D#, 4
	note D#, 4
	octave 2
	note C_, 4
	octave 3
	note D#, 4
	note D#, 16
	notetype $6, $a, $0, $2
	note F_, 4
	note G_, 4
	note G#, 4
	notetype $6, $c, $0, $2
	note A_, 4
	note A#, 4
	octave 4
	note C_, 4
	notetype $6, $d, $0, $2
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	note D#, 16
	endchannel
; f71c8

Music_GoldSilverOpening_Ch3: ; f71c8
	notetype $6, $1, $0, $0
	octave 2
	note D_, 4
	notetype $6, $2, $0, $0
	note D_, 4
	notetype $6, $3, $0, $0
	note D_, 4
	note __, 12
	note __, 8
	notetype $6, $1, $0, $0
	octave 2
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	notetype $8, $1, $0, $0
	note F_, 1
	octave 5
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	octave 4
	note B_, 1
	octave 5
	note F_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	octave 5
	note A_, 3
	notetype $c, $1, $0, $0
	note G_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note F_, 2
	note D#, 1
	note __, 1
	note A#, 2
	note G#, 1
	note __, 1
	note __, 16
	note __, 4
	notetype $6, $1, $0, $0
	octave 2
	note G_, 1
	note __, 3
	note A_, 2
	note __, 2
	octave 5
	note F_, 12
	note D_, 4
	note D_, 6
	note F_, 2
	note D#, 12
	note G#, 2
	note __, 2
	note F#, 6
	note D#, 2
	note F_, 12
	note D_, 2
	note __, 2
	note D#, 6
	note F_, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 4
	note D#, 4
	note F_, 2
	note __, 2
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 9
	notetype $c, $1, $0, $0
	note __, 14
	octave 3
	note F_, 2
	note D#, 1
	note __, 1
	note C_, 1
	note __, 13
	endchannel
; f7308


