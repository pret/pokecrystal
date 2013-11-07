Music_GoldSilverOpening: ; f7055
	dbw $80, Music_GoldSilverOpening_Ch1
	dbw $01, Music_GoldSilverOpening_Ch2
	dbw $02, Music_GoldSilverOpening_Ch3
; f705e


Music_GoldSilverOpening_Ch1: ; f705e
	tempo 256
	volume $77
	tone $0001
	dutycycle $2
	stereopanning $f0
	notetype $c, $b7
	octave 1
	note G#, 15
	note G#, 15
	tempo 168
	dutycycle $3
	notetype $6, $c7
	octave 3
	note F_, 11
	note A_, 3
	octave 4
	note C_, 11
	octave 3
	note B_, 1
	note A#, 1
	note G_, 11
	note A#, 3
	octave 4
	note D#, 11
	note D_, 1
	note C#, 1
	notetype $6, $b5
	note C_, 7
	octave 3
	note F_, 7
	note A_, 7
	note B_, 3
	octave 4
	note C_, 3
	notetype $6, $b3
	octave 3
	note A#, 7
	note C#, 7
	octave 2
	note F#, 7
	octave 1
	note B_, 7
	notetype $6, $b2
	note __, 3
	octave 3
	note A#, 3
	note A#, 7
	note G#, 3
	note G#, 7
	note G_, 3
	note G_, 7
	note F#, 3
	note F#, 7
	octave 2
	note A_, 3
	note A_, 7
	note G#, 3
	note G#, 7
	note G_, 3
	note G_, 7
	note F#, 3
	note A_, 7
	note A_, 3
	note A_, 7
	note G#, 5
	note G#, 5
	note F#, 3
	note G_, 3
	note F_, 3
	notetype $8, $b3
	octave 4
	note F_, 0
	note G_, 0
	note A_, 0
	note A#, 0
	note B_, 0
	octave 5
	note C_, 0
	dutycycle $2
	notetype $c, $b3
	note D_, 0
	note C#, 0
	note D_, 3
	note A_, 0
	note G#, 0
	note A_, 3
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note F_, 1
	note G_, 5
	note D#, 1
	note D_, 1
	note C_, 1
	note D#, 3
	note F#, 1
	dutycycle $3
	notetype $8, $92
	note A_, 0
	note F_, 0
	note D#, 0
	note C_, 0
	octave 4
	note A_, 0
	note G_, 0
	note F_, 0
	note D#, 0
	note C_, 0
	octave 3
	note A_, 2
	notetype $c, $b2
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
	intensity $c2
	note F_, 1
	note G_, 1
	note A_, 15
	endchannel

Music_GoldSilverOpening_Ch2: ; f70f8
	tone $0001
	stereopanning $f
	notetype $c, $b7
	dutycycle $2
	octave 2
	note C_, 15
	note C_, 15
	dutycycle $3
	notetype $c, $b2
	note __, 1
	notetype $6, $62
	octave 1
	note F_, 1
	note A_, 1
	octave 2
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
	octave 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 2
	note D_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 3
	note D_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	note D#, 1
	note G_, 1
	notetype $c, $b7
	octave 1
	note F_, 15
	intensity $83
	octave 4
	note F_, 1
	intensity $81
	note D_, 1
	intensity $93
	note G#, 1
	intensity $91
	note F_, 1
	intensity $a3
	octave 5
	note C#, 1
	intensity $a1
	octave 4
	note A#, 1
	intensity $b3
	octave 5
	note F#, 1
	intensity $c1
	note D#, 1
	intensity $b3
	octave 1
	note A#, 1
	notetype $6, $b2
	octave 4
	note D_, 3
	note D_, 3
	octave 1
	note F_, 3
	octave 4
	note D_, 3
	note D_, 3
	octave 2
	note C_, 3
	octave 4
	note D#, 3
	note D#, 3
	octave 1
	note F_, 3
	octave 4
	note D#, 3
	note D#, 3
	octave 1
	note A#, 3
	octave 3
	note D_, 3
	note D_, 3
	octave 1
	note B_, 3
	octave 3
	note D_, 3
	note D_, 3
	octave 2
	note C_, 3
	octave 3
	note D#, 3
	note D#, 3
	octave 1
	note B_, 3
	octave 3
	note D#, 3
	note F#, 3
	octave 1
	note A#, 3
	octave 3
	note D_, 3
	note D_, 3
	octave 1
	note B_, 3
	octave 3
	note D_, 5
	note D_, 1
	octave 2
	note C_, 3
	octave 3
	note D#, 3
	note D#, 15
	octave 2
	note D#, 1
	octave 3
	note G_, 3
	note G_, 3
	note G_, 1
	octave 2
	note D#, 3
	octave 3
	note F#, 3
	note F#, 3
	octave 2
	note D_, 1
	octave 3
	note F_, 3
	note F_, 3
	note F_, 1
	octave 2
	note G_, 3
	octave 3
	note B_, 3
	note B_, 3
	octave 2
	note C_, 3
	octave 3
	note D#, 3
	note D#, 3
	octave 2
	note C_, 3
	octave 3
	note D#, 3
	note D#, 15
	notetype $6, $a2
	note F_, 3
	note G_, 3
	note G#, 3
	notetype $6, $c2
	note A_, 3
	note A#, 3
	octave 4
	note C_, 3
	notetype $6, $d2
	octave 3
	note A_, 3
	octave 4
	note C_, 3
	note D#, 15
	endchannel

Music_GoldSilverOpening_Ch3: ; f71c8
	notetype $6, $10
	octave 2
	note D_, 3
	notetype $6, $20
	note D_, 3
	notetype $6, $30
	note D_, 3
	note __, 11
	note __, 7
	notetype $6, $10
	octave 2
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 6
	note D_, 0
	note __, 0
	octave 2
	note F_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 6
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 2
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	note D#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 6
	note D_, 0
	note __, 0
	notetype $8, $10
	note F_, 0
	octave 5
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 0
	note A_, 0
	note F_, 0
	octave 4
	note B_, 0
	octave 5
	note F_, 0
	octave 4
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 0
	note A_, 0
	note F_, 0
	octave 3
	note B_, 0
	octave 4
	note F_, 0
	octave 3
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 0
	octave 5
	note A_, 2
	notetype $c, $10
	note G_, 0
	note __, 0
	octave 6
	note C_, 1
	octave 5
	note A#, 0
	note __, 0
	octave 6
	note F_, 1
	note D#, 0
	note __, 0
	note A#, 1
	note G#, 0
	note __, 0
	note __, 15
	note __, 3
	notetype $6, $10
	octave 2
	note G_, 0
	note __, 2
	note A_, 1
	note __, 1
	octave 5
	note F_, 11
	note D_, 3
	note D_, 5
	note F_, 1
	note D#, 11
	note G#, 1
	note __, 1
	note F#, 5
	note D#, 1
	note F_, 11
	note D_, 1
	note __, 1
	note D#, 5
	note F_, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 3
	note D#, 3
	note F_, 1
	note __, 1
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	note D_, 0
	note __, 0
	note F_, 0
	note __, 0
	note D_, 0
	note __, 0
	note F_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note F#, 0
	note __, 0
	note A#, 0
	note __, 0
	note F#, 0
	note __, 0
	note A#, 0
	note __, 0
	note F#, 0
	note __, 0
	note A#, 0
	note __, 8
	notetype $c, $10
	note __, 13
	octave 3
	note F_, 1
	note D#, 0
	note __, 0
	note C_, 0
	note __, 12
	endchannel
; f7308
