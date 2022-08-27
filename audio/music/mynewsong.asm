Music_MyNewSong:

    channel_count 1
    channel 1, Music_MyNewSong_Ch1

    db $3

Music_MyNewSong_Ch1:
    volume 7,7
    tempo 107
.mainloop:
    sound_call .loop1
.loop1:
    note_type 12, 10, 3
	octave 4
	note C_, 2
	note D_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note D_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 2
	
    sound_loop 4, .loop1

.loop2:
	note_type 6, 10, 0
	
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	;-
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	note D#, 2
	note D#, 2
	note C_, 2
	note C_, 2
	;-
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	;-
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note G_, 2
	note C_, 2
	note C_, 2
	;-
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	;-
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	note F_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	;-
	octave 4
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	note G_, 2
	note F_, 2
	octave 4
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	note C_, 2
	octave 3
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	octave 4
	note C_, 2
	note G#, 2
	;-
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	;-
	sound_loop 2, .loop2
	sound_call .mainloop