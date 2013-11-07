Music_Route3: ; ec2ca
	dbw $c0, Music_Route3_Ch1
	dbw $01, Music_Route3_Ch2
	dbw $02, Music_Route3_Ch3
	dbw $03, Music_Route3_Ch4
; ec2d6


Music_Route3_Ch1: ; ec2d6
	stereopanning $f
	tempo 160
	volume $77
	notetype $c, $91
	note __, 9
	dutycycle $0
	vibrato $14, $6
	octave 3
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note F_, 0
	note D_, 0
	note F_, 0
	note D_, 0
	note F_, 0
	note D_, 0
	note F_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note F#, 0
	note G#, 0

Music_Route3_branch_ec307: ; ec307
	callchannel Music_Route3_branch_ec3a4
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	intensity $6f
	note G_, 0
	note D_, 0
	intensity $77
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note G_, 0
	note D_, 0
	note E_, 0
	note G#, 0
	note B_, 3
	intensity $6f
	octave 3
	note G#, 1
	note E_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note E_, 7
	note D#, 0
	note E_, 0
	note G#, 1
	octave 2
	note B_, 3
	octave 3
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	note A_, 0
	note G#, 0
	note F_, 2
	note E_, 2
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	intensity $91
	note F#, 0
	note D_, 0
	octave 2
	note A_, 0
	octave 3
	note D_, 0
	note F#, 0
	note A_, 0
	note F#, 0
	note A_, 0
	note B_, 0
	note G#, 0
	note E_, 0
	note G#, 0
	note E_, 0
	note G#, 0
	note B_, 0
	octave 4
	note D_, 0
	loopchannel 0, Music_Route3_branch_ec307
; ec3a4

Music_Route3_branch_ec3a4: ; ec3a4
	octave 3
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	loopchannel 3, Music_Route3_branch_ec3a4
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0

Music_Route3_branch_ec3b1: ; ec3b1
	note A_, 0
	note E_, 0
	note C#, 0
	note E_, 0
	loopchannel 3, Music_Route3_branch_ec3b1
	note C#, 0
	note E_, 0
	note C#, 0
	note E_, 0

Music_Route3_branch_ec3bd: ; ec3bd
	note G_, 0
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	loopchannel 3, Music_Route3_branch_ec3bd
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	endchannel

Music_Route3_Ch2: ; ec3d0
	stereopanning $f0
	notetype $c, $5e
	dutycycle $2
	vibrato $6, $3
	octave 4
	note E_, 0
	note G_, 0
	note G#, 5
	intensity $87
	note F#, 0
	note G#, 0
	note A_, 0
	note __, 6
	note C#, 3
	note E_, 3
	note D_, 3
	octave 3
	note B_, 3
	octave 4
	note C#, 3
	intensity $a7
	dutycycle $2
	octave 3
	note A_, 0
	octave 4
	note C#, 0
	note E_, 0
	note G#, 0

Music_Route3_branch_ec3f5: ; ec3f5
	intensity $7d
	callchannel Music_Route3_branch_ec443
	note G_, 0
	note B_, 9
	intensity $b7
	note B_, 5
	intensity $7d
	note __, 3
	dutycycle $3
	note G#, 3
	callchannel Music_Route3_branch_ec443
	note B_, 0
	intensity $7d
	octave 5
	note D_, 4
	intensity $b7
	octave 5
	note D_, 4
	dutycycle $0
	octave 3
	note D_, 0
	note G_, 0
	note B_, 0
	note __, 0
	note G_, 0
	note B_, 0
	octave 4
	note D_, 3
	intensity $8f
	dutycycle $2
	octave 4
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 7
	note G#, 0
	note A_, 0
	note B_, 1
	note E_, 3
	octave 4
	note E_, 7
	note D_, 0
	note C#, 0
	note D_, 2
	note C#, 2
	octave 3
	note A_, 9
	dutycycle $2
	octave 4
	note F#, 5
	note E_, 0
	note F#, 0
	note G#, 5
	note F#, 0
	note G#, 0
	loopchannel 0, Music_Route3_branch_ec3f5
; ec443

Music_Route3_branch_ec443: ; ec443
	note A_, 5
	note E_, 0
	note A_, 0
	octave 5
	note C#, 6
	intensity $b7
	octave 5
	note C#, 2
	intensity $7d
	octave 4
	note E_, 1
	note A_, 1
	octave 5
	note E_, 1
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 5
	note D_, 0
	endchannel

Music_Route3_Ch3: ; ec45b
	stereopanning $ff
	vibrato $6, $3
	notetype $c, $13
	octave 3
	note B_, 0
	octave 4
	note D_, 0
	note E_, 5
	note D_, 0
	octave 3
	note B_, 0
	intensity $14
	octave 3
	note A_, 0
	note __, 0
	octave 2
	note A_, 1
	note __, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note G#, 1
	callchannel Music_Route3_branch_ec4bd

Music_Route3_branch_ec47f: ; ec47f
	intensity $14
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4bd
	callchannel Music_Route3_branch_ec4ce
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note A_, 5
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
	note G#, 1
	note E_, 0
	note __, 0
	note E_, 1
	note B_, 1
	octave 3
	note E_, 1
	note F_, 5
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note C#, 1
	note D_, 0
	note __, 0
	note D_, 1
	note __, 1
	note D_, 0
	note D_, 0
	note E_, 0
	note __, 0
	note E_, 1
	note __, 1
	note F#, 0
	note G#, 0
	loopchannel 0, Music_Route3_branch_ec47f
; ec4bd

Music_Route3_branch_ec4bd: ; ec4bd
	octave 3
	note A_, 0
	note __, 0
	octave 2
	note A_, 1
	note __, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 2
	note G#, 1
	endchannel
; ec4ce

Music_Route3_branch_ec4ce: ; ec4ce
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note A_, 1
	note __, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note D_, 1
	note G_, 1
	note G_, 0
	note __, 0
	octave 2
	note G_, 1
	note __, 1
	note G_, 0
	note G_, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G#, 1
	note B_, 1
	endchannel

Music_Route3_Ch4: ; ec4eb
	togglenoise $4
	notetype $c
	note __, 9

Music_Route3_branch_ec4f0: ; ec4f0
	notetype $c
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	notetype $6
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	loopchannel 0, Music_Route3_branch_ec4f0
; ec506
