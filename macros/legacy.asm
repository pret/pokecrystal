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

MACRO dt
	bigdt \1
ENDM

MACRO dd
	bigdd \1
ENDM

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
DEF refreshscreen         EQUS "reanchormap"
DEF reloadmappart         EQUS "refreshmap"
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
DEF dowait    EQUS "oamwait"
DEF delanim   EQUS "oamdel"

; macros/scripts/battle_commands.asm
DEF checkcurl EQUS "checkrollout"

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

; constants/charmap.asm
charmap "%", "<BSP>"
charmap "¯", "<WBR>"

; constants/sprite_constants.asm
DEF SPRITE_BUENA EQUS "SPRITE_BEAUTY"

DEF PAL_NPC_SILVER EQUS "PAL_NPC_EMOTE"
DEF PAL_OW_SILVER  EQUS "PAL_OW_EMOTE"

; constants/hardware.inc (formerly constants/hardware_constants.asm)

DEF MBC3SRamEnable EQU rRAMG
DEF MBC3RomBank    EQU rROMB
DEF MBC3SRamBank   EQU rRAMB
DEF MBC3LatchClock EQU rRTCLATCH
DEF MBC3RTC        EQU rRTCREG

DEF SRAM_DISABLE EQU RAMG_SRAM_DISABLE
DEF SRAM_ENABLE  EQU RAMG_SRAM_ENABLE

DEF RTC_S  EQU RAMB_RTC_S
DEF RTC_M  EQU RAMB_RTC_M
DEF RTC_H  EQU RAMB_RTC_H
DEF RTC_DL EQU RAMB_RTC_DL
DEF RTC_DH EQU RAMB_RTC_DH
DEF RTC_DH_HI       EQU B_RAMB_RTC_DH_HIGH
DEF RTC_DH_HALT     EQU B_RAMB_RTC_DH_HALT
DEF RTC_DH_OVERFLOW EQU B_RAMB_RTC_DH_CARRY

DEF VBLANK   EQU B_IE_VBLANK
DEF LCD_STAT EQU B_IE_STAT
DEF TIMER    EQU B_IE_TIMER
DEF SERIAL   EQU B_IE_SERIAL
DEF JOYPAD   EQU B_IE_JOYPAD

DEF OAM_TILE_BANK EQU B_OAM_BANK1
DEF OAM_OBP_NUM   EQU B_OAM_PAL1
DEF OAM_X_FLIP    EQU B_OAM_XFLIP
DEF OAM_Y_FLIP    EQU B_OAM_YFLIP
DEF OAM_PRIORITY  EQU B_OAM_PRIO
DEF PALETTE_MASK  EQU OAM_PALETTE
DEF VRAM_BANK_1   EQU OAM_BANK1
DEF OBP_NUM       EQU OAM_PAL1
DEF X_FLIP        EQU OAM_XFLIP
DEF Y_FLIP        EQU OAM_YFLIP
DEF PRIORITY      EQU OAM_PRIO

; these bit flags are reversed in meaning
DEF rJOYP_BUTTONS EQU B_JOYP_GET_CTRL_PAD
DEF rJOYP_DPAD    EQU B_JOYP_GET_BUTTONS

DEF rSC_ON    EQU B_SC_START
DEF rSC_CGB   EQU B_SC_SPEED
DEF rSC_CLOCK EQU B_SC_SOURCE

DEF rTAC_ON        EQU B_TAC_START
DEF rTAC_4096_HZ   EQU TAC_4KHZ
DEF rTAC_262144_HZ EQU TAC_262KHZ
DEF rTAC_65536_HZ  EQU TAC_65KHZ
DEF rTAC_16384_HZ  EQU TAC_16KHZ

DEF rWave_0 EQU rAUD3WAVE_0
DEF rWave_1 EQU rAUD3WAVE_1
DEF rWave_2 EQU rAUD3WAVE_2
DEF rWave_3 EQU rAUD3WAVE_3
DEF rWave_4 EQU rAUD3WAVE_4
DEF rWave_5 EQU rAUD3WAVE_5
DEF rWave_6 EQU rAUD3WAVE_6
DEF rWave_7 EQU rAUD3WAVE_7
DEF rWave_8 EQU rAUD3WAVE_8
DEF rWave_9 EQU rAUD3WAVE_9
DEF rWave_a EQU rAUD3WAVE_A
DEF rWave_b EQU rAUD3WAVE_B
DEF rWave_c EQU rAUD3WAVE_C
DEF rWave_d EQU rAUD3WAVE_D
DEF rWave_e EQU rAUD3WAVE_E
DEF rWave_f EQU rAUD3WAVE_F

