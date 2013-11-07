Music_VictoryRoad: ; f6c72
	dbw $c0, Music_VictoryRoad_Ch1
	dbw $01, Music_VictoryRoad_Ch2
	dbw $02, Music_VictoryRoad_Ch3
	dbw $03, Music_VictoryRoad_Ch4
; f6c7e


Music_VictoryRoad_Ch1: ; f6c7e
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $3
	tone $0002
	notetype $c, $b3

Music_VictoryRoad_branch_f6c8d: ; f6c8d
	callchannel Music_VictoryRoad_branch_f6cb9
	loopchannel 6, Music_VictoryRoad_branch_f6c8d

Music_VictoryRoad_branch_f6c94: ; f6c94
	intensity $b2
	octave 2
	note A_, 0
	octave 3
	note C#, 0
	note D_, 0
	note __, 0
	octave 2
	note A_, 0
	intensity $b7
	octave 3
	note C#, 2
	octave 2
	note A_, 0
	octave 3
	note D_, 2
	octave 2
	note A_, 0
	octave 3
	note G#, 2
	loopchannel 2, Music_VictoryRoad_branch_f6c94

Music_VictoryRoad_branch_f6cae: ; f6cae
	callchannel Music_VictoryRoad_branch_f6cb9
	loopchannel 2, Music_VictoryRoad_branch_f6cae
	loopchannel 0, Music_VictoryRoad_branch_f6c8d
; f6cb9

Music_VictoryRoad_branch_f6cb9: ; f6cb9
	intensity $b2
	octave 2
	note G_, 0
	note B_, 0
	octave 3
	note C_, 0
	note __, 0
	octave 2
	note G_, 0
	intensity $b7
	note B_, 2
	note G_, 0
	octave 3
	note C_, 2
	octave 2
	note G_, 0
	octave 3
	note F#, 2
	endchannel

Music_VictoryRoad_Ch2: ; f6cce
	dutycycle $3
	vibrato $10, $24

Music_VictoryRoad_branch_f6cd3: ; f6cd3
	notetype $c, $c2
	callchannel Music_VictoryRoad_branch_f6d1e
	note __, 1
	callchannel Music_VictoryRoad_branch_f6d1e
	note __, 0
	octave 4
	note C_, 0
	notetype $c, $b0
	note E_, 7
	octave 5
	note C_, 3
	octave 4
	note B_, 3
	note E_, 14
	note D#, 0
	notetype $c, $b0
	note E_, 7
	octave 5
	note C_, 3
	octave 4
	note B_, 3
	notetype $c, $b0
	octave 5
	note E_, 7
	notetype $c, $b7
	note E_, 7
	notetype $c, $c7
	note D_, 7
	stereopanning $f0
	note C#, 3
	stereopanning $f
	octave 4
	note A_, 3
	stereopanning $ff
	octave 5
	note C_, 7
	stereopanning $f
	octave 4
	note A#, 3
	stereopanning $f0
	note F_, 3
	stereopanning $ff
	note A_, 11
	note D_, 0
	note F#, 0
	note A_, 0
	octave 5
	note C#, 0
	note D_, 15
	loopchannel 0, Music_VictoryRoad_branch_f6cd3
; f6d1e

Music_VictoryRoad_branch_f6d1e: ; f6d1e
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F#, 0
	note F#, 0
	note __, 1
	note G#, 0
	note G#, 0
	note __, 1
	note A_, 0
	note A_, 0
	endchannel

Music_VictoryRoad_Ch3: ; f6d2c
	stereopanning $f0
	notetype $c, $28

Music_VictoryRoad_branch_f6d31: ; f6d31
	callchannel Music_VictoryRoad_branch_f6d52
	loopchannel 6, Music_VictoryRoad_branch_f6d31

Music_VictoryRoad_branch_f6d38: ; f6d38
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	note F_, 0
	note A_, 2
	note D_, 0
	note B_, 0
	note __, 1
	note D_, 0
	note B_, 2
	loopchannel 2, Music_VictoryRoad_branch_f6d38

Music_VictoryRoad_branch_f6d47: ; f6d47
	callchannel Music_VictoryRoad_branch_f6d52
	loopchannel 2, Music_VictoryRoad_branch_f6d47
	loopchannel 0, Music_VictoryRoad_branch_f6d31
; f6d52

Music_VictoryRoad_branch_f6d52: ; f6d52
	octave 3
	note C_, 0
	note __, 0
	note A_, 0
	note __, 0
	note D#, 0
	note G_, 2
	note C_, 0
	note A_, 0
	note __, 1
	note C_, 0
	note A_, 2
	endchannel

Music_VictoryRoad_Ch4: ; f6d5f
	togglenoise $0
	notetype $c

Music_VictoryRoad_branch_f6d63: ; f6d63
	note D_, 1
	note D_, 1
	note D#, 0
	note D_, 2
	note D#, 0
	note D_, 2
	note D#, 0
	note D_, 2
	note D_, 1
	note D_, 1
	note D#, 0
	note D_, 2
	note D#, 0
	note D#, 0
	note D_, 1
	note D#, 0
	note D_, 1
	note D#, 0
	loopchannel 0, Music_VictoryRoad_branch_f6d63
; f6d79
