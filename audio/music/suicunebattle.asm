Music_SuicuneBattle: ; 178b81
	dbw $80, Music_SuicuneBattle_Ch1
	dbw $01, Music_SuicuneBattle_Ch2
	dbw $02, Music_SuicuneBattle_Ch3
; 178b8a

Music_SuicuneBattle_Ch1: ; 178b8a
	tempo 101
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $12, $1, $5
	notetype $c, $b, $0, $7
	octave 4
	note A_, 1
	note G#, 1
	note G_, 4
	note E_, 2
	note D#, 1
	note D_, 1
	note C#, 4
	octave 3
	note A#, 2
	note A_, 1
	note G#, 1
	note G_, 4
	note E_, 2
	note D#, 1
	note D_, 1
	note C#, 4
	octave 2
	note A#, 2
	notetype $c, $b, $0, $2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	notetype $c, $b, $0, $3
	octave 4
	note F_, 4
	note E_, 2
	notetype $c, $b, $0, $2
	octave 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	notetype $c, $b, $0, $3
	octave 4
	note F_, 4
	note E_, 2
	notetype $c, $b, $0, $2
	octave 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	notetype $c, $b, $0, $3
	octave 4
	note F_, 4
	note E_, 2
	notetype $c, $b, $0, $2
	octave 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 1
	note B_, 1
	octave 3
	note E_, 1
	note G#, 1
Music_SuicuneBattle_branch_178bfc: ; 178bfc
	notetype $c, $b, $0, $4
	octave 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note A_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 4
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note F_, 4
	note E_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note E_, 2
	octave 2
	note G_, 2
	octave 3
	note E_, 2
	note G_, 2
	note A_, 6
	note G_, 4
	note F_, 4
	note E_, 2
	note D_, 6
	octave 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note A_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 4
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note F_, 4
	note E_, 2
	note D_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note A_, 4
	note G_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note C_, 2
	octave 4
	note C_, 4
	octave 3
	note A_, 2
	note G_, 2
	note C_, 2
	notetype $c, $b, $0, $3
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note __, 2
	note E_, 4
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	notetype $c, $b, $0, $6
	octave 3
	note G_, 10
	notetype $c, $b, $0, $3
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	notetype $c, $b, $0, $7
	octave 3
	note G_, 10
	notetype $c, $b, $0, $3
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note __, 2
	note E_, 4
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note B_, 2
	octave 3
	note C_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note G_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	note F#, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	notetype $c, $b, $0, $2
	octave 2
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	note B_, 6
	note B_, 2
	notetype $c, $b, $0, $4
	octave 3
	note C_, 6
	notetype $c, $b, $0, $2
	octave 2
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 2
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 2
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $5
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	notetype $c, $b, $0, $5
	octave 4
	note C_, 6
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $4
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $4
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	note B_, 2
	notetype $c, $b, $0, $4
	octave 1
	note F#, 4
	notetype $c, $b, $0, $2
	octave 3
	note B_, 2
	notetype $c, $b, $0, $5
	octave 4
	note C_, 6
	notetype $c, $b, $0, $7
	octave 2
	note B_, 8
	note E_, 8
	octave 3
	note C_, 8
	octave 2
	note A_, 8
	note B_, 8
	note E_, 8
	note F_, 10
	note C_, 2
	note D_, 2
	note C_, 2
	notetype $c, $a, $0, $0
	octave 1
	note F#, 8
	note B_, 8
	note G_, 8
	octave 2
	note C_, 8
	octave 1
	note B_, 8
	note E_, 8
	note F_, 8
	notetype $c, $a, $0, $7
	note F_, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $c, $b, $0, $2
	note __, 4
	octave 3
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 8
	note F_, 4
	note E_, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	vibrato $8, $2, $4
	waveduty $2
	notetype $c, $9, $0, $6
	octave 4
	note E_, 6
	note F#, 6
	octave 3
	note A_, 4
	octave 4
	note A_, 16
	vibrato $12, $1, $5
	waveduty $3
	loopchannel 0, Music_SuicuneBattle_branch_178bfc
; 178dec

Music_SuicuneBattle_Ch2: ; 178dec
	waveduty $3
	vibrato $14, $3, $4
	pitchoffset $0001
	notetype $c, $c, $0, $3
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 2
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note A_, 6
	notetype $c, $c, $0, $2
	octave 2
	note E_, 8
	note E_, 8
	note E_, 8
	notetype $c, $c, $0, $3
	octave 4
	note A#, 4
	notetype $c, $c, $0, $2
	note A_, 4
	octave 2
	note E_, 8
	note E_, 8
	note E_, 8
	notetype $c, $c, $0, $3
	octave 4
	note A#, 4
	notetype $c, $c, $0, $2
	note A_, 4
	octave 4
	note E_, 8
	note E_, 8
	note E_, 8
	notetype $c, $c, $0, $3
	octave 4
	note A#, 4
	notetype $c, $c, $0, $2
	note A_, 4
	octave 4
	note E_, 8
	note E_, 8
	note E_, 8
	note E_, 4
