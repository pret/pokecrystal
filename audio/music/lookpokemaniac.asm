Music_LookPokemaniac:
	channel_count 3
	channel 1, Music_LookPokemaniac_Ch1
	channel 2, Music_LookPokemaniac_Ch2
	channel 3, Music_LookPokemaniac_Ch3

Music_LookPokemaniac_Ch1:
	stereo_panning 0, 1
	tempo 144
	volume 7, 7
	vibrato 2, 3, 3
	pitch_offset 2
	note_type 12, 11, 3
	rest 8
Music_LookPokemaniac_branch_ebdfb:
	rest 4
	octave 3
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	sound_loop 4, Music_LookPokemaniac_branch_ebdfb
	rest 4
	note G_, 1
	rest 3
	note G_, 1
	rest 3
	sound_loop 4, Music_LookPokemaniac_branch_ebdfb
	sound_loop 0, Music_LookPokemaniac_branch_ebdfb

Music_LookPokemaniac_Ch2:
	stereo_panning 1, 1
	vibrato 2, 3, 3
	pitch_offset 1
	note_type 12, 11, 3
	octave 2
	note A_, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 1
	note A_, 4
Music_LookPokemaniac_branch_ebe24:
	octave 2
	note C_, 2
	rest 2
	octave 3
	note F#, 1
	rest 3
	note A_, 1
	rest 3
	octave 1
	note G_, 2
	rest 2
	octave 3
	note C_, 1
	rest 3
	note D#, 1
	rest 3
	sound_loop 2, Music_LookPokemaniac_branch_ebe24
Music_LookPokemaniac_branch_ebe38:
	octave 1
	note A_, 2
	rest 2
	octave 3
	note D#, 1
	rest 3
	note F#, 1
	rest 3
	octave 1
	note E_, 2
	rest 2
	octave 2
	note A_, 1
	rest 3
	octave 3
	note C_, 1
	rest 3
	sound_loop 2, Music_LookPokemaniac_branch_ebe38
	sound_loop 0, Music_LookPokemaniac_branch_ebe24

Music_LookPokemaniac_Ch3:
	stereo_panning 1, 0
	vibrato 6, 3, 3
	note_type 12, 1, 5
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 5
	note C_, 4
	volume_envelope 1, 0
Music_LookPokemaniac_branch_ebe62:
	sound_call Music_LookPokemaniac_branch_ebe70
	volume_envelope 1, 4
	sound_call Music_LookPokemaniac_branch_ebe70
	volume_envelope 1, 0
	sound_loop 0, Music_LookPokemaniac_branch_ebe62

Music_LookPokemaniac_branch_ebe70:
	note A#, 6
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 6
	note F_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D#, 4
	note C_, 1
	rest 1
	note D#, 1
	rest 1
	note C_, 1
	rest 1
	note D#, 1
	rest 1
	octave 5
	note F#, 4
	note C_, 1
	rest 1
	note F#, 1
	rest 1
	note C_, 1
	rest 1
	note F#, 1
	rest 1
	note G_, 6
	note F#, 2
	note F_, 2
	note E_, 2
	note D#, 6
	note D_, 2
	note D#, 2
	note F#, 2
	note C_, 4
	octave 4
	note A_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	note D#, 1
	rest 1
	note C_, 1
	rest 1
	note D#, 4
	octave 4
	note A_, 1
	rest 1
	octave 5
	note D#, 1
	rest 1
	note F#, 1
	rest 1
	note C_, 1
	rest 1
	sound_ret

