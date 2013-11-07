Music_Credits: ; 1f31c
	dbw $c0, Music_Credits_Ch1
	dbw $01, Music_Credits_Ch2
	dbw $02, Music_Credits_Ch3
	dbw $03, Music_Credits_Ch4
; 1f328


Music_Credits_Ch1: ; 1f328
	tempo 139
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $2f
	octave 2
	note G_, 15
	notetype $6, $a7
	octave 3
	note B_, 11
	note A#, 1
	note A_, 1
	note B_, 0
	octave 4
	note C_, 6
	note D_, 7
	callchannel Music_Credits_branch_1f483
	note __, 3
	octave 3
	note B_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 1
	note A_, 1
	note B_, 1
	intensity $96
	note A_, 0
	note G_, 0
	octave 3
	note D_, 0
	note C_, 0
	octave 2
	note B_, 0
	note A_, 0
	intensity $94
	note G_, 0
	note F_, 0
	note E_, 0
	note D_, 0
	note C_, 0
	octave 1
	note B_, 0
	note A_, 0
	octave 3
	note __, 0
	intensity $a7
	callchannel Music_Credits_branch_1f483
	callchannel Music_Credits_branch_1f4ed
	intensity $97
	callchannel Music_Credits_branch_1f4f8
	octave 3
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note C_, 1
	octave 3
	note B_, 1
	callchannel Music_Credits_branch_1f4f8
	callchannel Music_Credits_branch_1f559
	note B_, 0
	octave 4
	note C_, 6
	note D_, 7
	intensity $a7
	octave 5
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	note E_, 1
	octave 5
	note C#, 1
	octave 4
	note A_, 1
	note E_, 1
	note C#, 1
	note C#, 0
	note D_, 6
	note E_, 6
	octave 3
	note __, 0
	forceoctave $2
	callchannel Music_Credits_branch_1f483
	callchannel Music_Credits_branch_1f4ed
	callchannel Music_Credits_branch_1f4f8
	callchannel Music_Credits_branch_1f559
	forceoctave $0
	octave 3
	note A_, 11
	notetype $8, $a7
	note D_, 0
	note D_, 0
	note D_, 0
	callchannel Music_Credits_branch_1f582
	octave 3
	note B_, 5
	note A_, 5
	note A_, 5
	note G_, 5
	note A#, 5
	note A#, 5
	note A_, 5
	octave 4
	note C#, 5
	callchannel Music_Credits_branch_1f582
	tempo 143
	octave 4
	note D_, 5
	octave 3
	note B_, 5
	note G_, 5
	octave 4
	note D_, 5
	tempo 146
	note E_, 5
	note F#, 5
	note A_, 5
	octave 5
	note C#, 5
	notetype $c, $a7

Music_Credits_branch_1f407: ; 1f407
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	loopchannel 6, Music_Credits_branch_1f407
	notetype $8, $a7
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 0
	tempo 153
	notetype $c, $a7
	octave 3
	note C_, 0
	note E_, 0
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note E_, 0
	note G_, 0
	octave 4
	note C_, 0
	note E_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note E_, 0
	note G_, 0
	notetype $8, $a7
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	notetype $c, $a7
	octave 3
	note D_, 0
	note F#, 0
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F#, 0
	note A_, 0
	octave 4
	note D_, 0
	note E_, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	notetype $8, $a7
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	tempo 160
	notetype $c, $a7
	octave 2
	note G_, 0
	note __, 2
	note E_, 0
	note __, 2
	notetype $8, $a7
	octave 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C#, 0
	note __, 0
	notetype $c, $a7
	octave 2
	note D_, 0
	note __, 6
	intensity $c7
	octave 2
	note D_, 15
	intensity $b8
	intensity $b7
	note __, 15
	note __, 15
	note __, 15
	endchannel
; 1f483

