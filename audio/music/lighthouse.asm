Music_Lighthouse: ; ee569
	dbw $c0, Music_Lighthouse_Ch1
	dbw $01, Music_Lighthouse_Ch2
	dbw $02, Music_Lighthouse_Ch3
	dbw $03, Music_Lighthouse_Ch4
; ee575


Music_Lighthouse_Ch1: ; ee575
	tempo 144
	volume $77
	dutycycle $3
	tone $0004
	vibrato $8, $45
	stereopanning $f

Music_Lighthouse_branch_ee584: ; ee584
	notetype $c, $b3
	octave 3
	note C#, 7
	octave 2
	note F#, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 3
	note C#, 3
	octave 2
	note B_, 3
	note A_, 3
	note B_, 3
	note G#, 0
	note __, 6
	octave 3
	note C_, 3
	octave 2
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note C_, 1
	note D#, 0
	note __, 0
	note F#, 0
	note __, 0
	note G#, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 3
	note C#, 7
	octave 2
	note C#, 1
	note F#, 1
	note G#, 1
	octave 3
	note C_, 1
	note D_, 1
	note C#, 1
	octave 2
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 0
	note __, 6
	octave 3
	note C_, 11
	octave 2
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 2
	octave 3
	note C_, 0
	note __, 2
	octave 2
	note A_, 3
	octave 3
	note A_, 3
	note G#, 3
	note F#, 3
	note E_, 3
	note D#, 3
	note C#, 3
	note E_, 3
	note F#, 1
	note E_, 1
	note D#, 11
	octave 2
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G#, 7
	note A_, 3
	octave 3
	note A_, 3
	note G#, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note B_, 1
	octave 3
	note C#, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note G#, 11
	octave 2
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G#, 7
	loopchannel 0, Music_Lighthouse_branch_ee584

Music_Lighthouse_Ch2: ; ee5fc
	dutycycle $3
	tone $0002
	vibrato $10, $45

Music_Lighthouse_branch_ee604: ; ee604
	notetype $c, $c5
	octave 3
	note G#, 11
	note F#, 1
	note G#, 1
	note A_, 7
	octave 4
	note C#, 7
	note C_, 0
	note __, 6
	octave 3
	note G#, 15
	intensity $c5
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note G#, 11
	note F#, 1
	note G#, 1
	note A_, 7
	octave 4
	note C#, 7
	note C_, 0
	note __, 6
	note D#, 11
	octave 3
	note D#, 0
	note __, 0
	note D#, 0
	note __, 0
	note D#, 0
	note __, 2
	note D#, 0
	note __, 2
	octave 4
	note E_, 11
	note D#, 1
	note C#, 1
	octave 3
	note G#, 11
	note A#, 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 11
	octave 3
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 7
	octave 4
	note E_, 11
	note D#, 1
	note C#, 1
	octave 3
	note G#, 11
	octave 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D#, 11
	octave 3
	note D#, 1
	note C#, 1
	note D#, 1
	note C#, 1
	note C_, 7
	loopchannel 0, Music_Lighthouse_branch_ee604

Music_Lighthouse_Ch3: ; ee656
	notetype $c, $19
	stereopanning $f0

Music_Lighthouse_branch_ee65b: ; ee65b
	octave 2
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1

Music_Lighthouse_branch_ee664: ; ee664
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	loopchannel 2, Music_Lighthouse_branch_ee664
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	octave 3
	note C_, 1
	note C#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1

Music_Lighthouse_branch_ee683: ; ee683
	note C#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	loopchannel 2, Music_Lighthouse_branch_ee683
	note C#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note D#, 1
	note F#, 1

Music_Lighthouse_branch_ee69b: ; ee69b
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	loopchannel 8, Music_Lighthouse_branch_ee69b
	loopchannel 0, Music_Lighthouse_branch_ee65b

Music_Lighthouse_Ch4: ; ee6ad
	togglenoise $0
	notetype $c

Music_Lighthouse_branch_ee6b1: ; ee6b1
	stereopanning $f
	note G#, 3
	note F_, 1
	note G#, 3
	note F_, 1
	note A_, 1
	note A#, 1
	stereopanning $ff
	note G#, 1
	note F_, 3
	note G#, 1
	note F_, 3
	note G#, 1
	note A_, 1
	loopchannel 0, Music_Lighthouse_branch_ee6b1
; ee6c5
