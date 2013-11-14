Music_KantoTrainerBattle: ; ec9fa
	dbw $80, Music_KantoTrainerBattle_Ch1
	dbw $01, Music_KantoTrainerBattle_Ch2
	dbw $02, Music_KantoTrainerBattle_Ch3
; eca03

INCBIN "baserom.gbc", $eca03, $eca04 - $eca03

Music_KantoTrainerBattle_Ch1: ; eca04
	tempo 114
	volume $77
	forceoctave $1b
	notetype $c, $b3
	vibrato $12, $24
	dutycycle $1
	note __, 0
	octave 4
	note A_, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note D#, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	octave 3
	note B_, 0
	note A#, 0
	note A_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	note G_, 0
	dutycycle $2
	intensity $b1
	octave 4
	note D#, 1
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note C_, 1
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 0
	note __, 0
	note F_, 0
	note __, 0
	note F#, 0
	note __, 0
	octave 4
	note C_, 1
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note C_, 1
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 0
	note __, 0
	note F_, 0
	note __, 0
	note G_, 0
	note __, 0
	intensity $b3
	note D#, 1
	note __, 3
	note F_, 1
	note __, 3
	note F#, 1
	note __, 1
	note D#, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 1
	note F_, 1
	note F#, 1

Music_KantoTrainerBattle_branch_eca88: ; eca88
	notetype $c, $b7
	note D#, 3
	note __, 1
	note C_, 9
	note __, 3
	note D#, 1
	note C_, 1
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D#, 0
	note __, 0
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	note C#, 7
	note F_, 7
	note G#, 7
	octave 5
	note C#, 3
	note C#, 0
	octave 4
	note G#, 0
	note F_, 0
	note C#, 0
	note D#, 3
	note __, 1
	note C_, 9
	note __, 3
	note D#, 1
	note C_, 1
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note F_, 0
	note __, 0
	note D#, 5
	note D_, 5
	note C_, 1
	note __, 1
	note __, 1
	note D_, 1
	note __, 3
	note F_, 1
	note __, 1
	note G#, 1
	note G_, 0
	note F#, 0
	octave 3
	note G#, 0
	note F_, 0
	note C_, 0
	note G#, 0
	octave 4
	note C_, 0
	note __, 0
	note F_, 0
	note __, 0
	note C_, 0
	octave 3
	note G#, 0
	note F_, 0
	note __, 4
	octave 4
	note D#, 7
	note D_, 3
	octave 3
	note F_, 0
	note A_, 0
	octave 4
	note C_, 0
	note D#, 0
	note D_, 3
	octave 3
	note D_, 3
	octave 4
	note F_, 3
	octave 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note G#, 0
	note F_, 0
	note C_, 0
	note G#, 0
	octave 4
	note C_, 0
	note __, 0
	note F_, 0
	note __, 0
	note C_, 0
	octave 3
	note G#, 0
	note F_, 0
	note __, 4
	octave 4
	note D#, 7
	note D_, 3
	octave 3
	note F_, 0
	note A_, 0
	octave 4
	note C_, 0
	note D#, 0
	note D_, 3
	octave 3
	note D_, 3
	note __, 3
	note D_, 3
	note A#, 0
	octave 4
	note D_, 0
	note F_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 4
	note F_, 1
	note D_, 1
	octave 3
	note A#, 1
	note D_, 1
	octave 4
	note D_, 1
	intensity $67
	note C_, 0
	note C#, 0
	note D_, 0
	note D#, 0
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	note __, 2
	note D#, 3
	notetype $6, $67
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 6
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 2
	note G_, 0
	note __, 2
	octave 4
	note C_, 7
	intensity $77
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 5
	note E_, 7
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 6
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 3
	note G#, 0
	note __, 2
	note G#, 0
	note __, 2
	octave 4
	note C#, 7
	intensity $87
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note __, 5
	note F_, 7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 6
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 2
	note A_, 0
	note __, 2
	octave 4
	note D_, 7
	intensity $97
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note __, 5
	note F#, 7
	intensity $a7
	note G#, 7
	note A#, 7
	intensity $b7
	octave 5
	note D_, 7
	note D_, 1
	note __, 5
	octave 4
	note A#, 1
	note F#, 1
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note F#, 1
	note D#, 1
	octave 3
	note A#, 1
	note F#, 1
	octave 4
	note G#, 1
	note __, 1
	note D#, 11
	intensity $b1
	octave 6
	note C_, 1
	note C_, 1
	note C_, 7
	note C_, 1
	note C_, 1
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	intensity $b7
	octave 4
	note A#, 1
	note F#, 1
	note D#, 1
	octave 3
	note A#, 1
	octave 4
	note F#, 1
	note D#, 1
	octave 3
	note A#, 1
	note F#, 1
	octave 4
	note F#, 1
	note __, 1
	note B_, 3
	note A#, 3
	note G#, 3
	note F#, 3
	note F_, 3
	note D#, 3
	note D_, 3
	note D#, 7
	note F#, 7
	octave 5
	note C_, 7
	note D#, 7
	octave 4
	note C#, 15
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	octave 4
	note F_, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	intensity $67
	note E_, 0
	note D_, 0
	note C_, 0
	octave 3
	note B_, 0
	note A_, 0
	note G_, 0
	intensity $a1
	octave 4
	note C#, 1
	octave 2
	note G_, 1
	note G_, 1
	octave 4
	note C#, 1
	octave 2
	note G_, 1
	note G_, 1
	intensity $b7
	octave 4
	note D_, 3
	loopchannel 0, Music_KantoTrainerBattle_branch_eca88

