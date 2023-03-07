; Composed by Mmmmmmmmmmmmmmmmm
; Source: https://soundcloud.com/mmmmmmmmmmmmmmmmm-1/those-who-inherit-eternity-gbc-8-bit

Music_LookZinnia:
	musicheader 4, 1, Music_LookZinnia_Ch1
	musicheader 1, 2, Music_LookZinnia_Ch2
	musicheader 1, 3, Music_LookZinnia_Ch3
	musicheader 1, 4, Music_LookZinnia_Ch4

Music_LookZinnia_Ch1:
	tempo 176
	volume $77
	dutycycle 0
	tone $0002
	vibrato $8, $15
	notetype $c, $a3
	octave 2
	note B_, 8
Music_LookZinnia_Ch1_loop:
	note __, 4
	octave 3
	note F#, 1
	note G#, 2
	intensity $a6
	note A_, 3
	intensity $a3
	note G#, 2
	note F#, 1
	note G#, 1
	note __, 2
	intensity $a7
	note C#, 8
	intensity $a4
	note F#, 3
	note G#, 3
	note A_, 2
	intensity $a7
	note E_, 6
	note C#, 2
	intensity $a4
	note A_, 3
	note B_, 3
	note A_, 2
	intensity $a7
	note G#, 6
	note F#, 2
	intensity $a4
	note E_, 4
	note G#, 4
	intensity $a3
	note __, 2
	note F#, 1
	note G#, 2
	note A_, 2
	intensity $a5
	note B_, 3
	intensity $a3
	note A_, 2
	note G#, 1
	note A_, 1
	note __, 2
	intensity $a7
	note E_, 8
	intensity $a4
	note F#, 3
	note G#, 3
	note A_, 2
	notetype $6, $a0
	octave 4
	note C_, 1
	note C#, 7
	notetype $c, $a6
	note C#, 4
	intensity $a4
	note C#, 3
	note D_, 3
	note C#, 2
	octave 3
	intensity $a7
	note B_, 6
	intensity $a4
	note G#, 2
	note G#, 4
	note B_, 4
	octave 4
	intensity $60
	note D_, 4
	intensity $6f
	note D_, 4
	intensity $60
	note E_, 4
	intensity $6f
	note E_, 4
	octave 3
	intensity $60
	note A_, 4
	intensity $6f
	note A_, 4
	intensity $60
	note B_, 4
	intensity $6f
	note B_, 4
	intensity $60
	note D_, 4
	intensity $6f
	note D_, 4
	intensity $60
	note C#, 4
	intensity $6f
	note C#, 4
	intensity $60
	note D_, 4
	intensity $6f
	note D_, 4
	intensity $60
	note F_, 4
	intensity $6f
	note F_, 4
	octave 4
	intensity $20
	note D_, 2
	intensity $2e
	note D_, 4
	intensity $a6
	note F#, 2
	note E_, 3
	octave 3
	note B_, 3
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G_, 8
	note D_, 6
	note A_, 2
	note G#, 3
	note F#, 3
	note E_, 2
	note D_, 6
	note A_, 2
	note G#, 4
	note A_, 2
	note B_, 2
	note A_, 6
	octave 4
	note C#, 2
	octave 3
	note B_, 8
	intensity $a0
	note A_, 1
	note __, 2
	note A_, 3
	note G#, 2
	note A_, 1
	note __, 3
	intensity $a6
	note A_, 4
	intensity $a3
	loopchannel 0, Music_LookZinnia_Ch1_loop

Music_LookZinnia_Ch2:
	dutycycle 1
	vibrato $12, $25
	tone $0001
	notetype $c, $b3
	octave 2
	note C#, 1
	octave 3
	note C#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G#, 1
Music_LookZinnia_Ch2_loop_main:
	vibrato $12, $25
	intensity $b0
	octave 3
	note C#, 2
	callchannel Music_LookZinnia_Ch2_branch_1
	notetype $6, $b0
	note C_, 1
	note C#, 7
	notetype $c, $b6
	note C#, 4
	note C#, 3
	note D_, 3
	note C#, 2
	octave 3
	intensity $b7
	note B_, 6
	intensity $b6
	note A_, 2
	note G#, 4
	note B_, 4
	note A_, 1
	note G#, 1
	intensity $b0
	callchannel Music_LookZinnia_Ch2_branch_1
	notetype $6, $b0
	note D#, 1
	note E_, 7
	notetype $c, $b6
	note E_, 4
	note E_, 3
	note F#, 3
	note E_, 2
	intensity $b7
	note E_, 6
	intensity $b3
	octave 3
	note B_, 2
	intensity $b6
	note B_, 4
	octave 4
	note E_, 4
