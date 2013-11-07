Music_SSAqua: ; ead99
	dbw $c0, Music_SSAqua_Ch1
	dbw $01, Music_SSAqua_Ch2
	dbw $02, Music_SSAqua_Ch3
	dbw $03, Music_SSAqua_Ch4
; eada5


Music_SSAqua_Ch1: ; eada5
	tempo 117
	volume $77
	stereopanning $f
	tone $0001
	vibrato $12, $33
	dutycycle $2
	notetype $6, $97
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0

Music_SSAqua_branch_eadbc: ; eadbc
	octave 2
	note G_, 15
	note __, 7
	note G_, 1
	note __, 1
	notetype $c, $97
	note G_, 1
	note G_, 9
	note __, 3
	notetype $6, $97
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 15
	note __, 7
	note G_, 1
	note __, 1
	notetype $c, $97
	note G_, 1
	note G_, 7
	note __, 7
	dutycycle $1
	intensity $61
	callchannel Music_SSAqua_branch_eaff5
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	callchannel Music_SSAqua_branch_eaff5
	callchannel Music_SSAqua_branch_eb03e
	note __, 15
	note __, 15
	note __, 15
	intensity $97
	note __, 13
	notetype $6, $97
	note D_, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	notetype $c, $97
	note __, 15
	note __, 15
	intensity $95
	note __, 1
	octave 4
	note C_, 0
	note E_, 0
	note G_, 0
	note __, 0
	note E_, 0
	note C_, 0
	octave 3
	note E_, 0
	note C_, 0
	note E_, 0
	note G_, 0
	octave 4
	note C_, 0
	note E_, 0
	note G_, 0
	octave 5
	note C_, 0
	octave 4
	note E_, 5
	note D_, 1
	note C_, 0
	note D_, 0
	note F#, 0
	note A_, 0
	octave 5
	note C_, 0
	note D_, 0
	octave 4
	note G_, 0
	note F#, 0
	dutycycle $2
	intensity $97
	note G_, 7
	note F#, 7
	note E_, 7
	note D_, 7
	octave 3
	note B_, 7
	note A#, 1
	note __, 1
	note B_, 0
	note __, 0
	octave 4
	note F#, 1
	intensity $75
	octave 5
	note A_, 3
	note F#, 3
	note D_, 3
	octave 4
	note A#, 1
	notetype $6, $97
	note D_, 0
	note __, 0
	octave 3
	note A#, 0
	note __, 0
	intensity $97
	note G_, 15
	note A_, 15
	note B_, 3
	note __, 3
	note B_, 3
	note __, 3
	octave 4
	note E_, 7
	note G_, 7
	note F#, 0
	vibrato $0, $0
	intensity $88
	note G_, 9
	vibrato $2, $23
	intensity $87
	note G_, 8
	vibrato $8, $33
	note C_, 3
	note E_, 3
	note C_, 3
	note D_, 11
	note F#, 11
	note __, 7
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note F#, 1
	notetype $c, $97
	note __, 6
	note __, 15
	note __, 15
	note G_, 7
	note F#, 0
	note D_, 0
	octave 3
	note A_, 0
	octave 4
	note D_, 0
	octave 3
	note A_, 0
	note F#, 0
	note D_, 0
	octave 2
	note A_, 0
	note B_, 0
	octave 3
	note D_, 0
	note F#, 0
	note A_, 0
	note D_, 0
	note F#, 0
	note A_, 0
	octave 4
	note D_, 0
	note F#, 0
	note __, 6
	note __, 15
	note __, 1
	note E_, 1
	note G_, 0
	note __, 0
	note E_, 0
	notetype $6, $97
	note __, 0
	note C_, 0
	note C#, 3
	octave 3
	note B_, 1
	note __, 1
	note A_, 2
	note __, 0
	note G_, 1
	note __, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note A_, 1
	note F#, 1
	note D_, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	loopchannel 0, Music_SSAqua_branch_eadbc
; eaeca

Music_SSAqua_Ch2: ; eaeca
	stereopanning $f0
	dutycycle $2
	vibrato $8, $33
	notetype $c, $b7
	note __, 1