Music_Credits_branch_1f483: ; 1f483
	note C_, 15
	note F#, 0
	note G_, 2
	note E_, 3
	note D_, 3
	note E_, 3
	note D_, 3
	octave 3
	note B_, 1
	note __, 1
	note A#, 1
	note B_, 1
	note __, 1
	note A#, 1
	note B_, 3
	note G_, 3
	note __, 3
	octave 4
	note D_, 3
	note __, 3
	note E_, 3
	octave 3
	note A#, 3
	note G_, 3
	note E_, 3
	note G_, 3
	octave 4
	note G_, 3
	note C_, 3
	note D_, 3
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note A_, 3
	note __, 3
	octave 4
	note C_, 3
	octave 3
	note G#, 7
	note F_, 3
	note C_, 6
	note G#, 0
	note A_, 0
	note A#, 6
	note G#, 3
	note __, 3
	octave 4
	note C_, 3
	octave 3
	note G_, 3
	note E_, 3
	note C_, 3
	note E_, 3
	note G_, 3
	octave 4
	note C_, 3
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	octave 4
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 6
	note C_, 0
	note __, 0
	endchannel
; 1f4ed

Music_Credits_branch_1f4ed: ; 1f4ed
	octave 4
	note C_, 3
	octave 3
	note D_, 3
	note G_, 3
	note B_, 7
	octave 4
	note D_, 3
	note C_, 3
	note D#, 3
	endchannel
; 1f4f8

Music_Credits_branch_1f4f8: ; 1f4f8
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	note C_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	octave 3
	note A_, 1
	octave 4
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 3
	note B_, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F_, 1
	note F#, 1
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note C_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note G_, 3
	note A_, 1
	note B_, 1
	octave 3
	note A_, 3
	octave 4
	note C_, 3
	note E_, 3
	octave 3
	note G#, 7
	octave 4
	note C_, 7
	note E_, 3
	octave 3
	note A_, 1
	octave 4
	note F_, 1
	note C_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	octave 3
	note A_, 1
	octave 4
	note F_, 1
	note C_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	endchannel
; 1f559

Music_Credits_branch_1f559: ; 1f559
	octave 3
	note A_, 1
	octave 4
	note F#, 1
	note C_, 1
	note F#, 1
	note D_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note C_, 1
	note F#, 1
	octave 3
	note A_, 1
	octave 4
	note F#, 1
	note C_, 1
	note F#, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 3
	note B_, 11
	note A#, 1
	note A_, 1
	endchannel
; 1f582

Music_Credits_branch_1f582: ; 1f582
	note __, 5
	octave 3
	note D_, 5
	note E_, 5
	note F_, 5
	note F#, 5
	note A_, 5
	octave 4
	note F#, 5
	note C#, 5
	endchannel

Music_Credits_Ch2: ; 1f58d
	dutycycle $1
	vibrato $14, $23
	notetype $c, $2f
	stereopanning $f0
	octave 4
	note G_, 15
	intensity $c7
	octave 5
	note G_, 7
	octave 3
	note G_, 3
	note F_, 3
	notetype $6, $c7
	callchannel Music_Credits_branch_1f6cb
	octave 1
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	intensity $97
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	intensity $c7
	callchannel Music_Credits_branch_1f6cb
	callchannel Music_Credits_branch_1f73f
	callchannel Music_Credits_branch_1f748
	octave 4
	note B_, 0
	octave 5
	note C_, 10
	octave 4
	note B_, 7
	note A_, 7
	note B_, 3
	note F#, 0
	note G_, 14
	notetype $c, $c7
	octave 5
	note E_, 14
	notetype $6, $c7
	note G_, 0
	note G#, 0
	note A_, 1
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	note E_, 1
	callchannel Music_Credits_branch_1f748
	octave 4
	note B_, 0
	octave 5
	note C_, 10
	octave 4
	note B_, 7
	octave 5
	note C_, 11
	notetype $c, $c7
	note D_, 15
	note G_, 7
	octave 3
	note G_, 3
	note F_, 3
	octave 5
	note A_, 0
	note E_, 0
	note C#, 0
	octave 4
	note A_, 0
	octave 5
	note E_, 0
	note C#, 0
	octave 4
	note A_, 0
	note E_, 0
	octave 3
	note A_, 3
	note G_, 3
	notetype $6, $c7
	forceoctave $2
	callchannel Music_Credits_branch_1f6cb
	callchannel Music_Credits_branch_1f73f
	callchannel Music_Credits_branch_1f748
	forceoctave $0
	octave 5
	note C#, 0
	note D_, 10
	note C#, 7
	note D_, 11
	notetype $c, $c7
	note E_, 15
	note A_, 13
	notetype $8, $c7
	octave 2
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 5
	octave 3
	note F#, 5
	note G_, 5
	note G#, 5
	note A_, 5
	octave 4
	note C#, 5
	note A_, 5
	note G_, 5
	note G_, 5
	note F#, 5
	note F#, 5
	note E_, 5
	note E_, 5
	note D_, 5
	note C#, 5
	note E_, 5
	octave 1
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	notetype $c, $c7
	octave 2
	note F#, 0
	note __, 0
	octave 1
	note F#, 1
	octave 2
	note F#, 0
	note __, 0

