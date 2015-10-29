Music_KantoTrainerBattle: ; ec9fa
	dbw $80, Music_KantoTrainerBattle_Ch1
	dbw $01, Music_KantoTrainerBattle_Ch2
	dbw $02, Music_KantoTrainerBattle_Ch3
; eca03


INCBIN "baserom.gbc", $eca03, $eca04 - $eca03


Music_KantoTrainerBattle_Ch1: ; eca04
	tempo 114
	volume $7, $7
	transpose $1, $b
	notetype $c, $b, $0, $3
	vibrato $12, $2, $4
	waveduty $1
	note __, 1
	octave 4
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	waveduty $2
	volenvelope $b, $0, $1
	octave 4
	note D#, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note D#, 2
	note __, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 4
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note D#, 2
	note __, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	volenvelope $b, $0, $3
	note D#, 2
	note __, 4
	note F_, 2
	note __, 4
	note F#, 2
	note __, 2
	note D#, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note D#, 2
	note F_, 2
	note F#, 2
Music_KantoTrainerBattle_branch_eca88: ; eca88
	notetype $c, $b, $0, $7
	note D#, 4
	note __, 2
	note C_, 10
	note __, 4
	note D#, 2
	note C_, 2
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 8
	note F_, 8
	note G#, 8
	octave 5
	note C#, 4
	note C#, 1
	octave 4
	note G#, 1
	note F_, 1
	note C#, 1
	note D#, 4
	note __, 2
	note C_, 10
	note __, 4
	note D#, 2
	note C_, 2
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 6
	note D_, 6
	note C_, 2
	note __, 2
	note __, 2
	note D_, 2
	note __, 4
	note F_, 2
	note __, 2
	note G#, 2
	note G_, 1
	note F#, 1
	octave 3
	note G#, 1
	note F_, 1
	note C_, 1
	note G#, 1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	octave 3
	note G#, 1
	note F_, 1
	note __, 5
	octave 4
	note D#, 8
	note D_, 4
	octave 3
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note D#, 1
	note D_, 4
	octave 3
	note D_, 4
	octave 4
	note F_, 4
	octave 3
	note D_, 4
	note __, 4
	note D_, 4
	note __, 4
	note D_, 4
	note G#, 1
	note F_, 1
	note C_, 1
	note G#, 1
	octave 4
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	octave 3
	note G#, 1
	note F_, 1
	note __, 5
	octave 4
	note D#, 8
	note D_, 4
	octave 3
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note D#, 1
	note D_, 4
	octave 3
	note D_, 4
	note __, 4
	note D_, 4
	note A#, 1
	octave 4
	note D_, 1
	note F_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 4
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	note D_, 2
	octave 4
	note D_, 2
	volenvelope $6, $0, $7
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note __, 3
	note D#, 4
	notetype $6, $6, $0, $7
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 7
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	octave 4
	note C_, 8
	volenvelope $7, $0, $7
	note C#, 2
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note __, 6
	note E_, 8
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 7
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 3
	octave 4
	note C#, 8
	volenvelope $8, $0, $7
	note D_, 2
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note __, 6
	note F_, 8
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 7
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 3
	note A_, 1
	note __, 3
	octave 4
	note D_, 8
	volenvelope $9, $0, $7
	note D#, 2
	note E_, 2
	note F_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note E_, 2
	note D#, 2
	note __, 6
	note F#, 8
	volenvelope $a, $0, $7
	note G#, 8
	note A#, 8
	volenvelope $b, $0, $7
	octave 5
	note D_, 8
	note D_, 2
	note __, 6
	octave 4
	note A#, 2
	note F#, 2
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note F#, 2
	note D#, 2
	octave 3
	note A#, 2
	note F#, 2
	octave 4
	note G#, 2
	note __, 2
	note D#, 12
	volenvelope $b, $0, $1
	octave 6
	note C_, 2
	note C_, 2
	note C_, 8
	note C_, 2
	note C_, 2
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	volenvelope $b, $0, $7
	octave 4
	note A#, 2
	note F#, 2
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note F#, 2
	note D#, 2
	octave 3
	note A#, 2
	note F#, 2
	octave 4
	note F#, 2
	note __, 2
	note B_, 4
	note A#, 4
	note G#, 4
	note F#, 4
	note F_, 4
	note D#, 4
	note D_, 4
	note D#, 8
	note F#, 8
	octave 5
	note C_, 8
	note D#, 8
	octave 4
	note C#, 16
	note C#, 2
	note __, 2
	note D#, 2
	note __, 2
	note F_, 2
	note __, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	volenvelope $6, $0, $7
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	volenvelope $a, $0, $1
	octave 4
	note C#, 2
	octave 2
	note G_, 2
	note G_, 2
	octave 4
	note C#, 2
	octave 2
	note G_, 2
	note G_, 2
	volenvelope $b, $0, $7
	octave 4
	note D_, 4
	loopchannel 0, Music_KantoTrainerBattle_branch_eca88
