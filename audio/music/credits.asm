Music_Credits: ; 1f31c
	dbw $c0, Music_Credits_Ch1
	dbw $01, Music_Credits_Ch2
	dbw $02, Music_Credits_Ch3
	dbw $03, Music_Credits_Ch4
; 1f328

Music_Credits_Ch1: ; 1f328
	tempo 139
	volume $7, $7
	stereopanning $f
	waveduty $3
	notetype $c, $2, $1, $7
	octave 2
	note G_, 16
	notetype $6, $a, $0, $7
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	callchannel Music_Credits_branch_1f483
	note __, 4
	octave 3
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	volenvelope $9, $0, $6
	note A_, 1
	note G_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	volenvelope $9, $0, $4
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 1
	note B_, 1
	note A_, 1
	octave 3
	note __, 1
	volenvelope $a, $0, $7
	callchannel Music_Credits_branch_1f483
	callchannel Music_Credits_branch_1f4ed
	volenvelope $9, $0, $7
	callchannel Music_Credits_branch_1f4f8
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note C_, 2
	octave 3
	note B_, 2
	callchannel Music_Credits_branch_1f4f8
	callchannel Music_Credits_branch_1f559
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	volenvelope $a, $0, $7
	octave 5
	note E_, 2
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	note C#, 2
	note C#, 1
	note D_, 7
	note E_, 7
	octave 3
	note __, 1
	transpose $0, $2
	callchannel Music_Credits_branch_1f483
	callchannel Music_Credits_branch_1f4ed
	callchannel Music_Credits_branch_1f4f8
	callchannel Music_Credits_branch_1f559
	transpose $0, $0
	octave 3
	note A_, 12
	notetype $8, $a, $0, $7
	note D_, 1
	note D_, 1
	note D_, 1
	callchannel Music_Credits_branch_1f582
	octave 3
	note B_, 6
	note A_, 6
	note A_, 6
	note G_, 6
	note A#, 6
	note A#, 6
	note A_, 6
	octave 4
	note C#, 6
	callchannel Music_Credits_branch_1f582
	tempo 143
	octave 4
	note D_, 6
	octave 3
	note B_, 6
	note G_, 6
	octave 4
	note D_, 6
	tempo 146
	note E_, 6
	note F#, 6
	note A_, 6
	octave 5
	note C#, 6
	notetype $c, $a, $0, $7
Music_Credits_branch_1f407: ; 1f407
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	loopchannel 6, Music_Credits_branch_1f407
	notetype $8, $a, $0, $7
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	tempo 153
	notetype $c, $a, $0, $7
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	notetype $8, $a, $0, $7
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $c, $a, $0, $7
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $8, $a, $0, $7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	tempo 160
	notetype $c, $a, $0, $7
	octave 2
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $a, $0, $7
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $a, $0, $7
	octave 2
	note D_, 1
	note __, 7
	volenvelope $c, $0, $7
	octave 2
	note D_, 16
	volenvelope $b, $1, $0
	volenvelope $b, $0, $7
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1f483

Music_Credits_branch_1f483: ; 1f483
	note C_, 16
	note F#, 1
	note G_, 3
	note E_, 4
	note D_, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 4
	note G_, 4
	note __, 4
	octave 4
	note D_, 4
	note __, 4
	note E_, 4
	octave 3
	note A#, 4
	note G_, 4
	note E_, 4
	note G_, 4
	octave 4
	note G_, 4
	note C_, 4
	note D_, 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G#, 8
	note F_, 4
	note C_, 7
	note G#, 1
	note A_, 1
	note A#, 7
	note G#, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note E_, 4
	note C_, 4
	note E_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	endchannel
; 1f4ed

Music_Credits_branch_1f4ed: ; 1f4ed
	octave 4
	note C_, 4
	octave 3
	note D_, 4
	note G_, 4
	note B_, 8
	octave 4
	note D_, 4
	note C_, 4
	note D#, 4
	endchannel
