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

NUM_OCTAVES = 8

octave: macro
	if (\1) < 1 || (\1) > 8
	warn "Valid octave range is 1-8 (gave \1)"
	endc
	db $d0 + NUM_OCTAVES - (\1)
	endm

	enum_start $d0 + NUM_OCTAVES

	command notetype
	command_macro
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	endm

	command forceoctave
	command_macro
	db \1 ; octave
	endm

	command tempo
	command_macro
	bigdw \1 ; tempo
	endm

	command dutycycle
	command_macro
	db \1 ; duty_cycle
	endm

	command intensity
	command_macro
	db \1 ; intensity
	endm

	command soundinput
	command_macro
	db \1 ; input
	endm

	command unknownmusic0xde
	command_macro
	db \1 ; unknown
	endm

	command togglesfx
	command_macro
	endm

	command unknownmusic0xe0
	command_macro
	db \1 ; unknown
	db \2 ; unknown
	endm

	command vibrato
	command_macro
	db \1 ; delay
	db \2 ; extent
	endm

	command unknownmusic0xe2
	command_macro
	db \1 ; unknown
	endm

	command togglenoise
	command_macro
	db \1 ; id
	endm

	command panning
	command_macro
	db \1 ; tracks
	endm

	command volume
	command_macro
	db \1 ; volume
	endm

	command tone
	command_macro
	bigdw \1 ; tone
	endm

	command unknownmusic0xe7
	command_macro
	db \1 ; unknown
	endm

	command unknownmusic0xe8
	command_macro
	db \1 ; unknown
	endm

	command globaltempo
	command_macro
	bigdw \1 ; value
	endm

	command restartchannel
	command_macro
	dw \1 ; address
	endm

	command newsong
	command_macro
	bigdw \1 ; id
	endm

	command sfxpriorityon
	command_macro
	endm

	command sfxpriorityoff
	command_macro
	endm

	command unknownmusic0xee
	command_macro
	dw \1 ; address
	endm

	command stereopanning
	command_macro
	db \1 ; tracks
	endm

	command sfxtogglenoise
	command_macro
	db \1 ; id
	endm

	command music0xf1
	command_macro
	endm

	command music0xf2
	command_macro
	endm

	command music0xf3
	command_macro
	endm

	command music0xf4
	command_macro
	endm

	command music0xf5
	command_macro
	endm

	command music0xf6
	command_macro
	endm

	command music0xf7
	command_macro
	endm

	command music0xf8
	command_macro
	endm

	command unknownmusic0xf9
	command_macro
	endm

	command setcondition
	command_macro
	db \1 ; condition
	endm

	command jumpif
	command_macro
	db \1 ; condition
	dw \2 ; address
	endm

	command jumpchannel
	command_macro
	dw \1 ; address
	endm

	command loopchannel
	command_macro
	db \1 ; count
	dw \2 ; address
	endm

	command callchannel
	command_macro
	dw \1 ; address
	endm

	command endchannel
	command_macro
	endm