Music_KantoTrainerBattle_Ch2: ; ecbea
	forceoctave $1b
	vibrato $6, $36
	dutycycle $1
	notetype $c, $d1
	octave 4
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note A#, 3
	note G_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	dutycycle $3
	intensity $62

Music_KantoTrainerBattle_branch_ecc04: ; ecc04
	octave 3
	note G_, 0
	note G#, 0
	note G_, 0
	note F#, 0
	loopchannel 14, Music_KantoTrainerBattle_branch_ecc04
	note G_, 0
	note G#, 0
	note G_, 0
	note F_, 0
	note D#, 0
	note D_, 0
	note C_, 0
	octave 2
	note B_, 0
	intensity $d7
	dutycycle $2
	note C_, 1
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note C_, 0
	note __, 0
	octave 1
	note A#, 1
	octave 2
	note A#, 0
	note __, 0
	octave 1
	note A#, 0
	note __, 0
	note A_, 1
	octave 2
	note A_, 0
	note __, 0
	octave 1
	note A_, 0
	note __, 0
	note G#, 1
	octave 2
	note G#, 0
	note __, 0
	octave 1
	note G#, 0
	note __, 0
	note G_, 0
	note B_, 0
	octave 2
	note D_, 0
	note F_, 0
	note G_, 0
	note B_, 0
	octave 3
	note D_, 0
	note F_, 0

