; Modern music support for legacy pokecrystal and fanhacks that use older codebase
; Allows porting audio files with as few edits as possible.

transpose: MACRO
	pitchoffset \1, \2 + 1
ENDM

duty_cycle EQUS "dutycycle"

sound_duty EQUS "unknownmusic0xde"

toggle_sfx EQUS "togglesfx"

toggle_noise EQUS "togglenoise"

pitch_offset     EQUS "tone"
restart_channel  EQUS "restartchannel"
new_song         EQUS "newsong"
sfx_priority_on  EQUS "sfxpriorityon"
sfx_priority_off EQUS "sfxpriorityoff"

sfx_toggle_noise EQUS "sfxtogglenoise"
set_condition    EQUS "setcondition"
sound_jump_if    EQUS "jumpif"
sound_jump       EQUS "jumpchannel"
sound_loop       EQUS "loopchannel"
sound_call       EQUS "callchannel"
sound_ret        EQUS "endchannel"
