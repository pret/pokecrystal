Music_Route36: ; e94e9
	dbw $c0, Music_Route36_Ch1
	dbw $01, Music_Route36_Ch2
	dbw $02, Music_Route36_Ch3
	dbw $03, Music_Route36_Ch4
; e94f5


Music_Route36_Ch1: ; e94f5
	tempo 144
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f
	notetype $c, $b3
	octave 3
	note C_, 3
	note C_, 5
	note F_, 0
	note E_, 0
	intensity $b5
	note F_, 7
	intensity $b3
	note F_, 5
	note A#, 0
	note A_, 0
	intensity $5d
	note A#, 3

Music_Route36_branch_e9517: ; e9517
	intensity $b5
	note F_, 3
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note D#, 1
	note A#, 3
	note A_, 3
	note G_, 1
	note A#, 3
	note F_, 3
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note A#, 3
	note A_, 3
	octave 4
	note D#, 3
	octave 3
	note A#, 1
	intensity $b6
	octave 4
	note F_, 9
	intensity $b5
	note C_, 1
	note F_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 3
	note D_, 3
	note C_, 1
	octave 3
	note A#, 3
	intensity $b4
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	intensity $a4
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	stereopanning $f0
	intensity $95
	octave 3
	note D_, 5
	octave 2
	note A_, 5
	octave 3
	note D_, 3
	octave 2
	note A_, 5
	octave 3
	note D_, 5
	note E_, 3
	intensity $b5
	note D_, 5
	note A_, 5
	note G_, 3
	intensity $a5
	octave 2
	note A_, 5
	octave 3
	note F#, 5
	note E_, 3
	note D_, 5
	octave 2
	note A_, 5
	octave 3
	note D_, 3
	intensity $b5
	note F#, 5
	note E_, 5
	note C#, 3
	note D_, 5
	note A_, 5
	note G_, 3
	octave 2
	note A_, 5
	octave 3
	note F#, 5
	note D_, 3
	note C_, 5
	note G_, 5
	note C_, 1
	note E_, 1
	intensity $b7
	note C_, 5
	note G_, 3
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	octave 4
	note D_, 5
	note C_, 1
	octave 3
	note B_, 1
	note A_, 5
	note D_, 5
	stereopanning $f
	intensity $b5
	note D#, 1
	note E_, 1
	loopchannel 0, Music_Route36_branch_e9517

Music_Route36_Ch2: ; e95af
	dutycycle $3
	vibrato $10, $36
	stereopanning $f0
	notetype $c, $c2
	octave 3
	note F_, 1
	note C_, 0
	note F_, 0
	intensity $c7
	note A_, 7
	note C_, 3
	intensity $c3
	octave 4
	note C_, 1
	octave 3
	note A_, 0
	octave 4
	note C_, 0
	intensity $c7
	note F_, 7
	octave 3
	note G_, 3

Music_Route36_branch_e95ce: ; e95ce
	intensity $c7
	octave 4
	note C_, 9
	intensity $c4
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note A_, 1
	note G_, 2
	intensity $c2
	note D#, 0
	intensity $c7
	note D#, 11
	note C_, 9
	intensity $c4
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	note F_, 1
	intensity $c2
	note D#, 1
	note D#, 0
	note F_, 0
	intensity $c7
	note G_, 11
	note A_, 9
	intensity $c4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 2
	note A_, 0
	intensity $c7
	note G_, 7
	note A#, 3
	intensity $b0
	note A_, 15
	intensity $b7
	note A_, 15
	stereopanning $f
	intensity $a4
	octave 3
	note A_, 5
	note G_, 5
	note F#, 3
	note E_, 5
	note F#, 5
	note G_, 3
	intensity $b3
	note A_, 1
	note F#, 0
	note A_, 0
	intensity $b7
	octave 4
	note D_, 11
	intensity $a4
	octave 3
	note F#, 1
	note D_, 0
	note F#, 0
	intensity $a7
	note A_, 11
	intensity $c7
	note A_, 5
	note G_, 5
	note F#, 3
	note B_, 5
	note A_, 5
	note G_, 3
	intensity $c3
	note A_, 1
	note F#, 0
	note A_, 0
	intensity $c7
	octave 4
	note D_, 11
	intensity $c3
	octave 3
	note F#, 1
	note D_, 0
	note F#, 0
	intensity $c7
	note A_, 11
	intensity $c2
	note G_, 1
	note E_, 0
	note G_, 0
	intensity $b0
	octave 4
	note C_, 1
	intensity $b7
	note C_, 9
	intensity $c5
	octave 3
	note G_, 1
	note E_, 0
	note G_, 0
	intensity $c7
	octave 4
	note C_, 7
	note C#, 3
	stereopanning $ff
	note D_, 5
	note A_, 5
	note G_, 1
	note F#, 1
	intensity $b0
	note D_, 3
	intensity $b7
	note D_, 7
	stereopanning $f0
	intensity $c4
	octave 3
	note F#, 0
	note G_, 0
	note A_, 0
	note B_, 0
	loopchannel 0, Music_Route36_branch_e95ce

