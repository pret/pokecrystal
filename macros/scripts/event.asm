; ScriptCommandTable indexes (see engine/scripting.asm)
	enum_start

	enum scall_command ; $00
scall: macro
	db scall_command
	dw \1 ; pointer
	endm

	enum farscall_command ; $01
farscall: macro
	db farscall_command
	dba \1
	endm

	enum ptcall_command ; $02
ptcall: macro
	db ptcall_command
	dw \1 ; pointer
	endm

	enum jump_command ; $03
jump: macro
	db jump_command
	dw \1 ; pointer
	endm

	enum farjump_command ; $04
farjump: macro
	db farjump_command
	dba \1
	endm

	enum ptjump_command ; $05
ptjump: macro
	db ptjump_command
	dw \1 ; pointer
	endm

	enum if_equal_command ; $06
if_equal: macro
	db if_equal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum if_not_equal_command ; $07
if_not_equal: macro
	db if_not_equal_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum iffalse_command ; $08
iffalse: macro
	db iffalse_command
	dw \1 ; pointer
	endm

	enum iftrue_command ; $09
iftrue: macro
	db iftrue_command
	dw \1 ; pointer
	endm

	enum if_greater_than_command ; $0a
if_greater_than: macro
	db if_greater_than_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum if_less_than_command ; $0b
if_less_than: macro
	db if_less_than_command
	db \1 ; byte
	dw \2 ; pointer
	endm

	enum jumpstd_command ; $0c
jumpstd: macro
	db jumpstd_command
	dw \1 ; predefined_script
	endm

	enum callstd_command ; $0d
callstd: macro
	db callstd_command
	dw \1 ; predefined_script
	endm

	enum callasm_command ; $0e
callasm: macro
	db callasm_command
	dba \1
	endm

	enum special_command ; $0f
special: macro
	db special_command
	dw (\1Special - SpecialsPointers) / 3
	endm

add_special: MACRO
\1Special::
	dba \1
ENDM

	enum ptcallasm_command ; $10
ptcallasm: macro
	db ptcallasm_command
	dw \1 ; asm
	endm

	enum checkmaptriggers_command ; $11
checkmaptriggers: macro
	db checkmaptriggers_command
	map \1 ; map
	endm

	enum domaptrigger_command ; $12
domaptrigger: macro
	db domaptrigger_command
	map \1 ; map
	db \2 ; trigger_id
	endm

	enum checktriggers_command ; $13
checktriggers: macro
	db checktriggers_command
	endm

	enum dotrigger_command ; $14
dotrigger: macro
	db dotrigger_command
	db \1 ; trigger_id
	endm

	enum writebyte_command ; $15
writebyte: macro
	db writebyte_command
	db \1 ; value
	endm

	enum addvar_command ; $16
addvar: macro
	db addvar_command
	db \1 ; value
	endm

	enum random_command ; $17
random: macro
	db random_command
	db \1 ; input
	endm

	enum checkver_command ; $18
checkver: macro
	db checkver_command
	endm

	enum copybytetovar_command ; $19
copybytetovar: macro
	db copybytetovar_command
	dw \1 ; address
	endm

	enum copyvartobyte_command ; $1a
copyvartobyte: macro
	db copyvartobyte_command
	dw \1 ; address
	endm

	enum loadvar_command ; $1b
loadvar: macro
	db loadvar_command
	dw \1 ; address
	db \2 ; value
	endm

	enum checkcode_command ; $1c
checkcode: macro
	db checkcode_command
	db \1 ; variable_id
	endm

	enum writevarcode_command ; $1d
writevarcode: macro
	db writevarcode_command
	db \1 ; variable_id
	endm

	enum writecode_command ; $1e
writecode: macro
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
	endm

	enum giveitem_command ; $1f
giveitem: macro
	db giveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum takeitem_command ; $20
takeitem: macro
	db takeitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum checkitem_command ; $21
checkitem: macro
	db checkitem_command
	db \1 ; item
	endm

	enum givemoney_command ; $22
givemoney: macro
	db givemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum takemoney_command ; $23
takemoney: macro
	db takemoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum checkmoney_command ; $24
checkmoney: macro
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
	endm

	enum givecoins_command ; $25
givecoins: macro
	db givecoins_command
	dw \1 ; coins
	endm

	enum takecoins_command ; $26
takecoins: macro
	db takecoins_command
	dw \1 ; coins
	endm

	enum checkcoins_command ; $27
checkcoins: macro
	db checkcoins_command
	dw \1 ; coins
	endm

	enum addcellnum_command ; $28
addcellnum: macro
	db addcellnum_command
	db \1 ; person
	endm

	enum delcellnum_command ; $29
