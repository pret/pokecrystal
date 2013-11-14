Music_MobileCenter: ; 17961d
	dbw $c0, Music_MobileCenter_Ch1
	dbw $01, Music_MobileCenter_Ch2
	dbw $02, Music_MobileCenter_Ch3
	dbw $03, Music_MobileCenter_Ch4
; 179629


Music_MobileCenter_Ch1: ; 179629
	tempo 160
	volume $77
	dutycycle $1
	tone $0002
	vibrato $8, $22
	stereopanning $f0
	notetype $c, $a2
	octave 3
	note E_, 1
	note F_, 1
	note G_, 3
	note G_, 1
	note A_, 1
	note B_, 3

Music_MobileCenter_branch_179642: ; 179642
	octave 3
	note E_, 1
	note C_, 1
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 3
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note C_, 3
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 3
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 7
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 3
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 3
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 3
	note F_, 1
	note G_, 1
	note A_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	loopchannel 0, Music_MobileCenter_branch_179642

Music_MobileCenter_Ch2: ; 1796cc
	notetype $c, $c2
	dutycycle $3
	note __, 9
	octave 1
	note G_, 1
	note A_, 1
	note B_, 1

Music_MobileCenter_branch_1796d6: ; 1796d6
	octave 2
	note C_, 1
	note E_, 1
	octave 1
	note G_, 1
	octave 2
	note E_, 1
	note C_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note C_, 1
	note E_, 1
	octave 1
	note G_, 1
	octave 2
	note E_, 1
	note C_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	octave 1
	note G_, 1
	octave 2
	note G_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note C_, 1
	note E_, 1
	octave 1
	note G_, 1
	octave 2
	note E_, 1
	note C_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	octave 1
	note B_, 1
	octave 2
	note F_, 1
	note D_, 1
	note F_, 1
	octave 1
	note B_, 1
	octave 2
	note F_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	octave 1
	note B_, 1
	octave 2
	note F_, 1
	note D_, 1
	note F_, 1
	octave 1
	note B_, 1
	octave 2
	note F_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	loopchannel 0, Music_MobileCenter_branch_1796d6

Music_MobileCenter_Ch3: ; 179777
	notetype $c, $24
	vibrato $10, $34
	octave 4
	note G_, 1
	note A_, 1
	note B_, 3
	note B_, 1
	octave 5
	note C_, 1
	note D_, 3
	notetype $c, $25

Music_MobileCenter_branch_179788: ; 179788
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note G_, 3
	note F_, 3
	note E_, 1
	note D_, 1
	octave 4
	note B_, 5
	notetype $c, $10
	octave 6
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 7
	note D_, 0
	note __, 2
	notetype $c, $25
	octave 4
	note B_, 1
	note G_, 1
	note B_, 1
	octave 5
	note E_, 3
	note D_, 3
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	note E_, 5
	octave 4
	note E_, 1
	note F_, 1
	note D_, 1
	note E_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note G_, 3
	note F_, 3
	note E_, 1
	note D_, 1
	octave 4
	note B_, 5
	notetype $c, $10
	octave 6
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 7
	note D_, 0
	note __, 2
	notetype $c, $25
	octave 4
	note B_, 1
	note G_, 1
	note B_, 1
	octave 5
	note E_, 3
	note D_, 3
	octave 4
	note B_, 1
	octave 5
	note C_, 7
	octave 4
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
	vibrato $18, $44
	note E_, 7
	note G_, 7
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 7
	octave 4
	note B_, 7
	octave 5
	note D_, 7
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 7
	note E_, 7
	note G_, 7
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 7
	note G_, 3
	note F_, 1
	note E_, 1
	note F_, 7
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 7
	vibrato $10, $34
	loopchannel 0, Music_MobileCenter_branch_179788

Music_MobileCenter_Ch4: ; 179807
	togglenoise $3
	stereopanning $f
	notetype $c
	note A_, 7
	note A_, 3
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0

Music_MobileCenter_branch_179813: ; 179813
	note A_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note A_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	loopchannel 3, Music_MobileCenter_branch_179813
	note A_, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note A_, 1
	note D_, 1
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	loopchannel 0, Music_MobileCenter_branch_179813
; 17982d
