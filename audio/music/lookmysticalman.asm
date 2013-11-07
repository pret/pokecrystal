Music_LookMysticalMan: ; 17843b
	dbw $c0, Music_LookMysticalMan_Ch1
	dbw $01, Music_LookMysticalMan_Ch2
	dbw $02, Music_LookMysticalMan_Ch3
	dbw $03, Music_LookMysticalMan_Ch4
; 178447


Music_LookMysticalMan_Ch1: ; 178447
	tempo 136
	volume $77
	vibrato $a, $34
	tone $0001
	stereopanning $f
	notetype $c, $b3
	note __, 7

Music_LookMysticalMan_branch_178458: ; 178458
	dutycycle $3
	notetype $6, $96
	octave 3
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note E_, 1
	note F#, 1
	note __, 3
	note F#, 1
	note __, 8
	note __, 8
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note D_, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 8
	note __, 8
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note C#, 1
	note E_, 1
	note __, 3
	note E_, 1
	note __, 8
	note __, 8
	note E_, 0
	note __, 0
	note E_, 0
	note __, 0
	note C#, 1
	note E_, 1
	note __, 2
	note F_, 0
	note F#, 3
	note __, 3
	note E_, 3
	note __, 3
	note C#, 3
	dutycycle $2
	callchannel Music_LookMysticalMan_branch_1784f9
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note A#, 1
	octave 4
	note C#, 5
	note __, 3
	octave 3
	note F#, 3
	note __, 3
	note E_, 3
	callchannel Music_LookMysticalMan_branch_1784f9
	octave 4
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note A#, 1
	note B_, 5
	note A#, 3
	note F#, 3
	intensity $a5
	dutycycle $0
	octave 4
	note F#, 1
	note A#, 5
	dutycycle $2
	intensity $72

Music_LookMysticalMan_branch_1784b4: ; 1784b4
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	note F#, 1
	note D_, 1
	loopchannel 4, Music_LookMysticalMan_branch_1784b4
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	note F#, 1
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F#, 1
	note B_, 1

Music_LookMysticalMan_branch_1784d4: ; 1784d4
	octave 5
	note D_, 1
	octave 4
	note G#, 1
	note E_, 1
	octave 3
	note B_, 1
	loopchannel 4, Music_LookMysticalMan_branch_1784d4
	octave 5
	note C#, 1
	octave 4
	note A#, 1
	note F#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note E_, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note E_, 1
	note F#, 1
	note A#, 1
	loopchannel 0, Music_LookMysticalMan_branch_178458
; 1784f9

Music_LookMysticalMan_branch_1784f9: ; 1784f9
	note D_, 15
	octave 4
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note D_, 5
	octave 3
	note E_, 15
	note B_, 1
	note __, 1
	octave 4
	note C#, 1
	note __, 1
	note D_, 1
	octave 3
	note B_, 5
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note C#, 5
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 3
	note B_, 1
	note A_, 5
	endchannel

Music_LookMysticalMan_Ch2: ; 17851a
	dutycycle $3
	vibrato $a, $34
	notetype $c, $b3
	note __, 7

Music_LookMysticalMan_branch_178523: ; 178523
	stereopanning $f0
	notetype $6, $b8
	octave 3
	note B_, 0
	note __, 0
	note B_, 0
	note __, 0
	note A_, 1
	note B_, 1
	note __, 3
	note B_, 1
	note __, 5
	stereopanning $ff
	note B_, 7
	note A_, 3
	stereopanning $f0
	note G#, 0
	note __, 0
	note G#, 0
	note __, 0
	note F#, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 5
	stereopanning $ff
	note F#, 7
	note G#, 3
	stereopanning $f0
	note A_, 0
	note __, 0
	note A_, 0
	note __, 0
	note G_, 1
	note A_, 1
	note __, 3
	note A_, 1
	note __, 5
	stereopanning $ff
	note A_, 7
	note G_, 3
	stereopanning $f0
	note F#, 0
	note __, 0
	note F#, 0
	note __, 0
	note E_, 1
	note F#, 1
	note __, 2
	note A_, 0
	note A#, 3
	note __, 3
	note F#, 3
	note __, 3
	note E_, 3
	callchannel Music_LookMysticalMan_branch_17859a
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note E_, 5
	callchannel Music_LookMysticalMan_branch_1785c8
	callchannel Music_LookMysticalMan_branch_17859a
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note D_, 5
	callchannel Music_LookMysticalMan_branch_1785c8
	notetype $c, $b7
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 0
	note C#, 1
	note __, 0
	octave 3
	note B_, 15
	note __, 1
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note C#, 1
	note __, 0
	octave 3
	note B_, 1
	note __, 0
	note A#, 15
	note __, 1
	loopchannel 0, Music_LookMysticalMan_branch_178523
; 17859a

Music_LookMysticalMan_branch_17859a: ; 17859a
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note F#, 1
	note A_, 5
	note B_, 7
	note __, 1
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 1
	note C#, 5
	octave 4
	note B_, 11
	intensity $88
	note A#, 0
	note A_, 0
	intensity $68
	note G#, 0
	note F#, 0
	intensity $b8
	octave 5
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 4
	note B_, 1
	note A_, 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note E_, 5
	endchannel
; 1785c8

