Music_CeladonCity:
	channel_count 3
	channel 1, Music_CeladonCity_Ch1
	channel 2, Music_CeladonCity_Ch2
	channel 3, Music_CeladonCity_Ch3

Music_CeladonCity_Ch1:
	tempo 146
	volume 7, 7
	pitch_offset 1
Music_CeladonCity_branch_f436c:
	stereo_panning FALSE, TRUE
	note_type 12, 10, 6
	octave 3
	note A_, 7
	volume_envelope 10, 1
	note G#, 1
	note A_, 1
	note D_, 3
	note E_, 2
	note F#, 2
	sound_call Music_CeladonCity_branch_f43cc
Music_CeladonCity_branch_f437d:
	note D_, 2
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	sound_loop 3, Music_CeladonCity_branch_f437d
	note D_, 2
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note C_, 1
	octave 3
	note B_, 1
	note G_, 1
	sound_call Music_CeladonCity_branch_f43cc
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 16
	sound_call Music_CeladonCity_branch_f43e1
	sound_call Music_CeladonCity_branch_f43fe
	octave 2
	note B_, 2
	note A#, 1
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	sound_call Music_CeladonCity_branch_f43e1
	sound_call Music_CeladonCity_branch_f43fe
	note D_, 2
	note C#, 1
	note D_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 8
	sound_loop 0, Music_CeladonCity_branch_f436c

Music_CeladonCity_branch_f43cc:
	note D_, 2
	note G_, 1
	note B_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	sound_loop 3, Music_CeladonCity_branch_f43cc
	note D_, 2
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note A_, 1
	sound_ret

Music_CeladonCity_branch_f43e1:
	octave 2
	note G_, 2
	note B_, 1
	octave 3
	note D_, 1
	sound_loop 4, Music_CeladonCity_branch_f43e1
	note C_, 2
	octave 2
	note B_, 1
	octave 3
	note C_, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	octave 3
	note B_, 1
	sound_ret

Music_CeladonCity_branch_f43fe:
	note D_, 2
	note F#, 1
	note A_, 1
	sound_loop 4, Music_CeladonCity_branch_f43fe
	sound_ret

Music_CeladonCity_Ch2:
	vibrato 18, 3, 4
	duty_cycle 2
	stereo_panning TRUE, FALSE
	note_type 12, 11, 7
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 8
Music_CeladonCity_branch_f441a:
	sound_call Music_CeladonCity_branch_f4463
	note A_, 4
	note F#, 4
	note A_, 2
	note F#, 6
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 2
	note B_, 2
	note G_, 4
	note B_, 4
	sound_call Music_CeladonCity_branch_f4463
	volume_envelope 12, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 4
	note D_, 1
	note E_, 1
	note F#, 1
	note A_, 1
	volume_envelope 11, 3
	octave 5
	note D_, 6
	volume_envelope 10, 2
	octave 1
	note F#, 2
	sound_call Music_CeladonCity_branch_f4474
	octave 1
	note G_, 3
	note B_, 1
	note A_, 2
	octave 2
	note D_, 2
	octave 1
	note A_, 6
	note F#, 2
	sound_call Music_CeladonCity_branch_f4474
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note A_, 4
	note D_, 6
	volume_envelope 9, 7
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 16
	sound_loop 0, Music_CeladonCity_branch_f441a

Music_CeladonCity_branch_f4463:
	volume_envelope 11, 2
	octave 4
	note B_, 4
	note G_, 4
	note B_, 2
	note G_, 6
	note B_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note A_, 8
	sound_ret

Music_CeladonCity_branch_f4474:
	note G_, 3
	note B_, 1
	octave 2
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note G_, 3
	octave 2
	note C_, 1
	note D_, 4
	octave 1
	note G_, 2
	note B_, 2
	octave 2
	note D_, 4
	octave 1
	note A_, 3
	octave 2
	note D_, 1
	note F#, 4
	octave 1
	note A_, 2
	octave 2
	note D_, 2
	note F#, 4
	sound_ret

Music_CeladonCity_Ch3:
	vibrato 18, 2, 4
Music_CeladonCity_branch_f4495:
	note_type 12, 2, 5
	octave 3
	note A_, 2
	rest 2
	note F#, 2
	rest 2
	note D_, 8
	sound_call Music_CeladonCity_branch_f44fd
Music_CeladonCity_branch_f44a1:
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 4
	sound_loop 3, Music_CeladonCity_branch_f44a1
	octave 2
	note G_, 1
	rest 1
	note B_, 1
	rest 1
	octave 3
	note D_, 3
	octave 2
	note F#, 1
	sound_call Music_CeladonCity_branch_f44fd
	note A_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	octave 3
	note F#, 3
	octave 2
	note G#, 1
	note A_, 1
	rest 1
	octave 3
	note C#, 1
	rest 1
	note E_, 2
	note C#, 2
	note D_, 2
	rest 6
	octave 2
	note A_, 2
	rest 6
	volume_envelope 1, 0
	sound_call Music_CeladonCity_branch_f4510
	octave 5
	note E_, 2
	rest 2
	note F#, 2
	rest 2
	note D_, 4
	rest 4
	note C_, 8
	octave 4
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	rest 2
	note D_, 2
	note E_, 2
	note D_, 4
	rest 4
	sound_call Music_CeladonCity_branch_f4510
	octave 5
	note E_, 2
	rest 2
	note D_, 2
	note E_, 2
	note D_, 4
	rest 4
	note C_, 8
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	rest 6
	sound_loop 0, Music_CeladonCity_branch_f4495

Music_CeladonCity_branch_f44fd:
	octave 2
	note G_, 2
	rest 2
	octave 3
	note D_, 4
	sound_loop 3, Music_CeladonCity_branch_f44fd
	octave 2
	note A_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note F#, 3
	octave 2
	note G#, 1
	sound_ret

Music_CeladonCity_branch_f4510:
	octave 5
	note D_, 8
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note B_, 2
	sound_ret

