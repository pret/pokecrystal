Music_TinTower: ; f6811
	dbw $c0, Music_TinTower_Ch1
	dbw $01, Music_TinTower_Ch2
	dbw $02, Music_TinTower_Ch3
	dbw $03, Music_TinTower_Ch4
; f681d


Music_TinTower_Ch1: ; f681d
	tempo 208
	volume $77
	dutycycle $3
	tone $0004
	vibrato $8, $45

Music_TinTower_branch_f682a: ; f682a
	stereopanning $f0
	notetype $c, $a5
	octave 3
	note G_, 3
	note C_, 3
	note G#, 7
	note G_, 3
	note C_, 3
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note G_, 3
	note C_, 3
	note G#, 3
	note F_, 3
	note G_, 3
	octave 2
	note G_, 3
	octave 3
	note G_, 5
	note A#, 1
	note G_, 1
	note F_, 1
	note C#, 1
	note G_, 1
	note G#, 7
	note G_, 3
	octave 4
	note C_, 3
	octave 3
	note G#, 1
	note G_, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note G_, 1
	note G#, 3
	note F_, 3
	note G_, 3
	octave 2
	note G_, 3
	octave 3
	note G_, 7
	intensity $a2
	octave 2
	note G_, 3
	note G_, 11
	note G_, 3
	note G_, 7
	intensity $a7
	note G_, 3
	intensity $a2
	note G#, 3
	note G#, 7
	intensity $a7
	note G_, 3
	intensity $a2
	note G#, 3
	note G#, 7
	intensity $a7
	note A#, 3
	intensity $a2
	note G_, 3
	note G_, 11
	note G_, 3
	note G_, 11
	note G_, 3
	note G_, 11
	note G_, 3
	note G_, 7
	intensity $a5
	octave 3
	note A#, 3
	loopchannel 0, Music_TinTower_branch_f682a

Music_TinTower_Ch2: ; f688b
	dutycycle $3
	tone $0002
	vibrato $18, $44

Music_TinTower_branch_f6893: ; f6893
	stereopanning $ff

Music_TinTower_branch_f6895: ; f6895
	notetype $c, $b5
	octave 4
	note C_, 3
	note C_, 3
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note C_, 3
	note F_, 3
	note C#, 3
	octave 3
	note A#, 3
	octave 4
	note C_, 3
	note C_, 3
	note C#, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note C_, 3
	octave 3
	note C_, 3
	octave 4
	note C_, 7
	stereopanning $f
	loopchannel 2, Music_TinTower_branch_f6895
	intensity $b2
	octave 3
	note C_, 3
	note C_, 11
	note C_, 3
	note C_, 7
	intensity $b7
	note C_, 3
	intensity $b2
	note C#, 3
	note C#, 7
	intensity $b7
	note C_, 3
	intensity $b2
	note C#, 3
	note C#, 7
	intensity $b7
	note D#, 3
	intensity $90
	stereopanning $ff
	note G_, 3
	octave 4
	note C_, 3
	octave 3
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 3
	note C_, 3
	note G_, 7
	note G_, 3
	octave 4
	note C_, 3
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 3
	octave 3
	note C_, 3
	octave 4
	note C_, 5
	intensity $95
	note C#, 1
	loopchannel 0, Music_TinTower_branch_f6893

Music_TinTower_Ch3: ; f68f8
	notetype $c, $14

Music_TinTower_branch_f68fb: ; f68fb
	note __, 15
	note __, 15
	note __, 15
	note __, 9
	octave 2
	note G_, 1
	note G#, 1
	note A#, 1
	octave 3
	note C_, 7
	note C#, 7
	note E_, 7
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	note C#, 1
	note D#, 1
	note C_, 7
	note C#, 7
	note E_, 7
	octave 4
	note C_, 7
	octave 3
	note C_, 0
	note __, 2
	note C_, 0
	note __, 10
	note C_, 0
	note __, 2
	note C_, 0
	note __, 6
	note C_, 3
	note C#, 0
	note __, 2
	note C#, 0
	note __, 6
	note C_, 3
	note C#, 0
	note __, 2
	note C#, 0
	note __, 6
	note D#, 3
	stereopanning $f
	note C_, 0
	note __, 2
	note C_, 0
	note __, 10
	note C_, 0
	note __, 2
	note C_, 0
	note __, 2
	stereopanning $ff
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	note C#, 1
	note D#, 1
	stereopanning $f
	note C_, 0
	note __, 2
	note C_, 0
	note __, 10
	note C_, 0
	note __, 2
	note C_, 0
	note __, 10
	stereopanning $ff
	loopchannel 0, Music_TinTower_branch_f68fb

Music_TinTower_Ch4: ; f6948
	togglenoise $0
	notetype $c

Music_TinTower_branch_f694c: ; f694c
	stereopanning $f
	note G_, 1
	stereopanning $f0
	note G_, 0
	note G_, 0
	stereopanning $f
	note G_, 1
	stereopanning $f0
	note F_, 3
	stereopanning $f
	note G_, 1
	note G_, 1
	note F_, 1
	stereopanning $f0
	note G_, 1
	stereopanning $f
	note G_, 0
	note G_, 0
	stereopanning $f0
	note G_, 1
	stereopanning $f
	note F_, 3
	stereopanning $f0
	note G_, 1
	note G_, 1
	note F_, 1
	loopchannel 0, Music_TinTower_branch_f694c
; f6974
