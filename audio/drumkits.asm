Drumkits: ; e8e52
	dw Drumkit0
	dw Drumkit1
	dw Drumkit2
	dw Drumkit3
	dw Drumkit4
	dw Drumkit5
; e8e5e

Drumkit0: ; e8e5e
	dw Drum00    ; rest
	dw Snare1    ; c
	dw Snare2    ; c#
	dw Snare3    ; d
	dw Snare4    ; d#
	dw Drum05    ; e
	dw Triangle1 ; f
	dw Triangle2 ; f#
	dw HiHat1    ; g
	dw Snare5    ; g#
	dw Snare6    ; a
	dw Snare7    ; a#
	dw HiHat2    ; b
Drumkit1: ; e8e78
	dw Drum00
	dw HiHat1
	dw Snare5
	dw Snare6
	dw Snare7
	dw HiHat2
	dw HiHat3
	dw Snare8
	dw Triangle3
	dw Triangle4
	dw Snare9
	dw Snare10
	dw Snare11
Drumkit2: ; e8e92
	dw Drum00
	dw Snare1
	dw Snare9
	dw Snare10
	dw Snare11
	dw Drum05
	dw Triangle1
	dw Triangle2
	dw HiHat1
	dw Snare5
	dw Snare6
	dw Snare7
	dw HiHat2
Drumkit3: ; e8eac
	dw Drum21
	dw Snare12
	dw Snare13
	dw Snare14
	dw Kick1
	dw Triangle5
	dw Drum20
	dw Drum27
	dw Drum28
	dw Drum29
	dw Drum21
	dw Kick2
	dw Crash2
Drumkit4: ; e8ec6
	dw Drum21
	dw Drum20
	dw Snare13
	dw Snare14
	dw Kick1
	dw Drum33
	dw Triangle5
	dw Drum35
	dw Drum31
	dw Drum32
	dw Drum36
	dw Kick2
	dw Crash1
Drumkit5: ; e8ee0
	dw Drum00
	dw Snare9
	dw Snare10
	dw Snare11
	dw Drum27
	dw Drum28
	dw Drum29
	dw Drum05
	dw Triangle1
	dw Crash1
	dw Snare14
	dw Snare13
	dw Kick2
; e8efa

Drum00: ; e8efa
; unused
	noise C#,  1, $11, $00
	endchannel
; e8efe

Snare1: ; e8efe
	noise C#,  1, $c1, $33
	endchannel
; e8f02

Snare2: ; e8f02
	noise C#,  1, $b1, $33
	endchannel
; e8f06

Snare3: ; e8f06
	noise C#,  1, $a1, $33
	endchannel
; e8f0a

Snare4: ; e8f0a
	noise C#,  1, $81, $33
	endchannel
; e8f0e

Drum05: ; e8f0e
	noise C#,  8, $84, $37
	noise C#,  7, $84, $36
	noise C#,  6, $83, $35
	noise C#,  5, $83, $34
	noise C#,  4, $82, $33
	noise C#,  3, $81, $32
	endchannel
; e8f21

Triangle1: ; e8f21
	noise C#,  1, $51, $2a
	endchannel
; e8f25

Triangle2: ; e8f25
	noise C#,  2, $41, $2b
	noise C#,  1, $61, $2a
	endchannel
; e8f2c

HiHat1: ; e8f2c
	noise C#,  1, $81, $10
	endchannel
; e8f30

Snare5: ; e8f30
	noise C#,  1, $82, $23
	endchannel
; e8f34

Snare6: ; e8f34
	noise C#,  1, $82, $25
	endchannel
; e8f38

Snare7: ; e8f38
	noise C#,  1, $82, $26
	endchannel
; e8f3c

HiHat2: ; e8f3c
	noise C#,  1, $a1, $10
	endchannel
; e8f40

HiHat3: ; e8f40
	noise C#,  1, $a2, $11
	endchannel
; e8f44

Snare8: ; e8f44
	noise C#,  1, $a2, $50
	endchannel
; e8f48

Triangle3: ; e8f48
	noise C#,  1, $a1, $18
	noise C#,  1, $31, $33
	endchannel
; e8f4f

Triangle4: ; e8f4f
	noise C#,  3, $91, $28
	noise C#,  1, $71, $18
	endchannel
; e8f56

Snare9: ; e8f56
	noise C#,  1, $91, $22
	endchannel
; e8f5a

Snare10: ; e8f5a
	noise C#,  1, $71, $22
	endchannel
; e8f5e

Snare11: ; e8f5e
	noise C#,  1, $61, $22
	endchannel
; e8f62

Drum20: ; e8f62
	noise C#,  1, $11, $11
	endchannel
; e8f66

Drum21: ; e8f66
	endchannel
; e8f67

Snare12: ; e8f67
	noise C#,  1, $91, $33
	endchannel
; e8f6b

Snare13: ; e8f6b
	noise C#,  1, $51, $32
	endchannel
; e8f6f

Snare14: ; e8f6f
	noise C#,  1, $81, $31
	endchannel
; e8f73

Kick1: ; e8f73
	noise C#,  1, $88, $6b
	noise C#,  1, $71, $00
	endchannel
; e8f7a

Triangle5: ; e8f7a
	noise D_,  1, $91, $18
	endchannel
; e8f7e

Drum27: ; e8f7e
	noise C#,  8, $92, $10
	endchannel
; e8f82

Drum28: ; e8f82
	noise D_,  4, $91, $00
	noise D_,  4, $11, $00
	endchannel
; e8f89

Drum29: ; e8f89
	noise D_,  4, $91, $11
	noise D_,  4, $11, $00
	endchannel
; e8f90

Crash1: ; e8f90
	noise D_,  4, $88, $15
	noise C#,  1, $65, $12
	endchannel
; e8f97

Drum31: ; e8f97
	noise D_,  4, $51, $21
	noise D_,  4, $11, $11
	endchannel
; e8f9e

Drum32: ; e8f9e
	noise D_,  4, $51, $50
	noise D_,  4, $11, $11
	endchannel
; e8fa5

Drum33: ; e8fa5
	noise C#,  1, $a1, $31
	endchannel
; e8fa9

Crash2: ; e8fa9
	noise C#,  1, $84, $12
	endchannel
; e8fad

Drum35: ; e8fad
	noise D_,  4, $81, $00
	noise D_,  4, $11, $00
	endchannel
; e8fb4

Drum36: ; e8fb4
	noise D_,  4, $81, $21
	noise D_,  4, $11, $11
	endchannel
; e8fbb

Kick2: ; e8fbb
	noise C#,  1, $a8, $6b
	noise C#,  1, $71, $00
	endchannel
; e8fc2