Music_SSAqua_branch_eaed5: ; eaed5
	notetype $c, $b7
	dutycycle $1
	intensity $61
	callchannel Music_SSAqua_branch_eaff5
	callchannel Music_SSAqua_branch_eb03e
	dutycycle $2
	intensity $d7
	callchannel Music_SSAqua_branch_eafe0
	note B_, 0
	note __, 0
	note G_, 0
	note __, 2
	octave 3
	note G_, 5
	note G_, 0
	note B_, 0
	octave 4
	note C#, 0
	note E_, 0
	forceoctave $c
	callchannel Music_SSAqua_branch_eafe0
	forceoctave $0
	octave 3
	note B_, 0
	note __, 0
	note G_, 0
	note __, 2
	octave 4
	note G_, 5
	note __, 1
	dutycycle $3
	intensity $b7
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	callchannel Music_SSAqua_branch_eaf88
	note G_, 3
	note __, 3
	note G_, 7
	note A_, 7
	note B_, 7
	notetype $c, $b7
	octave 5
	note C_, 9
	note D_, 1
	note C_, 1
	octave 4
	note G_, 1
	note B_, 5
	note A_, 5
	note __, 1
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	callchannel Music_SSAqua_branch_eaf88
	note G_, 3
	note __, 3
	note G_, 7
	note A_, 7
	note B_, 7
	octave 5
	note D#, 0
	vibrato $0, $0
	intensity $98
	note E_, 9
	vibrato $4, $23
	intensity $97
	note E_, 8
	vibrato $8, $23
	note D_, 3
	note C_, 3
	octave 4
	note G_, 3
	note B_, 11
	note A_, 11
	note __, 3
	dutycycle $0
	note B_, 1
	note A_, 1
	callchannel Music_SSAqua_branch_eafd5
	notetype $6, $b7
	note G#, 0
	note A_, 10
	note G_, 1
	note F#, 1
	note G_, 11
	note __, 3
	note __, 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 15
	note A#, 11
	note B_, 1
	note A_, 1
	callchannel Music_SSAqua_branch_eafd5
	notetype $6, $b7
	note G#, 0
	note A_, 10
	note B_, 3
	note G_, 11
	note __, 3
	note __, 3
	octave 5
	note C_, 3
	note D_, 1
	note __, 1
	note C_, 1
	note __, 0
	octave 4
	note A#, 0
	note B_, 3
	note A_, 1
	note __, 1
	note G_, 3
	note E_, 1
	note __, 1
	note F#, 7
	note G_, 7
	note A_, 7
	note __, 7
	loopchannel 0, Music_SSAqua_branch_eaed5
; eaf88

Music_SSAqua_branch_eaf88: ; eaf88
	note D_, 5
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	note D_, 1
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	note D_, 1
	octave 3
	note B_, 0
	octave 4
	note C_, 0
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 5
	note F#, 5
	note __, 3
	dutycycle $1
	notetype $6, $b7
	octave 3
	note A_, 0
	note __, 0
	octave 4
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note A_, 0
	note __, 0
	octave 5
	note D_, 0
	note __, 0
	note F#, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 4
	note A#, 0
	note __, 0
	note F#, 0
	note __, 0
	note A#, 0
	note __, 0
	note F#, 0
	note __, 0
	dutycycle $3
	note E_, 1
	note F#, 1
	note G_, 11
	note E_, 1
	note F#, 1
	note G_, 3
	note E_, 1
	note F#, 1
	note G_, 3
	note E_, 1
	note F#, 1
	endchannel
; eafd5

Music_SSAqua_branch_eafd5: ; eafd5
	notetype $c, $b7
	note B_, 9
	note F#, 0
	note __, 0
	note B_, 0
	note __, 0
	note F#, 0
	note __, 0
	endchannel
; eafe0

Music_SSAqua_branch_eafe0: ; eafe0
	octave 3
	note D_, 9
	note E_, 0
	note __, 2
	note D_, 0
	note __, 0
	note C#, 11
	octave 2
	note A_, 0
	note __, 0
	note B_, 0
	note __, 0
	octave 3
	note C_, 7
	note __, 1
	octave 2
	note B_, 0
	note __, 2
	note A_, 0
	note __, 0
	endchannel
; eaff5

Music_SSAqua_branch_eaff5: ; eaff5
	octave 5
	note G_, 0
	note D_, 0
	octave 4
	note B_, 0
	note G_, 0
	octave 5
	note G_, 0
	note D_, 0
	octave 4
	note B_, 0
	note G_, 0
	octave 5
	note G_, 0
	note D_, 0
	octave 4
	note B_, 0
	note G_, 0
	octave 5
	note G_, 0
	note D_, 0
	octave 4
	note B_, 0
	note G_, 0
	octave 5
	note G_, 0
	note C#, 0
	octave 4
	note A#, 0
	note G_, 0
	octave 5
	note G_, 0
	note C#, 0
	octave 4
	note A#, 0
	note G_, 0
	octave 5
	note G_, 0
	note C#, 0
	octave 4
	note A#, 0
	note G_, 0
	octave 5
	note G_, 0
	note C#, 0
	octave 4
	note A#, 0
	note G_, 0
	octave 5
	note G_, 0
	note C_, 0
	octave 4
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	note C_, 0
	octave 4
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	note C_, 0
	octave 4
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	note C_, 0
	octave 4
	note A_, 0
	note G_, 0
	endchannel
