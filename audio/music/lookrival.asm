Music_LookRival: ; f4f79
	dbw $c0, Music_LookRival_Ch1
	dbw $01, Music_LookRival_Ch2
	dbw $02, Music_LookRival_Ch3
	dbw $03, Music_LookRival_Ch4
; f4f85


Music_LookRival_Ch1: ; f4f85
	tempo 112
	volume $77
	dutycycle $1
	tone $0001
	vibrato $12, $15
	stereopanning $f
	notetype $c, $b2
	octave 4
	note C_, 0
	octave 3
	note A#, 0
	note G#, 1
	note A#, 0
	note G#, 0
	note F#, 1
	note F_, 5
	intensity $b7
	note G#, 5
	intensity $b2
	note A#, 3
	note F_, 1
	note G#, 3
	intensity $a0
	note G#, 9
	intensity $a5
	note G#, 7
	intensity $a6
	note F#, 7

Music_AfterTheRivalFight_branch_f4fb1: ; f4fb1

Music_LookRival_branch_f4fb1: ; f4fb1
	intensity $b5
	note F_, 3
	note D#, 1
	note F_, 5
	note F_, 1
	note G_, 1
	note G#, 3
	note A#, 3
	note G#, 1
	note G_, 3
	intensity $a0
	note F_, 1
	intensity $a7
	note F_, 15
	intensity $66
	note __, 1
	note F_, 1
	note G_, 3
	intensity $b6
	note G#, 3
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	note G#, 1
	note A#, 5
	intensity $b4
	note A#, 1
	octave 4
	note C_, 1
	note C#, 1
	note C#, 1
	note D#, 1
	note D#, 1
	note C#, 1
	note C_, 5
	intensity $b7
	octave 3
	note A#, 11
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 9
	note B_, 3
	octave 4
	note C_, 5
	octave 3
	note A#, 5
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note A#, 5
	note G_, 9
	note A#, 5
	note G#, 5
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G#, 7
	note F_, 5
	note C_, 1

Music_LookRival_branch_f4ff7: ; f4ff7
	intensity $b2
	note F_, 5
	intensity $b7
	note G#, 3
	note F#, 1
	note F_, 1
	note D#, 1
	loopchannel 3, Music_LookRival_branch_f4ff7
	intensity $b2
	note F_, 1
	note G#, 3
	intensity $b7
	note G#, 5
	note F#, 3
	loopchannel 0, Music_LookRival_branch_f4fb1

Music_LookRival_Ch2: ; f5010
	dutycycle $3
	vibrato $8, $36
	stereopanning $f0
	notetype $c, $c2
	octave 4
	note F#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	note C_, 5
	intensity $c7
	note D#, 5
	intensity $c2
	note F_, 3
	note C_, 1
	note D#, 3
	intensity $b0
	note D#, 9
	intensity $b7
	note D#, 15

Music_LookRival_branch_f502e: ; f502e

Music_AfterTheRivalFight_branch_f502e: ; f502e
	intensity $c7
	note C_, 11
	intensity $c4
	note C_, 1
	note D_, 1
	note D#, 3
	note D_, 3
	note C_, 1
	note D_, 3
	intensity $b0
	note C_, 5
	intensity $b7
	note C_, 7
	intensity $b4
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	intensity $c6
	octave 4
	note C_, 5
	intensity $c7
	note D#, 7
	note F_, 11
	intensity $c4
	note F_, 1
	note G_, 1
	note G#, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note F_, 1
	intensity $c4
	note G_, 5
	intensity $b0
	note F_, 15
	intensity $b7
	note F_, 15
	intensity $b0
	note G_, 11
	note F_, 3
	note E_, 15
	note F_, 11
	note D#, 3
	intensity $c7
	note D_, 7
	intensity $c4
	note C_, 1
	note D_, 1
	note D#, 0
	note D_, 0
	note D#, 1

Music_LookRival_branch_f5070: ; f5070
	intensity $c2
	note C_, 5
	intensity $c7
	note D#, 5
	intensity $c2
	note F_, 3
	loopchannel 3, Music_LookRival_branch_f5070
	note C_, 1
	note D#, 3
	intensity $c7
	note D#, 9
	loopchannel 0, Music_LookRival_branch_f502e

Music_LookRival_Ch3: ; f5086
	notetype $c, $28
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1
	note F_, 3
	note G#, 1
	note D#, 3
	note C_, 1
	note D_, 1
	note D#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 9
	note D#, 9
	note C_, 1
	note D#, 1
	note F#, 1

Music_LookRival_branch_f509d: ; f509d

Music_AfterTheRivalFight_branch_f509d: ; f509d
	callchannel Music_LookRival_branch_f50ef
	loopchannel 3, Music_LookRival_branch_f509d
	note F_, 3
	note C_, 1
	note D#, 3
	note G#, 1
	note G_, 1
	note F#, 1
	callchannel Music_LookRival_branch_f50f7
	note A#, 1
	note F_, 1
	note G_, 1
	note G#, 3
	note F_, 1
	note G_, 1
	note G#, 0
	note A_, 0
	callchannel Music_LookRival_branch_f50ff
	note A#, 1
	note F_, 1
	note G_, 1
	note G#, 3
	note F_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 3
	octave 3
	note G_, 1
	note A#, 3
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 3
	octave 3
	note G_, 1
	note A#, 3
	note G_, 1
	note A_, 1
	note A#, 0
	note A_, 0
	callchannel Music_LookRival_branch_f50f7
	callchannel Music_LookRival_branch_f50ff
	callchannel Music_LookRival_branch_f50ef
	callchannel Music_LookRival_branch_f50ef
	note F_, 1
	note C_, 1
	note D_, 1
	note D#, 3
	note C_, 1
	note D_, 1
	note D#, 0
	note E_, 0
	note F_, 1
	note C_, 1
	note D_, 1
	note D#, 3
	note C_, 1
	note F#, 1
	note E_, 1
	loopchannel 0, Music_LookRival_branch_f509d
; f50ef

Music_LookRival_branch_f50ef: ; f50ef
	note F_, 1
	note C_, 1
	note D_, 1
	note D#, 3
	note C_, 1
	note D_, 1
	note D#, 1
	endchannel
; f50f7

Music_LookRival_branch_f50f7: ; f50f7
	note A#, 1
	note F_, 1
	note G_, 1
	note G#, 3
	note F_, 1
	note G_, 1
	note G#, 1
	endchannel
; f50ff

Music_LookRival_branch_f50ff: ; f50ff
	note A#, 3
	note F_, 1
	note G#, 3
	note F_, 1
	note G_, 1
	note G#, 1
	endchannel

Music_LookRival_Ch4: ; f5106
	stereopanning $f0
	togglenoise $3
	notetype $c
	note __, 7
	note __, 15
	note D#, 1
	note D_, 3
	note D_, 5
	note D_, 3
	note D#, 3
	note D#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1

Music_AfterTheRivalFight_branch_f5118: ; f5118

Music_LookRival_branch_f5118: ; f5118
	note D#, 3
	note D_, 1
	note D#, 3
	note D#, 1
	note D_, 3
	note D#, 3
	note D_, 1
	note D#, 3
	note D#, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_LookRival_branch_f5118
; f5127
