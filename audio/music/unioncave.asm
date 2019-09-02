Music_UnionCave:
	channel_count 4
	channel 1, Music_UnionCave_Ch1
	channel 2, Music_UnionCave_Ch2
	channel 3, Music_UnionCave_Ch3
	channel 4, Music_UnionCave_Ch4

Music_UnionCave_Ch1:
	tempo 160
	volume 7, 7
	duty_cycle 1
	pitch_offset 2
	vibrato 24, 3, 4
	stereo_panning 0, 1
Music_UnionCave_branch_f5c7b:
	note_type 12, 11, 3
Music_UnionCave_branch_f5c7e:
	sound_call Music_UnionCave_branch_f5ccf
	sound_loop 4, Music_UnionCave_branch_f5c7e
Music_UnionCave_branch_f5c85:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 4
	note C#, 2
	note E_, 2
	note F_, 4
	sound_loop 8, Music_UnionCave_branch_f5c85
Music_UnionCave_branch_f5c91:
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note F_, 4
	note D_, 2
	note F_, 2
	note F#, 4
	sound_loop 4, Music_UnionCave_branch_f5c91
	rest 4
	volume_envelope 8, 0
	note F_, 16
	note F#, 16
	note G_, 16
	note F#, 16
	note G_, 8
	note F#, 8
	note F_, 8
	note E_, 8
	note G_, 8
	note F#, 8
	octave 4
	note C_, 8
	octave 3
	note A_, 8
	volume_envelope 9, 5
	pitch_offset 4
	sound_call Music_UnionCave_branch_f5ccf
	pitch_offset 8
	sound_call Music_UnionCave_branch_f5ccf
	pitch_offset 12
	sound_call Music_UnionCave_branch_f5ccf
	pitch_offset 16
	sound_call Music_UnionCave_branch_f5ccf
	pitch_offset 2
	sound_loop 0, Music_UnionCave_branch_f5c7b

Music_UnionCave_branch_f5ccf:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	sound_ret

Music_UnionCave_Ch2:
	duty_cycle 3
	vibrato 8, 2, 4
Music_UnionCave_branch_f5cda:
	note_type 12, 12, 4
	sound_call Music_UnionCave_branch_f5d34
	volume_envelope 12, 5
	sound_call Music_UnionCave_branch_f5d34
	volume_envelope 12, 7
	sound_call Music_UnionCave_branch_f5d34
	volume_envelope 12, 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note D_, 8
	octave 3
	note B_, 4
	octave 4
	note D_, 4
	note F#, 2
	note F_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 8
	note D_, 4
	note C#, 4
	rest 4
	volume_envelope 10, 0
	note C_, 16
	note C#, 16
	note D_, 16
	note C#, 16
	note E_, 16
	note D#, 16
	note A#, 16
	note A_, 16
	volume_envelope 10, 5
	vibrato 6, 4, 4
	sound_call Music_UnionCave_branch_f5d52
	vibrato 4, 3, 3
	sound_call Music_UnionCave_branch_f5d52
	vibrato 2, 2, 2
	sound_call Music_UnionCave_branch_f5d52
	vibrato 1, 4, 1
	sound_call Music_UnionCave_branch_f5d52
	vibrato 8, 2, 4
	sound_loop 0, Music_UnionCave_branch_f5cda

Music_UnionCave_branch_f5d34:
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 2
	note D#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 8
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note F_, 2
	note E_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note C#, 4
	note C_, 4
	sound_ret

Music_UnionCave_branch_f5d52:
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	note E_, 12
	sound_ret

Music_UnionCave_Ch3:
	note_type 12, 1, 6
	stereo_panning 1, 0
Music_UnionCave_branch_f5d5d:
	rest 16
	sound_loop 7, Music_UnionCave_branch_f5d5d
	rest 14
	octave 4
	note C_, 2
Music_UnionCave_branch_f5d65:
	rest 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	note G#, 2
	note E_, 2
	rest 2
	octave 4
	note C_, 2
	sound_loop 4, Music_UnionCave_branch_f5d65
Music_UnionCave_branch_f5d73:
	rest 2
	octave 3
	note F_, 2
	rest 2
	note F_, 2
	note A_, 2
	note F_, 2
	rest 2
	octave 4
	note C#, 2
	sound_loop 4, Music_UnionCave_branch_f5d73
	rest 4
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
	note A_, 8
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note B_, 8
	note A#, 8
Music_UnionCave_branch_f5d8d:
	note A_, 4
	note G_, 4
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note G_, 2
	sound_loop 3, Music_UnionCave_branch_f5d8d
	note A_, 4
	note G_, 4
	note A#, 8
Music_UnionCave_branch_f5d9c:
	rest 16
	sound_loop 4, Music_UnionCave_branch_f5d9c
	sound_loop 0, Music_UnionCave_branch_f5d5d

Music_UnionCave_Ch4:
	toggle_noise 1
	dspeed 12
Music_UnionCave_branch_f5da9:
	stereo_panning 1, 0
	dnote 5, 4
	stereo_panning 1, 1
	dnote 6, 4
	stereo_panning 0, 1
	dnote 9, 4
	rest 8
	stereo_panning 0, 1
	dnote 5, 4
	stereo_panning 1, 1
	dnote 6, 4
	stereo_panning 1, 0
	dnote 9, 4
	rest 8
	sound_loop 0, Music_UnionCave_branch_f5da9
	sound_loop 0, Music_UnionCave_branch_f5da9

