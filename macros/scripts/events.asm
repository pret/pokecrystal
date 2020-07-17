; ScriptCommandTable indexes (see engine/overworld/scripting.asm)
	const_def

	const scall_command ; $00
scall: MACRO
	db scall_command
	dw \1 ; pointer
ENDM

	const farscall_command ; $01
farscall: MACRO
	db farscall_command
	dba \1
ENDM

	const memcall_command ; $02
memcall: MACRO
	db memcall_command
	dw \1 ; pointer
ENDM

	const sjump_command ; $03
sjump: MACRO
	db sjump_command
	dw \1 ; pointer
ENDM

	const farsjump_command ; $04
farsjump: MACRO
	db farsjump_command
	dba \1
ENDM

	const memjump_command ; $05
memjump: MACRO
	db memjump_command
	dw \1 ; pointer
ENDM

	const ifequal_command ; $06
ifequal: MACRO
	db ifequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const ifnotequal_command ; $07
ifnotequal: MACRO
	db ifnotequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const iffalse_command ; $08
iffalse: MACRO
	db iffalse_command
	dw \1 ; pointer
ENDM

	const iftrue_command ; $09
iftrue: MACRO
	db iftrue_command
	dw \1 ; pointer
ENDM

	const ifgreater_command ; $0a
ifgreater: MACRO
	db ifgreater_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const ifless_command ; $0b
ifless: MACRO
	db ifless_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	const jumpstd_command ; $0c
jumpstd: MACRO
	db jumpstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	const callstd_command ; $0d
callstd: MACRO
	db callstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	const callasm_command ; $0e
callasm: MACRO
	db callasm_command
	dba \1
ENDM

	const special_command ; $0f
special: MACRO
	db special_command
	dw (\1Special - SpecialsPointers) / 3
ENDM

	const memcallasm_command ; $10
memcallasm: MACRO
	db memcallasm_command
	dw \1 ; asm
ENDM

	const checkmapscene_command ; $11
checkmapscene: MACRO
	db checkmapscene_command
	map_id \1 ; map
ENDM

	const setmapscene_command ; $12
setmapscene: MACRO
	db setmapscene_command
	map_id \1 ; map
	db \2 ; scene_id
ENDM

	const checkscene_command ; $13
checkscene: MACRO
	db checkscene_command
ENDM

	const setscene_command ; $14
setscene: MACRO
	db setscene_command
	db \1 ; scene_id
ENDM

	const setval_command ; $15
setval: MACRO
	db setval_command
	db \1 ; value
ENDM

	const addval_command ; $16
addval: MACRO
	db addval_command
	db \1 ; value
ENDM

	const random_command ; $17
random: MACRO
	db random_command
	db \1 ; input
ENDM

	const checkver_command ; $18
checkver: MACRO
	db checkver_command
ENDM

	const readmem_command ; $19
readmem: MACRO
	db readmem_command
	dw \1 ; address
ENDM

	const writemem_command ; $1a
writemem: MACRO
	db writemem_command
	dw \1 ; address
ENDM

	const loadmem_command ; $1b
loadmem: MACRO
	db loadmem_command
	dw \1 ; address
	db \2 ; value
ENDM

	const readvar_command ; $1c
readvar: MACRO
	db readvar_command
	db \1 ; variable_id
ENDM

	const writevar_command ; $1d
writevar: MACRO
	db writevar_command
	db \1 ; variable_id
ENDM

	const loadvar_command ; $1e
loadvar: MACRO
if STRIN("\1", "VAR_") != 1
; LEGACY: Support for the old name of "loadmem"
	loadmem \1, \2
else
	db loadvar_command
	db \1 ; variable_id
	db \2 ; value
endc
ENDM

	const giveitem_command ; $1f
giveitem: MACRO
if _NARG == 1
	giveitem \1, 1
else
	db giveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	const takeitem_command ; $20
takeitem: MACRO
if _NARG == 1
	takeitem \1, 1
else
	db takeitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	const checkitem_command ; $21
checkitem: MACRO
	db checkitem_command
	db \1 ; item
ENDM

	const givemoney_command ; $22
