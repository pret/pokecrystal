Music_VermilionCity:
	channel_count 3
	channel 1, Music_VermilionCity_Ch1
	channel 2, Music_VermilionCity_Ch2
	channel 3, Music_VermilionCity_Ch3

	db $3

Music_VermilionCity_Ch1:
	stereo_panning 0, 1
	tempo 176
	volume 7, 7
	duty_cycle 2
	note_type 12, 6, 5
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 2
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	vibrato 16, 2, 3
Music_VermilionCity_branch_eb6a0:
	duty_cycle 1
	note_type 12, 8, 5
	sound_call Music_VermilionCity_branch_eb6f9
	note F_, 4
	octave 4
	note D_, 4
	note C#, 4
	note E_, 4
	sound_call Music_VermilionCity_branch_eb6f9
	sound_call Music_VermilionCity_branch_eb701
	duty_cycle 2
	note_type 12, 8, 5
	sound_call Music_VermilionCity_branch_eb6f9
	note F_, 4
	octave 4
	note D_, 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note C_, 1
	sound_call Music_VermilionCity_branch_eb6f9
	sound_call Music_VermilionCity_branch_eb701
	volume_envelope 9, 3
	duty_cycle 0
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	sound_call Music_VermilionCity_branch_eb70c
	sound_call Music_VermilionCity_branch_eb70c
	volume_envelope 8, 7
	duty_cycle 2
	octave 4
	note D_, 8
	octave 3
	note G#, 8
	note E_, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	octave 2
	note B_, 4
	note G#, 4
	note B_, 4
	octave 3
	note D_, 4
	sound_loop 0, Music_VermilionCity_branch_eb6a0

Music_VermilionCity_branch_eb6f9:
	octave 3
	note C#, 4
	note E_, 4
	note F#, 2
	note A_, 2
	note E_, 2
	note G#, 2
	sound_ret

Music_VermilionCity_branch_eb701:
	note D_, 2
	note F_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note E_, 2
	sound_ret

Music_VermilionCity_branch_eb70c:
	rest 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	note F#, 2
	rest 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	note B_, 2
	note G#, 2
	sound_ret

Music_VermilionCity_Ch2:
	stereo_panning 1, 1
	duty_cycle 3
	note_type 12, 7, 7
	vibrato 16, 2, 3
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note F#, 4
	note G#, 4
Music_VermilionCity_branch_eb735:
	note_type 12, 9, 7
	sound_call Music_VermilionCity_branch_eb768
	note G#, 2
	sound_call Music_VermilionCity_branch_eb768
	note E_, 2
	volume_envelope 11, 7
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
	sound_call Music_VermilionCity_branch_eb77e
	sound_call Music_VermilionCity_branch_eb77e
	note F#, 6
	note E_, 1
	note F#, 1
	note E_, 8
	note A_, 6
	note G#, 1
	note A_, 1
	note G#, 8
	note G#, 14
	note_type 6, 5, 7
	rest 1
	octave 4
	note E_, 1
	note G#, 1
	note B_, 1
	note_type 12, 8, 7
	octave 5
	note E_, 16
	sound_loop 0, Music_VermilionCity_branch_eb735

Music_VermilionCity_branch_eb768:
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note C#, 1
	note D_, 1
	note E_, 8
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note E_, 1
	note D_, 1
	note C#, 2
	note E_, 2
	octave 1
	note A_, 2
	sound_ret

Music_VermilionCity_branch_eb77e:
	note F#, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	sound_ret

Music_VermilionCity_Ch3:
	stereo_panning 1, 0
	vibrato 34, 2, 3
	note_type 12, 2, 5
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note B_, 4
	note D_, 4
	note E_, 4
	note D_, 2
	octave 3
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
Music_VermilionCity_branch_eb79e:
	note_type 12, 2, 2
	sound_call Music_VermilionCity_branch_eb7de
	octave 5
	note A_, 6
	volume_envelope 2, 4
	note E_, 1
	note G#, 1
	sound_call Music_VermilionCity_branch_eb7de
	note A_, 8
	volume_envelope 1, 4
	octave 3
	note D_, 4
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	octave 3
	note D_, 2
	rest 4
	note D_, 1
	note D_, 1
	sound_call Music_VermilionCity_branch_eb7f5
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	rest 2
	note D_, 2
	sound_call Music_VermilionCity_branch_eb7f5
	volume_envelope 2, 5
	octave 3
	note E_, 8
	octave 4
	note E_, 8
	octave 3
	note B_, 8
	octave 4
	note E_, 8
	octave 2
	note E_, 16
	octave 3
	note E_, 14
	volume_envelope 2, 2
	octave 5
	note E_, 1
	note G#, 1
	sound_loop 0, Music_VermilionCity_branch_eb79e

Music_VermilionCity_branch_eb7de:
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	note A_, 1
	note B_, 1
	octave 6
	note C#, 8
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	sound_ret

Music_VermilionCity_branch_eb7f5:
	note A_, 1
	rest 1
	note A_, 2
	rest 2
	note F#, 2
	note E_, 2
	rest 4
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	rest 1
	note D_, 2
	rest 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	sound_ret

