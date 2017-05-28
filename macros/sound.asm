note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: macro
	note \1, \2
	db \3 ; intensity
	dw \4 ; frequency
	endm

noise: macro
	note \1, \2 ; duration
	db \3 ; intensity
	db \4 ; frequency
	endm

musicheader: macro
	; number of tracks, track idx, address
	dbw ((\1 - 1) << 6) + (\2 - 1), \3
	endm

cry_header: macro
	dw \1, \2, \3
	endm

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

	enum pitchoffset_cmd
pitchoffset: macro
	db pitchoffset_cmd
	dn \1, \2 - 1 ; octave, key
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

	enum sound_duty_cmd
sound_duty: macro
	db sound_duty_cmd
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	endm

	enum togglesfx_cmd
togglesfx: macro
	db togglesfx_cmd
	endm

	enum slidepitchto_cmd
slidepitchto: macro
	db slidepitchto_cmd
	db \1 - 1 ; duration
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

	enum tempo_relative_cmd
tempo_relative: macro
	db tempo_relative_cmd
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
