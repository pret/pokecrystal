Music_DarkCave: ; ea2be
	dbw $c0, Music_DarkCave_Ch1
	dbw $01, Music_DarkCave_Ch2
	dbw $02, Music_DarkCave_Ch3
	dbw $03, Music_DarkCave_Ch4
; ea2ca


Music_DarkCave_Ch1: ; ea2ca
	tempo 128
	volume $77
	dutycycle $3
	tone $0001
	vibrato $11, $15
	stereopanning $f0
	notetype $c, $a7

Music_DarkCave_branch_ea2dc: ; ea2dc
	note __, 15
	loopchannel 4, Music_DarkCave_branch_ea2dc
	octave 3
	note D#, 15
	note D_, 15
	note C#, 15
	note C_, 15
	intensity $a3

Music_DarkCave_branch_ea2e8: ; ea2e8
	callchannel Music_DarkCave_branch_ea333
	loopchannel 3, Music_DarkCave_branch_ea2e8
	intensity $b7
	note G#, 7
	note D#, 7
	note G_, 7
	note D_, 7
	note F_, 7
	note C#, 7
	note D#, 7
	note G_, 7
	note G#, 7
	note D#, 7
	note G_, 7
	note D_, 7
	note F_, 7
	note C#, 7
	note D#, 7
	note C_, 7
	intensity $a3

Music_DarkCave_branch_ea303: ; ea303
	callchannel Music_DarkCave_branch_ea333
	loopchannel 2, Music_DarkCave_branch_ea303
	note __, 15
	note __, 7
	intensity $b7
	octave 2
	note F_, 1
	note G_, 1
	note G#, 3
	octave 3
	note D#, 15
	note __, 7
	octave 2
	note G#, 1
	note G_, 1
	note G#, 3
	octave 3
	note D#, 15
	note G_, 1
	note __, 5
	note F_, 1
	note G_, 1
	note G#, 3
	note G_, 15
	note F_, 1
	note __, 5
	note G#, 1
	note G_, 1
	note G#, 3
	intensity $a3

Music_DarkCave_branch_ea328: ; ea328
	callchannel Music_DarkCave_branch_ea333
	loopchannel 2, Music_DarkCave_branch_ea328
	loopchannel 0, Music_DarkCave_branch_ea2e8
; ea333

Music_DarkCave_branch_ea333: ; ea333
	octave 4
	note D#, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	octave 3
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note A#, 1
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	endchannel

Music_DarkCave_Ch2: ; ea36a
	dutycycle $1
	vibrato $12, $36
	stereopanning $f
	notetype $c, $a7

Music_DarkCave_branch_ea374: ; ea374
	note __, 15
	loopchannel 4, Music_DarkCave_branch_ea374
	octave 3
	note G_, 15
	note A#, 15
	note F_, 15
	note G_, 15

Music_DarkCave_branch_ea37e: ; ea37e
	note __, 15
	loopchannel 4, Music_DarkCave_branch_ea37e
	note __, 7
	stereopanning $ff
	intensity $c7
	octave 5
	note C_, 7
	intensity $c4
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note G_, 3
	note A#, 1
	octave 5
	note D_, 3
	intensity $b0
	note C#, 3
	intensity $b7
	note C#, 11
	intensity $59
	note C_, 7
	intensity $c7
	note C_, 7
	note __, 7
	intensity $c7
	note C_, 7
	intensity $c4
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note G_, 1
	note G_, 1
	note A#, 1
	octave 5
	note D_, 3
	intensity $c7
	note C#, 11
	intensity $c3
	note C_, 1
	note C#, 1
	intensity $b0
	note D#, 9
	intensity $b7
	note D#, 5
	stereopanning $f
	intensity $c4
	octave 4
	note F_, 3
	note D#, 1
	note D_, 1
	note D#, 3
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 3
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 7
	octave 3
	note A#, 7
	intensity $b0
	octave 4
	note D#, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 7
	note F_, 3
	note D#, 1
	note D_, 1
	note D#, 3
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note D_, 3
	note C_, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 3
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	intensity $b0
	note C_, 7
	intensity $b7
	note C_, 7
	intensity $c7
	stereopanning $ff
	note __, 7
	octave 5
	note C_, 7
	intensity $c4
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note G_, 3
	note A#, 1
	octave 5
	note D_, 3
	intensity $49
	note C#, 7
	intensity $c7
	note C#, 7
	intensity $b0
	note C_, 7
	intensity $b7
	note C_, 7
	note __, 7
	intensity $c7
	note C_, 7
	intensity $c4
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note G_, 1
	note G_, 1
	note A#, 1
	octave 5
	note D_, 3
	intensity $b0
	note C#, 7
	intensity $b7
	note C#, 7
	intensity $b0
	note C_, 7
	intensity $b7
	note C_, 7
	intensity $c7
	note __, 15
	stereopanning $f
	note __, 7
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note C#, 3
	note C_, 15
	note __, 7
	note C#, 1
	note C_, 1
	note C#, 3
	note C_, 15
	intensity $c2
	note D#, 7
	intensity $c7
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note C#, 3
	note C_, 15
	intensity $c2
	octave 3
	note A#, 7
	intensity $c7
	octave 4
	note C#, 1
	note C_, 1
	intensity $c4
	note C#, 15
	note __, 3
	note __, 15
	note __, 15
	note __, 15
	intensity $b7
	octave 5
	note D#, 15
	note D_, 15
	note F_, 15
	note D#, 15
	loopchannel 0, Music_DarkCave_branch_ea37e