Music_LookZinnia_Ch2_loop_1:
	vibrato $22, $43
	intensity $40
	note F#, 2
	intensity $4e
	note F#, 4
	intensity $c6
	note A_, 2
	note G#, 3
	note E_, 3
	note F#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note F#, 6
	octave 4
	note C#, 2
	octave 3
	note B_, 3
	note A_, 3
	note G#, 2
	note F#, 6
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D_, 2
	note E_, 2
	loopchannel 2, Music_LookZinnia_Ch2_loop_1
	note F#, 6
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note G#, 2
	intensity $d7
	note F#, 1
	note G#, 1
	note __, 1
	note A_, 2
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note __, 3
	note F#, 4
	loopchannel 0, Music_LookZinnia_Ch2_loop_main
	
Music_LookZinnia_Ch2_branch_1:
	note C#, 6
	intensity $b6
	note C#, 6
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	intensity $b0
	note C#, 4
	intensity $b6
	note C#, 4
	note A_, 3
	note B_, 3
	octave 4
	note C#, 2
	endchannel

Music_LookZinnia_Ch3:
	notetype $c, $14
	vibrato $12, $15
	octave 2
	note G#, 2
	note __, 6
Music_LookZinnia_Ch3_loop:
	callchannel Music_LookZinnia_Ch3_branch_1
	octave 1
	note B_, 2
	note __, 2
	octave 2
	callchannel Music_LookZinnia_Ch3_branch_1
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	callchannel Music_LookZinnia_Ch3_branch_2
	octave 1
	note B_, 2
	note __, 2
	note F#, 2
	note B_, 2
	octave 2
	note C#, 2
	note __, 2
	note G#, 2
	note C#, 2
	callchannel Music_LookZinnia_Ch3_branch_2
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note F#, 2
	octave 1
	note B_, 2
	octave 2
	note C#, 2
	note __, 2
	note G#, 2
	note C#, 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	note F#, 1
	note __, 2
	note F#, 3
	note E_, 2
	note F#, 1
	note __, 3
	note F#, 2
	note __, 2
	loopchannel 0, Music_LookZinnia_Ch3_loop
	
Music_LookZinnia_Ch3_branch_1:
	note F#, 2
	note __, 2
	note C#, 2
	note __, 2
	note F#, 2
	note __, 2
	note C#, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note A_, 2
	note __, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	note __, 2
	octave 2
	note E_, 2
	note __, 2
	endchannel
	
Music_LookZinnia_Ch3_branch_2:
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note E_, 2
	note __, 2
	octave 1
	note B_, 2
	octave 2
	note E_, 2
	note F#, 2
	note __, 2
	note C#, 2
	note __, 2
	note G_, 2
	note __, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note __, 2
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note C#, 2
	note __, 2
	octave 1
	note G#, 2
	octave 2
	note C#, 2
	endchannel
	
Music_LookZinnia_Ch4:
	togglenoise $3
	notetype $c
	note B_, 8
Music_LookZinnia_Ch4_loop_main:
Music_LookZinnia_Ch4_loop_1:
	note C_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	loopchannel 8, Music_LookZinnia_Ch4_loop_1
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
Music_LookZinnia_Ch4_loop_2:
	note C_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	loopchannel 7, Music_LookZinnia_Ch4_loop_2
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
Music_LookZinnia_Ch4_loop_3:
	note C_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	loopchannel 7, Music_LookZinnia_Ch4_loop_3	
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
Music_LookZinnia_Ch4_loop_4:
	note C_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	loopchannel 7, Music_LookZinnia_Ch4_loop_4
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 2
	note C_, 2
	note C#, 1
	note C_, 2
	note C#, 1
	note C_, 2
	note B_, 2
	note C#, 1
	note C#, 1
	note C_, 4
	loopchannel 0, Music_LookZinnia_Ch4_loop_main