Music_Credits_branch_1f657: ; 1f657
	octave 1
	note G_, 1
	octave 2
	note G_, 0
	note __, 0
	loopchannel 4, Music_Credits_branch_1f657
	octave 1
	note A_, 0
	octave 2
	note A_, 0
	note E_, 0
	note A_, 0
	octave 1
	note A_, 0
	octave 2
	note A_, 0
	note E_, 0
	note A_, 0
	octave 1
	note A_, 0
	octave 3
	note C#, 0
	note E_, 0
	note G_, 0
	note E_, 0
	note G_, 0
	note A_, 0
	octave 4
	note C#, 0
	octave 5
	note D_, 11
	notetype $8, $c7
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C#, 0
	note __, 0
	notetype $c, $c7
	note D_, 11
	notetype $8, $c7
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C#, 0
	note __, 0
	note D_, 8
	notetype $c, $c7
	octave 4
	note F#, 0
	note A_, 0
	octave 5
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	notetype $8, $c7
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	notetype $c, $c7
	note C_, 0
	note __, 2
	note C_, 0
	note __, 2
	notetype $8, $c7
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C#, 0
	note __, 0
	notetype $c, $c7
	note D_, 0
	note __, 6
	intensity $c8
	intensity $c7
	octave 1
	note D_, 15
	intensity $c7
	note __, 15
	note __, 15
	note __, 15
	endchannel
; 1f6cb

Music_Credits_branch_1f6cb: ; 1f6cb
	octave 2
	note C_, 3
	intensity $b1
	octave 5
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note G_, 1
	note __, 1
	intensity $c7
	octave 2
	note C_, 0
	note __, 0
	note C_, 3
	note __, 11
	octave 1
	note B_, 3
	note __, 9
	note B_, 0
	note __, 0
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 2
	note G_, 1
	octave 1
	note B_, 5
	note A#, 3
	intensity $b1
	octave 5
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note D#, 0
	note __, 0
	note E_, 1
	note __, 1
	intensity $c7
	octave 1
	note A#, 0
	note __, 0
	note A#, 3
	note __, 11
	note A_, 3
	note __, 9
	note A_, 0
	note __, 0
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 2
	note F_, 1
	octave 1
	note A_, 5
	note G#, 3
	intensity $b1
	octave 5
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note B_, 0
	note __, 0
	octave 5
	note C_, 1
	note __, 1
	intensity $c7
	octave 1
	note G#, 0
	note __, 0
	note G#, 3
	note __, 11
	note G_, 3
	note __, 9
	note G_, 0
	note __, 0
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note E_, 1
	octave 1
	note G_, 5
	note F#, 3
	note __, 1
	note F#, 1
	note F#, 1
	octave 2
	note D_, 1
	octave 1
	note F#, 3
	note A_, 1
	octave 2
	note D_, 1
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 3
	note C_, 1
	endchannel
; 1f73f

Music_Credits_branch_1f73f: ; 1f73f
	octave 1
	note G_, 3
	note __, 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 11
	note F#, 7
	endchannel
; 1f748

Music_Credits_branch_1f748: ; 1f748
	octave 4
	note A_, 7
	note B_, 7
	octave 5
	note C_, 7
	note E_, 7
	notetype $c, $c7
	note D_, 15
	octave 4
	note G_, 3
	note A_, 3
	note B_, 3
	octave 5
	note D_, 3
	note C_, 9
	notetype $6, $c7
	octave 4
	note B_, 0
	octave 5
	note C_, 2
	octave 4
	note B_, 3
	octave 5
	note C_, 3
	notetype $c, $c7
	octave 4
	note A_, 9
	notetype $6, $c7
	note G#, 0
	note A_, 2
	note B_, 3
	octave 5
	note C_, 3
	endchannel

