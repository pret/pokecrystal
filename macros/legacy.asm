; Legacy support for old pokecrystal.
; Allows porting scripts with as few edits as possible.
; Legacy support not in this file can be found by looking for the keyword: "LEGACY"

; macros/farcall.asm
DEF callba EQUS "farcall"
DEF callab EQUS "callfar"

; macros/gfx.asm
MACRO dsprite
	dbsprite \3, \1, \4, \2, \5, \6
ENDM

; macros/data.asm

MACRO dbbw
	db \1, \2
	dw \3
ENDM

MACRO dbww
	db \1
	dw \2, \3
ENDM

MACRO dbwww
	db \1
	dw \2, \3, \4
ENDM

; macros/scripts/audio.asm
DEF __ EQU 0
DEF CC EQU 13

MACRO musicheader
	channel_count \1
	channel \2, \3
ENDM

MACRO sound
	note \1, \2
	db \3
	dw \4
ENDM

MACRO noise
	note \1, \2
	db \3
	db \4
ENDM

MACRO notetype
	if _NARG >= 2
		note_type \1, \2 >> 4, \2 & $0f
	else
		note_type \1
	endc
ENDM

MACRO pitchoffset
	transpose \1, \2 - 1
ENDM

DEF dutycycle EQUS "duty_cycle"

MACRO intensity
	volume_envelope \1 >> 4, \1 & $0f
ENDM

MACRO soundinput
	pitch_sweep \1 >> 4, \1 & $0f
ENDM

DEF unknownmusic0xde EQUS "sound_duty"
MACRO sound_duty
	db duty_cycle_pattern_cmd
	if _NARG == 4
		db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6)
	else
		db \1
	endc
ENDM

DEF togglesfx EQUS "toggle_sfx"

MACRO slidepitchto
	pitch_slide \1, (8 - \2), \3
ENDM

DEF togglenoise EQUS "toggle_noise"

MACRO panning
	force_stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

DEF tone           EQUS "pitch_offset"
DEF restartchannel EQUS "restart_channel"
DEF newsong        EQUS "new_song"
DEF sfxpriorityon  EQUS "sfx_priority_on"
DEF sfxpriorityoff EQUS "sfx_priority_off"

MACRO stereopanning
	stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

DEF sfxtogglenoise EQUS "sfx_toggle_noise"
DEF setcondition   EQUS "set_condition"
DEF jumpif         EQUS "sound_jump_if"
DEF jumpchannel    EQUS "sound_jump"
DEF loopchannel    EQUS "sound_loop"
DEF callchannel    EQUS "sound_call"
DEF endchannel     EQUS "sound_ret"

; macros/scripts/events.asm

DEF checkmorn EQUS "checktime MORN"
DEF checkday  EQUS "checktime DAY"
DEF checknite EQUS "checktime NITE"

DEF jump           EQUS "sjump"
DEF farjump        EQUS "farsjump"
DEF priorityjump   EQUS "sdefer"
DEF prioritysjump  EQUS "sdefer"
DEF ptcall         EQUS "memcall"
DEF ptjump         EQUS "memjump"
DEF ptpriorityjump EQUS "stopandsjump"
DEF ptcallasm      EQUS "memcallasm"

DEF if_equal        EQUS "ifequal"
DEF if_not_equal    EQUS "ifnotequal"
DEF if_greater_than EQUS "ifgreater"
DEF if_less_than    EQUS "ifless"
DEF end_all         EQUS "endall"
DEF return          EQUS "endcallback"
DEF reloadandreturn EQUS "reloadend"

DEF checkmaptriggers EQUS "checkmapscene"
DEF domaptrigger     EQUS "setmapscene"
DEF checktriggers    EQUS "checkscene"
DEF dotrigger        EQUS "setscene"

DEF faceperson     EQUS "faceobject"
DEF moveperson     EQUS "moveobject"
DEF writepersonxy  EQUS "writeobjectxy"
DEF spriteface     EQUS "turnobject"
DEF objectface     EQUS "turnobject"
DEF applymovement2 EQUS "applymovementlasttalked"

