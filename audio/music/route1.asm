Music_Route1: ; ec000
	dbw $80, Music_Route1_Ch1
	dbw $01, Music_Route1_Ch2
	dbw $02, Music_Route1_Ch3
; ec009

INCBIN "baserom.gbc", $ec009, $ec00a - $ec009

Music_Route1_Ch1: ; ec00a
	stereopanning $f
	tempo 184
	volume $77
	vibrato $16, $11
	dutycycle $3
	notetype $c, $83
	octave 4
	note D_, 0
	note E_, 0
	note F#, 1
	note F#, 1
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note G_, 0
	note A_, 0
	note G_, 1
	note E_, 1
	note G_, 0
	note E_, 0
	octave 4
	note D_, 0
	note E_, 0
	note F#, 1
	note F#, 1
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 2
	note E_, 0
	note E_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	intensity $81
	octave 5
	note D_, 1
	note D_, 1
	intensity $83
	note __, 1

Music_Route1_branch_ec04a: ; ec04a
	intensity $83
	note __, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note __, 3
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note __, 1
	note __, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 2
	octave 4
	note D_, 0
	octave 3
	note E_, 1
	intensity $81
	note G_, 1
	note G_, 1
	intensity $83
	note __, 1
	note __, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note __, 3
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note __, 1
	note __, 1
	octave 4
	note C#, 1
	note C#, 0
	octave 3
	note B_, 0
	note A_, 0
	note G_, 0
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note __, 1
	note __, 1
	octave 3
	note F#, 0
	note G_, 0
	note A_, 3
	note __, 1
	note D_, 0
	note E_, 0
	note F#, 1
	note F#, 0
	note G_, 0
	note A_, 1
	note A_, 0
	note B_, 0
	note A_, 1
	note A_, 0
	note B_, 0
	note A_, 1
	intensity $81
	octave 4
	note G_, 1
	note G_, 1
	intensity $83
	octave 3
	note F#, 0
	note E_, 0
	note __, 1
	note E_, 0
	note F#, 0
	note G_, 5
	note E_, 0
	octave 2
	note B_, 0
	octave 3
	note C#, 1
	note E_, 0
	note F#, 0
	note G_, 3
	notetype $8, $83
	note A_, 0
	note B_, 0
	note A_, 0
	notetype $c, $83
	note G_, 0
	note E_, 0
	note F#, 1
	intensity $81
	octave 4
	note A_, 1
	note A_, 1
	intensity $83
	octave 3
	note A_, 0
	note G_, 0
	intensity $77
	intensity $1d
	note F#, 3
	note A_, 3
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	note F#, 3
	note A_, 2
	note F#, 0
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 0
	note G_, 0
	dutycycle $2
	intensity $87
	octave 6
	note F#, 3
	note A_, 3
	note G_, 1
	note F#, 1
	note E_, 2
	note G_, 0
	note F#, 1
	note D_, 1
	note E_, 1
	note C#, 1
	note D_, 1
	intensity $81
	octave 5
	note D_, 1
	note D_, 1
	note __, 1
	loopchannel 0, Music_Route1_branch_ec04a

Music_Route1_Ch2: ; ec0eb
	stereopanning $f0
	vibrato $12, $22
	dutycycle $2
	notetype $c, $92
	octave 4
	note F#, 0
	note G_, 0
	callchannel Music_Route1_branch_ec198
	octave 3
	note A_, 1
	note A_, 1
	octave 4
	note F#, 0
	note G_, 0
	callchannel Music_Route1_branch_ec1aa
	note C#, 1
	note E_, 1
	note D_, 1
	intensity $81
	note F#, 1
	note F#, 1
	intensity $82
	octave 4
	note D_, 0
	note E_, 0
	dutycycle $2