Music_Credits_Ch3: ; 1f772
	vibrato $16, $23
	notetype $c, $34
	stereopanning $ff
	octave 6
	note G_, 0
	note D_, 0
	note C_, 0
	octave 5
	note G_, 0
	octave 6
	note G_, 0
	note D_, 0
	note C_, 0
	octave 5
	note G_, 0
	intensity $24
	octave 6
	note G_, 0
	note D_, 0
	note C_, 0
	octave 5
	note G_, 0
	intensity $14
	octave 6
	note G_, 0
	note D_, 0
	note C_, 0
	octave 5
	note G_, 0
	octave 6
	note G_, 0
	note D_, 0
	octave 5
	note B_, 0
	note G_, 0
	octave 6
	note D_, 0
	octave 5
	note B_, 0
	note G_, 0
	note D_, 0
	notetype $6, $14
	note D#, 0
	note E_, 6
	note F_, 7
	callchannel Music_Credits_branch_1f8aa
	octave 4
	note G_, 0
	note __, 0
	octave 5
	note G_, 0
	note __, 0
	note F#, 0
	note G_, 0
	note __, 0
	note F#, 0
	note G_, 0
	notetype $6, $14
	intensity $24
	note F_, 0
	note E_, 0
	intensity $14
	note E_, 3
	note __, 3
	note F_, 3
	callchannel Music_Credits_branch_1f8aa
	callchannel Music_Credits_branch_1f8db
	callchannel Music_Credits_branch_1f8e7
	callchannel Music_Credits_branch_1f934
	octave 2
	note G_, 3
	note __, 1
	note G_, 0
	note __, 0
	note G_, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 0
	note __, 0
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 3
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note G_, 1
	octave 2
	note E_, 3
	note __, 1
	note E_, 0
	note __, 0
	note E_, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note E_, 0
	note __, 0
	note E_, 1
	octave 3
	note E_, 1
	octave 2
	note E_, 3
	note G#, 1
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	octave 2
	note A_, 3
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note G#, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note G#, 1
	note G_, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note G_, 1
	note F#, 3
	octave 3
	note E_, 3
	callchannel Music_Credits_branch_1f8e7
	callchannel Music_Credits_branch_1f934
	callchannel Music_Credits_branch_1f94b
	octave 5
	note D#, 0
	note E_, 6
	note F_, 7
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	octave 5
	note F_, 0
	note F#, 6
	note G_, 7
	forceoctave $2
	callchannel Music_Credits_branch_1f8aa
	callchannel Music_Credits_branch_1f8db
	forceoctave $12
	callchannel Music_Credits_branch_1f8e7
	forceoctave $2
	callchannel Music_Credits_branch_1f934
	callchannel Music_Credits_branch_1f94b
	forceoctave $0
	octave 6
	note C#, 1
	octave 5
	note A_, 1
	note E_, 1
	note C#, 1
	note A_, 1
	note E_, 1
	notetype $8, $14
	octave 2
	note D_, 0
	note D_, 0
	note D_, 0
	notetype $c, $14
	note D_, 15
	note F#, 15
	note G_, 15
	note G_, 7
	note A_, 7
	note __, 3
	octave 4
	note F#, 3
	note G_, 3
	note G#, 3
	note A_, 3
	octave 5
	note C#, 3
	note A_, 3
	note G_, 3
	note G_, 3
	note F#, 3
	note E_, 3
	note G_, 3
	note A_, 3
	note B_, 3
	octave 6
	note C#, 3
	note E_, 3
	intensity $15
	octave 4
	note D_, 5
	note F#, 1
	note A_, 7
	note E_, 5
	note G_, 1
	octave 5
	note C_, 5
	octave 4
	note B_, 0
	note A#, 0
	note A_, 7
	intensity $14
	octave 2
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	notetype $8, $14
	octave 3
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	notetype $c, $14
	octave 5
	note G_, 0
	note __, 2
	note E_, 0
	note __, 2
	notetype $8, $14
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 0
	notetype $c, $14
	note A_, 0
	note __, 15
	note __, 15
	note __, 15
	endchannel
; 1f8aa

Music_Credits_branch_1f8aa: ; 1f8aa
	note G_, 15
	octave 6
	note C#, 0
	note D_, 2
	note C_, 3
	octave 5
	note B_, 3
	octave 6
	note C_, 3
	notetype $c, $14
	octave 5
	note G_, 9
	note E_, 1
	note __, 1
	note F_, 1
	note G_, 9
	notetype $6, $14
	note G#, 0
	note A_, 6
	note E_, 3
	note G_, 11
	note F_, 7
	note D_, 3
	note __, 3
	note E_, 3
	notetype $c, $14
	note F_, 9
	notetype $6, $14
	note F#, 0
	note G_, 6
	note F_, 3
	note E_, 3
	note D#, 3
	note E_, 3
	note B_, 11
	note A_, 7
	notetype $c, $14
	note D_, 15
	endchannel
