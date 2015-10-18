Music_TitleScreen: ; eb808
	dbw $c0, Music_TitleScreen_Ch1
	dbw $01, Music_TitleScreen_Ch2
	dbw $02, Music_TitleScreen_Ch3
	dbw $03, Music_TitleScreen_Ch4
; eb814

Music_TitleScreen_Ch1: ; eb814
	tempo 134
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0002
	vibrato $10, $1, $2
	stereopanning $f0
	notetype $c, $a, $0, $7
	volenvelope $a, $0, $0
	octave 3
	note __, 4
	volenvelope $a, $0, $7
	octave 2
	note G_, 1
	note __, 2
	note A_, 1
	note B_, 8
	note G_, 4
	octave 3
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note C_, 4
	octave 2
	note B_, 1
	note __, 2
	octave 3
	note C_, 1
	octave 2
	note B_, 8
	note A_, 4
	note A_, 1
	note __, 2
	note B_, 1
	octave 3
	note C_, 6
	note E_, 4
	note F#, 2
	stereopanning $ff
	octave 4
	note G_, 1
	stereopanning $f0
	octave 3
	note D_, 5
	octave 2
	note B_, 2
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	volenvelope $b, $0, $7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a, $0, $7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 3
	note D_, 6
	note E_, 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a, $0, $0
	octave 2
	note B_, 6
	notetype $8, $a, $0, $7
	note B_, 6
	notetype $8, $a, $0, $7
	octave 3
	note F_, 4
	note E_, 4
	note C_, 4
	notetype $8, $a, $0, $0
	note D_, 6
	notetype $8, $a, $0, $7
	note D_, 6
	notetype $8, $a, $0, $7
	note __, 3
	octave 2
	note B_, 3
	octave 3
	note C_, 3
	note D_, 3
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 6
	octave 2
	note B_, 6
	octave 3
	note C_, 9
	note F_, 9
	note C_, 6
	note D_, 9
	notetype $c, $b, $0, $7
	note D#, 1
	note E_, 1
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype $8, $a, $0, $7
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	note D_, 9
	octave 2
	note B_, 3
	octave 3
	note D_, 9
	notetype $8, $b, $0, $7
	note G_, 3
	note A_, 4
	note G_, 4
	note F_, 4
	note F_, 6
	note E_, 6
	note D_, 9
	note F_, 3
	note G_, 3
	note D_, 6
	note G_, 3
	notetype $8, $5, $0, $4
	octave 2
	note G_, 3
	note B_, 3
	notetype $8, $9, $0, $4
	octave 3
	note D_, 3
	note G_, 3
	tempo 136
	notetype $8, $b, $0, $4
	note F_, 3
	note A_, 3
	notetype $8, $d, $0, $4
	octave 4
	note C_, 3
	note F_, 3
	tempo 138
	notetype $8, $b, $0, $4
	note D_, 9
	note C_, 9
	octave 3
	note A#, 6
	notetype $c, $b, $0, $7
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 4
	octave 4
	note D_, 4
	note F_, 4
	note E_, 6
	octave 3
	note G_, 2
	notetype $8, $b, $0, $7
	note A_, 4
	note G_, 4
	note F_, 4
	note G_, 12
	octave 4
	note C_, 6
	tempo 136
	note C#, 6
	tempo 134
	callchannel Music_TitleScreen_branch_eb96d
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_TitleScreen_branch_eb96d
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_TitleScreen_branch_eb96d
	octave 3
	note E_, 4
	note E_, 4
	note C_, 4
	notetype $c, $a, $0, $0
	note D_, 6
	notetype $c, $a, $0, $7
	note D_, 10
	volenvelope $a, $0, $0
	note C_, 8
	volenvelope $a, $0, $7
	note C_, 8
	volenvelope $a, $0, $0
	octave 2
	note B_, 8
	volenvelope $a, $0, $7
	note B_, 8
	octave 3
	note C_, 8
	octave 2
	note B_, 8
	octave 3
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note F_, 8
	note A_, 8
	note G_, 6
	note G_, 1
	note F#, 1
	note F_, 8
	note E_, 8
	volenvelope $a, $0, $0
	note D_, 16
	volenvelope $a, $0, $7
	note D_, 16
	volenvelope $a, $0, $3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $b, $0, $2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note F#, 2
	notetype $c, $b, $0, $7
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; eb96d

Music_TitleScreen_branch_eb96d: ; eb96d
	notetype $c, $c, $0, $3
	note D_, 1
Music_TitleScreen_branch_eb971: ; eb971
	note __, 1
	octave 2
	note D_, 1
	octave 1
	note A_, 1
	octave 2
	note D_, 1
	loopchannel 5, Music_TitleScreen_branch_eb971
	note __, 1
	note D_, 1
	octave 1
	note A_, 1
	notetype $8, $b, $0, $7
	endchannel
