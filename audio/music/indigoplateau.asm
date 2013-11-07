Music_IndigoPlateau: ; ee852
	dbw $c0, Music_IndigoPlateau_Ch1
	dbw $01, Music_IndigoPlateau_Ch2
	dbw $02, Music_IndigoPlateau_Ch3
	dbw $03, Music_IndigoPlateau_Ch4
; ee85e


Music_IndigoPlateau_Ch1: ; ee85e
	tempo 128
	volume $77
	dutycycle $3
	tone $0002
	stereopanning $f

Music_IndigoPlateau_branch_ee86a: ; ee86a
	callchannel Music_IndigoPlateau_branch_ee881
	octave 3
	note D_, 3
	callchannel Music_IndigoPlateau_branch_ee881
	octave 3
	note D#, 3
	callchannel Music_IndigoPlateau_branch_ee881
	octave 3
	note D#, 3
	callchannel Music_IndigoPlateau_branch_ee881
	note A#, 3
	loopchannel 0, Music_IndigoPlateau_branch_ee86a
; ee881

Music_IndigoPlateau_branch_ee881: ; ee881
	notetype $c, $b6
	octave 2
	note A_, 3
	intensity $b2
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 3
	note A_, 1
	note A_, 1
	intensity $a0
	endchannel

Music_IndigoPlateau_Ch2: ; ee892
	dutycycle $3
	vibrato $10, $22
	stereopanning $f0

Music_IndigoPlateau_branch_ee899: ; ee899
	callchannel Music_IndigoPlateau_branch_ee8e9
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note A#, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note C#, 3
	intensity $c7
	note A_, 5
	note D_, 1
	note G_, 1
	note A#, 1
	note A_, 7
	intensity $b0
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note A#, 3
	intensity $c7
	octave 4
	note D_, 5
	note D#, 1
	note C_, 3
	note D_, 7
	intensity $b0
	octave 3
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note C#, 3
	intensity $c7
	octave 4
	note C_, 5
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note F#, 7
	intensity $b0
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note A#, 3
	intensity $c7
	octave 4
	note D_, 5
	note D#, 1
	note F_, 3
	note F#, 7
	intensity $b0
	octave 3
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee8e9
	note C#, 3
	loopchannel 0, Music_IndigoPlateau_branch_ee899
; ee8e9

Music_IndigoPlateau_branch_ee8e9: ; ee8e9
	notetype $c, $c6
	octave 3
	note D_, 3
	intensity $c2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 1
	note D_, 1
	intensity $b0
	endchannel

Music_IndigoPlateau_Ch3: ; ee8fa
	notetype $c, $19

Music_IndigoPlateau_branch_ee8fd: ; ee8fd
	callchannel Music_IndigoPlateau_branch_ee915
	octave 3
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee915
	octave 3
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee915
	octave 3
	note A_, 3
	callchannel Music_IndigoPlateau_branch_ee915
	octave 3
	note F#, 3
	loopchannel 0, Music_IndigoPlateau_branch_ee8fd
; ee915

Music_IndigoPlateau_branch_ee915: ; ee915
	octave 3
	note D_, 0
	note __, 2
	octave 2
	note A_, 0
	note __, 2
	octave 3
	note C_, 0
	note __, 2
	note D_, 0
	note __, 2
	octave 2
	note A_, 0
	note __, 2
	endchannel

Music_IndigoPlateau_Ch4: ; ee924
	stereopanning $f0
	togglenoise $0
	notetype $c

Music_IndigoPlateau_branch_ee92a: ; ee92a
	note D#, 3
	note D_, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note D_, 3
	note D_, 1
	note D_, 1
	notetype $6
	note D_, 0
	note D_, 0
	note D#, 0
	note D#, 0
	note D#, 0
	note D#, 0
	note D_, 0
	note D_, 0
	notetype $c
	note D#, 3
	note D_, 1
	note D#, 1
	note D#, 1
	note D_, 1
	note C#, 3
	note D_, 1
	note D_, 1
	note C#, 3
	loopchannel 0, Music_IndigoPlateau_branch_ee92a
; ee94b
