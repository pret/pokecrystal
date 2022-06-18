; Modern music support for legacy pokecrystal and fanhacks that use older codebase
; Allows porting audio files with as few edits as possible.

transpose: MACRO
	pitchoffset \1, \2 + 1
ENDM

DEF duty_cycle EQUS "dutycycle"

DEF sound_duty EQUS "unknownmusic0xde"

DEF toggle_sfx EQUS "togglesfx"

DEF toggle_noise EQUS "togglenoise"

DEF pitch_offset     EQUS "tone"
DEF restart_channel  EQUS "restartchannel"
DEF new_song         EQUS "newsong"
DEF sfx_priority_on  EQUS "sfxpriorityon"
DEF sfx_priority_off EQUS "sfxpriorityoff"

DEF sfx_toggle_noise EQUS "sfxtogglenoise"
DEF set_condition    EQUS "setcondition"
DEF sound_jump_if    EQUS "jumpif"
DEF sound_jump       EQUS "jumpchannel"
DEF sound_loop       EQUS "loopchannel"
DEF sound_call       EQUS "callchannel"
DEF sound_ret        EQUS "endchannel"
