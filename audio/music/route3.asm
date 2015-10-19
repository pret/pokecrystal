Music_Route3: ; ec2ca
	dbw $c0, Music_Route3_Ch1
	dbw $01, Music_Route3_Ch2
	dbw $02, Music_Route3_Ch3
	dbw $03, Music_Route3_Ch4
; ec2d6

Music_Route3_Ch1: ; ec2d6
	stereopanning $f
	tempo 160
	volume $7, $7
	notetype $c, $9, $0, $1
	note __, 10
	waveduty $0
	vibrato $14, $0, $6
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
Music_Route3_branch_ec307: ; ec307
	callchannel Music_Route3_branch_ec3a4
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	volenvelope $6, $1, $7
	note G_, 1
	note D_, 1
	volenvelope $7, $0, $7
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 4
	volenvelope $6, $1, $7
	octave 3
	note G#, 2
	note E_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note E_, 8
	note D#, 1
	note E_, 1
	note G#, 2
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note A_, 1
	note G#, 1
	note F_, 3
	note E_, 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 2
	volenvelope $9, $0, $1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	loopchannel 0, Music_Route3_branch_ec307
; ec3a4

Music_Route3_branch_ec3a4: ; ec3a4
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, Music_Route3_branch_ec3a4
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3b1: ; ec3b1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	loopchannel 3, Music_Route3_branch_ec3b1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
Music_Route3_branch_ec3bd: ; ec3bd
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	loopchannel 3, Music_Route3_branch_ec3bd
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	endchannel
; ec3d0

Music_Route3_Ch2: ; ec3d0
	stereopanning $f0
	notetype $c, $5, $1, $6
	waveduty $2
	vibrato $6, $0, $3
	octave 4
	note E_, 1
	note G_, 1
	note G#, 6
	volenvelope $8, $0, $7
	note F#, 1
	note G#, 1
	note A_, 1
	note __, 7
	note C#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	volenvelope $a, $0, $7
	waveduty $2
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G#, 1
Music_Route3_branch_ec3f5: ; ec3f5
	volenvelope $7, $1, $5
	callchannel Music_Route3_branch_ec443
	note G_, 1
	note B_, 10
	volenvelope $b, $0, $7
	note B_, 6
	volenvelope $7, $1, $5
	note __, 4
	waveduty $3
	note G#, 4
	callchannel Music_Route3_branch_ec443
	note B_, 1
	volenvelope $7, $1, $5
	octave 5
	note D_, 5
	volenvelope $b, $0, $7
	octave 5
	note D_, 5
	waveduty $0
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	volenvelope $8, $1, $7
	waveduty $2
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G#, 1
	note A_, 1
	note B_, 2
	note E_, 4
	octave 4
	note E_, 8
	note D_, 1
	note C#, 1
	note D_, 3
	note C#, 3
	octave 3
	note A_, 10
	waveduty $2
	octave 4
	note F#, 6
	note E_, 1
	note F#, 1
	note G#, 6
	note F#, 1
	note G#, 1
	loopchannel 0, Music_Route3_branch_ec3f5
; ec443

Music_Route3_branch_ec443: ; ec443
	note A_, 6
	note E_, 1
	note A_, 1
	octave 5
	note C#, 7
	volenvelope $b, $0, $7
	octave 5
	note C#, 3
	volenvelope $7, $1, $5
	octave 4
	note E_, 2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 6
	note D_, 1
	endchannel
; ec45b

Music_Route3_Ch3: ; ec45b
	stereopanning $ff
	vibrato $6, $0, $3
	notetype $c, $1, $0, $3
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	volenvelope $1, $0, $4
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	callchannel Music_Route3_branch_ec4bd
Music_Route3_branch_ec47f: ; ec47f
	volenvelope $1, $0, $4
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note A_, 6
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 1
	note __, 1
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 6
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note C#, 2
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note E_, 2
	note __, 2
	note F#, 1
	note G#, 1
	loopchannel 0, Music_Route3_branch_ec47f
; ec4bd

Music_Route3_branch_ec4bd: ; ec4bd
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note G#, 2
	endchannel
; ec4ce

Music_Route3_branch_ec4ce: ; ec4ce
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A_, 2
	note __, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	note G_, 2
	note G_, 1
	note __, 1
	octave 2
	note G_, 2
	note __, 2
	note G_, 1
	note G_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G#, 2
	note B_, 2
	endchannel
; ec4eb

Music_Route3_Ch4: ; ec4eb
	drumkittoggle $4
	notetype $c
	note __, 10
Music_Route3_branch_ec4f0: ; ec4f0
	notetype $c
	note D_, 2
	note D_, 4
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 0, Music_Route3_branch_ec4f0
; ec506