delcellnum: macro
	db delcellnum_command
	db \1 ; person
	endm

	enum checkcellnum_command ; $2a
checkcellnum: macro
	db checkcellnum_command
	db \1 ; person
	endm

	enum checktime_command ; $2b
checktime: macro
	db checktime_command
	db \1 ; time
	endm

checkmorn EQUS "checktime MORN"
checkday  EQUS "checktime DAY"
checknite EQUS "checktime NITE"

	enum checkpoke_command ; $2c
checkpoke: macro
	db checkpoke_command
	db \1 ; pkmn
	endm

	enum givepoke_command ; $2d
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

	enum giveegg_command ; $2e
giveegg: macro
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
	endm

	enum givepokeitem_command ; $2f
givepokeitem: macro
	db givepokeitem_command
	dw \1 ; pointer
	endm

	enum checkpokeitem_command ; $30
checkpokeitem: macro
	db checkpokeitem_command
	dw \1 ; pointer
	endm

	enum checkevent_command ; $31
checkevent: macro
	db checkevent_command
	dw \1 ; event_flag
	endm

	enum clearevent_command ; $32
clearevent: macro
	db clearevent_command
	dw \1 ; event_flag
	endm

	enum setevent_command ; $33
setevent: macro
	db setevent_command
	dw \1 ; event_flag
	endm

	enum checkflag_command ; $34
checkflag: macro
	db checkflag_command
	dw \1 ; engine_flag
	endm

	enum clearflag_command ; $35
clearflag: macro
	db clearflag_command
	dw \1 ; engine_flag
	endm

	enum setflag_command ; $36
setflag: macro
	db setflag_command
	dw \1 ; engine_flag
	endm

	enum wildon_command ; $37
wildon: macro
	db wildon_command
	endm

	enum wildoff_command ; $38
wildoff: macro
	db wildoff_command
	endm

	enum xycompare_command ; $39
xycompare: macro
	db xycompare_command
	dw \1 ; pointer
	endm

	enum warpmod_command ; $3a
warpmod: macro
	db warpmod_command
	db \1 ; warp_id
	map \2 ; map
	endm

	enum blackoutmod_command ; $3b
blackoutmod: macro
	db blackoutmod_command
	map \1 ; map
	endm

	enum warp_command ; $3c
warp: macro
	db warp_command
	map \1 ; map
	db \2 ; x
	db \3 ; y
	endm

	enum readmoney_command ; $3d
readmoney: macro
	db readmoney_command
	db \1 ; account
	db \2 ; memory
	endm

	enum readcoins_command ; $3e
readcoins: macro
	db readcoins_command
	db \1 ; memory
	endm

	enum RAM2MEM_command ; $3f
RAM2MEM: macro
	db RAM2MEM_command
	db \1 ; memory
	endm

	enum pokenamemem_command ; $40
pokenamemem: macro
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
	endm

	enum itemtotext_command ; $41
itemtotext: macro
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
	endm

	enum mapnametotext_command ; $42
mapnametotext: macro
	db mapnametotext_command
	db \1 ; memory
	endm

	enum trainertotext_command ; $43
trainertotext: macro
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	endm

	enum stringtotext_command ; $44
stringtotext: macro
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
	endm

	enum itemnotify_command ; $45
itemnotify: macro
	db itemnotify_command
	endm

	enum pocketisfull_command ; $46
pocketisfull: macro
	db pocketisfull_command
	endm

	enum opentext_command ; $47
opentext: macro
	db opentext_command
	endm

	enum refreshscreen_command ; $48
refreshscreen: macro
	db refreshscreen_command
	db \1 ; dummy
	endm

	enum closetext_command ; $49
closetext: macro
	db closetext_command
	endm

	enum loadbytec2cf_command ; $4a
loadbytec2cf: macro
	db loadbytec2cf_command
	db \1 ; byte
	endm

	enum farwritetext_command ; $4b
farwritetext: macro
	db farwritetext_command
	dba \1
	endm

	enum writetext_command ; $4c
writetext: macro
	db writetext_command
	dw \1 ; text_pointer
	endm

	enum repeattext_command ; $4d
repeattext: macro
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
	endm

	enum yesorno_command ; $4e
yesorno: macro
	db yesorno_command
	endm

	enum loadmenudata_command ; $4f
loadmenudata: macro
	db loadmenudata_command
	dw \1 ; data
	endm

	enum closewindow_command ; $50
closewindow: macro
	db closewindow_command
	endm

	enum jumptextfaceplayer_command ; $51
jumptextfaceplayer: macro
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
	endm

; IF _CRYSTAL
	enum farjumptext_command ; $52
farjumptext: macro
	db farjumptext_command
	dba \1
	endm
; ENDC

	enum jumptext_command ; $53
