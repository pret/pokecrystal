; Legacy support for old pokecrystal.
; Allows porting scripts with as few edits as possible.
; Legacy support not in this file can be found by looking for the keyword: "LEGACY"

; macros/rst.asm
callba EQUS "farcall"
callab EQUS "callfar"

; macros/scripts/audio.asm
unknownmusic0xde EQUS "sound_duty"

; macros/scripts/events.asm

checkmorn EQUS "checktime MORN"
checkday  EQUS "checktime DAY"
checknite EQUS "checktime NITE"

jump           EQUS "sjump"
farjump        EQUS "farsjump"
priorityjump   EQUS "prioritysjump"
ptcall         EQUS "memcall"
ptjump         EQUS "memjump"
ptpriorityjump EQUS "stopandsjump"
ptcallasm      EQUS "memcallasm"

if_equal        EQUS "ifequal"
if_not_equal    EQUS "ifnotequal"
if_greater_than EQUS "ifgreater"
if_less_than    EQUS "ifless"
end_all         EQUS "endall"

checkmaptriggers EQUS "checkmapscene"
domaptrigger     EQUS "setmapscene"
checktriggers    EQUS "checkscene"
dotrigger        EQUS "setscene"

faceperson     EQUS "faceobject"
moveperson     EQUS "moveobject"
writepersonxy  EQUS "writeobjectxy"
spriteface     EQUS "turnobject"
objectface     EQUS "turnobject"
applymovement2 EQUS "applymovementlasttalked"

writebyte     EQUS "setval"
addvar        EQUS "addval"
copybytetovar EQUS "readmem"
copyvartobyte EQUS "writemem"
checkcode     EQUS "readvar"
writevarcode  EQUS "writevar"
writecode     EQUS "loadvar"

MEM_BUFFER_0 EQUS "STRING_BUFFER_3"
MEM_BUFFER_1 EQUS "STRING_BUFFER_4"
MEM_BUFFER_2 EQUS "STRING_BUFFER_5"

vartomem      EQUS "getnum"
mapnametotext EQUS "getcurlandmarkname"
readcoins     EQUS "getcoins"

pokenamemem: MACRO
	getmonname \2, \1
ENDM

itemtotext: MACRO
	getitemname \2, \1
ENDM

landmarktotext: MACRO
	getlandmarkname \2, \1
ENDM

trainertotext: MACRO
	gettrainername \3, \1, \2
ENDM

trainerclassname: MACRO
	gettrainerclassname \2, \1
ENDM

name: MACRO
	getname \3, \1, \2
ENDM

stringtotext: MACRO
	getstring \2, \1
ENDM

readmoney: MACRO
	getmoney \2, \1
ENDM

RAM2MEM           EQUS "getnum"
loadfont          EQUS "opentext"
loadmenudata      EQUS "loadmenu"
loadmenuheader    EQUS "loadmenu"
writebackup       EQUS "closewindow"
interpretmenu     EQUS "_2dmenu"
interpretmenu2    EQUS "verticalmenu"
battlecheck       EQUS "randomwildmon"
loadtrainerdata   EQUS "loadtemptrainer"
loadpokedata      EQUS "loadwildmon"
returnafterbattle EQUS "reloadmapafterbattle"
trainerstatus     EQUS "trainerflagaction"
talkaftercancel   EQUS "endifjustbattled"
talkaftercheck    EQUS "checkjustbattled"
playrammusic      EQUS "encountermusic"
reloadmapmusic    EQUS "dontrestartmapmusic"
resetfuncs        EQUS "endall"
storetext         EQUS "battletowertext"
displaylocation   EQUS "landmarktotext"
givepokeitem      EQUS "givepokemail"
checkpokeitem     EQUS "checkpokemail"
passtoengine      EQUS "autoinput"
verbosegiveitem2  EQUS "verbosegiveitemvar"
loadbytec2cf      EQUS "writeunusedbytebuffer"

; macros/scripts/maps.asm

mapconst: MACRO
	map_const \1, \3, \2
ENDM

maptrigger EQUS "scene_script"

warp_def: MACRO
	warp_event \2, \1, \4, \3
ENDM

xy_trigger: MACRO
	coord_event \3, \2, \1, \5
ENDM

signpost: MACRO
	bg_event \2, \1, \3, \4
ENDM

person_event: MACRO
;	object_event \3, \2, \1, \4, \5, \6, \7, \8, \9, \10, \11, \12, \13
	db \1, \2 + 4, \3 + 4, \4
	dn \6, \5
	db \7, \8
	shift
	dn \8, \9
	shift
	db \9
	shift
	dw \9
	shift
	dw \9
ENDM

