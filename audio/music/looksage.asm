Music_LookSage: ; ee35e
	dbw $40, Music_LookSage_Ch1
	dbw $02, Music_LookSage_Ch3
; ee364


Music_LookSage_Ch1: ; ee364
	tempo 144
	stereopanning $f
	volume $77
	dutycycle $3
	notetype $c, $b3
	note __, 1
	note __, 15
	callchannel Music_LookSage_branch_ee3fa
	intensity $b3
	octave 3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	note E_, 1
	intensity $93
	note E_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	intensity $b3
	note F_, 1
	intensity $93
	note F_, 1

Music_LookSage_branch_ee38e: ; ee38e
	intensity $b3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	octave 2
	note B_, 1
	intensity $93
	note B_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	intensity $b3
	note B_, 1
	intensity $93
	note B_, 1
	intensity $b3
	octave 3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	octave 2
	note B_, 1
	intensity $93
	note B_, 1
	intensity $b3
	octave 3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	note E_, 1
	intensity $93
	note E_, 1
	intensity $b3
	note F_, 1
	intensity $93
	note F_, 1
	intensity $b3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	note E_, 1
	intensity $93
	note E_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	intensity $b3
	note D_, 1
	intensity $93
	note D_, 1
	intensity $b3
	octave 2
	note B_, 1
	intensity $93
	note B_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	intensity $b3
	note B_, 1
	intensity $93
	note B_, 1
	callchannel Music_LookSage_branch_ee3fa
	loopchannel 0, Music_LookSage_branch_ee38e
; ee3fa

Music_LookSage_branch_ee3fa: ; ee3fa
	intensity $b3
	octave 2
	note E_, 1
	intensity $93
	note E_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	intensity $b3
	note B_, 1
	intensity $93
	note B_, 1
	intensity $b3
	note A_, 1
	intensity $93
	note A_, 1
	endchannel

Music_LookSage_Ch3: ; ee414
	stereopanning $f0
	vibrato $16, $23
	notetype $c, $10
	octave 5
	note B_, 0
	octave 6
	note C_, 0
	octave 5
	note B_, 15
	vibrato $7, $23
	note B_, 7
	vibrato $14, $23
	octave 6
	note D_, 5
	note E_, 0
	note F_, 0
	note E_, 13
	note G_, 0
	note G#, 0

Music_LookSage_branch_ee430: ; ee430
	note A_, 11
	note B_, 3
	note D_, 8
	note E_, 0
	note F_, 0
	note D_, 0
	vibrato $0, $0
	note E_, 3
	vibrato $7, $23
	note E_, 7
	vibrato $14, $23
	octave 5
	note B_, 7
	octave 6
	note F_, 7
	notetype $6, $10
	note E_, 0
	note D#, 0
	note D_, 0
	note C#, 0
	note C_, 0
	octave 5
	note B_, 0
	note A#, 0
	note A_, 0
	note __, 3
	octave 6
	note E_, 1
	note F_, 1
	notetype $c, $10
	note E_, 13
	note G_, 0
	note G#, 0
	loopchannel 0, Music_LookSage_branch_ee430
; ee45f
