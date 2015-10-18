Music_RuinsOfAlphRadio: ; eedcb
	dbw $80, Music_RuinsOfAlphRadio_Ch1
	dbw $01, Music_RuinsOfAlphRadio_Ch2
	dbw $02, Music_RuinsOfAlphRadio_Ch3
; eedd4

Music_RuinsOfAlphRadio_Ch1: ; eedd4
	tempo 160
	volume $7, $7
	setwaveduty $0
	setpitchoffset $0118
	vibrato $0, $f, $0
	stereopanning $f0
Music_RuinsOfAlphRadio_branch_eede3: ; eede3
	notetype $6, $7, $0, $1
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a, $0, $1
	note __, 16
	note __, 16
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a, $0, $1
	note __, 16
	note __, 16
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a, $0, $1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eede3
; eee01

Music_RuinsOfAlphRadio_branch_eee01: ; eee01
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 8
	endchannel
; eee08

Music_RuinsOfAlphRadio_branch_eee08: ; eee08
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note C_, 4
	note G_, 1
	octave 5
	note C_, 8
	endchannel
; eee12

Music_RuinsOfAlphRadio_Ch2: ; eee12
	setwaveduty $1
	vibrato $1, $e, $0
Music_RuinsOfAlphRadio_branch_eee17: ; eee17
	stereopanning $f
	notetype $6, $8, $0, $1
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a, $0, $1
	note __, 16
	note __, 16
	notetype $6, $8, $0, $1
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a, $0, $1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee17
; eee32

Music_RuinsOfAlphRadio_Ch3: ; eee32
	notetype $6, $2, $0, $6
Music_RuinsOfAlphRadio_branch_eee35: ; eee35
	octave 2
	note C_, 1
	note C#, 1
	note C_, 1
	note __, 16
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee35
; eee3e