; eb984

Music_TitleScreen_Ch2: ; eb984
	setwaveduty $3
	vibrato $14, $1, $2
	notetype $c, $c, $0, $7
	volenvelope $a, $0, $4
	octave 1
	note G_, 1
	octave 2
	note D_, 1
	note G_, 1
	octave 3
	note C_, 1
	volenvelope $c, $0, $2
	octave 3
	note B_, 1
	note __, 2
	note A_, 1
	volenvelope $b, $0, $0
	note G_, 6
	volenvelope $b, $0, $7
	note G_, 6
	note __, 16
	note __, 16
	volenvelope $c, $0, $7
	octave 4
	note C_, 1
	note __, 2
	note D_, 1
	note E_, 8
	note F#, 2
	note E_, 1
	note F#, 1
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	volenvelope $9, $0, $7
	octave 2
	note A_, 4
	note F_, 4
	stereopanning $ff
	volenvelope $c, $0, $7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	volenvelope $9, $0, $7
	octave 2
	note A_, 6
	octave 3
	note C_, 2
	stereopanning $f
	volenvelope $a, $0, $3
	octave 4
	note D_, 4
	note D_, 2
	note C_, 4
	note C_, 2
	octave 3
	note B_, 4
	stereopanning $ff
	volenvelope $c, $0, $7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	volenvelope $9, $0, $7
	octave 2
	note A_, 2
	note F_, 4
	note A_, 2
	stereopanning $ff
	notetype $8, $c, $0, $7
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	note D_, 12
	stereopanning $f0
	notetype $8, $b, $0, $7
	octave 2
	note A_, 9
	stereopanning $f
	notetype $c, $c, $0, $7
	note G_, 1
	note A_, 1
	note B_, 6
	note E_, 1
	note F#, 1
	note G_, 4
	notetype $c, $4, $1, $3
	note A_, 4
	stereopanning $ff
	notetype $c, $c, $0, $7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	stereopanning $f0
	volenvelope $9, $0, $7
	octave 2
	note A_, 2
	note F_, 6
	stereopanning $ff
	volenvelope $c, $0, $7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	stereopanning $f0
	volenvelope $9, $0, $7
	octave 3
	note C_, 2
	octave 2
	note A_, 6
	note B_, 6
	note G_, 2
	notetype $8, $c, $0, $7
	note F_, 4
	note G_, 4
	note F_, 4
	stereopanning $ff
	octave 3
	note G_, 9
	note B_, 3
	octave 4
	note D_, 12
	stereopanning $f0
	notetype $8, $a, $0, $7
	octave 3
	note D_, 4
	note C_, 4
	note D_, 4
	stereopanning $ff
	notetype $8, $c, $0, $7
	octave 4
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 9
	note A#, 3
	notetype $c, $b, $0, $0
	note G_, 8
	notetype $c, $b, $0, $7
	note G_, 8
	volenvelope $c, $0, $6
	note A_, 4
	volenvelope $5, $1, $5
	note A_, 4
	volenvelope $c, $0, $7
	note A#, 6
	volenvelope $c, $0, $3
	note F_, 2
	volenvelope $c, $0, $7
	note F_, 8
	volenvelope $a, $0, $7
	octave 3
	note A#, 8
	volenvelope $c, $0, $7
	octave 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 6
	volenvelope $c, $0, $3
	octave 4
	note G_, 2
	volenvelope $c, $0, $7
	note G_, 8
	volenvelope $a, $0, $7
	octave 3
	note E_, 8
	volenvelope $c, $0, $7
	octave 5
	note C_, 4
	note C#, 4
	setpitchoffset $0001
	stereopanning $f
	callchannel Music_TitleScreen_branch_ebae7
	note C#, 4
	callchannel Music_TitleScreen_branch_ebae7
	note C#, 4
	callchannel Music_TitleScreen_branch_ebae7
	octave 4
	note A_, 4
	stereopanning $ff
	setpitchoffset $0000
	notetype $c, $b, $0, $0
	octave 3
	note B_, 6
	notetype $c, $b, $0, $7
	note B_, 10
	volenvelope $c, $0, $7
	note A_, 8
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	volenvelope $b, $0, $0
	note G_, 8
	volenvelope $b, $0, $7
	note G_, 8
	volenvelope $c, $0, $7
	note F_, 8
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	note A_, 6
	note F_, 1
	note A_, 1
	volenvelope $b, $0, $0
	note G_, 16
	volenvelope $b, $0, $7
	note G_, 16
	volenvelope $c, $0, $2
	octave 4
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	volenvelope $9, $0, $0
	note G_, 4
	notetype $8, $c, $0, $2
	octave 3
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F#, 2
	notetype $c, $c, $0, $7
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 11
	endchannel
