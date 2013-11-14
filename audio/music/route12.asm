Music_Route12: ; ec506
	dbw $c0, Music_Route12_Ch1
	dbw $01, Music_Route12_Ch2
	dbw $02, Music_Route12_Ch3
	dbw $03, Music_Route12_Ch4
; ec512


Music_Route12_Ch1: ; ec512
	tempo 148
	volume $77
	vibrato $12, $34
	tone $0001
	stereopanning $f
	dutycycle $3
	notetype $c, $98
	octave 3
	note G#, 0
	note __, 1
	note A_, 0
	note G#, 7
	octave 2
	note B_, 0
	octave 3
	note E_, 0
	note F#, 0
	note G#, 0
	note F#, 0
	note __, 1
	note E_, 0
	intensity $97
	note D#, 11

Music_Route12_branch_ec535: ; ec535
	dutycycle $2
	intensity $96
	callchannel Music_Route12_branch_ec5b1
	callchannel Music_Route12_branch_ec5bf
	callchannel Music_Route12_branch_ec5b1
	note E_, 0
	note __, 1
	note F#, 0
	note E_, 3
	note B_, 3
	octave 4
	note D#, 3
	callchannel Music_Route12_branch_ec5b1
	callchannel Music_Route12_branch_ec5bf
	callchannel Music_Route12_branch_ec5b1
	intensity $92
	octave 4
	note E_, 0
	octave 3
	note B_, 0
	note G#, 0
	note E_, 0
	octave 4
	note D#, 0
	octave 3
	note B_, 0
	note G#, 0
	note D#, 0
	octave 4
	note D_, 0
	octave 3
	note B_, 0
	note G#, 0
	note D_, 0
	note C#, 0
	note F_, 0
	note G#, 0
	note B_, 0
	dutycycle $3
	intensity $7f
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 0
	note __, 0
	note A_, 3
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 0
	octave 3
	note B_, 0
	note A_, 3
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 2
	note A_, 2
	note G#, 0
	note __, 0
	note G#, 3
	note B_, 1
	note A_, 1
	note B_, 0
	note A_, 0
	note G#, 3
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note E_, 1
	note D#, 2
	note F#, 2
	note D#, 1
	note E_, 7
	note F#, 7
	note D#, 3
	note F#, 3

Music_Route12_branch_ec59b: ; ec59b
	intensity $97
	note G#, 0
	note A_, 0
	note B_, 3
	octave 2
	note B_, 0
	octave 3
	note D#, 0
	note E_, 0
	note __, 0
	note E_, 0
	note F#, 0
	note G#, 3
	loopchannel 2, Music_Route12_branch_ec59b
	loopchannel 0, Music_Route12_branch_ec535
; ec5b1

Music_Route12_branch_ec5b1: ; ec5b1
	octave 3
	note G#, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	note B_, 0
	octave 3
	note D#, 0
	note E_, 3
	note G#, 3
	endchannel
; ec5bf

Music_Route12_branch_ec5bf: ; ec5bf
	note A_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	note F#, 0
	note G#, 0
	note A_, 3
	note F#, 3
	endchannel

Music_Route12_Ch2: ; ec5ca
	dutycycle $3
	vibrato $12, $34
	notetype $c, $b8
	octave 4
	note E_, 0
	note __, 1
	note F#, 0
	note E_, 11
	octave 3
	note B_, 0
	note __, 1
	octave 4
	note C_, 0
	intensity $b7
	octave 3
	note B_, 7
	note D#, 0
	note F#, 0
	note B_, 0
	octave 4
	note D#, 0

Music_Route12_branch_ec5e5: ; ec5e5
	dutycycle $3
	intensity $b7
	callchannel Music_Route12_branch_ec647
	note F#, 0
	note A_, 0
	note G#, 0
	note F#, 0
	note G#, 1
	note __, 0
	note E_, 0
	octave 3
	note B_, 11
	dutycycle $2
	octave 2
	note B_, 0
	note __, 1
	octave 3
	note C_, 0
	octave 2
	note B_, 3
	octave 3
	note D#, 3
	note F#, 3
	dutycycle $3
	callchannel Music_Route12_branch_ec647
	note A_, 0
	octave 5
	note C#, 0
	octave 4
	note B_, 0
	note A_, 0
	note B_, 1
	note __, 0
	note A_, 0
	intensity $b8
	note G#, 5
	intensity $b7
	note G#, 5
	intensity $6f
	note G#, 15
	dutycycle $2
	intensity $a8
	note A_, 2
	note G#, 2
	note F#, 0
	note __, 0
	note F#, 7
	intensity $a7
	note F#, 9
	note __, 1
	note F#, 3
	intensity $a8
	note G#, 2
	note F#, 2
	note E_, 0
	note __, 0
	note E_, 7
	intensity $a7
	note E_, 9
	note __, 1
	note E_, 3
	note F#, 2
	note D#, 2
	octave 3
	note B_, 1
	intensity $a8
	octave 4
	note B_, 7
	note B_, 7
	note A_, 7
	note G#, 0
	note F#, 0
	note E_, 13
	note E_, 9
	intensity $a4
	note E_, 5
	loopchannel 0, Music_Route12_branch_ec5e5
