Music_Route30: ; efc01
	dbw $c0, Music_Route30_Ch1
	dbw $01, Music_Route30_Ch2
	dbw $02, Music_Route30_Ch3
	dbw $03, Music_Route30_Ch4
; efc0d


Music_Route30_Ch1: ; efc0d
	tempo 144
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	octave 3
	note D_, 5
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 5
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	intensity $4e
	note C_, 3

Music_Route30_branch_efc2e: ; efc2e
	intensity $b6
	note D_, 5
	intensity $b4
	octave 2
	note B_, 1
	octave 3
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	intensity $b6
	note F_, 5
	intensity $b4
	note C_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note B_, 0
	octave 4
	note C_, 0
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	intensity $b7
	octave 3
	note B_, 11
	intensity $b5
	note F_, 5
	note C_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note C_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note D_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	intensity $b6
	note D_, 3
	note G_, 3
	note D_, 3
	intensity $b3
	octave 2
	note B_, 0
	octave 3
	note C_, 0
	octave 2
	note B_, 0
	octave 3
	note C_, 0
	intensity $b6
	octave 2
	note B_, 3
	octave 3
	note D_, 3
	octave 2
	note B_, 3
	intensity $b4
	octave 3
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	intensity $b6
	note A_, 3
	note B_, 3
	octave 4
	note C_, 3
	note E_, 3
	note D_, 1
	octave 3
	note G_, 3
	note A_, 3
	note B_, 3
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	intensity $b7
	note D_, 13
	intensity $b6
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	intensity $b5
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 3
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	loopchannel 0, Music_Route30_branch_efc2e

Music_Route30_Ch2: ; efcda
	dutycycle $3
	vibrato $12, $36
	stereopanning $f
	notetype $c, $c2
	octave 3
	note G_, 5
	note G_, 0
	note G_, 0
	note G_, 1
	note G_, 1
	note G_, 3
	note G_, 5
	note G_, 0
	note G_, 0
	note G_, 1
	note G_, 1
	intensity $c4
	note D_, 0
	note E_, 0
	note F_, 0
	note F#, 0

Music_Route30_branch_efcf6: ; efcf6
	intensity $c7
	note G_, 9
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note F_, 9
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	intensity $b0
	note D_, 3
	intensity $b7
	note D_, 7
	intensity $3f
	note D_, 7
	intensity $b7
	note D_, 7
	intensity $c7
	note C_, 9
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	octave 4
	note F_, 9
	note E_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 5
	note G_, 1
	octave 4
	note D_, 7
	octave 3
	note G_, 5
	note D_, 1
	note B_, 7
	note C_, 1
	note A_, 3
	note B_, 3
	octave 4
	note C_, 3
	note D_, 1
	note F_, 7
	note A_, 7
	note G_, 1
	intensity $b0
	note D_, 3
	intensity $b7
	note D_, 9
	intensity $c7
	note C_, 3
	octave 3
	note B_, 3
	note A_, 3
	note G_, 3
	note A_, 3
	note B_, 3
	octave 4
	note C_, 3
	note D_, 3
	note F_, 7
	octave 5
	note C_, 7
	octave 4
	note B_, 1
	intensity $b0
	note G_, 5
	intensity $b7
	note G_, 7
	intensity $c7
	note B_, 1
	intensity $b0
	note G_, 3
	intensity $b7
	note G_, 7
	intensity $a7
	octave 3
	note F#, 1
	loopchannel 0, Music_Route30_branch_efcf6

Music_Route30_Ch3: ; efd5f
	notetype $c, $27
	octave 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 2
	note G_, 0
	note __, 4
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0

Music_Route30_branch_efd79: ; efd79
	note G_, 0
	note __, 0
	note B_, 1
	note __, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note D_, 1
	note A_, 1
	octave 2
	note F_, 0
	note F_, 0
	note F_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note F_, 0
	note __, 0
	note F#, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note A_, 1
	note F_, 0
	note F_, 0
	note F_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 3
	note C_, 1
	note F_, 1
	octave 2
	note F_, 0
	note F_, 0
	note F_, 0
	note __, 0
	octave 3
	note E_, 1
	octave 2
	note F_, 1
	note F#, 1
	note G_, 0
	note __, 0
	note B_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note B_, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	note G#, 1
	note A_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 2
	note A_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note F_, 1
	note E_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note __, 0
	note A_, 1
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note B_, 0
	note B_, 0
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 0
	note B_, 1
	note A_, 1
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note B_, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 2
	note A_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note F_, 1
	note E_, 1
	note C_, 0
	note C_, 0
	note C_, 0
	note __, 0
	note A_, 1
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	octave 3
	note C_, 1
	note D_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note G_, 0
	note G_, 0
	note G_, 0
	note __, 0
	octave 3
	note D_, 1
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	loopchannel 0, Music_Route30_branch_efd79

Music_Route30_Ch4: ; efe7a
	togglenoise $3
	notetype $c
	callchannel Music_Route30_branch_efeb8
	callchannel Music_Route30_branch_efec1

Music_Route30_branch_efe84: ; efe84
	callchannel Music_Route30_branch_efecd
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efee1
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efecd
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efee1
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efecd
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efed7
	callchannel Music_Route30_branch_efecd
	callchannel Music_Route30_branch_efee1
	loopchannel 0, Music_Route30_branch_efe84
; efeb8

Music_Route30_branch_efeb8: ; efeb8
	note D_, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 3
	endchannel
; efec1

Music_Route30_branch_efec1: ; efec1
	note D_, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	endchannel
; efecd

Music_Route30_branch_efecd: ; efecd
	note D_, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
; efed7

Music_Route30_branch_efed7: ; efed7
	note D_, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note F#, 1
	note D_, 1
	note D_, 1
	endchannel
; efee1

Music_Route30_branch_efee1: ; efee1
	note D_, 1
	note F#, 1
	note F#, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	notetype $6
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	note D_, 0
	notetype $c
	endchannel
; efef5
