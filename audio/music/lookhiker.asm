Music_LookHiker: ; f7411
	dbw $c0, Music_LookHiker_Ch1
	dbw $01, Music_LookHiker_Ch2
	dbw $02, Music_LookHiker_Ch3
	dbw $03, Music_LookHiker_Ch4
; f741d


Music_LookHiker_Ch1: ; f741d
	tempo 132
	volume $77
	tone $0001
	vibrato $12, $24
	dutycycle $2
	stereopanning $f
	notetype $c, $68
	octave 3
	note F#, 1
	note F_, 1
	note F#, 7

Music_LookHiker_branch_f7433: ; f7433
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 3
	note F#, 1
	note __, 1
	note F#, 1
	note __, 5
	loopchannel 0, Music_LookHiker_branch_f7433

Music_LookHiker_Ch2: ; f7443
	dutycycle $0
	notetype $c, $a1
	note __, 3
	octave 1
	note B_, 0
	note B_, 4
	octave 2
	note F#, 0
	note F#, 4
	octave 1
	note B_, 0
	octave 2
	note D_, 0
	note F#, 0
	note D_, 0
	intensity $a1

Music_LookHiker_branch_f7457: ; f7457
	octave 1
	note B_, 0
	note B_, 1
	octave 2
	note D_, 0
	note D_, 1
	note F#, 0
	note F#, 1
	note A#, 0
	note A#, 1
	octave 1
	note B_, 0
	octave 2
	note D_, 0
	note F#, 0
	note D_, 0
	loopchannel 0, Music_LookHiker_branch_f7457

Music_LookHiker_Ch3: ; f746b
	vibrato $12, $24
	stereopanning $f0
	notetype $c, $14
	octave 4
	note B_, 1
	note A#, 1
	note B_, 7

Music_LookHiker_branch_f7477: ; f7477
	octave 5
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	callchannel Music_LookHiker_branch_f748a
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	callchannel Music_LookHiker_branch_f748a
	loopchannel 0, Music_LookHiker_branch_f7477
; f748a

Music_LookHiker_branch_f748a: ; f748a
	octave 4
	note B_, 1
	note __, 3
	note B_, 1
	note __, 3
	note B_, 1
	note __, 1
	note B_, 1
	note __, 5
	endchannel

Music_LookHiker_Ch4: ; f7494
	togglenoise $3
	notetype $c
	note F_, 3
	note __, 15

Music_LookHiker_branch_f749a: ; f749a
	note D#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	loopchannel 0, Music_LookHiker_branch_f749a
; f74a2
