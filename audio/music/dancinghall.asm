Music_DancingHall: ; ef9bc
	dbw $80, Music_DancingHall_Ch1
	dbw $01, Music_DancingHall_Ch2
	dbw $02, Music_DancingHall_Ch3
; ef9c5

INCBIN "baserom.gbc", $ef9c5, $ef9c6 - $ef9c5

Music_DancingHall_Ch1: ; ef9c6
	tempo 208
	volume $77
	stereopanning $f
	notetype $6, $b7
	note __, 2
	dutycycle $0

Music_DancingHall_branch_ef9d3: ; ef9d3
	notetype $c, $b7
	callchannel Music_DancingHall_branch_efa17
	note __, 15
	callchannel Music_DancingHall_branch_efa17
	note __, 15
	note __, 15
	note __, 15
	intensity $b1
	octave 2
	note B_, 0
	octave 3
	note D_, 0
	note F_, 0
	note A_, 0
	note B_, 0
	note A_, 0
	note B_, 0
	octave 4
	note D_, 0
	note F_, 1
	notetype $8, $b1
	note D_, 0
	note E_, 0
	note D_, 0
	octave 3
	note B_, 2
	note A_, 2
	notetype $c, $b1
	note B_, 0
	note A_, 0
	note D_, 0
	note E_, 0
	octave 4
	note F_, 1
	notetype $8, $b1
	octave 3
	note B_, 0
	octave 4
	note D_, 0
	octave 3
	note B_, 0
	notetype $c, $b5
	note A_, 0
	note __, 0
	note B_, 0
	note B_, 0
	note A_, 0
	note __, 0
	note F_, 1
	loopchannel 0, Music_DancingHall_branch_ef9d3
; efa17

Music_DancingHall_branch_efa17: ; efa17
	octave 3
	note B_, 0
	note __, 0
	note A_, 0
	note __, 0
	note B_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 4
	note E_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 3
	note B_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	endchannel

Music_DancingHall_Ch2: ; efa2c
	stereopanning $f0
	notetype $6, $a1
	dutycycle $0
	vibrato $10, $24
	note __, 2

Music_DancingHall_branch_efa37: ; efa37
	notetype $6, $a2
	callchannel Music_DancingHall_branch_efa7a
	callchannel Music_DancingHall_branch_efa7a
	intensity $a7
	octave 2
	note D_, 15
	note F_, 15
	notetype $c, $a7
	note E_, 15
	octave 3
	note F_, 0
	note A_, 0
	note B_, 0
	octave 4
	note D_, 0
	note E_, 0
	note D_, 0
	note E_, 0
	note A_, 0
	note B_, 1
	notetype $8, $a7
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 2
	note D_, 2
	notetype $c, $a7
	note E_, 0
	note D_, 0
	octave 3
	note A_, 0
	note B_, 0
	octave 4
	note A_, 1
	notetype $8, $a7
	note F_, 0
	note A_, 0
	note F_, 0
	notetype $c, $a7
	note E_, 0
	note __, 0
	note F_, 0
	note F_, 0
	note E_, 0
	note __, 0
	note D_, 1
	loopchannel 0, Music_DancingHall_branch_efa37
; efa7a

Music_DancingHall_branch_efa7a: ; efa7a
	intensity $a1
	octave 4
	note E_, 3
	octave 2
	note E_, 3
	octave 4
	note E_, 3
	octave 2
	note E_, 3
	octave 4
	note B_, 3
	note A_, 3
	note F_, 3
	note A_, 3
	intensity $33
	note D_, 0
	note F_, 0
	intensity $63
	note D_, 0
	note F_, 0
	intensity $93
	note D_, 0
	note F_, 0
	intensity $c3
	note D_, 0
	note F_, 0
	intensity $e3
	note D_, 0
	note F_, 0
	intensity $a3
	note D_, 0
	note F_, 0
	intensity $83
	note D_, 0
	note F_, 0
	intensity $53
	note D_, 0
	note F_, 0
	intensity $73
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	intensity $a3
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	intensity $b3
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	intensity $c3
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	intensity $d3
	octave 3
	note E_, 0
	note B_, 0
	intensity $e3
	note E_, 0
	note B_, 0
	intensity $f3
	note A_, 0
	octave 4
	note D_, 0
	intensity $f3
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	endchannel

Music_DancingHall_Ch3: ; efad6
	stereopanning $ff
	vibrato $16, $24
	notetype $6, $10
	octave 5
	note A_, 0
	note B_, 0
	octave 6
	note D_, 0

Music_DancingHall_branch_efae3: ; efae3
	note E_, 12
	note D_, 0
	note E_, 0
	note A_, 0
	note B_, 15
	intensity $14
	octave 3
	note F_, 15
	note E_, 13
	intensity $10
	octave 6
	note E_, 0
	note F_, 0
	note E_, 12
	note D_, 0
	note E_, 0
	note A_, 0
	note B_, 15
	intensity $14
	octave 3
	note F_, 15
	note E_, 15
	intensity $13
	octave 4
	note F_, 1
	note A_, 1
	note B_, 1
	octave 5
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note A#, 0
	note B_, 2
	notetype $8, $13
	note A_, 0
	note B_, 0
	note A_, 0
	note F_, 2
	note D_, 2
	notetype $c, $13
	note E_, 0
	note D_, 0
	octave 4
	note A_, 0
	note B_, 0
	octave 5
	note A_, 1
	notetype $8, $13
	note F_, 0
	note A_, 0
	note F_, 0
	notetype $6, $13
	note D#, 0
	note E_, 2
	note D_, 3
	octave 4
	note B_, 3
	octave 5
	note D_, 3
	intensity $14
	octave 3
	note D_, 15
	note F_, 15
	note E_, 15
	note E_, 12
	intensity $10
	octave 5
	note A_, 0
	note B_, 0
	octave 6
	note D_, 0
	loopchannel 0, Music_DancingHall_branch_efae3
; efb3e
