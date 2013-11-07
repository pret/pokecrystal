Music_Route37: ; ee94b
	dbw $c0, Music_Route37_Ch1
	dbw $01, Music_Route37_Ch2
	dbw $02, Music_Route37_Ch3
	dbw $03, Music_Route37_Ch4
; ee957


Music_Route37_Ch1: ; ee957
	tempo 144
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $22
	notetype $c, $b3
	note __, 15
	note __, 15

Music_Route37_branch_ee969: ; ee969
	intensity $b3
	note __, 1
	octave 2
	note F#, 1
	note B_, 1
	octave 3
	note E_, 1
	intensity $b7
	note D#, 9
	intensity $b3
	note E_, 3
	note D#, 3
	note C#, 3
	octave 2
	note B_, 1
	octave 3
	note D#, 2
	octave 2
	note B_, 0
	intensity $b7
	note F#, 7
	note B_, 7
	octave 3
	note B_, 11
	intensity $b3
	note __, 1
	octave 2
	note F#, 1
	note B_, 1
	octave 3
	note E_, 1
	intensity $b7
	note D#, 9
	octave 2
	note A_, 3
	octave 3
	note C#, 3
	note E_, 3
	note A_, 1
	note F#, 2
	note A_, 0
	note B_, 5
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note F#, 1
	note B_, 1
	note A_, 3
	note F#, 3
	note E_, 1
	note D#, 3
	stereopanning $f

Music_Route37_branch_ee9a5: ; ee9a5
	callchannel Music_Route37_branch_ee9da
	octave 3
	note C#, 3
	loopchannel 2, Music_Route37_branch_ee9a5
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F#, 3
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F#, 3
	callchannel Music_Route37_branch_ee9da
	octave 3
	note E_, 3
	callchannel Music_Route37_branch_ee9da
	octave 3
	note G#, 3
	callchannel Music_Route37_branch_ee9e9
	octave 4
	note D#, 3
	callchannel Music_Route37_branch_ee9e9
	octave 3
	note F_, 3
	stereopanning $ff
	callchannel Music_Route37_branch_ee9e9
	note __, 3
	callchannel Music_Route37_branch_ee9e9
	note __, 3
	loopchannel 0, Music_Route37_branch_ee969
; ee9da

Music_Route37_branch_ee9da: ; ee9da
	intensity $c2
	octave 2
	note A_, 1
	note A_, 0
	note A_, 0
	note A_, 1
	note A_, 0
	note A_, 0
	note A_, 0
	note A_, 0
	note A_, 1
	intensity $b7
	endchannel
; ee9e9

Music_Route37_branch_ee9e9: ; ee9e9
	intensity $c2
	octave 2
	note B_, 1
	note B_, 0
	note B_, 0
	note B_, 1
	note B_, 0
	note B_, 0
	note B_, 0
	note B_, 0
	note B_, 1
	intensity $b7
	endchannel

Music_Route37_Ch2: ; ee9f8
	dutycycle $3
	vibrato $1c, $12
	notetype $c, $c2
	octave 2
	note B_, 1
	notetype $c, $c1
	note B_, 0
	note B_, 0
	intensity $c2
	note B_, 1
	intensity $c1
	note B_, 0
	note B_, 0
	note B_, 0
	note B_, 0
	intensity $c2
	note B_, 5
	note B_, 1
	intensity $c1
	note B_, 0
	note B_, 0
	intensity $c2
	note B_, 1
	intensity $c1
	note B_, 0
	note B_, 0
	note B_, 0
	note B_, 0
	intensity $c2
	note B_, 1

