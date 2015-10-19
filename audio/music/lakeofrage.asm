Music_LakeOfRage: ; ee6c5
	dbw $c0, Music_LakeOfRage_Ch1
	dbw $01, Music_LakeOfRage_Ch2
	dbw $02, Music_LakeOfRage_Ch3
	dbw $03, Music_LakeOfRage_Ch4
; ee6d1

Music_LakeOfRage_Ch1: ; ee6d1
	tempo 144
	volume $7, $7
	waveduty $3
	pitchoffset $0002
	vibrato $8, $2, $2
	stereopanning $f0
	notetype $c, $b, $0, $4
	octave 3
	note D_, 6
	note D_, 10
	note D_, 6
	note D_, 6
	note E_, 4
Music_LakeOfRage_branch_ee6e9: ; ee6e9
	volenvelope $b, $0, $5
	note F#, 6
	note E_, 6
	note D_, 4
	octave 4
	note D_, 6
	note C_, 4
	note E_, 2
	note D_, 4
	octave 3
	note B_, 6
	note G_, 2
	notetype $8, $b, $0, $5
	note D_, 4
	note G_, 4
	note B_, 4
	notetype $c, $b, $0, $4
	note D_, 3
	note F#, 1
	volenvelope $b, $0, $7
	note A_, 8
	note F#, 4
	note A_, 3
	octave 4
	note C#, 1
	note D_, 12
	notetype $8, $b, $0, $4
	octave 3
	note C_, 4
	octave 2
	note B_, 4
	note A_, 4
	notetype $8, $b, $0, $7
	note A_, 12
	notetype $c, $b, $0, $7
	octave 3
	note C_, 12
	volenvelope $b, $0, $4
	note E_, 4
	note D_, 2
	volenvelope $b, $0, $7
	octave 2
	note A_, 10
	volenvelope $b, $0, $4
	octave 3
	note E_, 4
	note D_, 3
	note E_, 1
	volenvelope $b, $0, $7
	note F#, 8
	note D_, 6
	note C_, 1
	note E_, 1
	note C_, 8
	note E_, 6
	note E_, 1
	note G_, 1
	note E_, 8
	note G_, 6
	note F#, 1
	note G_, 1
	volenvelope $a, $0, $0
	note A_, 7
	volenvelope $a, $0, $7
	note A_, 7
	note A_, 1
	octave 4
	note C_, 1
	volenvelope $a, $0, $0
	note D_, 6
	volenvelope $a, $0, $7
	note D_, 6
	loopchannel 0, Music_LakeOfRage_branch_ee6e9
; ee749

Music_LakeOfRage_Ch2: ; ee749
	waveduty $3
	vibrato $20, $4, $4
	stereopanning $ff
	notetype $c, $9, $0, $0
	octave 3
	note G_, 8
	volenvelope $9, $0, $7
	note G_, 8
	volenvelope $a, $0, $0
	note A_, 8
	volenvelope $a, $0, $7
	note A_, 8
Music_LakeOfRage_branch_ee75e: ; ee75e
	notetype $8, $c, $0, $7
	octave 4
	note D_, 16
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	note A_, 16
	octave 5
	note C_, 4
	octave 4
	note B_, 4
	notetype $c, $c, $0, $7
	note G_, 12
	note B_, 4
	note A_, 3
	note G_, 1
	volenvelope $b, $0, $0
	note F#, 12
	volenvelope $b, $0, $7
	note F#, 16
	notetype $8, $c, $0, $3
	octave 3
	note G_, 4
	note F#, 4
	note E_, 4
	note C_, 15
	notetype $c, $c, $0, $3
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note __, 1
	note E_, 1
	note G_, 1
	volenvelope $c, $0, $5
	octave 5
	note C_, 10
	volenvelope $c, $0, $3
	octave 4
	note A_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	notetype $8, $c, $0, $3
	note D_, 4
	note E_, 4
	note F#, 4
	notetype $8, $c, $0, $7
	note A_, 12
	notetype $8, $c, $0, $3
	octave 3
	note G_, 4
	note F#, 4
	note E_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	octave 4
	note E_, 4
	note D_, 4
	note C_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	notetype $8, $c, $0, $7
	note F#, 16
	note D_, 4
	note F#, 4
	notetype $c, $c, $0, $7
	note A_, 16
	loopchannel 0, Music_LakeOfRage_branch_ee75e
; ee7c1

Music_LakeOfRage_Ch3: ; ee7c1
	stereopanning $f
	notetype $c, $1, $0, $6
	octave 3
	note G_, 4
	note __, 2
	note G_, 4
	note __, 6
	note F#, 4
	note __, 2
	note F#, 4
	note __, 2
	note E_, 4
Music_LakeOfRage_branch_ee7d0: ; ee7d0
	octave 3
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 4
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note F#, 2
	note G_, 4
	note D_, 2
	note G_, 4
	note D_, 2
	note G_, 2
	note B_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 4
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	octave 3
	note E_, 4
	note C_, 2
	note E_, 4
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 2
	note C_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	octave 4
	note D_, 4
	octave 3
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 4
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 2
	note C_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	loopchannel 0, Music_LakeOfRage_branch_ee7d0
; ee835

Music_LakeOfRage_Ch4: ; ee835
	stereopanning $f0
	drumkittoggle $3
	notetype $c
Music_LakeOfRage_branch_ee83b: ; ee83b
	note D_, 2
	note D_, 1
	note D_, 1
	note G_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note F#, 6
	note D_, 2
	note D_, 1
	note D_, 1
	note G_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_LakeOfRage_branch_ee83b
; ee852


