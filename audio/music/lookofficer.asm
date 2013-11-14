Music_LookOfficer: ; ed82d
	dbw $80, Music_LookOfficer_Ch1
	dbw $01, Music_LookOfficer_Ch2
	dbw $02, Music_LookOfficer_Ch3
; ed836


Music_LookOfficer_Ch1: ; ed836
	tempo 116
	volume $77
	tone $0001
	vibrato $12, $34
	stereopanning $f
	dutycycle $3
	notetype $c, $a7
	octave 4
	note C#, 0
	note D_, 0
	note D#, 0
	note E_, 0
	note F_, 11
	intensity $2f
	octave 3
	note B_, 15

Music_LookOfficer_branch_ed852: ; ed852
	intensity $82
	note __, 3
	note B_, 5
	note G#, 3
	note B_, 5
	note B_, 5
	note G#, 3
	note B_, 1
	intensity $2f
	note A#, 15
	note A_, 15
	loopchannel 0, Music_LookOfficer_branch_ed852

Music_LookOfficer_Ch2: ; ed863
	vibrato $12, $34
	dutycycle $3
	notetype $c, $b7
	octave 5
	note D#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 4
	note B_, 11
	dutycycle $3
	intensity $a2
	octave 1
	note B_, 3
	octave 2
	note A_, 1
	octave 1
	note B_, 3
	octave 2
	note F_, 1
	octave 1
	note B_, 1
	octave 2
	note D#, 1

Music_LookOfficer_branch_ed882: ; ed882
	note E_, 1
	note G#, 1
	octave 3
	note E_, 1
	octave 2
	note E_, 1
	note G#, 1
	note B_, 1
	note E_, 1
	note G#, 1
	loopchannel 2, Music_LookOfficer_branch_ed882
	forceoctave $1
	callchannel Music_LookOfficer_branch_ed89e
	forceoctave $0
	callchannel Music_LookOfficer_branch_ed89e
	loopchannel 0, Music_LookOfficer_branch_ed882
; ed89e

Music_LookOfficer_branch_ed89e: ; ed89e
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	note E_, 1
	octave 1
	note A_, 1
	octave 2
	note C#, 1
	endchannel

Music_LookOfficer_Ch3: ; ed8ad
	vibrato $14, $14
	stereopanning $f0
	notetype $c, $14
	note __, 9
	octave 3
	note B_, 1
	note __, 1
	note B_, 1
	intensity $12
	octave 5
	note D#, 1
	note __, 0
	note F_, 1
	note __, 0
	note A_, 1
	note B_, 1
	note __, 0
	octave 6
	note C#, 1
	note __, 0
	note D#, 1

Music_LookOfficer_branch_ed8c8: ; ed8c8
	note E_, 5
	note D#, 5
	note C#, 3
	octave 5
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 6
	note C#, 1
	note F_, 7
	note D_, 7
	note E_, 7
	note C#, 7
	loopchannel 0, Music_LookOfficer_branch_ed8c8
; ed8dd
