Music_MainMenu: ; f78fd
	dbw $c0, Music_MainMenu_Ch1
	dbw $01, Music_MainMenu_Ch2
	dbw $02, Music_MainMenu_Ch3
	dbw $03, Music_MainMenu_Ch4
; f7909


Music_MainMenu_Ch1: ; f7909
	tempo 160
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $f
	octave 3
	note D_, 7

Music_MainMenu_branch_f791d: ; f791d
	notetype $c, $92
	octave 3
	note C#, 5
	note C#, 0
	note C#, 0
	note C#, 1
	note C#, 1
	note C#, 3
	loopchannel 2, Music_MainMenu_branch_f791d
	note D#, 5
	note D#, 0
	note D#, 0
	note D#, 1
	note D#, 1
	note D#, 3
	octave 2
	note B_, 5
	note B_, 0
	note B_, 0
	note B_, 1
	note B_, 1
	notetype $c, $94
	octave 3
	note C_, 3
	loopchannel 0, Music_MainMenu_branch_f791d

Music_MainMenu_Ch2: ; f7940
	dutycycle $3
	stereopanning $f
	notetype $c, $f
	octave 3
	note G_, 7

Music_MainMenu_branch_f7949: ; f7949
	notetype $c, $a2
	note F#, 5
	note F#, 0
	note F#, 0
	note F#, 1
	note F#, 1
	note F#, 3
	loopchannel 2, Music_MainMenu_branch_f7949
	note G#, 5
	note G#, 0
	note G#, 0
	note G#, 1
	note G#, 1
	note G#, 3
	note E_, 5
	note E_, 0
	note E_, 0
	note E_, 1
	note E_, 1
	notetype $c, $a4
	note F_, 3
	loopchannel 0, Music_MainMenu_branch_f7949

Music_MainMenu_Ch3: ; f7969
	stereopanning $f0
	notetype $c, $25
	note __, 7

Music_MainMenu_branch_f796f: ; f796f
	octave 2
	note F#, 0
	note __, 4
	note F#, 0
	note F#, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 2
	loopchannel 2, Music_MainMenu_branch_f796f
	note G#, 0
	note __, 4
	note G#, 0
	note G#, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 2
	note E_, 0
	note __, 4
	note E_, 0
	note E_, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 2
	loopchannel 0, Music_MainMenu_branch_f796f

Music_MainMenu_Ch4: ; f7996
	stereopanning $f
	togglenoise $3
	notetype $c
	note __, 7
	note __, 15
	note __, 15
	note __, 15
	note __, 11
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0

Music_MainMenu_branch_f79a5: ; f79a5
	note D_, 5
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 5
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 0
	note D_, 0
	loopchannel 0, Music_MainMenu_branch_f79a5
; f79b8
