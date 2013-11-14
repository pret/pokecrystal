Music_NationalPark: ; f54e8
	dbw $c0, Music_NationalPark_Ch1
	dbw $01, Music_NationalPark_Ch2
	dbw $02, Music_NationalPark_Ch3
	dbw $03, Music_NationalPark_Ch4
; f54f4


Music_NationalPark_Ch1: ; f54f4
	tempo 192
	volume $77
	stereopanning $f
	vibrato $18, $24
	dutycycle $1
	notetype $c, $77
	note __, 1

Music_NationalPark_branch_f5504: ; f5504
	callchannel Music_NationalPark_branch_f554a
	callchannel Music_NationalPark_branch_f554a
	notetype $6, $67
	callchannel Music_NationalPark_branch_f563a
	notetype $c, $77
	note __, 15
	octave 2
	note A#, 0
	octave 3
	note D_, 0
	note F_, 0
	note G#, 0
	note D_, 0
	note F_, 0
	note A#, 0
	notetype $6, $67
	octave 4
	note D_, 0
	note C#, 0
	note D_, 0
	note __, 0
	note D_, 0
	note __, 0
	note C#, 0
	note __, 0
	note D_, 0
	note __, 2
	note D_, 0
	note __, 2
	note D_, 0
	note __, 0
	callchannel Music_NationalPark_branch_f563a
	intensity $77
	octave 3
	note E_, 0
	note F_, 4
	note D#, 3
	note __, 1
	note C_, 11
	note F_, 7
	note C#, 0
	intensity $98
	note D_, 15
	intensity $77
	note D_, 6
	notetype $c, $77
	note __, 3
	loopchannel 0, Music_NationalPark_branch_f5504
; f554a

Music_NationalPark_branch_f554a: ; f554a
	octave 2
	note G#, 5
	octave 3
	note F_, 1
	intensity $47
	note F_, 0
	note G#, 0
	intensity $57
	note F_, 0
	note G#, 0
	intensity $77
	note F_, 0
	note G#, 0
	intensity $97
	note F_, 0
	note G#, 0
	intensity $77
	octave 2
	note A_, 5
	octave 3
	note F#, 1
	intensity $47
	note F#, 0
	note A_, 0
	intensity $57
	note F#, 0
	note A_, 0
	intensity $77
	note F#, 0
	note A_, 0
	intensity $97
	note F#, 0
	note A_, 0
	intensity $77
	octave 2
	note G#, 5
	octave 3
	note F_, 1
	intensity $47
	octave 4
	note C_, 0
	note C#, 0
	intensity $57
	note C_, 0
	note C#, 0
	intensity $77
	note C_, 0
	note C#, 0
	intensity $97
	note C_, 0
	note C#, 0
	intensity $77
	octave 2
	note A_, 5
	octave 3
	note C#, 1
	intensity $47
	octave 4
	note C#, 0
	note D#, 0
	intensity $57
	note C#, 0
	note D#, 0
	intensity $77
	note C#, 0
	note D#, 0
	intensity $97
	note C#, 0
	note D#, 0
	intensity $77
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	intensity $47
	octave 4
	note C#, 0
	note D#, 0
	intensity $57
	note C#, 0
	note D#, 0
	intensity $77
	note C#, 0
	note D#, 0
	intensity $97
	note C#, 0
	note D#, 0
	intensity $77
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	intensity $57
	octave 4
	note F_, 0
	note D#, 0
	intensity $67
	note D_, 0
	note D#, 0
	intensity $77
	note F_, 0
	note F#, 0
	intensity $97
	note G#, 0
	note A#, 0
	intensity $77
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	intensity $47
	octave 4
	note C#, 0
	note D#, 0
	intensity $57
	note C#, 0
	note D#, 0
	intensity $77
	note C#, 0
	note D#, 0
	intensity $97
	note C#, 0
	note D#, 0
	intensity $77
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note D#, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	octave 4
	note D_, 1
	octave 3
	note A#, 1
	endchannel
; f563a

Music_NationalPark_branch_f563a: ; f563a
	note __, 15
	note __, 2
	octave 4
	note A#, 0
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	note A#, 1
	note __, 3
	note __, 15
	note __, 2
	note A_, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 1
	note __, 3
	endchannel

Music_NationalPark_Ch2: ; f5652
	vibrato $14, $24
	dutycycle $1
	notetype $c, $a7
	note __, 1
	stereopanning $f0

Music_NationalPark_branch_f565d: ; f565d
	notetype $c, $a7
	callchannel Music_NationalPark_branch_f56b8
	octave 3
	note D_, 7
	callchannel Music_NationalPark_branch_f56b8
	note __, 1
	intensity $a7
	octave 4
	note G#, 1
	note F#, 1
	note F_, 1
	notetype $6, $a7
	callchannel Music_NationalPark_branch_f56f5
	octave 3
	note B_, 0
	octave 4
	note C_, 4
	octave 3
	note G#, 3
	note __, 1
	octave 4
	note A#, 7
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 3
	note E_, 0
	note F_, 13
	intensity $87
	note G_, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G_, 0
	note __, 0
	note G#, 0
	note __, 2
	note G#, 0
	note __, 2
	note G#, 0
	note __, 0
	intensity $a7
	callchannel Music_NationalPark_branch_f56f5
	octave 3
	note B_, 0
	octave 4
	note C_, 4
	octave 3
	note G#, 3
	note __, 1
	note A#, 11
	octave 4
	note C_, 7
	octave 3
	note A_, 0
	vibrato $0, $0
	intensity $b8
	note A#, 15
	vibrato $14, $24
	intensity $b7
	note A#, 10
	octave 2
	note D#, 1
	note D_, 1
	loopchannel 0, Music_NationalPark_branch_f565d
