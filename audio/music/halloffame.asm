Music_HallOfFame:
	musicheader 4, 1, Music_HallOfFame_Ch1
	musicheader 1, 2, Music_HallOfFame_Ch2
	musicheader 1, 3, Music_HallOfFame_Ch3
	musicheader 1, 4, Music_HallOfFame_Ch4

Music_HallOfFame_Ch1:
	tempo 112
	volume $77
	dutycycle $2
	vibrato $c, $22
	tone $0001
	stereopanning $f0
	notetype $c, $93
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	octave 3
	note D_, 1
	note E_, 1
	note F_, 1
	note F#, 1
.mainloop:
.loop1:
	intensity $97
	octave 4
	note C_, 8
	intensity $77
	note C_, 8
	intensity $97
	note E_, 8
	intensity $77
	note E_, 8
	intensity $97
	note F#, 8
	intensity $77
	note F#, 8
	intensity $77
	note F_, 8
	intensity $57
	note F_, 8
	loopchannel 3, .loop1
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	loopchannel 0, .mainloop

Music_HallOfFame_Ch2:
	vibrato $8, $25
	dutycycle $3
.mainloop:
	notetype $c, $c4
	octave 3
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note G_, 2
	note D_, 2
	note G_, 2
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 10
	note F_, 2
	note C_, 2
	note F_, 2
	note A#, 4
	note A_, 4
	note F_, 2
	loopchannel 0, .mainloop

Music_HallOfFame_Ch3:
.mainloop:
	notetype $c, $28
.loop1:
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	loopchannel 3, .loop1
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	note F#, 4
	note A_, 4
	note F#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note G_, 4
	loopchannel 0, .mainloop

Music_HallOfFame_Ch4:
	togglenoise $5
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 16
	notetype $6
.mainloop:
	stereopanning $f
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	note A#, 4
	stereopanning $f0
	note A_, 2
	note A_, 2
	note A#, 2
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 8
	note A#, 4
	note A#, 4
	stereopanning $f
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	loopchannel 0, .mainloop