; ecbea

Music_KantoTrainerBattle_Ch2: ; ecbea
	transpose $1, $b
	vibrato $6, $3, $6
	waveduty $1
	notetype $c, $d, $0, $1
	octave 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	waveduty $3
	volenvelope $6, $0, $2
Music_KantoTrainerBattle_branch_ecc04: ; ecc04
	octave 3
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	loopchannel 14, Music_KantoTrainerBattle_branch_ecc04
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	volenvelope $d, $0, $7
	waveduty $2
	note C_, 2
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	octave 1
	note A#, 2
	octave 2
	note A#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 1
	note A_, 1
	note __, 1
	note G#, 2
	octave 2
	note G#, 1
	note __, 1
	octave 1
	note G#, 1
	note __, 1
	note G_, 1
	note B_, 1
	octave 2
	note D_, 1
	note F_, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
Music_KantoTrainerBattle_branch_ecc41: ; ecc41
	notetype $c, $d, $0, $7
	octave 2
	note C_, 1
	note C_, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note C_, 2
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note C_, 2
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C#, 1
	note C#, 1
	note G#, 1
	note __, 1
	octave 3
	note C#, 2
	octave 2
	note C#, 2
	note G#, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note C#, 2
	note G#, 1
	note __, 1
	note A#, 2
	note C#, 1
	note C#, 1
	note F_, 1
	note __, 1
	note G#, 2
	octave 3
	note C#, 1
	note __, 1
	note F_, 2
	note G#, 1
	note __, 1
	note A#, 2
	octave 2
	note C_, 1
	note C_, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note C_, 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note C_, 2
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note C_, 2
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 1
	note A#, 1
	note A#, 1
	octave 2
	note F_, 1
	note __, 1
	note A#, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 1
	note __, 1
	note A_, 2
	octave 1
	note A#, 2
	octave 2
	note F_, 1
	note __, 1
	note G#, 2
	octave 1
	note A#, 1
	note A#, 1
	octave 2
	note F_, 1
	note __, 1
	note G_, 2
	note A#, 1
	note __, 1
	octave 3
	note D_, 2
	note F_, 1
	note __, 1
	note A#, 2
	octave 1
	note F_, 2
	octave 2
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note D_, 1
	note __, 1
	note D#, 1
	note C_, 1
	octave 1
	note A#, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note F_, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note F#, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G_, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G#, 4
	octave 1
	note F_, 2
	octave 2
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 1
	note F_, 2
	octave 2
	note D_, 1
	note __, 1
	note D#, 1
	note C_, 1
	octave 1
	note A#, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note F_, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note F#, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G_, 4
	octave 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note G#, 4
	vibrato $12, $2, $4
	notetype $c, $7, $1, $0
	octave 4
	note G_, 16
	volenvelope $7, $0, $7
	note G_, 16
	notetype $6, $8, $1, $0
	note G#, 16
	volenvelope $8, $0, $7
	note G#, 15
	note G_, 1
	note G#, 7
	note A_, 1
	note A#, 3
	note A_, 1
	note G#, 8
	note G_, 4
	note F_, 6
	note __, 2
	notetype $c, $9, $1, $0
	note A_, 16
	volenvelope $9, $0, $7
	note A_, 16
	volenvelope $a, $0, $7
	note A#, 16
	volenvelope $d, $0, $7
	octave 5
	note D_, 8
	note F_, 8
	vibrato $4, $3, $6
	octave 2
	note A#, 4
	note D#, 4
	note C_, 1
	note __, 1
	volenvelope $d, $1, $0
	note G#, 6
	volenvelope $d, $0, $7
	note G#, 16
	note A#, 4
	note D#, 4
	note D#, 1
	note __, 1
	octave 3
	note D#, 14
	octave 2
	note C_, 1
	note __, 1
	octave 3
	note D#, 2
	note __, 2
	notetype $6, $d, $0, $7
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note G#, 8
	octave 4
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 3
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G#, 2
	note __, 2
	note C#, 2
	note __, 2
	note G#, 2
	note A#, 2
	note G#, 2
	note F#, 2
	note G#, 2
	volenvelope $7, $0, $2
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	volenvelope $c, $0, $1
	octave 3
	note B_, 2
	octave 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note B_, 2
	octave 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	volenvelope $d, $0, $7
	octave 3
	note B_, 4
	loopchannel 0, Music_KantoTrainerBattle_branch_ecc41
; ecdd2

