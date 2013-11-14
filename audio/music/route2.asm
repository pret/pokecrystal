Music_Route2: ; ed8dd
	dbw $c0, Music_Route2_Ch1
	dbw $01, Music_Route2_Ch2
	dbw $02, Music_Route2_Ch3
	dbw $03, Music_Route2_Ch4
; ed8e9


Music_Route2_Ch1: ; ed8e9
	tempo 151
	volume $77
	stereopanning $f
	vibrato $6, $23
	notetype $c, $b1
	note __, 15
	note __, 15
	callchannel Music_Route2_branch_ed931

Music_Route2_branch_ed8fb: ; ed8fb
	intensity $b1
	octave 3
	note B_, 3
	note B_, 3
	note B_, 3
	note B_, 3
	octave 4
	note E_, 3
	note E_, 3
	note E_, 3
	note E_, 3
	callchannel Music_Route2_branch_ed931
	callchannel Music_Route2_branch_ed940
	callchannel Music_Route2_branch_ed940
	callchannel Music_Route2_branch_ed971
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	callchannel Music_Route2_branch_ed971
	note G_, 1
	octave 4
	note C_, 1
	note D_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	loopchannel 0, Music_Route2_branch_ed8fb
; ed931

Music_Route2_branch_ed931: ; ed931
	octave 4
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	intensity $b7
	note C_, 3
	octave 3
	note B_, 3
	intensity $b1
	endchannel
; ed940

Music_Route2_branch_ed940: ; ed940
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note C_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	note C_, 1
	note G#, 1
	note C_, 1
	note G#, 1
	intensity $b7
	octave 2
	note B_, 1
	octave 3
	note G#, 1
	octave 2
	note B_, 1
	octave 3
	note G_, 1
	intensity $b1
	endchannel
; ed971

Music_Route2_branch_ed971: ; ed971
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note B_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	octave 4
	note E_, 1
	note C_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	octave 3
	note A_, 1
	endchannel

Music_Route2_Ch2: ; ed996
	stereopanning $ff
	vibrato $8, $24
	notetype $c, $b2
	callchannel Music_Route2_branch_ed9ba

Music_Route2_branch_ed9a1: ; ed9a1
	intensity $b2
	callchannel Music_Route2_branch_ed9ba
	dutycycle $2
	intensity $b5
	callchannel Music_Route2_branch_ed9dc
	callchannel Music_Route2_branch_ed9dc
	callchannel Music_Route2_branch_eda02
	callchannel Music_Route2_branch_eda02
	loopchannel 0, Music_Route2_branch_ed9a1
; ed9ba

Music_Route2_branch_ed9ba: ; ed9ba
	octave 4
	note E_, 3
	note E_, 3
	note E_, 1
	octave 2
	note C_, 1
	octave 4
	note E_, 1
	octave 2
	note C_, 1
	octave 4
	note A#, 3
	note A#, 3
	note A#, 1
	octave 2
	note G_, 1
	octave 4
	note A#, 1
	octave 2
	note G_, 1
	octave 4
	note A_, 3
	note A_, 3
	note A_, 3
	note A_, 3
	note G#, 3
	note G#, 3
	intensity $b7
	note G#, 3
	note G_, 3
	intensity $b2
	endchannel
; ed9dc

Music_Route2_branch_ed9dc: ; ed9dc
	octave 2
	note C_, 3
	note __, 1
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 1
	note __, 1
	note C_, 0
	note __, 0
	note G_, 3
	note __, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 1
	note __, 1
	note G_, 0
	note __, 0
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 1
	note __, 1
	note F_, 0
	note __, 0
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 3
	note D_, 3
	endchannel
; eda02

Music_Route2_branch_eda02: ; eda02
	octave 2
	note E_, 3
	note __, 1
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 1
	note __, 1
	note E_, 0
	note __, 0
	note A_, 3
	note __, 1
	note A_, 0
	note __, 0
	note G#, 0
	note __, 0
	note G#, 1
	note __, 1
	note G#, 0
	note __, 0
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F#, 0
	note __, 0
	note F#, 1
	note __, 1
	note F#, 0
	note __, 0
	note G_, 3
	note __, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 1
	note __, 1
	note G_, 0
	note __, 0
	endchannel

