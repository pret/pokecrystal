Music_BattleTowerTheme: ; 178889
	dbw $c0, Music_BattleTowerTheme_Ch1
	dbw $01, Music_BattleTowerTheme_Ch2
	dbw $02, Music_BattleTowerTheme_Ch3
	dbw $03, Music_BattleTowerTheme_Ch4
; 178895


Music_BattleTowerTheme_Ch1: ; 178895
	tempo 141
	volume $77
	tone $0001
	vibrato $12, $34
	stereopanning $f
	notetype $6, $94

Music_BattleTowerTheme_branch_1788a5: ; 1788a5
	note __, 15
	note __, 15
	note __, 11
	note __, 11
	dutycycle $2
	octave 3
	note C_, 1
	note E_, 1
	note G_, 3
	callchannel Music_BattleTowerTheme_branch_17895e
	note G_, 1
	note __, 1
	note C_, 3
	note __, 3
	intensity $92
	note G_, 1
	note F_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note E_, 1
	note G_, 1
	note E_, 1
	octave 3
	note G_, 1
	note E_, 1
	callchannel Music_BattleTowerTheme_branch_17895e
	note G_, 1
	note __, 1
	octave 2
	note A#, 3
	note __, 3
	intensity $92
	octave 3
	note G_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note A_, 1
	octave 4
	note C_, 1
	note F_, 1
	note C_, 1
	octave 3
	note A_, 1
	note F_, 1
	intensity $93
	note D_, 1
	note __, 1
	note E_, 3
	note F_, 3
	note G_, 1
	note A_, 1
	note A#, 7
	octave 2
	note A#, 7
	octave 3
	note C_, 1
	note __, 1
	note D_, 3
	note E_, 3
	note F_, 1
	note G_, 1
	note A_, 7
	octave 2
	note A_, 7
	note A#, 1
	note __, 1
	octave 3
	note C_, 3
	note D_, 3
	note D#, 1
	note F_, 1
	note D#, 3
	note F_, 3
	note G_, 3
	note A#, 3
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note F_, 3
	note __, 3
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note E_, 3
	note __, 3
	dutycycle $3
	note C_, 1
	note E_, 1
	note G_, 3
	note A_, 3
	note F_, 7
	note F_, 1
	note G_, 1
	note A_, 7
	note G_, 3
	note F_, 3
	note D_, 7
	note A#, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 3
	octave 3
	note F_, 7
	note C#, 1
	note D#, 1
	note F_, 7
	note G_, 3
	note F_, 3
	note F_, 3
	note C_, 7
	note G_, 1
	note F_, 1
	note E_, 7
	octave 4
	note C_, 1
	octave 3
	note A#, 1
	note G_, 1
	note E_, 1
	note C_, 3
	note F_, 7
	note C_, 1
	note F_, 1
	note A_, 7
	note A#, 3
	octave 4
	note C_, 3
	octave 3
	note A#, 3
	note F_, 7
	note A#, 3
	octave 4
	note D_, 7
	octave 3
	note A#, 1
	note A_, 1
	note F_, 3
	note G#, 3
	note F_, 7
	note G#, 3
	note F_, 3
	note D#, 3
	note C#, 3
	note F_, 3
	intensity $94
	octave 4
	note C_, 3
	octave 3
	note E_, 5
	note __, 1
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 3
	note __, 11
	loopchannel 0, Music_BattleTowerTheme_branch_1788a5
; 17895e

Music_BattleTowerTheme_branch_17895e: ; 17895e
	intensity $94
	note A_, 1
	note __, 1
	note C_, 3
	note __, 3
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note C_, 3
	note F_, 3
	note __, 3
	note A_, 3
	endchannel

Music_BattleTowerTheme_Ch2: ; 17896d
	vibrato $12, $34

