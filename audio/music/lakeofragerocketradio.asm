Music_LakeOfRageRocketRadio: ; ef5b1
	dbw $80, Music_LakeOfRageRocketRadio_Ch1
	dbw $01, Music_LakeOfRageRocketRadio_Ch2
	dbw $02, Music_LakeOfRageRocketRadio_Ch3
; ef5ba

Music_LakeOfRageRocketRadio_Ch1: ; ef5ba
	tempo 160
	volume $7, $7
	setwaveduty $1
	setpitchoffset $1118
	vibrato $0, $f, $0
	stereopanning $f0
Music_LakeOfRageRocketRadio_branch_ef5c9: ; ef5c9
	notetype $c, $a, $0, $7
	octave 7
	note G_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note __, 16
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5d6

Music_LakeOfRageRocketRadio_Ch2: ; ef5d6
	setwaveduty $1
	vibrato $13, $e, $8
	notetype $c, $a, $0, $7
	note __, 2
	stereopanning $f
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5e5

Music_LakeOfRageRocketRadio_Ch3: ; ef5e5
	notetype $c, $2, $0, $6
	vibrato $10, $4, $4
	note __, 4
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
; ef5f0


