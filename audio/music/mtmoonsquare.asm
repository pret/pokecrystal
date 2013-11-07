Music_MtMoonSquare: ; f4815
	dbw $40, Music_MtMoonSquare_Ch1
	dbw $01, Music_MtMoonSquare_Ch2
; f481b


Music_MtMoonSquare_Ch1: ; f481b
	tempo 112
	volume $77
	dutycycle $2
	tone $0001
	note __, 0

Music_MtMoonSquare_branch_f4826: ; f4826
	notetype $c, $44

Music_MtMoonSquare_branch_f4829: ; f4829
	octave 4
	note D_, 1
	note E_, 1
	note F#, 3
	note F#, 1
	note A_, 1
	octave 5
	note D_, 3
	loopchannel 2, Music_MtMoonSquare_branch_f4829

Music_MtMoonSquare_branch_f4835: ; f4835
	octave 4
	note E_, 1
	note F#, 1
	note G#, 3
	note G#, 1
	note B_, 1
	octave 5
	note E_, 3
	loopchannel 2, Music_MtMoonSquare_branch_f4835

Music_MtMoonSquare_branch_f4841: ; f4841
	octave 4
	note C#, 1
	note D_, 1
	note E_, 3
	note E_, 1
	note G_, 1
	octave 5
	note C#, 3
	loopchannel 2, Music_MtMoonSquare_branch_f4841

Music_MtMoonSquare_branch_f484d: ; f484d
	octave 4
	note D_, 1
	note E_, 1
	note F#, 3
	note F#, 1
	note A_, 1
	octave 5
	note D_, 3
	loopchannel 2, Music_MtMoonSquare_branch_f484d
	loopchannel 0, Music_MtMoonSquare_branch_f4826

Music_MtMoonSquare_Ch2: ; f485d
	dutycycle $2
	vibrato $18, $24

Music_MtMoonSquare_branch_f4862: ; f4862
	notetype $c, $82

Music_MtMoonSquare_branch_f4865: ; f4865
	octave 4
	note D_, 1
	note E_, 1
	note F#, 3
	note F#, 1
	note A_, 1
	octave 5
	note D_, 3
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4865
	notetype $c, $82

Music_MtMoonSquare_branch_f4877: ; f4877
	octave 4
	note E_, 1
	note F#, 1
	note G#, 3
	note G#, 1
	note B_, 1
	octave 5
	note E_, 3
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4877
	notetype $c, $82

Music_MtMoonSquare_branch_f4889: ; f4889
	octave 4
	note C#, 1
	note D_, 1
	note E_, 3
	note E_, 1
	note G_, 1
	octave 5
	note C#, 3
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f4889
	notetype $c, $82

Music_MtMoonSquare_branch_f489b: ; f489b
	octave 4
	note D_, 1
	note E_, 1
	note F#, 3
	note F#, 1
	note A_, 1
	octave 5
	note D_, 3
	notetype $c, $62
	loopchannel 2, Music_MtMoonSquare_branch_f489b
	loopchannel 0, Music_MtMoonSquare_branch_f4862
; f48ae
