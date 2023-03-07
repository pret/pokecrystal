; Composed by Mmmmmmmmmmmmmmmmm
; Source: https://soundcloud.com/mmmmmmmmmmmmmmmmm-1/route-47-gbc-8-bit

Music_Route47:
	musicheader 4, 1, Music_Route47_Ch1
	musicheader 1, 2, Music_Route47_Ch2
	musicheader 1, 3, Music_Route47_Ch3
	musicheader 1, 4, Music_Route47_Ch4

Music_Route47_Ch1:
	tempo 192
	volume $77
	dutycycle 0
	tone $0002
	vibrato $8, $15
	notetype $6, $82
	note __, 16
Music_Route47_Ch1_loop_main:
	notetype $6, $82
Music_Route47_Ch1_loop_1:
	callchannel Music_Route47_Ch1_branch_1
	callchannel Music_Route47_Ch1_branch_1
	callchannel Music_Route47_Ch1_branch_1
	callchannel Music_Route47_Ch1_branch_1
	intensity $82
	octave 4
	note C_, 2
	intensity $62
	octave 3
	note C_, 2
	intensity $42
	note C_, 2
	intensity $22
	note C_, 2
	loopchannel 4, Music_Route47_Ch1_loop_1
	intensity $82
	octave 4
	note C_, 2
	intensity $62
	octave 3
	note C_, 2
	intensity $42
	note C_, 2
	intensity $22
	note C_, 2
	notetype $c, $93
	dutycycle 2
	octave 3
	note E_, 2
	note C_, 2
	note F_, 2
	callchannel Music_Route47_Ch1_branch_2
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	callchannel Music_Route47_Ch1_branch_2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	callchannel Music_Route47_Ch1_branch_2
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	callchannel Music_Route47_Ch1_branch_2
	octave 2
	note G_, 2
	note F_, 2
	octave 3
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	note G_, 2
	callchannel Music_Route47_Ch1_branch_2
	octave 3
	note C_, 2
	note D_, 2
	note E_, 4
	note F_, 2
	note G_, 2
	note A_, 2
	callchannel Music_Route47_Ch1_branch_2
	note G_, 2
	note F_, 2
	octave 2
	note G_, 2
	note A_, 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	dutycycle 0
	intensity $62
	octave 2
	note C_, 1
	note C_, 1
	dutycycle 2
	intensity $93
	octave 3
	note C_, 2
	octave 2
	note A#, 2
	note A_, 2
	dutycycle 0
	intensity $62
	octave 3
	note C_, 1
	note C_, 3
	octave 2
	note A_, 1
	note A_, 3
	octave 3
	note F_, 1
	note F_, 3
	note C_, 1
	note C_, 3
	note A_, 1
	note A_, 3
	note F_, 1
	note F_, 1
	notetype $3, $72
	octave 3
	note C_, 2
	note F_, 2
	note G_, 2
	note A#, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 2
	note A#, 2
	note A_, 2
	octave 5
	note C_, 2
	note F_, 2
	note G_, 2
	note C_, 2
	note A#, 2
	octave 4
	note A_, 4
	note G_, 4
	note F_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	octave 3
	note A#, 4
	note A_, 4
	octave 4
	note F_, 4
	note C_, 4
	octave 3
	note A#, 4
	note A_, 4
	note A#, 4
	note A_, 4
	note F_, 4
	note C_, 4
	octave 4
	note A_, 4
	note E_, 4
	note C_, 4
	octave 3
	note A_, 4
	octave 4
	note E_, 4
	note C_, 4
	octave 3
	note G_, 4
	note E_, 4
	octave 4
	note E_, 4
	note C_, 4
	octave 3
	note G_, 4
	note E_, 4
	note A_, 4
	note G_, 4
	note E_, 4
	note C_, 4
	octave 4
	note A_, 4
	note F_, 4
	note D_, 4
	note C_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 4
	note F_, 4
	octave 4
	note D_, 4
	note C_, 4
	octave 3
	note A_, 4
	note F_, 4
	note A_, 4
	note F_, 4
	note D_, 4
	note C_, 4
	octave 4
	note A_, 4
	note G_, 4
	note F_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	octave 3
	note A_, 4
	note G_, 4
	octave 4
	note F_, 4
	note D_, 4
	octave 3
	note A_, 4
	note G_, 4
	note A_, 4
	note G_, 4
	note F_, 4
	note D_, 4
	octave 4
	note A#, 4
	note G_, 4
	note F_, 4
	note D_, 4
	note F_, 4
	note D_, 4
	octave 3
	note A#, 4
	note G_, 4
	octave 4
	note F_, 4
	note D_, 4
	octave 3
	note A#, 4
	note G_, 4
	note A#, 4
	note G_, 4
	note F_, 4
	note D_, 4
	octave 4
	note G#, 4
	note G_, 4
	note F_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	octave 3
	note G#, 4
	note G_, 4
	octave 4
	note F_, 4
	note C_, 4
	octave 3
	note G#, 4
	note G_, 4
	note G#, 4
	note G_, 4
	note F_, 4
	note C_, 4
	octave 2
	note G_, 4
	note A#, 4
	octave 3
	note C_, 4
	octave 2
	note A#, 4
	octave 3
	note C_, 4
	note F_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note F_, 4
	note G_, 4
	note F_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note A#, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note E_, 4
	note A#, 4
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	dutycycle 2
	notetype $c, $82
	octave 3
	note F_, 1
	note C_, 1
	note F_, 1
	note G_, 1
	octave 4
	note C_, 1
	note F_, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note C_, 1
	octave 3
	note F_, 1
	note G_, 1
	octave 4
	note C_, 1
	note F_, 1
	note G_, 1
	octave 5
	note C_, 1
	note F_, 1
	octave 3
	note F_, 1
	note C_, 1
	note F_, 1
	note G_, 1
	octave 4
	note C_, 1
	note F_, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	note G_, 1
	octave 4
	note D_, 1
	note E_, 1
	note A_, 1
	octave 5
	note D_, 1
	note E_, 1
	octave 3
	note G_, 1
	octave 2
	note B_, 1
	octave 3
	note F_, 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F_, 1
	note G_, 1
	note B_, 1
	octave 5
	note F_, 1
	octave 3
	note G_, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note G_, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note A#, 1
	note C#, 1
	octave 3
	note F_, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note A#, 1
	octave 5
	note C#, 1
	note F_, 1
	octave 3
	note C_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note A#, 1
	octave 4
	note C_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	note F_, 1
	note G_, 1
	octave 6
	note C_, 1
	octave 3
	note C_, 1
	note D_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note A_, 1
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	note F_, 1
	octave 3
	dutycycle 0
	notetype $6, $82
	note A_, 1
	octave 4
	note A_, 1
	note __, 2
	octave 3
	intensity $52
	note A_, 1
	octave 4
	note A_, 1
	note __, 2
	octave 3
	intensity $22
	note A_, 1
	octave 4
	note A_, 1
	note __, 2
	octave 3
	intensity $82
	note C_, 1
	octave 4
	note C_, 1
	note __, 2
	octave 3
	intensity $52
	note C_, 1
	octave 4
	note C_, 1
	note __, 2
	octave 3
	intensity $22
	note C_, 1
	octave 4
	note C_, 1
	note __, 2
	octave 3
	intensity $12
	note C_, 1
	octave 4
	note C_, 1
	note __, 2
	octave 3
	intensity $12
	note C_, 1
	octave 4
	note C_, 1
	note __, 2
	octave 3
	intensity $82
	note G_, 1
	octave 4
	note G_, 1
	note __, 2
	octave 3
	intensity $52
	note G_, 1
	octave 4
	note G_, 1
	note __, 2
	octave 3
	intensity $22
	note G_, 1
	octave 4
	note G_, 1
	note __, 2
	octave 2
	intensity $82
	note A#, 1
	octave 3
	note A#, 1
	note __, 2
	octave 2
	intensity $52
	note A#, 1
	octave 3
	note A#, 1
	note __, 2
	octave 2
	intensity $22
	note A#, 1
	octave 3
	note A#, 1
	note __, 2
	intensity $82
	note G_, 1
	octave 2
	note G_, 1
	note __, 2
	intensity $52
	note G_, 1
	octave 3
	note G_, 1
	note __, 2
	loopchannel 0, Music_Route47_Ch1_loop_main
	
