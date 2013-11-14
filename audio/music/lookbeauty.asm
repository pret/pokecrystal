Music_LookBeauty: ; eee3e
	dbw $c0, Music_LookBeauty_Ch1
	dbw $01, Music_LookBeauty_Ch2
	dbw $02, Music_LookBeauty_Ch3
	dbw $03, Music_LookBeauty_Ch4
; eee4a


Music_LookBeauty_Ch1: ; eee4a
	stereopanning $f
	vibrato $12, $25
	dutycycle $2
	tempo 128
	volume $77
	notetype $c, $a3
	note __, 15
	note __, 7
	octave 4
	note C_, 7
	dutycycle $3

Music_LookBeauty_branch_eee5f: ; eee5f
	note __, 3
	octave 3
	note D_, 0
	note __, 4
	note D_, 0
	note __, 4
	note __, 1
	note D_, 0
	note __, 2
	note D_, 0
	note __, 4
	note D_, 3
	note __, 3
	note D_, 0
	note __, 4
	note D_, 0
	note __, 4
	note __, 1
	note D_, 0
	note __, 2
	note D_, 0
	note __, 2
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note E_, 0
	note __, 4
	note E_, 0
	note __, 4
	note __, 1
	note E_, 0
	note __, 2
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 3
	note __, 3
	note F#, 0
	note __, 4
	note F#, 0
	note __, 2
	note D_, 1
	note D_, 0
	note __, 6
	octave 2
	note A_, 0
	octave 3
	note C_, 0
	note D#, 0
	note F#, 0
	note D#, 0
	note F#, 0
	note A_, 0
	octave 4
	note C_, 0
	loopchannel 0, Music_LookBeauty_branch_eee5f

Music_LookBeauty_Ch2: ; eee9c
	stereopanning $f0
	vibrato $10, $23
	dutycycle $2
	notetype $c, $c7
	octave 3
	note D_, 0
	note __, 0
	octave 5
	note D_, 5
	note C_, 0
	note __, 0
	octave 4
	note B_, 0
	note __, 0
	note A#, 0
	note __, 0
	note A_, 0
	note __, 0
	note G#, 0
	note __, 0
	note G_, 0
	note __, 0
	note F#, 0
	note __, 0
	note F_, 0
	note __, 0
	note E_, 1
	note D_, 0
	note __, 0
	note E_, 0
	note __, 0
	note F#, 0
	note __, 0
	dutycycle $3

Music_LookBeauty_branch_eeec5: ; eeec5
	notetype $c, $c7
	note G_, 15
	note A_, 7
	note B_, 7
	note A_, 9
	note G#, 0
	note __, 0
	note A_, 0
	note __, 0
	note G#, 1
	note G#, 7
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	intensity $b7
	vibrato $10, $24
	octave 5
	note C_, 14
	notetype $6, $c7
	intensity $c5
	vibrato $10, $23
	note __, 0
	note C#, 0
	note D_, 15
	note C_, 15
	octave 4
	note B_, 15
	note __, 3
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note A_, 5
	note __, 13
	note F#, 7
	note A_, 7
	loopchannel 0, Music_LookBeauty_branch_eeec5

Music_LookBeauty_Ch3: ; eeefa
	stereopanning $ff
	vibrato $8, $12
	notetype $c, $15
	note __, 15
	octave 5
	note E_, 0
	note __, 0
	note D#, 0
	note __, 0
	note D_, 0
	note __, 0
	note C#, 0
	note __, 0
	octave 3
	note D_, 6
	note F#, 0

Music_LookBeauty_branch_eef0f: ; eef0f
	note G_, 3
	octave 4
	note B_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	note D_, 0
	note __, 0
	octave 4
	note B_, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 0
	note G_, 1
	note G_, 0
	octave 4
	note A#, 0
	note B_, 0
	note __, 0
	octave 3
	note G_, 0
	note __, 0
	octave 4
	note B_, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 2
	octave 4
	note B_, 3
	octave 3
	note E_, 3
	octave 4
	note B_, 0
	note __, 0
	octave 3
	note E_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 4
	note A_, 0
	note __, 0
	octave 2
	note B_, 0
	note __, 0
	octave 3
	note E_, 1
	note E_, 0
	octave 4
	note G_, 0
	note G#, 0
	note __, 0
	octave 3
	note E_, 0
	note __, 0
	octave 4
	note F#, 0
	note __, 2
	note G#, 1
	note __, 1
	note B_, 1
	octave 3
	note A_, 3
	octave 5
	note C_, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 0
	note E_, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	octave 3
	note E_, 0
	note __, 0
	note A_, 1
	note A_, 0
	octave 4
	note B_, 0
	octave 5
	note C_, 0
	note __, 0
	octave 3
	note A_, 0
	note __, 0
	octave 5
	note C_, 0
	note __, 0
	note D_, 0
	note __, 2
	note C_, 3
	octave 3
	note D_, 3
	octave 4
	note B_, 0
	note __, 0
	octave 3
	note D_, 0
	note __, 0
	octave 2
	note A_, 0
	note __, 0
	octave 4
	note A_, 0
	note __, 0
	octave 2
	note A_, 0
	note __, 0
	octave 4
	note A_, 1
	note A_, 0
	note __, 6
	octave 3
	note D_, 7
	loopchannel 0, Music_LookBeauty_branch_eef0f

Music_LookBeauty_Ch4: ; eef8b
	togglenoise $3
	notetype $c
	note __, 15
	note __, 15

Music_LookBeauty_branch_eef91: ; eef91
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	callchannel Music_LookBeauty_branch_eefa1
	loopchannel 0, Music_LookBeauty_branch_eef91
; eefa1

Music_LookBeauty_branch_eefa1: ; eefa1
	note F#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note F#, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	endchannel
; eefb2
