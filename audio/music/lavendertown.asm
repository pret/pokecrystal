Music_LavenderTown: ; ef72f
	dbw $80, Music_LavenderTown_Ch1
	dbw $01, Music_LavenderTown_Ch2
	dbw $02, Music_LavenderTown_Ch3
; ef738

INCBIN "baserom.gbc", $ef738, $ef739 - $ef738

Music_LavenderTown_Ch1: ; ef739
	tempo 160
	volume $77
	stereopanning $f
	vibrato $6, $24
	dutycycle $0
	notetype $c, $b3
	note __, 15
	note __, 15
	note __, 15
	note __, 15

Music_LavenderTown_branch_ef74c: ; ef74c
	callchannel Music_LavenderTown_branch_ef7fd
	intensity $93
	octave 5
	note D_, 1
	intensity $43
	note D_, 1
	intensity $93
	note F#, 1
	intensity $43
	note F#, 1
	intensity $93
	note B_, 1
	intensity $43
	note B_, 1
	intensity $93
	note A_, 1
	intensity $43
	note A_, 1
	callchannel Music_LavenderTown_branch_ef87f
	intensity $93
	intensity $93
	note F_, 1
	intensity $83
	note F_, 1
	intensity $93
	note D_, 1
	intensity $43
	note D_, 1
	intensity $93
	octave 4
	note B_, 1
	intensity $43
	note B_, 1
	intensity $93
	note G_, 1
	intensity $43
	note G_, 1
	callchannel Music_LavenderTown_branch_ef7fd
	intensity $93
	octave 5
	note D_, 1
	intensity $43
	note D_, 1
	intensity $93
	note G_, 1
	intensity $43
	note G_, 1
	intensity $93
	note B_, 1
	intensity $43
	note B_, 1
	intensity $93
	note G_, 1
	intensity $43
	note G_, 1
	callchannel Music_LavenderTown_branch_ef87f
	intensity $93
	octave 6
	note C_, 1
	intensity $43
	note C_, 1
	intensity $93
	octave 5
	note G_, 1
	intensity $43
	note G_, 1
	intensity $93
	note E_, 1
	intensity $43
	note E_, 1
	intensity $93
	note C_, 1
	intensity $43
	note C_, 1
	octave 3
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1

Music_LavenderTown_branch_ef7ca: ; ef7ca
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	note E_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note E_, 1
	note F_, 1
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	loopchannel 2, Music_LavenderTown_branch_ef7ca
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	note F#, 1
	note A_, 1
	note C_, 1
	octave 3
	note A_, 1
	note F#, 1
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	octave 3
	note B_, 7
	note B_, 7
	loopchannel 0, Music_LavenderTown_branch_ef74c
; ef7fd

Music_LavenderTown_branch_ef7fd: ; ef7fd
	intensity $83
	octave 5
	note C_, 1
	intensity $43
	note C_, 1
	intensity $83
	note G_, 1
	intensity $43
	note G_, 1
	intensity $83
	octave 6
	note C_, 1
	intensity $43
	note C_, 1
	intensity $83
	octave 5
	note G_, 1
	intensity $43
	note G_, 1
	intensity $83
	note D_, 1
	intensity $43
	note D_, 1
	intensity $83
	note A_, 1
	intensity $43
	note A_, 1
	intensity $83
	octave 6
	note D_, 1
	intensity $43
	note D_, 1
	intensity $83
	octave 5
	note A_, 1
	intensity $43
	note A_, 1
	intensity $83
	note E_, 1
	intensity $43
	note E_, 1
	intensity $83
	note B_, 1
	intensity $43
	note B_, 1
	intensity $83
	octave 6
	note E_, 1
	intensity $43
	note E_, 1
	intensity $83
	octave 5
	note B_, 1
	intensity $43
	note B_, 1
	intensity $83
	note C#, 1
	intensity $43
	note C#, 1
	intensity $83
	note G_, 1
	intensity $43
	note G_, 1
	intensity $83
	note A#, 1
	intensity $43
	note A#, 1
	intensity $83
	note G_, 1
	intensity $43
	note G_, 1
	intensity $83
	note C_, 1
	intensity $43
	note C_, 1
	intensity $83
	note F_, 1
	intensity $43
	note F_, 1
	intensity $83
	octave 6
	note C_, 1
	intensity $43
	note C_, 1
	intensity $83
	octave 5
	note F_, 1
	intensity $43
	note F_, 1
	endchannel
; ef87f

Music_LavenderTown_branch_ef87f: ; ef87f
	intensity $93
	octave 5
	note G_, 1
	intensity $83
	note G_, 1
	intensity $83
	note F_, 1
	intensity $43
	note F_, 1
	intensity $83
	note D_, 1
	intensity $43
	note D_, 1
	intensity $83
	note G_, 1
	intensity $43
	note G_, 1
	endchannel

