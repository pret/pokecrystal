Music_Evolution:
	channel_count 4
	channel 1, Music_Evolution_Ch1
	channel 2, Music_Evolution_Ch2
	channel 3, Music_Evolution_Ch3
	channel 4, Music_Evolution_Ch4

Music_Evolution_Ch1:
	tempo 132
	volume 7, 7
	vibrato 6, 3, 4
	pitch_offset 1
	duty_cycle 2
	note_type 12, 9, 2
	octave 3
	pitch_slide 1, 4, A_
	note C_, 1
	pitch_slide 1, 4, A_
	note G_, 1
	pitch_slide 1, 4, A_
	note C_, 1
	pitch_slide 1, 4, A_
	note G_, 1
	rest 4
	duty_cycle 3
	stereo_panning 0, 1
Music_Evolution_branch_f0713:
	sound_call Music_Evolution_branch_f0737
	note_type 12, 10, 4
	note F#, 4
	sound_call Music_Evolution_branch_f0737
	note_type 12, 10, 4
	note F#, 4
	sound_loop 2, Music_Evolution_branch_f0713
	sound_call Music_Evolution_branch_f0743
	note_type 12, 10, 4
	note G#, 4
	sound_call Music_Evolution_branch_f0743
	note_type 12, 10, 4
	note G#, 4
	sound_loop 0, Music_Evolution_branch_f0713

Music_Evolution_branch_f0737:
	note_type 12, 10, 2
	octave 3
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	note G_, 4
	note C_, 4
	sound_ret

Music_Evolution_branch_f0743:
	note_type 12, 10, 2
	octave 3
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	note A_, 4
	note D_, 4
	sound_ret

Music_Evolution_Ch2:
	duty_cycle 2
	vibrato 8, 2, 5
	note_type 12, 10, 2
	octave 4
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	rest 4
	duty_cycle 3
	stereo_panning 1, 0
Music_Evolution_branch_f0761:
	sound_call Music_Evolution_branch_f0787
	note_type 12, 11, 5
	note A_, 4
	sound_call Music_Evolution_branch_f0787
	note_type 12, 11, 5
	note B_, 4
	sound_loop 2, Music_Evolution_branch_f0761
	sound_call Music_Evolution_branch_f0793
	note_type 12, 11, 5
	note B_, 4
	sound_call Music_Evolution_branch_f0793
	note_type 12, 11, 5
	octave 4
	note C#, 4
	octave 3
	sound_loop 0, Music_Evolution_branch_f0761

Music_Evolution_branch_f0787:
	note_type 12, 11, 2
	octave 3
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	note D_, 4
	note G_, 4
	sound_ret

Music_Evolution_branch_f0793:
	note_type 12, 11, 2
	octave 3
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	note E_, 4
	note A_, 4
	sound_ret

Music_Evolution_Ch3:
	note_type 12, 1, 6
	rest 8
Music_Evolution_branch_f07a3:
	sound_call Music_Evolution_branch_f07bf
	octave 3
	note A_, 4
	sound_call Music_Evolution_branch_f07bf
	octave 3
	note B_, 4
	sound_loop 2, Music_Evolution_branch_f07a3
	sound_call Music_Evolution_branch_f07d5
	octave 3
	note B_, 4
	sound_call Music_Evolution_branch_f07d5
	octave 4
	note C#, 4
	sound_loop 0, Music_Evolution_branch_f07a3

Music_Evolution_branch_f07bf:
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	sound_ret

Music_Evolution_branch_f07d5:
	octave 2
	note B_, 2
	rest 2
	octave 3
	note E_, 2
	rest 2
	octave 2
	note B_, 2
	rest 2
	octave 3
	note E_, 2
	rest 2
	octave 2
	note B_, 2
	rest 2
	octave 3
	note E_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	sound_ret

Music_Evolution_Ch4:
	toggle_noise 5
	drum_speed 12
	rest 8
Music_Evolution_branch_f07f0:
	stereo_panning 1, 0
	drum_note 11, 6
	drum_note 11, 4
	stereo_panning 0, 1
	drum_note 5, 2
	drum_note 5, 2
	drum_note 5, 2
	sound_loop 0, Music_Evolution_branch_f07f0

