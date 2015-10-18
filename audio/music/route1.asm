Music_Route1: ; ec000
	dbw $80, Music_Route1_Ch1
	dbw $01, Music_Route1_Ch2
	dbw $02, Music_Route1_Ch3
; ec009


INCBIN "baserom.gbc", $ec009, $ec00a - $ec009


Music_Route1_Ch1: ; ec00a
	stereopanning $f
	tempo 184
	volume $7, $7
	vibrato $16, $1, $1
	setwaveduty $3
	notetype $c, $8, $0, $3
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note G_, 1
	note A_, 1
	note G_, 2
	note E_, 2
	note G_, 1
	note E_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 3
	note E_, 1
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	volenvelope $8, $0, $1
	octave 5
	note D_, 2
	note D_, 2
	volenvelope $8, $0, $3
	note __, 2
Music_Route1_branch_ec04a: ; ec04a
	volenvelope $8, $0, $3
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note __, 4
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note __, 2
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 3
	octave 4
	note D_, 1
	octave 3
	note E_, 2
	volenvelope $8, $0, $1
	note G_, 2
	note G_, 2
	volenvelope $8, $0, $3
	note __, 2
	note __, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note __, 4
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	note __, 2
	note __, 2
	octave 4
	note C#, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	note __, 2
	note __, 2
	octave 3
	note F#, 1
	note G_, 1
	note A_, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	volenvelope $8, $0, $1
	octave 4
	note G_, 2
	note G_, 2
	volenvelope $8, $0, $3
	octave 3
	note F#, 1
	note E_, 1
	note __, 2
	note E_, 1
	note F#, 1
	note G_, 6
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	note E_, 1
	note F#, 1
	note G_, 4
	notetype $8, $8, $0, $3
	note A_, 1
	note B_, 1
	note A_, 1
	notetype $c, $8, $0, $3
	note G_, 1
	note E_, 1
	note F#, 2
	volenvelope $8, $0, $1
	octave 4
	note A_, 2
	note A_, 2
	volenvelope $8, $0, $3
	octave 3
	note A_, 1
	note G_, 1
	volenvelope $7, $0, $7
	volenvelope $1, $1, $5
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 4
	note A_, 3
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note G_, 1
	setwaveduty $2
	volenvelope $8, $0, $7
	octave 6
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	volenvelope $8, $0, $1
	octave 5
	note D_, 2
	note D_, 2
	note __, 2
	loopchannel 0, Music_Route1_branch_ec04a
; ec0eb

Music_Route1_Ch2: ; ec0eb
	stereopanning $f0
	vibrato $12, $2, $2
	setwaveduty $2
	notetype $c, $9, $0, $2
	octave 4
	note F#, 1
	note G_, 1
	callchannel Music_Route1_branch_ec198
	octave 3
	note A_, 2
	note A_, 2
	octave 4
	note F#, 1
	note G_, 1
	callchannel Music_Route1_branch_ec1aa
	note C#, 2
	note E_, 2
	note D_, 2
	volenvelope $8, $0, $1
	note F#, 2
	note F#, 2
	volenvelope $8, $0, $2
	octave 4
	note D_, 1
	note E_, 1
	setwaveduty $2
Music_Route1_branch_ec112: ; ec112
	volenvelope $8, $0, $2
	callchannel Music_Route1_branch_ec188
	volenvelope $8, $0, $1
	octave 3
	note A_, 2
	note A_, 2
	volenvelope $8, $0, $2
	octave 4
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note E_, 1
	note F#, 1
	note D_, 2
	note __, 2
	note F#, 2
	note D_, 1
	note E_, 1
	callchannel Music_Route1_branch_ec188
	volenvelope $8, $0, $1
	note A_, 2
	note A_, 2
	volenvelope $8, $0, $2
	note C#, 1
	note D_, 1
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note B_, 4
	notetype $8, $9, $0, $2
	note C#, 1
	note D_, 1
	note C#, 1
	notetype $c, $9, $0, $2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	volenvelope $8, $0, $1
	octave 5
	note D_, 2
	note D_, 2
	volenvelope $8, $0, $2
	octave 4
	note F#, 1
	note G_, 1
	callchannel Music_Route1_branch_ec198
	note __, 4
	note F#, 1
	note G_, 1
	callchannel Music_Route1_branch_ec1aa
	notetype $8, $9, $0, $2
	note C#, 1
	note D_, 1
	note C#, 1
	notetype $c, $9, $0, $2
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D_, 2
	volenvelope $8, $0, $1
	note F#, 2
	note F#, 2
	volenvelope $8, $0, $2
	octave 4
	note D_, 1
	note E_, 1
	loopchannel 0, Music_Route1_branch_ec112
; ec188

Music_Route1_branch_ec188: ; ec188
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note G_, 3
	note F#, 1
	note E_, 2
	endchannel
; ec198

Music_Route1_branch_ec198: ; ec198
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 3
	note F#, 1
	note E_, 2
	endchannel
; ec1aa

Music_Route1_branch_ec1aa: ; ec1aa
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 3
	note G_, 1
	note A_, 2
	octave 5
	note D_, 2
	endchannel
; ec1b8

Music_Route1_Ch3: ; ec1b8
	stereopanning $ff
	vibrato $10, $2, $3
	notetype $c, $2, $0, $5
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 3
	octave 3
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 3
	octave 3
	note C#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	octave 3
	note A_, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	note G_, 1
	note F#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
Music_Route1_branch_ec20c: ; ec20c
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	note D_, 1
	note __, 1
	octave 4
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 2
	note G_, 1
	note E_, 1
	octave 2
	note D_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note E_, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	note E_, 2
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 4
	note E_, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note C#, 2
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note D_, 2
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	octave 3
	note D_, 4
	note F#, 4
	note G_, 2
	note A_, 2
	note B_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 3
	octave 3
	note D_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note C#, 1
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 3
	loopchannel 0, Music_Route1_branch_ec20c
; ec2ca