; 1f8db

Music_Credits_branch_1f8db: ; 1f8db
	notetype $6, $14
	note F#, 0
	note G_, 2
	octave 4
	note G_, 3
	octave 5
	note D_, 3
	note G_, 11
	note G#, 7
	endchannel
; 1f8e7

Music_Credits_branch_1f8e7: ; 1f8e7
	octave 3
	note F_, 3
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note F_, 3
	note G_, 3
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note G_, 3
	note E_, 3
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note G_, 1
	note E_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note B_, 1
	note E_, 3
	note A_, 3
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	note __, 1
	note G#, 1
	octave 4
	note C_, 1
	note E_, 1
	note C_, 1
	octave 3
	note G#, 1
	endchannel
; 1f934

Music_Credits_branch_1f934: ; 1f934
	octave 2
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note F_, 0
	note __, 0
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 3
	note A_, 1
	octave 3
	note C_, 1
	note E_, 1
	note F_, 1
	endchannel
; 1f94b

Music_Credits_branch_1f94b: ; 1f94b
	octave 2
	note F#, 3
	note __, 1
	note F#, 0
	note __, 0
	note F#, 1
	octave 3
	note F#, 1
	note __, 1
	octave 2
	note F#, 0
	note __, 0
	note F#, 1
	octave 3
	note F#, 1
	octave 2
	note F#, 3
	note A_, 1
	octave 3
	note C_, 1
	note F_, 1
	note F#, 1
	note G_, 7
	octave 4
	note C_, 7
	note D_, 7
	note F_, 7
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
	endchannel

Music_Credits_Ch4: ; 1f973
	togglenoise $3
	notetype $c
	note G#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note B_, 1
	note G#, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note A#, 3
	note A#, 3
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d

Music_Credits_branch_1f9a8: ; 1f9a8
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note F#, 1
	loopchannel 7, Music_Credits_branch_1f9a8
	note G#, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note G_, 0
	note D_, 0
	note F#, 1
	note D_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note C#, 0
	note C#, 0
	note D_, 0
	note D_, 0

Music_Credits_branch_1f9c6: ; 1f9c6
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note F#, 1
	loopchannel 7, Music_Credits_branch_1f9c6
	note G#, 0
	note G_, 0
	note F#, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note A#, 3
	note C#, 3
	note G#, 0
	note G_, 0
	note B_, 1
	note G#, 0
	note G_, 0
	note B_, 1
	note A#, 3
	note A#, 3
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa4d
	callchannel Music_Credits_branch_1fa6d

Music_Credits_branch_1f9f2: ; 1f9f2
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note F#, 1
	loopchannel 7, Music_Credits_branch_1f9f2
	note G#, 0
	note G_, 0
	note F#, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 6
	notetype $8
	note A#, 0
	note A#, 0
	note A#, 0
	notetype $c
	note B_, 15
	note __, 15
	note B_, 14
	note __, 0
	note B_, 7
	note B_, 7
	note B_, 15
	note __, 15
	note B_, 15
	note B_, 7
	note B_, 5
	note D_, 0
	note D_, 0
	note B_, 11
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note B_, 11
	notetype $8
	note D_, 1
	note D_, 1
	note D_, 1
	note B_, 11
	notetype $c
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	notetype $8
	note C#, 1
	note C#, 1
	note D_, 1
	notetype $c
	note D_, 0
	note __, 2
	note D_, 0
	note __, 2
	notetype $8
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	note D_, 0
	note __, 6
	note A#, 7
	note __, 15
	note __, 15
	note __, 15
	endchannel
; 1fa4d

Music_Credits_branch_1fa4d: ; 1fa4d
	note G#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note F#, 1
	endchannel
; 1fa6d

Music_Credits_branch_1fa6d: ; 1fa6d
	note G#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note G#, 0
	note D_, 0
	note F#, 1
	note D_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note D_, 0
	note D_, 0
	note A#, 0
	note D_, 0
	endchannel
; 1fa8d