givemoney: MACRO
	db givemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const takemoney_command ; $23
takemoney: MACRO
	db takemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const checkmoney_command ; $24
checkmoney: MACRO
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	const givecoins_command ; $25
givecoins: MACRO
	db givecoins_command
	dw \1 ; coins
ENDM

	const takecoins_command ; $26
takecoins: MACRO
	db takecoins_command
	dw \1 ; coins
ENDM

	const checkcoins_command ; $27
checkcoins: MACRO
	db checkcoins_command
	dw \1 ; coins
ENDM

	const addcellnum_command ; $28
addcellnum: MACRO
	db addcellnum_command
	db \1 ; person
ENDM

	const delcellnum_command ; $29
delcellnum: MACRO
	db delcellnum_command
	db \1 ; person
ENDM

	const checkcellnum_command ; $2a
checkcellnum: MACRO
	db checkcellnum_command
	db \1 ; person
ENDM

	const checktime_command ; $2b
checktime: MACRO
	db checktime_command
	db \1 ; time
ENDM

	const checkpoke_command ; $2c
checkpoke: MACRO
	db checkpoke_command
	db \1 ; pkmn
ENDM

	const givepoke_command ; $2d
givepoke: MACRO
if _NARG == 2
	givepoke \1, \2, NO_ITEM, FALSE
elif _NARG == 3
	givepoke \1, \2, \3, FALSE
else
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	db \3 ; item
	db \4 ; trainer
if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
endc
endc
ENDM

	const giveegg_command ; $2e
giveegg: MACRO
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

	const givepokemail_command ; $2f
givepokemail: MACRO
	db givepokemail_command
	dw \1 ; pointer
ENDM

	const checkpokemail_command ; $30
checkpokemail: MACRO
	db checkpokemail_command
	dw \1 ; pointer
ENDM

	const checkevent_command ; $31
checkevent: MACRO
	db checkevent_command
	dw \1 ; event_flag
ENDM

	const clearevent_command ; $32
clearevent: MACRO
	db clearevent_command
	dw \1 ; event_flag
ENDM

	const setevent_command ; $33
setevent: MACRO
	db setevent_command
	dw \1 ; event_flag
ENDM

	const checkflag_command ; $34
checkflag: MACRO
	db checkflag_command
	dw \1 ; engine_flag
ENDM

	const clearflag_command ; $35
clearflag: MACRO
	db clearflag_command
	dw \1 ; engine_flag
ENDM

	const setflag_command ; $36
setflag: MACRO
	db setflag_command
	dw \1 ; engine_flag
ENDM

	const wildon_command ; $37
wildon: MACRO
	db wildon_command
ENDM

	const wildoff_command ; $38
wildoff: MACRO
	db wildoff_command
ENDM

	const xycompare_command ; $39
xycompare: MACRO
	db xycompare_command
	dw \1 ; pointer
ENDM

	const warpmod_command ; $3a
warpmod: MACRO
	db warpmod_command
	db \1 ; warp_id
	map_id \2 ; map
ENDM

	const blackoutmod_command ; $3b
blackoutmod: MACRO
	db blackoutmod_command
	map_id \1 ; map
ENDM

	const warp_command ; $3c
warp: MACRO
	db warp_command
	map_id \1 ; map
	db \2 ; x
	db \3 ; y
ENDM

	const getmoney_command ; $3d
getmoney: MACRO
	db getmoney_command
	db \2 ; account
	db \1 ; string_buffer
ENDM

	const getcoins_command ; $3e
getcoins: MACRO
	db getcoins_command
	db \1 ; string_buffer
ENDM

	const getnum_command ; $3f
getnum: MACRO
	db getnum_command
	db \1 ; string_buffer
ENDM

	const getmonname_command ; $40
getmonname: MACRO
	db getmonname_command
	db \2 ; pokemon
	db \1 ; string_buffer
ENDM

	const getitemname_command ; $41
getitemname: MACRO
	db getitemname_command
	db \2 ; item
	db \1 ; string_buffer
ENDM

	const getcurlandmarkname_command ; $42
getcurlandmarkname: MACRO
	db getcurlandmarkname_command
	db \1 ; string_buffer
