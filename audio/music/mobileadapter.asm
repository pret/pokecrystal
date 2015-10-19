Music_MobileAdapter: ; 1fc87
	dbw $c0, Music_MobileAdapter_Ch1
	dbw $01, Music_MobileAdapter_Ch2
	dbw $02, Music_MobileAdapter_Ch3
	dbw $03, Music_MobileAdapter_Ch4
; 1fc93

Music_MobileAdapter_Ch1: ; 1fc93
	tempo 132
	volume $7, $7
	pitchoffset $0001
	stereopanning $f
	waveduty $2
	notetype $c, $8, $0, $4
	note __, 2
	note __, 6
	octave 3
	note G_, 1
	octave 4
	note D_, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 4
Music_MobileAdapter_branch_1fcad: ; 1fcad
	callchannel Music_MobileAdapter_branch_1fd39
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 2
	note F#, 1
	note E_, 1
	note F#, 2
	note D_, 1
	note C#, 1
	note D_, 2
	callchannel Music_MobileAdapter_branch_1fd39
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	volenvelope $9, $0, $4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 4
	octave 5
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note C#, 8
	volenvelope $9, $0, $2
	note F#, 1
	note G_, 1
	note A_, 2
	note G#, 2
	note A_, 2
	volenvelope $9, $0, $4
	note E_, 3
	octave 3
	note A_, 3
	note E_, 4
	octave 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note B_, 8
	volenvelope $9, $0, $2
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	note C#, 3
	volenvelope $9, $0, $4
	octave 4
	note C#, 3
	octave 3
	note A_, 4
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 10
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note D_, 10
	octave 4
	note A_, 8
	volenvelope $a, $0, $1
	octave 3
	note C#, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note A_, 1
	note G_, 1
	note A_, 2
	volenvelope $9, $0, $4
	note F#, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	volenvelope $7, $0, $7
	callchannel Music_MobileAdapter_branch_1ff09
	loopchannel 0, Music_MobileAdapter_branch_1fcad
; 1fd39

Music_MobileAdapter_branch_1fd39: ; 1fd39
	volenvelope $9, $0, $4
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 10
	octave 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 8
	volenvelope $a, $0, $1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note A_, 1
	note B_, 1
	octave 4
	note C#, 1
	endchannel
; 1fd63

Music_MobileAdapter_Ch2: ; 1fd63
	notetype $c, $c, $0, $1
	vibrato $10, $2, $3
	waveduty $2
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note C#, 1
	note D_, 2
	octave 3
	note B_, 1
	note A#, 1
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	volenvelope $b, $0, $4
	octave 4
	note D_, 1
	note F#, 1
Music_MobileAdapter_branch_1fd80: ; 1fd80
	callchannel Music_MobileAdapter_branch_1fdfe
	note A_, 4
	note G_, 4
	note A_, 4
	note E_, 4
	note F#, 12
	note __, 2
	note D_, 1
	note F#, 1
	callchannel Music_MobileAdapter_branch_1fdfe
	octave 5
	note C#, 4
	octave 4
	note A_, 4
	octave 5
	note F#, 4
	note E_, 4
	note D_, 12
	note __, 2
	note C#, 1
	note D_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 4
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 9
	volenvelope $a, $0, $2
	octave 3
	note E_, 3
	note C#, 2
	volenvelope $b, $0, $4
	octave 5
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note C#, 4
	note D_, 2
	note E_, 2
	note F#, 2
	note E_, 9
	volenvelope $a, $0, $2
	octave 3
	note A_, 3
	note E_, 2
	volenvelope $b, $0, $4
	octave 5
	note F#, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 4
	note F#, 2
	note E_, 2
	note D_, 1
	note C#, 1
	octave 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note G_, 4
	note F#, 2
	note D_, 2
	octave 4
	note A#, 1
	note B_, 1
	octave 5
	note C#, 12
	note E_, 4
	note D_, 16
	waveduty $1
	volenvelope $7, $0, $1
	callchannel Music_MobileAdapter_branch_1fe16
	octave 4
	note E_, 1
	note A_, 1
	octave 5
	note C#, 1
	note E_, 1
	callchannel Music_MobileAdapter_branch_1fe16
	note __, 2
	waveduty $2
	volenvelope $b, $0, $4
	octave 4
	note D_, 1
	note F#, 1
	loopchannel 0, Music_MobileAdapter_branch_1fd80
