	enum_start

	enum scall_command
scall: macro
	db scall_command
	dw \1 ; pointer
	endm

	enum farscall_command
farscall: macro
	db farscall_command
	dba \1
	endm

	enum ptcall_command
ptcall: macro
	db ptcall_command
	dw \1 ; pointer
	endm

	enum jump_command
jump: macro
	db jump_command
	dw \1 ; pointer
	endm

	enum farjump_command
farjump: macro
	db farjump_command
	dba \1
	endm

	enum ptjump_command
ptjump: macro
	db ptjump_command
	dw \1 ; pointer
	endm

	enum if_equal_command
if_equal: macro
	db if_equal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum if_not_equal_command
if_not_equal: macro
	db if_not_equal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum iffalse_command
iffalse: macro
	db iffalse_command
	dw \1 ; pointer
	endm

	enum iftrue_command
iftrue: macro
	db iftrue_command
	dw \1 ; pointer
	endm

	enum if_greater_than_command
if_greater_than: macro
	db if_greater_than_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum if_less_than_command
if_less_than: macro
	db if_less_than_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum jumpstd_command
jumpstd: macro
	db jumpstd_command
	dw \1 ; predefined_script
	endm

	enum callstd_command
callstd: macro
	db callstd_command
	dw \1 ; predefined_script
	endm

	enum callasm_command
callasm: macro
	db callasm_command
	dba \1
	endm

	enum special_command
special: macro
	db special_command
	dw (\1Special - SpecialsPointers) / 3
	endm

add_special: MACRO
\1Special::
	dba \1
ENDM

	enum ptcallasm_command
ptcallasm: macro
	db ptcallasm_command
	dw \1 ; asm
	endm

	enum checkmaptriggers_command
checkmaptriggers: macro
	db checkmaptriggers_command
	map \1 ; map
	endm

	enum domaptrigger_command
domaptrigger: macro
	db domaptrigger_command
	map \1 ; map
	db \2 ; trigger_id
	endm

	enum checktriggers_command
checktriggers: macro
	db checktriggers_command
	endm

	enum dotrigger_command
dotrigger: macro
	db dotrigger_command
	db \1 ; trigger_id
	endm

	enum writebyte_command
writebyte: macro
	db writebyte_command
	db \1 ; value
	endm

	enum addvar_command
addvar: macro
	db addvar_command
	db \1 ; value
	endm

	enum random_command
random: macro
	db random_command
	db \1 ; input
	endm

	enum checkver_command
checkver: macro
	db checkver_command
	endm

	enum copybytetovar_command
copybytetovar: macro
	db copybytetovar_command
	dw \1 ; address
	endm

	enum copyvartobyte_command
copyvartobyte: macro
	db copyvartobyte_command
	dw \1 ; address
	endm

	enum loadvar_command
loadvar: macro
	db loadvar_command
	dw \1 ; address
	db \2 ; value
	endm

	enum checkcode_command
checkcode: macro
	db checkcode_command
	db \1 ; variable_id
	endm

	enum writevarcode_command
writevarcode: macro
	db writevarcode_command
	db \1 ; variable_id
	endm

	enum writecode_command
writecode: macro
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
	endm

	enum giveitem_command
giveitem: macro
	db giveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum takeitem_command
takeitem: macro
	db takeitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum checkitem_command
checkitem: macro
	db checkitem_command
	db \1 ; item
	endm

	enum givemoney_command
givemoney: macro
	db givemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum takemoney_command
takemoney: macro
	db takemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum checkmoney_command
checkmoney: macro
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum givecoins_command
givecoins: macro
	db givecoins_command
	dw \1 ; coins
	endm

	enum takecoins_command
takecoins: macro
	db takecoins_command
	dw \1 ; coins
	endm

	enum checkcoins_command
checkcoins: macro
	db checkcoins_command
	dw \1 ; coins
	endm

	enum addcellnum_command
addcellnum: macro
	db addcellnum_command
	db \1 ; person
	endm

	enum delcellnum_command
delcellnum: macro
	db delcellnum_command
	db \1 ; person
	endm

	enum checkcellnum_command
checkcellnum: macro
	db checkcellnum_command
	db \1 ; person
	endm

	enum checktime_command
