Music_BugCatchingContest: ; f7c16
	dbw $c0, Music_BugCatchingContest_Ch1
	dbw $01, Music_BugCatchingContest_Ch2
	dbw $02, Music_BugCatchingContest_Ch3
	dbw $03, Music_BugCatchingContest_Ch4
; f7c22


Music_BugCatchingContest_Ch1: ; f7c22
	tempo 144
	volume $77
	stereopanning $f
	vibrato $8, $24
	dutycycle $2
	notetype $c, $b7
	note __, 7
	octave 4
	note C#, 0
	note __, 0
	note C#, 2
	note __, 0
	note C#, 0
	note C#, 0
	note D_, 0
	note __, 0
	note D_, 2
	note __, 0
	note D_, 0
	note D_, 0
	note D#, 0
	note __, 0
	note D#, 2
	note __, 0
	note D#, 0
	note D#, 0
	note E_, 0
	note __, 0
	note E_, 2
	note __, 0
	note E_, 0
	note E_, 0

Music_BugCatchingContest_branch_f7c4b: ; f7c4b
	notetype $c, $b1

Music_BugCatchingContest_branch_f7c4e: ; f7c4e
	note __, 1
	octave 2
	note A_, 1
	loopchannel 4, Music_BugCatchingContest_branch_f7c4e

Music_BugCatchingContest_branch_f7c55: ; f7c55
	note __, 1
	note B_, 1
	loopchannel 8, Music_BugCatchingContest_branch_f7c55
	intensity $b4
	dutycycle $1
	octave 3
	note B_, 5
	note A_, 0
	note B_, 0
	note A_, 5
	octave 4
	note D_, 0
	note E_, 0
	intensity $b1
	dutycycle $2

Music_BugCatchingContest_branch_f7c6b: ; f7c6b
	note __, 1
	octave 2
	note A_, 1
	loopchannel 4, Music_BugCatchingContest_branch_f7c6b
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	notetype $6, $b7
	octave 4
	note E_, 3
	note __, 0
	octave 3
	note B_, 0
	octave 4
	note E_, 0
	note G_, 0
	note B_, 7
	octave 5
	note E_, 7
	intensity $b1
	note __, 3
	octave 2
	note B_, 3
	note __, 3
	octave 3
	note E_, 3
	note __, 3
	note E_, 3

Music_BugCatchingContest_branch_f7c8e: ; f7c8e
	note __, 3
	octave 2
	note A_, 3
	loopchannel 3, Music_BugCatchingContest_branch_f7c8e
	intensity $a7
	octave 4
	note F#, 3
	note A_, 3
	note __, 3
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note G_, 0
	note A_, 0
	note G_, 0
	note A_, 0
	note G_, 0
	note A_, 0
	note G_, 0
	note A_, 0
	note G_, 7
	note __, 3
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note __, 1
	octave 3
	note A_, 1
	note F#, 1
	octave 4
	note F#, 0
	note G_, 0
	note F#, 0
	note G_, 0
	note F#, 0
	note G_, 0
	note F#, 0
	note G_, 0
	note F#, 7
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 4
	note G_, 1
	note __, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note B_, 1
	note __, 1
	note G#, 1
	note D_, 1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note G#, 1
	note B_, 1
	note C#, 1
	note __, 1
	note C#, 5
	note __, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 5
	note __, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note __, 1
	note D#, 5
	note __, 1
	note D#, 1
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 5
	note __, 1
	note E_, 1
	note E_, 1
	loopchannel 0, Music_BugCatchingContest_branch_f7c4b

Music_BugCatchingContest_Ch2: ; f7cf4
	stereopanning $f0
	vibrato $8, $23
	dutycycle $1
	notetype $c, $c7
	note __, 7

Music_BugCatchingContest_branch_f7cff: ; f7cff
	octave 4
	note A_, 0
	note __, 0
	note A_, 2
	note __, 0
	note A_, 0
	note A_, 0
	loopchannel 4, Music_BugCatchingContest_branch_f7cff

Music_BugCatchingContest_branch_f7d0a: ; f7d0a
	dutycycle $0
	callchannel Music_BugCatchingContest_branch_f7d8e
	octave 2
	note E_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note E_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note G_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note A_, 1
	octave 3
	note A_, 0
	note __, 0
	octave 2
	note G#, 1
	octave 3
	note G#, 0
	note __, 0
	octave 2
	note G_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note E_, 1
	octave 3
	note E_, 0
	note __, 0
	callchannel Music_BugCatchingContest_branch_f7d8e
	octave 2
	note E_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note A_, 1
	octave 4
	note C#, 0
	note __, 0
	octave 2
	note E_, 1
	octave 4
	note C#, 0
	note __, 0
	octave 2
	note D_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note A_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 2
	note D#, 1
	octave 3
	note A_, 0
	note __, 0
	dutycycle $0
	note __, 1
	octave 5
	note D_, 0
	note __, 0
	note C#, 1
	note D_, 0
	note __, 0
	octave 4
	note B_, 7
	note __, 1
	octave 5
	note D_, 0
	note __, 0
	note C#, 1
	note D_, 0
	note __, 0
	octave 4
	note A_, 7
	note __, 1
	octave 5
	note D_, 3
	note F#, 1
	note E_, 1
	note D_, 0
	note __, 0
	note C#, 1
	note D_, 0
	note __, 0
	note E_, 0
	note __, 0
	note E_, 0
	note __, 2
	note E_, 9
	note A_, 0
	note __, 0
	note A_, 0
	note __, 2
	note A_, 9
	loopchannel 0, Music_BugCatchingContest_branch_f7d0a
