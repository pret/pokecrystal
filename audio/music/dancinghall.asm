Music_DancingHall: ; ef9bc
	dbw $80, Music_DancingHall_Ch1
	dbw $01, Music_DancingHall_Ch2
	dbw $02, Music_DancingHall_Ch3
; ef9c5


INCBIN "baserom.gbc", $ef9c5, $ef9c6 - $ef9c5


Music_DancingHall_Ch1: ; ef9c6
	tempo 208
	volume $7, $7
	stereopanning $f
	notetype $6, $b, $0, $7
	note __, 3
	waveduty $0
Music_DancingHall_branch_ef9d3: ; ef9d3
	notetype $c, $b, $0, $7
	callchannel Music_DancingHall_branch_efa17
	note __, 16
	callchannel Music_DancingHall_branch_efa17
	note __, 16
	note __, 16
	note __, 16
	volenvelope $b, $0, $1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F_, 2
	notetype $8, $b, $0, $1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 3
	note A_, 3
	notetype $c, $b, $0, $1
	note B_, 1
	note A_, 1
	note D_, 1
	note E_, 1
	octave 4
	note F_, 2
	notetype $8, $b, $0, $1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	notetype $c, $b, $0, $5
	note A_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note A_, 1
	note __, 1
	note F_, 2
	loopchannel 0, Music_DancingHall_branch_ef9d3
; efa17

Music_DancingHall_branch_efa17: ; efa17
	octave 3
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	endchannel
; efa2c

Music_DancingHall_Ch2: ; efa2c
	stereopanning $f0
	notetype $6, $a, $0, $1
	waveduty $0
	vibrato $10, $2, $4
	note __, 3
Music_DancingHall_branch_efa37: ; efa37
	notetype $6, $a, $0, $2
	callchannel Music_DancingHall_branch_efa7a
	callchannel Music_DancingHall_branch_efa7a
	volenvelope $a, $0, $7
	octave 2
	note D_, 16
	note F_, 16
	notetype $c, $a, $0, $7
	note E_, 16
	octave 3
	note F_, 1
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 2
	notetype $8, $a, $0, $7
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 3
	note D_, 3
	notetype $c, $a, $0, $7
	note E_, 1
	note D_, 1
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note A_, 2
	notetype $8, $a, $0, $7
	note F_, 1
	note A_, 1
	note F_, 1
	notetype $c, $a, $0, $7
	note E_, 1
	note __, 1
	note F_, 1
	note F_, 1
	note E_, 1
	note __, 1
	note D_, 2
	loopchannel 0, Music_DancingHall_branch_efa37
; efa7a

Music_DancingHall_branch_efa7a: ; efa7a
	volenvelope $a, $0, $1
	octave 4
	note E_, 4
	octave 2
	note E_, 4
	octave 4
	note E_, 4
	octave 2
	note E_, 4
	octave 4
	note B_, 4
	note A_, 4
	note F_, 4
	note A_, 4
	volenvelope $3, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $6, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $9, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $c, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $e, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $a, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $8, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $5, $0, $3
	note D_, 1
	note F_, 1
	volenvelope $7, $0, $3
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	volenvelope $a, $0, $3
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	volenvelope $b, $0, $3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	volenvelope $c, $0, $3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	volenvelope $d, $0, $3
	octave 3
	note E_, 1
	note B_, 1
	volenvelope $e, $0, $3
	note E_, 1
	note B_, 1
	volenvelope $f, $0, $3
	note A_, 1
	octave 4
	note D_, 1
	volenvelope $f, $0, $3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	endchannel
; efad6

Music_DancingHall_Ch3: ; efad6
	stereopanning $ff
	vibrato $16, $2, $4
	notetype $6, $1, $0, $0
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
Music_DancingHall_branch_efae3: ; efae3
	note E_, 13
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 16
	volenvelope $1, $0, $4
	octave 3
	note F_, 16
	note E_, 14
	volenvelope $1, $0, $0
	octave 6
	note E_, 1
	note F_, 1
	note E_, 13
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 16
	volenvelope $1, $0, $4
	octave 3
	note F_, 16
	note E_, 16
	volenvelope $1, $0, $3
	octave 4
	note F_, 2
	note A_, 2
	note B_, 2
	octave 5
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note A#, 1
	note B_, 3
	notetype $8, $1, $0, $3
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 3
	note D_, 3
	notetype $c, $1, $0, $3
	note E_, 1
	note D_, 1
	octave 4
	note A_, 1
	note B_, 1
	octave 5
	note A_, 2
	notetype $8, $1, $0, $3
	note F_, 1
	note A_, 1
	note F_, 1
	notetype $6, $1, $0, $3
	note D#, 1
	note E_, 3
	note D_, 4
	octave 4
	note B_, 4
	octave 5
	note D_, 4
	volenvelope $1, $0, $4
	octave 3
	note D_, 16
	note F_, 16
	note E_, 16
	note E_, 13
	volenvelope $1, $0, $0
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
	loopchannel 0, Music_DancingHall_branch_efae3
; efb3e