Music_BattleTowerTheme_branch_178970: ; 178970
	dutycycle $3
	notetype $6, $b8
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note A_, 3
	note __, 3
	octave 3
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 2
	note A_, 3
	octave 3
	note F_, 3
	note __, 3
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note A_, 3
	note __, 3
	tone $0001
	note A_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note F_, 3
	note __, 3
	tone $0000
	intensity $b7
	note G_, 1
	octave 4
	note C_, 1
	note E_, 3
	callchannel Music_BattleTowerTheme_branch_178a15
	note A#, 3
	note __, 1
	note F_, 1
	notetype $c, $b7
	note C_, 11
	notetype $6, $b7
	callchannel Music_BattleTowerTheme_branch_178a15
	notetype $c, $b7
	note A#, 1
	note __, 0
	note G_, 0
	note A_, 11
	note A#, 0
	note __, 0
	note A#, 3
	note G_, 0
	note A_, 0
	note A#, 3
	note D_, 3
	note A_, 0
	note __, 0
	note A_, 3
	note G_, 0
	note A_, 0
	note F_, 7
	note G_, 0
	note __, 0
	note G_, 3
	note A#, 0
	note A_, 0
	note A#, 3
	note D#, 3
	note F_, 0
	note __, 0
	note F_, 3
	note G_, 0
	note F_, 0
	note E_, 7
	stereopanning $f0
	dutycycle $2
	note F_, 5
	note A_, 0
	note A#, 0
	octave 5
	note C_, 3
	octave 4
	note A#, 1
	note A_, 1
	note A#, 15
	note A#, 5
	note G_, 0
	note A_, 0
	note A#, 3
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note A_, 5
	note A#, 0
	note A_, 0
	note G_, 7
	note A_, 5
	note F_, 0
	note A_, 0
	octave 5
	note C_, 3
	note D_, 1
	note D#, 1
	note D_, 5
	note C_, 1
	octave 4
	note A#, 7
	octave 5
	note C#, 5
	note C_, 1
	octave 4
	note A#, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note G_, 4
	note __, 0
	notetype $6, $b7
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	note G_, 3
	note __, 3
	stereopanning $ff
	dutycycle $3
	octave 3
	note C_, 1
	note D_, 1
	note E_, 3
	loopchannel 0, Music_BattleTowerTheme_branch_178970
; 178a15

Music_BattleTowerTheme_branch_178a15: ; 178a15
	note F_, 1
	note __, 1
	note F_, 7
	note C_, 1
	note F_, 1
	octave 5
	note C_, 7
	octave 4
	note A#, 3
	note A_, 3
	endchannel

Music_BattleTowerTheme_Ch3: ; 178a20
	vibrato $12, $34
	notetype $6, $16