; f7d8e

Music_BugCatchingContest_branch_f7d8e: ; f7d8e
	octave 2
	note D_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note A_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note F#, 0
	note __, 0
	octave 2
	note C#, 1
	octave 3
	note F#, 0
	note __, 0
	octave 2
	note E_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 1
	note B_, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note C#, 1
	octave 3
	note G_, 0
	note __, 0
	octave 2
	note D#, 1
	octave 3
	note G_, 0
	note __, 0
	endchannel

Music_BugCatchingContest_Ch3: ; f7db7
	stereopanning $ff
	vibrato $10, $23
	notetype $c, $14
	note __, 7
	octave 3
	note A_, 0
	note __, 0
	note A_, 2
	note __, 0
	note A_, 0
	note A_, 0
	note B_, 0
	note __, 0
	note B_, 2
	note __, 0
	note B_, 0
	note B_, 0
	octave 4
	note C_, 0
	note __, 0
	note C_, 2
	note __, 0
	note C_, 0
	note C_, 0
	note C#, 0
	note __, 0
	note C#, 2
	note __, 0
	note C#, 0
	note C#, 0

Music_BugCatchingContest_branch_f7dda: ; f7dda
	notetype $c, $14
	note F#, 4
	note __, 0
	note F#, 0
	note G_, 0
	note A_, 3
	octave 5
	note D_, 3
	note C#, 1
	intensity $10
	note E_, 0
	note G_, 0
	note B_, 0
	note __, 0
	note G_, 0
	note E_, 0
	notetype $6, $20
	octave 6
	note E_, 0
	note F#, 0
	note E_, 0
	note F#, 0
	note E_, 0
	note F#, 0
	note E_, 0
	note F#, 0
	note E_, 7
	intensity $14
	octave 4
	note E_, 9
	note __, 1
	note E_, 1
	note F#, 1
	note G_, 7
	octave 5
	note C#, 7
	note __, 3
	intensity $10
	note E_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note E_, 1
	note C_, 1
	octave 6
	note C#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 0
	note D_, 0
	note C#, 7
	intensity $15
	octave 5
	note F#, 3
	note __, 3
	note G_, 3
	note __, 3
	note A_, 3
	note __, 3
	octave 6
	note D_, 3
	note __, 3
	note C#, 11
	octave 5
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 3
	note __, 3
	octave 6
	note G_, 3
	note F#, 3
	note __, 3
	octave 5
	note G_, 3
	note A_, 3
	note B_, 3
	octave 6
	note E_, 3
	note D_, 3
	note C#, 3
	octave 5
	note B_, 1
	octave 6
	note C#, 1
	note D_, 3
	note __, 7
	octave 5
	note B_, 3
	note A_, 3
	note __, 0
	note D#, 0
	note F#, 0
	note A_, 0
	octave 6
	note C_, 7
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note C_, 1
	note __, 1
	octave 3
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 5
	note __, 1
	note A_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 5
	note __, 1
	note B_, 1
	note B_, 1
	octave 4
	note C_, 1
	note __, 1
	note C_, 5
	note __, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note __, 1
	note C#, 5
	note __, 1
	note C#, 1
	note C#, 1
	loopchannel 0, Music_BugCatchingContest_branch_f7dda

Music_BugCatchingContest_Ch4: ; f7e9a
	togglenoise $4
	notetype $6
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note E_, 1
	note E_, 1
	callchannel Music_BugCatchingContest_branch_f7ee2

Music_BugCatchingContest_branch_f7eaf: ; f7eaf
	note D_, 3
	note D_, 3
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 3
	note D_, 3
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 3
	note D_, 3
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 3
	note D_, 3
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	note C#, 0
	loopchannel 5, Music_BugCatchingContest_branch_f7eaf
	note D_, 3
	note D_, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 3
	note D_, 3
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
	callchannel Music_BugCatchingContest_branch_f7ee2
	loopchannel 0, Music_BugCatchingContest_branch_f7eaf
; f7ee2

Music_BugCatchingContest_branch_f7ee2: ; f7ee2
	note D_, 3
	note B_, 7
	note D_, 1
	note D_, 1
	note D_, 3
	note B_, 7
	note D_, 1
	note D_, 1
	note D_, 3
	note B_, 7
	note D_, 1
	note D_, 1
	note D_, 3
	note B_, 7
	note D_, 1
	note D_, 1
	endchannel
; f7ef3