ENDM

	const gettrainername_command ; $43
gettrainername: MACRO
	db gettrainername_command
	db \2 ; trainer_group
	db \3 ; trainer_id
	db \1 ; string_buffer
ENDM

	const getstring_command ; $44
getstring: MACRO
	db getstring_command
	dw \2 ; text_pointer
	db \1 ; string_buffer
ENDM

	const itemnotify_command ; $45
itemnotify: MACRO
	db itemnotify_command
ENDM

	const pocketisfull_command ; $46
pocketisfull: MACRO
	db pocketisfull_command
ENDM

	const opentext_command ; $47
opentext: MACRO
	db opentext_command
ENDM

	const refreshscreen_command ; $48
refreshscreen: MACRO
if _NARG == 0
	refreshscreen 0
else
	db refreshscreen_command
	db \1 ; dummy
endc
ENDM

	const closetext_command ; $49
closetext: MACRO
	db closetext_command
ENDM

	const writeunusedbytebuffer_command ; $4a
writeunusedbytebuffer: MACRO
	db writeunusedbytebuffer_command
	db \1 ; byte
ENDM

	const farwritetext_command ; $4b
farwritetext: MACRO
	db farwritetext_command
	dba \1
ENDM

	const writetext_command ; $4c
writetext: MACRO
	db writetext_command
	dw \1 ; text_pointer
ENDM

	const repeattext_command ; $4d
repeattext: MACRO
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
ENDM

	const yesorno_command ; $4e
yesorno: MACRO
	db yesorno_command
ENDM

	const loadmenu_command ; $4f
loadmenu: MACRO
	db loadmenu_command
	dw \1 ; menu_header
ENDM

	const closewindow_command ; $50
closewindow: MACRO
	db closewindow_command
ENDM

	const jumptextfaceplayer_command ; $51
jumptextfaceplayer: MACRO
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
ENDM

	const farjumptext_command ; $52
farjumptext: MACRO
	db farjumptext_command
	dba \1
ENDM

	const jumptext_command ; $53
jumptext: MACRO
	db jumptext_command
	dw \1 ; text_pointer
ENDM

	const waitbutton_command ; $54
waitbutton: MACRO
	db waitbutton_command
ENDM

	const promptbutton_command ; $55
promptbutton: MACRO
	db promptbutton_command
ENDM

	const pokepic_command ; $56
pokepic: MACRO
	db pokepic_command
	db \1 ; pokemon
ENDM

	const closepokepic_command ; $57
closepokepic: MACRO
	db closepokepic_command
ENDM

	const _2dmenu_command ; $58
_2dmenu: MACRO
	db _2dmenu_command
ENDM

	const verticalmenu_command ; $59
verticalmenu: MACRO
	db verticalmenu_command
ENDM

	const loadpikachudata_command ; $5a
loadpikachudata: MACRO
	db loadpikachudata_command
ENDM

	const randomwildmon_command ; $5b
randomwildmon: MACRO
	db randomwildmon_command
ENDM

	const loadtemptrainer_command ; $5c
loadtemptrainer: MACRO
	db loadtemptrainer_command
ENDM

	const loadwildmon_command ; $5d
loadwildmon: MACRO
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
ENDM

	const loadtrainer_command ; $5e
loadtrainer: MACRO
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
ENDM

	const startbattle_command ; $5f
startbattle: MACRO
	db startbattle_command
ENDM

	const reloadmapafterbattle_command ; $60
reloadmapafterbattle: MACRO
	db reloadmapafterbattle_command
ENDM

	const catchtutorial_command ; $61
catchtutorial: MACRO
	db catchtutorial_command
	db \1 ; byte
ENDM

	const trainertext_command ; $62
trainertext: MACRO
	db trainertext_command
	db \1 ; text_id
ENDM

	const trainerflagaction_command ; $63
trainerflagaction: MACRO
	db trainerflagaction_command
	db \1 ; action
ENDM

	const winlosstext_command ; $64
winlosstext: MACRO
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
ENDM

	const scripttalkafter_command ; $65
scripttalkafter: MACRO
	db scripttalkafter_command
ENDM

	const endifjustbattled_command ; $66