; 1fdfe

Music_MobileAdapter_branch_1fdfe: ; 1fdfe
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	octave 5
	note D_, 4
	note C#, 2
	octave 4
	note B_, 2
	note G_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 2
	octave 5
	note E_, 4
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	endchannel
; 1fe16

Music_MobileAdapter_branch_1fe16: ; 1fe16
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A#, 1
	note F#, 1
	octave 5
	note F#, 1
	note D_, 1
	octave 4
	note A#, 1
	note F#, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note C#, 4
	endchannel
; 1fe3d

Music_MobileAdapter_Ch3: ; 1fe3d
	notetype $c, $1, $0, $4
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	note A_, 4
Music_MobileAdapter_branch_1fe4f: ; 1fe4f
	callchannel Music_MobileAdapter_branch_1fecf
	callchannel Music_MobileAdapter_branch_1fee3
	callchannel Music_MobileAdapter_branch_1feee
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	callchannel Music_MobileAdapter_branch_1fecf
	callchannel Music_MobileAdapter_branch_1fee3
	callchannel Music_MobileAdapter_branch_1feee
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	callchannel Music_MobileAdapter_branch_1fee3
	callchannel Music_MobileAdapter_branch_1fef7
	note B_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	callchannel Music_MobileAdapter_branch_1fef7
	octave 3
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note C#, 1
	note __, 1
	note A_, 1
	note __, 1
	note C#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	callchannel Music_MobileAdapter_branch_1fee3
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	callchannel Music_MobileAdapter_branch_1ff09
	loopchannel 0, Music_MobileAdapter_branch_1fe4f
; 1fecf

Music_MobileAdapter_branch_1fecf: ; 1fecf
	octave 3
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	loopchannel 4, Music_MobileAdapter_branch_1fecf
Music_MobileAdapter_branch_1fed8: ; 1fed8
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	loopchannel 4, Music_MobileAdapter_branch_1fed8
	endchannel
; 1fee3

Music_MobileAdapter_branch_1fee3: ; 1fee3
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 1
	note __, 1
	loopchannel 4, Music_MobileAdapter_branch_1fee3
	endchannel
; 1feee

Music_MobileAdapter_branch_1feee: ; 1feee
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
; 1fef7

Music_MobileAdapter_branch_1fef7: ; 1fef7
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 2
	note __, 1
	octave 2
	note A_, 4
	endchannel
; 1ff09

Music_MobileAdapter_branch_1ff09: ; 1ff09
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note A_, 1
	octave 3
	note D_, 3
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note A#, 1
	octave 3
	note D_, 3
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D_, 2
	octave 2
	note B_, 1
	octave 3
	note D_, 3
	octave 2
	note A_, 2
	note __, 6
	loopchannel 2, Music_MobileAdapter_branch_1ff09
	endchannel
; 1ff2c

Music_MobileAdapter_Ch4: ; 1ff2c
	drumkittoggle $3
	stereopanning $f0
	notetype $c
	note __, 2
	note __, 10
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
Music_MobileAdapter_branch_1ff38: ; 1ff38
	callchannel Music_MobileAdapter_branch_1ff60
	callchannel Music_MobileAdapter_branch_1ff60
Music_MobileAdapter_branch_1ff3e: ; 1ff3e
	note __, 4
	note D_, 8
	note D_, 8
	note D_, 4
	note D_, 1
	note D_, 3
	note D_, 4
	loopchannel 2, Music_MobileAdapter_branch_1ff3e
Music_MobileAdapter_branch_1ff49: ; 1ff49
	note __, 4
	note D_, 4
	loopchannel 11, Music_MobileAdapter_branch_1ff49
	note __, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	note __, 4
	note D_, 8
	note D_, 8
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	loopchannel 0, Music_MobileAdapter_branch_1ff38
; 1ff60

Music_MobileAdapter_branch_1ff60: ; 1ff60
	note __, 4
	note D_, 4
	loopchannel 7, Music_MobileAdapter_branch_1ff60
	note __, 2
	note D_, 2
	note D_, 2
	note D_, 1
	note D_, 1
	endchannel
; 1ff6c