Music_KantoTrainerBattle_Ch3: ; ecdd2
	transpose $1, $b
	vibrato $12, $2, $3
	notetype $c, $1, $0, $5
	octave 2
	note A#, 1
	octave 4
	note A#, 1
	octave 3
	note A#, 2
	octave 2
	note A_, 1
	octave 4
	note A_, 1
	octave 3
	note A_, 2
	octave 2
	note G#, 1
	octave 4
	note G#, 1
	octave 3
	note G#, 2
	octave 2
	note G_, 1
	octave 4
	note G_, 1
	octave 3
	note G_, 2
	octave 2
	note F#, 1
	octave 4
	note F#, 1
	octave 3
	note F#, 2
	octave 2
	note F_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 2
	octave 2
	note E_, 1
	octave 4
	note E_, 1
	octave 3
	note E_, 2
	note D_, 1
	note F_, 1
	note B_, 1
	octave 4
	note D_, 1
	volenvelope $1, $1, $0
	octave 6
	note C_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note F_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note F#, 2
	octave 4
	note C_, 1
	note D#, 1
	octave 5
	note D#, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note D#, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note F_, 2
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note F#, 2
	octave 4
	note C_, 1
	note D#, 1
	octave 5
	note D#, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note C_, 2
	note __, 4
	note D_, 2
	note __, 4
	note D#, 2
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 5
	note G_, 2
	note A#, 2
	note B_, 2
Music_KantoTrainerBattle_branch_ece5a: ; ece5a
	notetype $c, $1, $0, $4
	octave 6
	note C_, 4
	notetype $6, $1, $0, $4
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	notetype $c, $1, $0, $4
	note G_, 10
	note __, 2
	notetype $6, $1, $0, $4
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 6
	octave 5
	note A_, 1
	note G#, 1
	note G_, 8
	octave 6
	note C_, 7
	octave 5
	note B_, 1
	notetype $c, $1, $0, $4
	octave 6
	note C#, 16
	note C#, 8
	note F_, 4
	note G#, 1
	note F_, 1
	note C#, 1
	octave 5
	note G#, 1
	octave 6
	note C_, 4
	notetype $6, $1, $0, $4
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	notetype $c, $1, $0, $4
	note G_, 10
	note __, 2
	notetype $6, $1, $0, $4
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 6
	octave 5
	note A_, 1
	note G#, 1
	note G_, 8
	octave 6
	note C_, 7
	octave 5
	note B_, 1
	note A#, 16
	note A#, 16
	note A#, 13
	note B_, 1
	octave 6
	note C_, 1
	note C#, 1
	note D_, 8
	note F_, 2
	note D_, 2
	octave 5
	note A#, 2
	note A_, 2
	notetype $c, $1, $0, $0
	note G#, 11
	volenvelope $1, $0, $4
	note C_, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	volenvelope $1, $0, $0
	octave 6
	note C_, 6
	notetype $6, $1, $0, $0
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G#, 16
	notetype $c, $1, $0, $0
	note A#, 16
	volenvelope $2, $0, $5
	note D_, 1
	octave 4
	note A#, 1
	note F_, 1
	note A#, 1
	octave 5
	note F_, 1
	note D_, 1
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave 6
	note D_, 2
	note C#, 1
	note C_, 1
	volenvelope $1, $0, $0
	octave 5
	note G#, 11
	volenvelope $1, $0, $4
	note C_, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	volenvelope $1, $0, $0
	octave 6
	note C_, 7
	notetype $6, $1, $0, $0
	note C#, 1
	note D_, 1
	notetype $c, $1, $0, $0
	note D#, 8
	note D_, 12
	note G#, 1
	note F_, 1
	volenvelope $2, $0, $5
	octave 5
	note A#, 1
	note F_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	volenvelope $2, $0, $4
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note D#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	octave 3
	note E_, 1
	octave 4
	note C#, 1
	volenvelope $1, $0, $4
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	volenvelope $1, $0, $5
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	volenvelope $1, $0, $5
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	octave 4
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note D#, 1
	octave 3
	note F#, 1
	octave 4
	note D#, 1
	volenvelope $1, $0, $4
	octave 3
	note F_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	note F_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note G#, 1
	octave 5
	note D_, 1
	octave 6
	note D#, 4
	octave 5
	note A#, 4
	octave 6
	note C#, 1
	note __, 1
	note C_, 6
	octave 4
	note C_, 1
	note D#, 1
	note G#, 1
	octave 5
	note C_, 1
	note D#, 1
	note G#, 1
	octave 6
	note C_, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note C_, 1
	octave 5
	note G#, 1
	note D#, 1
	note C_, 1
	octave 4
	note G#, 1
	note D#, 1
	octave 6
	note D#, 4
	octave 5
	note A#, 4
	note B_, 1
	note __, 1
	octave 6
	note F#, 12
	note F_, 1
	note F#, 1
	note G#, 16
	note F_, 8
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 1
	octave 6
	note F_, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	notetype $6, $2, $0, $4
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	volenvelope $1, $0, $4
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note G_, 2
	octave 3
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	volenvelope $1, $0, $4
	octave 5
	note G_, 4
	loopchannel 0, Music_KantoTrainerBattle_branch_ece5a
; ed06d