; 1f4f8

Music_Credits_branch_1f4f8: ; 1f4f8
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note C_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 4
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G_, 4
	note A_, 2
	note B_, 2
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	note E_, 4
	octave 3
	note G#, 8
	octave 4
	note C_, 8
	note E_, 4
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	endchannel
; 1f559

Music_Credits_branch_1f559: ; 1f559
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	endchannel
; 1f582

Music_Credits_branch_1f582: ; 1f582
	note __, 6
	octave 3
	note D_, 6
	note E_, 6
	note F_, 6
	note F#, 6
	note A_, 6
	octave 4
	note F#, 6
	note C#, 6
	endchannel
; 1f58d

Music_Credits_Ch2: ; 1f58d
	waveduty $1
	vibrato $14, $2, $3
	notetype $c, $2, $1, $7
	stereopanning $f0
	octave 4
	note G_, 16
	volenvelope $c, $0, $7
	octave 5
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	notetype $6, $c, $0, $7
	callchannel Music_Credits_branch_1f6cb
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	note __, 2
	note F#, 2
	note G_, 2
	note __, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	volenvelope $9, $0, $7
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	volenvelope $c, $0, $7
	callchannel Music_Credits_branch_1f6cb
	callchannel Music_Credits_branch_1f73f
	callchannel Music_Credits_branch_1f748
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	note A_, 8
	note B_, 4
	note F#, 1
	note G_, 15
	notetype $c, $c, $0, $7
	octave 5
	note E_, 15
	notetype $6, $c, $0, $7
	note G_, 1
	note G#, 1
	note A_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	callchannel Music_Credits_branch_1f748
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	octave 5
	note C_, 12
	notetype $c, $c, $0, $7
	note D_, 16
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	octave 5
	note A_, 1
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	note E_, 1
	octave 3
	note A_, 4
	note G_, 4
	notetype $6, $c, $0, $7
	transpose $0, $2
	callchannel Music_Credits_branch_1f6cb
	callchannel Music_Credits_branch_1f73f
	callchannel Music_Credits_branch_1f748
	transpose $0, $0
	octave 5
	note C#, 1
	note D_, 11
	note C#, 8
	note D_, 12
	notetype $c, $c, $0, $7
	note E_, 16
	note A_, 14
	notetype $8, $c, $0, $7
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 6
	octave 3
	note F#, 6
	note G_, 6
	note G#, 6
	note A_, 6
	octave 4
	note C#, 6
	note A_, 6
	note G_, 6
	note G_, 6
	note F#, 6
	note F#, 6
	note E_, 6
	note E_, 6
	note D_, 6
	note C#, 6
	note E_, 6
	octave 1
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	notetype $c, $c, $0, $7
	octave 2
	note F#, 1
	note __, 1
	octave 1
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
Music_Credits_branch_1f657: ; 1f657
	octave 1
	note G_, 2
	octave 2
	note G_, 1
	note __, 1
	loopchannel 4, Music_Credits_branch_1f657
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 5
	note D_, 12
	notetype $8, $c, $0, $7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c, $0, $7
	note D_, 12
	notetype $8, $c, $0, $7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 9
	notetype $c, $c, $0, $7
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8, $c, $0, $7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $c, $c, $0, $7
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	notetype $8, $c, $0, $7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c, $0, $7
	note D_, 1
	note __, 7
	volenvelope $c, $1, $0
	volenvelope $c, $0, $7
	octave 1
	note D_, 16
	volenvelope $c, $0, $7
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1f6cb