checktime: macro
	db checktime_command
	db \1 ; time
	endm

checkmorn EQUS "checktime 1 << MORN"
checkday  EQUS "checktime 1 << DAY"
checknite EQUS "checktime 1 << NITE"

	enum checkpoke_command
checkpoke: macro
	db checkpoke_command
	db \1 ; pkmn
	endm

	enum givepoke_command
givepoke: macro
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	if _NARG >= 3
	db \3 ; item
	if _NARG >= 4
	db \4 ; trainer
	if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
	endc
	else
	db 0
	endc
	else
	db 0, 0
	endc
	endm

	enum giveegg_command
giveegg: macro
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
	endm

	enum givepokeitem_command
givepokeitem: macro
	db givepokeitem_command
	dw \1 ; pointer
	endm

	enum checkpokeitem_command
checkpokeitem: macro
	db checkpokeitem_command
	dw \1 ; pointer
	endm

	enum checkevent_command
checkevent: macro
	db checkevent_command
	dw \1 ; event_flag
	endm

	enum clearevent_command
clearevent: macro
	db clearevent_command
	dw \1 ; event_flag
	endm

	enum setevent_command
setevent: macro
	db setevent_command
	dw \1 ; event_flag
	endm

	enum checkflag_command
checkflag: macro
	db checkflag_command
	dw \1 ; engine_flag
	endm

	enum clearflag_command
clearflag: macro
	db clearflag_command
	dw \1 ; engine_flag
	endm

	enum setflag_command
setflag: macro
	db setflag_command
	dw \1 ; engine_flag
	endm

	enum wildon_command
wildon: macro
	db wildon_command
	endm

	enum wildoff_command
wildoff: macro
	db wildoff_command
	endm

	enum xycompare_command
xycompare: macro
	db xycompare_command
	dw \1 ; pointer
	endm

	enum warpmod_command
warpmod: macro
	db warpmod_command
	db \1 ; warp_id
	map \2 ; map
	endm

	enum blackoutmod_command
blackoutmod: macro
	db blackoutmod_command
	map \1 ; map
	endm

	enum warp_command
warp: macro
	db warp_command
	map \1 ; map
	db \2 ; x
	db \3 ; y
	endm

	enum readmoney_command
readmoney: macro
	db readmoney_command
	db \1 ; account
	db \2 ; memory
	endm

	enum readcoins_command
readcoins: macro
	db readcoins_command
	db \1 ; memory
	endm

	enum RAM2MEM_command
RAM2MEM: macro
	db RAM2MEM_command
	db \1 ; memory
	endm

	enum pokenamemem_command
pokenamemem: macro
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
	endm

	enum itemtotext_command
itemtotext: macro
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
	endm

	enum mapnametotext_command
mapnametotext: macro
	db mapnametotext_command
	db \1 ; memory
	endm

	enum trainertotext_command
trainertotext: macro
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	endm

	enum stringtotext_command
stringtotext: macro
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
	endm

	enum itemnotify_command
itemnotify: macro
	db itemnotify_command
	endm

	enum pocketisfull_command
pocketisfull: macro
	db pocketisfull_command
	endm

	enum opentext_command
opentext: macro
	db opentext_command
	endm

	enum refreshscreen_command
refreshscreen: macro
	db refreshscreen_command
	db \1 ; dummy
	endm

	enum closetext_command
closetext: macro
	db closetext_command
	endm

	enum loadbytec2cf_command
loadbytec2cf: macro
	db loadbytec2cf_command
	db \1 ; byte
	endm

	enum farwritetext_command
farwritetext: macro
	db farwritetext_command
	dba \1
	endm

	enum writetext_command
writetext: macro
	db writetext_command
	dw \1 ; text_pointer
	endm

	enum repeattext_command
repeattext: macro
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
	endm

	enum yesorno_command
yesorno: macro
	db yesorno_command
	endm

	enum loadmenudata_command
loadmenudata: macro
	db loadmenudata_command
	dw \1 ; data
	endm

	enum closewindow_command
closewindow: macro
	db closewindow_command
	endm

	enum jumptextfaceplayer_command
jumptextfaceplayer: macro
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
	endm

; IF _CRYSTAL
	enum farjumptext_command
farjumptext: macro
	db farjumptext_command
	dba \1
	endm
