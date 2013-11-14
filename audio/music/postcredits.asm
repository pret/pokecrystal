Music_PostCredits: ; cfd9e
	dbw $40, Music_PostCredits_Ch1
	dbw $01, Music_PostCredits_Ch2
; cfda4

INCBIN "baserom.gbc", $cfda4, $cfda5 - $cfda4

Music_PostCredits_Ch1: ; cfda5
	tempo 271
	volume $77
	forceoctave $3
	dutycycle $2
	notetype $c, $93
	note __, 7

Music_PostCredits_branch_cfdb2: ; cfdb2
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	intensity $73
	note E_, 1
	intensity $53
	note E_, 1
	intensity $43
	note E_, 1
	intensity $93
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	intensity $73
	note D_, 1
	intensity $53
	note D_, 1
	intensity $43
	note D_, 1
	intensity $93
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	intensity $73
	note D_, 1
	intensity $53
	note D_, 1
	intensity $43
	note D_, 1
	intensity $93
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	intensity $73
	note C_, 1
	intensity $53
	note C_, 1
	intensity $43
	note C_, 1
	intensity $93
	octave 2
	note G#, 1
	octave 3
	note C_, 1
	note F_, 1
	note G#, 1
	octave 4
	note C_, 1
	intensity $73
	note C_, 1
	intensity $53
	note C_, 1
	intensity $43
	note C_, 1
	intensity $93
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	intensity $73
	note C_, 1
	intensity $63
	note C_, 1
	intensity $43
	note C_, 1
	intensity $93
	octave 2
	note F#, 1
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	intensity $73
	note A_, 1
	intensity $63
	note A_, 1
	intensity $43
	note A_, 1
	intensity $93
	octave 2
	note G_, 1
	octave 3
	note C_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	intensity $73
	note G_, 1
	intensity $93
	note D_, 1
	octave 2
	note G_, 1
	loopchannel 0, Music_PostCredits_branch_cfdb2

Music_PostCredits_Ch2: ; cfe48
	forceoctave $3
	dutycycle $2
	notetype $c, $a3
	octave 5
	note E_, 1
	intensity $73
	note E_, 1
	intensity $a3
	note F_, 1
	intensity $73
	note F_, 1

Music_PostCredits_branch_cfe5a: ; cfe5a
	intensity $a3
	note G_, 1
	intensity $73
	note G_, 1
	intensity $53
	note G_, 1
	intensity $43
	note G_, 1
	intensity $93
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	intensity $73
	note G_, 1
	intensity $53
	note G_, 1
	intensity $43
	note G_, 1
	intensity $33
	note G_, 1
	intensity $a3
	note E_, 1
	intensity $73
	note E_, 1
	intensity $a3
	note F_, 1
	note G_, 1
	intensity $73
	note G_, 1
	intensity $53
	note G_, 1
	intensity $43
	note G_, 1
	intensity $33
	note G_, 1
	intensity $a3
	note A_, 1
	intensity $73
	note A_, 1
	intensity $a3
	note E_, 1
	note G_, 1
	intensity $73
	note G_, 1
	intensity $53
	note G_, 1
	intensity $a3
	note F_, 1
	intensity $73
	note F_, 1
	intensity $53
	note F_, 1
	intensity $a3
	note D_, 1
	note E_, 1
	note F_, 1
	intensity $73
	note F_, 1
	intensity $53
	note F_, 1
	intensity $43
	note F_, 1
	intensity $33
	note F_, 1
	intensity $a3
	note G_, 1
	intensity $73
	note G_, 1
	intensity $a3
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note B_, 1
	intensity $73
	note B_, 1
	intensity $53
	note B_, 1
	intensity $a3
	note A_, 1
	intensity $73
	note A_, 1
	intensity $a3
	note D_, 1
	intensity $73
	note D_, 1
	intensity $53
	note D_, 1
	intensity $43
	note D_, 1
	intensity $33
	note D_, 1
	note D_, 1
	intensity $23
	note D_, 1
	note D_, 1
	intensity $a3
	note G_, 1
	intensity $73
	octave 4
	note G_, 1
	intensity $a3
	octave 5
	note D_, 1
	note G_, 1
	intensity $73
	note G_, 1
	intensity $53
	note G_, 1
	intensity $a3
	note E_, 1
	note F_, 1
	loopchannel 0, Music_PostCredits_branch_cfe5a
; cff04
