Music_MobileAdapterMenu:
	musicheader 3, 1, Music_MobileAdapterMenu_Ch1
	musicheader 1, 2, Music_MobileAdapterMenu_Ch2
	musicheader 1, 3, Music_MobileAdapterMenu_Ch3

Music_MobileAdapterMenu_Ch1:
	tempo 168
	volume $77
	tone $0001
	stereopanning $f
	dutycycle $2
	notetype $c, $66
	note __, 2
.mainloop:
	callchannel .sub1
	callchannel .sub2
	octave 3
	note F#, 4
	note B_, 4
	note F#, 2
	note B_, 1
	note __, 1
	note D#, 4
	callchannel .sub2
	octave 3
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 3
	note E_, 1
	note D#, 8
	callchannel .sub1
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note F#, 4
	note E_, 8
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note D#, 4
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note F#, 4
	note A_, 2
	note E_, 2
	note A_, 3
	note A_, 1
	note G#, 8
	endchannel

.sub2:
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A_, 2
	octave 4
	note E_, 1
	note __, 1
	note C#, 4
	endchannel

Music_MobileAdapterMenu_Ch2:
	stereopanning $f0
	notetype $c, $84
	dutycycle $2
	octave 4
	note E_, 1
	note G#, 1
.mainloop:
	callchannel .sub1
	note E_, 8
	callchannel .sub2
	note D#, 2
	note C#, 2
	note D#, 3
	note E_, 1
	note F#, 8
	callchannel .sub2
	note D#, 2
	note E_, 2
	note F#, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	callchannel .sub1
	note E_, 6
	note E_, 1
	note G#, 1
	loopchannel 0, .mainloop

.sub1:
	octave 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 3
	note G#, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	note D#, 2
	note E_, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 3
	note G#, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 3
	note D#, 1
	endchannel

.sub2:
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 3
	note F#, 1
	note E_, 2
	note A_, 1
	note __, 1
	note E_, 4
	endchannel

Music_MobileAdapterMenu_Ch3:
	vibrato $8, $34
	notetype $c, $25
	note __, 2
.mainloop:
	callchannel .sub1
	octave 2
	note B_, 1
	note G#, 1
	callchannel .sub2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 1
	note D#, 1
	note F#, 2
	note D#, 1
	note __, 1
	octave 2
	note B_, 2
	note F#, 1
	note G#, 1
	callchannel .sub2
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 1
	note D#, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note F#, 4
	callchannel .sub1
	note __, 2
	loopchannel 0, .mainloop

.sub1:
	octave 3
	note E_, 2
	note __, 2
	note B_, 2
	note __, 1
	note G#, 1
	note D#, 1
	note __, 1
	note B_, 1
	note __, 1
	note D#, 4
	note C#, 2
	note __, 2
	note A_, 2
	note __, 1
	note F#, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note F#, 4
	note E_, 2
	note __, 2
	note B_, 2
	note __, 1
	note G#, 1
	note D#, 1
	note __, 1
	note B_, 1
	note __, 1
	note D#, 4
	note C#, 2
	note __, 2
	note A_, 2
	note __, 1
	note C#, 1
	note E_, 3
	intensity $35
	note E_, 3
	intensity $25
	endchannel

.sub2:
	note A_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 1
	note C#, 1
	note A_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A_, 4
	endchannel
