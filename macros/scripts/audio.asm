musicheader: MACRO
	; number of tracks, track idx, address
	dbw ((\1 - 1) << 6) + (\2 - 1), \3
	endm

note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: MACRO
	note \1, \2
	db \3 ; intensity
	dw \4 ; frequency
	endm

noise: MACRO
	note \1, \2 ; duration
	db \3 ; intensity
	db \4 ; frequency
	endm

; MusicCommands indexes (see audio/engine.asm)
	enum_start $d8

	enum notetype_cmd ; $d8
octave: MACRO
	db notetype_cmd - (\1)
	endm

notetype: MACRO
	db notetype_cmd
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	endm

	enum pitchoffset_cmd ; $d9
pitchoffset: MACRO
	db pitchoffset_cmd
	dn \1, \2 - 1 ; octave, key
	endm

	enum tempo_cmd ; $da
tempo: MACRO
	db tempo_cmd
	bigdw \1 ; tempo
	endm

	enum dutycycle_cmd ; $db
dutycycle: MACRO
	db dutycycle_cmd
	db \1 ; duty_cycle
	endm

	enum intensity_cmd ; $dc
intensity: MACRO
	db intensity_cmd
	db \1 ; intensity
	endm

	enum soundinput_cmd ; $dd
soundinput: MACRO
	db soundinput_cmd
	db \1 ; input
	endm

	enum sound_duty_cmd ; $de
sound_duty: MACRO
	db sound_duty_cmd
	if _NARG == 4
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	else
	db \1 ; one-byte duty value for legacy support
	endc
	endm

	enum togglesfx_cmd ; $df
togglesfx: MACRO
	db togglesfx_cmd
	endm

	enum slidepitchto_cmd ; $e0
slidepitchto: MACRO
	db slidepitchto_cmd
	db \1 - 1 ; duration
	dn \2, \3 ; octave, pitch
	endm

	enum vibrato_cmd ; $e1
vibrato: MACRO
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
	endm

	enum unknownmusic0xe2_cmd ; $e2
unknownmusic0xe2: MACRO
	db unknownmusic0xe2_cmd
	db \1 ; unknown
	endm

	enum togglenoise_cmd ; $e3
togglenoise: MACRO
	db togglenoise_cmd
	db \1 ; id
	endm

	enum panning_cmd ; $e4
panning: MACRO
	db panning_cmd
	db \1 ; tracks
	endm

	enum volume_cmd ; $e5
volume: MACRO
	db volume_cmd
	db \1 ; volume
	endm

	enum tone_cmd ; $e6
tone: MACRO
	db tone_cmd
	bigdw \1 ; tone
	endm

	enum unknownmusic0xe7_cmd ; $e7
unknownmusic0xe7: MACRO
	db unknownmusic0xe7_cmd
	db \1 ; unknown
	endm

	enum unknownmusic0xe8_cmd ; $e8
unknownmusic0xe8: MACRO
	db unknownmusic0xe8_cmd
	db \1 ; unknown
	endm

	enum tempo_relative_cmd ; $e9
tempo_relative: MACRO
	db tempo_relative_cmd
	bigdw \1 ; value
	endm

	enum restartchannel_cmd ; $ea
restartchannel: MACRO
	db restartchannel_cmd
	dw \1 ; address
	endm

	enum newsong_cmd ; $eb
newsong: MACRO
	db newsong_cmd
	bigdw \1 ; id
	endm

	enum sfxpriorityon_cmd ; $ec
sfxpriorityon: MACRO
	db sfxpriorityon_cmd
	endm

	enum sfxpriorityoff_cmd ; $ed
sfxpriorityoff: MACRO
	db sfxpriorityoff_cmd
	endm

	enum unknownmusic0xee_cmd ; $ee
unknownmusic0xee: MACRO
	db unknownmusic0xee_cmd
	dw \1 ; address
	endm

	enum stereopanning_cmd ; $ef
stereopanning: MACRO
	db stereopanning_cmd
	db \1 ; tracks
	endm

	enum sfxtogglenoise_cmd ; $f0
sfxtogglenoise: MACRO
	db sfxtogglenoise_cmd
	db \1 ; id
	endm

	enum music0xf1_cmd ; $f1
music0xf1: MACRO
	db music0xf1_cmd
	endm

	enum music0xf2_cmd ; $f2
music0xf2: MACRO
	db music0xf2_cmd
	endm

	enum music0xf3_cmd ; $f3
music0xf3: MACRO
	db music0xf3_cmd
	endm

	enum music0xf4_cmd ; $f4
music0xf4: MACRO
	db music0xf4_cmd
	endm

	enum music0xf5_cmd ; $f5
music0xf5: MACRO
	db music0xf5_cmd
	endm

	enum music0xf6_cmd ; $f6
music0xf6: MACRO
	db music0xf6_cmd
	endm

	enum music0xf7_cmd ; $f7
music0xf7: MACRO
	db music0xf7_cmd
	endm

	enum music0xf8_cmd ; $f8
music0xf8: MACRO
	db music0xf8_cmd
	endm

	enum unknownmusic0xf9_cmd ; $f9
unknownmusic0xf9: MACRO
	db unknownmusic0xf9_cmd
	endm

	enum setcondition_cmd ; $fa
setcondition: MACRO
	db setcondition_cmd
	db \1 ; condition
	endm

	enum jumpif_cmd ; $fb
jumpif: MACRO
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
	endm

	enum jumpchannel_cmd ; $fc
jumpchannel: MACRO
	db jumpchannel_cmd
	dw \1 ; address
	endm

	enum loopchannel_cmd ; $fd
loopchannel: MACRO
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
	endm

	enum callchannel_cmd ; $fe
callchannel: MACRO
	db callchannel_cmd
	dw \1 ; address
	endm

	enum endchannel_cmd ; $ff
endchannel: MACRO
	db endchannel_cmd
	endm
