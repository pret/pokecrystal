Music_BurnedTower:
	channel_count 4
	channel 1, Music_BurnedTower_Ch1
	channel 2, Music_BurnedTower_Ch2
	channel 3, Music_BurnedTower_Ch3
	channel 4, Music_BurnedTower_Ch4

Music_BurnedTower_Ch1:
	tempo 168
	volume 7, 7
	duty_cycle 1
	pitch_offset 4
	vibrato 8, 4, 5
	stereo_panning 1, 0
	note_type 12, 9, 1
	rest 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 8, 0
	octave 3
	note D#, 6
	volume_envelope 9, 1
	note D_, 4
	note D_, 4
	note D_, 2
	volume_envelope 8, 0
	note C#, 6
Music_BurnedTower_branch_f6ac8:
	volume_envelope 9, 1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 8, 0
	note A#, 6
	sound_loop 2, Music_BurnedTower_branch_f6ac8
	tempo 150
Music_BurnedTower_branch_f6ad8:
	volume_envelope 11, 1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 10, 0
	octave 3
	note D#, 6
	volume_envelope 11, 1
	note D_, 4
	note D_, 4
	note D_, 2
	volume_envelope 10, 0
	note C#, 6
	volume_envelope 11, 1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 10, 0
	note A#, 6
	volume_envelope 11, 1
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 11, 3
	note A#, 16
	note A#, 16
	note A#, 16
	note G#, 6
	volume_envelope 11, 1
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 10, 0
	note A#, 6
	volume_envelope 11, 1
	note B_, 4
	note B_, 4
	note B_, 2
	volume_envelope 10, 0
	octave 3
	note F_, 6
	volume_envelope 11, 1
	note E_, 4
	note E_, 4
	note E_, 2
	volume_envelope 10, 0
	note D#, 6
Music_BurnedTower_branch_f6b17:
	volume_envelope 11, 1
	octave 2
	note B_, 4
	note B_, 4
	note B_, 2
	volume_envelope 10, 0
	octave 3
	note C_, 6
	sound_loop 2, Music_BurnedTower_branch_f6b17
	sound_loop 0, Music_BurnedTower_branch_f6ad8

Music_BurnedTower_Ch2:
	duty_cycle 2
	vibrato 32, 8, 2
	pitch_offset 2
	note_type 12, 7, 0
	sound_call Music_BurnedTower_branch_f6b8e
	volume_envelope 12, 5
Music_BurnedTower_branch_f6b39:
	sound_call Music_BurnedTower_branch_f6b8e
	volume_envelope 12, 1
	duty_cycle 3
	rest 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 11, 0
	octave 3
	note D#, 6
	volume_envelope 12, 1
	note D_, 4
	note D_, 4
	note D_, 2
	volume_envelope 11, 0
	note C#, 6
	volume_envelope 12, 1
	octave 2
	note A_, 4
	note A_, 4
	note A_, 2
	volume_envelope 11, 0
	note A#, 4
	volume_envelope 12, 1
	volume_envelope 12, 2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C_, 1
	vibrato 0, 0, 0
	volume_envelope 3, -5
	note E_, 8
	vibrato 32, 8, 3
	volume_envelope 11, 0
	octave 2
	note G_, 4
	duty_cycle 2
	volume_envelope 11, 0
	octave 3
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note B_, 4
	octave 4
	note C#, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note E_, 4
	volume_envelope 11, 7
	note F#, 16
	sound_loop 0, Music_BurnedTower_branch_f6b39

Music_BurnedTower_branch_f6b8e:
	octave 3
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note A_, 4
	note F_, 4
	note E_, 4
	note D_, 2
	note E_, 2
	note F_, 4
	note D_, 4
	note E_, 16
	sound_ret

Music_BurnedTower_Ch3:
	stereo_panning 0, 1
	note_type 12, 1, 4
	rest 16
	rest 16
	rest 16
	rest 12
	octave 3
	note D#, 4
Music_BurnedTower_branch_f6bad:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	note F_, 4
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	note D#, 4
	sound_loop 4, Music_BurnedTower_branch_f6bad
Music_BurnedTower_branch_f6bc3:
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	note G_, 4
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	note F_, 4
	sound_loop 2, Music_BurnedTower_branch_f6bc3
	sound_loop 0, Music_BurnedTower_branch_f6bad

Music_BurnedTower_Ch4:
	toggle_noise 0
	dspeed 12
Music_BurnedTower_branch_f6be1:
	rest 16
	sound_loop 4, Music_BurnedTower_branch_f6be1
	rest 2
Music_BurnedTower_branch_f6be7:
	stereo_panning 1, 0
	dnote 8, 2
	dnote 9, 2
	dnote 8, 4
	dnote 9, 2
	dnote 8, 4
	sound_loop 0, Music_BurnedTower_branch_f6be7

