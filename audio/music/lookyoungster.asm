Music_LookYoungster: ; f66c3
	dbw $80, Music_LookYoungster_Ch1
	dbw $01, Music_LookYoungster_Ch2
	dbw $02, Music_LookYoungster_Ch3
; f66cc

Music_LookYoungster_Ch1: ; f66cc
	tempo 118
	volume $7, $7
	stereopanning $f
	waveduty $3
	notetype $c, $a, $0, $3
	octave 3
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	volenvelope $3, $1, $6
	note B_, 16
	volenvelope $c, $0, $3
	octave 4
	note C_, 1
	note __, 3
	note C_, 4
	note __, 2
	note C_, 6
	volenvelope $b, $0, $3
Music_LookYoungster_branch_f66ea: ; f66ea
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note __, 16
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 3
	note C_, 1
	note __, 1
	note __, 16
	loopchannel 0, Music_LookYoungster_branch_f66ea
; f670e


INCBIN "baserom.gbc", $f670e, $f670f - $f670e


Music_LookYoungster_Ch2: ; f670f
	stereopanning $f0
	vibrato $12, $2, $6
	waveduty $1
	notetype $c, $a, $0, $3
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D_, 1
	volenvelope $3, $1, $6
	notetype $c, $2, $1, $6
	note G_, 16
	notetype $c, $b, $0, $3
	volenvelope $c, $0, $3
	note F_, 1
	note __, 3
	note F_, 4
	note __, 2
	note F#, 6
Music_LookYoungster_branch_f672f: ; f672f
	waveduty $3
	volenvelope $b, $0, $3
	note __, 2
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	volenvelope $9, $0, $7
	waveduty $2
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note __, 1
	octave 3
	note G#, 1
	note __, 3
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	waveduty $3
	volenvelope $b, $0, $3
	note __, 2
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	waveduty $2
	volenvelope $9, $0, $7
	note G#, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 3
	octave 3
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	loopchannel 0, Music_LookYoungster_branch_f672f
; f6783


INCBIN "baserom.gbc", $f6783, $f6784 - $f6783


Music_LookYoungster_Ch3: ; f6784
	stereopanning $ff
	vibrato $2, $2, $4
	notetype $c, $2, $0, $5
	note __, 4
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	volenvelope $1, $0, $5
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 4
	note __, 2
	note G#, 6
	volenvelope $2, $0, $5
Music_LookYoungster_branch_f67ae: ; f67ae
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	loopchannel 0, Music_LookYoungster_branch_f67ae
; f6810


INCBIN "baserom.gbc", $f6810, $f6811 - $f6810