Music_DarkCave_Ch3: ; ea46e
	notetype $c, $27

Music_DarkCave_branch_ea471: ; ea471
	callchannel Music_DarkCave_branch_ea4ce
	loopchannel 2, Music_DarkCave_branch_ea471

Music_DarkCave_branch_ea478: ; ea478
	callchannel Music_DarkCave_branch_ea4ce
	loopchannel 7, Music_DarkCave_branch_ea478
	callchannel Music_DarkCave_branch_ea4c3
	octave 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note D#, 3
	note F_, 1
	note __, 1
	octave 2
	note A#, 11
	callchannel Music_DarkCave_branch_ea4c3
	octave 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note D#, 3
	note F_, 1
	note __, 1
	octave 2
	note A#, 3
	octave 3
	note C#, 1
	note C_, 1
	note C#, 3
	callchannel Music_DarkCave_branch_ea4a7
	callchannel Music_DarkCave_branch_ea4a7
	loopchannel 0, Music_DarkCave_branch_ea478
; ea4a7

Music_DarkCave_branch_ea4a7: ; ea4a7
	octave 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note F_, 3
	note D#, 1
	note __, 1
	octave 2
	note A#, 3
	note A#, 1
	octave 3
	note C_, 1
	note C#, 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note D#, 3
	note F_, 1
	note __, 1
	octave 2
	note A#, 3
	octave 3
	note C#, 1
	note C_, 1
	note C#, 3
	endchannel
; ea4c3

Music_DarkCave_branch_ea4c3: ; ea4c3
	octave 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note F_, 3
	note D#, 1
	note __, 1
	octave 2
	note A#, 11
	endchannel
; ea4ce

Music_DarkCave_branch_ea4ce: ; ea4ce
	octave 2
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note F_, 3
	note D#, 1
	note __, 1
	octave 1
	note A#, 3
	note A#, 1
	octave 2
	note C_, 1
	note C#, 3
	note C_, 3
	note G_, 1
	note D#, 3
	note G_, 1
	note D#, 3
	note F_, 1
	note __, 1
	octave 1
	note A#, 3
	octave 2
	note C#, 1
	note C_, 1
	note C#, 3
	endchannel

Music_DarkCave_Ch4: ; ea4ea
	togglenoise $3
	notetype $c

Music_DarkCave_branch_ea4ee: ; ea4ee
	stereopanning $ff
	note D#, 7
	note D#, 7
	note D#, 3
	stereopanning $f0
	note C#, 3
	stereopanning $f
	note C#, 1
	note C#, 1
	stereopanning $f0
	note C#, 3
	stereopanning $ff
	note D#, 7
	note D#, 7
	note D#, 3
	stereopanning $f
	note C#, 7
	stereopanning $f0
	note C#, 1
	note C#, 1
	loopchannel 0, Music_DarkCave_branch_ea4ee
; ea50d
