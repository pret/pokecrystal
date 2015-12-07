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

	enum_start $d8
	enum notetype_cmd
octave: macro
	db notetype_cmd - (\1)
	endm

notetype: macro
	db notetype_cmd
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	endm

	enum forceoctave_cmd
forceoctave: macro
	db forceoctave_cmd
	db \1 ; octave
	endm

	enum tempo_cmd
tempo: macro
	db tempo_cmd
	bigdw \1 ; tempo
	endm

	enum dutycycle_cmd
dutycycle: macro
	db dutycycle_cmd
	db \1 ; duty_cycle
	endm

	enum intensity_cmd
intensity: macro
	db intensity_cmd
	db \1 ; intensity
	endm

	enum soundinput_cmd
soundinput: macro
	db soundinput_cmd
	db \1 ; input
	endm

	enum unknownmusic0xde_cmd
unknownmusic0xde: macro
	db unknownmusic0xde_cmd
	db \1 ; unknown
	endm

	enum togglesfx_cmd
togglesfx: macro
	db togglesfx_cmd
	endm

	enum unknownmusic0xe0_cmd
unknownmusic0xe0: macro
	db unknownmusic0xe0_cmd
	db \1 ; unknown
	; db \2 ; unknown
	dn \2, \3 ; octave, pitch
	endm

	enum vibrato_cmd
vibrato: macro
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
	endm

	enum unknownmusic0xe2_cmd
unknownmusic0xe2: macro
	db unknownmusic0xe2_cmd
	db \1 ; unknown
	endm

	enum togglenoise_cmd
togglenoise: macro
	db togglenoise_cmd
	db \1 ; id
	endm

	enum panning_cmd
panning: macro
	db panning_cmd
	db \1 ; tracks
	endm

	enum volume_cmd
volume: macro
	db volume_cmd
	db \1 ; volume
	endm

	enum tone_cmd
tone: macro
	db tone_cmd
	bigdw \1 ; tone
	endm

	enum unknownmusic0xe7_cmd
unknownmusic0xe7: macro
	db unknownmusic0xe7_cmd
	db \1 ; unknown
	endm

	enum unknownmusic0xe8_cmd
unknownmusic0xe8: macro
	db unknownmusic0xe8_cmd
	db \1 ; unknown
	endm

	enum globaltempo_cmd
globaltempo: macro
	db globaltempo_cmd
	bigdw \1 ; value
	endm

	enum restartchannel_cmd
restartchannel: macro
	db restartchannel_cmd
	dw \1 ; address
	endm

	enum newsong_cmd
newsong: macro
	db newsong_cmd
	bigdw \1 ; id
	endm

	enum sfxpriorityon_cmd
sfxpriorityon: macro
	db sfxpriorityon_cmd
	endm

	enum sfxpriorityoff_cmd
sfxpriorityoff: macro
	db sfxpriorityoff_cmd
	endm

	enum unknownmusic0xee_cmd
unknownmusic0xee: macro
	db unknownmusic0xee_cmd
	dw \1 ; address
	endm

	enum stereopanning_cmd
stereopanning: macro
	db stereopanning_cmd
	db \1 ; tracks
	endm

	enum sfxtogglenoise_cmd
sfxtogglenoise: macro
	db sfxtogglenoise_cmd
	db \1 ; id
	endm

	enum music0xf1_cmd
music0xf1: macro
	db music0xf1_cmd
	endm

	enum music0xf2_cmd
music0xf2: macro
	db music0xf2_cmd
	endm

	enum music0xf3_cmd
music0xf3: macro
	db music0xf3_cmd
	endm

	enum music0xf4_cmd
music0xf4: macro
	db music0xf4_cmd
	endm

	enum music0xf5_cmd
music0xf5: macro
	db music0xf5_cmd
	endm

	enum music0xf6_cmd
music0xf6: macro
	db music0xf6_cmd
	endm

	enum music0xf7_cmd
music0xf7: macro
	db music0xf7_cmd
	endm

	enum music0xf8_cmd
music0xf8: macro
	db music0xf8_cmd
	endm

	enum unknownmusic0xf9_cmd
unknownmusic0xf9: macro
	db unknownmusic0xf9_cmd
	endm

	enum setcondition_cmd
setcondition: macro
	db setcondition_cmd
	db \1 ; condition
	endm

	enum jumpif_cmd
jumpif: macro
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
	endm

	enum jumpchannel_cmd
jumpchannel: macro
	db jumpchannel_cmd
	dw \1 ; address
	endm

	enum loopchannel_cmd
loopchannel: macro
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
	endm

	enum callchannel_cmd
callchannel: macro
	db callchannel_cmd
	dw \1 ; address
	endm

	enum endchannel_cmd
endchannel: macro
	db endchannel_cmd
	endm
