Music_LookKimonoGirl:
	channel_count 3
	channel 1, Music_LookKimonoGirl_Ch1
	channel 2, Music_LookKimonoGirl_Ch2
	channel 3, Music_LookKimonoGirl_Ch3

	db $3

Music_LookKimonoGirl_Ch1:
	tempo 160
	volume 7, 7
	stereo_panning 0, 1
	duty_cycle 1
	note_type 6, 8, 7
	pitch_offset 1
	sound_call Music_LookKimonoGirl_branch_f7aa8
	pitch_offset 0
Music_LookKimonoGirl_branch_f79d7:
	note_type 12, 11, 2
	sound_call Music_LookKimonoGirl_branch_f7a13
	sound_call Music_LookKimonoGirl_branch_f7a13
	sound_call Music_LookKimonoGirl_branch_f7a34
	sound_call Music_LookKimonoGirl_branch_f7a34
	sound_call Music_LookKimonoGirl_branch_f7a13
	sound_call Music_LookKimonoGirl_branch_f7a13
	sound_call Music_LookKimonoGirl_branch_f7a34
	volume_envelope 11, 4
	octave 3
	note E_, 1
	volume_envelope 5, 4
	octave 4
	note E_, 1
	volume_envelope 11, 4
	octave 3
	note D_, 1
	volume_envelope 5, 4
	octave 4
	note D_, 1
	volume_envelope 11, 4
	octave 2
	note B_, 1
	volume_envelope 5, 4
	octave 3
	note B_, 1
	volume_envelope 11, 4
	octave 2
	note A_, 1
	volume_envelope 5, 4
	octave 3
	note A_, 1
	sound_loop 0, Music_LookKimonoGirl_branch_f79d7

Music_LookKimonoGirl_branch_f7a13:
	volume_envelope 11, 4
	octave 2
	note F_, 1
	volume_envelope 7, 4
	octave 3
	note F_, 1
	volume_envelope 11, 4
	octave 2
	note A_, 1
	volume_envelope 7, 4
	octave 3
	note A_, 1
	volume_envelope 11, 4
	octave 2
	note B_, 1
	volume_envelope 7, 4
	octave 3
	note B_, 1
	volume_envelope 11, 4
	octave 3
	note D_, 1
	volume_envelope 7, 4
	octave 4
	note D_, 1
	sound_ret

Music_LookKimonoGirl_branch_f7a34:
	volume_envelope 11, 4
	octave 2
	note E_, 1
	volume_envelope 7, 4
	octave 3
	note E_, 1
	volume_envelope 11, 4
	octave 2
	note A_, 1
	volume_envelope 7, 4
	octave 3
	note A_, 1
	volume_envelope 11, 4
	octave 2
	note B_, 1
	volume_envelope 7, 4
	octave 3
	note B_, 1
	volume_envelope 11, 4
	octave 3
	note D_, 1
	volume_envelope 7, 4
	octave 4
	note D_, 1
	sound_ret

Music_LookKimonoGirl_Ch2:
	duty_cycle 0
	note_type 6, 10, 7
	stereo_panning 1, 0
	sound_call Music_LookKimonoGirl_branch_f7aa8
Music_LookKimonoGirl_branch_f7a5f:
	duty_cycle 3
	note_type 12, 9, 1
	octave 5
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	sound_call Music_LookKimonoGirl_branch_f7a94
	octave 5
	note F_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	sound_call Music_LookKimonoGirl_branch_f7a94
	sound_loop 0, Music_LookKimonoGirl_branch_f7a5f

Music_LookKimonoGirl_branch_f7a94:
	octave 5
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 1
	note E_, 1
	sound_ret

Music_LookKimonoGirl_branch_f7aa8:
	octave 4
	note E_, 1
	octave 5
	note E_, 16
	rest 1
	note E_, 2
	rest 3
	volume_envelope 11, 7
	note E_, 2
	rest 2
	volume_envelope 11, 7
	note E_, 2
	rest 1
	volume_envelope 10, 7
	note E_, 2
	rest 1
	note_type 6, 6, 5
	note E_, 2
	rest 1
	volume_envelope 5, 4
	note E_, 2
	rest 1
	volume_envelope 6, 3
	note E_, 2
	note E_, 2
	volume_envelope 9, 1
	note E_, 2
	volume_envelope 10, 1
	note E_, 1
	note_type 8, 11, 1
	note E_, 1
	note E_, 1
	sound_ret

Music_LookKimonoGirl_Ch3:
	stereo_panning 1, 1
	vibrato 18, 2, 4
	note_type 6, 1, 3
	rest 1
	rest 16
	octave 5
	note E_, 1
	note F_, 1
	note E_, 2
	note_type 12, 1, 3
	note E_, 12
	note_type 6, 1, 3
	octave 5
	note D_, 2
	note E_, 2
Music_LookKimonoGirl_branch_f7aec:
	octave 5
	note D_, 4
	note E_, 4
	note F_, 4
	note A_, 4
	note B_, 4
	note A_, 4
	note B_, 4
	octave 6
	note D_, 4
	note E_, 8
	note F_, 1
	note F#, 1
	note F_, 2
	note D_, 4
	note E_, 8
	note D_, 4
	note E_, 4
	note F_, 8
	note A_, 8
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 2
	note A_, 4
	note F_, 4
	note D_, 4
	note E_, 1
	note F_, 1
	note E_, 10
	note F_, 2
	note E_, 2
	note D_, 8
	note E_, 8
	sound_loop 0, Music_LookKimonoGirl_branch_f7aec

