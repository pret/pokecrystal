Music_TitleScreen: ; eb808
	dbw $c0, Music_TitleScreen_Ch1
	dbw $01, Music_TitleScreen_Ch2
	dbw $02, Music_TitleScreen_Ch3
	dbw $03, Music_TitleScreen_Ch4
; eb814


Music_TitleScreen_Ch1: ; eb814
	tempo 134
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $12
	stereopanning $f0
	notetype $c, $a7
	intensity $a0
	octave 3
	note __, 3
	intensity $a7
	octave 2
	note G_, 0
	note __, 1
	note A_, 0
	note B_, 7
	note G_, 3
	octave 3
	note C_, 0
	note __, 1
	note D_, 0
	note E_, 7
	note C_, 3
	octave 2
	note B_, 0
	note __, 1
	octave 3
	note C_, 0
	octave 2
	note B_, 7
	note A_, 3
	note A_, 0
	note __, 1
	note B_, 0
	octave 3
	note C_, 5
	note E_, 3
	note F#, 1
	stereopanning $ff
	octave 4
	note G_, 0
	stereopanning $f0
	octave 3
	note D_, 4
	octave 2
	note B_, 1
	octave 3
	note D_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 5
	note F_, 5
	note C_, 3
	note D_, 5
	intensity $b7
	note D#, 0
	note E_, 0
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	notetype $8, $a7
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 3
	note D_, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 5
	octave 2
	note B_, 5
	octave 3
	note C_, 2
	note D_, 5
	note E_, 2
	note E_, 3
	note E_, 3
	note C_, 3
	notetype $8, $a0
	octave 2
	note B_, 5
	notetype $8, $a7
	note B_, 5
	notetype $8, $a7
	octave 3
	note F_, 3
	note E_, 3
	note C_, 3
	notetype $8, $a0
	note D_, 5
	notetype $8, $a7
	note D_, 5
	notetype $8, $a7
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	note D_, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 5
	octave 2
	note B_, 5
	octave 3
	note C_, 8
	note F_, 8
	note C_, 5
	note D_, 8
	notetype $c, $b7
	note D#, 0
	note E_, 0
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	notetype $8, $a7
	note C_, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 3
	note D_, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 8
	notetype $8, $b7
	note G_, 2
	note A_, 3
	note G_, 3
	note F_, 3
	note F_, 5
	note E_, 5
	note D_, 8
	note F_, 2
	note G_, 2
	note D_, 5
	note G_, 2
	notetype $8, $54
	octave 2
	note G_, 2
	note B_, 2
	notetype $8, $94
	octave 3
	note D_, 2
	note G_, 2
	tempo 136
	notetype $8, $b4
	note F_, 2
	note A_, 2
	notetype $8, $d4
	octave 4
	note C_, 2
	note F_, 2
	tempo 138
	notetype $8, $b4
	note D_, 8
	note C_, 8
	octave 3
	note A#, 5
	notetype $c, $b7
	note F_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	note F_, 3
	octave 4
	note D_, 3
	note F_, 3
	note E_, 5
	octave 3
	note G_, 1
	notetype $8, $b7
	note A_, 3
	note G_, 3
	note F_, 3
	note G_, 11
	octave 4
	note C_, 5
	tempo 136
	note C#, 5
	tempo 134
	callchannel Music_TitleScreen_branch_eb96d
	octave 4
	note C_, 3
	note C_, 3
	note C#, 3
	callchannel Music_TitleScreen_branch_eb96d
	octave 4
	note C_, 3
	note C_, 3
	note C#, 3
	callchannel Music_TitleScreen_branch_eb96d
	octave 3
	note E_, 3
	note E_, 3
	note C_, 3
	notetype $c, $a0
	note D_, 5
	notetype $c, $a7
	note D_, 9
	intensity $a0
	note C_, 7
	intensity $a7
	note C_, 7
	intensity $a0
	octave 2
	note B_, 7
	intensity $a7
	note B_, 7
	octave 3
	note C_, 7
	octave 2
	note B_, 7
	octave 3
	note D_, 7
	octave 2
	note B_, 7
	octave 3
	note C_, 7
	note F_, 7
	note A_, 7
	note G_, 5
	note G_, 0
	note F#, 0
	note F_, 7
	note E_, 7
	intensity $a0
	note D_, 15
	intensity $a7
	note D_, 15
	intensity $a3
	octave 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	notetype $8, $b2
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note F#, 1
	notetype $c, $b7
	note G_, 0
	note __, 2
	octave 1
	note G_, 0
	note __, 10
	endchannel
