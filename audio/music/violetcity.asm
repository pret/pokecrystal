Music_VioletCity: ; f0000
	dbw $c0, Music_VioletCity_Ch1
	dbw $01, Music_VioletCity_Ch2
	dbw $02, Music_VioletCity_Ch3
	dbw $03, Music_VioletCity_Ch4
; f000c

Music_VioletCity_Ch1: ; f000c
	tempo 164
	volume $7, $7
	vibrato $12, $2, $5
	waveduty $2
	notetype $c, $9, $0, $5
	note __, 16
	stereopanning $f0
	octave 2
	note E_, 1
	note G#, 1
	note B_, 1
	stereopanning $ff
	octave 3
	note D#, 1
	note G#, 1
	note __, 1
	note A#, 4
	note G#, 2
	note F#, 2
	note C#, 2
	stereopanning $f
	octave 2
	note D#, 1
	note F#, 1
	note A#, 1
	stereopanning $ff
	octave 3
	note C#, 1
	note F#, 1
	note __, 1
	note D#, 4
	note G#, 2
	note D#, 2
	octave 2
	note G#, 2
	note C#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 3
	note G#, 1
	note __, 1
	octave 2
	note B_, 4
	notetype $6, $9, $0, $1
	octave 3
	note C#, 2
	note F_, 2
	note C#, 2
	note F_, 2
	note G#, 2
	note B_, 2
	volenvelope $a, $0, $4
	octave 2
	note B_, 8
	note __, 4
	octave 3
	note C#, 12
	note __, 8
Music_VioletCity_branch_f0056: ; f0056
	notetype $6, $9, $0, $5
	note __, 4
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note D#, 4
	note D#, 2
	note E_, 2
	note D#, 2
	note __, 2
	note F#, 2
	note __, 2
	note G#, 2
	note __, 2
	note B_, 2
	note __, 2
	stereopanning $f0
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C#, 2
	stereopanning $ff
	note C_, 2
	octave 3
	note G#, 2
	note E_, 2
	octave 4
	note C_, 2
	stereopanning $f
	octave 3
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note A#, 8
	stereopanning $ff
	note __, 4
	note C#, 2
	note E_, 2
	note A#, 4
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note __, 2
	note C#, 2
	note __, 2
	stereopanning $f
	note D#, 8
	stereopanning $ff
	note E_, 8
	stereopanning $f0
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 4
	stereopanning $ff
	note G#, 2
	note D#, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note B_, 4
	note G#, 2
	note G#, 2
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	note D#, 4
	note F#, 2
	note __, 2
	notetype $c, $9, $0, $5
	note __, 8
	octave 4
	note F_, 3
	waveduty $1
	notetype $6, $7, $0, $5
	note G#, 1
	note B_, 1
	octave 5
	note D#, 8
	notetype $c, $9, $0, $3
	waveduty $2
	note __, 16
	notetype $6, $9, $0, $1
	stereopanning $f0
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note G#, 2
	octave 3
	note E_, 2
	stereopanning $f
	octave 2
	note B_, 2
	note G#, 2
	note B_, 2
	octave 3
	note E_, 2
	volenvelope $a, $0, $4
	stereopanning $ff
	note D#, 8
	note __, 8
	waveduty $3
	volenvelope $8, $0, $4
	note __, 4
	note G_, 2
	note A_, 2
	note B_, 4
	octave 4
	note D_, 4
	note C#, 4
	notetype $8, $8, $0, $4
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 3
	notetype $c, $8, $0, $4
	note F#, 1
	note __, 1
	note F#, 2
	note C#, 1
	note __, 1
	note F#, 2
	note D_, 4
	note E_, 4
	note F#, 2
	note B_, 1
	note __, 1
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	note F#, 2
	note E_, 2
	notetype $8, $8, $0, $4
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 3
	notetype $c, $8, $0, $4
	octave 3
	note B_, 1
	note __, 1
	note A_, 2
	note F#, 1
	note __, 1
	note A_, 2
	octave 4
	note E_, 4
	note D_, 4
	note C#, 2
	note G#, 1
	note E_, 1
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G#, 1
	note __, 1
	note G#, 1
	note A#, 1
	note B_, 4
	note __, 4
	note G#, 1
	note F_, 1
	octave 3
	note B_, 1
	octave 4
	note F_, 1
	note G#, 1
	note __, 1
	note G#, 1
	note A#, 1
	note B_, 4
	note __, 4
	note C#, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note F#, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F#, 1
	note A#, 1
	octave 5
	note C#, 1
	waveduty $2
	octave 4
	note C#, 6
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 4
	note __, 4
	loopchannel 0, Music_VioletCity_branch_f0056
; f0162

Music_VioletCity_Ch2: ; f0162
	vibrato $12, $2, $4
	waveduty $2
	notetype $c, $c, $0, $7
	note __, 16
	octave 3
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D#, 4
	note C#, 2
	octave 3
	note A#, 2
	note G#, 2
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 4
	note C#, 4
	octave 3
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 4
	note A#, 2
	note B_, 2
	octave 4
	note C#, 2
	note D#, 2
	octave 3
	note F#, 2
	octave 4
	note D#, 1
	note __, 1
	note C#, 6
	note __, 2
	note D#, 1
	note E_, 1
