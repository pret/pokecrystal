Music_TrainerVictory:
	channel_count 3
	channel 1, Music_TrainerVictory_Ch1
	channel 2, Music_TrainerVictory_Ch2
	channel 3, Music_TrainerVictory_Ch3

Music_TrainerVictory_Ch1:
	tempo 120
	volume 7, 7
	duty_cycle 2
	pitch_offset 1
	note_type 8, 11, 1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	volume_envelope 11, 6
	note A_, 12
	stereo_panning FALSE, TRUE
Music_TrainerVictory_branch_ebecd:
	volume_envelope 7, 2
	sound_call Music_TrainerVictory_branch_ebf11
	volume_envelope 5, 1
	note C#, 2
	note E_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	volume_envelope 7, 2
	octave 3
	note A_, 2
	rest 2
	octave 4
	note C#, 2
	note E_, 6
	sound_loop 2, Music_TrainerVictory_branch_ebecd
	sound_call Music_TrainerVictory_branch_ebf11
	note A_, 2
	rest 2
	note F_, 2
	note A_, 6
	note A#, 2
	rest 2
	note G_, 2
	note A#, 6
Music_TrainerVictory_branch_ebef2:
	volume_envelope 7, 2
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note A_, 2
	sound_loop 3, Music_TrainerVictory_branch_ebef2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
Music_TrainerVictory_branch_ebf01:
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	sound_loop 3, Music_TrainerVictory_branch_ebf01
	note E_, 2
	note F#, 2
	note G_, 2
	sound_loop 0, Music_TrainerVictory_branch_ebecd

Music_TrainerVictory_branch_ebf11:
	octave 3
	note F#, 2
	rest 2
	note D_, 2
	note F#, 6
	note G_, 2
	rest 2
	note E_, 2
	note G_, 6
	sound_ret

Music_TrainerVictory_Ch2:
	vibrato 18, 3, 4
	duty_cycle 3
	note_type 8, 13, 1
	octave 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	volume_envelope 13, 6
	note D_, 12
	stereo_panning TRUE, FALSE
Music_TrainerVictory_branch_ebf30:
	note_type 8, 8, 2
	sound_call Music_TrainerVictory_branch_ebf56
	note F#, 2
	rest 2
	note G_, 2
	note A_, 6
	note E_, 2
	rest 2
	note F#, 2
	note G_, 6
	sound_loop 2, Music_TrainerVictory_branch_ebf30
	sound_call Music_TrainerVictory_branch_ebf56
	note F_, 2
	rest 2
	note C_, 2
	note F_, 6
	note G_, 2
	rest 2
	note D_, 2
	note G_, 6
	note_type 12, 8, 8
	note F#, 16
	note E_, 16
	sound_loop 0, Music_TrainerVictory_branch_ebf30

Music_TrainerVictory_branch_ebf56:
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	octave 4
	note D_, 6
	note E_, 2
	rest 2
	octave 3
	note B_, 2
	octave 4
	note E_, 6
	sound_ret

Music_TrainerVictory_Ch3:
	note_type 8, 2, 5
	octave 3
	note G_, 6
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 6
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
Music_TrainerVictory_branch_ebf74:
	sound_call Music_TrainerVictory_branch_ebfb1
	octave 3
	note C#, 2
	rest 2
	note C#, 2
	note A_, 2
	note F#, 2
	note C#, 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note A_, 1
	rest 1
	note A_, 6
	sound_loop 2, Music_TrainerVictory_branch_ebf74
	sound_call Music_TrainerVictory_branch_ebfb1
	octave 3
	note C_, 2
	rest 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	rest 2
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 12
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 12
	note G_, 2
	note E_, 2
	note C#, 2
	sound_loop 0, Music_TrainerVictory_branch_ebf74

Music_TrainerVictory_branch_ebfb1:
	octave 2
	note A_, 2
	rest 2
	note A_, 2
	octave 3
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	rest 2
	note B_, 2
	octave 3
	note G_, 2
	note E_, 2
	octave 2
	note B_, 2
	sound_ret