; eb96d

Music_TitleScreen_branch_eb96d: ; eb96d
	notetype $c, $c3
	note D_, 0

Music_TitleScreen_branch_eb971: ; eb971
	note __, 0
	octave 2
	note D_, 0
	octave 1
	note A_, 0
	octave 2
	note D_, 0
	loopchannel 5, Music_TitleScreen_branch_eb971
	note __, 0
	note D_, 0
	octave 1
	note A_, 0
	notetype $8, $b7
	endchannel

Music_TitleScreen_Ch2: ; eb984
	dutycycle $3
	vibrato $14, $12
	notetype $c, $c7
	intensity $a4
	octave 1
	note G_, 0
	octave 2
	note D_, 0
	note G_, 0
	octave 3
	note C_, 0
	intensity $c2
	octave 3
	note B_, 0
	note __, 1
	note A_, 0
	intensity $b0
	note G_, 5
	intensity $b7
	note G_, 5
	note __, 15
	note __, 15
	intensity $c7
	octave 4
	note C_, 0
	note __, 1
	note D_, 0
	note E_, 7
	note F#, 1
	note E_, 0
	note F#, 0
	octave 3
	note G_, 5
	note B_, 1
	octave 4
	note D_, 7
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 3
	note F_, 3
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 5
	octave 3
	note C_, 1
	stereopanning $f
	intensity $a3
	octave 4
	note D_, 3
	note D_, 1
	note C_, 3
	note C_, 1
	octave 3
	note B_, 3
	stereopanning $ff
	intensity $c7
	octave 3
	note G_, 5
	note B_, 1
	octave 4
	note D_, 7
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 1
	note F_, 3
	note A_, 1
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note C_, 3
	octave 3
	note B_, 3
	octave 4
	note C_, 3
	note D_, 11
	stereopanning $f0
	notetype $8, $b7
	octave 2
	note A_, 8
	stereopanning $f
	notetype $c, $c7
	note G_, 0
	note A_, 0
	note B_, 5
	note E_, 0
	note F#, 0
	note G_, 3
	notetype $c, $4b
	note A_, 3
	stereopanning $ff
	notetype $c, $c7
	octave 3
	note G_, 5
	note B_, 1
	octave 4
	note D_, 7
	stereopanning $f0
	intensity $97
	octave 2
	note A_, 1
	note F_, 5
	stereopanning $ff
	intensity $c7
	octave 4
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	stereopanning $f0
	intensity $97
	octave 3
	note C_, 1
	octave 2
	note A_, 5
	note B_, 5
	note G_, 1
	notetype $8, $c7
	note F_, 3
	note G_, 3
	note F_, 3
	stereopanning $ff
	octave 3
	note G_, 8
	note B_, 2
	octave 4
	note D_, 11
	stereopanning $f0
	notetype $8, $a7
	octave 3
	note D_, 3
	note C_, 3
	note D_, 3
	stereopanning $ff
	notetype $8, $c7
	octave 4
	note F_, 3
	note E_, 3
	note F_, 3
	note G_, 8
	note A#, 2
	notetype $c, $b0
	note G_, 7
	notetype $c, $b7
	note G_, 7
	intensity $c6
	note A_, 3
	intensity $5d
	note A_, 3
	intensity $c7
	note A#, 5
	intensity $c3
	note F_, 1
	intensity $c7
	note F_, 7
	intensity $a7
	octave 3
	note A#, 7
	intensity $c7
	octave 4
	note A#, 3
	note B_, 3
	octave 5
	note C_, 5
	intensity $c3
	octave 4
	note G_, 1
	intensity $c7
	note G_, 7
	intensity $a7
	octave 3
	note E_, 7
	intensity $c7
	octave 5
	note C_, 3
	note C#, 3
	tone $0001
	stereopanning $f
	callchannel Music_TitleScreen_branch_ebae7
	note C#, 3
	callchannel Music_TitleScreen_branch_ebae7
	note C#, 3
	callchannel Music_TitleScreen_branch_ebae7
	octave 4
	note A_, 3
	stereopanning $ff
	tone $0000
	notetype $c, $b0
	octave 3
	note B_, 5
	notetype $c, $b7
	note B_, 9
	intensity $c7
	note A_, 7
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	note G_, 7
	note F_, 7
	note A_, 7
	intensity $b0
	note G_, 7
	intensity $b7
	note G_, 7
	intensity $c7
	note F_, 7
	octave 4
	note F_, 5
	note E_, 0
	note D#, 0
	note D_, 7
	octave 2
	note B_, 7
	octave 3
	note C_, 7
	note A_, 5
	note F_, 0
	note A_, 0
	intensity $b0
	note G_, 15
	intensity $b7
	note G_, 15
	intensity $c2
	octave 4
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	intensity $90
	note G_, 3
	notetype $8, $c2
	octave 3
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F#, 1
	notetype $c, $c7
	note G_, 0
	note __, 2
	octave 2
	note G_, 0
	note __, 10
	endchannel