Music_Credits_branch_1f6cb: ; 1f6cb
	octave 2
	note C_, 4
	volenvelope $b, $0, $1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	volenvelope $c, $0, $7
	octave 2
	note C_, 1
	note __, 1
	note C_, 4
	note __, 12
	octave 1
	note B_, 4
	note __, 10
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 2
	note G_, 2
	octave 1
	note B_, 6
	note A#, 4
	volenvelope $b, $0, $1
	octave 5
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 2
	note __, 2
	volenvelope $c, $0, $7
	octave 1
	note A#, 1
	note __, 1
	note A#, 4
	note __, 12
	note A_, 4
	note __, 10
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 2
	note F_, 2
	octave 1
	note A_, 6
	note G#, 4
	volenvelope $b, $0, $1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 5
	note C_, 2
	note __, 2
	volenvelope $c, $0, $7
	octave 1
	note G#, 1
	note __, 1
	note G#, 4
	note __, 12
	note G_, 4
	note __, 10
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 2
	note E_, 2
	octave 1
	note G_, 6
	note F#, 4
	note __, 2
	note F#, 2
	note F#, 2
	octave 2
	note D_, 2
	octave 1
	note F#, 4
	note A_, 2
	octave 2
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 3
	note C_, 2
	endchannel
; 1f73f

Music_Credits_branch_1f73f: ; 1f73f
	octave 1
	note G_, 4
	note __, 4
	note G_, 2
	note __, 2
	octave 2
	note G_, 12
	note F#, 8
	endchannel
; 1f748

Music_Credits_branch_1f748: ; 1f748
	octave 4
	note A_, 8
	note B_, 8
	octave 5
	note C_, 8
	note E_, 8
	notetype $c, $c, $0, $7
	note D_, 16
	octave 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 5
	note D_, 4
	note C_, 10
	notetype $6, $c, $0, $7
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	octave 4
	note B_, 4
	octave 5
	note C_, 4
	notetype $c, $c, $0, $7
	octave 4
	note A_, 10
	notetype $6, $c, $0, $7
	note G#, 1
	note A_, 3
	note B_, 4
	octave 5
	note C_, 4
	endchannel
; 1f772

Music_Credits_Ch3: ; 1f772
	vibrato $16, $2, $3
	notetype $c, $3, $0, $4
	stereopanning $ff
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	volenvelope $2, $0, $4
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	volenvelope $1, $0, $4
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	note D_, 1
	notetype $6, $1, $0, $4
	note D#, 1
	note E_, 7
	note F_, 8
	callchannel Music_Credits_branch_1f8aa
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	notetype $6, $1, $0, $4
	volenvelope $2, $0, $4
	note F_, 1
	note E_, 1
	volenvelope $1, $0, $4
	note E_, 4
	note __, 4
	note F_, 4
	callchannel Music_Credits_branch_1f8aa
	callchannel Music_Credits_branch_1f8db
	callchannel Music_Credits_branch_1f8e7
	callchannel Music_Credits_branch_1f934
	octave 2
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note G_, 2
	octave 2
	note E_, 4
	note __, 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 4
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	note E_, 2
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	note G_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G_, 2
	note F#, 4
	octave 3
	note E_, 4
	callchannel Music_Credits_branch_1f8e7
	callchannel Music_Credits_branch_1f934
	callchannel Music_Credits_branch_1f94b
	octave 5
	note D#, 1
	note E_, 7
	note F_, 8
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 2
	note __, 2
	octave 5
	note F_, 1
	note F#, 7
	note G_, 8
	transpose $0, $2
	callchannel Music_Credits_branch_1f8aa
	callchannel Music_Credits_branch_1f8db
	transpose $1, $2
	callchannel Music_Credits_branch_1f8e7
	transpose $0, $2
	callchannel Music_Credits_branch_1f934
	callchannel Music_Credits_branch_1f94b
	transpose $0, $0
	octave 6
	note C#, 2
	octave 5
	note A_, 2
	note E_, 2
	note C#, 2
	note A_, 2
	note E_, 2
	notetype $8, $1, $0, $4
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c, $1, $0, $4
	note D_, 16
	note F#, 16
	note G_, 16
	note G_, 8
	note A_, 8
	note __, 4
	octave 4
	note F#, 4
	note G_, 4
	note G#, 4
	note A_, 4
	octave 5
	note C#, 4
	note A_, 4
	note G_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 6
	note C#, 4
	note E_, 4
	volenvelope $1, $0, $5
	octave 4
	note D_, 6
	note F#, 2
	note A_, 8
	note E_, 6
	note G_, 2
	octave 5
	note C_, 6
	octave 4
	note B_, 1
	note A#, 1
	note A_, 8
	volenvelope $1, $0, $4
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $8, $1, $0, $4
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $1, $0, $4
	octave 5
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $1, $0, $4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $1, $0, $4
	note A_, 1
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1f8aa