Music_SuicuneBattle_branch_178e4e: ; 178e4e
	notetype $c, $c, $0, $7
	octave 3
	note A_, 8
	note B_, 8
	note D_, 8
	notetype $c, $b, $0, $0
	octave 4
	note D_, 8
	notetype $c, $b, $0, $6
	note D_, 8
	vibrato $10, $2, $4
	waveduty $2
	notetype $c, $a, $0, $4
	octave 5
	note A_, 6
	note B_, 6
	note D_, 4
	octave 6
	note D_, 8
	vibrato $14, $3, $4
	waveduty $3
	notetype $c, $c, $0, $7
	octave 4
	note C_, 8
	note D_, 8
	octave 3
	note G_, 8
	octave 4
	note F_, 8
	notetype $c, $b, $0, $0
	note E_, 10
	notetype $c, $b, $0, $7
	note E_, 6
	notetype $c, $a, $0, $5
	octave 2
	note G_, 4
	note A_, 4
	note G_, 4
	note B_, 4
	notetype $c, $c, $0, $7
	octave 3
	note A_, 8
	note B_, 8
	note D_, 8
	notetype $c, $c, $0, $7
	octave 4
	note D_, 8
	notetype $c, $4, $1, $4
	note D_, 4
	notetype $c, $c, $0, $6
	note D_, 4
	notetype $c, $a, $0, $4
	vibrato $8, $2, $4
	waveduty $2
	octave 5
	note A_, 6
	note B_, 6
	note D_, 4
	octave 6
	note D_, 8
	vibrato $14, $3, $4
	notetype $c, $c, $0, $7
	waveduty $3
	octave 4
	note C_, 8
	note D_, 8
	octave 3
	note G_, 8
	octave 4
	note F_, 8
	notetype $c, $4, $1, $4
	note E_, 8
	notetype $c, $c, $0, $7
	note E_, 8
	notetype $c, $c, $0, $6
	note C_, 8
	note G_, 8
	notetype $c, $c, $0, $2
	octave 3
	note F#, 2
	note G_, 2
	note __, 2
	note B_, 4
	note A_, 2
	note G_, 2
	note F#, 2
	note F#, 2
	note G_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note C_, 2
	note __, 2
	notetype $c, $c, $0, $7
	octave 4
	note C_, 10
	notetype $c, $c, $0, $3
	octave 4
	note G_, 2
	note C_, 2
	note __, 2
	notetype $c, $c, $0, $7
	octave 5
	note C_, 10
	notetype $c, $c, $0, $3
	octave 4
	note F#, 2
	note G_, 2
	note __, 2
	note B_, 4
	note A_, 2
	note G_, 2
	note F#, 2
	note F#, 2
	note G_, 2
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	notetype $c, $c, $0, $7
	note G_, 8
	note F#, 8
	note E_, 8
	note G_, 8
	notetype $c, $c, $0, $2
	octave 3
	note F#, 2
	note F#, 6
	note F#, 2
	note F#, 6
	note F#, 2
	note F#, 6
	note F#, 2
	notetype $c, $b, $0, $7
	note G_, 6
	notetype $c, $c, $0, $2
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 3
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 3
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 3
	note F#, 2
	notetype $c, $c, $0, $7
	note G_, 6
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	notetype $c, $c, $0, $7
	note G_, 6
	notetype $c, $c, $0, $2
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	note F#, 2
	notetype $c, $c, $0, $7
	octave 1
	note B_, 4
	notetype $c, $c, $0, $2
	octave 4
	note F#, 2
	notetype $c, $c, $0, $7
	note G_, 6
	notetype $c, $b, $0, $0
	octave 3
	note F#, 8
	octave 2
	note B_, 8
	octave 3
	note G_, 8
	note E_, 8
	note F#, 8
	octave 2
	note B_, 8
	octave 3
	note C_, 8
	notetype $c, $b, $0, $7
	octave 3
	note C_, 8
	notetype $c, $c, $0, $7
	octave 1
	note B_, 8
	octave 2
	note E_, 8
	note C_, 8
	note F_, 8
	note E_, 8
	octave 1
	note B_, 8
	notetype $c, $b, $0, $0
	octave 2
	note C_, 10
	notetype $c, $b, $0, $7
	octave 2
	note C_, 6
	notetype $c, $c, $0, $3
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note F_, 2
	octave 2
	note F_, 4
	note E_, 2
	octave 1
	note B_, 2
	note F_, 2
	note B_, 2
	octave 2
	note E_, 2
	note F_, 2
	note E_, 2
	octave 1
	note B_, 2
	note F_, 2
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	octave 1
	note F_, 2
	octave 2
	note F_, 4
	note E_, 2
	octave 1
	note B_, 2
	note F_, 2
	note B_, 2
	octave 2
	note E_, 2
	note F_, 2
	note E_, 2
	octave 1
	note B_, 2
	note F_, 2
	note B_, 2
	octave 2
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note F_, 2
	octave 3
	note F_, 4
	note E_, 2
	octave 2
	note B_, 2
	note F_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 2
	note E_, 2
	octave 2
	note B_, 2
	note F_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note F_, 2
	octave 3
	note F_, 4
	note E_, 2
	octave 2
	note B_, 2
	note F_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 2
	note E_, 2
	octave 2
	note B_, 2
	note F_, 2
	note B_, 2
	octave 3
	note E_, 2
	note D_, 2
	note G_, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 4
	note G_, 2
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 2
	note G#, 2
	octave 3
	note G#, 4
	note G_, 2
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	note G_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note F_, 2
	octave 4
	note F_, 4
	note E_, 2
	octave 3
	note B_, 2
	note F_, 2
	note B_, 2
	octave 4
	note E_, 2
	note F_, 2
	note E_, 2
	octave 3
	note B_, 2
	note F_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note F_, 2
	octave 4
	note F_, 4
	note E_, 2
	octave 3
	note B_, 2
	note F_, 2
	note B_, 2
	octave 4
	note E_, 2
	note F_, 2
	note E_, 2
	octave 3
	note B_, 2
	note F_, 2
	note B_, 2
	octave 4
	note E_, 2
	note D_, 2
	note G_, 2
	octave 3
	note G#, 2
	octave 4
	note G#, 4
	note G_, 2
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note G#, 2
	octave 4
	note G#, 4
	note G_, 2
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note D_, 2
	octave 3
	note G#, 2
	octave 4
	note D_, 2
	note G_, 2
	notetype $c, $c, $0, $2
	note A_, 8
	notetype $c, $c, $0, $3
	octave 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 4
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	octave 2
	note G_, 2
	octave 3
	note G_, 4
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note B_, 2
	note E_, 2
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	loopchannel 0, Music_SuicuneBattle_branch_178e4e
; 179122