Music_Route36_Ch3: ; e966b
	notetype $c, $25
	octave 3
	note F_, 0
	note __, 2
	note F_, 0
	note __, 0
	octave 4
	note C_, 3
	octave 3
	note C_, 1
	note F_, 1
	note C_, 1
	note D#, 0
	note __, 2
	note D#, 0
	note __, 0
	octave 4
	note F_, 3
	octave 2
	note A#, 1
	octave 3
	note D#, 1
	note E_, 1

Music_Route36_branch_e9684: ; e9684
	note F_, 3
	note C_, 1
	note F_, 3
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 3
	note D#, 1
	note G_, 3
	note D#, 1
	note G_, 1
	note D#, 1
	note F_, 3
	note C_, 1
	note F_, 3
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 3
	note D#, 1
	note G_, 3
	note D#, 1
	note G_, 1
	note D#, 1
	note A_, 3
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	note F_, 1
	note A#, 3
	note G_, 1
	note A#, 3
	note G_, 1
	note A#, 1
	note G_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note D_, 3
	octave 2
	note A_, 1
	octave 3
	note D_, 3
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note G_, 3
	note E_, 1
	note G_, 3
	note E_, 1
	note G_, 1
	note E_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note E_, 1
	note A_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note G_, 3
	note E_, 1
	note G_, 3
	note E_, 1
	note G_, 1
	note E_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 3
	note D_, 1
	note F#, 1
	note D_, 1
	note G_, 3
	note C_, 1
	note G_, 3
	note C_, 1
	note G_, 1
	note C_, 1
	note G_, 3
	note C_, 1
	note G_, 3
	note C_, 1
	note E_, 1
	note G_, 1
	note A_, 5
	octave 4
	note F#, 3
	octave 3
	note D_, 1
	note A_, 1
	octave 4
	note D_, 1
	note C_, 2
	note E_, 0
	note F#, 5
	octave 3
	note D_, 1
	note D#, 1
	note E_, 1
	loopchannel 0, Music_Route36_branch_e9684

Music_Route36_Ch4: ; e9709
	togglenoise $1
	notetype $c
	callchannel Music_Route36_branch_e9734
	callchannel Music_Route36_branch_e9741

Music_Route36_branch_e9713: ; e9713
	callchannel Music_Route36_branch_e9734
	callchannel Music_Route36_branch_e973b
	callchannel Music_Route36_branch_e9734
	callchannel Music_Route36_branch_e9741
	loopchannel 2, Music_Route36_branch_e9713

Music_Route36_branch_e9723: ; e9723
	note A#, 3
	note A_, 1
	note F_, 3
	note B_, 0
	note B_, 0
	note A_, 3
	loopchannel 11, Music_Route36_branch_e9723
	callchannel Music_Route36_branch_e9741
	loopchannel 0, Music_Route36_branch_e9713
; e9734

Music_Route36_branch_e9734: ; e9734
	note A_, 3
	note A_, 5
	note A#, 0
	note A#, 0
	note A_, 1
	note A#, 1
	endchannel
; e973b

Music_Route36_branch_e973b: ; e973b
	note A_, 3
	note A_, 5
	note B_, 0
	note A#, 0
	note A_, 3
	endchannel
; e9741

Music_Route36_branch_e9741: ; e9741
	note A_, 3
	note A_, 5
	note A#, 0
	note A#, 0
	note A_, 1
	notetype $6
	note A#, 0
	note A#, 0
	note A_, 0
	note A_, 0
	notetype $c
	endchannel
; e974f