; ENDC

	enum jumptext_command
jumptext: macro
	db jumptext_command
	dw \1 ; text_pointer
	endm

	enum waitbutton_command
waitbutton: macro
	db waitbutton_command
	endm

	enum buttonsound_command
buttonsound: macro
	db buttonsound_command
	endm

	enum pokepic_command
pokepic: macro
	db pokepic_command
	db \1 ; pokemon
	endm

	enum closepokepic_command
closepokepic: macro
	db closepokepic_command
	endm

	enum _2dmenu_command
_2dmenu: macro
	db _2dmenu_command
	endm

	enum verticalmenu_command
verticalmenu: macro
	db verticalmenu_command
	endm

	enum loadpikachudata_command
loadpikachudata: macro
	db loadpikachudata_command
	endm

	enum randomwildmon_command
randomwildmon: macro
	db randomwildmon_command
	endm

	enum loadmemtrainer_command
loadmemtrainer: macro
	db loadmemtrainer_command
	endm

	enum loadwildmon_command
loadwildmon: macro
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
	endm

	enum loadtrainer_command
loadtrainer: macro
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
	endm

	enum startbattle_command
startbattle: macro
	db startbattle_command
	endm

	enum reloadmapafterbattle_command
reloadmapafterbattle: macro
	db reloadmapafterbattle_command
	endm

	enum catchtutorial_command
catchtutorial: macro
	db catchtutorial_command
	db \1 ; byte
	endm

	enum trainertext_command
trainertext: macro
	db trainertext_command
	db \1 ; which_text
	endm

	enum trainerflagaction_command
trainerflagaction: macro
	db trainerflagaction_command
	db \1 ; action
	endm

	enum winlosstext_command
winlosstext: macro
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	endm

	enum scripttalkafter_command
scripttalkafter: macro
	db scripttalkafter_command
	endm

	enum end_if_just_battled_command
end_if_just_battled: macro
	db end_if_just_battled_command
	endm

	enum check_just_battled_command
check_just_battled: macro
	db check_just_battled_command
	endm

	enum setlasttalked_command
setlasttalked: macro
	db setlasttalked_command
	db \1 ; person
	endm

	enum applymovement_command
applymovement: macro
	db applymovement_command
	db \1 ; person
	dw \2 ; data
	endm

	enum applymovement2_command
applymovement2: macro
	db applymovement2_command
	dw \1 ; data
	endm

	enum faceplayer_command
faceplayer: macro
	db faceplayer_command
	endm

	enum faceperson_command
faceperson: macro
	db faceperson_command
	db \1 ; person1
	db \2 ; person2
	endm

	enum variablesprite_command
variablesprite: macro
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
	endm

	enum disappear_command
disappear: macro
	db disappear_command
	db \1 ; person
	endm

	enum appear_command
appear: macro
	db appear_command
	db \1 ; person
	endm

	enum follow_command
follow: macro
	db follow_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum stopfollow_command
stopfollow: macro
	db stopfollow_command
	endm

	enum moveperson_command
moveperson: macro
	db moveperson_command
	db \1 ; person
	db \2 ; x
	db \3 ; y
	endm

	enum writepersonxy_command
writepersonxy: macro
	db writepersonxy_command
	db \1 ; person
	endm

	enum loademote_command
loademote: macro
	db loademote_command
	db \1 ; bubble
	endm

	enum showemote_command
showemote: macro
	db showemote_command
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
	endm

	enum spriteface_command
spriteface: macro
	db spriteface_command
	db \1 ; person
	db \2 ; facing
	endm

	enum follownotexact_command
follownotexact: macro
	db follownotexact_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum earthquake_command
earthquake: macro
	db earthquake_command
	db \1 ; param
	endm

	enum changemap_command
changemap: macro
	db changemap_command
	db \1 ; map_bank
	dw \2 ; map_data_pointer
	endm

	enum changeblock_command
changeblock: macro
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
	endm

	enum reloadmap_command
reloadmap: macro
	db reloadmap_command
	endm

	enum reloadmappart_command
reloadmappart: macro
	db reloadmappart_command
	endm

	enum writecmdqueue_command
writecmdqueue: macro
	db writecmdqueue_command
	dw \1 ; queue_pointer
	endm

	enum delcmdqueue_command
