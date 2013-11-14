Music_TrainerVictory: ; ebeab
	dbw $80, Music_TrainerVictory_Ch1
	dbw $01, Music_TrainerVictory_Ch2
	dbw $02, Music_TrainerVictory_Ch3
; ebeb4


Music_TrainerVictory_Ch1: ; ebeb4
	tempo 120
	volume $77
	dutycycle $2
	tone $0001
	notetype $8, $b1
	octave 4
	note E_, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	intensity $b6
	note A_, 11
	stereopanning $f

Music_TrainerVictory_branch_ebecd: ; ebecd
	intensity $72
	callchannel Music_TrainerVictory_branch_ebf11
	intensity $51
	note C#, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	intensity $72
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note E_, 5
	loopchannel 2, Music_TrainerVictory_branch_ebecd
	callchannel Music_TrainerVictory_branch_ebf11
	note A_, 1
	note __, 1
	note F_, 1
	note A_, 5
	note A#, 1
	note __, 1
	note G_, 1
	note A#, 5

Music_TrainerVictory_branch_ebef2: ; ebef2
	intensity $72
	octave 4
	note D_, 1
	note C#, 1
	octave 3
	note A_, 1
	loopchannel 3, Music_TrainerVictory_branch_ebef2
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1

Music_TrainerVictory_branch_ebf01: ; ebf01
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	loopchannel 3, Music_TrainerVictory_branch_ebf01
	note E_, 1
	note F#, 1
	note G_, 1
	loopchannel 0, Music_TrainerVictory_branch_ebecd
; ebf11

Music_TrainerVictory_branch_ebf11: ; ebf11
	octave 3
	note F#, 1
	note __, 1
	note D_, 1
	note F#, 5
	note G_, 1
	note __, 1
	note E_, 1
	note G_, 5
	endchannel

Music_TrainerVictory_Ch2: ; ebf1b
	vibrato $12, $34
	dutycycle $3
	notetype $8, $d1
	octave 4
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	intensity $d6
	note D_, 11
	stereopanning $f0

Music_TrainerVictory_branch_ebf30: ; ebf30
	notetype $8, $82
	callchannel Music_TrainerVictory_branch_ebf56
	note F#, 1
	note __, 1
	note G_, 1
	note A_, 5
	note E_, 1
	note __, 1
	note F#, 1
	note G_, 5
	loopchannel 2, Music_TrainerVictory_branch_ebf30
	callchannel Music_TrainerVictory_branch_ebf56
	note F_, 1
	note __, 1
	note C_, 1
	note F_, 5
	note G_, 1
	note __, 1
	note D_, 1
	note G_, 5
	notetype $c, $88
	note F#, 15
	note E_, 15
	loopchannel 0, Music_TrainerVictory_branch_ebf30
; ebf56

Music_TrainerVictory_branch_ebf56: ; ebf56
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 5
	note E_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 5
	endchannel

Music_TrainerVictory_Ch3: ; ebf64
	notetype $8, $25
	octave 3
	note G_, 5
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 5
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1

Music_TrainerVictory_branch_ebf74: ; ebf74
	callchannel Music_TrainerVictory_branch_ebfb1
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note A_, 1
	note F#, 1
	note C#, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 0
	note __, 0
	note A_, 5
	loopchannel 2, Music_TrainerVictory_branch_ebf74
	callchannel Music_TrainerVictory_branch_ebfb1
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note __, 1
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	note G_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 11
	octave 3
	note A_, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note E_, 1
	note A_, 11
	note G_, 1
	note E_, 1
	note C#, 1
	loopchannel 0, Music_TrainerVictory_branch_ebf74
; ebfb1

Music_TrainerVictory_branch_ebfb1: ; ebfb1
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	octave 3
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 1
	octave 3
	note G_, 1
	note E_, 1
	octave 2
	note B_, 1
	endchannel
; ebfc3