Music_Route47_Ch1_branch_1:
	intensity $82
	octave 4
	note C_, 2
	intensity $62
	octave 3
	note C_, 1
	intensity $42
	octave 4
	note C_, 2
	intensity $22
	octave 3
	note C_, 1
	endchannel
	
Music_Route47_Ch1_branch_2:
	dutycycle 0
	intensity $62
	octave 3
	note C_, 1
	note C_, 1
	dutycycle 2
	intensity $93
	endchannel

Music_Route47_Ch2:
	dutycycle $2
	vibrato $12, $25
	tone $0001
	notetype $8, $52
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	intensity $62
	note F_, 1
	note G_, 1
	intensity $72
	note F_, 1
	note C_, 1
	intensity $82
	note F_, 1
	note C_, 1
	intensity $92
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	intensity $a2
	octave 4
	note G_, 1
	note C_, 1
Music_Route47_Ch2_loop:
	notetype $c, $a4
	octave 3
	note C_, 1
	note F_, 1
	note G_, 1
	note A#, 1
	note A_, 1
	octave 4
	note C_, 1
	note F_, 7
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 4
	octave 5
	note C_, 5
	octave 4
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note C_, 5
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note F_, 2
	note C_, 2
	octave 3
	note A#, 1
	octave 4
	note C_, 1
	note F_, 3
	note E_, 1
	note F_, 1
	note G_, 1
	note F_, 4
	note G_, 4
	note A_, 1
	note G_, 1
	note F_, 2
	dutycycle 3
	intensity $b7
	octave 3
	note G_, 4
	note A_, 4
	octave 4
	note C_, 4
	note F_, 8
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note F_, 8
	note E_, 2
	note F_, 2
	note G_, 4
	note D_, 4
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	octave 4
	note C_, 8
	note F_, 4
	note C_, 4
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note G_, 8
	note F_, 5
	intensity $84
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 1
	note __, 4
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note F_, 1
	note C_, 1
	note __, 4
	note A_, 1
	note F_, 1
	octave 3
	note A#, 1
	note A_, 1
	note __, 4
	dutycycle 2
	octave 4
	intensity $a7
	note C_, 4
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 3
	intensity $b3
	note G_, 3
	intensity $63
	note G_, 1
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 2
	octave 5
	note C_, 3
	intensity $63
	note C_, 1
	octave 4
	intensity $b3
	note A#, 3
	intensity $63
	note A#, 1
	intensity $b3
	note A_, 3
	intensity $63
	note A_, 1
	intensity $b3
	note G_, 3
	intensity $63
	note G_, 1
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 3
	intensity $b3
	note G_, 3
	intensity $63
	note G_, 1
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 2
	note A_, 3
	intensity $63
	note A_, 1
	intensity $b3
	note G_, 3
	intensity $63
	note G_, 1
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 3
	intensity $63
	note E_, 1
	intensity $b3
	note D_, 3
	intensity $63
	note D_, 3
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 3
	intensity $63
	note E_, 1
	intensity $b3
	note F_, 2
	note C_, 3
	intensity $63
	note C_, 3
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 3
	intensity $63
	note E_, 1
	intensity $b3
	note F_, 2
	note G#, 3
	intensity $63
	note G#, 1
	intensity $b3
	note A#, 3
	intensity $63
	note A#, 1
	octave 5
	intensity $b3
	note C_, 3
	intensity $63
	note C_, 1
	octave 4
	intensity $b3
	note C_, 3
	intensity $63
	note C_, 1
	intensity $b3
	note F_, 3
	intensity $63
	note F_, 1
	intensity $b3
	note E_, 3
	intensity $63
	note E_, 1
	intensity $b3
	note A_, 3
	intensity $63
	note A_, 1
	intensity $b3
	note G_, 3
	intensity $63
	note G_, 1
	octave 1
	intensity $70
	note F_, 8
	intensity $77
	note F_, 8
	intensity $70
	octave 2
	note D_, 4
	intensity $77
	note D_, 4
	intensity $70
	note C_, 4
	intensity $77
	note C_, 4
	octave 1
	intensity $70
	note B_, 8
	intensity $77
	note B_, 8
	intensity $70
	note A#, 8
	intensity $77
	note A#, 8
	intensity $70
	note A_, 8
	intensity $77
	note A_, 8
	intensity $70
	octave 2
	note D_, 8
	intensity $77
	note D_, 8
	notetype $3, $a2
	note D_, 2
	octave 5
	intensity $82
	note D_, 2
	octave 4
	intensity $52
	note A_, 3
	note F_, 3
	note D_, 2
	octave 3
	note A_, 4
	octave 4
	intensity $a2
	note C_, 2
	octave 5
	intensity $82
	note C_, 2
	octave 4
	intensity $52
	note A_, 3
	note F_, 3
	note C_, 2
	octave 3
	note A_, 4
	intensity $a2
	note F_, 2
	octave 4
	intensity $82
	note F_, 2
	intensity $52
	note C_, 3
	octave 3
	note A_, 3
	note F_, 2
	note D_, 4
	intensity $a2
	note G_, 2
	octave 4
	intensity $82
	note G_, 2
	intensity $52
	note D_, 3
	octave 3
	note A#, 3
	note G_, 2
	note D_, 4
	octave 4
	intensity $a2
	note C#, 2
	octave 5
	intensity $82
	note C#, 2
	octave 4
	intensity $52
	note G_, 3
	note C#, 3
	octave 3
	note A#, 2
	note G_, 4
	intensity $a2
	note A#, 2
	octave 4
	intensity $82
	note A#, 2
	intensity $52
	note F_, 3
	note C#, 3
	octave 3
	note A#, 2
	note F_, 4
	intensity $a2
	note D_, 2
	octave 4
	intensity $82
	note D_, 2
	octave 3
	intensity $52
	note A#, 3
	note G_, 3
	note D_, 2
	octave 2
	note A#, 4
	octave 3
	intensity $a2
	note E_, 2
	octave 4
	intensity $82
	note E_, 2
	intensity $52
	note C_, 3
	octave 3
	note A#, 3
	note G_, 2
	note E_, 4
	loopchannel 0, Music_Route47_Ch2_loop