; eb03e

Music_SSAqua_branch_eb03e: ; eb03e
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	octave 4
	note B_, 0
	note A_, 0
	note G_, 0
	octave 5
	note G_, 0
	note D_, 0
	octave 4
	note B_, 0
	note G_, 0
	note B_, 0
	note G_, 0
	note C#, 0
	octave 3
	note G_, 0
	endchannel

Music_SSAqua_Ch3: ; eb056
	stereopanning $ff
	vibrato $8, $34
	notetype $6, $15
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0

Music_SSAqua_branch_eb063: ; eb063
	note G_, 15
	note __, 7
	note G_, 1
	note __, 1
	notetype $c, $15
	note G_, 1
	note G_, 9
	note __, 3
	notetype $6, $15
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 15
	note __, 7
	note G_, 1
	note __, 1
	notetype $c, $15
	note G_, 1
	note G_, 7
	note B_, 0
	octave 3
	note C#, 0
	note D_, 0
	note G_, 0
	note D_, 0
	note G_, 0
	note B_, 0
	octave 4
	note E_, 0
	callchannel Music_SSAqua_branch_eb14d
	callchannel Music_SSAqua_branch_eb14d

Music_SSAqua_branch_eb08d: ; eb08d
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	loopchannel 4, Music_SSAqua_branch_eb08d
	callchannel Music_SSAqua_branch_eb172
	callchannel Music_SSAqua_branch_eb172
	callchannel Music_SSAqua_branch_eb230
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 0
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C_, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C_, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C#, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C#, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	callchannel Music_SSAqua_branch_eb230
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C#, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note C#, 0
	note __, 2
	octave 3
	note C_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note C_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	loopchannel 0, Music_SSAqua_branch_eb063
; eb14d

Music_SSAqua_branch_eb14d: ; eb14d
	notetype $6, $15
	octave 2
	note G_, 1
	note __, 5
	note G_, 1
	note __, 5
	note G_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 3
	note G_, 0
	note __, 0
	note G_, 1
	note __, 5
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note G_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 3
	note G_, 0
	note __, 0
	endchannel
; eb172

Music_SSAqua_branch_eb172: ; eb172
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note D_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note D_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 0
	octave 2
	note G_, 0
	note __, 0
	note G_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	octave 4
	note G_, 3
	note F#, 3
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 0
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note A_, 0
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 0
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 0
	note __, 0
	note D#, 0
	note __, 0
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 3
	note E_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 0
	octave 3
	note C#, 0
	note __, 0
	note D_, 1
	note __, 1
	octave 4
	note D_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note D_, 0
	note __, 2
	octave 3
	note C#, 1
	note __, 1
	octave 4
	note B_, 3
	note G_, 3
	note E_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note C_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note G_, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	endchannel
; eb230

Music_SSAqua_branch_eb230: ; eb230
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note F#, 0
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	octave 2
	note B_, 1
	note __, 1
	octave 4
	note D#, 0
	note __, 2
	endchannel

Music_SSAqua_Ch4: ; eb249
	togglenoise $3
	notetype $c
	note __, 1

Music_SSAqua_branch_eb24e: ; eb24e
	note G#, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G_, 0
	note G#, 0
	note G_, 0
	loopchannel 12, Music_SSAqua_branch_eb24e
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2bb
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2bb
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2bb
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2c7
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2bb
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2ae
	callchannel Music_SSAqua_branch_eb2c7
	loopchannel 0, Music_SSAqua_branch_eb24e
; eb2ae

Music_SSAqua_branch_eb2ae: ; eb2ae
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	endchannel
; eb2bb

Music_SSAqua_branch_eb2bb: ; eb2bb
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note F#, 1
	endchannel
; eb2c7

Music_SSAqua_branch_eb2c7: ; eb2c7
	note A#, 1
	note G_, 0
	note G_, 0
	note D_, 1
	note G_, 0
	note G_, 0
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note C_, 1
	endchannel
; eb2d3
