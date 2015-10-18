Music_MobileCenter: ; 17961d
	dbw $c0, Music_MobileCenter_Ch1
	dbw $01, Music_MobileCenter_Ch2
	dbw $02, Music_MobileCenter_Ch3
	dbw $03, Music_MobileCenter_Ch4
; 179629

Music_MobileCenter_Ch1: ; 179629
	tempo 160
	volume $7, $7
	setwaveduty $1
	setpitchoffset $0002
	vibrato $8, $2, $2
	stereopanning $f0
	notetype $c, $a, $0, $2
	octave 3
	note E_, 2
	note F_, 2
	note G_, 4
	note G_, 2
	note A_, 2
	note B_, 4
Music_MobileCenter_branch_179642: ; 179642
	octave 3
	note E_, 2
	note C_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 4
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note C_, 4
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 4
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note G_, 8
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 4
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 4
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 4
	note F_, 2
	note G_, 2
	note A_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	loopchannel 0, Music_MobileCenter_branch_179642
; 1796cc

Music_MobileCenter_Ch2: ; 1796cc
	notetype $c, $c, $0, $2
	setwaveduty $3
	note __, 10
	octave 1
	note G_, 2
	note A_, 2
	note B_, 2
Music_MobileCenter_branch_1796d6: ; 1796d6
	octave 2
	note C_, 2
	note E_, 2
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note C_, 2
	note E_, 2
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 1
	note G_, 2
	octave 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note C_, 2
	note E_, 2
	octave 1
	note G_, 2
	octave 2
	note E_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note D_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note D_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note D_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note D_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	loopchannel 0, Music_MobileCenter_branch_1796d6
; 179777

Music_MobileCenter_Ch3: ; 179777
	notetype $c, $2, $0, $4
	vibrato $10, $3, $4
	octave 4
	note G_, 2
	note A_, 2
	note B_, 4
	note B_, 2
	octave 5
	note C_, 2
	note D_, 4
	notetype $c, $2, $0, $5
Music_MobileCenter_branch_179788: ; 179788
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	note G_, 4
	note F_, 4
	note E_, 2
	note D_, 2
	octave 4
	note B_, 6
	notetype $c, $1, $0, $0
	octave 6
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 3
	notetype $c, $2, $0, $5
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 2
	octave 5
	note C_, 2
	note E_, 6
	octave 4
	note E_, 2
	note F_, 2
	note D_, 2
	note E_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	note G_, 4
	note F_, 4
	note E_, 2
	note D_, 2
	octave 4
	note B_, 6
	notetype $c, $1, $0, $0
	octave 6
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 3
	notetype $c, $2, $0, $5
	octave 4
	note B_, 2
	note G_, 2
	note B_, 2
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 2
	octave 5
	note C_, 8
	octave 4
	note G_, 2
	note A_, 2
	note B_, 2
	octave 5
	note D_, 2
	vibrato $18, $4, $4
	note E_, 8
	note G_, 8
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 8
	octave 4
	note B_, 8
	octave 5
	note D_, 8
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 8
	note E_, 8
	note G_, 8
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 8
	note G_, 4
	note F_, 2
	note E_, 2
	note F_, 8
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 8
	vibrato $10, $3, $4
	loopchannel 0, Music_MobileCenter_branch_179788
; 179807

Music_MobileCenter_Ch4: ; 179807
	togglenoise $3
	stereopanning $f
	notetype $c
	note A_, 8
	note A_, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
Music_MobileCenter_branch_179813: ; 179813
	note A_, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note A_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	loopchannel 3, Music_MobileCenter_branch_179813
	note A_, 2
	note C#, 2
	note C#, 2
	note C#, 2
	note A_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 0, Music_MobileCenter_branch_179813
; 17982d