endifjustbattled: MACRO
	db endifjustbattled_command
ENDM

	const checkjustbattled_command ; $67
checkjustbattled: MACRO
	db checkjustbattled_command
ENDM

	const setlasttalked_command ; $68
setlasttalked: MACRO
	db setlasttalked_command
	db \1 ; object id
ENDM

	const applymovement_command ; $69
applymovement: MACRO
	db applymovement_command
	db \1 ; object id
	dw \2 ; data
ENDM

	const applymovementlasttalked_command ; $6a
applymovementlasttalked: MACRO
	db applymovementlasttalked_command
	dw \1 ; data
ENDM

	const faceplayer_command ; $6b
faceplayer: MACRO
	db faceplayer_command
ENDM

	const faceobject_command ; $6c
faceobject: MACRO
	db faceobject_command
	db \1 ; object1
	db \2 ; object2
ENDM

	const variablesprite_command ; $6d
variablesprite: MACRO
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
ENDM

	const disappear_command ; $6e
disappear: MACRO
	db disappear_command
	db \1 ; object id
ENDM

	const appear_command ; $6f
appear: MACRO
	db appear_command
	db \1 ; object id
ENDM

	const follow_command ; $70
follow: MACRO
	db follow_command
	db \1 ; object2
	db \2 ; object1
ENDM

	const stopfollow_command ; $71
stopfollow: MACRO
	db stopfollow_command
ENDM

	const moveobject_command ; $72
moveobject: MACRO
	db moveobject_command
	db \1 ; object id
	db \2 ; x
	db \3 ; y
ENDM

	const writeobjectxy_command ; $73
writeobjectxy: MACRO
	db writeobjectxy_command
	db \1 ; object id
ENDM

	const loademote_command ; $74
loademote: MACRO
	db loademote_command
	db \1 ; bubble
ENDM

	const showemote_command ; $75
showemote: MACRO
	db showemote_command
	db \1 ; bubble
	db \2 ; object id
	db \3 ; time
ENDM

	const turnobject_command ; $76
turnobject: MACRO
	db turnobject_command
	db \1 ; object id
	db \2 ; facing
ENDM

	const follownotexact_command ; $77
follownotexact: MACRO
	db follownotexact_command
	db \1 ; object2
	db \2 ; object1
ENDM

	const earthquake_command ; $78
earthquake: MACRO
	db earthquake_command
	db \1 ; param
ENDM

	const changemapblocks_command ; $79
changemapblocks: MACRO
	db changemapblocks_command
	dba \1 ; map_data_pointer
ENDM

	const changeblock_command ; $7a
changeblock: MACRO
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
ENDM

	const reloadmap_command ; $7b
reloadmap: MACRO
	db reloadmap_command
ENDM

	const reloadmappart_command ; $7c
reloadmappart: MACRO
	db reloadmappart_command
ENDM

	const writecmdqueue_command ; $7d
writecmdqueue: MACRO
	db writecmdqueue_command
	dw \1 ; queue_pointer
ENDM

	const delcmdqueue_command ; $7e
delcmdqueue: MACRO
	db delcmdqueue_command
	db \1 ; byte
ENDM

	const playmusic_command ; $7f
playmusic: MACRO
	db playmusic_command
	dw \1 ; music_pointer
ENDM

	const encountermusic_command ; $80
encountermusic: MACRO
	db encountermusic_command
ENDM

	const musicfadeout_command ; $81
musicfadeout: MACRO
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
ENDM

	const playmapmusic_command ; $82
playmapmusic: MACRO
	db playmapmusic_command
ENDM

	const dontrestartmapmusic_command ; $83
dontrestartmapmusic: MACRO
	db dontrestartmapmusic_command
ENDM

	const cry_command ; $84
cry: MACRO
	db cry_command
	dw \1 ; cry_id
ENDM

	const playsound_command ; $85
playsound: MACRO
	db playsound_command
	dw \1 ; sound_pointer
ENDM

	const waitsfx_command ; $86
waitsfx: MACRO
	db waitsfx_command
ENDM

	const warpsound_command ; $87
warpsound: MACRO
	db warpsound_command
