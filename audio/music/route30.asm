Music_Route30: ; efc01
	dbw $c0, Music_Route30_Ch1
	dbw $01, Music_Route30_Ch2
	dbw $02, Music_Route30_Ch3
	dbw $03, Music_Route30_Ch4
; efc0d

Music_Route30_Ch1: ; efc0d
	tempo 144
	volume $7, $7
	waveduty $3
	pitchoffset $0001
	vibrato $10, $1, $5
	stereopanning $f0
	notetype $c, $b, $0, $2
	octave 3
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	volenvelope $4, $1, $6
	note C_, 4
Music_Route30_branch_efc2e: ; efc2e
	volenvelope $b, $0, $6
	note D_, 6
	volenvelope $b, $0, $4
	octave 2
	note B_, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	volenvelope $b, $0, $6
	note F_, 6
	volenvelope $b, $0, $4
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	volenvelope $b, $0, $7
	octave 3
	note B_, 12
	volenvelope $b, $0, $5
	note F_, 6
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	volenvelope $b, $0, $6
	note D_, 4
	note G_, 4
	note D_, 4
	volenvelope $b, $0, $3
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	volenvelope $b, $0, $6
	octave 2
	note B_, 4
	octave 3
	note D_, 4
	octave 2
	note B_, 4
	volenvelope $b, $0, $4
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	volenvelope $b, $0, $6
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	note E_, 4
	note D_, 2
	octave 3
	note G_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	volenvelope $b, $0, $7
	note D_, 14
	volenvelope $b, $0, $6
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	note B_, 2
	octave 4
	note C_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	volenvelope $b, $0, $5
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 4
	octave 3
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	loopchannel 0, Music_Route30_branch_efc2e
; efcda

Music_Route30_Ch2: ; efcda
	waveduty $3
	vibrato $12, $3, $6
	stereopanning $f
	notetype $c, $c, $0, $2
	octave 3
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 2
	note G_, 2
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 2
	note G_, 2
	volenvelope $c, $0, $4
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
Music_Route30_branch_efcf6: ; efcf6
	volenvelope $c, $0, $7
	note G_, 10
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note F_, 10
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	volenvelope $b, $0, $0
	note D_, 4
	volenvelope $b, $0, $7
	note D_, 8
	volenvelope $3, $1, $7
	note D_, 8
	volenvelope $b, $0, $7
	note D_, 8
	volenvelope $c, $0, $7
	note C_, 10
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note F_, 10
	note E_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 6
	note G_, 2
	octave 4
	note D_, 8
	octave 3
	note G_, 6
	note D_, 2
	note B_, 8
	note C_, 2
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	note D_, 2
	note F_, 8
	note A_, 8
	note G_, 2
	volenvelope $b, $0, $0
	note D_, 4
	volenvelope $b, $0, $7
	note D_, 10
	volenvelope $c, $0, $7
	note C_, 4
	octave 3
	note B_, 4
	note A_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	note D_, 4
	note F_, 8
	octave 5
	note C_, 8
	octave 4
	note B_, 2
	volenvelope $b, $0, $0
	note G_, 6
	volenvelope $b, $0, $7
	note G_, 8
	volenvelope $c, $0, $7
	note B_, 2
	volenvelope $b, $0, $0
	note G_, 4
	volenvelope $b, $0, $7
	note G_, 8
	volenvelope $a, $0, $7
	octave 3
	note F#, 2
	loopchannel 0, Music_Route30_branch_efcf6
; efd5f

Music_Route30_Ch3: ; efd5f
	notetype $c, $2, $0, $7
	octave 2
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
Music_Route30_branch_efd79: ; efd79
	note G_, 1
	note __, 1
	note B_, 2
	note __, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note D_, 2
	note A_, 2
	octave 2
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 2
	octave 3
	note D_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note A_, 2
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 3
	note C_, 2
	note F_, 2
	octave 2
	note F_, 1
	note F_, 1
	note F_, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note F_, 2
	note F#, 2
	note G_, 1
	note __, 1
	note B_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note B_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	note G#, 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 2
	note E_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	note A_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 2
	note A_, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note B_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A_, 1
	note A_, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 2
	note E_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	note A_, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 2
	note D_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	loopchannel 0, Music_Route30_branch_efd79
; efe7a

Music_Route30_Ch4: ; efe7a
	drumkittoggle $3
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
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 4
	endchannel
; efec1

Music_Route30_branch_efec1: ; efec1
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	endchannel
; efecd

Music_Route30_branch_efecd: ; efecd
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	endchannel
; efed7

Music_Route30_branch_efed7: ; efed7
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note F#, 2
	note D_, 2
	note D_, 2
	endchannel
; efee1

Music_Route30_branch_efee1: ; efee1
	note D_, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	notetype $6
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c
	endchannel
; efef5

