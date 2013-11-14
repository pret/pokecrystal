Music_Gym: ; f48ae
	dbw $c0, Music_Gym_Ch1
	dbw $01, Music_Gym_Ch2
	dbw $02, Music_Gym_Ch3
	dbw $03, Music_Gym_Ch4
; f48ba


Music_Gym_Ch1: ; f48ba
	tempo 156
	volume $77
	stereopanning $f
	vibrato $12, $24
	dutycycle $1
	notetype $c, $b7

Music_Gym_branch_f48c9: ; f48c9
	octave 4
	note F#, 1
	octave 2
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 2
	octave 4
	note E_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	octave 4
	note D_, 1
	octave 2
	note D_, 0
	note D_, 0
	note D_, 0
	note __, 0
	octave 3
	note D_, 0
	note D_, 0
	note B_, 0
	note G_, 0
	note D_, 0
	note B_, 0
	octave 4
	note C#, 0
	octave 3
	note A_, 0
	note E_, 0
	octave 4
	note E_, 0
	octave 3
	note A_, 11
	note F#, 1
	note A_, 1
	note G_, 0
	note __, 1
	note E_, 0
	note E_, 1
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 7
	note A_, 3
	note F#, 1
	note A_, 1
	note E_, 0
	note __, 0
	note E_, 0
	note F#, 0
	note G_, 3
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	octave 4
	note C_, 1
	note D_, 5
	octave 3
	note A_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 0
	note __, 1
	note G_, 0
	note G_, 3
	octave 4
	note E_, 0
	note __, 1
	note C_, 0
	note C_, 1
	octave 3
	note B_, 0
	note A#, 0
	note A_, 11
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note E_, 1
	note C_, 1
	note E_, 1
	note C_, 0
	note E_, 0
	note G_, 3
	note D_, 5
	octave 3
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note A_, 0
	octave 4
	note F#, 2
	note G_, 3
	note F#, 3
	note E_, 3
	note C_, 3
	note D_, 0
	note __, 0
	note D_, 0
	note E_, 0
	note __, 1
	octave 3
	note B_, 3
	note F#, 1
	note D_, 1
	note F#, 1
	note A#, 0
	note A_, 0
	note G_, 0
	note F_, 0
	octave 4
	note D_, 3
	note C_, 0
	octave 3
	note A#, 0
	note A_, 0
	note G_, 0
	octave 4
	note E_, 3
	note F#, 5
	octave 3
	note A_, 0
	note __, 2
	note A_, 0
	note __, 0
	note A_, 0
	octave 4
	note F#, 2
	note A_, 3
	note G_, 3
	note F#, 3
	note E_, 3
	note D_, 0
	octave 3
	note B_, 0
	note F#, 0
	octave 4
	note E_, 0
	note F#, 3
	note E_, 0
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note F#, 0
	note G_, 3
	note A_, 0
	note G_, 0
	note F#, 0
	note E_, 0
	note A_, 3
	octave 5
	note D_, 3
	octave 4
	note A_, 0
	note G_, 0
	note F#, 0
	note E_, 0
	loopchannel 0, Music_Gym_branch_f48c9

Music_Gym_Ch2: ; f497c
	dutycycle $1
	stereopanning $f0

Music_Gym_branch_f4980: ; f4980
	notetype $c, $c3
	octave 2
	note D_, 1
	octave 1
	note D_, 0
	note D_, 0
	note D_, 1
	note A_, 0
	octave 2
	note F#, 0
	note C_, 1
	octave 1
	note C_, 0
	note C_, 0
	note C_, 1
	octave 2
	note G_, 0
	note E_, 0
	octave 1
	note G_, 1
	octave 1
	note G_, 0
	note G_, 0
	note G_, 1
	octave 1
	note G_, 0
	note G_, 0
	note A_, 3
	octave 2
	note A_, 1
	octave 3
	note C_, 0
	note C#, 0
	callchannel Music_Gym_branch_f49e9
	octave 3
	note E_, 1
	note C_, 0
	note C#, 0
	callchannel Music_Gym_branch_f49e9
	octave 3
	note C_, 0
	note E_, 0
	note G_, 0
	octave 4
	note C_, 0
	intensity $d2
	callchannel Music_Gym_branch_f4a15
	octave 1
	note F#, 0
	note B_, 0
	note F#, 1
	octave 2
	note F#, 1
	octave 1
	note B_, 1
	note A#, 3
	note A#, 1
	note F_, 0
	note F_, 0
	note G_, 0
	octave 2
	note C_, 0
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note E_, 1
	callchannel Music_Gym_branch_f4a15
	octave 1
	note G_, 0
	octave 2
	note C_, 0
	octave 1
	note G_, 1
	octave 2
	note E_, 1
	note C_, 1
	note D_, 3
	note D_, 1
	octave 1
	note A_, 0
	note A_, 0
	note A_, 0
	octave 2
	note D_, 0
	octave 1
	note A_, 1
	octave 2
	note F#, 1
	note D_, 1
	loopchannel 0, Music_Gym_branch_f4980