DEF writebyte     EQUS "setval"
DEF addvar        EQUS "addval"
DEF copybytetovar EQUS "readmem"
DEF copyvartobyte EQUS "writemem"
DEF checkcode     EQUS "readvar"
DEF writevarcode  EQUS "writevar"
DEF writecode     EQUS "loadvar"

DEF MEM_BUFFER_0 EQUS "STRING_BUFFER_3"
DEF MEM_BUFFER_1 EQUS "STRING_BUFFER_4"
DEF MEM_BUFFER_2 EQUS "STRING_BUFFER_5"

DEF vartomem      EQUS "getnum"
DEF mapnametotext EQUS "getcurlandmarkname"
DEF readcoins     EQUS "getcoins"

MACRO pokenamemem
	getmonname \2, \1
ENDM

MACRO itemtotext
	getitemname \2, \1
ENDM

MACRO landmarktotext
	getlandmarkname \2, \1
ENDM

MACRO trainertotext
	gettrainername \3, \1, \2
ENDM

MACRO trainerclassname
	gettrainerclassname \2, \1
ENDM

MACRO name
	getname \3, \1, \2
ENDM

MACRO stringtotext
	getstring \2, \1
ENDM

MACRO readmoney
	getmoney \2, \1
ENDM

DEF RAM2MEM               EQUS "getnum"
DEF loadfont              EQUS "opentext"
DEF loadmenudata          EQUS "loadmenu"
DEF loadmenuheader        EQUS "loadmenu"
DEF writebackup           EQUS "closewindow"
DEF interpretmenu         EQUS "_2dmenu"
DEF interpretmenu2        EQUS "verticalmenu"
DEF buttonsound           EQUS "promptbutton"
DEF battlecheck           EQUS "randomwildmon"
DEF loadtrainerdata       EQUS "loadtemptrainer"
DEF loadpokedata          EQUS "loadwildmon"
DEF returnafterbattle     EQUS "reloadmapafterbattle"
DEF trainerstatus         EQUS "trainerflagaction"
DEF talkaftercancel       EQUS "endifjustbattled"
DEF talkaftercheck        EQUS "checkjustbattled"
DEF playrammusic          EQUS "encountermusic"
DEF reloadmapmusic        EQUS "dontrestartmapmusic"
DEF resetfuncs            EQUS "endall"
DEF storetext             EQUS "battletowertext"
DEF displaylocation       EQUS "landmarktotext"
DEF givepokeitem          EQUS "givepokemail"
DEF checkpokeitem         EQUS "checkpokemail"
DEF passtoengine          EQUS "autoinput"
DEF verbosegiveitem2      EQUS "verbosegiveitemvar"
DEF loadbytec2cf          EQUS "writeunusedbyte"
DEF writeunusedbytebuffer EQUS "writeunusedbyte"

; macros/scripts/maps.asm

MACRO mapconst
	map_const \1, \3, \2
ENDM

DEF maptrigger EQUS "scene_script"

MACRO warp_def
	warp_event \2, \1, \4, \3
ENDM

MACRO xy_trigger
	coord_event \3, \2, \1, \5
ENDM

MACRO signpost
	bg_event \2, \1, \3, \4
ENDM

MACRO person_event
	object_event \3, \2, \1, \4, \5, \6, \7, \8, \9, \<10>, \<11>, \<12>, \<13>
ENDM

DEF PERSONTYPE_SCRIPT   EQUS "OBJECTTYPE_SCRIPT"
DEF PERSONTYPE_ITEMBALL EQUS "OBJECTTYPE_ITEMBALL"
DEF PERSONTYPE_TRAINER  EQUS "OBJECTTYPE_TRAINER"

DEF SCENE_DEFAULT  EQU 0
DEF SCENE_FINISHED EQU 1

; macros/scripts/movement.asm

DEF show_person   EQUS "show_object"
DEF hide_person   EQUS "hide_object"
DEF remove_person EQUS "remove_object"

