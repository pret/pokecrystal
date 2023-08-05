; by Mmmmmmmmmmmmmmmmm

Music_ShoalCave: 
	musicheader 4, 1, Music_ShoalCave_Ch1
	musicheader 1, 2, Music_ShoalCave_Ch2
	musicheader 1, 3, Music_ShoalCave_Ch3
	musicheader 1, 4, Music_ShoalCave_Ch4

Music_ShoalCave_Ch1: 
	tempo 212
	volume $77
	dutycycle 1
	tone $0002
	vibrato $10, $22
	notetype $6, $63
	note __, 5
Music_ShoalCave_Ch1_loop_main:
Music_ShoalCave_Ch1_loop_1:
	octave 3
	intensity $42
	note C_, 1
	intensity $72
	note D_, 4
	note G#, 4
	note D_, 7
	loopchannel 16, Music_ShoalCave_Ch1_loop_1
Music_ShoalCave_Ch1_loop_2:
	intensity $42
	note D#, 1
	intensity $72
	note F_, 4
	note B_, 4
	note F_, 7
	loopchannel 16, Music_ShoalCave_Ch1_loop_2
	intensity $a3
	note __, 7
Music_ShoalCave_Ch1_loop_3:
	octave 3
	note F#, 1
	note __, 1
	loopchannel 7, Music_ShoalCave_Ch1_loop_3
	note F#, 1
	note G#, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 2
	note D#, 2
	intensity $a0
	note F_, 16
	intensity $a7
	note F_, 12
	intensity $a3
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note __, 2
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $8, $a3
	note A_, 1
	octave 3
	note C_, 1
	note D#, 1
	note A_, 1
	octave 4
	note C_, 1
	note F#, 4
	notetype $6, $a3
	note __, 16
	note __, 15
	loopchannel 0, Music_ShoalCave_Ch1_loop_main


Music_ShoalCave_Ch2:
	dutycycle 2
	vibrato $1c, $12
	notetype $c, $a3
	note __, 1
Music_ShoalCave_Ch2_loop_main:
	dutycycle 2
	callchannel Music_ShoalCave_Ch2_branch_1
	callchannel Music_ShoalCave_Ch2_branch_1
	callchannel Music_ShoalCave_Ch2_branch_2
	callchannel Music_ShoalCave_Ch2_branch_2
	notetype $6, $a3
	note __, 10
Music_ShoalCave_Ch2_loop_1:
	dutycycle 0
	octave 3
	note A#, 1
	note __, 1
	loopchannel 7, Music_ShoalCave_Ch2_loop_1
	note A#, 1
	note B_, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 2
	note F#, 2
	intensity $a0
	note G#, 16
	intensity $a7
	note G#, 12
	intensity $a3
	octave 4
	note D#, 2
	note C_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $8, $a3
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	octave 4
	note C_, 1
	note D#, 1
	note A#, 4
	notetype $c, $a3
	note __, 14
	loopchannel 0, Music_ShoalCave_Ch2_loop_main
	
Music_ShoalCave_Ch2_branch_1:
	octave 3
	intensity $a3
	note G_, 2
	intensity $63
	note G_, 2
	intensity $a3
	note D#, 2
	intensity $63
	note D#, 2
	intensity $a3
	note G_, 2
	intensity $63
	note G_, 2
	intensity $a3
	note G#, 2
	intensity $63
	note G#, 2
	intensity $a3
	note G_, 2
	intensity $63
	note G_, 2
	intensity $a3
	note D#, 2
	intensity $63
	note D#, 2
	intensity $a3
	note D_, 2
	intensity $63
	note D_, 2
	intensity $a3
	note C_, 2
	intensity $63
	note C_, 2
	intensity $a3
	octave 2
	note B_, 2
	intensity $63
	note B_, 2
	intensity $a3
	note G_, 2
	intensity $63
	note G_, 2
	intensity $a3
	note B_, 2
	intensity $63
	note B_, 2
	octave 3
	intensity $a3
	note C_, 2
	intensity $63
	note C_, 2
	intensity $a3
	note D_, 2
	intensity $63
	note D_, 2
	intensity $a3
	note D#, 2
	intensity $63
	note D#, 2
	intensity $a3
	note D_, 2
	intensity $63
	note D_, 2
	intensity $a3
	note G#, 2
	intensity $63
	note G#, 2
	endchannel

