Music_ElmsLab: ; ea040
	dbw $c0, Music_ElmsLab_Ch1
	dbw $01, Music_ElmsLab_Ch2
	dbw $02, Music_ElmsLab_Ch3
	dbw $03, Music_ElmsLab_Ch4
; ea04c

Music_ElmsLab_Ch1: ; ea04c
	tempo 144
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0001
	vibrato $10, $1, $5
	stereopanning $f0
	notetype $c, $b, $0, $2
	octave 2
	note F_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	volenvelope $b, $0, $6
	octave 3
	note C_, 8
	volenvelope $b, $0, $2
	octave 2
	note A#, 2
	note A_, 2
	note G_, 2
	octave 3
	note C_, 8
	note F_, 4
	note F_, 4
	note F_, 8
	note A_, 4
	note A_, 4
	note A_, 2
Music_ElmsLab_branch_ea075: ; ea075
	note __, 2
	note A_, 2
	note G#, 2
	note A_, 2
	volenvelope $b, $0, $7
	octave 4
	note C_, 4
	volenvelope $b, $0, $5
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	volenvelope $b, $0, $4
	note F_, 8
	volenvelope $b, $0, $5
	octave 3
	note A_, 2
	note G#, 2
	note A_, 2
	note F_, 2
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $5
	note A_, 2
	note G_, 2
	note F_, 2
	volenvelope $b, $0, $2
	note G_, 4
	volenvelope $b, $0, $5
	note A_, 2
	note G#, 2
	note A_, 2
	volenvelope $b, $0, $7
	note F_, 4
	volenvelope $b, $0, $5
	note C_, 4
	volenvelope $b, $0, $7
	note D_, 8
	volenvelope $b, $0, $4
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	volenvelope $b, $0, $7
	note E_, 8
	volenvelope $b, $0, $4
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	volenvelope $b, $0, $7
	note F_, 8
	volenvelope $b, $0, $4
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	volenvelope $b, $0, $2
	note G_, 4
	volenvelope $b, $0, $4
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	volenvelope $b, $0, $2
	note G_, 6
	volenvelope $b, $0, $7
	note F_, 4
	octave 4
	note C_, 2
	octave 3
	note F_, 4
	note D_, 2
	note A#, 4
	note A_, 4
	volenvelope $b, $0, $4
	note G_, 2
	note F_, 2
	note G_, 2
	volenvelope $b, $0, $2
	note A_, 6
	volenvelope $b, $0, $7
	note E_, 4
	note A#, 2
	note E_, 6
	volenvelope $b, $0, $3
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note G_, 2
	volenvelope $b, $0, $2
	note E_, 6
	volenvelope $b, $0, $4
	note F_, 4
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	volenvelope $b, $0, $7
	note A#, 8
	octave 4
	note E_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note E_, 4
	volenvelope $b, $0, $4
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	volenvelope $b, $0, $2
	note F_, 2
	note F_, 4
	loopchannel 0, Music_ElmsLab_branch_ea075
; ea128

Music_ElmsLab_Ch2: ; ea128
	setwaveduty $3
	vibrato $10, $2, $6
	stereopanning $f
	notetype $c, $c, $0, $3
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 2
	volenvelope $c, $0, $5
	octave 4
	note C_, 8
	volenvelope $c, $0, $3
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note E_, 2
	volenvelope $c, $0, $2
	note F_, 6
	octave 4
	note C_, 4
	note C_, 4
	note C_, 8
	note C_, 4
	note C_, 4
	note C_, 2
	stereopanning $ff
Music_ElmsLab_branch_ea14f: ; ea14f
	volenvelope $c, $0, $6
	octave 4
	note F_, 6
	volenvelope $c, $0, $2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	volenvelope $c, $0, $7
	note A_, 6
	volenvelope $c, $0, $2
	note F_, 2
	volenvelope $c, $0, $7
	note C_, 8
	volenvelope $c, $0, $7
	note D_, 6
	volenvelope $c, $0, $3
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	volenvelope $c, $0, $7
	note F_, 6
	volenvelope $c, $0, $3
	note C_, 2
	volenvelope $c, $0, $7
	octave 3
	note A_, 10
	volenvelope $c, $0, $3
	note A#, 2
	note A#, 2
	octave 4
	note D_, 2
	volenvelope $c, $0, $5
	note C_, 4
	octave 3
	note A#, 6
	volenvelope $c, $0, $3
	octave 4
	note C_, 2
	note C_, 2
	note E_, 2
	volenvelope $c, $0, $4
	note D_, 4
	note C_, 6
	volenvelope $c, $0, $2
	note D_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	volenvelope $c, $0, $2
	note G_, 4
	volenvelope $c, $0, $6
	note C_, 4
	note D_, 4
	volenvelope $c, $0, $4
	note E_, 6
	volenvelope $c, $0, $3
	note F_, 2
	note F_, 2
	note G_, 2
	volenvelope $c, $0, $7
	note A_, 4
	volenvelope $c, $0, $3
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note G_, 1
	note F_, 2
	volenvelope $c, $0, $7
	note D_, 11
	volenvelope $c, $0, $3
	note E_, 2
	note E_, 2
	note F_, 2
	volenvelope $c, $0, $7
	note G_, 4
	volenvelope $c, $0, $3
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note F_, 1
	note D_, 2
	volenvelope $c, $0, $7
	note C_, 11
	volenvelope $c, $0, $4
	note F_, 2
	note F_, 2
	note G_, 2
	volenvelope $c, $0, $7
	note A_, 4
	volenvelope $c, $0, $4
	note G_, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note A#, 1
	octave 5
	note C_, 2
	note D_, 5
	volenvelope $c, $0, $3
	note E_, 2
	note D_, 2
	volenvelope $c, $0, $7
	note C_, 4
	octave 4
	note A#, 4
	note A_, 4
	note G_, 4
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 4
	note G_, 4
	volenvelope $b, $0, $0
	note F_, 8
	volenvelope $a, $0, $0
	note F_, 8
	volenvelope $a, $0, $7
	note F_, 10
	volenvelope $c, $0, $2
	note C_, 2
	note F_, 2
	volenvelope $c, $0, $4
	octave 3
	note E_, 2
	loopchannel 0, Music_ElmsLab_branch_ea14f
; ea1fd

Music_ElmsLab_Ch3: ; ea1fd
	stereopanning $f
	notetype $c, $2, $0, $5
	note __, 8
	note __, 14
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 2
Music_ElmsLab_branch_ea216: ; ea216
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	octave 3
	note A#, 4
	note G_, 4
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A_, 2
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
	note G_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note C_, 4
	note D_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G_, 4
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	loopchannel 0, Music_ElmsLab_branch_ea216
; ea2b1

Music_ElmsLab_Ch4: ; ea2b1
	stereopanning $f0
	togglenoise $0
	notetype $c
	note __, 16
	note __, 2
Music_ElmsLab_branch_ea2b9: ; ea2b9
	note G_, 4
	loopchannel 0, Music_ElmsLab_branch_ea2b9
; ea2be