Music_KantoTrainerBattle_branch_ecc41: ; ecc41
	notetype $c, $d7
	octave 2
	note C_, 0
	note C_, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note C_, 1
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note C_, 1
	note A#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note C_, 1
	note A_, 0
	note __, 0
	note G#, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note C#, 0
	note C#, 0
	note G#, 0
	note __, 0
	octave 3
	note C#, 1
	octave 2
	note C#, 1
	note G#, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note C#, 1
	note G#, 0
	note __, 0
	note A#, 1
	note C#, 0
	note C#, 0
	note F_, 0
	note __, 0
	note G#, 1
	octave 3
	note C#, 0
	note __, 0
	note F_, 1
	note G#, 0
	note __, 0
	note A#, 1
	octave 2
	note C_, 0
	note C_, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note C_, 1
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note C_, 1
	note A#, 0
	note __, 0
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note C_, 1
	note A_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 1
	note A#, 0
	note A#, 0
	octave 2
	note F_, 0
	note __, 0
	note A#, 1
	octave 1
	note A#, 1
	octave 2
	note F_, 0
	note __, 0
	note A_, 1
	octave 1
	note A#, 1
	octave 2
	note F_, 0
	note __, 0
	note G#, 1
	octave 1
	note A#, 0
	note A#, 0
	octave 2
	note F_, 0
	note __, 0
	note G_, 1
	note A#, 0
	note __, 0
	octave 3
	note D_, 1
	note F_, 0
	note __, 0
	note A#, 1
	octave 1
	note F_, 1
	octave 2
	note F_, 0
	note __, 0
	note C_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note E_, 0
	note __, 0
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note D#, 0
	note __, 0
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note D_, 0
	note __, 0
	note D#, 0
	note C_, 0
	octave 1
	note A#, 0
	note A_, 0
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note F_, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note F#, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note G_, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note G#, 3
	octave 1
	note F_, 1
	octave 2
	note F_, 0
	note __, 0
	note C_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note E_, 0
	note __, 0
	note C_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note D#, 0
	note __, 0
	note C_, 0
	note __, 0
	note D#, 0
	note __, 0
	octave 1
	note F_, 1
	octave 2
	note D_, 0
	note __, 0
	note D#, 0
	note C_, 0
	octave 1
	note A#, 0
	note A_, 0
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note F_, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note F#, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note G_, 3
	octave 1
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note G#, 3
	vibrato $12, $24
	notetype $c, $78
	octave 4
	note G_, 15
	intensity $77
	note G_, 15
	notetype $6, $88
	note G#, 15
	intensity $87
	note G#, 14
	note G_, 0
	note G#, 6
	note A_, 0
	note A#, 2
	note A_, 0
	note G#, 7
	note G_, 3
	note F_, 5
	note __, 1
	notetype $c, $98
	note A_, 15
	intensity $97
	note A_, 15
	intensity $a7
	note A#, 15
	intensity $d7
	octave 5
	note D_, 7
	note F_, 7
	vibrato $4, $36
	octave 2
	note A#, 3
	note D#, 3
	note C_, 0
	note __, 0
	intensity $d8
	note G#, 5
	intensity $d7
	note G#, 15
	note A#, 3
	note D#, 3
	note D#, 0
	note __, 0
	octave 3
	note D#, 13
	octave 2
	note C_, 0
	note __, 0
	octave 3
	note D#, 1
	note __, 1
	notetype $6, $d7
	octave 2
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 3
	note G#, 7
	octave 4
	note F_, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note G#, 1
	note A#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	intensity $72
	note G_, 0
	note F_, 0
	note E_, 0
	note D_, 0
	note C_, 0
	octave 2
	note B_, 0
	intensity $c1
	octave 3
	note B_, 1
	octave 1
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	octave 3
	note B_, 1
	octave 1
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	intensity $d7
	octave 3
	note B_, 3
	loopchannel 0, Music_KantoTrainerBattle_branch_ecc41

Music_KantoTrainerBattle_Ch3: ; ecdd2
	forceoctave $1b
	vibrato $12, $23
	notetype $c, $15
	octave 2
	note A#, 0
	octave 4
	note A#, 0
	octave 3
	note A#, 1
	octave 2
	note A_, 0
	octave 4
	note A_, 0
	octave 3
	note A_, 1
	octave 2
	note G#, 0
	octave 4
	note G#, 0
	octave 3
	note G#, 1
	octave 2
	note G_, 0
	octave 4
	note G_, 0
	octave 3
	note G_, 1
	octave 2
	note F#, 0
	octave 4
	note F#, 0
	octave 3
	note F#, 1
	octave 2
	note F_, 0
	octave 4
	note F_, 0
	octave 3
	note F_, 1
	octave 2
	note E_, 0
	octave 4
	note E_, 0
	octave 3
	note E_, 1
	note D_, 0
	note F_, 0
	note B_, 0
	octave 4
	note D_, 0
	intensity $18
	octave 6
	note C_, 1
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 5
	note F_, 1
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 5
	note F#, 1
	octave 4
	note C_, 0
	note D#, 0
	octave 5
	note D#, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 5
	note D#, 1
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 5
	note F_, 1
	octave 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 5
	note F#, 1
	octave 4
	note C_, 0
	note D#, 0
	octave 5
	note D#, 1
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 0
	note __, 0
	note A#, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 6
	note C_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D#, 1
	note __, 1
	note C_, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 5
	note G_, 1
	note A#, 1
	note B_, 1

