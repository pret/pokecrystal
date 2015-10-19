Music_BurnedTower: ; f6a99
	dbw $c0, Music_BurnedTower_Ch1
	dbw $01, Music_BurnedTower_Ch2
	dbw $02, Music_BurnedTower_Ch3
	dbw $03, Music_BurnedTower_Ch4
; f6aa5

Music_BurnedTower_Ch1: ; f6aa5
	tempo 168
	volume $7, $7
	waveduty $1
	pitchoffset $0004
	vibrato $8, $4, $5
	stereopanning $f0
	notetype $c, $9, $0, $1
	note __, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $8, $0, $0
	octave 3
	note D#, 6
	volenvelope $9, $0, $1
	note D_, 4
	note D_, 4
	note D_, 2
	volenvelope $8, $0, $0
	note C#, 6
Music_BurnedTower_branch_f6ac8: ; f6ac8
	volenvelope $9, $0, $1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $8, $0, $0
	note A#, 6
	loopchannel 2, Music_BurnedTower_branch_f6ac8
	tempo 150
Music_BurnedTower_branch_f6ad8: ; f6ad8
	volenvelope $b, $0, $1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $a, $0, $0
	octave 3
	note D#, 6
	volenvelope $b, $0, $1
	note D_, 4
	note D_, 4
	note D_, 2
	volenvelope $a, $0, $0
	note C#, 6
	volenvelope $b, $0, $1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $a, $0, $0
	note A#, 6
	volenvelope $b, $0, $1
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $b, $0, $3
	note A#, 16
	note A#, 16
	note A#, 16
	note G#, 6
	volenvelope $b, $0, $1
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $a, $0, $0
	note A#, 6
	volenvelope $b, $0, $1
	note B_, 4
	note B_, 4
	note B_, 2
	volenvelope $a, $0, $0
	octave 3
	note F_, 6
	volenvelope $b, $0, $1
	note E_, 4
	note E_, 4
	note E_, 2
	volenvelope $a, $0, $0
	note D#, 6
Music_BurnedTower_branch_f6b17: ; f6b17
	volenvelope $b, $0, $1
	octave 2
	note B_, 4
	note B_, 4
	note B_, 2
	volenvelope $a, $0, $0
	octave 3
	note C_, 6
	loopchannel 2, Music_BurnedTower_branch_f6b17
	loopchannel 0, Music_BurnedTower_branch_f6ad8
; f6b29

Music_BurnedTower_Ch2: ; f6b29
	waveduty $2
	vibrato $20, $8, $2
	pitchoffset $0002
	notetype $c, $7, $0, $0
	callchannel Music_BurnedTower_branch_f6b8e
	volenvelope $c, $0, $5
Music_BurnedTower_branch_f6b39: ; f6b39
	callchannel Music_BurnedTower_branch_f6b8e
	volenvelope $c, $0, $1
	waveduty $3
	note __, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $b, $0, $0
	octave 3
	note D#, 6
	volenvelope $c, $0, $1
	note D_, 4
	note D_, 4
	note D_, 2
	volenvelope $b, $0, $0
	note C#, 6
	volenvelope $c, $0, $1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volenvelope $b, $0, $0
	note A#, 4
	volenvelope $c, $0, $1
	volenvelope $c, $0, $2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	vibrato $0, $0, $0
	volenvelope $3, $1, $5
	note E_, 8
	vibrato $20, $8, $3
	volenvelope $b, $0, $0
	octave 2
	note G_, 4
	waveduty $2
	volenvelope $b, $0, $0
	octave 3
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note B_, 4
	octave 4
	note C#, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note E_, 4
	volenvelope $b, $0, $7
	note F#, 16
	loopchannel 0, Music_BurnedTower_branch_f6b39
; f6b8e

Music_BurnedTower_branch_f6b8e: ; f6b8e
	octave 3
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 4
	note F_, 4
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note D_, 4
	note E_, 16
	endchannel
; f6ba2

Music_BurnedTower_Ch3: ; f6ba2
	stereopanning $f
	notetype $c, $1, $0, $4
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D#, 4
Music_BurnedTower_branch_f6bad: ; f6bad
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note F_, 4
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note D#, 4
	loopchannel 4, Music_BurnedTower_branch_f6bad
Music_BurnedTower_branch_f6bc3: ; f6bc3
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note G_, 4
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note F_, 4
	loopchannel 2, Music_BurnedTower_branch_f6bc3
	loopchannel 0, Music_BurnedTower_branch_f6bad
; f6bdd

Music_BurnedTower_Ch4: ; f6bdd
	drumkittoggle $0
	notetype $c
Music_BurnedTower_branch_f6be1: ; f6be1
	note __, 16
	loopchannel 4, Music_BurnedTower_branch_f6be1
	note __, 2
Music_BurnedTower_branch_f6be7: ; f6be7
	stereopanning $f0
	note G_, 2
	note G#, 2
	note G_, 4
	note G#, 2
	note G_, 4
	loopchannel 0, Music_BurnedTower_branch_f6be7
; f6bf2


