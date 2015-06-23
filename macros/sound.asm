note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: macro
	db \1 ; duration
	db \2 ; intensity
	dw \3 ; frequency
	endm

noise: macro
	db \1 ; duration
	db \2 ; intensity
	db \3 ; frequency
	endm

; pitch
__ EQU 0
C_ EQU 1
C# EQU 2
D_ EQU 3
D# EQU 4
E_ EQU 5
F_ EQU 6
F# EQU 7
G_ EQU 8
G# EQU 9
A_ EQU 10
A# EQU 11
B_ EQU 12


octave: macro
	db $d8 - (\1)
	endm

notetype: macro
	db $d8
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	endm

forceoctave: macro
	db $d9
	db \1 ; octave
	endm

tempo: macro
	db $da
	bigdw \1 ; tempo
	endm

dutycycle: macro
	db $db
	db \1 ; duty_cycle
	endm

intensity: macro
	db $dc
	db \1 ; intensity
	endm

soundinput: macro
	db $dd
	db \1 ; input
	endm

unknownmusic0xde: macro
	db $de
	db \1 ; unknown
	endm

togglesfx: macro
	db $df
	endm

unknownmusic0xe0: macro
	db $e0
	db \1 ; unknown
	db \2 ; unknown
	endm

vibrato: macro
	db $e1
	db \1 ; delay
	db \2 ; extent
	endm

unknownmusic0xe2: macro
	db $e2
	db \1 ; unknown
	endm

togglenoise: macro
	db $e3
	db \1 ; id
	endm

panning: macro
	db $e4
	db \1 ; tracks
	endm

volume: macro
	db $e5
	db \1 ; volume
	endm

tone: macro
	db $e6
	bigdw \1 ; tone
	endm

unknownmusic0xe7: macro
	db $e7
	db \1 ; unknown
	endm

unknownmusic0xe8: macro
	db $e8
	db \1 ; unknown
	endm

globaltempo: macro
	db $e9
	bigdw \1 ; value
	endm

restartchannel: macro
	db $ea
	dw \1 ; address
	endm

newsong: macro
	db $eb
	bigdw \1 ; id
	endm

sfxpriorityon: macro
	db $ec
	endm

sfxpriorityoff: macro
	db $ed
	endm

unknownmusic0xee: macro
	db $ee
	dw \1 ; address
	endm

stereopanning: macro
	db $ef
	db \1 ; tracks
	endm

sfxtogglenoise: macro
	db $f0
	db \1 ; id
	endm

music0xf1: macro
	db $f1
	endm

music0xf2: macro
	db $f2
	endm

music0xf3: macro
	db $f3
	endm

music0xf4: macro
	db $f4
	endm

music0xf5: macro
	db $f5
	endm

music0xf6: macro
	db $f6
	endm

music0xf7: macro
	db $f7
	endm

music0xf8: macro
	db $f8
	endm

unknownmusic0xf9: macro
	db $f9
	endm

setcondition: macro
	db $fa
	db \1 ; condition
	endm

jumpif: macro
	db $fb
	db \1 ; condition
	dw \2 ; address
	endm

jumpchannel: macro
	db $fc
	dw \1 ; address
	endm

loopchannel: macro
	db $fd
	db \1 ; count
	dw \2 ; address
	endm

callchannel: macro
	db $fe
	dw \1 ; address
	endm

endchannel: macro
	db $ff
	endm
