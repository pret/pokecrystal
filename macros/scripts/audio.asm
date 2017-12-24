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

; MusicCommands indexes (see audio/engine.asm)
	enum_start $d8

	enum notetype_cmd ; $d8
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

	enum pitchoffset_cmd ; $d9
pitchoffset: macro
	db pitchoffset_cmd
	dn \1, \2 - 1 ; octave, key
	endm

	enum tempo_cmd ; $da
tempo: macro
	db tempo_cmd
	bigdw \1 ; tempo
	endm

	enum dutycycle_cmd ; $db
dutycycle: macro
	db dutycycle_cmd
	db \1 ; duty_cycle
	endm

	enum intensity_cmd ; $dc
intensity: macro
	db intensity_cmd
	db \1 ; intensity
	endm

	enum soundinput_cmd ; $dd
soundinput: macro
	db soundinput_cmd
	db \1 ; input
	endm

	enum sound_duty_cmd ; $de
sound_duty: macro
	db sound_duty_cmd
	if _NARG == 4
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	else
	db \1 ; one-byte duty value for legacy support
	endc
	endm

	enum togglesfx_cmd ; $df
togglesfx: macro
	db togglesfx_cmd
	endm

	enum slidepitchto_cmd ; $e0
slidepitchto: macro
	db slidepitchto_cmd
	db \1 - 1 ; duration
	dn \2, \3 ; octave, pitch
	endm

	enum vibrato_cmd ; $e1
vibrato: macro
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
	endm

	enum unknownmusic0xe2_cmd ; $e2
unknownmusic0xe2: macro
	db unknownmusic0xe2_cmd
	db \1 ; unknown
	endm

	enum togglenoise_cmd ; $e3
togglenoise: macro
	db togglenoise_cmd
	db \1 ; id
	endm

	enum panning_cmd ; $e4
panning: macro
	db panning_cmd
	db \1 ; tracks
	endm

	enum volume_cmd ; $e5
volume: macro
	db volume_cmd
	db \1 ; volume
	endm

	enum tone_cmd ; $e6
tone: macro
	db tone_cmd
	bigdw \1 ; tone
	endm

	enum unknownmusic0xe7_cmd ; $e7
unknownmusic0xe7: macro
	db unknownmusic0xe7_cmd
	db \1 ; unknown
	endm

	enum unknownmusic0xe8_cmd ; $e8
unknownmusic0xe8: macro
	db unknownmusic0xe8_cmd
	db \1 ; unknown
	endm

	enum tempo_relative_cmd ; $e9
tempo_relative: macro
	db tempo_relative_cmd
	bigdw \1 ; value
	endm

	enum restartchannel_cmd ; $ea
restartchannel: macro
	db restartchannel_cmd
	dw \1 ; address
	endm

	enum newsong_cmd ; $eb
newsong: macro
	db newsong_cmd
	bigdw \1 ; id
	endm

	enum sfxpriorityon_cmd ; $ec
sfxpriorityon: macro
	db sfxpriorityon_cmd
	endm

	enum sfxpriorityoff_cmd ; $ed
sfxpriorityoff: macro
	db sfxpriorityoff_cmd
	endm

	enum unknownmusic0xee_cmd ; $ee
unknownmusic0xee: macro
	db unknownmusic0xee_cmd
	dw \1 ; address
	endm

	enum stereopanning_cmd ; $ef
stereopanning: macro
	db stereopanning_cmd
	db \1 ; tracks
	endm

	enum sfxtogglenoise_cmd ; $f0
sfxtogglenoise: macro
	db sfxtogglenoise_cmd
	db \1 ; id
	endm

	enum music0xf1_cmd ; $f1
music0xf1: macro
	db music0xf1_cmd
	endm

	enum music0xf2_cmd ; $f2
music0xf2: macro
	db music0xf2_cmd
	endm

	enum music0xf3_cmd ; $f3
music0xf3: macro
	db music0xf3_cmd
	endm

	enum music0xf4_cmd ; $f4
music0xf4: macro
	db music0xf4_cmd
	endm

	enum music0xf5_cmd ; $f5
music0xf5: macro
	db music0xf5_cmd
	endm

	enum music0xf6_cmd ; $f6
music0xf6: macro
	db music0xf6_cmd
	endm

	enum music0xf7_cmd ; $f7
music0xf7: macro
	db music0xf7_cmd
	endm

	enum music0xf8_cmd ; $f8
music0xf8: macro
	db music0xf8_cmd
	endm

	enum unknownmusic0xf9_cmd ; $f9
unknownmusic0xf9: macro
	db unknownmusic0xf9_cmd
	endm

	enum setcondition_cmd ; $fa
setcondition: macro
	db setcondition_cmd
	db \1 ; condition
	endm

	enum jumpif_cmd ; $fb
jumpif: macro
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
	endm

	enum jumpchannel_cmd ; $fc
jumpchannel: macro
	db jumpchannel_cmd
	dw \1 ; address
	endm

	enum loopchannel_cmd ; $fd
loopchannel: macro
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
	endm

	enum callchannel_cmd ; $fe
callchannel: macro
	db callchannel_cmd
	dw \1 ; address
	endm

	enum endchannel_cmd ; $ff
endchannel: macro
	db endchannel_cmd
	endm
