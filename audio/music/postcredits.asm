Music_PostCredits: ; cfd9e
	dbw $40, Music_PostCredits_Ch1
	dbw $01, Music_PostCredits_Ch2
; cfda4


INCBIN "baserom.gbc", $cfda4, $cfda5 - $cfda4


Music_PostCredits_Ch1: ; cfda5
	tempo 271
	volume $7, $7
	setabsnote $0, $3
	setwaveduty $2
	notetype $c, $9, $0, $3
	note __, 8
Music_PostCredits_branch_cfdb2: ; cfdb2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	note E_, 2
	volenvelope $7, $0, $3
	note E_, 2
	volenvelope $5, $0, $3
	note E_, 2
	volenvelope $4, $0, $3
	note E_, 2
	volenvelope $9, $0, $3
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	volenvelope $7, $0, $3
	note D_, 2
	volenvelope $5, $0, $3
	note D_, 2
	volenvelope $4, $0, $3
	note D_, 2
	volenvelope $9, $0, $3
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	volenvelope $7, $0, $3
	note D_, 2
	volenvelope $5, $0, $3
	note D_, 2
	volenvelope $4, $0, $3
	note D_, 2
	volenvelope $9, $0, $3
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	volenvelope $7, $0, $3
	note C_, 2
	volenvelope $5, $0, $3
	note C_, 2
	volenvelope $4, $0, $3
	note C_, 2
	volenvelope $9, $0, $3
	octave 2
	note G#, 2
	octave 3
	note C_, 2
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	volenvelope $7, $0, $3
	note C_, 2
	volenvelope $5, $0, $3
	note C_, 2
	volenvelope $4, $0, $3
	note C_, 2
	volenvelope $9, $0, $3
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note C_, 2
	volenvelope $7, $0, $3
	note C_, 2
	volenvelope $6, $0, $3
	note C_, 2
	volenvelope $4, $0, $3
	note C_, 2
	volenvelope $9, $0, $3
	octave 2
	note F#, 2
	note A_, 2
	octave 3
	note D_, 2
	note F#, 2
	note A_, 2
	volenvelope $7, $0, $3
	note A_, 2
	volenvelope $6, $0, $3
	note A_, 2
	volenvelope $4, $0, $3
	note A_, 2
	volenvelope $9, $0, $3
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	note G_, 2
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $9, $0, $3
	note D_, 2
	octave 2
	note G_, 2
	loopchannel 0, Music_PostCredits_branch_cfdb2
; cfe48

Music_PostCredits_Ch2: ; cfe48
	setabsnote $0, $3
	setwaveduty $2
	notetype $c, $a, $0, $3
	octave 5
	note E_, 2
	volenvelope $7, $0, $3
	note E_, 2
	volenvelope $a, $0, $3
	note F_, 2
	volenvelope $7, $0, $3
	note F_, 2
Music_PostCredits_branch_cfe5a: ; cfe5a
	volenvelope $a, $0, $3
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $5, $0, $3
	note G_, 2
	volenvelope $4, $0, $3
	note G_, 2
	volenvelope $9, $0, $3
	octave 6
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	octave 6
	note C_, 2
	octave 5
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $5, $0, $3
	note G_, 2
	volenvelope $4, $0, $3
	note G_, 2
	volenvelope $3, $0, $3
	note G_, 2
	volenvelope $a, $0, $3
	note E_, 2
	volenvelope $7, $0, $3
	note E_, 2
	volenvelope $a, $0, $3
	note F_, 2
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $5, $0, $3
	note G_, 2
	volenvelope $4, $0, $3
	note G_, 2
	volenvelope $3, $0, $3
	note G_, 2
	volenvelope $a, $0, $3
	note A_, 2
	volenvelope $7, $0, $3
	note A_, 2
	volenvelope $a, $0, $3
	note E_, 2
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $5, $0, $3
	note G_, 2
	volenvelope $a, $0, $3
	note F_, 2
	volenvelope $7, $0, $3
	note F_, 2
	volenvelope $5, $0, $3
	note F_, 2
	volenvelope $a, $0, $3
	note D_, 2
	note E_, 2
	note F_, 2
	volenvelope $7, $0, $3
	note F_, 2
	volenvelope $5, $0, $3
	note F_, 2
	volenvelope $4, $0, $3
	note F_, 2
	volenvelope $3, $0, $3
	note F_, 2
	volenvelope $a, $0, $3
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $a, $0, $3
	note F_, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note B_, 2
	volenvelope $7, $0, $3
	note B_, 2
	volenvelope $5, $0, $3
	note B_, 2
	volenvelope $a, $0, $3
	note A_, 2
	volenvelope $7, $0, $3
	note A_, 2
	volenvelope $a, $0, $3
	note D_, 2
	volenvelope $7, $0, $3
	note D_, 2
	volenvelope $5, $0, $3
	note D_, 2
	volenvelope $4, $0, $3
	note D_, 2
	volenvelope $3, $0, $3
	note D_, 2
	note D_, 2
	volenvelope $2, $0, $3
	note D_, 2
	note D_, 2
	volenvelope $a, $0, $3
	note G_, 2
	volenvelope $7, $0, $3
	octave 4
	note G_, 2
	volenvelope $a, $0, $3
	octave 5
	note D_, 2
	note G_, 2
	volenvelope $7, $0, $3
	note G_, 2
	volenvelope $5, $0, $3
	note G_, 2
	volenvelope $a, $0, $3
	note E_, 2
	note F_, 2
	loopchannel 0, Music_PostCredits_branch_cfe5a
; cff04

