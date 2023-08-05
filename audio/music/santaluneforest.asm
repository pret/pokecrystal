; by Mmmmmmmmmmmmmmmmm

Music_SantaluneForest:
	musicheader 3, 1, Music_SantaluneForest_Ch1
	musicheader 1, 2, Music_SantaluneForest_Ch2
	musicheader 1, 3, Music_SantaluneForest_Ch3

Music_SantaluneForest_Ch1:
	tempo 152
	volume $77
	vibrato $6, $23
	notetype $c, $92
	dutycycle 0
	octave 3
	note __, 2
	note F_, 2
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	note F_, 2
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	note F_, 2
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	octave 4
	note C_, 2
	note C_, 12
	dutycycle 3
	intensity $77
	octave 5
	note C_, 6
	octave 4
	note G_, 6
	note A#, 6
	note F_, 6
	note G_, 4
	note A#, 4
	octave 5
	note C_, 6
	octave 4
	note G_, 6
	note A#, 6
	note F_, 14
Music_SantaluneForest_Ch1_loop_1:
	dutycycle 0
	intensity $b2
	octave 5
	note C_, 4
	octave 4
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	octave 5
	note C_, 2
	octave 4
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	octave 5
	note C_, 2
	octave 4
	note G_, 4
	note A#, 4
	note F_, 2
	note G_, 4
	note G#, 2
	note G#, 12
	loopchannel 2, Music_SantaluneForest_Ch1_loop_1
	loopchannel 0, Music_SantaluneForest_Ch1

Music_SantaluneForest_Ch2:
	vibrato $8, $24
	notetype $c, $b2
	dutycycle 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note D#, 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note D#, 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note D#, 2
	octave 3
	note C_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	octave 4
	note F_, 2
	note F_, 2
	octave 3
	note C_, 4
	note C_, 4
	note C_, 2
	loopchannel 0, Music_SantaluneForest_Ch2
	
Music_SantaluneForest_Ch3:
	vibrato $16, $15
	notetype $c, $20
	note __, 16
Music_SantaluneForest_Ch3_loop_main:
	note __, 16
	note __, 16
	note __, 16
	note __, 2
Music_SantaluneForest_Ch3_loop_1:
	octave 4
	note C_, 2
	note D#, 2
	note G_, 4
	note C_, 2
	note D#, 2
	note F_, 4
	note C_, 2
	note D#, 2
	note F_, 4
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D#, 4
	loopchannel 6, Music_SantaluneForest_Ch3_loop_1
	note D#, 6
	intensity $30
	note D#, 4
	intensity $20
	note __, 4
	loopchannel 0, Music_SantaluneForest_Ch3_loop_main
