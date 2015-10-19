Music_DarkCave: ; ea2be
	dbw $c0, Music_DarkCave_Ch1
	dbw $01, Music_DarkCave_Ch2
	dbw $02, Music_DarkCave_Ch3
	dbw $03, Music_DarkCave_Ch4
; ea2ca

Music_DarkCave_Ch1: ; ea2ca
	tempo 128
	volume $7, $7
	waveduty $3
	pitchoffset $0001
	vibrato $11, $1, $5
	stereopanning $f0
	notetype $c, $a, $0, $7
Music_DarkCave_branch_ea2dc: ; ea2dc
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea2dc
	octave 3
	note D#, 16
	note D_, 16
	note C#, 16
	note C_, 16
	volenvelope $a, $0, $3
Music_DarkCave_branch_ea2e8: ; ea2e8
	callchannel Music_DarkCave_branch_ea333
	loopchannel 3, Music_DarkCave_branch_ea2e8
	volenvelope $b, $0, $7
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note G_, 8
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note C_, 8
	volenvelope $a, $0, $3
Music_DarkCave_branch_ea303: ; ea303
	callchannel Music_DarkCave_branch_ea333
	loopchannel 2, Music_DarkCave_branch_ea303
	note __, 16
	note __, 8
	volenvelope $b, $0, $7
	octave 2
	note F_, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	note __, 8
	octave 2
	note G#, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	note G_, 2
	note __, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 16
	note F_, 2
	note __, 6
	note G#, 2
	note G_, 2
	note G#, 4
	volenvelope $a, $0, $3
Music_DarkCave_branch_ea328: ; ea328
	callchannel Music_DarkCave_branch_ea333
	loopchannel 2, Music_DarkCave_branch_ea328
	loopchannel 0, Music_DarkCave_branch_ea2e8
; ea333

Music_DarkCave_branch_ea333: ; ea333
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	endchannel
; ea36a

Music_DarkCave_Ch2: ; ea36a
	waveduty $1
	vibrato $12, $3, $6
	stereopanning $f
	notetype $c, $a, $0, $7
Music_DarkCave_branch_ea374: ; ea374
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea374
	octave 3
	note G_, 16
	note A#, 16
	note F_, 16
	note G_, 16
Music_DarkCave_branch_ea37e: ; ea37e
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea37e
	note __, 8
	stereopanning $ff
	volenvelope $c, $0, $7
	octave 5
	note C_, 8
	volenvelope $c, $0, $4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	volenvelope $b, $0, $0
	note C#, 4
	volenvelope $b, $0, $7
	note C#, 12
	volenvelope $5, $1, $1
	note C_, 8
	volenvelope $c, $0, $7
	note C_, 8
	note __, 8
	volenvelope $c, $0, $7
	note C_, 8
	volenvelope $c, $0, $4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	volenvelope $c, $0, $7
	note C#, 12
	volenvelope $c, $0, $3
	note C_, 2
	note C#, 2
	volenvelope $b, $0, $0
	note D#, 10
	volenvelope $b, $0, $7
	note D#, 6
	stereopanning $f
	volenvelope $c, $0, $4
	octave 4
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 8
	octave 3
	note A#, 8
	volenvelope $b, $0, $0
	octave 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	volenvelope $b, $0, $0
	note C_, 8
	volenvelope $b, $0, $7
	note C_, 8
	volenvelope $c, $0, $7
	stereopanning $ff
	note __, 8
	octave 5
	note C_, 8
	volenvelope $c, $0, $4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	volenvelope $4, $1, $1
	note C#, 8
	volenvelope $c, $0, $7
	note C#, 8
	volenvelope $b, $0, $0
	note C_, 8
	volenvelope $b, $0, $7
	note C_, 8
	note __, 8
	volenvelope $c, $0, $7
	note C_, 8
	volenvelope $c, $0, $4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	volenvelope $b, $0, $0
	note C#, 8
	volenvelope $b, $0, $7
	note C#, 8
	volenvelope $b, $0, $0
	note C_, 8
	volenvelope $b, $0, $7
	note C_, 8
	volenvelope $c, $0, $7
	note __, 16
	stereopanning $f
	note __, 8
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	note __, 8
	note C#, 2
	note C_, 2
	note C#, 4
	note C_, 16
	volenvelope $c, $0, $2
	note D#, 8
	volenvelope $c, $0, $7
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	volenvelope $c, $0, $2
	octave 3
	note A#, 8
	volenvelope $c, $0, $7
	octave 4
	note C#, 2
	note C_, 2
	volenvelope $c, $0, $4
	note C#, 16
	note __, 4
	note __, 16
	note __, 16
	note __, 16
	volenvelope $b, $0, $7
	octave 5
	note D#, 16
	note D_, 16
	note F_, 16
	note D#, 16
	loopchannel 0, Music_DarkCave_branch_ea37e
; ea46e

Music_DarkCave_Ch3: ; ea46e
	notetype $c, $2, $0, $7
Music_DarkCave_branch_ea471: ; ea471
	callchannel Music_DarkCave_branch_ea4ce
	loopchannel 2, Music_DarkCave_branch_ea471
Music_DarkCave_branch_ea478: ; ea478
	callchannel Music_DarkCave_branch_ea4ce
	loopchannel 7, Music_DarkCave_branch_ea478
	callchannel Music_DarkCave_branch_ea4c3
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 12
	callchannel Music_DarkCave_branch_ea4c3
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	callchannel Music_DarkCave_branch_ea4a7
	callchannel Music_DarkCave_branch_ea4a7
	loopchannel 0, Music_DarkCave_branch_ea478
; ea4a7

Music_DarkCave_branch_ea4a7: ; ea4a7
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 2
	note A#, 4
	note A#, 2
	octave 3
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	endchannel
; ea4c3

Music_DarkCave_branch_ea4c3: ; ea4c3
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 2
	note A#, 12
	endchannel
; ea4ce

Music_DarkCave_branch_ea4ce: ; ea4ce
	octave 2
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 1
	note A#, 4
	note A#, 2
	octave 2
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 1
	note A#, 4
	octave 2
	note C#, 2
	note C_, 2
	note C#, 4
	endchannel
; ea4ea

Music_DarkCave_Ch4: ; ea4ea
	drumkittoggle $3
	notetype $c
Music_DarkCave_branch_ea4ee: ; ea4ee
	stereopanning $ff
	note D#, 8
	note D#, 8
	note D#, 4
	stereopanning $f0
	note C#, 4
	stereopanning $f
	note C#, 2
	note C#, 2
	stereopanning $f0
	note C#, 4
	stereopanning $ff
	note D#, 8
	note D#, 8
	note D#, 4
	stereopanning $f
	note C#, 8
	stereopanning $f0
	note C#, 2
	note C#, 2
	loopchannel 0, Music_DarkCave_branch_ea4ee
; ea50d