jumptext: macro
	db jumptext_command
	dw \1 ; text_pointer
	endm

	enum waitbutton_command ; $54
waitbutton: macro
	db waitbutton_command
	endm

	enum buttonsound_command ; $55
buttonsound: macro
	db buttonsound_command
	endm

	enum pokepic_command ; $56
pokepic: macro
	db pokepic_command
	db \1 ; pokemon
	endm

	enum closepokepic_command ; $57
closepokepic: macro
	db closepokepic_command
	endm

	enum _2dmenu_command ; $58
_2dmenu: macro
	db _2dmenu_command
	endm

	enum verticalmenu_command ; $59
verticalmenu: macro
	db verticalmenu_command
	endm

	enum loadpikachudata_command ; $5a
loadpikachudata: macro
	db loadpikachudata_command
	endm

	enum randomwildmon_command ; $5b
randomwildmon: macro
	db randomwildmon_command
	endm

	enum loadmemtrainer_command ; $5c
loadmemtrainer: macro
	db loadmemtrainer_command
	endm

	enum loadwildmon_command ; $5d
loadwildmon: macro
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
	endm

	enum loadtrainer_command ; $5e
loadtrainer: macro
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
	endm

	enum startbattle_command ; $5f
startbattle: macro
	db startbattle_command
	endm

	enum reloadmapafterbattle_command ; $60
reloadmapafterbattle: macro
	db reloadmapafterbattle_command
	endm

	enum catchtutorial_command ; $61
catchtutorial: macro
	db catchtutorial_command
	db \1 ; byte
	endm

	enum trainertext_command ; $62
trainertext: macro
	db trainertext_command
	db \1 ; which_text
	endm

	enum trainerflagaction_command ; $63
trainerflagaction: macro
	db trainerflagaction_command
	db \1 ; action
	endm

	enum winlosstext_command ; $64
winlosstext: macro
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	endm

	enum scripttalkafter_command ; $65
scripttalkafter: macro
	db scripttalkafter_command
	endm

	enum end_if_just_battled_command ; $66
end_if_just_battled: macro
	db end_if_just_battled_command
	endm

	enum check_just_battled_command ; $67
check_just_battled: macro
	db check_just_battled_command
	endm

	enum setlasttalked_command ; $68
setlasttalked: macro
	db setlasttalked_command
	db \1 ; person
	endm

	enum applymovement_command ; $69
applymovement: macro
	db applymovement_command
	db \1 ; person
	dw \2 ; data
	endm

	enum applymovement2_command ; $6a
applymovement2: macro
	db applymovement2_command
	dw \1 ; data
	endm

	enum faceplayer_command ; $6b
faceplayer: macro
	db faceplayer_command
	endm

	enum faceperson_command ; $6c
faceperson: macro
	db faceperson_command
	db \1 ; person1
	db \2 ; person2
	endm

	enum variablesprite_command ; $6d
variablesprite: macro
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
	endm

	enum disappear_command ; $6e
disappear: macro
	db disappear_command
	db \1 ; person
	endm

	enum appear_command ; $6f
appear: macro
	db appear_command
	db \1 ; person
	endm

	enum follow_command ; $70
follow: macro
	db follow_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum stopfollow_command ; $71
stopfollow: macro
	db stopfollow_command
	endm

	enum moveperson_command ; $72
moveperson: macro
	db moveperson_command
	db \1 ; person
	db \2 ; x
	db \3 ; y
	endm

	enum writepersonxy_command ; $73
writepersonxy: macro
	db writepersonxy_command
	db \1 ; person
	endm

	enum loademote_command ; $74
loademote: macro
	db loademote_command
	db \1 ; bubble
	endm

	enum showemote_command ; $75
showemote: macro
	db showemote_command
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
	endm

	enum spriteface_command ; $76
spriteface: macro
	db spriteface_command
	db \1 ; person
	db \2 ; facing
	endm

	enum follownotexact_command ; $77
follownotexact: macro
	db follownotexact_command
	db \1 ; person2
	db \2 ; person1
	endm

	enum earthquake_command ; $78
earthquake: macro
	db earthquake_command
	db \1 ; param
	endm

	enum changemap_command ; $79
changemap: macro
	db changemap_command
	db \1 ; map_bank
	dw \2 ; map_data_pointer
	endm

	enum changeblock_command ; $7a
changeblock: macro
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
	endm

	enum reloadmap_command ; $7b
reloadmap: macro
	db reloadmap_command
	endm

	enum reloadmappart_command ; $7c
reloadmappart: macro
	db reloadmappart_command
	endm

	enum writecmdqueue_command ; $7d
writecmdqueue: macro
	db writecmdqueue_command
	dw \1 ; queue_pointer
	endm

	enum delcmdqueue_command ; $7e