PERSONTYPE_SCRIPT   EQUS "OBJECTTYPE_SCRIPT"
PERSONTYPE_ITEMBALL EQUS "OBJECTTYPE_ITEMBALL"
PERSONTYPE_TRAINER  EQUS "OBJECTTYPE_TRAINER"

; macros/scripts/movement.asm

show_person   EQUS "show_object"
hide_person   EQUS "hide_object"
remove_person EQUS "remove_object"

turn_head_down        EQUS "turn_head DOWN"
turn_head_up          EQUS "turn_head UP"
turn_head_left        EQUS "turn_head LEFT"
turn_head_right       EQUS "turn_head RIGHT"
turn_step_down        EQUS "turn_step DOWN"
turn_step_up          EQUS "turn_step UP"
turn_step_left        EQUS "turn_step LEFT"
turn_step_right       EQUS "turn_step RIGHT"
slow_step_down        EQUS "slow_step DOWN"
slow_step_up          EQUS "slow_step UP"
slow_step_left        EQUS "slow_step LEFT"
slow_step_right       EQUS "slow_step RIGHT"
step_down             EQUS "step DOWN"
step_up               EQUS "step UP"
step_left             EQUS "step LEFT"
step_right            EQUS "step RIGHT"
big_step_down         EQUS "big_step DOWN"
big_step_up           EQUS "big_step UP"
big_step_left         EQUS "big_step LEFT"
big_step_right        EQUS "big_step RIGHT"
slow_slide_step_down  EQUS "slow_slide_step DOWN"
slow_slide_step_up    EQUS "slow_slide_step UP"
slow_slide_step_left  EQUS "slow_slide_step LEFT"
slow_slide_step_right EQUS "slow_slide_step RIGHT"
slide_step_down       EQUS "slide_step DOWN"
slide_step_up         EQUS "slide_step UP"
slide_step_left       EQUS "slide_step LEFT"
slide_step_right      EQUS "slide_step RIGHT"
fast_slide_step_down  EQUS "fast_slide_step DOWN"
fast_slide_step_up    EQUS "fast_slide_step UP"
fast_slide_step_left  EQUS "fast_slide_step LEFT"
fast_slide_step_right EQUS "fast_slide_step RIGHT"
turn_away_down        EQUS "turn_away DOWN"
turn_away_up          EQUS "turn_away UP"
turn_away_left        EQUS "turn_away LEFT"
turn_away_right       EQUS "turn_away RIGHT"
turn_in_down          EQUS "turn_in DOWN"
turn_in_up            EQUS "turn_in UP"
turn_in_left          EQUS "turn_in LEFT"
turn_in_right         EQUS "turn_in RIGHT"
turn_waterfall_down   EQUS "turn_waterfall DOWN"
turn_waterfall_up     EQUS "turn_waterfall UP"
turn_waterfall_left   EQUS "turn_waterfall LEFT"
turn_waterfall_right  EQUS "turn_waterfall RIGHT"
slow_jump_step_down   EQUS "slow_jump_step DOWN"
slow_jump_step_up     EQUS "slow_jump_step UP"
slow_jump_step_left   EQUS "slow_jump_step LEFT"
slow_jump_step_right  EQUS "slow_jump_step RIGHT"
jump_step_down        EQUS "jump_step DOWN"
jump_step_up          EQUS "jump_step UP"
jump_step_left        EQUS "jump_step LEFT"
jump_step_right       EQUS "jump_step RIGHT"
fast_jump_step_down   EQUS "fast_jump_step DOWN"
fast_jump_step_up     EQUS "fast_jump_step UP"
fast_jump_step_left   EQUS "fast_jump_step LEFT"
fast_jump_step_right  EQUS "fast_jump_step RIGHT"

step_sleep_1 EQUS "step_sleep 1"
step_sleep_2 EQUS "step_sleep 2"
step_sleep_3 EQUS "step_sleep 3"
step_sleep_4 EQUS "step_sleep 4"
step_sleep_5 EQUS "step_sleep 5"
step_sleep_6 EQUS "step_sleep 6"
step_sleep_7 EQUS "step_sleep 7"
step_sleep_8 EQUS "step_sleep 8"

; macros/scripts/text.asm
text_from_ram          EQUS "text_ram"
start_asm              EQUS "text_asm"
deciram                EQUS "text_decimal"
interpret_data         EQUS "text_pause"
limited_interpret_data EQUS "text_dots"
link_wait_button       EQUS "text_linkwaitbutton"
current_day            EQUS "text_today"
text_jump              EQUS "text_far"

; macros/scripts/battle_anims.asm
anim_enemyfeetobj  EQUS "anim_battlergfx_2row"
anim_playerheadobj EQUS "anim_battlergfx_1row"
anim_clearsprites  EQUS "anim_keepsprites"