Music_SuicuneBattle_Ch3: ; 179122
	notetype $c, $1, $1, $0
	note __, 16
	note __, 4
	octave 2
	note A_, 4
	note D_, 2
	note E_, 2
	note A#, 2
	note G_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 4
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 4
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note A_, 4
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 4
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 4
	note E_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note A_, 4
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	notetype $c, $1, $0, $6
Music_SuicuneBattle_branch_179182: ; 179182
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note A_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	note D_, 2
	note A_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note A_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	note D_, 2
	note A_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 3
	note C_, 4
	octave 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	note B_, 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	note B_, 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 4
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note D_, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note A_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note F#, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note G_, 6
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 2
	note G_, 6
	note B_, 2
	note B_, 2
	octave 1
	note B_, 4
	octave 2
	note B_, 2
	note B_, 2
	octave 1
	note B_, 4
	octave 2
	note B_, 2
	note B_, 2
	octave 1
	note B_, 4
	octave 2
	note B_, 2
	octave 3
	note C_, 6
	note F#, 2
	note F#, 2
	octave 1
	note B_, 4
	octave 3
	note F#, 2
	note F#, 2
	octave 1
	note B_, 4
	octave 3
	note F#, 2
	note F#, 2
	octave 1
	note B_, 4
	octave 3
	note F#, 2
	note G_, 6
	octave 2
	note F#, 8
	octave 1
	note B_, 8
	octave 2
	note G_, 8
	note E_, 8
	note F#, 8
	octave 1
	note B_, 8
	octave 2
	note C_, 10
	note C_, 2
	note D_, 2
	note C_, 2
	octave 1
	note B_, 8
	octave 2
	note E_, 8
	note C_, 8
	note F_, 8
	note E_, 8
	octave 1
	note B_, 8
	octave 2
	note C_, 16
	note __, 4
	octave 1
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	note __, 4
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	note __, 4
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	note __, 4
	note B_, 2
	note __, 6
	note B_, 2
	note __, 2
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	note F_, 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	note G#, 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	note F_, 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note B_, 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	note B_, 2
	octave 1
	note B_, 2
	octave 2
	note F_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	octave 3
	note D_, 2
	octave 2
	note G#, 2
	note D_, 2
	note G#, 2
	note A_, 4
	note __, 4
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note A_, 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note C_, 2
	note G_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note A_, 4
	note E_, 2
	note D_, 2
	note E_, 2
	loopchannel 0, Music_SuicuneBattle_branch_179182
; 17948b


