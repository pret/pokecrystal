Music_Bicycle: ; ee119
	dbw $c0, Music_Bicycle_Ch1
	dbw $01, Music_Bicycle_Ch2
	dbw $02, Music_Bicycle_Ch3
	dbw $03, Music_Bicycle_Ch4
; ee125


Music_Bicycle_Ch1: ; ee125
	tempo 140
	volume $77
	dutycycle $3
	tone $0001
	stereopanning $f
	vibrato $8, $15
	notetype $c, $b4
	octave 3
	note B_, 5
	note A_, 5
	note G_, 3
	intensity $b0
	note A_, 5
	intensity $b6
	note A_, 7
	intensity $b2
	note F#, 1

Music_Bicycle_branch_ee144: ; ee144
	stereopanning $f
	intensity $b2
	note G_, 1
	note G_, 1
	note E_, 1
	note E_, 1
	note F#, 0
	note E_, 0
	note D#, 1
	note D_, 1
	note D_, 1
	note E_, 1
	note E_, 1
	note C_, 1
	note C_, 1
	octave 2
	note B_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C_, 1
	note C_, 1
	note E_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note E_, 1
	note E_, 1
	note F#, 0
	note E_, 0
	note D#, 1
	note D_, 1
	note D_, 1
	note E_, 1
	note E_, 1
	note C_, 1
	note C_, 1
	octave 2
	note B_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	intensity $82
	note F#, 1
	intensity $b2
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	stereopanning $f0
	intensity $b6
	note B_, 3
	note G_, 3
	octave 4
	note D_, 3
	octave 3
	note G_, 3
	note A_, 3
	note F#, 3
	octave 4
	note D_, 3
	octave 3
	note F#, 3
	note G_, 3
	note E_, 3
	octave 4
	note C_, 3
	octave 3
	note E_, 3
	note F#, 3
	note D_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 3
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note G_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	note F#, 1
	note C_, 1
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note C_, 1
	octave 3
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	loopchannel 0, Music_Bicycle_branch_ee144

Music_Bicycle_Ch2: ; ee1de
	dutycycle $2
	vibrato $10, $24
	stereopanning $f0
	notetype $c, $c6
	octave 4
	note D_, 5
	note C_, 5
	octave 3
	note B_, 3
	intensity $c2
	octave 4
	note D_, 1
	note D_, 0
	note E_, 0
	note D_, 1
	note D_, 0
	note E_, 0
	note D_, 1
	intensity $c3
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1

Music_Bicycle_branch_ee1fd: ; ee1fd
	stereopanning $ff
	dutycycle $2
	intensity $c3
	octave 3
	note B_, 3
	note G_, 3
	note A_, 3
	note F#, 3
	intensity $c2
	note G_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	intensity $c5
	note D_, 7
	intensity $c4
	note E_, 3
	note G_, 3
	intensity $c2
	note E_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	intensity $c5
	note F#, 7
	intensity $c3
	note B_, 3
	note G_, 3
	note A_, 3
	note F#, 3
	intensity $c2
	note G_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	intensity $c5
	note D_, 7
	intensity $c4
	note E_, 3
	note G_, 3
	intensity $c2
	note E_, 1
	octave 4
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 1
	intensity $c7
	note F#, 7
	stereopanning $f
	callchannel Music_Bicycle_branch_ee263
	note F#, 3
	intensity $c3
	note A_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 3
	intensity $c7
	callchannel Music_Bicycle_branch_ee263
	note F#, 3
	intensity $c3
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 3
	loopchannel 0, Music_Bicycle_branch_ee1fd
; ee263

Music_Bicycle_branch_ee263: ; ee263
	note G_, 5
	note B_, 5
	note G_, 3
	note F#, 5
	note A_, 5
	note F#, 3
	note E_, 5
	note G_, 5
	note E_, 3
	endchannel

Music_Bicycle_Ch3: ; ee26d
	notetype $c, $14
	note __, 15
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note C_, 1
	note E_, 1
	note D_, 1
	octave 3
	note A_, 0
	note __, 0

Music_Bicycle_branch_ee27f: ; ee27f
	callchannel Music_Bicycle_branch_ee333
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note D_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F#, 0
	note __, 0
	callchannel Music_Bicycle_branch_ee333
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note F_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	note A_, 0
	note __, 0

Music_Bicycle_branch_ee2e9: ; ee2e9
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note E_, 0
	note __, 0
	note G_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	octave 4
	note C_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	note A_, 0
	note __, 0
	loopchannel 2, Music_Bicycle_branch_ee2e9
	loopchannel 0, Music_Bicycle_branch_ee27f
; ee333

Music_Bicycle_branch_ee333: ; ee333
	octave 3
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 0
	note __, 0
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	endchannel

Music_Bicycle_Ch4: ; ee345
	togglenoise $0
	notetype $c
	note __, 15
	note __, 15

Music_Bicycle_branch_ee34b: ; ee34b
	note __, 1

Music_Bicycle_branch_ee34c: ; ee34c
	stereopanning $f0
	note F_, 3
	loopchannel 12, Music_Bicycle_branch_ee34c
	note F_, 3
	note F_, 3
	stereopanning $ff
	note F_, 1
	note F_, 1
	note F_, 1
	loopchannel 0, Music_Bicycle_branch_ee34b
; ee35e
