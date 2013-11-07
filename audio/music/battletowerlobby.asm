Music_BattleTowerLobby: ; 17948b
	dbw $c0, Music_BattleTowerLobby_Ch1
	dbw $01, Music_BattleTowerLobby_Ch2
	dbw $02, Music_BattleTowerLobby_Ch3
	dbw $03, Music_BattleTowerLobby_Ch4
; 179497


Music_BattleTowerLobby_Ch1: ; 179497
	tempo 152
	volume $77
	dutycycle $3
	tone $0001
	vibrato $8, $22
	stereopanning $f0
	notetype $c, $72

Music_BattleTowerLobby_branch_1794a9: ; 1794a9
	notetype $c, $72
	octave 3
	note G#, 1
	notetype $c, $73
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
	notetype $c, $72
	note F#, 1
	notetype $c, $73
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note E_, 1
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	notetype $c, $72
	note G#, 1
	notetype $c, $73
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note B_, 1
	octave 4
	note E_, 1
	notetype $c, $72
	note F#, 2
	notetype $c, $73
	note D_, 0
	note E_, 1
	octave 3
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	notetype $c, $72
	note C#, 1
	notetype $c, $73
	note D#, 1
	note E_, 1
	note C#, 0
	octave 2
	note B_, 0
	note A_, 3
	notetype $c, $62
	note A_, 3
	notetype $c, $72
	note B_, 1
	notetype $c, $73
	octave 3
	note C#, 1
	note D#, 1
	note E_, 0
	note F#, 0
	note G#, 3
	notetype $c, $62
	octave 2
	note G#, 3
	notetype $c, $72
	note A_, 1
	notetype $c, $73
	note B_, 1
	octave 3
	note C#, 1
	note D_, 0
	note E_, 0
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	notetype $c, $72
	note B_, 1
	notetype $c, $73
	note B_, 3
	note A_, 0
	note G#, 0
	notetype $c, $72
	note F#, 3
	notetype $c, $75
	octave 2
	note B_, 3
	loopchannel 0, Music_BattleTowerLobby_branch_1794a9

Music_BattleTowerLobby_Ch2: ; 17953a
	dutycycle $2
	vibrato $10, $34
	stereopanning $f
	notetype $c, $82

Music_BattleTowerLobby_branch_179544: ; 179544
	notetype $c, $82
	octave 4
	note E_, 1
	note E_, 3
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note B_, 3
	note A_, 1
	note G#, 1
	note A_, 2
	note E_, 0
	octave 3
	note B_, 3
	notetype $c, $65
	note F#, 3
	octave 2
	note B_, 3
	notetype $c, $82
	octave 4
	note E_, 1
	note E_, 3
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note B_, 3
	note A_, 1
	note G#, 1
	note A_, 2
	note F#, 0
	notetype $c, $87
	note G#, 11
	notetype $c, $82
	octave 3
	note A_, 1
	notetype $c, $84
	note A_, 3
	note F#, 0
	note G#, 0
	note A_, 3
	notetype $c, $82
	note C#, 3
	octave 4
	note G#, 1
	notetype $c, $84
	note G#, 3
	note F#, 0
	note G#, 0
	note E_, 3
	notetype $c, $82
	octave 3
	note E_, 3
	octave 4
	note F#, 1
	notetype $c, $84
	note F#, 3
	note A_, 0
	note G#, 0
	note A_, 3
	note D_, 3
	notetype $c, $82
	note E_, 1
	notetype $c, $84
	note E_, 3
	note F#, 0
	note E_, 0
	note D#, 3
	notetype $c, $73
	octave 3
	note D#, 0
	note F#, 0
	note B_, 0
	octave 4
	note D#, 0
	loopchannel 0, Music_BattleTowerLobby_branch_179544

Music_BattleTowerLobby_Ch3: ; 1795ae
	notetype $c, $11

Music_BattleTowerLobby_branch_1795b1: ; 1795b1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note E_, 1
	octave 3
	note E_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note E_, 1
	octave 3
	note E_, 1
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note E_, 1
	note __, 1
	note D_, 1
	octave 2
	note F#, 1
	note A_, 1
	octave 3
	note F#, 1
	octave 2
	note F#, 1
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note E_, 1
	octave 2
	note B_, 1
	note E_, 1
	note B_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note F#, 1
	loopchannel 0, Music_BattleTowerLobby_branch_1795b1

Music_BattleTowerLobby_Ch4: ; 179610
	togglenoise $0

Music_BattleTowerLobby_branch_179612: ; 179612
	notetype $c
	note __, 1
	note F_, 3
	note F_, 3
	note F_, 1
	note F_, 3
	loopchannel 0, Music_BattleTowerLobby_branch_179612
; 17961d
