Music_SproutTower: ; f6974
	dbw $c0, Music_SproutTower_Ch1
	dbw $01, Music_SproutTower_Ch2
	dbw $02, Music_SproutTower_Ch3
	dbw $03, Music_SproutTower_Ch4
; f6980


Music_SproutTower_Ch1: ; f6980
	tempo 176
	volume $77
	dutycycle $3
	tone $0002
	vibrato $8, $45
	stereopanning $f
	notetype $c, $a3
	note __, 15
	note __, 15

Music_SproutTower_branch_f6994: ; f6994
	note __, 5
	octave 3
	note F_, 1
	note F#, 3
	note F#, 3
	note F_, 3
	note C_, 3
	note C#, 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F#, 3
	note F#, 3
	note F_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 3
	note F#, 1
	note D#, 9
	note F#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	intensity $a5
	note C_, 7
	intensity $a3
	note C#, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	intensity $a7
	note C_, 15
	intensity $a3
	note F_, 3
	note F_, 3
	note F#, 3
	note F#, 3
	note F_, 3
	note F_, 3
	note D#, 3
	note D#, 3
	loopchannel 0, Music_SproutTower_branch_f6994

Music_SproutTower_Ch2: ; f69c8
	dutycycle $3
	tone $0001
	vibrato $8, $48
	notetype $c, $b2
	octave 3
	note F_, 3
	note F_, 3
	note F#, 3
	note F#, 3
	note F_, 3
	note F_, 3
	note D#, 3
	note D#, 3

Music_SproutTower_branch_f69dc: ; f69dc
	intensity $b5
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	octave 4
	note C#, 3
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note F#, 3
	intensity $b7
	note F_, 7
	intensity $b5
	note F#, 3
	note A#, 3
	octave 4
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 7
	intensity $b5
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	note F#, 1
	intensity $b7
	note A#, 7
	intensity $b5
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note F#, 1
	note D#, 1
	intensity $b7
	note F_, 7
	intensity $b3
	note F_, 3
	note F_, 3
	note F#, 3
	note A#, 1
	note F_, 0
	note A#, 0
	intensity $b7
	octave 4
	note C_, 15
	note __, 15
	loopchannel 0, Music_SproutTower_branch_f69dc

Music_SproutTower_Ch3: ; f6a25
	vibrato $14, $e8
	notetype $c, $14
	octave 3
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	stereopanning $f0

Music_SproutTower_branch_f6a3e: ; f6a3e
	note __, 3
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F_, 1
	note D#, 1
	note __, 1
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note F_, 7
	note F#, 3
	note A#, 3
	note D#, 7
	note F_, 3
	note F#, 3
	note F_, 15
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 1
	note F#, 1
	note D#, 1
	note __, 1
	note F_, 1
	loopchannel 0, Music_SproutTower_branch_f6a3e

Music_SproutTower_Ch4: ; f6a7a
	togglenoise $0
	notetype $c
	note __, 3

Music_SproutTower_branch_f6a7f: ; f6a7f
	note F#, 3
	stereopanning $f0
	note D#, 3
	note F#, 1
	stereopanning $f
	note D#, 1
	stereopanning $ff
	note F#, 3
	note F#, 3
	stereopanning $f
	note D#, 3
	note F#, 1
	stereopanning $f0
	note D#, 1
	stereopanning $ff
	note F#, 3
	loopchannel 0, Music_SproutTower_branch_f6a7f
; f6a99
