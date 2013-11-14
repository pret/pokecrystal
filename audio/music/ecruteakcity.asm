Music_EcruteakCity: ; ef2d0
	dbw $80, Music_EcruteakCity_Ch1
	dbw $01, Music_EcruteakCity_Ch2
	dbw $02, Music_EcruteakCity_Ch3
; ef2d9


Music_EcruteakCity_Ch1: ; ef2d9
	tempo 197
	volume $77
	stereopanning $f
	vibrato $12, $25
	dutycycle $2

Music_EcruteakCity_branch_ef2e5: ; ef2e5
	notetype $c, $57
	note __, 9
	octave 4
	note C_, 5
	note __, 9
	note C_, 5
	note __, 15
	octave 3
	note B_, 3
	octave 4
	note C_, 3
	note D_, 3
	intensity $60
	note __, 3
	note __, 15
	note __, 9
	note G_, 1
	note A_, 1
	note A#, 1
	note __, 7
	note G#, 1
	note G_, 1
	note F_, 1
	octave 5
	note C_, 5
	notetype $6, $67
	note C#, 3
	note D_, 9
	note __, 1
	stereopanning $ff
	octave 4
	note B_, 7
	stereopanning $f
	octave 3
	note A#, 0
	note B_, 10
	octave 4
	note C_, 3
	note E_, 3
	note G_, 11
	note A#, 11
	note G_, 3
	note __, 3
	note A#, 3
	octave 5
	note C#, 3
	note E_, 1
	note __, 1
	octave 3
	note A_, 7
	octave 4
	note C_, 7
	note F_, 3
	note __, 11
	note E_, 0
	note F_, 10
	note G_, 1
	note __, 1
	note A_, 3
	note G_, 3
	note __, 7
	intensity $52
	callchannel Music_EcruteakCity_branch_ef37f
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	callchannel Music_EcruteakCity_branch_ef391
	intensity $52
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	octave 4
	note A#, 1
	octave 5
	note E_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	callchannel Music_EcruteakCity_branch_ef37f
	note D_, 1
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	callchannel Music_EcruteakCity_branch_ef391
	loopchannel 0, Music_EcruteakCity_branch_ef2e5
; ef37f

Music_EcruteakCity_branch_ef37f: ; ef37f
	octave 5
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note E_, 1
	note C_, 1
	loopchannel 2, Music_EcruteakCity_branch_ef37f
	endchannel
; ef391

Music_EcruteakCity_branch_ef391: ; ef391
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	note F_, 1
	note A_, 1
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	note E_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	note E_, 1
	note C_, 1
	note A_, 1
	note E_, 1
	note C_, 1
	octave 3
	note A_, 1

Music_EcruteakCity_branch_ef3be: ; ef3be
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	loopchannel 2, Music_EcruteakCity_branch_ef3be

Music_EcruteakCity_branch_ef3d0: ; ef3d0
	octave 4
	note G_, 1
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	note G_, 1
	loopchannel 2, Music_EcruteakCity_branch_ef3d0
	intensity $50
	dutycycle $0
	note E_, 15
	note G_, 15
	dutycycle $2
	endchannel

Music_EcruteakCity_Ch2: ; ef3eb
	vibrato $12, $25
	dutycycle $3
	stereopanning $f0