delcmdqueue: macro
	db delcmdqueue_command
	db \1 ; byte
	endm

	enum playmusic_command
playmusic: macro
	db playmusic_command
	dw \1 ; music_pointer
	endm

	enum encountermusic_command
encountermusic: macro
	db encountermusic_command
	endm

	enum musicfadeout_command
musicfadeout: macro
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
	endm

	enum playmapmusic_command
playmapmusic: macro
	db playmapmusic_command
	endm

	enum dontrestartmapmusic_command
dontrestartmapmusic: macro
	db dontrestartmapmusic_command
	endm

	enum cry_command
cry: macro
	db cry_command
	dw \1 ; cry_id
	endm

	enum playsound_command
playsound: macro
	db playsound_command
	dw \1 ; sound_pointer
	endm

	enum waitsfx_command
waitsfx: macro
	db waitsfx_command
	endm

	enum warpsound_command
warpsound: macro
	db warpsound_command
	endm

	enum specialsound_command
specialsound: macro
	db specialsound_command
	endm

	enum passtoengine_command
passtoengine: macro
	db passtoengine_command
	db \1 ; data_pointer
	endm

	enum newloadmap_command
newloadmap: macro
	db newloadmap_command
	db \1 ; which_method
	endm

	enum pause_command
pause: macro
	db pause_command
	db \1 ; length
	endm

	enum deactivatefacing_command
deactivatefacing: macro
	db deactivatefacing_command
	db \1 ; time
	endm

	enum priorityjump_command
priorityjump: macro
	db priorityjump_command
	dw \1 ; pointer
	endm

	enum warpcheck_command
warpcheck: macro
	db warpcheck_command
	endm

	enum ptpriorityjump_command
ptpriorityjump: macro
	db ptpriorityjump_command
	dw \1 ; pointer
	endm

	enum return_command
return: macro
	db return_command
	endm

	enum end_command
end: macro
	db end_command
	endm

	enum reloadandreturn_command
reloadandreturn: macro
	db reloadandreturn_command
	db \1 ; which_method
	endm

	enum end_all_command
end_all: macro
	db end_all_command
	endm

	enum pokemart_command
pokemart: macro
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
	endm

	enum elevator_command
elevator: macro
	db elevator_command
	dw \1 ; floor_list_pointer
	endm

	enum trade_command
trade: macro
	db trade_command
	db \1 ; trade_id
	endm

	enum askforphonenumber_command
askforphonenumber: macro
	db askforphonenumber_command
	db \1 ; number
	endm

	enum phonecall_command
phonecall: macro
	db phonecall_command
	dw \1 ; caller_name
	endm

	enum hangup_command
hangup: macro
	db hangup_command
	endm

	enum describedecoration_command
describedecoration: macro
	db describedecoration_command
	db \1 ; byte
	endm

	enum fruittree_command
fruittree: macro
	db fruittree_command
	db \1 ; tree_id
	endm

	enum specialphonecall_command
specialphonecall: macro
	db specialphonecall_command
	dw \1 ; call_id
	endm

	enum checkphonecall_command
checkphonecall: macro
	db checkphonecall_command
	endm

	enum verbosegiveitem_command
verbosegiveitem: macro
	db verbosegiveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum verbosegiveitem2_command
verbosegiveitem2: macro
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
	endm

	enum swarm_command
swarm: macro
	db swarm_command
	db \1 ; flag
	map \2 ; map
	endm

	enum halloffame_command
halloffame: macro
	db halloffame_command
	endm

	enum credits_command
credits: macro
	db credits_command
	endm

	enum warpfacing_command
warpfacing: macro
	db warpfacing_command
	db \1 ; facing
	map \2 ; map
	db \3 ; x
	db \4 ; y
	endm

	enum battletowertext_command
battletowertext: macro
	db battletowertext_command
	db \1 ; memory
	endm

	enum landmarktotext_command
landmarktotext: macro
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
	endm

	enum trainerclassname_command
trainerclassname: macro
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
	endm

	enum name_command
name: macro
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
	endm

	enum wait_command
wait: macro
	db wait_command
	db \1 ; duration
	endm

	enum check_save_command
check_save: macro
	db check_save_command
	endm
