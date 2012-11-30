_Music_LookMysticalMan: ; 0x17843b
	db $c0
	dw _Music_LookMysticalMan_Ch1
	db $01
	dw _Music_LookMysticalMan_Ch2
	db $02
	dw _Music_LookMysticalMan_Ch3
	db $03
	dw _Music_LookMysticalMan_Ch4
; 0x178447

_Music_LookMysticalMan_Ch1: ; 0x178447
	tempo $8800
	volume $77
	vibrato $0a, $34
	tone $0100
	stereopanning $0f
	notetype $0c, $b3
	note $07
	dutycycle $03
	notetype $06, $96
	octave3
	note $70
	note $00
	note $70
	note $00
	note $51
	note $71
	note $03
	note $71
	note $08
	note $08
	note $50
	note $00
	note $50
	note $00
	note $31
	note $51
	note $03
	note $51
	note $08
	note $08
	note $50
	note $00
	note $50
	note $00
	note $21
	note $51
	note $03
	note $51
	note $08
	note $08
	note $50
	note $00
	note $50
	note $00
	note $21
	note $51
	note $02
	note $60
	note $73
	note $03
	note $53
	note $03
	note $23
	dutycycle $02
	callchannel _Music_LookMysticalMan_sub_0x1784f9
	octave4
	note $21
	note $01
	octave3
	note $c1
	note $01
	note $b1
	octave4
	note $25
	note $03
	octave3
	note $73
	note $03
	note $53
	callchannel _Music_LookMysticalMan_sub_0x1784f9
	octave4
	note $21
	note $01
	note $21
	note $01
	octave3
	note $b1
	note $c5
	note $b3
	note $73
	intensity $a5
	dutycycle $00
	octave4
	note $71
	note $b5
	dutycycle $02
	intensity $72
	octave5
	note $31
	octave4
	note $c1
	note $71
	note $31
	loopchannel $04, $44b4
	octave5
	note $31
	octave4
	note $c1
	note $71
	note $31
	octave3
	note $a1
	note $71
	note $31
	octave2
	note $a1
	note $c1
	octave3
	note $31
	note $71
	note $a1
	note $c1
	octave4
	note $31
	note $71
	note $c1
	octave5
	note $31
	octave4
	note $91
	note $51
	octave3
	note $c1
	loopchannel $04, $44d4
	octave5
	note $21
	octave4
	note $b1
	note $71
	note $21
	octave3
	note $b1
	note $71
	note $21
	octave2
	note $b1
	octave3
	note $21
	note $51
	note $71
	note $b1
	octave4
	note $21
	note $51
	note $71
	note $b1
	loopchannel $00, $4458 ; end
; 0x1784f9

_Music_LookMysticalMan_sub_0x1784f9: ; 0x1784f9
; subroutine
	note $3f
	octave4
	note $31
	note $01
	note $51
	note $01
	note $71
	note $35
	octave3
	note $5f
	note $c1
	note $01
	octave4
	note $21
	note $01
	note $31
	octave3
	note $c5
	octave4
	note $51
	note $01
	note $51
	note $01
	note $31
	note $25
	note $21
	note $01
	note $21
	note $01
	octave3
	note $c1
	note $a5
	endchannel ; end
; 0x17851a

_Music_LookMysticalMan_Ch2: ; 0x17851a
	dutycycle $03
	vibrato $0a, $34
	notetype $0c, $b3
	note $07
	stereopanning $f0
	notetype $06, $b8
	octave3
	note $c0
	note $00
	note $c0
	note $00
	note $a1
	note $c1
	note $03
	note $c1
	note $05
	stereopanning $ff
	note $c7
	note $a3
	stereopanning $f0
	note $90
	note $00
	note $90
	note $00
	note $71
	note $91
	note $03
	note $91
	note $05
	stereopanning $ff
	note $77
	note $93
	stereopanning $f0
	note $a0
	note $00
	note $a0
	note $00
	note $81
	note $a1
	note $03
	note $a1
	note $05
	stereopanning $ff
	note $a7
	note $83
	stereopanning $f0
	note $70
	note $00
	note $70
	note $00
	note $51
	note $71
	note $02
	note $a0
	note $b3
	note $03
	note $73
	note $03
	note $53
	callchannel _Music_LookMysticalMan_sub_0x17859a
	note $71
	note $01
	note $51
	note $01
	note $31
	note $55
	callchannel _Music_LookMysticalMan_sub_0x1785c8
	callchannel _Music_LookMysticalMan_sub_0x17859a
	note $71
	note $01
	note $71
	note $01
	note $51
	note $35
	callchannel _Music_LookMysticalMan_sub_0x1785c8
	notetype $0c, $b7
	note $c1
	note $01
	note $c1
	note $01
	octave4
	note $31
	note $00
	note $21
	note $00
	octave3
	note $cf
	note $01
	note $c1
	note $01
	octave4
	note $31
	note $01
	note $21
	note $00
	octave3
	note $c1
	note $00
	note $bf
	note $01
	loopchannel $00, $4523 ; end
; 0x17859a

