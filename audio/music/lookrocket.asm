Music_LookRocket:
	channel_count 4
	channel 1, Music_LookRocket_Ch1
	channel 2, Music_LookRocket_Ch2
	channel 3, Music_LookRocket_Ch3
	channel 4, Music_LookRocket_Ch4

Music_LookRocket_Ch1:
	tempo 123
	volume 7, 7
	transpose 0, 2
	stereo_panning FALSE, TRUE
	duty_cycle 3
	vibrato 5, 6, 4
	note_type 12, 10, 8
	octave 4
	note C_, 1
	note D_, 1
	sound_call Music_LookRocket_branch_f74e6
	duty_cycle 1
Music_LookRocket_branch_f74c7:
	volume_envelope 10, 8
	sound_call Music_LookRocket_branch_f74f7
	sound_call Music_LookRocket_branch_f758a
	octave 4
	note F#, 1
	rest 1
	volume_envelope 5, 3
	sound_call Music_LookRocket_branch_f750c
	volume_envelope 12, 3
	sound_call Music_LookRocket_branch_f750c
	volume_envelope 14, 3
	sound_call Music_LookRocket_branch_f750c
	rest 16
	sound_loop 0, Music_LookRocket_branch_f74c7

Music_LookRocket_branch_f74e6:
Music_RocketTheme_branch_f74e6:
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	note C_, 1
	rest 3
	octave 2
	note F_, 1
	note G#, 1
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	sound_ret

Music_LookRocket_branch_f74f7:
Music_RocketTheme_branch_f74f7:
	rest 2
	octave 3
	note D#, 1
	rest 5
	note D#, 4
	octave 2
	note A_, 2
	octave 3
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	rest 3
	note F#, 1
	rest 1
	note D#, 1
	rest 1
	octave 4
	note F#, 1
	rest 1
	sound_ret

Music_LookRocket_branch_f750c:
Music_RocketTheme_branch_f750c:
	rest 2
	octave 2
	note B_, 1
	rest 7
	octave 3
	note C_, 1
	rest 5
	sound_ret

Music_LookRocket_Ch2:
	transpose 0, 2
	vibrato 4, 6, 4
	duty_cycle 3
	note_type 12, 11, 7
	stereo_panning TRUE, TRUE
	octave 5
	note C_, 1
	note D_, 1
	sound_call Music_LookRocket_branch_f7547
Music_LookRocket_branch_f7526:
	volume_envelope 11, 7
	sound_call Music_LookRocket_branch_f758a
	octave 5
	note C_, 1
	rest 1
	sound_call Music_LookRocket_branch_f7554
	volume_envelope 5, 3
	sound_call Music_LookRocket_branch_f7568
	volume_envelope 12, 3
	sound_call Music_LookRocket_branch_f7568
	volume_envelope 14, 3
	sound_call Music_LookRocket_branch_f7568
	sound_call Music_LookRocket_branch_f756f
	sound_loop 0, Music_LookRocket_branch_f7526

Music_LookRocket_branch_f7547:
Music_RocketTheme_branch_f7547:
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	note C_, 1
	rest 3
	octave 3
	note B_, 6
	duty_cycle 0
	sound_ret

Music_LookRocket_branch_f7554:
Music_RocketTheme_branch_f7554:
	rest 2
	octave 4
	note D#, 1
	rest 5
	note F_, 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 6
	note D#, 1
	rest 3
	note F#, 1
	rest 1
	note D#, 1
	rest 1
	octave 5
	note D#, 1
	rest 1
	sound_ret

Music_LookRocket_branch_f7568:
Music_RocketTheme_branch_f7568:
	rest 2
	octave 3
	note F_, 1
	rest 7
	note F#, 1
	rest 5
	sound_ret

Music_LookRocket_branch_f756f:
Music_RocketTheme_branch_f756f:
	volume_envelope 6, 3
	note G#, 1
	note F_, 1
	note D_, 1
	octave 2
	note B_, 1
	volume_envelope 10, 3
	octave 3
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	volume_envelope 12, 3
	note A#, 1
	note G_, 1
	note E_, 1
	note C#, 1
	volume_envelope 15, 3
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	sound_ret

Music_LookRocket_branch_f758a:
Music_RocketTheme_branch_f758a:
	octave 3
	rest 2
	note G_, 1
	rest 5
	note A_, 8
	note A#, 6
	note A_, 1
	rest 3
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

Music_LookRocket_Ch3:
	transpose 0, 2
	vibrato 4, 2, 2
	note_type 12, 1, 4
	stereo_panning TRUE, FALSE
	rest 2
	sound_call Music_LookRocket_branch_f75bf
Music_LookRocket_branch_f75a5:
	sound_call Music_LookRocket_branch_f75fe
	sound_call Music_LookRocket_branch_f75fe
	volume_envelope 2, 4
	sound_call Music_LookRocket_branch_f7623
	volume_envelope 1, 4
	sound_call Music_LookRocket_branch_f75cc
	sound_call Music_LookRocket_branch_f7623
	sound_call Music_LookRocket_branch_f75e1
	sound_loop 0, Music_LookRocket_branch_f75a5

Music_LookRocket_branch_f75bf:
Music_RocketTheme_branch_f75bf:
	octave 3
	note F_, 1
	rest 1
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D_, 1
	rest 3
	octave 3
	note D_, 6
	sound_ret

Music_LookRocket_branch_f75cc:
Music_RocketTheme_branch_f75cc:
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	note C_, 1
	rest 1
	note F#, 1
	rest 1
	sound_ret

Music_LookRocket_branch_f75e1:
Music_RocketTheme_branch_f75e1:
	volume_envelope 2, 4
	octave 2
	note G#, 1
	rest 1
	octave 3
	note F_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note F#, 1
	rest 1
	volume_envelope 1, 4
	octave 2
	note A#, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	sound_ret

Music_LookRocket_branch_f75fe:
Music_RocketTheme_branch_f75fe:
	note C_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note D#, 1
	rest 1
	note G_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

Music_LookRocket_branch_f7623:
Music_RocketTheme_branch_f7623:
	octave 2
	note G#, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	note G#, 1
	note F#, 1
	note D#, 1
	note C_, 1
	sound_ret

Music_LookRocket_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 2
	sound_call Music_LookRocket_branch_f765c
Music_LookRocket_branch_f7640:
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f7664
	sound_call Music_LookRocket_branch_f765c
	sound_loop 0, Music_LookRocket_branch_f7640

Music_LookRocket_branch_f765c:
Music_RocketTheme_branch_f765c:
	drum_note 1, 8
	drum_note 3, 2
	drum_note 4, 2
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 3, 1
	sound_ret

Music_LookRocket_branch_f7664:
Music_RocketTheme_branch_f7664:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_ret