Music_Route1_branch_ec112: ; ec112
	intensity $82
	callchannel Music_Route1_branch_ec188
	intensity $81
	octave 3
	note A_, 1
	note A_, 1
	intensity $82
	octave 4
	note C#, 0
	note D_, 0
	note E_, 1
	note E_, 1
	note E_, 1
	note C#, 0
	note D_, 0
	note E_, 1
	note E_, 1
	note E_, 1
	note C#, 0
	note D_, 0
	note E_, 1
	note E_, 1
	note F#, 0
	note E_, 0
	note E_, 0
	note F#, 0
	note D_, 1
	note __, 1
	note F#, 1
	note D_, 0
	note E_, 0
	callchannel Music_Route1_branch_ec188
	intensity $81
	note A_, 1
	note A_, 1
	intensity $82
	note C#, 0
	note D_, 0
	note E_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	octave 4
	note B_, 3
	notetype $8, $92
	note C#, 0
	note D_, 0
	note C#, 0
	notetype $c, $92
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	note D_, 1
	intensity $81
	octave 5
	note D_, 1
	note D_, 1
	intensity $82
	octave 4
	note F#, 0
	note G_, 0
	callchannel Music_Route1_branch_ec198
	note __, 3
	note F#, 0
	note G_, 0
	callchannel Music_Route1_branch_ec1aa
	notetype $8, $92
	note C#, 0
	note D_, 0
	note C#, 0
	notetype $c, $92
	octave 4
	note B_, 0
	octave 5
	note C#, 0
	note D_, 1
	intensity $81
	note F#, 1
	note F#, 1
	intensity $82
	octave 4
	note D_, 0
	note E_, 0
	loopchannel 0, Music_Route1_branch_ec112
; ec188

Music_Route1_branch_ec188: ; ec188
	note F#, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note E_, 0
	note F#, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note E_, 0
	note F#, 1
	note F#, 1
	note G_, 2
	note F#, 0
	note E_, 1
	endchannel
; ec198

Music_Route1_branch_ec198: ; ec198
	note A_, 1
	note A_, 1
	note F#, 1
	note D_, 1
	octave 5
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note A_, 1
	note F#, 1
	note D_, 2
	note F#, 0
	note E_, 1
	endchannel
; ec1aa

Music_Route1_branch_ec1aa: ; ec1aa
	note A_, 1
	note A_, 1
	note F#, 1
	note D_, 1
	octave 5
	note D_, 1
	note C#, 1
	octave 4
	note B_, 2
	note G_, 0
	note A_, 1
	octave 5
	note D_, 1
	endchannel

Music_Route1_Ch3: ; ec1b8
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $25
	note __, 1
	octave 3
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note F#, 0
	note __, 2
	octave 3
	note D_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 4
	note G_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	note D_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 2
	octave 3
	note C#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note C#, 0
	note __, 0
	note C#, 0
	octave 3
	note A_, 0
	note D_, 0
	octave 2
	note A_, 0
	octave 3
	note D_, 0
	note F#, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	note F#, 0
	note A_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note B_, 0
	octave 4
	note G_, 0
	note D_, 0
	octave 3
	note B_, 0
	note G_, 0
	octave 2
	note A_, 0
	octave 3
	note C#, 0
	note E_, 0
	note G_, 0
	note E_, 0
	note A_, 0
	octave 4
	note C#, 0
	note G_, 0
	note F#, 1
	note A_, 0
	note __, 0
	note A_, 0
	note __, 2

Music_Route1_branch_ec20c: ; ec20c
	octave 3
	note D_, 0
	note __, 0
	octave 4
	note D_, 1
	octave 3
	note C#, 0
	note __, 0
	octave 4
	note C#, 1
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note B_, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	note D_, 0
	note __, 0
	octave 4
	note D_, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note B_, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	note C#, 0
	note __, 0
	octave 4
	note C#, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note B_, 1
	note C_, 0
	note __, 0
	octave 4
	note C_, 1
	octave 3
	note C#, 0
	note __, 0
	octave 4
	note C#, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note C#, 0
	octave 3
	note B_, 0
	note A_, 1
	note G_, 0
	note E_, 0
	octave 2
	note D_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 2
	note E_, 0
	note __, 0
	octave 3
	note E_, 1
	octave 2
	note F#, 0
	note __, 0
	octave 3
	note F#, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 1
	note E_, 1
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 4
	note E_, 1
	octave 3
	note C#, 0
	note __, 0
	octave 4
	note C#, 1
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note B_, 1
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note A_, 1
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note G_, 0
	note B_, 0
	octave 4
	note C#, 1
	note E_, 0
	note C#, 0
	octave 3
	note A_, 0
	note G_, 0
	note E_, 0
	note C#, 0
	note D_, 1
	octave 4
	note F#, 0
	note __, 0
	note F#, 0
	note __, 2
	octave 3
	note D_, 3
	note F#, 3
	note G_, 1
	note A_, 1
	note B_, 2
	note G_, 0
	note F#, 1
	note D_, 1
	octave 2
	note A_, 2
	octave 3
	note D_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note B_, 0
	note A_, 2
	note G_, 0
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note G_, 1
	note F#, 1
	note E_, 2
	note C#, 0
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note C#, 1
	note D_, 1
	octave 5
	note A_, 0
	note __, 0
	note A_, 0
	note __, 2
	loopchannel 0, Music_Route1_branch_ec20c
; ec2ca