Music_ShoalCave_Ch2_branch_2:
	octave 3
	intensity $a3
	note A#, 2
	intensity $63
	note A#, 2
	intensity $a3
	note F#, 2
	intensity $63
	note F#, 2
	intensity $a3
	note A#, 2
	intensity $63
	note A#, 2
	intensity $a3
	note B_, 2
	intensity $63
	note B_, 2
	intensity $a3
	note A#, 2
	intensity $63
	note A#, 2
	intensity $a3
	note F#, 2
	intensity $63
	note F#, 2
	intensity $a3
	note F_, 2
	intensity $63
	note F_, 2
	intensity $a3
	note D#, 2
	intensity $63
	note D#, 2
	intensity $a3
	note D_, 2
	intensity $63
	note D_, 2
	octave 2
	intensity $a3
	note A#, 2
	intensity $63
	note A#, 2
	intensity $a3
	octave 3
	note D_, 2
	intensity $63
	note D_, 2
	intensity $a3
	note D#, 2
	intensity $63
	note D#, 2
	intensity $a3
	note F_, 2
	intensity $63
	note F_, 2
	intensity $a3
	note F#, 2
	intensity $63
	note F#, 2
	intensity $a3
	note F_, 2
	intensity $63
	note F_, 2
	intensity $a3
	note B_, 2
	intensity $63
	note B_, 2
	endchannel



Music_ShoalCave_Ch3:
	notetype $6, $24
Music_ShoalCave_Ch3_loop_main:
Music_ShoalCave_Ch3_loop_1:
	octave 2
	note E_, 1
	note F#, 1
	note G_, 14
	loopchannel 16, Music_ShoalCave_Ch3_loop_1
Music_ShoalCave_Ch3_loop_2:
	octave 2
	note G_, 1
	note A_, 1
	note A#, 14
	loopchannel 16, Music_ShoalCave_Ch3_loop_2
	note G_, 1
	note A_, 1
	notetype $c, $14
	octave 3
	note A#, 2
	octave 2
	note A#, 10
	note A#, 8
	octave 3
	note D_, 1
	octave 2
	note A#, 1
	note A_, 1
	note A#, 1
	octave 3
	note F_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note A#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	octave 2
	note A_, 12
	notetype $8, $14
	note A_, 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	note A#, 4
	notetype $6, $24
	note __, 13
	note __, 13
	loopchannel 0, Music_ShoalCave_Ch3_loop_main
	
Music_ShoalCave_Ch4:
	togglenoise $3
	notetype $c
	note __, 1
;	note C_, 8
;	note C#, 8
;	note D_, 8
;	note D#, 8
;	note E_, 8
;	note F_, 8
;	note F#, 8
;	note G_, 8
;	note G#, 8
;	note A_, 8
;	note A#, 8
;	note B_, 8
Music_ShoalCave_Ch4_loop_main:
Music_ShoalCave_Ch4_loop_1:
	callchannel Music_ShoalCave_Ch4_branch_1
	loopchannel 4, Music_ShoalCave_Ch4_loop_1
Music_ShoalCave_Ch4_loop_2:
	callchannel Music_ShoalCave_Ch4_branch_2
	loopchannel 8, Music_ShoalCave_Ch4_loop_2
Music_ShoalCave_Ch4_loop_3:
	callchannel Music_ShoalCave_Ch4_branch_1
	loopchannel 4, Music_ShoalCave_Ch4_loop_3
Music_ShoalCave_Ch4_loop_4:
	callchannel Music_ShoalCave_Ch4_branch_2
	loopchannel 8, Music_ShoalCave_Ch4_loop_4
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note B_, 8
	loopchannel 0, Music_ShoalCave_Ch4_loop_main
	
Music_ShoalCave_Ch4_branch_1:
	stereopanning $f0
	note G#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	stereopanning $f
	note G#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	endchannel
	
Music_ShoalCave_Ch4_branch_2:
	stereopanning $f0
	note G#, 1
	note F#, 1
	note G#, 1
	note G_, 1
	stereopanning $f
	note G#, 1
	note F#, 1
	note G#, 1
	note G_, 1
	endchannel