Music_LookMysticalMan_branch_1785c8: ; 1785c8
	note C#, 7
	intensity $88
	note C_, 0
	octave 3
	note B_, 0
	note A#, 0
	intensity $68
	note G#, 0
	note F#, 0
	intensity $48
	note E_, 0
	note C#, 0
	note __, 0
	intensity $b8
	endchannel

Music_LookMysticalMan_Ch3: ; 1785db
	notetype $6, $16
	note __, 15

Music_LookMysticalMan_branch_1785df: ; 1785df
	octave 2
	note B_, 3
	octave 3
	note A_, 1
	note __, 1
	note F#, 3
	octave 2
	note B_, 0
	note __, 0
	note B_, 3
	note A_, 1
	note B_, 1
	octave 3
	note B_, 1
	octave 2
	note B_, 1
	octave 3
	note A_, 1
	octave 2
	note B_, 1
	octave 3
	note F#, 1
	note E_, 3
	note G#, 1
	note __, 1
	note B_, 3
	note E_, 0
	note __, 0
	note E_, 5
	octave 2
	note A#, 1
	note B_, 5
	note G#, 3
	note A_, 3
	octave 3
	note G_, 1
	note __, 1
	note E_, 3
	octave 2
	note A_, 0
	note __, 0
	note A_, 3
	note G_, 1
	note A_, 1
	octave 3
	note A_, 1
	octave 2
	note A_, 1
	octave 3
	note G_, 1
	octave 2
	note A_, 1
	octave 3
	note E_, 1

Music_LookMysticalMan_branch_178615: ; 178615
	octave 2
	note F#, 3
	note A#, 1
	note __, 1
	octave 3
	note C#, 3
	octave 2
	note F#, 0
	note __, 0
	note F#, 5
	note G#, 3
	note __, 3
	note A#, 3
	note B_, 3
	octave 3
	note A_, 1
	note __, 1
	note F#, 3
	octave 2
	note B_, 0
	note __, 0
	note B_, 5
	octave 3
	note D_, 1
	note __, 1
	note F#, 1
	note D_, 5
	note E_, 3
	note G#, 1
	note __, 1
	note B_, 3
	note E_, 0
	note __, 0
	note E_, 5
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note G#, 5
	note A_, 3
	octave 3
	note C#, 1
	note __, 1
	note E_, 3
	octave 2
	note A_, 0
	note __, 0
	note A_, 5
	octave 3
	note E_, 3
	note C#, 1
	octave 2
	note E_, 5
	loopchannel 2, Music_LookMysticalMan_branch_178615
	note F#, 3
	note A#, 1
	note __, 1
	octave 3
	note C#, 1
	note F#, 5
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note C#, 3
	octave 2
	note A#, 1
	octave 3
	note F#, 5
	octave 2
	note B_, 3
	octave 3
	note B_, 3
	octave 2
	note B_, 3
	octave 3
	note F#, 1
	note A_, 5
	octave 2
	note B_, 3
	octave 3
	note F#, 3
	octave 2
	note B_, 3
	note A_, 3
	note __, 1
	note A#, 3
	note __, 1
	note B_, 5
	note __, 1
	note B_, 3
	note A_, 3
	note F#, 3
	note E_, 3
	octave 3
	note E_, 3
	octave 2
	note E_, 3
	note G#, 1
	octave 3
	note D_, 5
	octave 2
	note E_, 3
	note B_, 3
	octave 3
	note E_, 3
	note F#, 3
	note __, 1
	note E_, 3
	note __, 1
	note C#, 7
	octave 2
	note B_, 7
	note A#, 3
	loopchannel 0, Music_LookMysticalMan_branch_1785df

Music_LookMysticalMan_Ch4: ; 17868e
	togglenoise $3
	notetype $c
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 0
	note D_, 0

Music_LookMysticalMan_branch_178697: ; 178697
	callchannel Music_LookMysticalMan_branch_1786d3
	callchannel Music_LookMysticalMan_branch_1786d9
	callchannel Music_LookMysticalMan_branch_1786d3
	callchannel Music_LookMysticalMan_branch_1786df
	loopchannel 2, Music_LookMysticalMan_branch_178697
	callchannel Music_LookMysticalMan_branch_1786d3
	callchannel Music_LookMysticalMan_branch_1786d9
	callchannel Music_LookMysticalMan_branch_1786d3
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 0
	note D_, 0
	note D_, 1
	note D#, 1
	note D_, 1
	note D_, 0
	note D_, 0

Music_LookMysticalMan_branch_1786ba: ; 1786ba
	note D_, 1
	note D#, 1
	note D_, 2
	note D#, 0
	note D#, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 2
	note D#, 0
	note D#, 1
	note D_, 1
	note D_, 1
	note D_, 0
	note D_, 0
	loopchannel 2, Music_LookMysticalMan_branch_1786ba
	loopchannel 0, Music_LookMysticalMan_branch_178697
; 1786d3

Music_LookMysticalMan_branch_1786d3: ; 1786d3
	note D#, 3
	note D_, 2
	note D#, 2
	note D#, 1
	note D_, 3
	endchannel
; 1786d9

Music_LookMysticalMan_branch_1786d9: ; 1786d9
	note D#, 3
	note D_, 2
	note D_, 2
	note D#, 1
	note D_, 3
	endchannel
; 1786df

Music_LookMysticalMan_branch_1786df: ; 1786df
	note D#, 3
	note D_, 1
	note D#, 0
	note D_, 2
	note D_, 1
	note D#, 1
	note D_, 0
	note D_, 0
	endchannel
; 1786e8