Music_KantoTrainerBattle_branch_ece5a: ; ece5a
	notetype $c, $14
	octave 6
	note C_, 3
	notetype $6, $14
	octave 5
	note B_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	notetype $c, $14
	note G_, 9
	note __, 1
	notetype $6, $14
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	octave 6
	note C_, 5
	octave 5
	note A_, 0
	note G#, 0
	note G_, 7
	octave 6
	note C_, 6
	octave 5
	note B_, 0
	notetype $c, $14
	octave 6
	note C#, 15
	note C#, 7
	note F_, 3
	note G#, 0
	note F_, 0
	note C#, 0
	octave 5
	note G#, 0
	octave 6
	note C_, 3
	notetype $6, $14
	octave 5
	note B_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	notetype $c, $14
	note G_, 9
	note __, 1
	notetype $6, $14
	note G_, 0
	note G#, 0
	note A_, 0
	note A#, 0
	octave 6
	note C_, 5
	octave 5
	note A_, 0
	note G#, 0
	note G_, 7
	octave 6
	note C_, 6
	octave 5
	note B_, 0
	note A#, 15
	note A#, 15
	note A#, 12
	note B_, 0
	octave 6
	note C_, 0
	note C#, 0
	note D_, 7
	note F_, 1
	note D_, 1
	octave 5
	note A#, 1
	note A_, 1
	notetype $c, $10
	note G#, 10
	intensity $14
	note C_, 0
	note F_, 0
	note __, 0
	note G#, 0
	note __, 0
	intensity $10
	octave 6
	note C_, 5
	notetype $6, $10
	octave 5
	note B_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	note G#, 15
	notetype $c, $10
	note A#, 15
	intensity $25
	note D_, 0
	octave 4
	note A#, 0
	note F_, 0
	note A#, 0
	octave 5
	note F_, 0
	note D_, 0
	octave 4
	note A#, 0
	octave 5
	note D_, 0
	note A#, 0
	note F_, 0
	note D_, 0
	note F_, 0
	octave 6
	note D_, 1
	note C#, 0
	note C_, 0
	intensity $10
	octave 5
	note G#, 10
	intensity $14
	note C_, 0
	note F_, 0
	note __, 0
	note G#, 0
	note __, 0
	intensity $10
	octave 6
	note C_, 6
	notetype $6, $10
	note C#, 0
	note D_, 0
	notetype $c, $10
	note D#, 7
	note D_, 11
	note G#, 0
	note F_, 0
	intensity $25
	octave 5
	note A#, 0
	note F_, 0
	note G#, 0
	note G#, 0
	note G#, 0
	note __, 0
	note A#, 0
	note __, 0
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note F_, 1
	intensity $24
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G_, 0
	octave 4
	note C_, 0
	octave 3
	note D#, 0
	octave 4
	note C_, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note G#, 0
	octave 4
	note C#, 0
	octave 3
	note E_, 0
	octave 4
	note C#, 0
	intensity $14
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	intensity $15
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	octave 4
	note D_, 0
	intensity $15
	octave 3
	note A#, 0
	octave 4
	note D#, 0
	octave 3
	note F#, 0
	octave 4
	note D#, 0
	octave 3
	note A#, 0
	octave 4
	note D#, 0
	octave 3
	note F#, 0
	octave 4
	note D#, 0
	octave 3
	note A#, 0
	octave 4
	note D#, 0
	octave 3
	note F#, 0
	octave 4
	note D#, 0
	octave 3
	note A#, 0
	octave 4
	note D#, 0
	octave 3
	note F#, 0
	octave 4
	note D#, 0
	intensity $14
	octave 3
	note F_, 0
	note G#, 0
	note B_, 0
	octave 4
	note D_, 0
	octave 3
	note G#, 0
	note B_, 0
	octave 4
	note D_, 0
	note F_, 0
	octave 3
	note B_, 0
	octave 4
	note D_, 0
	note F_, 0
	note G#, 0
	note D_, 0
	note F_, 0
	note G#, 0
	octave 5
	note D_, 0
	octave 6
	note D#, 3
	octave 5
	note A#, 3
	octave 6
	note C#, 0
	note __, 0
	note C_, 5
	octave 4
	note C_, 0
	note D#, 0
	note G#, 0
	octave 5
	note C_, 0
	note D#, 0
	note G#, 0
	octave 6
	note C_, 0
	note D#, 0
	note G#, 0
	note D#, 0
	note C_, 0
	octave 5
	note G#, 0
	note D#, 0
	note C_, 0
	octave 4
	note G#, 0
	note D#, 0
	octave 6
	note D#, 3
	octave 5
	note A#, 3
	note B_, 0
	note __, 0
	octave 6
	note F#, 11
	note F_, 0
	note F#, 0
	note G#, 15
	note F_, 7
	note C#, 0
	note __, 0
	note D#, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 5
	note G#, 0
	note __, 0
	octave 6
	note F_, 0
	note F#, 0
	note F_, 0
	note D#, 0
	note F_, 0
	notetype $6, $24
	note E_, 0
	note D_, 0
	note C_, 0
	octave 5
	note B_, 0
	note A_, 0
	note G_, 0
	intensity $14
	note G_, 1
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 5
	note G_, 1
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	intensity $14
	octave 5
	note G_, 3
	loopchannel 0, Music_KantoTrainerBattle_branch_ece5a
; ed06d