_Music_LookMysticalMan_sub_0x17859a: ; 0x17859a
; subroutine
	note $c1
	note $01
	octave4
	note $31
	note $01
	note $71
	note $a5
	note $c7
	note $01
	note $a1
	note $c1
	octave5
	note $21
	note $31
	note $01
	note $21
	note $01
	note $31
	note $25
	octave4
	note $cb
	intensity $88
	note $b0
	note $a0
	intensity $68
	note $90
	note $70
	intensity $b8
	octave5
	note $21
	note $01
	note $21
	note $01
	octave4
	note $c1
	note $a5
	note $81
	note $01
	note $81
	note $01
	note $71
	note $55
	endchannel ; end
; 0x1785c8

_Music_LookMysticalMan_sub_0x1785c8: ; 0x1785c8
; subroutine
	note $27
	intensity $88
	note $10
	octave3
	note $c0
	note $b0
	intensity $68
	note $90
	note $70
	intensity $48
	note $50
	note $20
	note $00
	intensity $b8
	endchannel ; end
; 0x1785db

_Music_LookMysticalMan_Ch3: ; 0x1785db
	notetype $06, $16
	note $0f
	octave2
	note $c3
	octave3
	note $a1
	note $01
	note $73
	octave2
	note $c0
	note $00
	note $c3
	note $a1
	note $c1
	octave3
	note $c1
	octave2
	note $c1
	octave3
	note $a1
	octave2
	note $c1
	octave3
	note $71
	note $53
	note $91
	note $01
	note $c3
	note $50
	note $00
	note $55
	octave2
	note $b1
	note $c5
	note $93
	note $a3
	octave3
	note $81
	note $01
	note $53
	octave2
	note $a0
	note $00
	note $a3
	note $81
	note $a1
	octave3
	note $a1
	octave2
	note $a1
	octave3
	note $81
	octave2
	note $a1
	octave3
	note $51
	octave2
	note $73
	note $b1
	note $01
	octave3
	note $23
	octave2
	note $70
	note $00
	note $75
	note $93
	note $03
	note $b3
	note $c3
	octave3
	note $a1
	note $01
	note $73
	octave2
	note $c0
	note $00
	note $c5
	octave3
	note $31
	note $01
	note $71
	note $35
	note $53
	note $91
	note $01
	note $c3
	note $50
	note $00
	note $55
	note $31
	note $01
	octave2
	note $c1
	note $95
	note $a3
	octave3
	note $21
	note $01
	note $53
	octave2
	note $a0
	note $00
	note $a5
	octave3
	note $53
	note $21
	octave2
	note $55
	loopchannel $02, $4615
	note $73
	note $b1
	note $01
	octave3
	note $21
	note $75
	octave2
	note $71
	note $01
	octave3
	note $23
	octave2
	note $b1
	octave3
	note $75
	octave2
	note $c3
	octave3
	note $c3
	octave2
	note $c3
	octave3
	note $71
	note $a5
	octave2
	note $c3
	octave3
	note $73
	octave2
	note $c3
	note $a3
	note $01
	note $b3
	note $01
	note $c5
	note $01
	note $c3
	note $a3
	note $73
	note $53
	octave3
	note $53
	octave2
	note $53
	note $91
	octave3
	note $35
	octave2
	note $53
	note $c3
	octave3
	note $53
	note $73
	note $01
	note $53
	note $01
	note $27
	octave2
	note $c7
	note $b3
	loopchannel $00, $45df ; end
; 0x17868e

_Music_LookMysticalMan_Ch4: ; 0x17868e
	togglenoise $03
	notetype $0c
	note $41
	note $41
	note $31
	note $30
	note $30
	callchannel _Music_LookMysticalMan_sub_0x1786d3
	callchannel _Music_LookMysticalMan_sub_0x1786d9
	callchannel _Music_LookMysticalMan_sub_0x1786d3
	callchannel _Music_LookMysticalMan_sub_0x1786df
	loopchannel $02, $4697
	callchannel _Music_LookMysticalMan_sub_0x1786d3
	callchannel _Music_LookMysticalMan_sub_0x1786d9
	callchannel _Music_LookMysticalMan_sub_0x1786d3
	note $31
	note $41
	note $31
	note $40
	note $30
	note $31
	note $41
	note $31
	note $30
	note $30
	note $31
	note $41
	note $32
	note $40
	note $41
	note $41
	note $31
	note $41
	note $31
	note $41
	note $32
	note $40
	note $41
	note $31
	note $31
	note $30
	note $30
	loopchannel $02, $46ba
	loopchannel $00, $4697 ; end
; 0x1786d3

_Music_LookMysticalMan_sub_0x1786d3: ; 0x1786d3
; subroutine
	note $43
	note $32
	note $42
	note $41
	note $33
	endchannel ; end
; 0x1786d9

_Music_LookMysticalMan_sub_0x1786d9: ; 0x1786d9
; subroutine
	note $43
	note $32
	note $32
	note $41
	note $33
	endchannel ; end
; 0x1786df

_Music_LookMysticalMan_sub_0x1786df: ; 0x1786df
; subroutine
	note $43
	note $31
	note $40
	note $32
	note $31
	note $41
	note $30
	note $30
	endchannel ; end
; 0x1786e8