; f49e9

Music_Gym_branch_f49e9: ; f49e9
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note D_, 1
	note D_, 0
	note D_, 0
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	octave 3
	note E_, 1
	note C_, 0
	note C#, 0
	note D_, 2
	octave 2
	note D_, 2
	note D_, 1
	note D_, 0
	note D_, 0
	note D_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	endchannel
; f4a15

Music_Gym_branch_f4a15: ; f4a15
	octave 2
	note D_, 3
	note D_, 1
	octave 1
	note A_, 0
	note A_, 0
	note A_, 0
	octave 2
	note D_, 0
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note D_, 1
	note C_, 3
	note C_, 1
	octave 1
	note G_, 0
	note G_, 0
	note G_, 0
	octave 2
	note C_, 0
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note C_, 1
	octave 1
	note B_, 1
	note __, 1
	note B_, 1
	note F#, 0
	note F#, 0
	endchannel

Music_Gym_Ch3: ; f4a37
	vibrato $14, $23
	stereopanning $ff

Music_Gym_branch_f4a3c: ; f4a3c
	notetype $c, $14
	octave 6
	note D_, 1
	octave 4
	note D_, 0
	note D_, 0
	note D_, 0
	note __, 0
	octave 5
	note A_, 0
	octave 6
	note D_, 0
	note C_, 1
	octave 4
	note C_, 0
	note C_, 0
	note C_, 0
	note __, 0
	octave 5
	note A_, 0
	octave 6
	note C_, 0
	octave 5
	note B_, 1
	octave 3
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	octave 5
	note B_, 0
	note B_, 0
	note B_, 3
	octave 6
	note C#, 3
	octave 5
	note D_, 11
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note E_, 0
	note __, 1
	note C_, 0
	note C_, 3
	note G_, 3
	note E_, 3
	note D_, 11
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note C_, 0
	note __, 0
	note C_, 0
	note D_, 0
	note E_, 7
	note __, 3
	note F#, 11
	note E_, 1
	note F#, 1
	note G_, 0
	note __, 1
	note E_, 0
	note E_, 3
	octave 6
	note C_, 0
	note __, 1
	octave 5
	note G_, 0
	note G_, 3
	note F#, 11
	note E_, 1
	note F#, 1
	note G_, 1
	note E_, 0
	note G_, 0
	octave 6
	note C_, 7
	octave 5
	note B_, 3
	intensity $13
	callchannel Music_Gym_branch_f4ab3
	note __, 1
	note A_, 1
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 3
	octave 5
	note A#, 3
	note A_, 3
	note G_, 3
	callchannel Music_Gym_branch_f4ab3
	note A_, 0
	note __, 0
	note A_, 0
	note B_, 0
	octave 6
	note C_, 3
	note D_, 0
	note __, 0
	note D_, 0
	note E_, 0
	note F#, 7
	note E_, 3
	loopchannel 0, Music_Gym_branch_f4a3c
; f4ab3

Music_Gym_branch_f4ab3: ; f4ab3
	octave 5
	note A_, 5
	octave 6
	note D_, 5
	octave 5
	note A_, 3
	octave 6
	note C_, 3
	octave 5
	note B_, 3
	note A_, 3
	note G_, 3
	note F#, 0
	note __, 0
	note F#, 0
	note G_, 0
	note A_, 3
	endchannel

Music_Gym_Ch4: ; f4ac5
	togglenoise $4

Music_Gym_branch_f4ac7: ; f4ac7
	notetype $c
	note D_, 1
	note C#, 0
	note C#, 0
	note B_, 3
	note D_, 1
	note C#, 0
	note C#, 0
	note B_, 3
	note D_, 1
	note C#, 0
	note C#, 0
	note D_, 1
	note C#, 0
	note C#, 0
	note A#, 0
	note D#, 0
	note D#, 0
	note D#, 0
	note C#, 0
	note C#, 0
	note D_, 0
	note D_, 0
	notetype $6

Music_Gym_branch_f4ae1: ; f4ae1
	note D_, 5
	note D_, 5
	note D_, 3
	note D_, 1
	note D_, 1
	note D_, 3
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note D_, 5
	note D_, 5
	note D_, 3
	note D_, 1
	note D_, 1
	note D_, 3
	note B_, 7
	loopchannel 4, Music_Gym_branch_f4ae1

Music_Gym_branch_f4afa: ; f4afa
	note D#, 3
	note F#, 3
	note D_, 3
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 3
	note D_, 3
	note F#, 3
	loopchannel 8, Music_Gym_branch_f4afa
	loopchannel 0, Music_Gym_branch_f4ac7
; f4b0c
