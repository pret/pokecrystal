Music_GymLeaderVictory:
	musicheader 4, 1, Music_GymLeaderVictory_Ch1
	musicheader 1, 2, Music_GymLeaderVictory_Ch2
	musicheader 1, 3, Music_GymLeaderVictory_Ch3
	musicheader 1, 4, Music_GymLeaderVictory_Ch4

Music_GymLeaderVictory_Ch1:
	tempo 116
	volume $77
	vibrato $12, $34
	dutycycle $3
	tone $0001
	notetype $c, $b7
	octave 4
	note D_, 6
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 6
	note D_, 1
	note F#, 1
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	stereopanning $f
.mainloop:
.loop1:
	dutycycle $1
	callchannel .sub1
	octave 4
	note C#, 4
	note E_, 4
	callchannel .sub1
	note F#, 8
	loopchannel 2, .loop1
	dutycycle $2
	callchannel .sub2
	note A_, 4
	note G_, 4
	note F#, 6
	note D_, 1
	note E_, 1
	note F#, 6
	note E_, 2
	note D_, 8
	note C#, 8
	dutycycle $3
	callchannel .sub2
	note C#, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	note A_, 6
	note G_, 2
	intensity $87
	note F#, 16
	loopchannel 0, .mainloop

.sub1:
	intensity $91
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 1
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note E_, 1
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 1
	note D_, 1
	endchannel

.sub2:
	intensity $87
	octave 3
	note F#, 14
	note D_, 1
	note F#, 1
	note A_, 8
	note F#, 4
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 14
	note E_, 1
	note G#, 1
	note B_, 8
	octave 4
	note D_, 4
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 14
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 8
	endchannel

Music_GymLeaderVictory_Ch2:
	vibrato $12, $34
	dutycycle $3
	notetype $c, $d7
	octave 4
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 6
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note F#, 16
.mainloop:
	dutycycle $3
	intensity $a1
	callchannel .sub1
	note A_, 4
	note A_, 4
	callchannel .sub1
	note D_, 6
	dutycycle $2
	note B_, 1
	octave 5
	note C#, 1
	callchannel .sub1
	note A_, 4
	note A_, 4
	callchannel .sub1
	note D_, 8
	dutycycle $3
	callchannel .sub2
	note F#, 4
	note E_, 4
	note D_, 14
	octave 4
	note B_, 2
	intensity $a7
	note A_, 16
	dutycycle $2
	callchannel .sub2
	octave 4
	note A_, 4
	octave 5
	note C#, 4
	note D_, 14
	note E_, 2
	intensity $a6
	note D_, 12
	note __, 2
	dutycycle $3
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	loopchannel 0, .mainloop

.sub1:
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 4
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	note A_, 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	endchannel

.sub2:
	intensity $98
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	note D_, 16
	octave 4
	note B_, 6
	note G#, 1
	note B_, 1
	octave 5
	note E_, 8
	note E_, 16
	octave 4
	note G_, 6
	note E_, 1
	note G_, 1
	octave 5
	note C#, 8
	note C#, 8
	endchannel

Music_GymLeaderVictory_Ch3:
	notetype $c, $25
	octave 3
	note F#, 16
	note D_, 10
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	stereopanning $f0
.mainloop:
.loop1:
	note D_, 2
	note __, 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note A_, 2
	note B_, 2
	note __, 4
	note G_, 2
	note A_, 2
	note __, 2
	octave 3
	note C#, 4
	note D_, 2
	note __, 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note A_, 2
	note B_, 2
	note __, 4
	note G_, 2
	octave 3
	note D_, 2
	note __, 6
	loopchannel 2, .loop1
	callchannel .sub1
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	callchannel .sub1
	octave 3
	note D_, 2
	note __, 2
	note G_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note G_, 2
	note E_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	note __, 2
	note D_, 2
	note F#, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	octave 4
	note E_, 2
	note __, 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note __, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	note __, 2
	note A_, 2
	octave 3
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	endchannel

Music_GymLeaderVictory_Ch4:
	togglenoise $4
	notetype $c
	note B_, 16
	note B_, 16
.mainloop:
	callchannel .sub1
	note D#, 6
	note D#, 2
	note D#, 8
	callchannel .sub1
	note D#, 6
	note D#, 2
	note D#, 4
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
.loop1:
	note D#, 2
	note G_, 2
	note D_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note D_, 2
	note G_, 2
	loopchannel 16, .loop1
	loopchannel 0, .mainloop

.sub1:
.sub1loop1:
	note D#, 6
	note D#, 2
	note D#, 4
	note D_, 2
	note D#, 2
	loopchannel 3, .sub1loop1
	endchannel