; ec647

Music_Route12_branch_ec647: ; ec647
	octave 4
	note E_, 5
	intensity $b1
	octave 3
	note B_, 0
	note B_, 0
	intensity $b7
	note B_, 3
	octave 4
	note B_, 3
	note A_, 3
	note G#, 3
	note F#, 3
	endchannel

Music_Route12_Ch3: ; ec657
	vibrato $12, $54
	notetype $c, $16
	octave 3
	note G#, 1
	note __, 3
	note G#, 0
	note A_, 0
	note B_, 1
	note __, 1
	note E_, 3
	note D#, 1
	note __, 3
	note D#, 0
	note E_, 0
	note F#, 1
	note __, 1
	note D#, 3

Music_Route12_branch_ec66c: ; ec66c
	callchannel Music_Route12_branch_ec6b4
	note F#, 0
	note __, 0
	note E_, 0
	note __, 2
	note D#, 0
	note E_, 0
	note F#, 3
	octave 2
	note B_, 3
	callchannel Music_Route12_branch_ec6b4
	note E_, 0
	note __, 0
	note B_, 0
	note __, 2
	octave 2
	note B_, 0
	octave 3
	note C#, 0
	note D_, 3
	note F_, 3
	note F#, 12
	note __, 0
	note F#, 0
	note G#, 0
	note A_, 4
	note __, 0
	note A_, 0
	note B_, 0
	octave 4
	note C_, 3
	octave 3
	note F#, 3
	note E_, 13
	note G#, 0
	note A_, 0
	note B_, 5
	note E_, 0
	note F#, 0
	note G_, 3
	note E_, 3
	octave 2
	note B_, 4
	note __, 0
	note B_, 0
	octave 3
	note D#, 0
	note F#, 7
	note E_, 7
	note F#, 3
	note D#, 3

Music_Route12_branch_ec6a3: ; ec6a3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 0
	note F#, 0
	note G#, 3
	note E_, 2
	note __, 0
	loopchannel 2, Music_Route12_branch_ec6a3
	loopchannel 0, Music_Route12_branch_ec66c
; ec6b4

Music_Route12_branch_ec6b4: ; ec6b4
	octave 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 0
	note F#, 0
	note G#, 3
	note E_, 3
	note D_, 0
	note __, 0
	note D_, 0
	note __, 2
	note D_, 0
	note E_, 0
	note F#, 3
	note D_, 3
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 0
	note F#, 0
	note G#, 3
	note E_, 3
	endchannel

Music_Route12_Ch4: ; ec6ce
	togglenoise $4
	stereopanning $f0
	notetype $c
	note B_, 9
	note C#, 0
	note C#, 0
	note D_, 3
	note B_, 5
	note C#, 0
	note C#, 0
	note D_, 3
	notetype $6
	callchannel Music_Route12_branch_ec717

Music_Route12_branch_ec6e1: ; ec6e1
	note D_, 3
	note D_, 7
	note C#, 1
	note C#, 1
	note D_, 7
	callchannel Music_Route12_branch_ec717
	loopchannel 8, Music_Route12_branch_ec6e1

Music_Route12_branch_ec6ed: ; ec6ed
	notetype $c
	note B_, 9
	note D_, 0
	note D_, 0
	note D_, 5
	note C#, 0
	note C#, 0
	note D_, 5
	note C#, 0
	note C#, 0
	note D_, 3
	loopchannel 2, Music_Route12_branch_ec6ed
	note B_, 15
	notetype $6
	callchannel Music_Route12_branch_ec717
	callchannel Music_Route12_branch_ec717
	note B_, 15

Music_Route12_branch_ec707: ; ec707
	note D_, 3
	note D_, 7
	note C#, 1
	note C#, 1
	note D_, 7
	callchannel Music_Route12_branch_ec717
	loopchannel 2, Music_Route12_branch_ec707
	loopchannel 0, Music_Route12_branch_ec6e1
; ec717

Music_Route12_branch_ec717: ; ec717
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	endchannel
; ec720
