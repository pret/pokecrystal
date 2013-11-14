Music_GymLeaderVictory: ; f462c
	dbw $c0, Music_GymLeaderVictory_Ch1
	dbw $01, Music_GymLeaderVictory_Ch2
	dbw $02, Music_GymLeaderVictory_Ch3
	dbw $03, Music_GymLeaderVictory_Ch4
; f4638


Music_GymLeaderVictory_Ch1: ; f4638
	tempo 116
	volume $77
	vibrato $12, $34
	dutycycle $3
	tone $0001
	notetype $c, $b7
	octave 4
	note D_, 5
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	note F#, 5
	note D_, 0
	note F#, 0
	note A_, 5
	note F#, 0
	note A_, 0
	octave 5
	note D_, 7
	stereopanning $f

Music_GymLeaderVictory_branch_f4658: ; f4658
	dutycycle $1
	callchannel Music_GymLeaderVictory_branch_f4689
	octave 4
	note C#, 3
	note E_, 3
	callchannel Music_GymLeaderVictory_branch_f4689
	note F#, 7
	loopchannel 2, Music_GymLeaderVictory_branch_f4658
	dutycycle $2
	callchannel Music_GymLeaderVictory_branch_f46a0
	note A_, 3
	note G_, 3
	note F#, 5
	note D_, 0
	note E_, 0
	note F#, 5
	note E_, 1
	note D_, 7
	note C#, 7
	dutycycle $3
	callchannel Music_GymLeaderVictory_branch_f46a0
	note C#, 3
	note E_, 3
	note G_, 5
	note A_, 0
	note G_, 0
	note A_, 5
	note G_, 1
	intensity $87
	note F#, 15
	loopchannel 0, Music_GymLeaderVictory_branch_f4658
; f4689

Music_GymLeaderVictory_branch_f4689: ; f4689
	intensity $91
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 0
	note F#, 0
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 0
	note E_, 0
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 0
	note D_, 0
	endchannel
; f46a0

Music_GymLeaderVictory_branch_f46a0: ; f46a0
	intensity $87
	octave 3
	note F#, 13
	note D_, 0
	note F#, 0
	note A_, 7
	note F#, 3
	note A_, 0
	note G#, 0
	note F#, 0
	note A_, 0
	note G#, 13
	note E_, 0
	note G#, 0
	note B_, 7
	octave 4
	note D_, 3
	note E_, 0
	note D_, 0
	note E_, 0
	note D_, 0
	note C#, 13
	octave 3
	note A_, 0
	octave 4
	note C#, 0
	note E_, 7
	endchannel

Music_GymLeaderVictory_Ch2: ; f46bd
	vibrato $12, $34
	dutycycle $3
	notetype $c, $d7
	octave 4
	note A_, 5
	note F#, 0
	note A_, 0
	octave 5
	note D_, 5
	octave 4
	note A_, 0
	octave 5
	note D_, 0
	note F#, 15

Music_GymLeaderVictory_branch_f46d0: ; f46d0
	dutycycle $3
	intensity $a1
	callchannel Music_GymLeaderVictory_branch_f4711
	note A_, 3
	note A_, 3
	callchannel Music_GymLeaderVictory_branch_f4711
	note D_, 5
	dutycycle $2
	note B_, 0
	octave 5
	note C#, 0
	callchannel Music_GymLeaderVictory_branch_f4711
	note A_, 3
	note A_, 3
	callchannel Music_GymLeaderVictory_branch_f4711
	note D_, 7
	dutycycle $3
	callchannel Music_GymLeaderVictory_branch_f4720
	note F#, 3
	note E_, 3
	note D_, 13
	octave 4
	note B_, 1
	intensity $a7
	note A_, 15
	dutycycle $2
	callchannel Music_GymLeaderVictory_branch_f4720
	octave 4
	note A_, 3
	octave 5
	note C#, 3
	note D_, 13
	note E_, 1
	intensity $a6
	note D_, 11
	note __, 1
	dutycycle $3
	octave 4
	note B_, 0
	octave 5
	note C#, 0
	loopchannel 0, Music_GymLeaderVictory_branch_f46d0
; f4711

Music_GymLeaderVictory_branch_f4711: ; f4711
	octave 5
	note D_, 1
	note C#, 1
	octave 4
	note B_, 3
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note A_, 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	endchannel
; f4720

Music_GymLeaderVictory_branch_f4720: ; f4720
	intensity $98
	note A_, 5
	note F#, 0
	note A_, 0
	octave 5
	note D_, 7
	note D_, 15
	octave 4
	note B_, 5
	note G#, 0
	note B_, 0
	octave 5
	note E_, 7
	note E_, 15
	octave 4
	note G_, 5
	note E_, 0
	note G_, 0
	octave 5
	note C#, 7
	note C#, 7
	endchannel

Music_GymLeaderVictory_Ch3: ; f4737
	notetype $c, $25
	octave 3
	note F#, 15
	note D_, 9
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C#, 1
	stereopanning $f0

Music_GymLeaderVictory_branch_f4744: ; f4744
	note D_, 1
	note __, 3
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note __, 3
	octave 2
	note A_, 1
	note B_, 1
	note __, 3
	note G_, 1
	note A_, 1
	note __, 1
	octave 3
	note C#, 3
	note D_, 1
	note __, 3
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note __, 3
	octave 2
	note A_, 1
	note B_, 1
	note __, 3
	note G_, 1
	octave 3
	note D_, 1
	note __, 5
	loopchannel 2, Music_GymLeaderVictory_branch_f4744
	callchannel Music_GymLeaderVictory_branch_f479e
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note F#, 1
	note D_, 1
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note A_, 1
	callchannel Music_GymLeaderVictory_branch_f479e
	octave 3
	note D_, 1
	note __, 1
	note G_, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note C#, 1
	loopchannel 0, Music_GymLeaderVictory_branch_f4744
; f479e

Music_GymLeaderVictory_branch_f479e: ; f479e
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note D_, 1
	note F#, 1
	note D_, 1
	note A_, 1
	note __, 1
	note D_, 1
	note F#, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	octave 4
	note E_, 1
	note __, 1
	octave 3
	note E_, 1
	note G#, 1
	note E_, 1
	note B_, 1
	note __, 1
	note E_, 1
	note G#, 1
	note __, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	note A_, 1
	note __, 1
	note A_, 1
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note A_, 1
	octave 3
	note A_, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note A_, 1
	endchannel

Music_GymLeaderVictory_Ch4: ; f47e5
	togglenoise $4
	notetype $c
	note B_, 15
	note B_, 15

Music_GymLeaderVictory_branch_f47eb: ; f47eb
	callchannel Music_GymLeaderVictory_branch_f480b
	note D#, 5
	note D#, 1
	note D#, 7
	callchannel Music_GymLeaderVictory_branch_f480b
	note D#, 5
	note D#, 1
	note D#, 3
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0

Music_GymLeaderVictory_branch_f47fb: ; f47fb
	note D#, 1
	note G_, 1
	note D_, 1
	note D#, 1
	note G_, 1
	note D#, 1
	note D_, 1
	note G_, 1
	loopchannel 16, Music_GymLeaderVictory_branch_f47fb
	loopchannel 0, Music_GymLeaderVictory_branch_f47eb
; f480b

Music_GymLeaderVictory_branch_f480b: ; f480b
	note D#, 5
	note D#, 1
	note D#, 3
	note D_, 1
	note D#, 1
	loopchannel 3, Music_GymLeaderVictory_branch_f480b
	endchannel
; f4815