Music_BattleTowerTheme_branch_178a26: ; 178a26
	stereopanning $ff
	callchannel Music_BattleTowerTheme_branch_178afe
	note C_, 1
	note __, 1
	note F_, 3
	note __, 3
	octave 2
	note A_, 0
	note __, 0
	octave 3
	note C_, 0
	note __, 0
	note F_, 3
	note __, 3
	stereopanning $f0
	note C_, 7
	callchannel Music_BattleTowerTheme_branch_178afe
	note C_, 1
	note __, 1
	note F_, 3
	note __, 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note E_, 3
	note C_, 3
	note __, 3
	note C_, 1
	note __, 1
	callchannel Music_BattleTowerTheme_branch_178afe
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note D#, 3
	note __, 3
	octave 2
	note A#, 0
	note __, 0
	note A#, 0
	note __, 0
	octave 3
	note C_, 3
	note F_, 3
	note __, 3
	note C_, 0
	note __, 0
	note C_, 1
	octave 2
	note A#, 1
	note __, 1
	note A#, 3
	note F_, 3
	octave 3
	note F_, 0
	note __, 0
	note F_, 1
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note F_, 7
	note C_, 1
	note __, 1
	note C_, 3
	octave 2
	note F_, 3
	octave 3
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note F_, 7
	note D#, 1
	note __, 1
	note D#, 3
	octave 2
	note G_, 3
	octave 3
	note G_, 0
	note __, 0
	note G_, 0
	note __, 0
	octave 2
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 3
	note D#, 7
	note F_, 1
	note __, 1
	note C_, 3
	note __, 3
	note C_, 1
	octave 2
	note F_, 1
	note G_, 3
	note __, 3
	stereopanning $ff
	note G_, 1
	octave 3
	note C_, 1
	note E_, 3
	note F_, 3
	note C_, 7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 3
	note C_, 5
	note __, 1
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note F_, 3
	note D_, 7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A#, 3
	note A_, 3
	note F_, 3
	note D_, 3
	note F_, 3
	note C#, 7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A#, 3
	note F_, 7
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note C_, 3
	note F_, 7
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 3
	note C_, 3
	note D_, 3
	note E_, 3
	note F_, 3
	note C_, 7
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A_, 3
	note C_, 7
	note F_, 1
	note __, 1
	note F_, 3
	octave 2
	note A#, 7
	octave 3
	note F_, 0
	note __, 0
	note F_, 0
	note __, 0
	note A#, 3
	octave 2
	note A#, 3
	octave 3
	note D_, 3
	note E_, 3
	note F_, 3
	octave 2
	note G#, 7
	octave 3
	note C#, 0
	note __, 0
	note C#, 0
	note __, 0
	note G#, 3
	octave 2
	note G#, 7
	octave 3
	note C#, 3
	note C_, 3
	note G_, 7
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note G_, 3
	note __, 11
	loopchannel 0, Music_BattleTowerTheme_branch_178a26
; 178afe

Music_BattleTowerTheme_branch_178afe: ; 178afe
	octave 3
	note C_, 1
	note __, 1
	note F_, 3
	note __, 3
	note C_, 0
	note __, 0
	note C_, 0
	note __, 0
	note F_, 3
	note C_, 3
	note __, 3
	note C_, 1
	note __, 1
	endchannel

Music_BattleTowerTheme_Ch4: ; 178b0d
	togglenoise $3
	notetype $c

Music_BattleTowerTheme_branch_178b11: ; 178b11
	callchannel Music_BattleTowerTheme_branch_178b58
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 3
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0

Music_BattleTowerTheme_branch_178b1d: ; 178b1d
	callchannel Music_BattleTowerTheme_branch_178b58
	callchannel Music_BattleTowerTheme_branch_178b61
	loopchannel 2, Music_BattleTowerTheme_branch_178b1d
	callchannel Music_BattleTowerTheme_branch_178b6c
	callchannel Music_BattleTowerTheme_branch_178b61
	callchannel Music_BattleTowerTheme_branch_178b6c
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 7

Music_BattleTowerTheme_branch_178b35: ; 178b35
	callchannel Music_BattleTowerTheme_branch_178b76
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	loopchannel 3, Music_BattleTowerTheme_branch_178b35
	callchannel Music_BattleTowerTheme_branch_178b76
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 0
	note D_, 0
	note D_, 3
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	loopchannel 0, Music_BattleTowerTheme_branch_178b11
; 178b58

Music_BattleTowerTheme_branch_178b58: ; 178b58
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	endchannel
; 178b61

Music_BattleTowerTheme_branch_178b61: ; 178b61
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	endchannel
; 178b6c

Music_BattleTowerTheme_branch_178b6c: ; 178b6c
	note D_, 1
	note D_, 3
	note D_, 0
	note D_, 0
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 0
	note D_, 0
	endchannel
; 178b76

Music_BattleTowerTheme_branch_178b76: ; 178b76
	note D_, 1
	note C#, 1
	note D_, 1
	note D_, 0
	note C#, 0
	note D_, 1
	note C#, 1
	note D_, 1
	note D_, 0
	note C#, 0
	endchannel
; 178b81