Music_LavenderTown_Ch2: ; ef899
	dutycycle $1
	vibrato $8, $24
	stereopanning $ff

Music_LavenderTown_branch_ef8a0: ; ef8a0
	notetype $c, $a3
	octave 5
	note C_, 1
	intensity $63
	note C_, 1
	intensity $a3
	note G_, 1
	intensity $63
	note G_, 1
	intensity $a3
	note B_, 1
	intensity $63
	note B_, 1
	intensity $a3
	note F#, 1
	intensity $63
	note F#, 1
	loopchannel 3, Music_LavenderTown_branch_ef8a0
	intensity $a3
	note C_, 1
	intensity $63
	note C_, 1
	intensity $a3
	note G_, 1
	intensity $63
	note G_, 1
	intensity $a3
	note B_, 1
	intensity $63
	note B_, 1
	intensity $a3
	octave 6
	note D_, 1
	intensity $63
	note D_, 1

Music_LavenderTown_branch_ef8d7: ; ef8d7
	intensity $b5
	callchannel Music_LavenderTown_branch_ef915
	octave 2
	note F#, 3
	octave 3
	note C_, 3
	note F#, 3
	note A_, 3
	octave 2
	note G_, 3
	octave 3
	note C_, 3
	note D_, 3
	note G_, 3
	note F_, 3
	note D_, 3
	octave 2
	note B_, 3
	note G_, 3
	callchannel Music_LavenderTown_branch_ef915
	octave 2
	note G_, 3
	octave 3
	note C_, 3
	note F_, 3
	note G_, 3
	note C_, 3
	note F_, 3
	note G_, 3
	note F_, 3
	note C_, 3
	note E_, 3
	note G_, 3
	octave 4
	note C_, 3
	intensity $b7
	octave 2
	note F_, 15
	note C_, 15
	note F_, 15
	note C_, 15
	note F_, 15
	note F#, 15
	note G_, 15
	octave 1
	note G_, 7
	intensity $57
	octave 5
	note D_, 0
	note F_, 0
	note G_, 5
	loopchannel 0, Music_LavenderTown_branch_ef8d7
; ef915

Music_LavenderTown_branch_ef915: ; ef915
	octave 2
	note C_, 3
	note G_, 3
	octave 3
	note E_, 3
	octave 2
	note G_, 3
	note D_, 3
	note A_, 3
	octave 3
	note F_, 3
	octave 2
	note A_, 3
	note E_, 3
	note B_, 3
	octave 3
	note G_, 3
	note F_, 3
	note E_, 3
	note C#, 3
	octave 2
	note A#, 3
	note G_, 3
	note F_, 3
	octave 3
	note C_, 3
	note A_, 3
	note C_, 3
	endchannel

Music_LavenderTown_Ch3: ; ef932
	vibrato $12, $24
	notetype $c, $13
	stereopanning $f0
	note __, 15
	note __, 15
	note __, 15
	note __, 7
	octave 5
	note E_, 3
	note F_, 3

Music_LavenderTown_branch_ef941: ; ef941
	intensity $12
	octave 5
	note G_, 3
	note __, 3
	note G_, 3
	note __, 3
	note E_, 3
	note __, 3
	note E_, 3
	note F_, 3
	note G_, 3
	note F_, 3
	note E_, 3
	note B_, 3
	note C#, 7
	note __, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F_, 9
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 7
	octave 4
	note A_, 3
	octave 5
	note D_, 3
	note E_, 11
	note F_, 1
	note E_, 1
	note D_, 11
	note E_, 1
	note F_, 1
	note G_, 3
	note __, 3
	note G_, 3
	note __, 3
	note E_, 3
	note __, 3
	note E_, 3
	note F_, 3
	note G_, 3
	note F_, 3
	note E_, 3
	note B_, 3
	note C#, 7
	note __, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F_, 9
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 11
	note C_, 1
	note D_, 1
	note C_, 15
	note C_, 11
	note __, 3
	intensity $24
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 3
	octave 5
	note G_, 3
	note F_, 3
	note E_, 3
	note D_, 3
	note C_, 3
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 3
	octave 5
	note G_, 3
	octave 6
	note F_, 3
	notetype $8, $24
	note E_, 1
	note F_, 1
	note E_, 1
	notetype $c, $24
	note D_, 3
	note C_, 3
	octave 5
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 3
	octave 5
	note G_, 3
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 3
	note C#, 3
	note D_, 11
	note C_, 3
	octave 5
	note B_, 11
	note E_, 1
	note F_, 1
	loopchannel 0, Music_LavenderTown_branch_ef941
; ef9bc
