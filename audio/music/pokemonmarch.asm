Music_PokemonMarch:
	musicheader 4, 1, Music_PokemonMarch_Ch1
	musicheader 1, 2, Music_PokemonMarch_Ch2
	musicheader 1, 3, Music_PokemonMarch_Ch3
	musicheader 1, 4, Music_PokemonMarch_Ch4

Music_PokemonMarch_Ch1:
	tempo 144
	volume $77
	stereopanning $f0
	dutycycle $3
	tone $0001
	notetype $c, $42
	octave 3
	note D_, 4
	intensity $62
	note D_, 4
	intensity $82
	note D_, 4
	intensity $a2
	note D_, 4
	notetype $8, $a2
.mainloop:
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	callchannel .sub1
	note C_, 2
	note C_, 2
	note D#, 2
	note C_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note A_, 2
	callchannel .sub2
	note D_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	callchannel .sub2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	callchannel .sub1
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 2
	note A#, 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	note __, 4
	note D#, 2
	note __, 4
	octave 3
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 4
	note F_, 2
	note G_, 4
	note A#, 2
	loopchannel 0, .mainloop

.sub1:
	note __, 4
	octave 3
	note D#, 1
	note D_, 1
	note D#, 2
	note __, 2
	note D#, 2
	note D#, 2
	note __, 2
	endchannel

.sub2:
	note __, 4
	note F_, 1
	note E_, 1
	note F_, 2
	note __, 2
	note F_, 2
	note F_, 2
	note __, 2
	endchannel

Music_PokemonMarch_Ch2:
	dutycycle $2
	vibrato $10, $22
	notetype $c, $b2
	octave 3
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
.mainloop:
	notetype $c, $b7
	octave 3
	note G#, 12
	notetype $8, $b3
	note D#, 2
	note G#, 2
	note A#, 2
	octave 4
	note C_, 2
	note __, 16
	note __, 6
	notetype $8, $b7
	octave 3
	note G#, 16
	notetype $8, $b3
	note D#, 2
	note G#, 4
	note A#, 2
	octave 4
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
	notetype $8, $b7
	note A#, 16
	notetype $8, $b3
	note A#, 2
	note F_, 2
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note __, 16
	note __, 6
	notetype $8, $b7
	octave 3
	note A#, 16
	notetype $8, $b3
	note F_, 2
	note A#, 4
	octave 4
	note C_, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	notetype $8, $b7
	note A#, 16
	notetype $8, $b3
	note A_, 2
	note A#, 4
	octave 4
	note C_, 2
	notetype $8, $b7
	octave 3
	note G#, 16
	notetype $8, $b3
	note A#, 2
	note G#, 4
	note F_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note D_, 1
	note D#, 1
	note __, 5
	octave 3
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note __, 2
	octave 4
	note G_, 1
	note F#, 1
	note G_, 1
	note __, 5
	loopchannel 0, .mainloop

Music_PokemonMarch_Ch3:
	stereopanning $f
	notetype $c, $16
	note __, 16
	notetype $8, $16
.mainloop:
	callchannel .sub1
	note __, 2
	octave 4
	note D#, 2
	callchannel .sub1
	octave 4
	note G#, 2
	note D#, 2
	callchannel .sub1
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note G_, 2
	note G#, 2
.loop1:
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note A_, 2
	note __, 1
	octave 4
	note F_, 2
	note __, 1
	loopchannel 3, .loop1
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A#, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 4
	note F_, 2
	octave 3
	note F_, 2
	note G_, 2
	note A#, 2
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note C_, 2
	note D#, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note __, 4
	octave 3
	note D#, 2
	note __, 4
	octave 4
	note G_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note __, 2
	note D#, 2
	note F_, 2
	note __, 2
	note G#, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note G#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note F_, 2
	note __, 2
	octave 4
	note D#, 2
	octave 3
	note G_, 2
	endchannel

Music_PokemonMarch_Ch4:
	stereopanning $f0
	togglenoise $5
	notetype $8
	callchannel .sub2
.mainloop:
	callchannel .sub1
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 5
	notetype $6
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	notetype $8
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub2
	callchannel .sub1
	callchannel .sub2
	note C#, 4
	note C#, 2
	note C#, 4
	note C#, 2
	note C#, 6
	note C_, 2
	notetype $4
	note __, 5
	notetype $6
	note D_, 1
	note D_, 1
	notetype $8
	callchannel .sub2
	loopchannel 0, .mainloop

.sub1:
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 2
	note C_, 4
	note D_, 2
	note D_, 2
	note C#, 2
	note C#, 2
	endchannel

.sub2:
	note C_, 4
	note C_, 2
	note C_, 4
	note C_, 4
	note C_, 4
	note C#, 2
	note D_, 2
	note C#, 2
	endchannel