; ebae7

Music_TitleScreen_branch_ebae7: ; ebae7
	notetype $c, $b, $0, $2
	note D_, 1
Music_TitleScreen_branch_ebaeb: ; ebaeb
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	note D_, 1
	loopchannel 5, Music_TitleScreen_branch_ebaeb
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note A_, 1
	notetype $8, $b, $0, $7
	octave 5
	note C_, 4
	note C_, 4
	endchannel
; ebb01

Music_TitleScreen_Ch3: ; ebb01
	stereopanning $f
	vibrato $10, $1, $4
	setpitchoffset $0001
	notetype $c, $1, $0, $6
	octave 3
	octave 3
	note __, 4
	octave 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note C_, 1
	octave 1
	note B_, 1
	octave 2
	note C_, 1
	note __, 1
	note F_, 2
	note C_, 1
	note __, 1
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note G_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 2
	note F_, 1
	note E_, 1
	note F_, 1
	note __, 1
	note A_, 2
	note F_, 2
	note A_, 4
	octave 3
	note C_, 2
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	note G_, 4
	note B_, 2
	note A_, 4
	note B_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	note B_, 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 4
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note D_, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 4
	note G_, 2
	note B_, 4
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	octave 3
	note C_, 2
	note D_, 6
	octave 2
	note A#, 6
	octave 3
	note F_, 4
	note A#, 6
	note F_, 6
	note D_, 4
	note E_, 6
	note C_, 6
	note E_, 4
	octave 4
	note C_, 6
	octave 3
	note G_, 6
	note E_, 4
	note D_, 1
	note __, 1
	stereopanning $ff
	notetype $c, $1, $0, $6
	setpitchoffset $0000
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note D_, 1
	note __, 2
	note E_, 1
	note F#, 4
	notetype $8, $1, $0, $6
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $1, $0, $6
	note D_, 1
	note __, 1
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note A_, 6
	note G_, 2
	note F#, 2
	note B_, 1
	note __, 2
	note A_, 1
	note A_, 4
	notetype $8, $1, $0, $6
	octave 3
	note C_, 4
	note C_, 4
	note C#, 4
	notetype $c, $1, $0, $6
	note D_, 1
	note __, 1
	notetype $c, $1, $0, $6
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note G_, 6
	note E_, 2
	note G_, 2
	note F#, 1
	note E_, 1
	note D_, 6
	setpitchoffset $0001
	notetype $8, $1, $0, $6
	octave 3
	note C_, 4
	note C_, 4
	note E_, 2
	note F#, 2
	stereopanning $f
	notetype $c, $1, $0, $6
	note G_, 16
	note F_, 16
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 2
	note F_, 12
	note E_, 1
	note D#, 1
	note D_, 8
	note G_, 8
	note F_, 8
	note A_, 8
	note G_, 8
	note D_, 6
	note D_, 1
	note E_, 1
	note F_, 16
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	octave 2
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype $8, $1, $0, $6
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note A_, 2
	notetype $c, $1, $0, $6
	note G_, 1
	note __, 3
	octave 1
	note G_, 1
	note __, 11
	endchannel
; ebc5c

Music_TitleScreen_Ch4: ; ebc5c
	togglenoise $5
	stereopanning $f0
	notetype $c
	note __, 4
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 6
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 3
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 4
	note D#, 2
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd77
	callchannel Music_TitleScreen_branch_ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note D#, 4
	note A_, 4
	note D#, 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 2
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $c
	callchannel Music_TitleScreen_branch_ebd8b
	callchannel Music_TitleScreen_branch_ebd93
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	note G#, 16
Music_TitleScreen_branch_ebd40: ; ebd40
	note __, 16
	loopchannel 6, Music_TitleScreen_branch_ebd40
	note __, 12
	notetype $6
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 6
	note C_, 1
	note C_, 1
	note C_, 4
	note C_, 4
	note C_, 4
	notetype $8
	note C_, 2
	note C_, 2
	note C_, 2
	notetype $6
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note C_, 1
	note C_, 1
	notetype $c
	note C_, 4
	note B_, 4
	endchannel
; ebd77

Music_TitleScreen_branch_ebd77: ; ebd77
	note C_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd81

Music_TitleScreen_branch_ebd81: ; ebd81
	note C_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note D#, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note D#, 2
	endchannel
; ebd8b

Music_TitleScreen_branch_ebd8b: ; ebd8b
	note C_, 2
	note C_, 1
	note C_, 1
	loopchannel 4, Music_TitleScreen_branch_ebd8b
	endchannel
; ebd93

Music_TitleScreen_branch_ebd93: ; ebd93
	note C_, 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
	notetype $8
	note C_, 4
	note C_, 4
	endchannel
; ebd9e


