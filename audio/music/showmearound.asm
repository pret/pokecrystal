Music_ShowMeAround: ; edbd8
	dbw $c0, Music_ShowMeAround_Ch1
	dbw $01, Music_ShowMeAround_Ch2
	dbw $02, Music_ShowMeAround_Ch3
	dbw $03, Music_ShowMeAround_Ch4
; edbe4


Music_ShowMeAround_Ch1: ; edbe4
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $2
	notetype $c, $b1
	octave 4
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 3
	note G#, 0
	note B_, 0
	octave 4
	note D_, 0
	note E_, 0
	note G#, 7

Music_ShowMeAround_branch_edc01: ; edc01
	note __, 15
	note __, 15
	note __, 15
	note __, 15
	callchannel Music_ShowMeAround_branch_edc98
	callchannel Music_ShowMeAround_branch_edc15
	callchannel Music_ShowMeAround_branch_edc98
	callchannel Music_ShowMeAround_branch_edc15
	loopchannel 0, Music_ShowMeAround_branch_edc01
; edc15

Music_ShowMeAround_branch_edc15: ; edc15
	note __, 3
	octave 3
	note C#, 0
	note __, 4
	note D_, 3
	note C_, 0
	note __, 0
	note __, 3
	octave 2
	note E_, 0
	note __, 0
	note G#, 0
	note __, 0
	octave 4
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	endchannel
; edc2a

Music_ShowMeAround_Ch2: ; edc2a
	stereopanning $ff
	dutycycle $2
	notetype $c, $b1
	octave 5
	note E_, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	note A_, 1
	note G#, 1
	note E_, 3
	note E_, 0
	note G#, 0
	note B_, 0
	octave 5
	note D_, 0
	note E_, 7
	dutycycle $1

Music_ShowMeAround_branch_edc44: ; edc44
	callchannel Music_ShowMeAround_branch_edc98
	callchannel Music_ShowMeAround_branch_edc98
	callchannel Music_ShowMeAround_branch_edc86
	note A_, 3
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 3
	note D_, 1
	note C#, 1
	octave 3
	note B_, 3
	callchannel Music_ShowMeAround_branch_edc86
	note A_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note A_, 1
	note A_, 3
	callchannel Music_ShowMeAround_branch_edc8e
	note A_, 3
	octave 5
	note C#, 1
	octave 4
	note A_, 1
	note A_, 3
	note G#, 0
	note G_, 0
	note F#, 0
	note F_, 0
	note E_, 0
	note __, 0
	note D#, 0
	note E_, 0
	callchannel Music_ShowMeAround_branch_edc8e
	note A_, 1
	octave 5
	note E_, 1
	note D_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A_, 1
	note A_, 3
	loopchannel 0, Music_ShowMeAround_branch_edc44
; edc86

Music_ShowMeAround_branch_edc86: ; edc86
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 3
	note D_, 1
	note F#, 1
	endchannel
; edc8e

Music_ShowMeAround_branch_edc8e: ; edc8e
	octave 5
	note C#, 1
	octave 4
	note A_, 1
	note A_, 3
	octave 5
	note F#, 1
	octave 4
	note A_, 1
	endchannel
; edc98

Music_ShowMeAround_branch_edc98: ; edc98
	note __, 3
	octave 3
	note C#, 0
	note __, 4
	note D_, 3
	note C_, 0
	note __, 0
	note __, 1
	note C#, 0
	note __, 4
	octave 2
	note E_, 0
	note __, 2
	note A#, 1
	note B_, 0
	note __, 0
	endchannel

Music_ShowMeAround_Ch3: ; edca9
	stereopanning $f0
	vibrato $10, $22
	notetype $6, $25
	octave 2
	note B_, 0
	note __, 2
	octave 3
	note D_, 0
	note __, 2
	note E_, 0
	note __, 2
	note G#, 0
	note __, 2
	note B_, 0
	note __, 2
	octave 4
	note D_, 0
	note __, 2
	note E_, 0
	note __, 2
	note G#, 0
	note __, 2
	note D_, 1
	note __, 5
	note D_, 1
	octave 3
	note B_, 1
	note G#, 1
	note B_, 1
	note E_, 1
	note __, 5
	intensity $14
	octave 2
	note B_, 0
	note A#, 0
	note A_, 0
	note G#, 0
	note G_, 0
	note F_, 0
	note E_, 1
	intensity $14

Music_ShowMeAround_branch_edcd9: ; edcd9
	callchannel Music_ShowMeAround_branch_edcef
	callchannel Music_ShowMeAround_branch_edcef
	callchannel Music_ShowMeAround_branch_edcef
	callchannel Music_ShowMeAround_branch_edd0f
	callchannel Music_ShowMeAround_branch_edcef
	callchannel Music_ShowMeAround_branch_edd0f
	loopchannel 0, Music_ShowMeAround_branch_edcd9
; edcef

Music_ShowMeAround_branch_edcef: ; edcef
	octave 2
	note A_, 1
	note __, 5
	octave 4
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 7
	note D#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 5
	octave 2
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 5
	note C#, 3
	note D_, 1
	note __, 1
	endchannel
; edd0f

Music_ShowMeAround_branch_edd0f: ; edd0f
	octave 2
	note A_, 1
	note __, 5
	octave 4
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 4
	note F#, 7
	note D#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 5
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 5
	endchannel

Music_ShowMeAround_Ch4: ; edd30
	togglenoise $3
	notetype $c
	note __, 15
	note __, 7
	note D_, 1
	note D#, 1
	note F#, 3

Music_ShowMeAround_branch_edd39: ; edd39
	callchannel Music_ShowMeAround_branch_edd4f
	callchannel Music_ShowMeAround_branch_edd4f
	callchannel Music_ShowMeAround_branch_edd4f
	callchannel Music_ShowMeAround_branch_edd5e
	callchannel Music_ShowMeAround_branch_edd4f
	callchannel Music_ShowMeAround_branch_edd5e
	loopchannel 0, Music_ShowMeAround_branch_edd39
; edd4f

Music_ShowMeAround_branch_edd4f: ; edd4f
	note D#, 1
	note F#, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note F#, 3
	note D_, 1
	note D#, 1
	note F#, 3
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note D#, 1
	endchannel
; edd5e

Music_ShowMeAround_branch_edd5e: ; edd5e
	note D#, 1
	note F#, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note F#, 3
	note D_, 1
	note D#, 1
	note F#, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note F#, 1
	endchannel
; edd6d