; ebae7

Music_TitleScreen_branch_ebae7: ; ebae7
	notetype $c, $b2
	note D_, 0

Music_TitleScreen_branch_ebaeb: ; ebaeb
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	note A_, 0
	note D_, 0
	loopchannel 5, Music_TitleScreen_branch_ebaeb
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	note A_, 0
	notetype $8, $b7
	octave 5
	note C_, 3
	note C_, 3
	endchannel

Music_TitleScreen_Ch3: ; ebb01
	stereopanning $f
	vibrato $10, $14
	tone $0001
	notetype $c, $16
	octave 3
	octave 3
	note __, 3
	octave 2
	note G_, 1
	note D_, 0
	note C#, 0
	note D_, 0
	note __, 0
	note G_, 1
	note D_, 0
	note __, 0
	note D_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note C_, 0
	octave 1
	note B_, 0
	octave 2
	note C_, 0
	note __, 0
	note F_, 1
	note C_, 0
	note __, 0
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 1
	note D_, 0
	note C#, 0
	note D_, 0
	note __, 0
	note G_, 1
	note D_, 0
	note __, 0
	note D_, 1
	note G_, 1
	note D_, 1
	note A_, 1
	note F_, 0
	note E_, 0
	note F_, 0
	note __, 0
	note A_, 1
	note F_, 1
	note A_, 3
	octave 3
	note C_, 1
	octave 2
	note G_, 3
	note D_, 1
	note G_, 3
	note D_, 1
	note G_, 1
	note D_, 1
	note A_, 3
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note G_, 1
	note B_, 3
	note G_, 1
	note B_, 1
	note G_, 1
	note G_, 3
	note B_, 1
	note A_, 3
	note B_, 1
	octave 3
	note C_, 3
	octave 2
	note G_, 3
	note D_, 1
	note G_, 3
	note D_, 1
	note G_, 1
	note D_, 1
	note A_, 3
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note G_, 1
	note B_, 3
	note G_, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note G_, 1
	note B_, 3
	note G_, 1
	octave 3
	note D_, 3
	octave 2
	note G_, 3
	note D_, 1
	note G_, 3
	note D_, 1
	note G_, 1
	note D_, 1
	note A_, 3
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note G_, 1
	note B_, 3
	note G_, 1
	note B_, 1
	note G_, 1
	octave 3
	note D_, 3
	octave 2
	note G_, 1
	octave 3
	note D_, 3
	octave 2
	note G_, 1
	octave 3
	note D_, 1
	octave 2
	note A_, 1
	note G_, 3
	note D_, 1
	note G_, 3
	note D_, 1
	note G_, 1
	note D_, 1
	note A_, 3
	note F_, 1
	note A_, 3
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 3
	note G_, 1
	note B_, 3
	note G_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 3
	note C_, 1
	note D_, 5
	octave 2
	note A#, 5
	octave 3
	note F_, 3
	note A#, 5
	note F_, 5
	note D_, 3
	note E_, 5
	note C_, 5
	note E_, 3
	octave 4
	note C_, 5
	octave 3
	note G_, 5
	note E_, 3
	note D_, 0
	note __, 0
	stereopanning $ff
	notetype $c, $16
	tone $0000
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note A_, 5
	note G_, 1
	note F#, 1
	note D_, 0
	note __, 1
	note E_, 0
	note F#, 3
	notetype $8, $16
	octave 3
	note C_, 3
	note C_, 3
	note C#, 3
	notetype $c, $16
	note D_, 0
	note __, 0
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note A_, 5
	note G_, 1
	note F#, 1
	note B_, 0
	note __, 1
	note A_, 0
	note A_, 3
	notetype $8, $16
	octave 3
	note C_, 3
	note C_, 3
	note C#, 3
	notetype $c, $16
	note D_, 0
	note __, 0
	notetype $c, $16
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note G_, 5
	note E_, 1
	note G_, 1
	note F#, 0
	note E_, 0
	note D_, 5
	tone $0001
	notetype $8, $16
	octave 3
	note C_, 3
	note C_, 3
	note E_, 1
	note F#, 1
	stereopanning $f
	notetype $c, $16
	note G_, 15
	note F_, 15
	note G_, 7
	note D_, 5
	note D_, 0
	note E_, 0
	note F_, 1
	note F_, 11
	note E_, 0
	note D#, 0
	note D_, 7
	note G_, 7
	note F_, 7
	note A_, 7
	note G_, 7
	note D_, 5
	note D_, 0
	note E_, 0
	note F_, 15
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	octave 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	notetype $8, $16
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note A_, 1
	notetype $c, $16
	note G_, 0
	note __, 2
	octave 1
	note G_, 0
	note __, 10
	endchannel