DEF turn_head_down        EQUS "turn_head DOWN"
DEF turn_head_up          EQUS "turn_head UP"
DEF turn_head_left        EQUS "turn_head LEFT"
DEF turn_head_right       EQUS "turn_head RIGHT"
DEF turn_step_down        EQUS "turn_step DOWN"
DEF turn_step_up          EQUS "turn_step UP"
DEF turn_step_left        EQUS "turn_step LEFT"
DEF turn_step_right       EQUS "turn_step RIGHT"
DEF slow_step_down        EQUS "slow_step DOWN"
DEF slow_step_up          EQUS "slow_step UP"
DEF slow_step_left        EQUS "slow_step LEFT"
DEF slow_step_right       EQUS "slow_step RIGHT"
DEF step_down             EQUS "step DOWN"
DEF step_up               EQUS "step UP"
DEF step_left             EQUS "step LEFT"
DEF step_right            EQUS "step RIGHT"
DEF big_step_down         EQUS "big_step DOWN"
DEF big_step_up           EQUS "big_step UP"
DEF big_step_left         EQUS "big_step LEFT"
DEF big_step_right        EQUS "big_step RIGHT"
DEF slow_slide_step_down  EQUS "slow_slide_step DOWN"
DEF slow_slide_step_up    EQUS "slow_slide_step UP"
DEF slow_slide_step_left  EQUS "slow_slide_step LEFT"
DEF slow_slide_step_right EQUS "slow_slide_step RIGHT"
DEF slide_step_down       EQUS "slide_step DOWN"
DEF slide_step_up         EQUS "slide_step UP"
DEF slide_step_left       EQUS "slide_step LEFT"
DEF slide_step_right      EQUS "slide_step RIGHT"
DEF fast_slide_step_down  EQUS "fast_slide_step DOWN"
DEF fast_slide_step_up    EQUS "fast_slide_step UP"
DEF fast_slide_step_left  EQUS "fast_slide_step LEFT"
DEF fast_slide_step_right EQUS "fast_slide_step RIGHT"
DEF turn_away_down        EQUS "turn_away DOWN"
DEF turn_away_up          EQUS "turn_away UP"
DEF turn_away_left        EQUS "turn_away LEFT"
DEF turn_away_right       EQUS "turn_away RIGHT"
DEF turn_in_down          EQUS "turn_in DOWN"
DEF turn_in_up            EQUS "turn_in UP"
DEF turn_in_left          EQUS "turn_in LEFT"
DEF turn_in_right         EQUS "turn_in RIGHT"
DEF turn_waterfall_down   EQUS "turn_waterfall DOWN"
DEF turn_waterfall_up     EQUS "turn_waterfall UP"
DEF turn_waterfall_left   EQUS "turn_waterfall LEFT"
DEF turn_waterfall_right  EQUS "turn_waterfall RIGHT"
DEF slow_jump_step_down   EQUS "slow_jump_step DOWN"
DEF slow_jump_step_up     EQUS "slow_jump_step UP"
DEF slow_jump_step_left   EQUS "slow_jump_step LEFT"
DEF slow_jump_step_right  EQUS "slow_jump_step RIGHT"
DEF jump_step_down        EQUS "jump_step DOWN"
DEF jump_step_up          EQUS "jump_step UP"
DEF jump_step_left        EQUS "jump_step LEFT"
DEF jump_step_right       EQUS "jump_step RIGHT"
DEF fast_jump_step_down   EQUS "fast_jump_step DOWN"
DEF fast_jump_step_up     EQUS "fast_jump_step UP"
DEF fast_jump_step_left   EQUS "fast_jump_step LEFT"
DEF fast_jump_step_right  EQUS "fast_jump_step RIGHT"

DEF step_sleep_1 EQUS "step_sleep 1"
DEF step_sleep_2 EQUS "step_sleep 2"
DEF step_sleep_3 EQUS "step_sleep 3"
DEF step_sleep_4 EQUS "step_sleep 4"
DEF step_sleep_5 EQUS "step_sleep 5"
DEF step_sleep_6 EQUS "step_sleep 6"
DEF step_sleep_7 EQUS "step_sleep 7"
DEF step_sleep_8 EQUS "step_sleep 8"

; macros/scripts/text.asm
DEF text_from_ram          EQUS "text_ram"
DEF start_asm              EQUS "text_asm"
DEF deciram                EQUS "text_decimal"
DEF interpret_data         EQUS "text_pause"
DEF limited_interpret_data EQUS "text_dots"
DEF link_wait_button       EQUS "text_waitbutton"
DEF text_linkwaitbutton    EQUS "text_waitbutton"
DEF text_linkpromptbutton  EQUS "text_waitbutton"
DEF current_day            EQUS "text_today"
DEF text_jump              EQUS "text_far"

