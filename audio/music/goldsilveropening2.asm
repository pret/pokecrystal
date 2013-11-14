Music_GoldSilverOpening2: ; f7308
	dbw $c0, Music_GoldSilverOpening2_Ch1
	dbw $01, Music_GoldSilverOpening2_Ch2
	dbw $02, Music_GoldSilverOpening2_Ch3
	dbw $03, Music_GoldSilverOpening2_Ch4
; f7314


Music_GoldSilverOpening2_Ch1: ; f7314
	tempo 92
	volume $77
	dutycycle $3
	tone $0002
	stereopanning $f
	notetype $c, $3d
	octave 3
	note D#, 7

Music_GoldSilverOpening2_branch_f7325: ; f7325
	notetype $c, $c1
	octave 3
	note D_, 1
	note D_, 1
	note D_, 1
	intensity $b7
	note D#, 9
	intensity $c1
	note D_, 1
	note D_, 1
	note D_, 1
	intensity $b7
	note F_, 3
	note D#, 3
	note C_, 1
	loopchannel 2, Music_GoldSilverOpening2_branch_f7325
	intensity $c1
	note D_, 1
	note D_, 1
	note D_, 1
	intensity $b7
	note D#, 9
	intensity $c1
	note D_, 1
	note D_, 1
	note D_, 1
	intensity $b7
	note F_, 3
	note G_, 3
	note A#, 1
	intensity $b0
	note A_, 15
	note A_, 15
	intensity $b2
	octave 4
	note D_, 15
	endchannel

Music_GoldSilverOpening2_Ch2: ; f7358
	dutycycle $3
	vibrato $14, $14
	stereopanning $f0
	notetype $c, $3f
	octave 3
	note A#, 7
	notetype $c, $d1
	octave 3
	note A_, 1
	note A_, 1
	note A_, 1
	intensity $c7
	note A#, 9
	intensity $d1
	note A_, 1
	note A_, 1
	note A_, 1
	intensity $c7
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	note G_, 1
	intensity $d1
	note A_, 1
	note A_, 1
	note A_, 1
	intensity $c7
	note A#, 9
	intensity $d1
	note A_, 1
	note A_, 1
	note A_, 1
	intensity $c7
	octave 4
	note C_, 3
	note C#, 3
	note D#, 1
	intensity $c7
	note D_, 7
	note D#, 7
	note F_, 7
	note A#, 7
	intensity $b0
	octave 5
	note D_, 15
	note D_, 15
	intensity $c2
	note D_, 15
	endchannel

Music_GoldSilverOpening2_Ch3: ; f739c
	notetype $c, $17
	note __, 7
	octave 2
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A#, 7
	note __, 1
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 3
	note F_, 3
	note A_, 1
	note D_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note D_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	octave 3
	note D_, 1
	octave 2
	note A#, 1
	note A_, 1
	note F#, 1
	note D#, 1
	note D_, 1
	note F#, 1
	note A#, 1
	octave 3
	note D_, 1
	octave 2
	note A#, 1
	note F#, 1
	note A#, 1
	octave 3
	note C#, 1
	note D_, 1
	note __, 13
	endchannel

Music_GoldSilverOpening2_Ch4: ; f73ea
	togglenoise $0
	notetype $6
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c

Music_GoldSilverOpening2_branch_f73f8: ; f73f8
	note D_, 1
	note D_, 1
	note D_, 1
	note C#, 3
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note C#, 5
	notetype $6
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	notetype $c
	loopchannel 4, Music_GoldSilverOpening2_branch_f73f8
	note C_, 15
	endchannel
; f7411
