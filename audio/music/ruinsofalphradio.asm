Music_RuinsOfAlphRadio: ; eedcb
	dbw $80, Music_RuinsOfAlphRadio_Ch1
	dbw $01, Music_RuinsOfAlphRadio_Ch2
	dbw $02, Music_RuinsOfAlphRadio_Ch3
; eedd4


Music_RuinsOfAlphRadio_Ch1: ; eedd4
	tempo 160
	volume $77
	dutycycle $0
	tone $0118
	vibrato $0, $f0
	stereopanning $f0

Music_RuinsOfAlphRadio_branch_eede3: ; eede3
	notetype $6, $71
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 15
	note __, 15
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a1
	note __, 15
	note __, 15
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 15
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eede3
; eee01

Music_RuinsOfAlphRadio_branch_eee01: ; eee01
	octave 4
	note G_, 0
	note F#, 0
	note G_, 0
	note F#, 0
	note C_, 7
	endchannel
; eee08

Music_RuinsOfAlphRadio_branch_eee08: ; eee08
	octave 4
	note G_, 0
	note F#, 0
	note G_, 0
	note F#, 0
	note C_, 3
	note G_, 0
	octave 5
	note C_, 7
	endchannel

Music_RuinsOfAlphRadio_Ch2: ; eee12
	dutycycle $1
	vibrato $1, $e0

Music_RuinsOfAlphRadio_branch_eee17: ; eee17
	stereopanning $f
	notetype $6, $81
	callchannel Music_RuinsOfAlphRadio_branch_eee01
	notetype $c, $a1
	note __, 15
	note __, 15
	notetype $6, $81
	callchannel Music_RuinsOfAlphRadio_branch_eee08
	notetype $c, $a1
	note __, 15
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee17

Music_RuinsOfAlphRadio_Ch3: ; eee32
	notetype $6, $26

Music_RuinsOfAlphRadio_branch_eee35: ; eee35
	octave 2
	note C_, 0
	note C#, 0
	note C_, 0
	note __, 15
	loopchannel 0, Music_RuinsOfAlphRadio_branch_eee35
; eee3e