Music_Route47_Ch3:
	notetype $c, $25
	vibrato $12, $15
	note __, 8
Music_Route47_Ch3_loop:
	octave 1
	note F_, 12
	note A_, 4
	note A#, 12
	intensity $35
	note A#, 4
	intensity $25
	octave 2
	note D_, 12
	note C_, 4
	octave 1
	note G#, 8
	note A#, 4
	octave 2
	note C_, 4
	octave 1
	note F_, 12
	intensity $35
	note F_, 4
	intensity $25
	note A#, 8
	octave 2
	note C_, 8
	note D_, 8
	octave 1
	note A_, 8
	note A#, 4
	note G_, 4
	octave 2
	note C_, 4
	octave 1
	note A#, 4
	note A_, 8
	octave 2
	note D_, 8
	octave 1
	note G_, 8
	note A#, 8
	note F_, 16
	intensity $35
	note F_, 12
	intensity $25
	octave 2
	note C_, 4
	octave 1
	note F_, 12
	intensity $35
	note F_, 4
	intensity $25
	note F_, 12
	intensity $35
	note F_, 4
	intensity $25
	octave 2
	note D_, 12
	intensity $35
	note D_, 4
	intensity $25
	octave 1
	note B_, 12
	intensity $35
	note B_, 4
	intensity $25
	note A#, 12
	intensity $35
	note A#, 4
	intensity $25
	note G#, 12
	intensity $35
	note G#, 4
	intensity $25
	note A#, 12
	intensity $35
	note A#, 4
	intensity $25
	octave 2
	note C_, 12
	intensity $35
	note C_, 4
	intensity $13
	vibrato $12, $24
	octave 5
	note F_, 6
	note G_, 4
	note F_, 4
	note C_, 2
	octave 6
	note C_, 4
	octave 5
	note A_, 4
	octave 6
	note D_, 4
	note E_, 4
	note F_, 6
	octave 5
	note F_, 4
	note G_, 4
	note F_, 2
	octave 6
	note C_, 4
	octave 5
	note A#, 4
	note F_, 4
	note C#, 4
	note C_, 6
	note F_, 6
	note A#, 6
	octave 6
	notetype $4, $13
	note C_, 16
	note D#, 1
	note E_, 1
	notetype $c, $13
	note F_, 4
	octave 5
	note F_, 4
	vibrato $12, $15
	intensity $25
	octave 1
	note G_, 16
	octave 2
	note C_, 16
	loopchannel 0, Music_Route47_Ch3_loop
	
