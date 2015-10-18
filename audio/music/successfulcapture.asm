Music_SuccessfulCapture: ; f4602
	dbw $80, Music_SuccessfulCapture_Ch1
	dbw $01, Music_SuccessfulCapture_Ch2
	dbw $02, Music_SuccessfulCapture_Ch3
; f460b

Music_SuccessfulCapture_Ch1: ; f460b
	tempo 126
	volume $7, $7
	setwaveduty $3
	setpitchoffset $0001
	notetype $c, $a, $0, $1
	jumpchannel Music_SuccessfulCapture_branch_f4536
; f461b

Music_SuccessfulCapture_Ch2: ; f461b
	vibrato $12, $2, $4
	notetype $c, $c, $0, $1
	setwaveduty $2
	jumpchannel Music_SuccessfulCapture_branch_f4585
; f4626

Music_SuccessfulCapture_Ch3: ; f4626
	notetype $c, $2, $0, $5
	jumpchannel Music_SuccessfulCapture_branch_f45cf
; f462c