delcmdqueue: macro
	db delcmdqueue_command
	db \1 ; byte
	endm

	enum playmusic_command ; $7f
playmusic: macro
	db playmusic_command
	dw \1 ; music_pointer
	endm

	enum encountermusic_command ; $80
encountermusic: macro
	db encountermusic_command
	endm

	enum musicfadeout_command ; $81
musicfadeout: macro
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
	endm

	enum playmapmusic_command ; $82
playmapmusic: macro
	db playmapmusic_command
	endm

	enum dontrestartmapmusic_command ; $83
dontrestartmapmusic: macro
	db dontrestartmapmusic_command
	endm

	enum cry_command ; $84
cry: macro
	db cry_command
	dw \1 ; cry_id
	endm

	enum playsound_command ; $85
playsound: macro
	db playsound_command
	dw \1 ; sound_pointer
	endm

	enum waitsfx_command ; $86
waitsfx: macro
	db waitsfx_command
	endm

	enum warpsound_command ; $87
warpsound: macro
	db warpsound_command
	endm

	enum specialsound_command ; $88
specialsound: macro
	db specialsound_command
	endm

	enum passtoengine_command ; $89
passtoengine: macro
	db passtoengine_command
	db \1 ; data_pointer
	endm

	enum newloadmap_command ; $8a
newloadmap: macro
	db newloadmap_command
	db \1 ; which_method
	endm

	enum pause_command ; $8b
pause: macro
	db pause_command
	db \1 ; length
	endm

	enum deactivatefacing_command ; $8c
deactivatefacing: macro
	db deactivatefacing_command
	db \1 ; time
	endm

	enum priorityjump_command ; $8d
priorityjump: macro
	db priorityjump_command
	dw \1 ; pointer
	endm

	enum warpcheck_command ; $8e
warpcheck: macro
	db warpcheck_command
	endm

	enum ptpriorityjump_command ; $8f
ptpriorityjump: macro
	db ptpriorityjump_command
	dw \1 ; pointer
	endm

	enum return_command ; $90
return: macro
	db return_command
	endm

	enum end_command ; $91
end: macro
	db end_command
	endm

	enum reloadandreturn_command ; $92
reloadandreturn: macro
	db reloadandreturn_command
	db \1 ; which_method
	endm

	enum end_all_command ; $93
end_all: macro
	db end_all_command
	endm

	enum pokemart_command ; $94
pokemart: macro
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
	endm

	enum elevator_command ; $95
elevator: macro
	db elevator_command
	dw \1 ; floor_list_pointer
	endm

	enum trade_command ; $96
trade: macro
	db trade_command
	db \1 ; trade_id
	endm

	enum askforphonenumber_command ; $97
askforphonenumber: macro
	db askforphonenumber_command
	db \1 ; number
	endm

	enum phonecall_command ; $98
phonecall: macro
	db phonecall_command
	dw \1 ; caller_name
	endm

	enum hangup_command ; $99
hangup: macro
	db hangup_command
	endm

	enum describedecoration_command ; $9a
describedecoration: macro
	db describedecoration_command
	db \1 ; byte
	endm

	enum fruittree_command ; $9b
fruittree: macro
	db fruittree_command
	db \1 ; tree_id
	endm

	enum specialphonecall_command ; $9c
specialphonecall: macro
	db specialphonecall_command
	dw \1 ; call_id
	endm

	enum checkphonecall_command ; $9d
checkphonecall: macro
	db checkphonecall_command
	endm

	enum verbosegiveitem_command ; $9e
verbosegiveitem: macro
	db verbosegiveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	endm

	enum verbosegiveitem2_command ; $9f
verbosegiveitem2: macro
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
	endm

	enum swarm_command ; $a0
swarm: macro
	db swarm_command
	db \1 ; flag
	map \2 ; map
	endm

	enum halloffame_command ; $a1
halloffame: macro
	db halloffame_command
	endm

	enum credits_command ; $a2
credits: macro
	db credits_command
	endm

	enum warpfacing_command ; $a3
warpfacing: macro
	db warpfacing_command
	db \1 ; facing
	map \2 ; map
	db \3 ; x
	db \4 ; y
	endm

	enum battletowertext_command ; $a4
battletowertext: macro
	db battletowertext_command
	db \1 ; memory
	endm

	enum landmarktotext_command ; $a5
landmarktotext: macro
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
	endm

	enum trainerclassname_command ; $a6
trainerclassname: macro
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
	endm

	enum name_command ; $a7
name: macro
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
	endm

	enum wait_command ; $a8
wait: macro
	db wait_command
	db \1 ; duration
	endm

	enum check_save_command ; $a9
check_save: macro
	db check_save_command
	endm