ENDM

	const specialsound_command ; $88
specialsound: MACRO
	db specialsound_command
ENDM

	const autoinput_command ; $89
autoinput: MACRO
	db autoinput_command
	dba \1
ENDM

	const newloadmap_command ; $8a
newloadmap: MACRO
	db newloadmap_command
	db \1 ; which_method
ENDM

	const pause_command ; $8b
pause: MACRO
	db pause_command
	db \1 ; length
ENDM

	const deactivatefacing_command ; $8c
deactivatefacing: MACRO
	db deactivatefacing_command
	db \1 ; time
ENDM

	const prioritysjump_command ; $8d
prioritysjump: MACRO
	db prioritysjump_command
	dw \1 ; pointer
ENDM

	const warpcheck_command ; $8e
warpcheck: MACRO
	db warpcheck_command
ENDM

	const stopandsjump_command ; $8f
stopandsjump: MACRO
	db stopandsjump_command
	dw \1 ; pointer
ENDM

	const endcallback_command ; $90
endcallback: MACRO
	db endcallback_command
ENDM

	const end_command ; $91
end: MACRO
	db end_command
ENDM

	const reloadend_command ; $92
reloadend: MACRO
	db reloadend_command
	db \1 ; which_method
ENDM

	const endall_command ; $93
endall: MACRO
	db endall_command
ENDM

	const pokemart_command ; $94
pokemart: MACRO
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
ENDM

	const elevator_command ; $95
elevator: MACRO
	db elevator_command
	dw \1 ; floor_list_pointer
ENDM

	const trade_command ; $96
trade: MACRO
	db trade_command
	db \1 ; trade_id
ENDM

	const askforphonenumber_command ; $97
askforphonenumber: MACRO
	db askforphonenumber_command
	db \1 ; number
ENDM

	const phonecall_command ; $98
phonecall: MACRO
	db phonecall_command
	dw \1 ; caller_name
ENDM

	const hangup_command ; $99
hangup: MACRO
	db hangup_command
ENDM

	const describedecoration_command ; $9a
describedecoration: MACRO
	db describedecoration_command
	db \1 ; byte
ENDM

	const fruittree_command ; $9b
fruittree: MACRO
	db fruittree_command
	db \1 ; tree_id
ENDM

	const specialphonecall_command ; $9c
specialphonecall: MACRO
	db specialphonecall_command
	dw \1 ; call_id
ENDM

	const checkphonecall_command ; $9d
checkphonecall: MACRO
	db checkphonecall_command
ENDM

	const verbosegiveitem_command ; $9e
verbosegiveitem: MACRO
if _NARG == 1
	verbosegiveitem \1, 1
else
	db verbosegiveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	const verbosegiveitemvar_command ; $9f
verbosegiveitemvar: MACRO
	db verbosegiveitemvar_command
	db \1 ; item
	db \2 ; var
ENDM

	const swarm_command ; $a0
swarm: MACRO
	db swarm_command
	db \1 ; flag
	map_id \2 ; map
ENDM

	const halloffame_command ; $a1
halloffame: MACRO
	db halloffame_command
ENDM

	const credits_command ; $a2
credits: MACRO
	db credits_command
ENDM

	const warpfacing_command ; $a3
warpfacing: MACRO
	db warpfacing_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
ENDM

	const battletowertext_command ; $a4
battletowertext: MACRO
	db battletowertext_command
	db \1 ; bttext_id
ENDM

	const getlandmarkname_command ; $a5
getlandmarkname: MACRO
	db getlandmarkname_command
	db \2 ; landmark_id
	db \1 ; string_buffer
ENDM

	const gettrainerclassname_command ; $a6
gettrainerclassname: MACRO
	db gettrainerclassname_command
	db \2 ; trainer_group
	db \1 ; string_buffer
ENDM

	const getname_command ; $a7
getname: MACRO
	db getname_command
	db \2 ; type
	db \3 ; id
	db \1 ; memory
ENDM

	const wait_command ; $a8
wait: MACRO
	db wait_command
	db \1 ; duration
ENDM

	const checksave_command ; $a9
checksave: MACRO
	db checksave_command
ENDM