Music_EcruteakCity_branch_ef3f2: ; ef3f2
	notetype $6, $67
	note __, 15
	note __, 4
	octave 4
	note G_, 0
	octave 5
	note D_, 0
	note E_, 8
	note __, 15
	note __, 4
	octave 4
	note A_, 0
	octave 5
	note E_, 0
	note F_, 8
	notetype $c, $77
	note __, 9
	note D_, 1
	note C_, 1
	octave 4
	note G#, 1
	note G_, 3
	note A_, 3
	note B_, 3
	notetype $6, $93
	intensity $97
	dutycycle $2
	octave 3
	note G_, 6
	octave 4
	note C#, 0
	note D_, 10
	note __, 0
	note C_, 1
	note __, 1
	note C_, 15
	note F_, 7
	note __, 3
	note E_, 3
	note __, 3
	note E_, 3
	note F_, 3
	note G_, 3
	note E_, 3
	note C_, 1
	note __, 1
	note C_, 3
	octave 3
	note A_, 1
	note F_, 0
	note A_, 0
	octave 4
	note C_, 15
	note E_, 3
	note G_, 1
	note __, 1
	note E_, 3
	note D_, 9
	note __, 0
	stereopanning $ff
	note D#, 8
	stereopanning $f0
	dutycycle $0
	octave 5
	note C#, 0
	note D_, 10
	note C_, 1
	note __, 1
	note C_, 15
	note F_, 11
	note E_, 3
	note __, 3
	note E_, 3
	note F_, 3
	note G_, 1
	octave 4
	note A_, 0
	octave 5
	note C_, 0
	note E_, 0
	note A_, 2
	note E_, 1
	note __, 1
	note E_, 3
	note C_, 1
	note __, 1
	note C_, 3
	octave 4
	note A_, 1
	note __, 1
	note B_, 3
	octave 5
	note C_, 1
	octave 4
	note G_, 0
	note B_, 0
	octave 5
	note D#, 0
	note E_, 10
	note D_, 1
	note __, 1
	note D_, 7
	dutycycle $1
	octave 4
	note E_, 3
	note G_, 2
	note G#, 0
	note A_, 15
	octave 3
	note A_, 3
	octave 4
	note C_, 1
	note __, 1
	note E_, 3
	note D_, 11
	note C_, 3
	note __, 3
	octave 3
	note B_, 3
	note __, 3
	octave 4
	note F_, 7
	note G_, 11
	note F_, 7
	note __, 3
	note E_, 7
	note D_, 3
	note C_, 1
	note __, 1
	octave 3
	note B_, 3
	octave 4
	note C_, 1
	note __, 5
	octave 3
	note B_, 3
	note __, 3
	octave 4
	note C_, 3
	octave 3
	note A_, 15
	note __, 3
	octave 4
	note F_, 3
	note E_, 3
	note D_, 3
	note C_, 11
	octave 3
	note B_, 3
	note __, 3
	octave 4
	note C_, 3
	note D_, 3
	note D#, 3
	notetype $c, $83
	note E_, 15
	intensity $80
	note D_, 3
	note C#, 3
	note F_, 3
	notetype $6, $80
	note G_, 6
	note G#, 0
	intensity $87
	note A_, 11
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 2
	note G#, 0
	note A_, 3
	note E_, 1
	note __, 1
	note E_, 3
	note D_, 1
	note __, 1
	note C#, 3
	note D_, 11
	octave 3
	note B_, 3
	octave 4
	note F_, 3
	note G_, 11
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 3
	note G_, 3
	note D_, 1
	note __, 0
	note A#, 0
	note B_, 11
	octave 5
	note C_, 3
	octave 4
	note A_, 7
	octave 3
	note A_, 3
	octave 4
	note C_, 3
	notetype $c, $87
	note F_, 9
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 7
	note __, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note E_, 15
	loopchannel 0, Music_EcruteakCity_branch_ef3f2

Music_EcruteakCity_Ch3: ; ef4e1
	stereopanning $ff

Music_EcruteakCity_branch_ef4e3: ; ef4e3
	vibrato $12, $25
	notetype $c, $25
	octave 3
	note C_, 1
	note G_, 1
	octave 4
	note D_, 1
	note E_, 9
	octave 3
	note C_, 1
	note A_, 1
	octave 4
	note E_, 1
	note F_, 9
	octave 3
	note C_, 1
	note G_, 1
	octave 4
	note D_, 1
	note E_, 9
	note G_, 3
	note F#, 3
	note F_, 3
	octave 3
	note B_, 1
	note G_, 1
	note C_, 1
	note G_, 1
	octave 4
	note D_, 1
	note E_, 9
	octave 3
	note C#, 1
	note G_, 1
	note A#, 1
	octave 4
	note D_, 1
	note __, 1
	note C#, 1
	note D_, 1
	note E_, 1
	octave 3
	note D_, 1
	note A_, 0
	note __, 0
	octave 4
	note E_, 1
	note F_, 0
	note __, 0
	note G#, 7
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	note G_, 0
	note G#, 4
	octave 3
	note C_, 1
	note G_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G_, 1
	octave 5
	note C_, 1
	note D_, 1
	note E_, 1
	octave 3
	note C#, 1
	note A#, 1
	octave 4
	note D_, 1
	note C#, 1
	note E_, 1
	note D_, 1
	note F_, 1
	note G_, 0
	note __, 0
	octave 3
	note F_, 7
	octave 4
	note A_, 1
	octave 5
	note C_, 0
	note __, 0
	note D_, 1
	note E_, 0
	note __, 0
	octave 2
	note G_, 1
	octave 3
	note D_, 1
	note G_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	callchannel Music_EcruteakCity_branch_ef569
	octave 4
	note C_, 7
	note E_, 7
	note G_, 7
	note B_, 7
	note A#, 7
	note G_, 7
	note E_, 7
	note C#, 7
	notetype $c, $25
	callchannel Music_EcruteakCity_branch_ef569
	octave 4
	note C_, 7
	octave 3
	note G_, 7
	note E_, 7
	note D_, 7
	loopchannel 0, Music_EcruteakCity_branch_ef4e3
; ef569

Music_EcruteakCity_branch_ef569: ; ef569
	octave 3
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 3
	note __, 1
	note C_, 0
	note __, 0
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 1
	note __, 1
	note F_, 0
	note __, 0
	note E_, 3
	note __, 1
	note B_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 1
	note __, 1
	note B_, 0
	note __, 0
	note A_, 3
	note __, 1
	note A_, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 3
	note __, 1
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 0
	note __, 0
	note G_, 3
	note __, 1
	octave 4
	note D_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A#, 0
	notetype $6, $25
	note __, 0
	note B_, 0
	endchannel
; ef5b1