; macros/scripts/battle_anims.asm
DEF anim_enemyfeetobj  EQUS "anim_battlergfx_2row"
DEF anim_playerheadobj EQUS "anim_battlergfx_1row"
DEF anim_clearsprites  EQUS "anim_keepsprites"

; macros/scripts/oam_anims.asm
DEF dorestart EQUS "oamrestart"
DEF dowait EQUS "oamwait"
DEF delanim EQUS "oamdel"

; engine/events/std_scripts.asm
DEF pokecenternurse       EQUS "PokecenterNurseScript"
DEF difficultbookshelf    EQUS "DifficultBookshelfScript"
DEF picturebookshelf      EQUS "PictureBookshelfScript"
DEF magazinebookshelf     EQUS "MagazineBookshelfScript"
DEF teamrocketoath        EQUS "TeamRocketOathScript"
DEF incenseburner         EQUS "IncenseBurnerScript"
DEF merchandiseshelf      EQUS "MerchandiseShelfScript"
DEF townmap               EQUS "TownMapScript"
DEF window                EQUS "WindowScript"
DEF tv                    EQUS "TVScript"
DEF homepage              EQUS "HomepageScript"
DEF radio1                EQUS "Radio1Script"
DEF radio2                EQUS "Radio2Script"
DEF trashcan              EQUS "TrashCanScript"
DEF strengthboulder       EQUS "StrengthBoulderScript"
DEF smashrock             EQUS "SmashRockScript"
DEF pokecentersign        EQUS "PokecenterSignScript"
DEF martsign              EQUS "MartSignScript"
DEF goldenrodrockets      EQUS "GoldenrodRocketsScript"
DEF radiotowerrockets     EQUS "RadioTowerRocketsScript"
DEF elevatorbutton        EQUS "ElevatorButtonScript"
DEF daytotext             EQUS "DayToTextScript"
DEF bugcontestresultswarp EQUS "BugContestResultsWarpScript"
DEF bugcontestresults     EQUS "BugContestResultsScript"
DEF initializeevents      EQUS "InitializeEventsScript"
DEF asknumber1m           EQUS "AskNumber1MScript"
DEF asknumber2m           EQUS "AskNumber2MScript"
DEF registerednumberm     EQUS "RegisteredNumberMScript"
DEF numberacceptedm       EQUS "NumberAcceptedMScript"
DEF numberdeclinedm       EQUS "NumberDeclinedMScript"
DEF phonefullm            EQUS "PhoneFullMScript"
DEF rematchm              EQUS "RematchMScript"
DEF giftm                 EQUS "GiftMScript"
DEF packfullm             EQUS "PackFullMScript"
DEF rematchgiftm          EQUS "RematchGiftMScript"
DEF asknumber1f           EQUS "AskNumber1FScript"
DEF asknumber2f           EQUS "AskNumber2FScript"
DEF registerednumberf     EQUS "RegisteredNumberFScript"
DEF numberacceptedf       EQUS "NumberAcceptedFScript"
DEF numberdeclinedf       EQUS "NumberDeclinedFScript"
DEF phonefullf            EQUS "PhoneFullFScript"
DEF rematchf              EQUS "RematchFScript"
DEF giftf                 EQUS "GiftFScript"
DEF packfullf             EQUS "PackFullFScript"
DEF rematchgiftf          EQUS "RematchGiftFScript"
DEF gymstatue1            EQUS "GymStatue1Script"
DEF gymstatue2            EQUS "GymStatue2Script"
DEF receiveitem           EQUS "ReceiveItemScript"
DEF receivetogepiegg      EQUS "ReceiveTogepiEggScript"
DEF pcscript              EQUS "PCScript"
DEF gamecornercoinvendor  EQUS "GameCornerCoinVendorScript"
DEF happinesschecknpc     EQUS "HappinessCheckScript"

; constants/sprite_constants.asm
DEF SPRITE_BUENA EQUS "SPRITE_BEAUTY"