Music_Route2_Ch3: ; eda2c
	stereopanning $f0
	vibrato $16, $15
	notetype $c, $14
	octave 4
	note B_, 0
	note __, 2
	note B_, 0
	note __, 2
	note B_, 0
	note __, 2
	note B_, 0
	note __, 2
	octave 5
	note E_, 0
	note __, 2
	note E_, 0
	note __, 2
	note E_, 0
	note __, 2
	note E_, 0
	note __, 2
	callchannel Music_Route2_branch_eda9e
	octave 3
	note D_, 3

Music_Route2_branch_eda4b: ; eda4b
	notetype $c, $15
	octave 3
	note C_, 3
	note __, 1
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note C_, 1
	note __, 1
	note C_, 0
	note __, 0
	note G_, 3
	note __, 1
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 1
	note __, 1
	note G_, 0
	note __, 0
	callchannel Music_Route2_branch_eda9e
	octave 3
	note D_, 1
	intensity $10
	octave 6
	note C_, 0
	note D_, 0
	callchannel Music_Route2_branch_edaaf
	note __, 3
	note G_, 7
	note F_, 1
	note G_, 1
	notetype $c, $10
	callchannel Music_Route2_branch_edaaf
	note __, 15
	intensity $25
	callchannel Music_Route2_branch_edacb
	note __, 3
	note D#, 0
	note E_, 6
	note D_, 3
	octave 5
	note B_, 0
	octave 6
	note C_, 2
	octave 5
	note B_, 3
	note A_, 3
	note B_, 7
	note G_, 3
	octave 6
	note A_, 3
	note G_, 3
	callchannel Music_Route2_branch_edacb
	note __, 3
	note G#, 0
	note A_, 6
	note B_, 3
	note F#, 0
	note G_, 15
	note G_, 14
	loopchannel 0, Music_Route2_branch_eda4b
; eda9e

Music_Route2_branch_eda9e: ; eda9e
	octave 3
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note F_, 1
	note __, 1
	note F_, 0
	note __, 0
	note F_, 3
	note __, 1
	note F_, 0
	note __, 0
	note F_, 3
	endchannel
; edaaf

Music_Route2_branch_edaaf: ; edaaf
	octave 6
	note E_, 9
	note D_, 1
	note __, 1
	note C_, 1
	notetype $6, $10
	octave 5
	note F#, 0
	note G_, 14
	note A_, 3
	note A#, 3
	note __, 3
	octave 6
	note C_, 1
	note D_, 1
	note D#, 0
	note E_, 15
	note E_, 6
	note F_, 3
	note E_, 3
	note D#, 0
	note E_, 2
	note D_, 3
	note C_, 3
	note D_, 3
	endchannel
; edacb

Music_Route2_branch_edacb: ; edacb
	octave 5
	note B_, 15
	note __, 3
	octave 6
	note C#, 0
	note D_, 6
	note E_, 3
	octave 5
	note B_, 0
	octave 6
	note C_, 15
	note C_, 2
	note D_, 3
	note __, 3
	note E_, 3
	note F_, 15
	endchannel

Music_Route2_Ch4: ; edadc
	togglenoise $5
	notetype $c

Music_Route2_branch_edae0: ; edae0
	note A_, 3
	note A_, 3
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	loopchannel 3, Music_Route2_branch_edae0
	note A_, 3
	note A_, 3
	note A_, 1
	note A_, 1
	note D#, 3

Music_Route2_branch_edaef: ; edaef
	note A_, 3
	note A_, 3
	note A_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	loopchannel 4, Music_Route2_branch_edaef

Music_Route2_branch_edaf9: ; edaf9
	note B_, 3
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	loopchannel 7, Music_Route2_branch_edaf9
	note B_, 3
	note A_, 3
	note A_, 1
	note A_, 1
	note D#, 3

Music_Route2_branch_edb09: ; edb09
	note B_, 3
	note C_, 3
	note B_, 1
	note B_, 1
	note C_, 3
	loopchannel 3, Music_Route2_branch_edb09
	note B_, 3
	note C_, 3
	note C#, 1
	note C_, 1
	note C#, 3

Music_Route2_branch_edb17: ; edb17
	note B_, 3
	note C_, 3
	note B_, 1
	note B_, 1
	note C_, 3
	loopchannel 3, Music_Route2_branch_edb17
	note B_, 3
	note C_, 3
	note D_, 1
	note D_, 1
	note D#, 3
	loopchannel 0, Music_Route2_branch_edaef
; edb29