; f56b8

Music_NationalPark_branch_f56b8: ; f56b8
	octave 2
	note C#, 5
	note G#, 1
	octave 3
	note C#, 7
	octave 2
	note C#, 5
	note A_, 1
	octave 3
	note C#, 7
	octave 2
	note C#, 5
	note G#, 1
	octave 3
	note C#, 7
	octave 2
	note C#, 5
	note A_, 1
	octave 3
	note F#, 7
	octave 1
	note F#, 5
	octave 2
	note C#, 1
	note A#, 7
	octave 1
	note F#, 5
	octave 2
	note C#, 1
	note A_, 7
	octave 1
	note F_, 5
	octave 2
	note C_, 1
	note G#, 7
	octave 1
	note A#, 5
	octave 2
	note F_, 1
	octave 3
	note D_, 7
	octave 1
	note F#, 5
	octave 2
	note C#, 1
	note A#, 7
	octave 1
	note F#, 5
	octave 2
	note C#, 1
	note A_, 7
	octave 1
	note F_, 5
	octave 2
	note C_, 1
	note G#, 7
	octave 1
	note A#, 5
	octave 2
	note F_, 1
	endchannel
; f56f5

Music_NationalPark_branch_f56f5: ; f56f5
	octave 4
	note E_, 0
	note F_, 4
	note F#, 3
	note __, 1
	note C#, 6
	intensity $87
	octave 5
	note E_, 0
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F_, 1
	intensity $a7
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	octave 4
	note E_, 0
	note F_, 4
	note F#, 3
	note __, 1
	note D#, 6
	intensity $87
	octave 5
	note D_, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note D#, 1
	intensity $a7
	octave 4
	note D_, 1
	note C#, 1
	endchannel

Music_NationalPark_Ch3: ; f5723
	vibrato $16, $24
	notetype $c, $11
	octave 4
	note G#, 0
	note A#, 0
	stereopanning $ff

Music_NationalPark_branch_f572e: ; f572e
	callchannel Music_NationalPark_branch_f5756
	octave 5
	note A#, 13
	octave 4
	note G#, 0
	note A#, 0
	callchannel Music_NationalPark_branch_f5756
	octave 5
	note A#, 7
	octave 4
	note D_, 7
	intensity $15
	callchannel Music_NationalPark_branch_f578f
	octave 4
	note D_, 0
	octave 3
	note F_, 2
	callchannel Music_NationalPark_branch_f578f
	octave 4
	note D_, 0
	octave 3
	note F_, 0
	intensity $11
	octave 4
	note G#, 0
	note A#, 0
	loopchannel 0, Music_NationalPark_branch_f572e
; f5756

Music_NationalPark_branch_f5756: ; f5756
	octave 5
	note C_, 15
	note C#, 13
	note G#, 0
	note A#, 0
	octave 6
	note C_, 15
	note C#, 9
	note C_, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 5
	note A#, 9
	octave 6
	note F_, 1
	note D#, 1
	note C#, 1
	octave 5
	note A_, 8
	octave 6
	note D_, 0
	octave 6
	note D#, 1
	note C#, 1
	note C_, 1
	octave 5
	note G#, 3
	octave 6
	note G#, 3
	note D#, 1
	note F_, 13
	note D_, 0
	note D#, 0
	note F_, 1
	note D#, 1
	note C#, 1
	octave 5
	note A#, 9
	octave 6
	note F_, 1
	note D#, 1
	note C#, 1
	octave 5
	note A_, 9
	octave 6
	note D#, 1
	note C#, 1
	note C_, 1
	octave 5
	note G#, 3
	note A#, 3
	octave 6
	note C_, 1
	endchannel
; f578f

Music_NationalPark_branch_f578f: ; f578f
	octave 2
	note F#, 2
	octave 3
	note C#, 1
	note __, 0
	note A#, 3
	note C#, 0
	note __, 0
	note A#, 0
	note C#, 2
	octave 2
	note F#, 2
	octave 3
	note C#, 1
	note __, 0
	note A_, 3
	note C#, 0
	note __, 0
	note A_, 0
	note C#, 2
	octave 2
	note F_, 2
	octave 3
	note C_, 1
	note __, 0
	note G#, 3
	note C_, 0
	note __, 0
	note G#, 0
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 1
	note __, 0
	octave 4
	note D_, 3
	octave 3
	note F_, 0
	note __, 0
	endchannel

Music_NationalPark_Ch4: ; f57b8
	togglenoise $3
	notetype $c
	note __, 1

Music_NationalPark_branch_f57bd: ; f57bd
	note __, 15
	loopchannel 23, Music_NationalPark_branch_f57bd
	note __, 7
	note A#, 1
	note D_, 1
	note A#, 0
	note D_, 0
	note B_, 1

Music_NationalPark_branch_f57c8: ; f57c8
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note B_, 1
	loopchannel 7, Music_NationalPark_branch_f57c8
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note D#, 0
	note D#, 0
	note D_, 0
	note D_, 0
	note A#, 0
	note D#, 0
	loopchannel 0, Music_NationalPark_branch_f57bd
; f57e8
