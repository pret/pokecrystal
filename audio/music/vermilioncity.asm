Music_VermilionCity: ; eb676
	dbw $80, Music_VermilionCity_Ch1
	dbw $01, Music_VermilionCity_Ch2
	dbw $02, Music_VermilionCity_Ch3
; eb67f

INCBIN "baserom.gbc", $eb67f, $eb680 - $eb67f

Music_VermilionCity_Ch1: ; eb680
	stereopanning $f
	tempo 176
	volume $77
	dutycycle $2
	notetype $c, $65
	octave 4
	note B_, 3
	note G#, 3
	note F#, 3
	note E_, 3
	note D_, 3
	octave 3
	note B_, 3
	note A_, 1
	note B_, 0
	octave 4
	note D_, 0
	note E_, 0
	note G#, 0
	note B_, 0
	octave 5
	note D_, 0
	vibrato $10, $23

Music_VermilionCity_branch_eb6a0: ; eb6a0
	dutycycle $1
	notetype $c, $85
	callchannel Music_VermilionCity_branch_eb6f9
	note F_, 3
	octave 4
	note D_, 3
	note C#, 3
	note E_, 3
	callchannel Music_VermilionCity_branch_eb6f9
	callchannel Music_VermilionCity_branch_eb701
	dutycycle $2
	notetype $c, $85
	callchannel Music_VermilionCity_branch_eb6f9
	note F_, 3
	octave 4
	note D_, 3
	note E_, 0
	note C#, 0
	octave 3
	note A_, 0
	note E_, 0
	octave 4
	note C#, 0
	octave 3
	note A_, 0
	note E_, 0
	note C_, 0
	callchannel Music_VermilionCity_branch_eb6f9
	callchannel Music_VermilionCity_branch_eb701
	intensity $93
	dutycycle $0
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	callchannel Music_VermilionCity_branch_eb70c
	callchannel Music_VermilionCity_branch_eb70c
	intensity $87
	dutycycle $2
	octave 4
	note D_, 7
	octave 3
	note G#, 7
	note E_, 7
	note B_, 7
	note A_, 3
	note G#, 3
	note F#, 3
	note E_, 3
	octave 2
	note B_, 3
	note G#, 3
	note B_, 3
	octave 3
	note D_, 3
	loopchannel 0, Music_VermilionCity_branch_eb6a0
; eb6f9

Music_VermilionCity_branch_eb6f9: ; eb6f9
	octave 3
	note C#, 3
	note E_, 3
	note F#, 1
	note A_, 1
	note E_, 1
	note G#, 1
	endchannel
; eb701

Music_VermilionCity_branch_eb701: ; eb701
	note D_, 1
	note F_, 1
	note A_, 1
	octave 4
	note D_, 1
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	endchannel
; eb70c

Music_VermilionCity_branch_eb70c: ; eb70c
	note __, 1
	note F#, 1
	note A_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note B_, 1
	note G#, 1
	octave 4
	note E_, 1
	octave 3
	note G#, 1
	note B_, 1
	note G#, 1
	endchannel

Music_VermilionCity_Ch2: ; eb721
	stereopanning $ff
	dutycycle $3
	notetype $c, $77
	vibrato $10, $23
	octave 5
	note E_, 3
	note D_, 3
	octave 4
	note B_, 3
	note G#, 3
	note F#, 3
	note E_, 3
	note F#, 3
	note G#, 3

Music_VermilionCity_branch_eb735: ; eb735
	notetype $c, $97
	callchannel Music_VermilionCity_branch_eb768
	note G#, 1
	callchannel Music_VermilionCity_branch_eb768
	note E_, 1
	intensity $b7
	octave 3
	note B_, 3
	octave 4
	note C#, 3
	note D_, 3
	note E_, 3
	callchannel Music_VermilionCity_branch_eb77e
	callchannel Music_VermilionCity_branch_eb77e
	note F#, 5
	note E_, 0
	note F#, 0
	note E_, 7
	note A_, 5
	note G#, 0
	note A_, 0
	note G#, 7
	note G#, 13
	notetype $6, $57
	note __, 0
	octave 4
	note E_, 0
	note G#, 0
	note B_, 0
	notetype $c, $87
	octave 5
	note E_, 15
	loopchannel 0, Music_VermilionCity_branch_eb735
; eb768

Music_VermilionCity_branch_eb768: ; eb768
	octave 1
	note A_, 7
	octave 2
	note F#, 3
	note E_, 3
	note D_, 5
	note C#, 0
	note D_, 0
	note E_, 7
	octave 1
	note A_, 7
	octave 2
	note F#, 3
	note E_, 3
	note D_, 5
	note E_, 0
	note D_, 0
	note C#, 1
	note E_, 1
	octave 1
	note A_, 1
	endchannel
; eb77e

Music_VermilionCity_branch_eb77e: ; eb77e
	note F#, 7
	note B_, 7
	note A_, 3
	note G#, 3
	note F#, 3
	note E_, 3
	endchannel

Music_VermilionCity_Ch3: ; eb785
	stereopanning $f0
	vibrato $22, $23
	notetype $c, $25
	octave 2
	note E_, 3
	note B_, 3
	octave 3
	note E_, 3
	note B_, 3
	note D_, 3
	note E_, 3
	note D_, 1
	octave 3
	note B_, 0
	note G#, 0
	note F#, 0
	note E_, 0
	note D_, 0
	octave 2
	note B_, 0

Music_VermilionCity_branch_eb79e: ; eb79e
	notetype $c, $22
	callchannel Music_VermilionCity_branch_eb7de
	octave 5
	note A_, 5
	intensity $24
	note E_, 0
	note G#, 0
	callchannel Music_VermilionCity_branch_eb7de
	note A_, 7
	intensity $14
	octave 3
	note D_, 3
	note C#, 3
	octave 2
	note B_, 3
	note A_, 3
	octave 3
	note D_, 1
	note __, 3
	note D_, 0
	note D_, 0
	callchannel Music_VermilionCity_branch_eb7f5
	octave 4
	note D_, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 1
	callchannel Music_VermilionCity_branch_eb7f5
	intensity $25
	octave 3
	note E_, 7
	octave 4
	note E_, 7
	octave 3
	note B_, 7
	octave 4
	note E_, 7
	octave 2
	note E_, 15
	octave 3
	note E_, 13
	intensity $22
	octave 5
	note E_, 0
	note G#, 0
	loopchannel 0, Music_VermilionCity_branch_eb79e
; eb7de

Music_VermilionCity_branch_eb7de: ; eb7de
	octave 5
	note A_, 7
	octave 6
	note D_, 3
	note C#, 3
	octave 5
	note B_, 5
	note A_, 0
	note B_, 0
	octave 6
	note C#, 7
	octave 5
	note A_, 7
	octave 6
	note D_, 3
	note C#, 3
	octave 5
	note B_, 5
	octave 6
	note C#, 0
	octave 5
	note B_, 0
	endchannel
; eb7f5

Music_VermilionCity_branch_eb7f5: ; eb7f5
	note A_, 0
	note __, 0
	note A_, 1
	note __, 1
	note F#, 1
	note E_, 1
	note __, 3
	note E_, 0
	note E_, 0
	octave 4
	note E_, 0
	note __, 0
	note D_, 1
	note __, 1
	octave 3
	note B_, 0
	octave 4
	note C#, 0
	endchannel
; eb808