DEF rLCDC_BG_PRIORITY    EQU B_LCDC_PRIO
DEF rLCDC_SPRITES_ENABLE EQU B_LCDC_OBJS
DEF rLCDC_SPRITE_SIZE    EQU B_LCDC_OBJ_SIZE
DEF rLCDC_BG_TILEMAP     EQU B_LCDC_BG_MAP
DEF rLCDC_TILE_DATA      EQU B_LCDC_BLOCKS
DEF rLCDC_WINDOW_ENABLE  EQU B_LCDC_WINDOW
DEF rLCDC_WINDOW_TILEMAP EQU B_LCDC_WIN_MAP
DEF rLCDC_ENABLE         EQU B_LCDC_ENABLE

DEF rLCDMODE EQU rSYS

DEF KEY1_PREPARE  EQU B_SPD_PREPARE
DEF KEY1_DBLSPEED EQU B_SPD_DOUBLE

DEF rBLCK EQU rBANK

DEF rRP_LED_ON           EQU B_RP_LED_ON
DEF rRP_RECEIVING        EQU B_RP_DATA_IN
DEF rRP_ENABLE_READ_MASK EQU RP_ENABLE

DEF rBGPI_AUTO_INCREMENT EQU B_BGPI_AUTOINC

DEF rOBPI_AUTO_INCREMENT EQU B_OBPI_AUTOINC

; constants/input_constants.asm

DEF A_BUTTON_F EQU B_PAD_A
DEF B_BUTTON_F EQU B_PAD_B
DEF SELECT_F   EQU B_PAD_SELECT
DEF START_F    EQU B_PAD_START
DEF D_RIGHT_F  EQU B_PAD_RIGHT
DEF D_LEFT_F   EQU B_PAD_LEFT
DEF D_UP_F     EQU B_PAD_UP
DEF D_DOWN_F   EQU B_PAD_DOWN

DEF A_BUTTON EQU PAD_A
DEF B_BUTTON EQU PAD_B
DEF SELECT   EQU PAD_SELECT
DEF START    EQU PAD_START
DEF D_RIGHT  EQU PAD_RIGHT
DEF D_LEFT   EQU PAD_LEFT
DEF D_UP     EQU PAD_UP
DEF D_DOWN   EQU PAD_DOWN

DEF BUTTONS EQU PAD_BUTTONS
DEF D_PAD   EQU PAD_CTRL_PAD

; constants/gfx_constants.asm

DEF LEN_1BPP_TILE EQU TILE_1BPP_SIZE
DEF LEN_2BPP_TILE EQU TILE_SIZE

DEF NUM_PAL_COLORS EQU PAL_COLORS
DEF PAL_COLOR_SIZE EQU COLOR_SIZE
DEF PALETTE_SIZE   EQU PAL_SIZE

DEF BG_MAP_WIDTH  EQU TILEMAP_WIDTH
DEF BG_MAP_HEIGHT EQU TILEMAP_HEIGHT

DEF SPRITEOAMSTRUCT_YCOORD     EQU OAMA_Y
DEF SPRITEOAMSTRUCT_XCOORD     EQU OAMA_X
DEF SPRITEOAMSTRUCT_TILE_ID    EQU OAMA_TILEID
DEF SPRITEOAMSTRUCT_ATTRIBUTES EQU OAMA_FLAGS
DEF SPRITEOAMSTRUCT_LENGTH     EQU OBJ_SIZE
DEF NUM_SPRITE_OAM_STRUCTS     EQU OAM_COUNT

; constants/audio_constants.asm

DEF VOLUME_SO1_F     EQU B_AUDVOL_VIN_RIGHT
DEF VOLUME_SO2_F     EQU B_AUDVOL_VIN_LEFT
DEF VOLUME_SO1_LEVEL EQU AUDVOL_RIGHT
DEF VOLUME_SO2_LEVEL EQU AUDVOL_LEFT