Music_Credits_branch_1f8aa: ; 1f8aa
	note G_, 16
	octave 6
	note C#, 1
	note D_, 3
	note C_, 4
	octave 5
	note B_, 4
	octave 6
	note C_, 4
	notetype $c, $1, $0, $4
	octave 5
	note G_, 10
	note E_, 2
	note __, 2
	note F_, 2
	note G_, 10
	notetype $6, $1, $0, $4
	note G#, 1
	note A_, 7
	note E_, 4
	note G_, 12
	note F_, 8
	note D_, 4
	note __, 4
	note E_, 4
	notetype $c, $1, $0, $4
	note F_, 10
	notetype $6, $1, $0, $4
	note F#, 1
	note G_, 7
	note F_, 4
	note E_, 4
	note D#, 4
	note E_, 4
	note B_, 12
	note A_, 8
	notetype $c, $1, $0, $4
	note D_, 16
	endchannel
; 1f8db

Music_Credits_branch_1f8db: ; 1f8db
	notetype $6, $1, $0, $4
	note F#, 1
	note G_, 3
	octave 4
	note G_, 4
	octave 5
	note D_, 4
	note G_, 12
	note G#, 8
	endchannel
; 1f8e7

Music_Credits_branch_1f8e7: ; 1f8e7
	octave 3
	note F_, 4
	note __, 2
	note F_, 2
	note __, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 4
	note G_, 4
	note __, 2
	note G_, 2
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 4
	note E_, 4
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note G_, 2
	note E_, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	note E_, 4
	note A_, 4
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note __, 2
	note G#, 2
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	endchannel
; 1f934

Music_Credits_branch_1f934: ; 1f934
	octave 2
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 4
	note A_, 2
	octave 3
	note C_, 2
	note E_, 2
	note F_, 2
	endchannel
; 1f94b

Music_Credits_branch_1f94b: ; 1f94b
	octave 2
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 4
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note F#, 2
	note G_, 8
	octave 4
	note C_, 8
	note D_, 8
	note F_, 8
	octave 6
	note G_, 2
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	octave 6
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	note D_, 2
	endchannel
; 1f973

Music_Credits_Ch4: ; 1f973
	drumkittoggle $3
	notetype $c
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note A#, 4
	note A#, 4
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d
Music_Credits_branch_1f9a8: ; 1f9a8
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1f9a8
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
Music_Credits_branch_1f9c6: ; 1f9c6
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1f9c6
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note A#, 4
	note C#, 4
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note B_, 2
	note A#, 4
	note A#, 4
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d
Music_Credits_branch_1f9f2: ; 1f9f2
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1f9f2
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 7
	notetype $8
	note A#, 1
	note A#, 1
	note A#, 1
	notetype $c
	note B_, 16
	note __, 16
	note B_, 15
	note __, 1
	note B_, 8
	note B_, 8
	note B_, 16
	note __, 16
	note B_, 16
	note B_, 8
	note B_, 6
	note D_, 1
	note D_, 1
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	notetype $c
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8
	note C#, 2
	note C#, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	notetype $8
	note C#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 7
	note A#, 8
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1fa4d

Music_Credits_branch_1fa4d: ; 1fa4d
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 2
	endchannel
; 1fa6d

Music_Credits_branch_1fa6d: ; 1fa6d
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note A#, 1
	note D_, 1
	endchannel
; 1fa8d