Music_VioletCity_branch_f0199: ; f0199
	volenvelope $b, $0, $7
	note F#, 4
	note __, 2
	note F#, 1
	note G#, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 14
	note C#, 1
	note D#, 1
	note E_, 4
	note __, 2
	note E_, 1
	note F#, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 12
	note __, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D#, 4
	note __, 2
	note D#, 1
	note E_, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	note __, 1
	note D#, 4
	note G#, 4
	note B_, 3
	note __, 3
	note C#, 1
	note D#, 1
	note E_, 2
	octave 3
	note G#, 2
	note B_, 2
	octave 4
	note E_, 2
	note D#, 1
	octave 3
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
	note C#, 1
	octave 3
	note E_, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note B_, 12
	note __, 4
	volenvelope $a, $0, $7
	waveduty $3
	note __, 2
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	note F#, 2
	note E_, 2
	notetype $8, $a, $0, $7
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 3
	notetype $c, $a, $0, $7
	octave 3
	note B_, 1
	note __, 1
	note A_, 2
	note F#, 1
	note __, 1
	note A_, 2
	octave 4
	note E_, 4
	note D_, 4
	note C#, 2
	note __, 2
	note G_, 1
	note A_, 1
	note B_, 2
	octave 5
	note D_, 2
	note C#, 2
	notetype $8, $a, $0, $7
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note A_, 3
	notetype $c, $a, $0, $7
	note G_, 1
	note __, 1
	note F#, 2
	note C#, 1
	note __, 1
	note F#, 2
	vibrato $0, $0, $0
	volenvelope $8, $0, $7
	octave 5
	note E_, 4
	note F#, 4
	note D_, 1
	note E_, 1
	note F#, 12
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 12
	note __, 2
	octave 4
	note A#, 1
	note B_, 1
	octave 5
	note C#, 11
	note __, 5
	vibrato $12, $2, $4
	volenvelope $a, $0, $7
	waveduty $2
	octave 4
	note A#, 6
	note A_, 1
	note G#, 1
	note F#, 4
	note __, 2
	note D#, 1
	note E_, 1
	loopchannel 0, Music_VioletCity_branch_f0199
; f0247

Music_VioletCity_Ch3: ; f0247
	notetype $c, $2, $0, $5
	note __, 16
	note __, 6
	octave 4
	note E_, 4
	note __, 6
	note __, 6
	octave 3
	note G#, 4
	note __, 6
	note __, 6
	note F_, 4
	note __, 6
	octave 2
	note F#, 4
	octave 3
	note C#, 1
	note __, 1
	note A#, 4
	note A_, 1
	note G#, 1
	note F#, 2
	octave 2
	note A#, 2
Music_VioletCity_branch_f0261: ; f0261
	notetype $c, $2, $0, $5
	note B_, 1
	note __, 5
	note B_, 1
	note B_, 1
	note __, 2
	note B_, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 5
	note C#, 1
	note C#, 1
	note __, 2
	note C#, 1
	note __, 1
	note G#, 2
	octave 2
	note G#, 1
	note __, 1
	note F#, 1
	note __, 5
	note F#, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 2
	note C#, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 5
	note B_, 1
	note B_, 1
	note __, 2
	note B_, 1
	note __, 1
	octave 3
	note B_, 4
	note G#, 1
	note __, 5
	note G#, 1
	note G#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 2
	note F#, 1
	note __, 1
	notetype $6, $2, $0, $5
	octave 3
	note C#, 2
	note F_, 2
	note G#, 2
	note B_, 2
	octave 4
	note C#, 2
	note F_, 2
	note G#, 2
	note B_, 2
	octave 4
	note C#, 6
	notetype $c, $2, $0, $5
	note __, 5
	notetype $6, $2, $0, $5
	octave 2
	note E_, 2
	note __, 10
	note E_, 2
	note E_, 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 3
	note C#, 4
	note C_, 4
	octave 2
	note B_, 2
	note __, 10
	note B_, 2
	note B_, 2
	note __, 4
	note B_, 2
	note __, 2
	note A_, 8
	callchannel Music_VioletCity_branch_f0311
	note F#, 2
	note __, 10
	note B_, 2
	note B_, 2
	note B_, 2
	note __, 2
	note A#, 8
	note A_, 2
	note __, 2
	callchannel Music_VioletCity_branch_f0311
	note F#, 2
	note __, 10
	note B_, 2
	note B_, 2
	note B_, 2
	note __, 2
	note A#, 8
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 10
	note E_, 2
	note E_, 2
	note __, 4
	note E_, 2
	note __, 2
	note B_, 4
	note G#, 2
	note F#, 2
	note F_, 2
	note __, 10
	note F_, 2
	note F_, 2
	note __, 4
	note F_, 2
	note __, 2
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	note G#, 2
	note F#, 2
	note __, 10
	note F#, 2
	note F#, 2
	octave 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 3
	note F#, 4
	octave 2
	note F#, 2
	note G#, 2
	octave 3
	note F#, 12
	note G#, 2
	note A_, 2
	note A#, 8
	note __, 4
	octave 2
	note A#, 4
	loopchannel 0, Music_VioletCity_branch_f0261
; f0311

Music_VioletCity_branch_f0311: ; f0311
	note G_, 2
	note __, 10
	note G_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 4
	octave 2
	note A_, 4
	endchannel
; f031e

Music_VioletCity_Ch4: ; f031e
	drumkittoggle $3
	notetype $c
	note D#, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D_, 4
	note F#, 4
	callchannel Music_VioletCity_branch_f036c
	callchannel Music_VioletCity_branch_f036c
	callchannel Music_VioletCity_branch_f036c
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note C_, 8
	note D#, 2
Music_VioletCity_branch_f0338: ; f0338
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	callchannel Music_VioletCity_branch_f037a
	loopchannel 0, Music_VioletCity_branch_f0338
; f036c

Music_VioletCity_branch_f036c: ; f036c
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note D_, 2
	note G_, 2
	note G_, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	endchannel
; f037a

Music_VioletCity_branch_f037a: ; f037a
	note D#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 2
	note D#, 2
	note D_, 2
	note D#, 2
	endchannel
; f0386