Music_Route47_Ch4:
	togglenoise $3
	notetype $c
Music_Route47_Ch4_loop_main:
	note __, 5
	callchannel Music_Route47_Ch4_branch_1
	note B_, 16
	note __, 16
	note B_, 16
	note __, 13
	callchannel Music_Route47_Ch4_branch_1
	note B_, 3
	callchannel Music_Route47_Ch4_branch_2
Music_Route47_Ch4_loop_1:
	note C_, 1
	note C#, 1 
	note C#, 1
	callchannel Music_Route47_Ch4_branch_2
	loopchannel 6, Music_Route47_Ch4_loop_1
	note C_, 1
	note C#, 1 
	note C#, 1
	note C_, 1
	note C#, 1 
	note C#, 1 
	note C_, 1
	note C#, 1
	note __, 2
	note C#, 1
	note C#, 1
	note __, 4
	note B_, 3
	callchannel Music_Route47_Ch4_branch_2
Music_Route47_Ch4_loop_2:
	note C_, 1
	note C#, 1 
	note C#, 1
	callchannel Music_Route47_Ch4_branch_2
	loopchannel 7, Music_Route47_Ch4_loop_2
	note B_, 3
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 9
	callchannel Music_Route47_Ch4_branch_3
	callchannel Music_Route47_Ch4_branch_3
	callchannel Music_Route47_Ch4_branch_3
	callchannel Music_Route47_Ch4_branch_4
	note __, 8
	callchannel Music_Route47_Ch4_branch_4
	note __, 8
	callchannel Music_Route47_Ch4_branch_4
	note __, 8
	callchannel Music_Route47_Ch4_branch_4
	loopchannel 0, Music_Route47_Ch4_loop_main
	
Music_Route47_Ch4_branch_1:
	notetype $4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	notetype $c
	endchannel
	
Music_Route47_Ch4_branch_2:
	note C_, 1
	note C#, 1 
	note C#, 1 
	note C_, 1
	note C#, 3
	note C#, 1
	note C#, 1
	note C_, 1
	note C#, 1 
	note C#, 2
	endchannel
	
Music_Route47_Ch4_branch_3:
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 2
	note C#, 1
	note C#, 9
	endchannel
	
Music_Route47_Ch4_branch_4:
	note C#, 2
	note C#, 1
	note C#, 2
	note C#, 3
	endchannel