Music_MtMoon:
	channel_count 4
	channel 1, Music_MtMoon_Ch1
	channel 2, Music_MtMoon_Ch2
	channel 3, Music_MtMoon_Ch3
	channel 4, Music_MtMoon_Ch4

Music_MtMoon_Ch1:
	tempo 208
	volume 7, 7
	duty_cycle 2
	pitch_offset 1
	vibrato 8, 1, 4
	stereo_panning 1, 0
	note_type 12, 4, 5
	rest 2
	sound_loop 0, Music_MtMoon_branch_edb56

Music_MtMoon_Ch2:
	vibrato 11, 1, 5
	duty_cycle 2
	note_type 12, 8, 4
	stereo_panning 0, 1
Music_MtMoon_branch_edb56:
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C#, 6
	octave 3
	note B_, 2
	note A#, 2
	note B_, 6
	octave 4
	note C#, 10
	note G#, 6
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note F#, 2
	note G#, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 6
	note E_, 2
	note D#, 2
	note E_, 6
	note F#, 6
	note E_, 4
	sound_loop 0, Music_MtMoon_branch_edb56

Music_MtMoon_Ch3:
	note_type 12, 2, 8
Music_MtMoon_branch_edb8d:
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	sound_loop 3, Music_MtMoon_branch_edb8d
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note G_, 2
	note D#, 2
	note E_, 2
Music_MtMoon_branch_edbab:
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note G#, 2
	sound_loop 4, Music_MtMoon_branch_edbab
	sound_loop 0, Music_MtMoon_Ch3

Music_MtMoon_Ch4:
	toggle_noise 5
	drum_speed 12
Music_MtMoon_branch_edbc3:
	stereo_panning 0, 1
	drum_note 11, 4
	drum_note 11, 8
	drum_note 11, 4
	stereo_panning 1, 0
	drum_note 11, 4
	drum_note 11, 4
	drum_note 11, 4
	stereo_panning 0, 1
	drum_note 11, 4
	drum_note 11, 4
	stereo_panning 1, 0
	drum_note 11, 8
	sound_loop 0, Music_MtMoon_branch_edbc3

