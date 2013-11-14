Music_Evolution: ; f06e1
	dbw $c0, Music_Evolution_Ch1
	dbw $01, Music_Evolution_Ch2
	dbw $02, Music_Evolution_Ch3
	dbw $03, Music_Evolution_Ch4
; f06ed


Music_Evolution_Ch1: ; f06ed
	tempo 132
	volume $77
	vibrato $6, $34
	tone $0001
	dutycycle $2
	notetype $c, $92
	octave 3
	unknownmusic0xe0 $0, $4a
	note C_, 0
	unknownmusic0xe0 $0, $4a
	note G_, 0
	unknownmusic0xe0 $0, $4a
	note C_, 0
	unknownmusic0xe0 $0, $4a
	note G_, 0
	note __, 3
	dutycycle $3
	stereopanning $f

Music_Evolution_branch_f0713: ; f0713
	callchannel Music_Evolution_branch_f0737
	notetype $c, $a4
	note F#, 3
	callchannel Music_Evolution_branch_f0737
	notetype $c, $a4
	note F#, 3
	loopchannel 2, Music_Evolution_branch_f0713
	callchannel Music_Evolution_branch_f0743
	notetype $c, $a4
	note G#, 3
	callchannel Music_Evolution_branch_f0743
	notetype $c, $a4
	note G#, 3
	loopchannel 0, Music_Evolution_branch_f0713
; f0737

Music_Evolution_branch_f0737: ; f0737
	notetype $c, $a2
	octave 3
	note C_, 3
	note G_, 3
	note C_, 3
	note G_, 3
	note C_, 3
	note G_, 3
	note C_, 3
	endchannel
; f0743

Music_Evolution_branch_f0743: ; f0743
	notetype $c, $a2
	octave 3
	note D_, 3
	note A_, 3
	note D_, 3
	note A_, 3
	note D_, 3
	note A_, 3
	note D_, 3
	endchannel

Music_Evolution_Ch2: ; f074f
	dutycycle $2
	vibrato $8, $25
	notetype $c, $a2
	octave 4
	note G_, 0
	note D_, 0
	note G_, 0
	note D_, 0
	note __, 3
	dutycycle $3
	stereopanning $f0

Music_Evolution_branch_f0761: ; f0761
	callchannel Music_Evolution_branch_f0787
	notetype $c, $b5
	note A_, 3
	callchannel Music_Evolution_branch_f0787
	notetype $c, $b5
	note B_, 3
	loopchannel 2, Music_Evolution_branch_f0761
	callchannel Music_Evolution_branch_f0793
	notetype $c, $b5
	note B_, 3
	callchannel Music_Evolution_branch_f0793
	notetype $c, $b5
	octave 4
	note C#, 3
	octave 3
	loopchannel 0, Music_Evolution_branch_f0761
; f0787

Music_Evolution_branch_f0787: ; f0787
	notetype $c, $b2
	octave 3
	note G_, 3
	note D_, 3
	note G_, 3
	note D_, 3
	note G_, 3
	note D_, 3
	note G_, 3
	endchannel
; f0793

Music_Evolution_branch_f0793: ; f0793
	notetype $c, $b2
	octave 3
	note A_, 3
	note E_, 3
	note A_, 3
	note E_, 3
	note A_, 3
	note E_, 3
	note A_, 3
	endchannel

Music_Evolution_Ch3: ; f079f
	notetype $c, $16
	note __, 7

Music_Evolution_branch_f07a3: ; f07a3
	callchannel Music_Evolution_branch_f07bf
	octave 3
	note A_, 3
	callchannel Music_Evolution_branch_f07bf
	octave 3
	note B_, 3
	loopchannel 2, Music_Evolution_branch_f07a3
	callchannel Music_Evolution_branch_f07d5
	octave 3
	note B_, 3
	callchannel Music_Evolution_branch_f07d5
	octave 4
	note C#, 3
	loopchannel 0, Music_Evolution_branch_f07a3
; f07bf

Music_Evolution_branch_f07bf: ; f07bf
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	endchannel
; f07d5

Music_Evolution_branch_f07d5: ; f07d5
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	endchannel

Music_Evolution_Ch4: ; f07eb
	togglenoise $5
	notetype $c
	note __, 7

Music_Evolution_branch_f07f0: ; f07f0
	stereopanning $f0
	note A#, 5
	note A#, 3
	stereopanning $f
	note E_, 1
	note E_, 1
	note E_, 1
	loopchannel 0, Music_Evolution_branch_f07f0
; f07fd
