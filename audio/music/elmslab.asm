Music_ElmsLab: ; ea040
	dbw $c0, Music_ElmsLab_Ch1
	dbw $01, Music_ElmsLab_Ch2
	dbw $02, Music_ElmsLab_Ch3
	dbw $03, Music_ElmsLab_Ch4
; ea04c


Music_ElmsLab_Ch1: ; ea04c
	tempo 144
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	octave 2
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	intensity $b6
	octave 3
	note C_, 7
	intensity $b2
	octave 2
	note A#, 1
	note A_, 1
	note G_, 1
	octave 3
	note C_, 7
	note F_, 3
	note F_, 3
	note F_, 7
	note A_, 3
	note A_, 3
	note A_, 1

Music_ElmsLab_branch_ea075: ; ea075
	note __, 1
	note A_, 1
	note G#, 1
	note A_, 1
	intensity $b7
	octave 4
	note C_, 3
	intensity $b5
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	intensity $b4
	note F_, 7
	intensity $b5
	octave 3
	note A_, 1
	note G#, 1
	note A_, 1
	note F_, 1
	intensity $b7
	note F_, 7
	intensity $b5
	note A_, 1
	note G_, 1
	note F_, 1
	intensity $b2
	note G_, 3
	intensity $b5
	note A_, 1
	note G#, 1
	note A_, 1
	intensity $b7
	note F_, 3
	intensity $b5
	note C_, 3
	intensity $b7
	note D_, 7
	intensity $b4
	note F_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	intensity $b7
	note E_, 7
	intensity $b4
	note G_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	intensity $b7
	note F_, 7
	intensity $b4
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	intensity $b2
	note G_, 3
	intensity $b4
	note F_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	intensity $b2
	note G_, 5
	intensity $b7
	note F_, 3
	octave 4
	note C_, 1
	octave 3
	note F_, 3
	note D_, 1
	note A#, 3
	note A_, 3
	intensity $b4
	note G_, 1
	note F_, 1
	note G_, 1
	intensity $b2
	note A_, 5
	intensity $b7
	note E_, 3
	note A#, 1
	note E_, 5
	intensity $b3
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A_, 1
	note G_, 1
	intensity $b2
	note E_, 5
	intensity $b4
	note F_, 3
	octave 4
	note C_, 3
	octave 3
	note F_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	note A_, 1
	intensity $b7
	note A#, 7
	octave 4
	note E_, 3
	note D_, 3
	note C_, 3
	octave 3
	note A#, 3
	octave 4
	note C_, 3
	note D_, 3
	note D#, 3
	note E_, 3
	intensity $b4
	octave 3
	note A_, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note F_, 1
	note A_, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note F_, 1
	note A_, 1
	note F_, 1
	octave 4
	note C_, 1
	octave 3
	note F_, 1
	note A_, 1
	intensity $b2
	note F_, 1
	note F_, 3
	loopchannel 0, Music_ElmsLab_branch_ea075

Music_ElmsLab_Ch2: ; ea128
	dutycycle $3
	vibrato $10, $26
	stereopanning $f
	notetype $c, $c3
	octave 4
	note F_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	intensity $c5
	octave 4
	note C_, 7
	intensity $c3
	octave 3
	note A#, 1
	note A_, 1
	note G_, 1
	note E_, 1
	intensity $c2
	note F_, 5
	octave 4
	note C_, 3
	note C_, 3
	note C_, 7
	note C_, 3
	note C_, 3
	note C_, 1
	stereopanning $ff

Music_ElmsLab_branch_ea14f: ; ea14f
	intensity $c6
	octave 4
	note F_, 5
	intensity $c2
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	intensity $c7
	note A_, 5
	intensity $c2
	note F_, 1
	intensity $c7
	note C_, 7
	intensity $c7
	note D_, 5
	intensity $c3
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	intensity $c7
	note F_, 5
	intensity $c3
	note C_, 1
	intensity $c7
	octave 3
	note A_, 9
	intensity $c3
	note A#, 1
	note A#, 1
	octave 4
	note D_, 1
	intensity $c5
	note C_, 3
	octave 3
	note A#, 5
	intensity $c3
	octave 4
	note C_, 1
	note C_, 1
	note E_, 1
	intensity $c4
	note D_, 3
	note C_, 5
	intensity $c2
	note D_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	intensity $c2
	note G_, 3
	intensity $c6
	note C_, 3
	note D_, 3
	intensity $c4
	note E_, 5
	intensity $c3
	note F_, 1
	note F_, 1
	note G_, 1
	intensity $c7
	note A_, 3
	intensity $c3
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 0
	note F_, 1
	intensity $c7
	note D_, 10
	intensity $c3
	note E_, 1
	note E_, 1
	note F_, 1
	intensity $c7
	note G_, 3
	intensity $c3
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 0
	note D_, 1
	intensity $c7
	note C_, 10
	intensity $c4
	note F_, 1
	note F_, 1
	note G_, 1
	intensity $c7
	note A_, 3
	intensity $c4
	note G_, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note A#, 0
	octave 5
	note C_, 1
	note D_, 4
	intensity $c3
	note E_, 1
	note D_, 1
	intensity $c7
	note C_, 3
	octave 4
	note A#, 3
	note A_, 3
	note G_, 3
	octave 5
	note C_, 3
	octave 4
	note A#, 3
	note A_, 3
	note G_, 3
	intensity $b0
	note F_, 7
	intensity $a0
	note F_, 7
	intensity $a7
	note F_, 9
	intensity $c2
	note C_, 1
	note F_, 1
	intensity $c4
	octave 3
	note E_, 1
	loopchannel 0, Music_ElmsLab_branch_ea14f

Music_ElmsLab_Ch3: ; ea1fd
	stereopanning $f
	notetype $c, $25
	note __, 7
	note __, 13
	octave 3
	note C_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note E_, 1

Music_ElmsLab_branch_ea216: ; ea216
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note D_, 1
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note A_, 1
	note D_, 1
	note A_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note A_, 1
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	note B_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 3
	octave 3
	note A#, 3
	note G_, 3
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note G_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	note D_, 1
	note A_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note G_, 1
	note A#, 1
	note D_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note C_, 3
	note D_, 3
	note E_, 3
	note G_, 3
	note E_, 3
	note F_, 3
	note F#, 3
	note G_, 3
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	loopchannel 0, Music_ElmsLab_branch_ea216

Music_ElmsLab_Ch4: ; ea2b1
	stereopanning $f0
	togglenoise $0
	notetype $c
	note __, 15
	note __, 1

Music_ElmsLab_branch_ea2b9: ; ea2b9
	note G_, 3
	loopchannel 0, Music_ElmsLab_branch_ea2b9
; ea2be