Music_TitleScreen_Ch4: ; ebc5c
	togglenoise $5
	stereopanning $f0
	notetype $c
	note __, 3
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 5
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 2
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 3
	note D#, 1
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 0
	note C_, 1
	notetype $6
	note D_, 0
	note D_, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C_, 0
	note C_, 0
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	notetype $6
	note C#, 0
	note C#, 0
	note C_, 0
	note C_, 0
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 1
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	notetype $6
	note C#, 0
	note D_, 0
	note D_, 0
	note C#, 0
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	notetype $6
	note D_, 0
	note D_, 0
	note C#, 0
	note C#, 0
	notetype $c
	note A_, 1
	note D#, 3
	note A_, 3
	note D#, 1
	note A_, 3
	note A_, 1
	note D#, 3
	note A_, 3
	note D#, 1
	note A_, 1
	note A_, 1
	note A_, 1
	note D#, 3
	note A_, 3
	note D#, 1
	note A_, 3
	note A_, 3
	note A_, 3
	note A_, 1
	note D_, 0
	note D_, 0
	note C#, 0
	note C#, 0
	note C_, 0
	note C_, 0
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note C#, 0
	note D_, 0
	note D_, 0
	note C#, 0
	notetype $c
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note D_, 0
	note D_, 0
	note C#, 0
	note C#, 0
	notetype $c
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	notetype $c
	note G#, 15

Music_TitleScreen_branch_ebd40: ; ebd40
	note __, 15
	loopchannel 6, Music_TitleScreen_branch_ebd40
	note __, 11
	notetype $6
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	note C_, 0
	notetype $c
	note C_, 3
	note C_, 5
	note C_, 0
	note C_, 0
	note C_, 3
	note C_, 3
	note C_, 5
	note C_, 0
	note C_, 0
	note C_, 3
	note C_, 3
	note C_, 5
	note C_, 0
	note C_, 0
	note C_, 3
	note C_, 3
	note C_, 3
	notetype $8
	note C_, 1
	note C_, 1
	note C_, 1
	notetype $6
	note C#, 0
	note C#, 0
	note D_, 0
	note D_, 0
	note C#, 0
	note C#, 0
	note C_, 0
	note C_, 0
	notetype $c
	note C_, 3
	note B_, 3
	endchannel
; ebd77

Music_TitleScreen_branch_ebd77: ; ebd77
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note D#, 1
	endchannel
; ebd81

Music_TitleScreen_branch_ebd81: ; ebd81
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note D#, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note D#, 1
	endchannel
; ebd8b

Music_TitleScreen_branch_ebd8b: ; ebd8b
	note C_, 1
	note C_, 0
	note C_, 0
	loopchannel 4, Music_TitleScreen_branch_ebd8b
	endchannel
; ebd93

Music_TitleScreen_branch_ebd93: ; ebd93
	note C_, 1
	note C_, 0
	note C_, 0
	note C_, 1
	note C_, 0
	note C_, 0
	notetype $8
	note C_, 3
	note C_, 3
	endchannel
; ebd9e
