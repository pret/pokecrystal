Music_MainMenu: ; f78fd
	dbw $c0, Music_MainMenu_Ch1
	dbw $01, Music_MainMenu_Ch2
	dbw $02, Music_MainMenu_Ch3
	dbw $03, Music_MainMenu_Ch4
; f7909

Music_MainMenu_Ch1: ; f7909
	tempo 160
	volume $7, $7
	waveduty $3
	pitchoffset $0001
	vibrato $10, $1, $5
	stereopanning $f0
	notetype $c, $0, $1, $7
	octave 3
	note D_, 8
Music_MainMenu_branch_f791d: ; f791d
	notetype $c, $9, $0, $2
	octave 3
	note C#, 6
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note C#, 4
	loopchannel 2, Music_MainMenu_branch_f791d
	note D#, 6
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 2
	note D#, 4
	octave 2
	note B_, 6
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	notetype $c, $9, $0, $4
	octave 3
	note C_, 4
	loopchannel 0, Music_MainMenu_branch_f791d
; f7940

Music_MainMenu_Ch2: ; f7940
	waveduty $3
	stereopanning $f
	notetype $c, $0, $1, $7
	octave 3
	note G_, 8
Music_MainMenu_branch_f7949: ; f7949
	notetype $c, $a, $0, $2
	note F#, 6
	note F#, 1
	note F#, 1
	note F#, 2
	note F#, 2
	note F#, 4
	loopchannel 2, Music_MainMenu_branch_f7949
	note G#, 6
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 4
	note E_, 6
	note E_, 1
	note E_, 1
	note E_, 2
	note E_, 2
	notetype $c, $a, $0, $4
	note F_, 4
	loopchannel 0, Music_MainMenu_branch_f7949
; f7969

Music_MainMenu_Ch3: ; f7969
	stereopanning $f0
	notetype $c, $2, $0, $5
	note __, 8
Music_MainMenu_branch_f796f: ; f796f
	octave 2
	note F#, 1
	note __, 5
	note F#, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	loopchannel 2, Music_MainMenu_branch_f796f
	note G#, 1
	note __, 5
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note E_, 1
	note __, 5
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 3
	loopchannel 0, Music_MainMenu_branch_f796f
; f7996

Music_MainMenu_Ch4: ; f7996
	stereopanning $f
	drumkittoggle $3
	notetype $c
	note __, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
Music_MainMenu_branch_f79a5: ; f79a5
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_MainMenu_branch_f79a5
; f79b8