Music_Route37_branch_eea24: ; eea24
	callchannel Music_Route37_branch_eeab7
	intensity $c6
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	note A_, 3
	note E_, 3
	intensity $b0
	note F#, 7
	intensity $b7
	note F#, 7
	intensity $c7
	note D#, 11
	callchannel Music_Route37_branch_eeab7
	intensity $c7
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	octave 4
	note C#, 3
	note E_, 3
	intensity $b0
	note D#, 15
	intensity $b0
	note D#, 7
	intensity $b7
	note D#, 7
	intensity $c4
	note __, 3
	octave 3
	note A_, 2
	octave 4
	note E_, 0
	note A_, 3
	note G#, 3
	intensity $a0
	note C#, 5
	note D#, 5
	note E_, 3
	intensity $c3
	note F#, 2
	note E_, 0
	intensity $b0
	note D#, 5
	intensity $b7
	note D#, 5
	intensity $c3
	octave 3
	note B_, 2
	note F#, 0
	intensity $b0
	octave 4
	note D#, 5
	intensity $b7
	octave 4
	note D#, 5
	intensity $c4
	note __, 3
	octave 3
	note A_, 2
	octave 4
	note E_, 0
	note A_, 3
	note G#, 3
	intensity $b0
	note C#, 5
	note D#, 5
	note E_, 3
	intensity $c3
	note F#, 2
	note D#, 0
	intensity $b0
	note B_, 5
	intensity $b7
	note B_, 5
	intensity $c3
	note B_, 2
	note F#, 0
	intensity $b0
	octave 5
	note D#, 5
	intensity $b7
	octave 5
	note D#, 5
	intensity $c2
	octave 3
	note F#, 1
	note F#, 0
	note F#, 0
	note F#, 1
	intensity $c1
	note F#, 0
	note F#, 0
	note F#, 0
	note F#, 0
	intensity $c2
	note F#, 5
	note F#, 1
	note F#, 0
	note F#, 0
	note F#, 1
	intensity $c1
	note F#, 0
	note F#, 0
	note F#, 0
	note F#, 0
	intensity $c2
	note F#, 1
	loopchannel 0, Music_Route37_branch_eea24
; eeab7

Music_Route37_branch_eeab7: ; eeab7
	intensity $c7
	octave 3
	note F#, 3
	intensity $b0
	note B_, 4
	intensity $b7
	note B_, 4
	intensity $c3
	note F#, 1
	note F#, 1
	note B_, 1
	endchannel

Music_Route37_Ch3: ; eeac7
	stereopanning $f0
	notetype $c, $14

Music_Route37_branch_eeacc: ; eeacc
	octave 2
	note F#, 1
	note __, 5
	loopchannel 4, Music_Route37_branch_eeacc

Music_Route37_branch_eead3: ; eead3
	callchannel Music_Route37_branch_eeb32
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note G#, 1
	note B_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note E_, 1

Music_Route37_branch_eeae0: ; eeae0
	note D#, 1
	note F#, 1
	loopchannel 4, Music_Route37_branch_eeae0
	callchannel Music_Route37_branch_eeb32
	callchannel Music_Route37_branch_eeb32
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note G#, 1
	note B_, 1
	note F#, 1
	note A_, 1
	octave 3
	note C#, 1
	octave 2
	note A_, 1
	callchannel Music_Route37_branch_eeb32

Music_Route37_branch_eeafb: ; eeafb
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	loopchannel 4, Music_Route37_branch_eeafb

Music_Route37_branch_eeb03: ; eeb03
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	loopchannel 7, Music_Route37_branch_eeb03
	note E_, 1
	note C#, 1
	callchannel Music_Route37_branch_eeb3c

Music_Route37_branch_eeb10: ; eeb10
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	loopchannel 4, Music_Route37_branch_eeb10

Music_Route37_branch_eeb18: ; eeb18
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	loopchannel 7, Music_Route37_branch_eeb18
	note E_, 1
	note C#, 1
	callchannel Music_Route37_branch_eeb3c
	callchannel Music_Route37_branch_eeb32

Music_Route37_branch_eeb28: ; eeb28
	note F#, 1
	note __, 5
	loopchannel 4, Music_Route37_branch_eeb28
	loopchannel 0, Music_Route37_branch_eead3
; eeb32

Music_Route37_branch_eeb32: ; eeb32
	octave 2
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	note F#, 1
	note B_, 1
	endchannel
; eeb3c

Music_Route37_branch_eeb3c: ; eeb3c
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	endchannel

Music_Route37_Ch4: ; eeb4d
	stereopanning $f
	togglenoise $0

Music_Route37_branch_eeb51: ; eeb51
	notetype $c
	callchannel Music_Route37_branch_eeb6b
	note D_, 0
	note D#, 0
	note D#, 0
	note D_, 0
	callchannel Music_Route37_branch_eeb6b
	notetype $6
	note D#, 0
	note D#, 0
	note D#, 0
	note D#, 0
	note D#, 0
	note D_, 0
	note D_, 0
	note D_, 0
	loopchannel 0, Music_Route37_branch_eeb51
; eeb6b

Music_Route37_branch_eeb6b: ; eeb6b
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 1
	note D#, 0
	note D#, 0
	note D_, 1
	note D#, 0
	note D#, 0
	endchannel
; eeb75
